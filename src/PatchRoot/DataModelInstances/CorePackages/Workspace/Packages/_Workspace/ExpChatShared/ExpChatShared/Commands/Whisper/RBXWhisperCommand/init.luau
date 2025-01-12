local l_TextChatService_0 = game:GetService("TextChatService");
local l_RobloxReplicatedStorage_0 = game:GetService("RobloxReplicatedStorage");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChatShared");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Dictionary_0 = require(l_Parent_0.llama).Dictionary;
local v5 = require(l_script_FirstAncestor_0.Logger):new("ExpChat/Command/Whisper");
local l_Actions_0 = l_script_FirstAncestor_0.Actions;
local v7 = require(l_Actions_0.ChatInputBarActivatedWhisperMode);
local l_script_FirstAncestor_1 = script:FindFirstAncestor("Commands");
local v9 = require(l_script_FirstAncestor_1.getAutocompletePlayersFromString);
local v10 = require(l_script_FirstAncestor_1.Whisper.getNameFromWhisper);
local _ = require(l_script_FirstAncestor_1.types);
local v12 = require(l_script_FirstAncestor_0.Flags.getFFlagExpChatWhisperModeRaceFix);
return {
    name = script.Name, 
    alias = {
        "/whisper", 
        "/w"
    }, 
    clientRun = function(v13, v14, v15) --[[ Line: 23 ]] --[[ Name: clientRun ]]
        -- upvalues: v10 (copy), l_Dictionary_0 (copy), v9 (copy), v5 (copy), l_TextChatService_0 (copy), l_RobloxReplicatedStorage_0 (copy), v12 (copy), v7 (copy)
        local v16 = v13:getState().AutoCastCommands[script.Name];
        local v17 = v10(v15, v16);
        if v17 then
            local l_Players_0 = v13:getState().Players;
            local v19 = l_Dictionary_0.join(l_Players_0, {
                byUserId = l_Dictionary_0.removeKey(l_Players_0.byUserId, (tostring(v14)))
            });
            local v20 = v9(v19, v17);
            if #v20 == 0 then
                v5:debug("Autocomplete: No matches!");
                local v21 = l_Players_0.byUserId[tostring(v14)];
                if v21 and (v17 == v21.displayName or v17 == "@" .. v21.username) then
                    return {
                        key = "GameChat_PrivateMessaging_CannotWhisperToSelf", 
                        args = nil, 
                        metadata = "Roblox.Whisper.Error.CannotWhisperToSelf"
                    };
                else
                    return {
                        key = "CoreScripts.TextChat.Mute.Error.TargetDoesNotExist", 
                        args = {
                            RBX_NAME = v17 or ""
                        }, 
                        metadata = "Roblox.Whisper.Error.TargetDoesNotExist"
                    };
                end;
            elseif #v20 == 1 then
                local v22 = v20[1];
                local v23 = tonumber(v22.userId);
                if v23 then
                    local v24 = string.format("RBXWhisper:%d_%d", v14 < v23 and v14 or v23, v23 < v14 and v14 or v23);
                    local l_l_TextChatService_0_FirstChild_0 = l_TextChatService_0:FindFirstChild(v24, true);
                    if not l_l_TextChatService_0_FirstChild_0 then
                        local l_ExperienceChat_0 = l_RobloxReplicatedStorage_0:FindFirstChild("ExperienceChat");
                        if l_ExperienceChat_0 then
                            local l_WhisperChat_0 = l_ExperienceChat_0:FindFirstChild("WhisperChat");
                            if l_WhisperChat_0 and l_WhisperChat_0:IsA("RemoteFunction") then
                                l_l_TextChatService_0_FirstChild_0 = l_WhisperChat_0:InvokeServer(v22.userId);
                                if not l_l_TextChatService_0_FirstChild_0 then
                                    v5:error("Could not create whisper channel for some reason.");
                                    return {
                                        key = "CoreScripts.TextChat.Whisper.Error.CannotChat", 
                                        args = nil, 
                                        metadata = "Roblox.Whisper.Error.Unknown"
                                    };
                                end;
                            else
                                v5:error("Could not create whisper channel because WhisperChat RemoteFunction is missing.");
                                return {
                                    key = "", 
                                    metadata = "Roblox.Whisper.Error.Unknown"
                                };
                            end;
                        else
                            v5:error("Could not create whisper channel because RobloxReplicatedStorage.ExperienceChat is missing.");
                            return {
                                key = "", 
                                metadata = "Roblox.Whisper.Error.Unknown"
                            };
                        end;
                    end;
                    if v12() then
                        v13:dispatch(v7(nil, l_l_TextChatService_0_FirstChild_0));
                    else
                        v13:dispatch(v7(v24, nil));
                    end;
                    return {
                        key = "CoreScripts.TextChat.Notification.WhisperChat.Created", 
                        args = {
                            RBX_NAME = v17
                        }, 
                        metadata = "Roblox.Whisper.Info.Success"
                    };
                end;
            else
                v5:debug("Autocomplete: Too many matches!");
                return {
                    key = "CoreScripts.TextChat.Whisper.Error.CannotChat", 
                    metadata = "Roblox.Whisper.Error.TooManyMatches"
                };
            end;
        end;
        return {
            key = "", 
            metadata = "Roblox.Whisper.Error.Unknown"
        };
    end
};