local l_Actions_0 = script:FindFirstAncestor("ExpChatShared").Actions;
local v1 = require(l_Actions_0.ChatWindowMessagesCleared);
local _ = require(script.Parent.types);
return {
    name = script.Name, 
    alias = {
        "/clear", 
        "/cls"
    }, 
    clientRun = function(v3, _, _) --[[ Line: 10 ]] --[[ Name: clientRun ]]
        -- upvalues: v1 (copy)
        v3:dispatch(v1());
        return {
            key = "", 
            metadata = "Roblox.Clear.Info.Success"
        };
    end
};