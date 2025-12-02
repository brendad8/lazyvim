-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local nmap = function(key, effect, desc)
  vim.keymap.set("n", key, effect, { silent = true, noremap = true, desc = desc })
end

local vmap = function(key, effect, desc)
  vim.keymap.set("v", key, effect, { silent = true, noremap = true, desc = desc })
end

nmap("<Tab>", ">>")
nmap("<S-Tab>", "<<")

vmap("<Tab>", ">gv")
vmap("<S-Tab>", "<gv")

-- buffers
nmap("<S-h>", "<cmd>bprevious<cr>", "Prev Buffer")
nmap("<S-l>", "<cmd>bnext<cr>", "Next Buffer")
nmap("[b", "<cmd>bprevious<cr>", "Prev Buffer")
nmap("]b", "<cmd>bnext<cr>", "Next Buffer")
nmap("<leader>bb", "<cmd>e #<cr>", "Switch to Other Buffer")
nmap("<leader>`", "<cmd>e #<cr>", "Switch to Other Buffer")
nmap("<leader>bd", function()
  Snacks.bufdelete()
end, "Delete Buffer")
nmap("<leader>bo", function()
  Snacks.bufdelete.other()
end, "Delete Other Buffers")
nmap("<leader>bD", "<cmd>:bd<cr>", "Delete Buffer and Window")

nmap("<C-s>", "<cmd>w<cr><esc>", "Save File")
nmap("<leader>K", "<cmd>norm! K<cr>", "Keywordprg")

-- lazy
nmap("<leader>l", "<cmd>Lazy<cr>", "Lazy")

-- new file
nmap("<leader>fn", "<cmd>enew<cr>", "New File")

-- formatting
nmap("<leader>cf", function()
  LazyVim.format({ force = true })
end, "Format")

-- toggle options
LazyVim.format.snacks_toggle():map("<leader>uf")
LazyVim.format.snacks_toggle(true):map("<leader>uF")
Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
Snacks.toggle.diagnostics():map("<leader>ud")
Snacks.toggle.line_number():map("<leader>ul")
Snacks.toggle
  .option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2, name = "Conceal Level" })
  :map("<leader>uc")
Snacks.toggle
  .option("showtabline", { off = 0, on = vim.o.showtabline > 0 and vim.o.showtabline or 2, name = "Tabline" })
  :map("<leader>uA")
Snacks.toggle.treesitter():map("<leader>uT")
Snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map("<leader>ub")
Snacks.toggle.dim():map("<leader>uD")
Snacks.toggle.animate():map("<leader>ua")
Snacks.toggle.indent():map("<leader>ug")
Snacks.toggle.scroll():map("<leader>uS")
Snacks.toggle.profiler():map("<leader>dpp")
Snacks.toggle.profiler_highlights():map("<leader>dph")

if vim.lsp.inlay_hint then
  Snacks.toggle.inlay_hints():map("<leader>uh")
end

-- lazygit
if vim.fn.executable("lazygit") == 1 then
  nmap("<leader>gg", function()
    Snacks.lazygit({ cwd = LazyVim.root.git() })
  end, "Lazygit (Root Dir)")
  nmap("<leader>gG", function()
    Snacks.lazygit()
  end, "Lazygit (cwd)")
end

-- quit
nmap("<leader>qq", "<cmd>qa<cr>", "Quit All")

-- windows
nmap("<leader>-", "<C-W>s", "Split Window Below")
nmap("<leader>|", "<C-W>v", "Split Window Right")
nmap("<leader>wd", "<C-W>c", "Delete Window")
Snacks.toggle.zoom():map("<leader>wm"):map("<leader>uZ")
Snacks.toggle.zen():map("<leader>uz")

-- tabs
nmap("<leader><tab>l", "<cmd>tablast<cr>", "Last Tab")
nmap("<leader><tab>o", "<cmd>tabonly<cr>", "Close Other Tabs")
nmap("<leader><tab>f", "<cmd>tabfirst<cr>", "First Tab")
nmap("<leader><tab><tab>", "<cmd>tabnew<cr>", "New Tab")
nmap("<leader><tab>]", "<cmd>tabnext<cr>", "Next Tab")
nmap("<leader><tab>d", "<cmd>tabclose<cr>", "Close Tab")
nmap("<leader><tab>[", "<cmd>tabprevious<cr>", "Previous Tab")
