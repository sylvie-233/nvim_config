return {
  "echasnovski/mini.move",
  version = false,
  config = function()
    require("mini.move").setup({
      -- VS Code 代码移动风格
      mappings = {
        left  = "<A-h>",
        right = "<A-l>",
        down  = "<A-j>",
        up    = "<A-k>",
      },
    })
  end,
}
