return {
    {
        "windwp/nvim-autopairs",
        config = function()
            local npairs = require("nvim-autopairs")
            local Rule = require("nvim-autopairs.rule")

            npairs.setup({check_ts = true, fast_wrap = {}})

            npairs.add_rules {
                Rule(" ", " "):with_pair(function(opts)
                    local pair = opts.line:sub(opts.col - 1, opts.col)
                    return vim.tbl_contains({"()", "[]", "{}"}, pair)
                end),

                Rule("( ", " )"):with_pair(function()
                    return false
                end):with_move(function(opts)
                    return opts.prev_char:match(".%)") ~= nil
                end):use_key(")"),

                Rule("{ ", " }"):with_pair(function()
                    return false
                end):with_move(function(opts)
                    return opts.prev_char:match(".%}") ~= nil
                end):use_key("}"),

                Rule("[ ", " ]"):with_pair(function()
                    return false
                end):with_move(function(opts)
                    return opts.prev_char:match(".%]") ~= nil
                end):use_key("]")
            }
        end
    }
}
