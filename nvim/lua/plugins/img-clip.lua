return {
  "HakonHarnes/img-clip.nvim",
  opts = {
    default = {
      dir_path = "../../attachments",
      prompt_for_file_name = true,
      relative_to_current_file = true,
    },
    filetypes = {
      typst = {
        template = '#figure(\n  image("../../attachments/$FILE_NAME"),\n  caption: [],\n) <fig-$CURSOR>',
      }
    }
  }
}
