local status, sidebar = pcall(require, "sidebar-nvim")

-- ウィンドウの幅が大きいときのみサイドバーを表示
local thr_width = 130
local width = vim.api.nvim_win_get_width(0)

if width > thr_width then
    opts = {
	    open = true,
	    sections = { "git", "files", "buffers" },
	    datetime = { format = "%a %b/%d, %H:%M", clocks = {{ name = "local"}} },
    }
else

    opts = {
	    open = false,
	    sections = { "git", "files", "buffers" },
	    datetime = { format = "%a %b/%d, %H:%M", clocks = {{ name = "local"}} },
    }
end
sidebar.setup(opts)
