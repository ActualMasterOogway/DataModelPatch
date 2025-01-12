local l_Players_0 = game:GetService("Players");
local l_Teams_0 = game:GetService("Teams");
local l_TextChatService_0 = game:GetService("TextChatService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChatServer");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_List_0 = require(l_Parent_0.llama).List;
local v6 = require(l_Parent_0.ExpChatShared);
local v7 = require(l_script_FirstAncestor_0.createDispatchRemoteFunction);
local v8 = require(script.createStore);
local l_watchForErrors_0 = v6.watchForErrors;
local l_countParticipantsInTextChannel_0 = v6.countParticipantsInTextChannel;
local l_Actions_0 = v6.Actions;
local l_PlayerAdded_0 = l_Actions_0.PlayerAdded;
local l_PlayerRemoved_0 = l_Actions_0.PlayerRemoved;
local l_Commands_0 = v6.Commands;
local l_Config_0 = v6.Config;
local l_Analytics_0 = v6.Analytics;
local v17 = v6.Logger:new("ExpChat/" .. script.Name);
local v18 = game:DefineFastFlag("FixTeamChannelReferenceTextChat", false);
local function _() --[[ Line: 33 ]]
    -- upvalues: l_List_0 (copy), l_TextChatService_0 (copy)
    return #l_List_0.filter(l_TextChatService_0:GetDescendants(), function(v19) --[[ Line: 34 ]]
        return v19:IsA("TextChannel");
    end);
end;
local function _() --[[ Line: 41 ]]
    -- upvalues: l_List_0 (copy), l_TextChatService_0 (copy)
    return #l_List_0.filter(l_TextChatService_0:GetDescendants(), function(v21) --[[ Line: 42 ]]
        return v21:IsA("TextChatCommand");
    end);
