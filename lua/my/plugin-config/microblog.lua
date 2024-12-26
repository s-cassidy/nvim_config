require('microblog').setup(
  {
    blogs = {
      {
        url = "https://samjc.me",
        uid = "https://samjc.micro.blog"
      },
      {
        url = "https://samjc-test.micro.blog",
        uid = "https://samjc-test.micro.blog"
      }
    },
    no_save_quickpost = true,
  }
)
vim.keymap.set({ "n", "v" }, "<leader>me", require("microblog").pick_post, { desc = "Edit a post" })
vim.keymap.set({ "n", "v" }, "<leader>mp", require("microblog").publish, { desc = "Send a post" })
vim.keymap.set({ "n", "v" }, "<leader>mq", require("microblog").quickpost, { desc = "Quick post" })
vim.keymap.set({ "n", "v" }, "<leader>mP", require("microblog").pick_page, { desc = "Pick page" })
vim.keymap.set({ "n", "v" }, "<leader>mu", require("microblog").get_post_from_url, { desc = "Open micro.blog url" })
vim.keymap.set({ "n", "v" }, "<leader>ms", require("microblog").display_post_status,
  { desc = "Display post status" })
