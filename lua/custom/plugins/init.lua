-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    keys = {
      {
        '<leader>op',
        function()
          require('neo-tree.command').execute { toggle = true, source = 'filesystem', position = 'left', update_focused_file = true }
        end,
        desc = '[O]pen [P]roject Browser',
      },
      {
        '<leader>og',
        function()
          require('neo-tree.command').execute { toggle = true, source = 'git_status', position = 'left' }
        end,
        desc = '[O]pen [G]it Browser',
      },
      {
        '<leader>os',
        function()
          require('neo-tree.command').execute { toggle = true, source = 'document_symbols', position = 'right' }
        end,
        desc = '[O]pen [S]ymbol Browser',
      },
    },
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
    },
    config = function()
      require('neo-tree').setup {
        update_focused_file = {
          enable = true,
        },
        filesystem = {
          filtered_items = {
            visible = true,
            hide_dotfiles = false,
            hide_gitignored = false,
          },
        },
        event_handlers = {
          {
            event = 'file_opened',
            handler = function(file_path)
              require('neo-tree.command').execute { action = 'close' }
            end,
          },
        },
        window = {
          mappings = {
            ['<space>'] = nil,
            ['<Tab>'] = { 'toggle_node', nowait = false },
          },
        },
        sources = {
          'filesystem',
          'git_status',
          'document_symbols',
        },
      }
    end,
  },
  { 'Exafunction/codeium.vim' },
  {
    'akinsho/toggleterm.nvim',
    keys = {
      {
        '<leader>ot',
        function()
          require('toggleterm').toggle(1)
        end,
        desc = 'Toggle [T]erminal',
      },
      {
        '<M-1>',
        function()
          require('toggleterm').toggle(1)
        end,
        desc = 'Toggle first terminal',
      },
      {
        '<M-2>',
        function()
          require('toggleterm').toggle(2)
        end,
        desc = 'Toggle second terminal',
      },
      {
        '<M-3>',
        function()
          require('toggleterm').toggle(3)
        end,
        desc = 'Toggle third terminal',
      },
    },
  },
  {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      require('dashboard').setup {}
    end,
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  },
  { 'tamton-aquib/staline.nvim' },
  {
    'folke/zen-mode.nvim',
    keys = {
      {
        '<leader>tz',
        function()
          require('zen-mode').toggle()
        end,
        desc = '[T]oggle [Z]en',
      },
    },
  },
  {
    'NeogitOrg/neogit',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'sindrets/diffview.nvim',
      'nvim-telescope/telescope.nvim',
    },
    config = true,
    keys = {
      {
        '<leader>gg',
        function()
          require('neogit').open()
        end,
        desc = '[G]it [G]ud',
      },
    },
  },
}
