return {
    {
        "mfussenegger/nvim-lint",
        config = function()
            local lint = require("lint")

            lint.linters_by_ft = {
                cpp = {"cppcheck"},
                javascript = {"eslint"},
                javascriptreact = {"eslint"},
                typescript = {"eslint"},
                typescriptreact = {"eslint"},
                lua = {"luacheck"},
                ruby = {"rubocop"},
                css = {"stylelint"},
                scss = {"stylelint"}
            }

            local group = vim.api.nvim_create_augroup("lint", {clear = true})

            vim.api.nvim_create_autocmd(
                {"BufWritePost", "BufEnter", "BufLeave"},
                {group = group, callback = function()
                    lint.try_lint()
                end})
        end
    }
}
