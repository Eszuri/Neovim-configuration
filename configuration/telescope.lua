require("telescope").setup{
  defaults = {
    initial_mode = "insert",
    sorting_strategy = "ascending",
    layout_strategy = "horizontal",
    layout_config = {
      prompt_position = "top",
    },
  },

  pickers = {
    live_grep = {
      previewer = false,
    },
    current_buffer_fuzzy_find = {
      previewer = false,
    },
  },
}
