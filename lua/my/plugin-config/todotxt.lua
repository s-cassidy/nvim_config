vim.keymap.set("n", "<leader>tt", ':ToDoTxtTasksToggle<CR>', { silent = true, desc = "Show tasks" })
vim.keymap.set("n", "<leader>ta", ':ToDoTxtCapture<CR>', { silent = true, desc = "Add task" })
vim.keymap.set("n", "<leader>te", ':e ~/notes/tasks/todo.txt<CR>', { silent = true, desc = "Edit tasks file" })
