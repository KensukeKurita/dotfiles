
local status, bufferline = pcall(require, "bufferline")
if (not status) then return end

bufferline.setup({
    options = {
        mode = "tabs",
        separator_style = "slant",
        always_show_bufferline = false,
        show_buffer_close_icons = false,
        show_close_icon = false,
        color_icons = true
    },
})

--> keymap
local opts = {noremap = true, silent = true}
local keymap = vim.api.nvim_set_keymap
-- normal(n)-mode
keymap("n", "<Tab>", "<Cmd>BufferLineCycleNext<CR>", opts) -- タブキーでタブ移動できる
keymap("n", "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", opts)
-- <<  keyamp
