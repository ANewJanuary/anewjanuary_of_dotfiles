return {
  "gisketch/triforce.nvim",
  dependencies = {
    "nvzone/volt",
  },
  config = function()
    require("triforce").setup({
      -- enabled = true, -- Enable/disable the entire plugin
      -- gamification_enabled = true, -- Enable XP, levels, achievements
      --
      -- notifications = {
      --   enabled = true, -- Master toggle for all notifications
      --   level_up = true, -- Show level up notifications
      --   achievements = true, -- Show achievement unlock notifications
      -- },
      --
      -- auto_save_interval = 300, -- Save stats every 5 minutes
      --
      -- custom_languages = {
      --   gleam = { icon = "✨", name = "Gleam" },
      --   odin = { icon = "🔷", name = "Odin" },
      -- },

      -- Customize level progression (optional)
      level_progression = {
        tier_1 = { min_level = 1, max_level = 50, xp_per_level = 300 }, -- Levels 1-10
        tier_2 = { min_level = 51, max_level = 100, xp_per_level = 500 }, -- Levels 11-20
        tier_3 = { min_level = 101, max_level = math.huge, xp_per_level = 1000 }, -- Levels 21+
      },

      -- Customize XP rewards (optional)
      xp_rewards = {
        char = 0, -- XP per character typed
        line = 1, -- XP per new line
        save = 0, -- XP per file save
      },
      keymap = {
        show_profile = "<leader>tt", -- Open profile with <leader>tp
      },
      db_path = "/home/artin/Vshrd/config/triforce_stats.json",
    })
  end,
}
