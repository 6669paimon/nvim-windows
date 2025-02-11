local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Leader Key
keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Delete is not cut
-- Delete, d
-- keymap.set({ "n", "x" }, "d", '"_d')
-- keymap.set({ "n", "x" }, "D", '"_D')
-- keymap.set({ "n", "x" }, "x", '"_x')
-- keymap.set({ "n", "x" }, "X", '"_X')
-- Cut, x
-- keymap.set({ "n", "x" }, "x", "d")
-- keymap.set({ "n", "x" }, "xx", "dd")
-- keymap.set({ "n", "x" }, "X", "D")

-- Visual paste, don't yank
keymap.set("x", "p", '"_dP')

-- Delete a word backwards
-- keymap.set("n", "db", 'vb"_d')
keymap.set("n", "db", 'vbd')

-- Select all
-- keymap.set("n", "<c-a>", "ggVG")

keymap.set("n", "<leader>w", "<CMD>w<CR>", opts)
keymap.set("n", "<leader>x", "<CMD>x<CR>", opts)
keymap.set("n", "<leader>q", "<CMD>confirm q<CR>", opts)
-- keymap.set("n", "<leader>h", "<CMD>noh<CR>", opts)

-- keymap.set("n", "j", [[v:count?'j':'gj']], { noremap = true, expr = true })
-- keymap.set("n", "k", [[v:count?'k':'gk']], { noremap = true, expr = true })

-- Move select
keymap.set("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap.set("v", "K", ":m '<-2<CR>gv=gv", opts)

-- Add line
keymap.set("n", "<C-k>", "m`O<Esc>``")
keymap.set("n", "<C-j>", "m`o<Esc>``")
-- keymap.set("n", "<S-A-k>", "m`O<Esc>``")
-- keymap.set("n", "<S-A-j>", "m`o<Esc>``")
-- Delete line Up/Down current cursor
keymap.set("n", "K", "kdd")
-- keymap.set("n", "J", "mzJ`z")
keymap.set("n", "J", "mzjdd`z")

keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")
keymap.set("n", "G", "Gzz")
keymap.set("n", "gg", "ggzz")
keymap.set("n", "{", "{zz")
keymap.set("n", "}", "}zz")

-- find/replace for the word under the cursor
keymap.set("n", "<leader>sr", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
keymap.set("n", "<leader>ss", '*N', opts, { desc = "Search current word" })

-- Terminal
keymap.set("t", "<esc>", "<C-\\><C-n>", opts)
-- keymap.set("n", "<C-t>", "<CMD>tabnew | term<CR>", opts)


-- Move Firts&End line
keymap.set("", "H", "^")
keymap.set("", "L", "g_")
keymap.set("i", "<C-a>", "<Esc>I")
keymap.set("i", "<C-e>", "<End>")

-- Insert Backward Delete
keymap.set("i", "<C-d>", "<Del>")
keymap.set("i", "<A-d>", "<Space><Esc>ce")

-- New tab
keymap.set("n", "<leader>te", "<CMD>tabedit<CR>")

-- Split window
keymap.set("n", "<leader>\\", "<CMD>split<Return>")
keymap.set("n", "<leader>|", "<CMD>vsplit<Return>")

-- Move window
-- split pane
keymap.set("n", "<M-h>", "<C-w>h", opts)
keymap.set("n", "<M-k>", "<C-w>k", opts)
keymap.set("n", "<M-j>", "<C-w>j", opts)
keymap.set("n", "<M-l>", "<C-w>l", opts)
-- -- term pane
keymap.set("t", "<M-h>", "<CMD>wincmd h<CR>")
keymap.set("t", "<M-k>", "<CMD>wincmd k<CR>")
keymap.set("t", "<M-j>", "<CMD>wincmd j<CR>")
keymap.set("t", "<M-l>", "<CMD>wincmd l<CR>")
-- -- tmux
-- keymap.set("n", "<M-h>", "<CMD>TmuxNavigateLeft<CR>")
-- keymap.set("n", "<M-k>", "<CMD>TmuxNavigateUp<CR>")
-- keymap.set("n", "<M-j>", "<CMD>TmuxNavigateDown<CR>")
-- keymap.set("n", "<M-l>", "<CMD>TmuxNavigateRight<CR>")

-- Resize window
keymap.set("n", "<C-left>", "<C-w><", opts)
keymap.set("n", "<C-right>", "<C-w>>", opts)
keymap.set("n", "<C-up>", "<C-w>+", opts)
keymap.set("n", "<C-down>", "<C-w>-", opts)

-- Disable arrow
keymap.set("", "<Up>", "<nop>", opts)
keymap.set("", "<Down>", "<nop>", opts)
keymap.set("", "<Left>", "<nop>", opts)
keymap.set("", "<Right>", "<nop>", opts)


--  Buffer
keymap.set("n", "[b", "<CMD>bp<CR>", opts, { desc = "move previous buffer" })
keymap.set("n", "]b", "<CMD>bn<CR>", opts, { desc = "move next buffer" })
keymap.set("n", "<leader><leader>", "<C-^>", { noremap = true }, { desc = "Switch to latest buffer" })
keymap.set("n", "<leader>dd", "<CMD>confirm bd<CR>", opts, { desc = "Close buffer" })
vim.api.nvim_set_keymap("n", "<leader>da", "", {
  noremap = true,
  silent = true,
  callback = function()
    local current_buf = vim.api.nvim_get_current_buf()
    local all_buf = vim.api.nvim_list_bufs()
    local closed_count = 0

    local function is_regular_file(buf)
      -- Check buftype
      local buftype = vim.api.nvim_buf_get_option(buf, 'buftype')
      if buftype ~= '' then
        return false
      end

      -- Check filename
      local bufname = vim.api.nvim_buf_get_name(buf)
      if bufname == '' then
        return false
      end

      -- Check if it's a normal file path
      local stat = vim.loop.fs_stat(bufname)
      if not stat or not stat.type == 'file' then
        return false
      end

      return true
    end

    for _, buf in ipairs(all_buf) do
      if buf ~= current_buf and vim.api.nvim_buf_is_valid(buf) and is_regular_file(buf) then
        local modified = vim.api.nvim_buf_get_option(buf, 'modified')
        if modified then
          local buf_name = vim.api.nvim_buf_get_name(buf)
          local choice = vim.fn.confirm('Save changes to "' .. buf_name .. '"?', "&Yes\n&No\n&Cancel", 1)
          if choice == 1 then -- Yes
            vim.api.nvim_buf_call(buf, function() vim.cmd('write') end)
            vim.api.nvim_buf_delete(buf, {})
            closed_count = closed_count + 1
          elseif choice == 2 then -- No
            vim.api.nvim_buf_delete(buf, { force = true })
            closed_count = closed_count + 1
          elseif choice == 3 then -- Cancel
            return
          end
        else
          vim.api.nvim_buf_delete(buf, {})
          closed_count = closed_count + 1
        end
      end
    end

    -- Show notification
    vim.defer_fn(function()
      local msg = string.format("Closed buffer(s): %d", closed_count)
      vim.notify(msg, vim.log.levels.INFO, { title = "Buffer Cleanup", timeout = 3000 })
    end, 100)
  end,
  desc = "Close all regular file buffers except the current buffer"
})

-- Quick compile and run
-- python
vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    vim.api.nvim_buf_set_keymap(0, 'n', '<leader>cc', '',
      {
        noremap = true,
        silent = true,
        callback = function()
          local venv_python = vim.fn.getcwd() .. "/venv/bin/python"
          local python_cmd = vim.fn.filereadable(venv_python) == 1 and venv_python or "python"
          local file_path = vim.fn.expand("%:p")
          vim.cmd("12split | terminal " .. python_cmd .. " " .. file_path)
        end
      })
  end
})


