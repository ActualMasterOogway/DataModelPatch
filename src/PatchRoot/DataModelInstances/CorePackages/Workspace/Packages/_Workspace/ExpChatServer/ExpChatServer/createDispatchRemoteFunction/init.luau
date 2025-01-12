local l_RobloxReplicatedStorage_0 = game:GetService("RobloxReplicatedStorage");
local l_Chat_0 = game:GetService("Chat");
local l_TextChatService_0 = game:GetService("TextChatService");
local l_Parent_0 = script:FindFirstAncestor("ExpChatServer").Parent;
local l_List_0 = require(l_Parent_0.llama).List;
local v5 = require(l_Parent_0.ExpChatShared);
local v6 = v5.Logger:new("ExpChat/" .. script.Name);
local l_getFFlagExpChatWhisperSetting_0 = v5.Flags.getFFlagExpChatWhisperSetting;
local v8 = game:DefineFastFlag("StopNaivelyCreatingWhisperChannels", false);
local function _(v9, v10) --[[ Line: 15 ]] --[[ Name: canUsersTalkToEachOther ]]
    -- upvalues: v8 (copy), l_getFFlagExpChatWhisperSetting_0 (copy), l_TextChatService_0 (copy), l_Chat_0 (copy), v6 (copy)
    if v8 and v9 == v10 then
        return false;
    else
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 20 ]]
            -- upvalues: l_getFFlagExpChatWhisperSetting_0 (ref), l_TextChatService_0 (ref), v9 (copy), v10 (copy), l_Chat_0 (ref)
            if l_getFFlagExpChatWhisperSetting_0() then
                return l_TextChatService_0:CanUsersWhisperAsync(v9, v10);
            else
                return l_Chat_0:CanUsersChatAsync(v9, v10) and l_Chat_0:CanUsersChatAsync(v10, v9);
            end;
        end);
        local v13 = l_status_0 and l_result_0;
        v6:debug("CanUsersChat: {}", (tostring(v13)));
        return v13;
    end;
end;
local function _(v15, v16) --[[ Line: 34 ]] --[[ Name: whisperChannelAlreadyExists ]]
    -- upvalues: l_TextChatService_0 (copy)
    local v17 = string.format("RBXWhisper:%d_%d", v15 < v16 and v15 or v16, v16 < v15 and v15 or v16);
    return (l_TextChatService_0:FindFirstChild("TextChannels") or l_TextChatService_0):FindFirstChild(v17);
end;
local function v26(v19, v20) --[[ Line: 41 ]] --[[ Name: createWhisperChannel ]]
    -- upvalues: l_TextChatService_0 (copy), l_List_0 (copy)
    local v21 = string.format("RBXWhisper:%d_%d", v19 < v20 and v19 or v20, v20 < v19 and v19 or v20);
    local v22 = l_TextChatService_0:FindFirstChild("TextChannels") or l_TextChatService_0;
    local l_TextChannel_0 = Instance.new("TextChannel");
    l_TextChannel_0.Name = v21;
    l_TextChannel_0.Parent = v22;
    l_TextChannel_0:AddUserAsync(v19);
    l_TextChannel_0:AddUserAsync(v20);
    l_TextChannel_0.ChildRemoved:Connect(function(_) --[[ Line: 53 ]]
        -- upvalues: l_List_0 (ref), l_TextChannel_0 (copy)
        if l_List_0.count(l_TextChannel_0:GetChildren(), function(v25) --[[ Line: 54 ]]
            return v25:IsA("TextSource");
        end) < 2 then
            l_TextChannel_0:Destroy();
        end;
    end);
    return l_TextChannel_0;
end;
local function _(v27, v28, v29) --[[ Line: 66 ]] --[[ Name: createInstance ]]
    local v30 = Instance.new(v27);
    v30.Name = v28;
    v30.Parent = v29;
    return v30;
