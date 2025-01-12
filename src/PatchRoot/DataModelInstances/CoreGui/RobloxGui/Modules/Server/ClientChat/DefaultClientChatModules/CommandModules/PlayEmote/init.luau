local l_Chat_0 = game:GetService("Chat");
local l_Players_0 = game:GetService("Players");
local l_Parent_0 = script.Parent;
local l_Util_0 = require(l_Parent_0:WaitForChild("Util"));
local v4 = nil;
pcall(function() --[[ Line: 13 ]]
    -- upvalues: v4 (ref), l_Chat_0 (copy)
    v4 = require(l_Chat_0.ClientChatModules.ChatLocalization);
end);
if v4 == nil then
    v4 = {
        Get = function(_, _, v7) --[[ Line: 14 ]] --[[ Name: Get ]]
            return v7;
        end
    };
end;
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local v9 = nil;
local l_status_0, l_result_0 = pcall(function() --[[ Line: 19 ]]
    return UserSettings():IsUserFeatureEnabled("UserPlayEmoteChatTextUpdates");
end);
v9 = l_status_0 and l_result_0;
l_status_0 = {
    wave = true, 
    point = true, 
    dance = true, 
    dance2 = true, 
    dance3 = true, 
    laugh = true, 
    cheer = true
};
l_result_0 = {
    NotSupported = "InGame.Chat.Response.EmotesNotSupported", 
    R15Only = "InGame.Chat.Response.EmotesWrongAvatarType", 
    SwitchToR15 = "InGame.Chat.ErrorMessageSwitchToR15", 
    NoMatchingEmote = "InGame.Chat.Response.EmoteNotAvailable", 
    TemporarilyUnavailable = "InGame.Chat.Response.EmotesTemporarilyUnavailable", 
    AnimationPlaying = "InGame.Chat.ErrorMessageAnimationPlaying"
};
local v12 = {
    [l_result_0.NotSupported] = "You can't use Emotes here.", 
    [l_result_0.R15Only] = "Only R15 avatars can use Emotes.", 
    [l_result_0.SwitchToR15] = "Switch to your R15 avatar to play Emote.", 
    [l_result_0.NoMatchingEmote] = "You can't use that Emote.", 
    [l_result_0.TemporarilyUnavailable] = "You can't use Emotes right now.", 
    [l_result_0.AnimationPlaying] = "You cannot play Emotes during this action."
};
local v13 = Color3.fromRGB(245, 50, 50);
local function _(v14) --[[ Line: 55 ]] --[[ Name: getEmoteName ]]
    if string.sub(v14, 1, 3) == "/e " then
        return (string.sub(v14, 4));
    elseif string.sub(v14, 1, 7) == "/emote " then
        return (string.sub(v14, 8));
    else
        return nil;
    end;
end;
local function _(v16, v17) --[[ Line: 65 ]] --[[ Name: sendErrorMessage ]]
    -- upvalues: v4 (ref), v12 (copy), v13 (copy), l_Util_0 (copy)
    local v18 = v4:Get(v17, v12[v17]);
    local v19 = {
        ChatColor = v13
    };
    l_Util_0:SendSystemMessageToSelf(v18, v16, v19);