-- C/C++ (LLVM)
vim.api.nvim_create_autocmd("FileType", {
  pattern = "cpp",
  callback = function()
    vim.api.nvim_set_keymap('n', '<F9>', '<cmd>!clang++ % -o %:r.exe<cr>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<F10>', '<cmd>12split<bar>terminal %:r.exe<cr>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>cc',
      '<cmd>w<cr><cmd>!clang++ % -o %:r.exe<cr><cmd>12split<bar>terminal %:r.exe<cr>',
      { noremap = true, silent = true })
  end
})
vim.api.nvim_create_autocmd("FileType", {
  pattern = "c",
  callback = function()
    vim.api.nvim_set_keymap('n', '<F9>', '<cmd>!clang % -o %:r.exe<cr>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<F10>', '<cmd>12split<bar>terminal %:r.exe<cr>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>cc',
      '<cmd>w<cr><cmd>!clang % -o %:r.exe<cr><cmd>12split<bar>terminal %:r.exe<cr>',
      { noremap = true, silent = true })
  end
})

-- C/C++ (MinGW)
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "c",
--   callback = function()
--     -- ใช้ gcc แทน g++
--     vim.api.nvim_set_keymap('n', '<F9>', '<cmd>!gcc -std=c11 % -o %:r<cr>', { noremap = true, silent = true })
--     vim.api.nvim_set_keymap('n', '<F10>', '<cmd>12split<bar>terminal %:r<cr>', { noremap = true, silent = true })
--     vim.api.nvim_set_keymap('n', '<leader>cc',
--       '<cmd>w<cr><cmd>!gcc -std=c11 % -o %:r<cr><cmd>12split<bar>terminal %:r<cr>',
--       { noremap = true, silent = true })
--   end
-- })
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "cpp",
--   callback = function()
--     vim.api.nvim_set_keymap('n', '<F9>', '<cmd>!g++ -std=c++17 % -o %:r<cr>', { noremap = true, silent = true })
--     vim.api.nvim_set_keymap('n', '<F10>', '<cmd>12split<bar>terminal %:r<cr>', { noremap = true, silent = true })
--     vim.api.nvim_set_keymap('n', '<leader>cc',
--       '<cmd>w<cr><cmd>!g++ -std=c++17 % -o %:r<cr><cmd>12split<bar>terminal %:r<cr>',
--       { noremap = true, silent = true })
--   end
-- })
