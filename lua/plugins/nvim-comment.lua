return {
    "terrortylor/nvim-comment",
    config = function()
        require("nvim_comment").setup({
            line_mapping = "<leader>c", -- 注释当前行
            operator_mapping = "<leader>c" -- 可操作选中区域
        })
    end
}
