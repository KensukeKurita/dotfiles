local status, telescope = pcall(require, "telescope")
if not status then
    return
end

local actions = require("telescope.actions")
local builtin = require("telescope.builtin")
local fb_actions_status, fb_actions = pcall(require, "telescope._extensions.file_browser.actions")

telescope.setup({
    defaults = {
        mappings = {
            n = {["q"] = actions.close}
        }
    },
    extensions = {
        file_browser = {
            theme = "dropdown",
            hijack_netrw = true,
            mappings = {
                ["i"] = {["<C-w>"] = function() vim.cmd("normal vbd") end},
                ["n"] = fb_actions_status and {["N"] = fb_actions.create} or {}
            }
        }
    }
})

pcall(telescope.load_extension, "file_browser")

vim.keymap.set("n", ";f",
    function()
        builtin.find_files({
            hidden = true
        })
    end
)

vim.keymap.set("n", ";e",
    function()
        telescope.extensions.file_browser.file_browser({
            path = vim.fn.expand("%:p:h"),
            select_buffer = true,
        })
    end
)
