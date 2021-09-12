local M = {}

require("debugconfig.ui")
require("debugconfig.go")

M.setup = function()
  lvim.builtin.which_key.mappings["dq"] = {
        q = { "<cmd>lua require('debug').quitDebugger() <cr>", "Quit debugger"}
  }
end

local function quitDebugger()
       require("dap").disconnect()
       require("dap").close()
       require("dap").repl.close()
       require("dapui").close()
end



