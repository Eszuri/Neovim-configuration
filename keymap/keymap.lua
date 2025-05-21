local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Cut
map({ "n", "v" }, "<C-x>", '"+d', opts)

-- Copy
map({ "n", "v" }, "<C-c>", '"+y', opts)

-- Paste
map("n", "<C-v>", '"+p', opts)
map("v", "<C-v>", '<Esc>"+p', opts)
map("i", "<C-v>", '<Esc>"+p', opts)

-- Visual block mode
map("v", "<A-v>", "<Esc><C-v>", opts)

-- Save
map("n", "<C-s>", ":w<CR>", opts)
map("i", "<C-s>", "<Esc>:w<CR>a", opts)
map("v", "<C-s>", "<Esc>:w<CR>", opts)

-- Neotree toggle
map({ "n", "i", "v" }, "<C-b>", "<Esc>:Neotree toggle<CR>", opts)

-- Undo & Redo
map("n", "<C-z>", "u", opts)
map("i", "<C-z>", "<Esc>u<Esc>", opts)
map("v", "<C-z>", "<Esc>u<Esc>", opts)

map("n", "<C-y>", "<C-r>", opts)
map("i", "<C-y>", "<Esc><C-r><Esc>", opts)
map("v", "<C-y>", "<Esc><C-r><Esc>", opts)

-- Visual mode with Shift + Arrows
map("n", "<S-Up>", "vk", opts)
map("n", "<S-Down>", "vj", opts)
map("n", "<S-Left>", "vh", opts)
map("n", "<S-Right>", "vl", opts)

map("i", "<S-Up>", "<Esc>vk", opts)
map("i", "<S-Down>", "<Esc>vj", opts)
map("i", "<S-Left>", "<Esc>vh", opts)
map("i", "<S-Right>", "<Esc>vl", opts)

-- Cancel selection with normal arrow keys
map("v", "<Up>", "<Esc>a", opts)
map("v", "<Down>", "<Esc>a", opts)
map("v", "<Left>", "<Esc>a", opts)
map("v", "<Right>", "<Esc>a", opts)

-- Visual move with Shift+Arrows
map("v", "<S-Up>", "k", opts)
map("v", "<S-Down>", "j", opts)
map("v", "<S-Left>", "h", opts)
map("v", "<S-Right>", "l", opts)

-- Move lines up/down
map("n", "<A-Up>", ":m .-2<CR>==", opts)
map("n", "<A-Down>", ":m .+1<CR>==", opts)
map("v", "<A-Up>", ":m '<-2<CR>gv=gv", opts)
map("v", "<A-Down>", ":m '>+1<CR>gv=gv", opts)

-- Clone lines
map("n", "<S-A-Up>", ":t.-1<CR>", opts)
map("n", "<S-A-Down>", ":t.<CR>", opts)
map("v", "<S-A-Up>", ":t '<-1<CR>gv", opts)
map("v", "<S-A-Down>", ":t '>+1<CR>gv", opts)

-- Delete word in insert mode (Ctrl+Backspace)
map("i", "<C-BS>", "<C-w>")
map("i", "<C-H>", "<C-w>") 
