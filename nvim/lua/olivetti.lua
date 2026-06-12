-- olivetti.lua
-- A Neovim plugin that mimics Emacs' Olivetti mode:
-- centers the buffer content with soft margins for distraction-free writing.
--
-- Usage:
--   require("olivetti").setup({ width = 80 })  -- optional config
--   :Olivetti          -- toggle for current window
--   :OlivettiEnable    -- enable for current window
--   :OlivettiDisable   -- disable for current window

local M = {}

--- Default configuration
M.config = {
  width = 80,            -- target body width in columns (or 0.0–1.0 as a fraction)
  shade_gutters = false, -- darken the padding columns via Normal-linked hl group
  scrolloff = 0.25,      -- cursor position from top as a fraction of window height
                         -- (e.g. 0.25 = top quarter, 0.5 = centre like scrolloff=999)
}

-- Track state per window: { left_win, right_win, orig_options }
local state = {}

--- Resolve scrolloff to a line count from window height.
---@param win integer
---@return integer
local function resolve_scrolloff(win)
  local s = M.config.scrolloff
  if type(s) == "number" and s > 0 and s < 1 then
    return math.floor(vim.api.nvim_win_get_height(win) * s)
  end
  return math.floor(s)
end

--- Resolve the body width to an integer column count.
---@param win integer
---@return integer
local function resolve_width(win)
  local w = M.config.width
  if type(w) == "number" and w > 0 and w < 1 then
    -- Fractional: proportion of the window width
    return math.floor(vim.api.nvim_win_get_width(win) * w)
  end
  return math.floor(w)
end

--- Compute left padding needed to centre `body_width` in `win_width`.
---@param win_width integer
---@param body_width integer
---@return integer
local function padding(win_width, body_width)
  local p = math.floor((win_width - body_width) / 2)
  return math.max(p, 0)
end

--- Create or configure the highlight group used for gutter shading.
local function setup_hl()
  -- Blend from Normal background toward a slightly dimmer shade.
  -- If the colorscheme sets a background colour we respect it; otherwise
  -- we just link to Normal so there is no visible change.
  local ok, hl = pcall(vim.api.nvim_get_hl, 0, { name = "Normal", link = false })
  if ok and hl.bg then
    -- Darken the background by ~8 % for a subtle gutter effect.
    local bg = hl.bg
    local r = math.floor(bit.rshift(bit.band(bg, 0xFF0000), 16) * 0.92)
    local g = math.floor(bit.rshift(bit.band(bg, 0x00FF00), 8)  * 0.92)
    local b = math.floor(bit.band(bg, 0x0000FF)                  * 0.92)
    local new_bg = bit.bor(bit.lshift(r, 16), bit.lshift(g, 8), b)
    vim.api.nvim_set_hl(0, "OlivettiGutter", { bg = new_bg, default = false })
  else
    vim.api.nvim_set_hl(0, "OlivettiGutter", { link = "Normal", default = false })
  end
end

--- Enable Olivetti for the given window.
---@param win integer
function M.enable(win)
  win = win or vim.api.nvim_get_current_win()

  if state[win] then
    return -- already active
  end

  local body_width = resolve_width(win)
  local win_width  = vim.api.nvim_win_get_width(win)
  local pad        = padding(win_width, body_width)

  if pad <= 0 then
    vim.notify("olivetti: window not wide enough to add margins", vim.log.levels.WARN)
    return
  end

  -- Save original window options we will change.
  local orig = {
    number         = vim.wo[win].number,
    relativenumber = vim.wo[win].relativenumber,
    signcolumn     = vim.wo[win].signcolumn,
    foldcolumn     = vim.wo[win].foldcolumn,
    colorcolumn    = vim.wo[win].colorcolumn,
    textwidth      = vim.bo[vim.api.nvim_win_get_buf(win)].textwidth,
    wrap           = vim.wo[win].wrap,
    linebreak      = vim.wo[win].linebreak,
    scrolloff      = vim.wo[win].scrolloff,
  }

  -- Apply focused-writing options to the content window.
  vim.wo[win].number         = false
  vim.wo[win].relativenumber = false
  vim.wo[win].signcolumn     = "no"
  vim.wo[win].foldcolumn     = "0"
  vim.wo[win].colorcolumn    = ""
  vim.wo[win].wrap           = true
  vim.wo[win].linebreak      = true
  -- Keep cursor at a fixed fraction from the top (like scrolloff=999 but not centred).
  vim.wo[win].scrolloff      = resolve_scrolloff(win)

  -- ------------------------------------------------------------------ --
  -- Fake left/right padding via two empty scratch windows               --
  -- ------------------------------------------------------------------ --
  setup_hl()

  local buf_l = vim.api.nvim_create_buf(false, true)
  local buf_r = vim.api.nvim_create_buf(false, true)

  -- Open a vertical split to the LEFT of the content window.
  vim.api.nvim_set_current_win(win)
  vim.cmd("vertical leftabove vsplit")
  local win_l = vim.api.nvim_get_current_win()
  vim.api.nvim_win_set_buf(win_l, buf_l)
  vim.api.nvim_win_set_width(win_l, pad)

  -- Open a vertical split to the RIGHT of the content window.
  vim.api.nvim_set_current_win(win)
  vim.cmd("vertical rightbelow vsplit")
  local win_r = vim.api.nvim_get_current_win()
  vim.api.nvim_win_set_buf(win_r, buf_r)
  vim.api.nvim_win_set_width(win_r, pad)

  -- Style the gutter windows.
  for _, gw in ipairs({ win_l, win_r }) do
    vim.wo[gw].number         = false
    vim.wo[gw].relativenumber = false
    vim.wo[gw].signcolumn     = "no"
    vim.wo[gw].foldcolumn     = "0"
    vim.wo[gw].colorcolumn    = ""
    vim.wo[gw].cursorline     = false
    vim.wo[gw].cursorcolumn   = false
    vim.wo[gw].winfixwidth    = true
    if M.config.shade_gutters then
      vim.wo[gw].winhl = "Normal:OlivettiGutter,EndOfBuffer:OlivettiGutter"
    end
  end

  -- Return focus to the content window.
  vim.api.nvim_set_current_win(win)

  state[win] = {
    left_win  = win_l,
    right_win = win_r,
    orig      = orig,
  }

  -- Auto-resize when the overall terminal is resized.
  local aug = vim.api.nvim_create_augroup("Olivetti_" .. win, { clear = true })
  vim.api.nvim_create_autocmd("VimResized", {
    group = aug,
    callback = function()
      M._resize(win)
    end,
  })
  -- Clean up if the content window is closed.
  vim.api.nvim_create_autocmd("WinClosed", {
    group = aug,
    pattern = tostring(win),
    callback = function()
      M._cleanup(win, false)
    end,
  })