end;
return function(v23) --[[ Line: 49 ]]
    -- upvalues: v17 (copy), v8 (copy), v7 (copy), l_Analytics_0 (copy), l_watchForErrors_0 (copy), l_TextChatService_0 (copy), v18 (copy), l_Teams_0 (copy), l_Config_0 (copy), l_Players_0 (copy), l_Commands_0 (copy), l_List_0 (copy), l_countParticipantsInTextChannel_0 (copy), l_PlayerAdded_0 (copy), l_PlayerRemoved_0 (copy)
    v17:trace("mountServerApp started");
    local v24 = v8();
    v7();
    if v23 and v23.analytics then
        l_Analytics_0.with(v23.analytics);
    end;
    l_watchForErrors_0(game:GetService("ScriptContext"), v23.script, true);
    local v25 = {};
    if l_TextChatService_0.CreateDefaultTextChannels then
        v17:trace("Creating default TextChannels");
        local l_Folder_0 = Instance.new("Folder");
        l_Folder_0.Name = "TextChannels";
        l_Folder_0.Parent = l_TextChatService_0;
        local function v30(v27) --[[ Line: 70 ]] --[[ Name: findChannel ]]
            -- upvalues: l_TextChatService_0 (ref)
            for _, v29 in pairs(l_TextChatService_0:GetDescendants()) do
                if v29:IsA("TextChannel") and v29.Name == v27 then
                    return v29;
                end;
            end;
            return nil;
        end;
        local l_v30_0 = v30 --[[ copy: 4 -> 17 ]];
        local l_l_Folder_0_0 = l_Folder_0 --[[ copy: 3 -> 18 ]];
        local function _(v33) --[[ Line: 80 ]] --[[ Name: addChannel ]]
            -- upvalues: l_v30_0 (copy), l_l_Folder_0_0 (copy)
            local v34 = l_v30_0(v33);
            if not v34 then
                v34 = Instance.new("TextChannel");
                v34.Name = v33;
                v34.Parent = l_l_Folder_0_0;
            end;
            return v34;
        end;
        local function v40(v36, v37) --[[ Line: 92 ]] --[[ Name: findTextSourceFromChannelWithUserId ]]
            for _, v39 in pairs(v36:GetChildren()) do
                if v39:IsA("TextSource") and v39.UserId == v37 then
                    return v39;
                end;
            end;
            return nil;
        end;
        local function v54(v41) --[[ Line: 102 ]] --[[ Name: createTeamChannel ]]
            -- upvalues: l_v30_0 (copy), l_l_Folder_0_0 (copy), v17 (ref), v18 (ref), v40 (copy)
            local v42 = "RBXTeam" .. tostring(v41.TeamColor.Name);
            local v43 = l_v30_0(v42);
            if not v43 then
                v43 = Instance.new("TextChannel");
                v43.Name = v42;
                v43.Parent = l_l_Folder_0_0;
            end;
            local l_v43_0 = v43;
            v17:debug("Creating team TextChannel: {}", l_v43_0.Name);
            v41.PlayerAdded:Connect(function(v45) --[[ Line: 106 ]]
                -- upvalues: v18 (ref), v41 (copy), l_v30_0 (ref), l_l_Folder_0_0 (ref), l_v43_0 (copy)
                if v18 then
                    local v46 = "RBXTeam" .. tostring(v41.TeamColor.Name);
                    local v47 = l_v30_0(v46);
                    if not v47 then
                        v47 = Instance.new("TextChannel");
                        v47.Name = v46;
                        v47.Parent = l_l_Folder_0_0;
                    end;
                    v47:AddUserAsync(v45.UserId).CanSend = true;
                    return;
                else
                    l_v43_0:AddUserAsync(v45.UserId).CanSend = true;
                    return;
                end;
            end);
            v41.PlayerRemoved:Connect(function(v48) --[[ Line: 117 ]]
                -- upvalues: v18 (ref), v41 (copy), l_v30_0 (ref), l_l_Folder_0_0 (ref), v40 (ref), l_v43_0 (copy)
                if v18 then
                    local v49 = "RBXTeam" .. tostring(v41.TeamColor.Name);
                    local v50 = l_v30_0(v49);
                    if not v50 then
                        v50 = Instance.new("TextChannel");
                        v50.Name = v49;
                        v50.Parent = l_l_Folder_0_0;
                    end;
                    v49 = v40(v50, v48.UserId);
                    if v49 then
                        v49:Destroy();
                        return;
                    end;
                else
                    local v51 = v40(l_v43_0, v48.UserId);
                    if v51 then
                        v51:Destroy();
                    end;
                end;
            end);
            v41:GetPropertyChangedSignal("TeamColor"):Connect(function() --[[ Line: 135 ]]
                -- upvalues: v18 (ref), v41 (copy), l_v30_0 (ref), l_l_Folder_0_0 (ref), l_v43_0 (copy)
                if v18 then
                    local v52 = "RBXTeam" .. tostring(v41.TeamColor.Name);
                    local v53 = l_v30_0(v52);
                    if not v53 then
                        v53 = Instance.new("TextChannel");
                        v53.Name = v52;
                        v53.Parent = l_l_Folder_0_0;
                    end;
                    v53.Name = "RBXTeam" .. tostring(v41.TeamColor.Name);
                    return;
                else
                    l_v43_0.Name = "RBXTeam" .. tostring(v41.TeamColor.Name);
                    return;
                end;
            end);
        end;
        for _, v56 in pairs(l_Teams_0:GetTeams()) do
            if v56:IsA("Team") then
                v54(v56);
            end;
        end;
        local l_v54_0 = v54 --[[ copy: 7 -> 19 ]];
        l_Teams_0.ChildAdded:Connect(function(v58) --[[ Line: 151 ]]
            -- upvalues: l_v54_0 (copy)
            if v58:IsA("Team") then
                l_v54_0(v58);
            end;
        end);
        local l_v30_1 = v30 --[[ copy: 4 -> 20 ]];
        l_Teams_0.ChildRemoved:Connect(function(v60) --[[ Line: 157 ]]
            -- upvalues: l_v30_1 (copy), v17 (ref)
            if v60:IsA("Team") then
                local v61 = l_v30_1("RBXTeam" .. tostring(v60.TeamColor.Name));
                if v61 then
                    v17:debug("Destroying team TextChannel: {}", v61.Name);
                    v61:Destroy();
                end;
            end;
        end);
        for v62, _ in pairs(l_Config_0.DefaultChannelNames) do
            v17:trace("Creating default channel: {}", v62);
            local v64 = v30(v62);
            if not v64 then
                v64 = Instance.new("TextChannel");
                v64.Name = v62;
                v64.Parent = l_Folder_0;
            end;
            table.insert(v25, v64);
        end;
        local function v69(v65) --[[ Line: 172 ]] --[[ Name: addPlayerTextSourceToDefaultChannels ]]
            -- upvalues: v25 (copy), v17 (ref)
            for _, v67 in ipairs(v25) do
                v17:trace("Adding user {} to TextChannel: {}", tostring(v65.UserId), v67.Name);
                local v68 = v67:AddUserAsync(v65.UserId);
                if v67.Name == "RBXGeneral" then
                    v68.CanSend = true;
                elseif v67.Name == "RBXSystem" then
                    v68.CanSend = false;
                end;
            end;
        end;
        for _, v71 in pairs(l_Players_0:GetPlayers()) do
            if v71:IsA("Player") then
                v69(v71);
            end;
        end;
        l_Players_0.PlayerAdded:Connect(v69);
        l_Analytics_0.FireRccAnalyticsWithEventName("DefaultChannelsCreated");
    end;
    if l_TextChatService_0.CreateDefaultCommands then
        v17:trace("Creating default TextChatCommands");
        local l_Folder_1 = Instance.new("Folder");
        l_Folder_1.Name = "TextChatCommands";
        l_Folder_1.Parent = l_TextChatService_0;
        for _, v74 in ipairs(l_Commands_0.enabledCommands) do
            local l_TextChatCommand_0 = Instance.new("TextChatCommand");
            l_TextChatCommand_0.Name = v74.name;
            l_TextChatCommand_0.PrimaryAlias = v74.alias[1];
            l_TextChatCommand_0.SecondaryAlias = v74.alias[2] or "";
            l_TextChatCommand_0.Parent = l_Folder_1;
        end;
        l_Analytics_0.FireRccAnalyticsWithEventName("DefaultCommandsCreated");
    end;
    local v77 = #l_List_0.filter(l_TextChatService_0:GetDescendants(), function(v76) --[[ Line: 34 ]]
        return v76:IsA("TextChannel");
    end);
    local v79 = #l_List_0.filter(l_TextChatService_0:GetDescendants(), function(v78) --[[ Line: 42 ]]
        return v78:IsA("TextChatCommand");
    end);
    l_Analytics_0.FireRccAnalyticsWithEventName("ExperienceChatLoaded", {
        loadedChannels = v77, 
        loadedCommands = v79
    });
    v17:debug("Start watching for new channels and commands");
    l_TextChatService_0.DescendantAdded:Connect(function(v80) --[[ Line: 221 ]]
        -- upvalues: l_Analytics_0 (ref), l_List_0 (ref), l_TextChatService_0 (ref), l_countParticipantsInTextChannel_0 (ref)
        if v80:IsA("TextChannel") then
            l_Analytics_0.FireRccAnalyticsWithEventName("ChannelCreated", {
                channelName = v80.Name, 
                totalChannels = #l_List_0.filter(l_TextChatService_0:GetDescendants(), function(v81) --[[ Line: 34 ]]
                    return v81:IsA("TextChannel");
                end)
            });
            return;
        elseif v80:IsA("TextChatCommand") then
            l_Analytics_0.FireRccAnalyticsWithEventName("CommandCreated", {
                commandName = v80.Name
            });
            return;
        else
            if v80:IsA("TextSource") then
                local l_Parent_1 = v80.Parent;
                if l_Parent_1 and l_Parent_1:IsA("TextChannel") then
                    l_Analytics_0.FireRccAnalyticsWithEventName("ChannelJoined", {
                        channelName = l_Parent_1.Name, 
                        totalParticipants = l_countParticipantsInTextChannel_0(l_Parent_1)
                    });
                end;
            end;
            return;
        end;
    end);
    l_TextChatService_0.DescendantRemoving:Connect(function(v83) --[[ Line: 242 ]]
        -- upvalues: l_Analytics_0 (ref), l_List_0 (ref), l_TextChatService_0 (ref), l_countParticipantsInTextChannel_0 (ref)
        if v83:IsA("TextChannel") then
            l_Analytics_0.FireRccAnalyticsWithEventName("ChannelRemoved", {
                channelName = v83.Name, 
                totalChannels = #l_List_0.filter(l_TextChatService_0:GetDescendants(), function(v84) --[[ Line: 34 ]]
                    return v84:IsA("TextChannel");
                end) - 1
            });
            return;
        elseif v83:IsA("TextChatCommand") then
            l_Analytics_0.FireRccAnalyticsWithEventName("CommandRemoved", {
                commandName = v83.Name
            });
            return;
        else
            if v83:IsA("TextSource") then
                local l_Parent_2 = v83.Parent;
                if l_Parent_2 and l_Parent_2:IsA("TextChannel") then
                    l_Analytics_0.FireRccAnalyticsWithEventName("ChannelLeft", {
                        channelName = l_Parent_2.Name, 
                        totalParticipants = l_countParticipantsInTextChannel_0(l_Parent_2)
                    });
                end;
            end;
            return;
        end;
    end);
    for _, v87 in pairs(l_Players_0:GetPlayers()) do
        v24:dispatch(l_PlayerAdded_0(v87.UserId, v87.Name, v87.DisplayName));
    end;
    l_Players_0.PlayerAdded:Connect(function(v88) --[[ Line: 266 ]]
        -- upvalues: v24 (copy), l_PlayerAdded_0 (ref)
        v24:dispatch(l_PlayerAdded_0(v88.UserId, v88.Name, v88.DisplayName));
    end);
    l_Players_0.PlayerRemoving:Connect(function(v89) --[[ Line: 270 ]]
        -- upvalues: v24 (copy), l_PlayerRemoved_0 (ref)
        v24:dispatch(l_PlayerRemoved_0(v89.UserId));
    end);
end;