return {
  {
    "rafi/awesome-vim-colorschemes",
    lazy = false,
    priority = 1100,
  },
  {
    "olimorris/onedarkpro.nvim",
    priority = 1000,
    opts = {},
  },
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        sources = {
          explorer = {
            hidden = true,
            ignored = true,
            on_show = function(picker)
              local ns = vim.api.nvim_create_namespace("explorer_transparency")
              for _, name in ipairs({
                "Normal", "NormalNC", "NormalFloat", "SignColumn", "EndOfBuffer", "FloatBorder",
                "SnacksNormal", "SnacksNormalNC", "SnacksPicker", "SnacksPickerBorder",
                "SnacksPickerList", "SnacksPickerListBorder", "SnacksPickerInput", "SnacksPickerInputBorder",
                "SnacksPickerBox", "SnacksPickerBoxBorder",
              }) do
                local hl = vim.api.nvim_get_hl(0, { name = name, link = false })
                hl.bg = nil
                hl.ctermbg = nil
                vim.api.nvim_set_hl(ns, name, hl)
              end
              local wins = { picker.list.win, picker.input.win }
              vim.list_extend(wins, picker.layout.box_wins)
              for _, win in ipairs(wins) do
                vim.api.nvim_win_set_hl_ns(win.win, ns)
              end
            end,
          },
        },
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = function()
        require("onedarkpro").load({ theme = "onedark" })
      end,
    },
  },
}
