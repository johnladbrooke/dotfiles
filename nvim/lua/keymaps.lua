local keymap = vim.keymap.set
local s = { silent = true }

vim.g.mapleader = " "

keymap("n", "<space>", "<Nop>")

keymap("n", "j", function()
    return tonumber(vim.api.nvim_get_vvar("count")) > 0 and "j" or "gj"
end, { expr = true, silent = true }) -- Move down, but use 'gj' if no count is given
keymap("n", "k", function()
    return tonumber(vim.api.nvim_get_vvar("count")) > 0 and "k" or "gk"
end, { expr = true, silent = true })                          -- Move up, but use 'gk' if no count is given
keymap("n", "<C-d>", "<C-d>zz")                               -- Scroll down and center the cursor
keymap("n", "<C-u>", "<C-u>zz")                               -- Scroll up and center the cursor
keymap("n", "<Leader>w", "<cmd>w!<CR>", s)                    -- Save the current file
keymap("n", "<Leader>q", "<cmd>q<CR>", s)                     -- Quit Neovim
keymap("n", "<Leader>te", "<cmd>tabnew<CR>", s)               -- Open a new tab
keymap("n", "<Leader>-", "<cmd>vsplit<CR>", s)                -- Split the window vertically
keymap("n", "<Leader>_", "<cmd>split<CR>", s)                 -- Split the window horizontally
keymap("n", "<Leader>fo", ":lua vim.lsp.buf.format()<CR>", s) -- Format the current buffer using LSP
keymap("v", "<Leader>p", '"_dP')                              -- Paste without overwriting the default register
keymap("x", "y", [["+y]], s)                                  -- Yank to the system clipboard in visual mode
keymap("t", "<Esc>", "<C-\\><C-N>")                           -- Exit terminal mode

-- Change directory to the current file's directory
keymap("n", "<leader>cd", '<cmd>lua vim.fn.chdir(vim.fn.expand("%:p:h"))<CR>')

local opts = { noremap = true, silent = true }
keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts) -- Go to definition

keymap("n", "sd", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)

-- ]d jumps to the next diagnostic in the buffer. ]d-default
-- [d jumps to the previous diagnostic in the buffer. [d-default
-- ]D jumps to the last diagnostic in the buffer. ]D-default
-- [D jumps to the first diagnostic in the buffer. [D-default


-- - "gra" (Normal and Visual mode) is mapped to |vim.lsp.buf.code_action()|
-- - "gri" is mapped to |vim.lsp.buf.implementation()|
-- - "grn" is mapped to |vim.lsp.buf.rename()|
-- - "grr" is mapped to |vim.lsp.buf.references()|
-- - "grt" is mapped to |vim.lsp.buf.type_definition()|
-- - "grx" is mapped to |vim.lsp.codelens.run()|
-- - "gO" is mapped to |vim.lsp.buf.document_symbol()|

-- Update packages installed with build in package mangager :write to confirm :quit to reject changes
keymap("n", "<leader>ps", '<cmd>lua vim.pack.update()<CR>')

-- Open Netrw in the current file's directory
keymap("n", "\\", "<cmd>Ex %:p:h<CR>")

-- fzf
keymap("n", "<leader>ff", '<cmd>FzfLua files<CR>')
keymap("n", "<leader>fg", '<cmd>FzfLua live_grep<CR>')
keymap("n", "<leader>fb", '<cmd>FzfLua buffers<CR>')
keymap("n", "<leader>fq", '<cmd>FzfLua quickfix<CR>')
keymap("n", "<leader>fr", '<cmd>FzfLua lsp_references<CR>')
keymap("n", "<leader>fd", '<cmd>FzfLua lsp_definitions<CR>')
keymap("n", "<leader>fi", '<cmd>FzfLua lsp_implementations<CR>')
keymap("n", "<leader>fe", '<cmd>FzfLua diagnostics_document<CR>')