end;
return function() --[[ Line: 73 ]] --[[ Name: createDispatchRemoteFunction ]]
    -- upvalues: l_RobloxReplicatedStorage_0 (copy), v6 (copy), v8 (copy), l_TextChatService_0 (copy), l_getFFlagExpChatWhisperSetting_0 (copy), l_Chat_0 (copy), v26 (copy)
    local l_ExperienceChat_0 = l_RobloxReplicatedStorage_0:FindFirstChild("ExperienceChat");
    if not l_ExperienceChat_0 then
        local l_l_RobloxReplicatedStorage_0_0 = l_RobloxReplicatedStorage_0;
        local l_Folder_0 = Instance.new("Folder");
        l_Folder_0.Name = "ExperienceChat";
        l_Folder_0.Parent = l_l_RobloxReplicatedStorage_0_0;
        l_ExperienceChat_0 = l_Folder_0;
    end;
    local l_WhisperChat_0 = l_ExperienceChat_0:FindFirstChild("WhisperChat");
    if not l_WhisperChat_0 then
        local l_RemoteFunction_0 = Instance.new("RemoteFunction");
        l_RemoteFunction_0.Name = "WhisperChat";
        l_RemoteFunction_0.Parent = l_ExperienceChat_0;
        l_WhisperChat_0 = l_RemoteFunction_0;
    end;
    if l_WhisperChat_0:IsA("RemoteFunction") then
        l_WhisperChat_0.OnServerInvoke = function(v37, v38) --[[ Line: 82 ]]
            -- upvalues: v6 (ref), v8 (ref), l_TextChatService_0 (ref), l_getFFlagExpChatWhisperSetting_0 (ref), l_Chat_0 (ref), v26 (ref)
            v6:trace("WhisperChat remote invoked with: {}", (tostring(v38)));
            local v39 = tonumber(v38);
            local l_UserId_0 = v37.UserId;
            if v39 then
                if v8 then
                    local v41 = string.format("RBXWhisper:%d_%d", l_UserId_0 < v39 and l_UserId_0 or v39, v39 < l_UserId_0 and l_UserId_0 or v39);
                    local l_FirstChild_0 = (l_TextChatService_0:FindFirstChild("TextChannels") or l_TextChatService_0):FindFirstChild(v41);
                    if l_FirstChild_0 then
                        v6:trace("Whisper TextChannel already exists");
                        return l_FirstChild_0;
                    else
                        if v8 and l_UserId_0 == v39 then
                            v41 = false;
                        else
                            local l_status_1, l_result_1 = pcall(function() --[[ Line: 20 ]]
                                -- upvalues: l_getFFlagExpChatWhisperSetting_0 (ref), l_TextChatService_0 (ref), l_UserId_0 (copy), v39 (copy), l_Chat_0 (ref)
                                if l_getFFlagExpChatWhisperSetting_0() then
                                    return l_TextChatService_0:CanUsersWhisperAsync(l_UserId_0, v39);
                                else
                                    return l_Chat_0:CanUsersChatAsync(l_UserId_0, v39) and l_Chat_0:CanUsersChatAsync(v39, l_UserId_0);
                                end;
                            end);
                            local v45 = l_status_1 and l_result_1;
                            v6:debug("CanUsersChat: {}", (tostring(v45)));
                            v41 = v45;
                        end;
                        if v41 then
                            v6:trace("Creating whisper TextChannel");
                            return (v26(l_UserId_0, v39));
                        end;
                    end;
                else
                    local v46;
                    if v8 and l_UserId_0 == v39 then
                        v46 = false;
                    else
                        local l_status_2, l_result_2 = pcall(function() --[[ Line: 20 ]]
                            -- upvalues: l_getFFlagExpChatWhisperSetting_0 (ref), l_TextChatService_0 (ref), l_UserId_0 (copy), v39 (copy), l_Chat_0 (ref)
                            if l_getFFlagExpChatWhisperSetting_0() then
                                return l_TextChatService_0:CanUsersWhisperAsync(l_UserId_0, v39);
                            else
                                return l_Chat_0:CanUsersChatAsync(l_UserId_0, v39) and l_Chat_0:CanUsersChatAsync(v39, l_UserId_0);
                            end;
                        end);
                        local v49 = l_status_2 and l_result_2;
                        v6:debug("CanUsersChat: {}", (tostring(v49)));
                        v46 = v49;
                    end;
                    if v46 then
                        v6:trace("Creating whisper TextChannel");
                        return (v26(l_UserId_0, v39));
                    end;
                end;
            end;
            return nil;
        end;
    end;
    return l_WhisperChat_0;
end;