return {
	config = function()
		local status_ok, outline = pcall(require, "outline")
		if not status_ok then
			return
		end

		vim.keymap.set("n", "<leader>o", "<cmd>Outline<CR>", { desc = "Toggle Outline" })

		outline.setup({
			outline_window = {
				position = "left",
                width = 20
			},
		})
	end,
}