end

--- Resize gutter windows after a terminal resize event.
---@param win integer
function M._resize(win)
  local s = state[win]
  if not s then return end

  local body_width = resolve_width(win)
  local win_width  = vim.api.nvim_win_get_width(win)
  local pad        = padding(win_width, body_width)

  -- Re-add gutter width back to get total available width.
  local total = win_width
  pcall(function()
    total = vim.api.nvim_win_get_width(s.left_win)
          + win_width
          + vim.api.nvim_win_get_width(s.right_win)
  end)
  pad = padding(total, body_width)

  pcall(vim.api.nvim_win_set_width, s.left_win,  pad)
  pcall(vim.api.nvim_win_set_width, s.right_win, pad)

  -- Recompute scrolloff since window height may have changed too.
  pcall(function() vim.wo[win].scrolloff = resolve_scrolloff(win) end)
end

--- Disable Olivetti for the given window, optionally closing gutter splits.
---@param win integer
---@param restore boolean  whether to restore original options (default true)
function M._cleanup(win, restore)
  local s = state[win]
  if not s then return end

  if restore ~= false then
    -- Restore original options.
    local orig = s.orig
    pcall(function()
      vim.wo[win].number         = orig.number
      vim.wo[win].relativenumber = orig.relativenumber
      vim.wo[win].signcolumn     = orig.signcolumn
      vim.wo[win].foldcolumn     = orig.foldcolumn
      vim.wo[win].colorcolumn    = orig.colorcolumn
      vim.bo[vim.api.nvim_win_get_buf(win)].textwidth = orig.textwidth
      vim.wo[win].wrap           = orig.wrap
      vim.wo[win].linebreak      = orig.linebreak
      vim.wo[win].scrolloff      = orig.scrolloff
    end)

    -- Close gutter windows if they still exist.
    for _, gw in ipairs({ s.left_win, s.right_win }) do
      if vim.api.nvim_win_is_valid(gw) then
        pcall(vim.api.nvim_win_close, gw, true)
      end
    end
  end

  -- Remove autocommands.
  pcall(vim.api.nvim_del_augroup_by_name, "Olivetti_" .. win)

  state[win] = nil
end

--- Disable Olivetti for the given window.
---@param win integer
function M.disable(win)
  win = win or vim.api.nvim_get_current_win()
  M._cleanup(win, true)
end

--- Toggle Olivetti for the given window.
---@param win integer
function M.toggle(win)
  win = win or vim.api.nvim_get_current_win()
  if state[win] then
    M.disable(win)
  else
    M.enable(win)
  end
end

--- Return true if Olivetti is active for the given window.
---@param win integer
---@return boolean
function M.is_enabled(win)
  win = win or vim.api.nvim_get_current_win()
  return state[win] ~= nil
end

--- Plugin setup – call once, usually from init.lua.
---@param opts table|nil
function M.setup(opts)
  opts = opts or {}
  M.config = vim.tbl_deep_extend("force", M.config, opts)

  -- User commands
  vim.api.nvim_create_user_command("Olivetti",        function() M.toggle()  end, {})
  vim.api.nvim_create_user_command("OlivettiEnable",  function() M.enable()  end, {})
  vim.api.nvim_create_user_command("OlivettiDisable", function() M.disable() end, {})

  -- Optional default keybinding: <leader>o
  -- Uncomment the line below if you want it registered automatically:
  vim.keymap.set("n", "<leader>to", M.toggle, { desc = "Toggle Olivetti" })
end

return M
