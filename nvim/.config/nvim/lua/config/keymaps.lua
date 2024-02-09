local keymap = vim.keymap

-- Restart LSP Server
keymap.set("n", "<leader>rs", ":LspRestart<cr>")

-- Pomodoro Timer Keymaps
keymap.set("n", "<leader>ps", ":TimerStart 25m Pomodoro<cr>", { desc = "Start a Pomodoro work cycle" })
keymap.set("n", "<leader>pb", ":TimerStart 5m Break<cr>", { desc = "Start a Pomodoro break cycle" })
keymap.set("n", "<leader>px", ":Timerstop -1<cr>", { desc = "Stop all Pomodoro timers" })
