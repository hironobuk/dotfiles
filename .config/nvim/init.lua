-- Plugin settings that are read while plugins are loading.
vim.g.switch_mapping = "-"

vim.g.airline_powerline_fonts = 1
vim.g["airline#extensions#tabline#enabled"] = 1
vim.g["airline#extensions#taboo#enabled"] = 1
vim.g["airline#extensions#branch#enabled"] = 0
vim.g.airline_theme = "molokai"

vim.g.taboo_tab_format = " t%N %f%m "
vim.g.taboo_tabline = 0

vim.g.molokai_original = 1

-- Plugins
vim.pack.add({
  "https://github.com/tomasr/molokai",
  "https://github.com/cohama/lexima.vim",
  "https://github.com/AndrewRadev/switch.vim",
  "https://github.com/tpope/vim-fugitive",
  "https://github.com/vim-airline/vim-airline",
  "https://github.com/vim-airline/vim-airline-themes",
  "https://github.com/gcmt/taboo.vim",
  "https://github.com/kchmck/vim-coffee-script",
  "https://github.com/elixir-editors/vim-elixir",
})

-- Options
vim.opt.number = true
vim.opt.showmatch = true
vim.opt.matchpairs:append("<:>")
vim.opt.cursorline = true
vim.opt.smartcase = true
vim.opt.inccommand = "split"
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.mouse = ""
vim.opt.termguicolors = true
vim.opt.synmaxcol = 500
vim.opt.redrawtime = 10000

-- Use Neovim's built-in insert completion instead of deoplete.
vim.opt.autocomplete = true
vim.opt.completeopt = { "menu", "popup", "noselect" }

local function has_text_before_cursor()
  local col = vim.fn.col(".") - 1
  return col > 0 and vim.fn.getline("."):sub(col, col):match("%s") == nil
end

vim.keymap.set("i", "<Tab>", function()
  if vim.fn.pumvisible() == 1 then
    return "<C-n>"
  end
  return has_text_before_cursor() and "<C-n>" or "<Tab>"
end, { expr = true, silent = true })

vim.keymap.set("i", "<S-Tab>", function()
  return vim.fn.pumvisible() == 1 and "<C-p>" or "<C-h>"
end, { expr = true })

vim.keymap.set("i", "<CR>", function()
  return vim.fn.pumvisible() == 1 and "<C-e><CR>" or "<CR>"
end, { expr = true, silent = true })

-- Keymaps
vim.keymap.set("n", "X", "diw", { desc = "Delete word" })

-- Filetypes and indentation
vim.filetype.add({
  extension = {
    ect = "html",
  },
})

local indent_group = vim.api.nvim_create_augroup("FiletypeIndent", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  group = indent_group,
  pattern = { "php", "python", "groovy" },
  callback = function()
    vim.opt_local.expandtab = true
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = indent_group,
  pattern = { "yaml", "sh", "html", "javascript", "css" },
  callback = function()
    vim.opt_local.expandtab = true
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
  end,
})

-- Restore the cursor position when reopening a file.
vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function(args)
    local mark = vim.api.nvim_buf_get_mark(args.buf, '"')
    local line_count = vim.api.nvim_buf_line_count(args.buf)
    if mark[1] > 1 and mark[1] <= line_count then
      vim.api.nvim_win_set_cursor(0, mark)
    end
  end,
})

vim.cmd.colorscheme("molokai")

vim.api.nvim_set_hl(0, "DiffText", { bold = true })
for _, group in ipairs({ "Macro", "SpecialKey", "Special", "StorageClass", "Tag" }) do
  vim.api.nvim_set_hl(0, group, {})
end
vim.api.nvim_set_hl(0, "CursorLine", { underline = true })
