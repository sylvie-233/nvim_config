return {
    "nvim-tree/nvim-tree.lua",
    dependencies = {"nvim-tree/nvim-web-devicons"},
    config = function()
        require("nvim-tree").setup({
            view = {
                width = 30
            },
            renderer = {
                highlight_git = true
            }
        })
        vim.keymap.set('n', '<leader>e', function()
            require("nvim-tree.api").tree.toggle({
                focus = true
            })
        end, {
            noremap = true,
            silent = true
        })
    end
}
