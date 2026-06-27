return {
    "saghen/blink.pairs",
    dependencies = {
        "saghen/blink.lib",
        {
            'saghen/blink.indent',
            enabled = true,
            opts = {static = { char = ""}, scope = {char = ""}},
        }
    },
    version = "*",
    build = function()
        require("blink.pairs").download():pwait(60000)
    end,
    opts = {},
}
