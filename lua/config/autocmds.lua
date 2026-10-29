-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

vim.api.nvim_create_autocmd({ "InsertLeave", "BufLeave", "FocusLost" }, {
  group = vim.api.nvim_create_augroup("auto_save", { clear = true }),
  nested = true,
  callback = function(event)
    local buf = event.buf
    if not vim.api.nvim_buf_is_valid(buf) then
      return
    end
    local options = vim.bo[buf]
    if options.buftype ~= "" or not options.modified or not options.modifiable or options.readonly then
      return
    end
    if vim.api.nvim_buf_get_name(buf) == "" then
      return
    end
    vim.api.nvim_buf_call(buf, function()
      vim.cmd("silent update")
    end)
  end,
})

local function disable_autoformat(buf)
  vim.b[buf].autoformat = false
end

vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("no_autoformat", { clear = true }),
  pattern = { "yaml", "toml" },
  callback = function(event)
    disable_autoformat(event.buf)
  end,
})

-- autocmds.lua is loaded on VeryLazy: the FileType event may already have fired for buffers opened at startup
for _, buf in ipairs(vim.api.nvim_list_bufs()) do
  if vim.tbl_contains({ "yaml", "toml" }, vim.bo[buf].filetype) then
    disable_autoformat(buf)
  end
end
