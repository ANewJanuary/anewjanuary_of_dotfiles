return {
  'nvim-orgmode/orgmode',
  event = 'VeryLazy',
  ft = { '*.org' },
  config = function()
    -- Setup orgmode
    require('orgmode').setup({
      org_agenda_files = '~/Vshrd/LP/**/*',
      org_default_notes_file = '~/Vshrd/LP/inbox.org',
      org_startup_indented = true,
      org_todo_keywords = {'TODO(t)', 'NEXT(n)', '|', 'DONE(d)'},
      win_split_mode = 'float',
      org_startup_folded = 'showeverything',
      org_archive_location = '~/Vshrd/LP/archive.org',
      org_hide_leading_stars = true,
      org_hide_emphasis_markers = true,
      org_log_done = false,
      org_log_repeat = false,
      calendar_week_start_day = 1,
      org_deadline_warning_days = 7,
      org_agenda_span = 'week',
      org_agenda_show_future_repeats = 'next',
      org_agenda_skip_scheduled_if_done = true,
      org_agenda_skip_deadline_if_done = true,
      ui = {
        agenda = {
          preview_window = {
            wrap = false, -- This option is set by default
            border = 'double'
          }
        }
      },
      mappings = {
        global = {
          vim.api.nvim_create_autocmd('FileType', {
            pattern = 'org',
            callback = function()
              vim.keymap.set('i', '<S-CR>', '<cmd>lua require("orgmode").action("org_mappings.meta_return")<CR>', {
                silent = true,
                buffer = true,
              })
            end,
          }),
          org_agenda = '<A-a>',
        }, 
        agenda = {
          org_agenda_later = { 'f', desc = 'Go to next agenda span' },
          org_agenda_earlier = { 'b', desc = 'Go to previous agenda span' },
          org_agenda_goto_date = { 'J', desc = 'Jump to calendar date' }, 
          org_agenda_todo = { 't', desc = 'Change the TODO state' }, 
          org_agenda_preview = { 'K', desc = 'Preview the Agenda item' }, 
        },
        org = {
          org_agenda_set_tags = { '<leader>ot', desc = 'Org Tag Headline' }, 
          org_agenda_deadline= { '<leader>oid', desc = 'Org deadline' }, 
          org_agenda_deadline= { '<leader>ois', desc = 'Org Schedule' }, 
          org_todo = { 'cit', desc = 'Org Change TODO state' }, 
          org_toggle_checkbox = { '<C-Space>', desc = 'Org Change TODO state' }, 
          org_toggle_heading = { '<leader>oh', desc = 'Org make heading' }, 
        },
      }, 
    })


      -- Experimental LSP support
    vim.lsp.enable('org')
  end,
}
