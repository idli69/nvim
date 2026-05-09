local M = {}

local function missing(cmd)
  return vim.fn.executable(cmd) == 0
end

function M.check(list)
  local bad = {}

  for _, cmd in ipairs(list) do
    if missing(cmd) then
      table.insert(bad, cmd)
    end
  end

  if #bad > 0 then
    vim.schedule(function()
      vim.notify(
        "Missing tools:\n- " .. table.concat(bad, "\n- ") .. "\n\nInstall them via your package manager.",
        vim.log.levels.WARN,
        { title = "Neovim" }
      )
    end)
    return false
  end

  return true
end
return M
