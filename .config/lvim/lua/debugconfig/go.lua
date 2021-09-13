local dap = require("dap")

dap.adapters.go = function(callback, config)
    local stdout = vim.loop.new_pipe(false)
    local handle
    local pid_or_err
    local port = 38697
    handle, pid_or_err = vim.loop.spawn("dlv", {stdio = {nil, stdout}, args = {"dap", "-l", "127.0.0.1:" .. port}, detached = true}, function(code)
        stdout:close()
        handle:close()
        if code ~= 0 then print("Delve exited with exit code: ", code) end
    end)
    assert(handle, "Error running dlv: " .. tostring(pid_or_err))
    stdout:read_start(function(err, chunk)
        assert(not err, err)
        if chunk then
            vim.schedule(function()
                require("dap.repl").append(chunk)
            end)
        end
    end)
    vim.defer_fn(function()
        callback({type = "server", host = "127.0.0.1", port = port})
    end, 500)
end

dap.configurations.go = {{type = "go", name = "Debug", request = "launch", program = "./${relativeFileDirname}", dlvToolPath = vim.fn.exepath("dlv")}}
