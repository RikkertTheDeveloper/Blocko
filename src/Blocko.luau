--!strict

--[[
    Blocko.lua
    @author SyntaxDefinition
    @classname ModuleScript
]]

-- Instantiate required services:
local HttpService = game:GetService("HttpService")

-- Instantiate required modules:
local Configuration = require("Configuration")
local Types = require("Types")

-- Instantiate module functionality:
local Blocko = {
    Listening = false :: boolean,
    Queue = table.create(200),
}

function Blocko:Queue(Log: Types.BlockoLog)
    Log.Timestamp = os.time()
    Log.Indentifier = string.format("%i-%s_%i", os.now(), Log.Type, math.random(10, 10000))

    table.insert(Blocko.Queue, Log)
end

function Blocko.Listener()
    while task.wait(Configuration.RefreshRate) do
        Blocko:Clear()
    end
end

function Blocko:Clear()
    Blocko:Send(Blocko.Queue)
    table.clear(Blocko.Queue)
end

function Blocko:Send(Queue: {Types.BlockoLog})
    HttpService:PostAsync(Configuration.URL, HttpService:JSONEncode(Queue), Enum.HttpContentType.ApplicationJson, true, {
        ["blocko_key"] = Configuration.Key
    })
end

function Blocko:Listen()
    if not Blocko.Listening then
        print("Blocko is now listening for incoming requests.")
        task.spawn(Blocko.Listener)
    else
        warn("Blocko is already listening to incoming requests.")
    end
end

return Blocko
