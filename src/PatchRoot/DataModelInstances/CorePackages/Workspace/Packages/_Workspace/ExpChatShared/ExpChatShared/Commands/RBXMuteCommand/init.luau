local v0 = require(script.Parent.getPlayersFromString);
local l_Actions_0 = script:FindFirstAncestor("ExpChatShared").Actions;
local v2 = require(l_Actions_0.UserMuted);
local _ = require(script.Parent.types);
return {
    name = script.Name, 
    alias = {
        "/mute", 
        "/m"
    }, 
    clientRun = function(v4, v5, v6) --[[ Line: 11 ]] --[[ Name: clientRun ]]
        -- upvalues: v0 (copy), v2 (copy)
        local v7 = string.split(v6, " ")[2];
        if not v7 then
            return {
                key = "CoreScripts.TextChat.Mute.Error.TargetDoesNotExist", 
                args = {
                    RBX_NAME = ""
                }, 
                metadata = "Roblox.Mute.Error.PlayerNotFound"
            };
        else
            local v8 = v0(v4:getState().Players, v7);
            if #v8 == 0 then
                return {
                    key = "CoreScripts.TextChat.Mute.Error.TargetDoesNotExist", 
                    args = {
                        RBX_NAME = v7
                    }, 
                    metadata = "Roblox.Mute.Error.PlayerNotFound"
                };
            elseif #v8 > 1 then
                return {
                    key = "CoreScripts.TextChat.Mute.Error.MultipleMatches", 
                    args = {}, 
                    metadata = "Roblox.Mute.Error.MultipleMatches"
                };
            else
                local v9 = v8[1];
                if v9.userId == tostring(v5) then
                    return {
                        key = "CoreScripts.TextChat.Mute.Error.CannotMuteSelf", 
                        args = {}, 
                        metadata = "Roblox.Mute.Error.CannotMuteSelf"
                    };
                else
                    v4:dispatch(v2(v9.userId));
                    return {
                        key = "CoreScripts.TextChat.Mute.Success", 
                        args = {
                            RBX_NAME = v9.nameToDisplay
                        }, 
                        metadata = "Roblox.Mute.Info.Success"
                    };
                end;
            end;
        end;
    end
};