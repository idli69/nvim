if vim.fn.executable("cargo") == 0 then
  print("Install cargo")
  return
end

local cmp = require("blink.cmp")

cmp.build():pwait()

cmp.setup()