end;
local function v76(v21, v22, _) --[[ Line: 74 ]] --[[ Name: ProcessMessage ]]
    -- upvalues: l_status_0 (copy), l_LocalPlayer_0 (copy), l_result_0 (copy), v4 (ref), v12 (copy), v13 (copy), l_Util_0 (copy), v9 (ref)
    local v24 = if string.sub(v21, 1, 3) == "/e " then string.sub(v21, 4) else if string.sub(v21, 1, 7) == "/emote " then string.sub(v21, 8) else nil;
    if not v24 then
        return false;
    elseif l_status_0[v24] then
        return true;
    else
        local l_v22_CurrentChannel_0 = v22:GetCurrentChannel();
        if not l_v22_CurrentChannel_0 then
            return true;
        else
            local l_Character_0 = l_LocalPlayer_0.Character;
            if not l_Character_0 then
                local l_TemporarilyUnavailable_0 = l_result_0.TemporarilyUnavailable;
                local v28 = v4:Get(l_TemporarilyUnavailable_0, v12[l_TemporarilyUnavailable_0]);
                local v29 = {
                    ChatColor = v13
                };
                l_Util_0:SendSystemMessageToSelf(v28, l_v22_CurrentChannel_0, v29);
                return true;
            else
                local l_Animate_0 = l_Character_0:FindFirstChild("Animate");
                if not l_Animate_0 then
                    local l_NotSupported_0 = l_result_0.NotSupported;
                    local v32 = v4:Get(l_NotSupported_0, v12[l_NotSupported_0]);
                    local v33 = {
                        ChatColor = v13
                    };
                    l_Util_0:SendSystemMessageToSelf(v32, l_v22_CurrentChannel_0, v33);
                    return true;
                elseif not l_Animate_0:FindFirstChild("PlayEmote") then
                    local l_NotSupported_1 = l_result_0.NotSupported;
                    local v35 = v4:Get(l_NotSupported_1, v12[l_NotSupported_1]);
                    local v36 = {
                        ChatColor = v13
                    };
                    l_Util_0:SendSystemMessageToSelf(v35, l_v22_CurrentChannel_0, v36);
                    return true;
                else
                    local l_Humanoid_0 = l_Character_0:FindFirstChildOfClass("Humanoid");
                    if not l_Humanoid_0 then
                        local l_TemporarilyUnavailable_1 = l_result_0.TemporarilyUnavailable;
                        local v39 = v4:Get(l_TemporarilyUnavailable_1, v12[l_TemporarilyUnavailable_1]);
                        local v40 = {
                            ChatColor = v13
                        };
                        l_Util_0:SendSystemMessageToSelf(v39, l_v22_CurrentChannel_0, v40);
                        return true;
                    elseif l_Humanoid_0.RigType ~= Enum.HumanoidRigType.R15 then
                        if v9 then
                            local l_SwitchToR15_0 = l_result_0.SwitchToR15;
                            local v42 = v4:Get(l_SwitchToR15_0, v12[l_SwitchToR15_0]);
                            local v43 = {
                                ChatColor = v13
                            };
                            l_Util_0:SendSystemMessageToSelf(v42, l_v22_CurrentChannel_0, v43);
                        else
                            local l_R15Only_0 = l_result_0.R15Only;
                            local v45 = v4:Get(l_R15Only_0, v12[l_R15Only_0]);
                            local v46 = {
                                ChatColor = v13
                            };
                            l_Util_0:SendSystemMessageToSelf(v45, l_v22_CurrentChannel_0, v46);
                        end;
                        return true;
                    else
                        local l_HumanoidDescription_0 = l_Humanoid_0:FindFirstChildOfClass("HumanoidDescription");
                        if not l_HumanoidDescription_0 then
                            local l_TemporarilyUnavailable_2 = l_result_0.TemporarilyUnavailable;
                            local v49 = v4:Get(l_TemporarilyUnavailable_2, v12[l_TemporarilyUnavailable_2]);
                            local v50 = {
                                ChatColor = v13
                            };
                            l_Util_0:SendSystemMessageToSelf(v49, l_v22_CurrentChannel_0, v50);
                            return true;
                        else
                            local v51 = {};
                            local l_l_HumanoidDescription_0_Emotes_0 = l_HumanoidDescription_0:GetEmotes();
                            for v53, _ in pairs(l_l_HumanoidDescription_0_Emotes_0) do
                                v51[string.lower(v53)] = v53;
                            end;
                            local v55 = tonumber(v24);
                            if v55 then
                                local l_l_HumanoidDescription_0_EquippedEmotes_0 = l_HumanoidDescription_0:GetEquippedEmotes();
                                for _, v58 in pairs(l_l_HumanoidDescription_0_EquippedEmotes_0) do
                                    if v58.Slot == v55 then
                                        v24 = v58.Name;
                                    end;
                                end;
                            end;
                            v24 = v51[string.lower(v24)];
                            if not v24 then
                                local l_NoMatchingEmote_0 = l_result_0.NoMatchingEmote;
                                local v60 = v4:Get(l_NoMatchingEmote_0, v12[l_NoMatchingEmote_0]);
                                local v61 = {
                                    ChatColor = v13
                                };
                                l_Util_0:SendSystemMessageToSelf(v60, l_v22_CurrentChannel_0, v61);
                                return true;
                            else
                                spawn(function() --[[ Line: 154 ]]
                                    -- upvalues: l_Humanoid_0 (copy), v24 (ref), l_v22_CurrentChannel_0 (copy), l_result_0 (ref), v4 (ref), v12 (ref), v13 (ref), l_Util_0 (ref), v9 (ref)
                                    local l_status_1, l_result_1 = pcall(function() --[[ Line: 155 ]]
                                        -- upvalues: l_Humanoid_0 (ref), v24 (ref)
                                        return l_Humanoid_0:PlayEmote(v24);
                                    end);
                                    if not l_status_1 then
                                        local l_l_v22_CurrentChannel_0_0 = l_v22_CurrentChannel_0;
                                        local l_NotSupported_2 = l_result_0.NotSupported;
                                        local v66 = v4:Get(l_NotSupported_2, v12[l_NotSupported_2]);
                                        local v67 = {
                                            ChatColor = v13
                                        };
                                        l_Util_0:SendSystemMessageToSelf(v66, l_l_v22_CurrentChannel_0_0, v67);
                                        return;
                                    else
                                        if not l_result_1 then
                                            if v9 then
                                                local l_l_v22_CurrentChannel_0_1 = l_v22_CurrentChannel_0;
                                                local l_AnimationPlaying_0 = l_result_0.AnimationPlaying;
                                                local v70 = v4:Get(l_AnimationPlaying_0, v12[l_AnimationPlaying_0]);
                                                local v71 = {
                                                    ChatColor = v13
                                                };
                                                l_Util_0:SendSystemMessageToSelf(v70, l_l_v22_CurrentChannel_0_1, v71);
                                                return;
                                            else
                                                local l_l_v22_CurrentChannel_0_2 = l_v22_CurrentChannel_0;
                                                local l_TemporarilyUnavailable_3 = l_result_0.TemporarilyUnavailable;
                                                local v74 = v4:Get(l_TemporarilyUnavailable_3, v12[l_TemporarilyUnavailable_3]);
                                                local v75 = {
                                                    ChatColor = v13
                                                };
                                                l_Util_0:SendSystemMessageToSelf(v74, l_l_v22_CurrentChannel_0_2, v75);
                                            end;
                                        end;
                                        return;
                                    end;
                                end);
                                return true;
                            end;
                        end;
                    end;
                end;
            end;
        end;
    end;
end;
return {
    [l_Util_0.KEY_COMMAND_PROCESSOR_TYPE] = l_Util_0.COMPLETED_MESSAGE_PROCESSOR, 
    [l_Util_0.KEY_PROCESSOR_FUNCTION] = v76
};