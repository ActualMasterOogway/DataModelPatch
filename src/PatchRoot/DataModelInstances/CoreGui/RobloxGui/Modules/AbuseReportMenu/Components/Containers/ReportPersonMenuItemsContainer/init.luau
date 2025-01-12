local l_script_FirstAncestor_0 = script:FindFirstAncestor("AbuseReportMenu");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Players_0 = game:GetService("Players");
local l_RobloxGui_0 = game:GetService("CoreGui").RobloxGui;
local v4 = require(l_CorePackages_0.Packages.React);
local v5 = require(l_CorePackages_0.Packages.Cryo);
local v6 = require(l_script_FirstAncestor_0.MenuConfigs.getMenuItemsFromConfigs);
local v7 = require(l_script_FirstAncestor_0.Utility.getMenuItemSizings);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v9 = require(l_script_FirstAncestor_0.Components.Constants);
local v10 = require(l_script_FirstAncestor_0.MenuConfigs.Players.ReportPlayerMenuItemConfigList);
local v11 = require(l_script_FirstAncestor_0.Reducers.reportPersonUIStateReducer);
local v12 = require(l_script_FirstAncestor_0.Utility.handlePreselectedPlayer);
local l_default_0 = require(l_RobloxGui_0.Modules.VoiceChat.VoiceChatServiceManager).default;
local _ = require(l_RobloxGui_0.Modules.VoiceChat.VoiceUsersByProximity);
local l_PlayerMenuActions_0 = v9.PlayerMenuActions;
local function v18(v16, v17) --[[ Line: 28 ]] --[[ Name: alphabeticalSort ]]
    return v16.Name:lower() < v17.Name:lower();
end;
return function(v19) --[[ Line: 32 ]] --[[ Name: ReportPersonMenuItemsContainer ]]
    -- upvalues: v7 (copy), v4 (copy), v11 (copy), v9 (copy), l_default_0 (copy), v12 (copy), l_PlayerMenuActions_0 (copy), v18 (copy), l_Players_0 (copy), v5 (copy), v6 (copy), v10 (copy)
    local v20 = v7();
    local v21, v22 = v4.useReducer(v11, v9.InitPersonUIState);
    v4.useEffect(function() --[[ Line: 36 ]]
        -- upvalues: v19 (copy), v9 (ref), l_default_0 (ref), v12 (ref), v22 (copy), l_PlayerMenuActions_0 (ref)
        if v19.utilityProps.isReportTabVisible ~= true then
            return;
        else
            v19.utilityProps.analyticsDispatch({
                type = v9.AnalyticsActions.SwitchToPersonInitialSelections
            });
            l_default_0:asyncInit():andThen(function() --[[ Line: 44 ]]
                -- upvalues: v19 (ref), v12 (ref), v22 (ref), l_PlayerMenuActions_0 (ref)
                if v19.utilityProps.preselectedPlayer then
                    v12(v19.utilityProps.preselectedPlayer, true, v22, v19.utilityProps.analyticsDispatch);
                end;
                v22({
                    type = l_PlayerMenuActions_0.SetVoiceEnabled, 
                    enabled = true
                });
            end):catch(function() --[[ Line: 58 ]]
                -- upvalues: v19 (ref), v12 (ref), v22 (ref)
                if v19.utilityProps.preselectedPlayer then
                    v12(v19.utilityProps.preselectedPlayer, false, v22, v19.utilityProps.analyticsDispatch);
                end;
            end);
            return;
        end;
    end, {
        v19.utilityProps.isReportTabVisible
    });
    v4.useEffect(function() --[[ Line: 73 ]]
        -- upvalues: v21 (copy), v9 (ref), l_default_0 (ref), v18 (ref), l_Players_0 (ref), v5 (ref), v22 (copy), l_PlayerMenuActions_0 (ref)
        local v23 = {};
        if v21.methodOfAbuse == v9.AbuseMethods.VoiceChat then
            local v24 = l_default_0:getRecentUsersInteractionData();
            for _, v26 in pairs(v24) do
                table.insert(v23, v26.player);
            end;
            table.sort(v23, v18);
        elseif v21.methodOfAbuse == v9.AbuseMethods.TextChat or v21.methodOfAbuse == v9.AbuseMethods.Other or v21.methodOfAbuse == v9.AbuseMethods.Avatar or v21.methodOfAbuse == nil then
            v23 = l_Players_0:GetPlayers();
            table.sort(v23, v18);
        end;
        local v27 = false;
        local v28 = false;
        v23 = v5.List.filter(v23, function(v29) --[[ Line: 152 ]]
            -- upvalues: v21 (ref), v27 (ref), v28 (ref), l_Players_0 (ref)
            if v21.preselectedPlayer and v29.UserId == v21.preselectedPlayer.UserId then
                v27 = true;
            end;
            if v21.allegedAbuser and v29.UserId == v21.allegedAbuserId then
                v28 = true;
            end;
            local v30 = false;
            if v29 ~= l_Players_0.LocalPlayer then
                v30 = v29.UserId > 0;
            end;
            return v30;
        end);
        v22({
            type = l_PlayerMenuActions_0.UpdatePlayerNameMap, 
            playerObjects = v23
        });
        if v21.preselectedPlayer and v27 then
            v22({
                type = v9.PlayerMenuActions.UpdateAbuser, 
                abuseId = v21.preselectedPlayer.UserId, 
                abuser = v21.preselectedPlayer
            });
            v22({
                type = v9.PlayerMenuActions.SetPreselectedPlayer, 
                player = nil
            });
        elseif not v28 then
            v22({
                type = v9.PlayerMenuActions.UpdateAbuser, 
                abuseId = nil, 
                abuser = nil
            });
        end;
    end, {
        v21.methodOfAbuse, 
        v21.isVoiceEnabled, 
        v19.utilityProps.isReportTabVisible, 
        v21.preselectedPlayer
    });
    local v31 = v6(v21, v22, v19.utilityProps, v10, v19.isSmallPortraitViewport);
    local v32 = v5.Dictionary.join({
        Layout = v4.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, v20.ItemPadding)
        })
    }, v31);
    return v4.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1
    }, {
        MenuItems = v4.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1
        }, v32)
    });
end;