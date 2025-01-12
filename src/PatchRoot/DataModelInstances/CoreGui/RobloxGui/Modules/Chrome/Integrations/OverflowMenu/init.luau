local l_script_FirstAncestor_0 = script:FindFirstAncestor("Chrome");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_script_FirstAncestor_0.Service);
local v4 = require(l_script_FirstAncestor_0.ChromeShared.Service.ChromeUtils);
local v5 = require(l_script_FirstAncestor_0.Integrations.ChromeIntegrationUtils);
local l_MappedSignal_0 = v4.MappedSignal;
local v7 = require(l_script_FirstAncestor_0.Integrations.CommonIcon);
local v8 = require(l_script_FirstAncestor_0.Integrations.CommonFtuxTooltip);
local l_VRService_0 = game:GetService("VRService");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local v11 = require(l_RobloxGui_0.Modules.PlayerList.PlayerListManager);
local v12 = require(l_RobloxGui_0.Modules.EmotesMenu.EmotesMenuMaster);
local v13 = require(l_RobloxGui_0.Modules.BackpackScript);
local _ = require(l_script_FirstAncestor_0.ChromeShared.Service.Types);
local v15 = require(l_script_FirstAncestor_0.ChromeShared.Service.LocalStore);
local v16 = require(l_script_FirstAncestor_0.ChromeShared.Hooks.useMappedSignal);
local l_Signal_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Signal;
local v18 = require(l_CorePackages_0.Packages.UIBlox);
local l_Images_0 = v18.App.ImageSet.Images;
local l_useStyle_0 = v18.Core.Style.useStyle;
local l_ImageSetLabel_0 = v18.Core.ImageSet.ImageSetLabel;
local l_useCallback_0 = v2.useCallback;
local l_useEffect_0 = v2.useEffect;
local l_useMemo_0 = v2.useMemo;
local l_useState_0 = v2.useState;
local v26 = require(l_script_FirstAncestor_0.ChromeShared.Unibar.Constants);
local v27 = require(l_RobloxGui_0.Modules.SelfieView);
local l_InExperienceAppChatExperimentation_0 = require(l_CorePackages_0.Workspace.Packages.AppChat).App.InExperienceAppChatExperimentation;
local v29 = require(l_CorePackages_0.Workspace.Packages.Songbird);
local l_useCurrentSong_0 = v29.useCurrentSong;
local l_getFFlagSongbirdUnverifiedMusicState_0 = v29.getFFlagSongbirdUnverifiedMusicState;
local v32 = require(l_script_FirstAncestor_0.Flags.GetFFlagUnpinUnavailable);
local l_GetFFlagPostLaunchUnibarDesignTweaks_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagPostLaunchUnibarDesignTweaks;
local v34 = require(l_script_FirstAncestor_0.Flags.GetFStringConnectTooltipLocalStorageKey);
local l_FFlagEnableUnibarFtuxTooltips_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableUnibarFtuxTooltips;
local v36 = require(l_script_FirstAncestor_0.Flags.GetFIntRobloxConnectFtuxShowDelayMs);
local v37 = require(l_script_FirstAncestor_0.Flags.GetFIntRobloxConnectFtuxDismissDelayMs);
local v38 = require(l_script_FirstAncestor_0.Flags.GetFFlagFixCapturesAvailability);
local v39 = require(l_script_FirstAncestor_0.Flags.GetFFlagAddChromeActivatedEvents);
local l_GetFFlagEnableAppChatInExperience_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableAppChatInExperience;
local v41 = require(l_script_FirstAncestor_0.Flags.GetShouldShowPlatformChatBasedOnPolicy);
local v42 = require(l_script_FirstAncestor_0.Flags.GetFFlagShouldShowMusicFtuxTooltip);
local v43 = require(l_script_FirstAncestor_0.Flags.GetFStringMusicTooltipLocalStorageKey);
local v44 = require(l_script_FirstAncestor_0.Flags.GetFIntMusicFtuxShowDelayMs);
local v45 = require(l_script_FirstAncestor_0.Flags.GetFIntMusicFtuxDismissDelayMs);
local v46 = require(l_script_FirstAncestor_0.Flags.GetFFlagShouldShowMusicFtuxTooltipXTimes);
local v47 = require(l_script_FirstAncestor_0.Flags.GetFFlagFixShowMusicFtuxTooltipWithoutConnect);
local v48 = require(l_script_FirstAncestor_0.Flags.GetFStringMusicTooltipLocalStorageKey_v2);
local v49 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_GetFFlagAppChatRebrandStringUpdates_0 = v49.GetFFlagAppChatRebrandStringUpdates;
local l_GetFFlagRemoveChromeRobloxGuiReferences_0 = v49.GetFFlagRemoveChromeRobloxGuiReferences;
local v52 = game:DefineFastFlag("AppChatEnabledChromeDropdownFtuxTooltip", false);
local v53 = l_GetFFlagEnableAppChatInExperience_0() and l_FFlagEnableUnibarFtuxTooltips_0 and l_InExperienceAppChatExperimentation_0.default.variant.ShowPlatformChatChromeDropdownEntryPoint and v52 and v41();
local v54 = l_FFlagEnableUnibarFtuxTooltips_0 and v42();
local l_SELFIE_VIEW_ID_0 = v26.SELFIE_VIEW_ID;
local l_ICON_SIZE_0 = v26.ICON_SIZE;
checkCoreGui = function(v57, v58, v59) --[[ Line: 84 ]] --[[ Name: checkCoreGui ]]
    -- upvalues: v4 (copy), v3 (copy)
    v4.setCoreGuiAvailability(v57, v58, function(v60) --[[ Line: 89 ]]
        -- upvalues: v3 (ref), v57 (copy), v59 (copy)
        if not v60 then
            v3:removeUserPin(v57.id);
        end;
        if v59 then
            v59(v60);
            return;
        elseif v60 then
            v57.availability:available();
            return;
        else
            v57.availability:unavailable();
            return;
        end;
    end);
end;
local v61 = l_MappedSignal_0.new(v11:GetSetVisibleChangedEvent().Event, function() --[[ Line: 107 ]]
    -- upvalues: v11 (copy)
    return v11:GetSetVisible();
end);
local v64 = v3:register({
    id = "leaderboard", 
    label = "CoreScripts.TopBar.Leaderboard", 
    activated = function(_) --[[ Line: 114 ]] --[[ Name: activated ]]
        -- upvalues: l_VRService_0 (copy), l_RobloxGui_0 (copy), v11 (copy), l_GetFFlagRemoveChromeRobloxGuiReferences_0 (copy), v5 (copy), v4 (copy)
        if l_VRService_0.VREnabled then
            require(l_RobloxGui_0.Modules.InGameMenu).openPlayersPage();
            return;
        elseif v11:GetSetVisible() then
            v11:SetVisibility(not v11:GetSetVisible());
            return;
        elseif l_GetFFlagRemoveChromeRobloxGuiReferences_0() then
            v5.dismissRobloxMenuAndRun(function() --[[ Line: 123 ]]
                -- upvalues: v11 (ref)
                v11:SetVisibility(not v11:GetSetVisible());
            end);
            return;
        else
            v4.dismissRobloxMenuAndRun(function() --[[ Line: 127 ]]
                -- upvalues: v11 (ref)
                v11:SetVisibility(not v11:GetSetVisible());
            end);
            return;
        end;
    end, 
    isActivated = v39() and function() --[[ Line: 135 ]]
        -- upvalues: v61 (copy)
        return v61:get();
    end or nil, 
    components = {
        Icon = function(_) --[[ Line: 140 ]] --[[ Name: Icon ]]
            -- upvalues: v7 (copy), v61 (copy)
            return v7("icons/controls/leaderboardOff", "icons/controls/leaderboardOn", v61);
        end
    }
});
if not v38() and v32() then
    checkCoreGui(v64, Enum.CoreGuiType.PlayerList);
else
    v4.setCoreGuiAvailability(v64, Enum.CoreGuiType.PlayerList);
end;
local v65 = l_MappedSignal_0.new(v12.EmotesMenuToggled.Event, function() --[[ Line: 151 ]]
    -- upvalues: v12 (copy)
    return v12:isOpen();
end);
local v68 = v3:register({
    id = "emotes", 
    label = "CoreScripts.TopBar.Emotes", 
    activated = function(_) --[[ Line: 157 ]] --[[ Name: activated ]]
        -- upvalues: v12 (copy), l_GetFFlagRemoveChromeRobloxGuiReferences_0 (copy), v5 (copy), v4 (copy)
        if v12:isOpen() then
            v12:close();
            return;
        elseif l_GetFFlagRemoveChromeRobloxGuiReferences_0() then
            v5.dismissRobloxMenuAndRun(function() --[[ Line: 162 ]]
                -- upvalues: v12 (ref)
                v12:open();
            end);
            return;
        else
            v4.dismissRobloxMenuAndRun(function() --[[ Line: 166 ]]
                -- upvalues: v12 (ref)
                v12:open();
            end);
            return;
        end;
    end, 
    isActivated = v39() and function() --[[ Line: 173 ]]
        -- upvalues: v65 (copy)
        return v65:get();
    end or nil, 
    components = {
        Icon = function(_) --[[ Line: 178 ]] --[[ Name: Icon ]]
            -- upvalues: v7 (copy), v65 (copy)
            return v7("icons/controls/emoteOff", "icons/controls/emoteOn", v65);
        end
    }
});
local v69 = false;
local l_MenuIsVisible_0 = v12.MenuIsVisible;
updateEmoteAvailability = function() --[[ Line: 187 ]] --[[ Name: updateEmoteAvailability ]]
    -- upvalues: v69 (ref), l_MenuIsVisible_0 (ref), v68 (copy)
    if v69 and l_MenuIsVisible_0 then
        v68.availability:available();
        return;
    else
        v68.availability:unavailable();
        return;
    end;
end;
if not v38() and v32() then
    checkCoreGui(v68, Enum.CoreGuiType.EmotesMenu, function(v71) --[[ Line: 196 ]]
        -- upvalues: v69 (ref)
        v69 = v71;
        updateEmoteAvailability();
    end);
else
    v4.setCoreGuiAvailability(v68, Enum.CoreGuiType.EmotesMenu, function(v72) --[[ Line: 201 ]]
        -- upvalues: v69 (ref)
        v69 = v72;
        updateEmoteAvailability();
    end);
end;
v12.MenuVisibilityChanged.Event:Connect(function() --[[ Line: 207 ]]
    -- upvalues: l_MenuIsVisible_0 (ref), v12 (copy)
    l_MenuIsVisible_0 = v12.MenuIsVisible;
    updateEmoteAvailability();
end);
local v73 = l_MappedSignal_0.new(v13.StateChanged.Event, function() --[[ Line: 212 ]]
    -- upvalues: v13 (copy)
    return v13.IsOpen;
end);
local v76 = v3:register({
    id = "backpack", 
    label = "CoreScripts.TopBar.Inventory", 
    activated = function(_) --[[ Line: 218 ]] --[[ Name: activated ]]
        -- upvalues: v13 (copy), l_GetFFlagRemoveChromeRobloxGuiReferences_0 (copy), v5 (copy), v4 (copy)
        if v13.IsOpen then
            v13:OpenClose();
            return;
        elseif l_GetFFlagRemoveChromeRobloxGuiReferences_0() then
            v5.dismissRobloxMenuAndRun(function() --[[ Line: 223 ]]
                -- upvalues: v13 (ref)
                v13:OpenClose();
            end);
            return;
        else
            v4.dismissRobloxMenuAndRun(function() --[[ Line: 227 ]]
                -- upvalues: v13 (ref)
                v13:OpenClose();
            end);
            return;
        end;
    end, 
    isActivated = v39() and function() --[[ Line: 234 ]]
        -- upvalues: v73 (copy)
        return v73:get();
    end or nil, 
    components = {
        Icon = function(_) --[[ Line: 239 ]] --[[ Name: Icon ]]
            -- upvalues: v7 (copy), v73 (copy)
            return v7("icons/menu/inventoryOff", "icons/menu/inventory", v73);
        end
    }
});
if not v38() and v32() then
    checkCoreGui(v76, Enum.CoreGuiType.Backpack);
else
    v4.setCoreGuiAvailability(v76, Enum.CoreGuiType.Backpack);
end;
local v77 = nil;
local v78 = nil;
local v79 = nil;
if v39() then
    v77 = false;
    v78 = l_Signal_0.new();
    v79 = l_MappedSignal_0.new(v78, function() --[[ Line: 254 ]]
        -- upvalues: v77 (ref)
        return v77;
    end);
    task.defer(function() --[[ Line: 258 ]]
        -- upvalues: l_RobloxGui_0 (copy), v77 (ref), v78 (ref)
        local v80 = require(l_RobloxGui_0.Modules.Settings.SettingsHub);
        v80.CurrentPageSignal:connect(function(v81) --[[ Line: 260 ]]
            -- upvalues: v77 (ref), v80 (copy), v78 (ref)
            v77 = v81 == v80.Instance.ResetCharacterPage.Page.Name;
            v78:fire();
        end);
    end);
end;
local v85 = v3:register({
    id = "respawn", 
    label = "CoreScripts.InGameMenu.QuickActions.Respawn", 
    activated = function(_) --[[ Line: 270 ]] --[[ Name: activated ]]
        -- upvalues: l_RobloxGui_0 (copy), v39 (copy), v77 (ref)
        local v83 = require(l_RobloxGui_0.Modules.Settings.SettingsHub);
        if v39() then
            if v83:GetVisibility() then
                if v77 then
                    v83:SetVisibility(false);
                    return;
                else
                    v83:SwitchToPage(v83.Instance.ResetCharacterPage, true);
                    return;
                end;
            else
                v83:SetVisibility(true, false, v83.Instance.ResetCharacterPage);
                return;
            end;
        else
            v83:SetVisibility(true, false, v83.Instance.ResetCharacterPage);
            v83:SwitchToPage(v83.Instance.ResetCharacterPage);
            return;
        end;
    end, 
    isActivated = v39() and function() --[[ Line: 288 ]]
        -- upvalues: v79 (ref)
        return v79:get();
    end or nil, 
    components = {
        Icon = function(_) --[[ Line: 293 ]] --[[ Name: Icon ]]
            -- upvalues: v7 (copy)
            return v7("icons/actions/respawn");
        end
    }
});
updateRespawn = function(v86) --[[ Line: 299 ]] --[[ Name: updateRespawn ]]
    -- upvalues: v85 (copy), v32 (copy), v3 (copy)
    if v86 then
        v85.availability:available();
        return;
    else
        v85.availability:unavailable();
        if v32() then
            v3:removeUserPin(v85.id);
        end;
        return;
    end;
end;
task.defer(function() --[[ Line: 310 ]]
    -- upvalues: l_RobloxGui_0 (copy)
    local v87 = require(l_RobloxGui_0.Modules.Settings.SettingsHub);
    v87.RespawnBehaviourChangedEvent.Event:connect(updateRespawn);
    updateRespawn(v87:GetRespawnBehaviour());
end);
local v88 = v3:currentSubMenu();
local v89 = l_MappedSignal_0.new(v88:signal(), function() --[[ Line: 317 ]]
    -- upvalues: v88 (copy)
    return v88:get() == "nine_dot";
end);
if v3:orderAlignment():get() == Enum.HorizontalAlignment.Right then
    v89:connect(function(v90) --[[ Line: 322 ]]
        -- upvalues: v11 (copy)
        v11:SetMinimized(v90);
    end);
end;
HamburgerButton = function(v91) --[[ Line: 327 ]] --[[ Name: HamburgerButton ]]
    -- upvalues: l_useStyle_0 (copy), v89 (copy), v16 (copy), v46 (copy), l_useCurrentSong_0 (copy), l_useMemo_0 (copy), l_getFFlagSongbirdUnverifiedMusicState_0 (copy), v47 (copy), v53 (copy), v15 (copy), v34 (copy), v48 (copy), v26 (copy), v43 (copy), l_useState_0 (copy), v54 (copy), l_useEffect_0 (copy), l_useCallback_0 (copy), v8 (copy), l_GetFFlagAppChatRebrandStringUpdates_0 (copy), v36 (copy), v37 (copy), v44 (copy), v45 (copy), v2 (copy), l_ICON_SIZE_0 (copy), l_ImageSetLabel_0 (copy), l_Images_0 (copy), l_GetFFlagPostLaunchUnibarDesignTweaks_0 (copy), v27 (copy), v3 (copy), l_SELFIE_VIEW_ID_0 (copy)
    local l_toggleTransition_0 = v91.toggleTransition;
    local v93 = l_useStyle_0();
    local l_IconEmphasis_0 = v93.Theme.IconEmphasis;
    local v95 = v89 and v16(v89) or false;
    local v96 = false;
    if v46() then
        local v97 = l_useCurrentSong_0();
        local l_v97_0 = v97 --[[ copy: 6 -> 14 ]];
        v96 = l_useMemo_0(function() --[[ Line: 338 ]]
            -- upvalues: l_getFFlagSongbirdUnverifiedMusicState_0 (ref), l_v97_0 (copy)
            if l_getFFlagSongbirdUnverifiedMusicState_0() then
                if l_v97_0 then
                    return l_v97_0.meetsCriteria;
                else
                    return false;
                end;
            elseif l_v97_0 and l_v97_0.metadata then
                return l_v97_0.metadata.RecordingCode ~= "";
            else
                return false;
            end;
        end, {
            v97
        });
    end;
    local v99 = if v47() then not v53 or v15.getValue(v34()) or false else v15.getValue(v34());
    local v100 = if v46() then v15.getNumUniversesExposedTo(v48()) >= v26.MAX_NUM_UNIVERSES_SHOWN else v15.getValue(v43());
    local v101 = nil;
    local v102 = nil;
    local v103 = nil;
    if v46() then
        local v104, v105 = l_useState_0(v54 and v99 and v96);
        v101 = v104;
        v102 = v105;
        l_useEffect_0(function() --[[ Line: 363 ]]
            -- upvalues: v101 (ref), v54 (ref), v99 (copy), v96 (ref), v102 (ref)
            if not v101 and v54 and v99 and v96 then
                v102(true);
            end;
        end, {
            v101, 
            v54, 
            v99, 
            v96
        });
        v103 = l_useCallback_0(function() --[[ Line: 374 ]]
            -- upvalues: v15 (ref), v48 (ref)
            v15.addUniverseToExposureList(v48(), game.GameId);
        end, {
            game.GameId
        });
    else
        local v106, v107 = l_useState_0(v54 and v99);
        v101 = v106;
        v102 = v107;
    end;
    local v108 = l_useCallback_0(function() --[[ Line: 382 ]]
        -- upvalues: v102 (ref)
        v102(true);
    end);
    local v109 = if v53 then if not v54 or v99 then v8({
        isIconVisible = v91.visible, 
        headerKey = l_GetFFlagAppChatRebrandStringUpdates_0() and "CoreScripts.FTUX.Heading.CheckOutRobloxParty" or "CoreScripts.FTUX.Heading.CheckOutRobloxConnect", 
        bodyKey = l_GetFFlagAppChatRebrandStringUpdates_0() and "CoreScripts.FTUX.Label.PartyWithYourFriendsAnytime" or "CoreScripts.FTUX.Label.ChatWithYourFriendsAnytime", 
        localStorageKey = v34(), 
        showDelay = v36(), 
        dismissDelay = v37()
    }) else v8({
        isIconVisible = v91.visible, 
        headerKey = l_GetFFlagAppChatRebrandStringUpdates_0() and "CoreScripts.FTUX.Heading.CheckOutRobloxParty" or "CoreScripts.FTUX.Heading.CheckOutRobloxConnect", 
        bodyKey = l_GetFFlagAppChatRebrandStringUpdates_0() and "CoreScripts.FTUX.Label.PartyWithYourFriendsAnytime" or "CoreScripts.FTUX.Label.ChatWithYourFriendsAnytime", 
        localStorageKey = v34(), 
        showDelay = v36(), 
        dismissDelay = v37(), 
        onDismissed = if v54 then v108 else nil
    }) else nil;
    local v110 = if not v101 or v100 then nil else v8({
        isIconVisible = v91.visible, 
        headerKey = "CoreScripts.FTUX.Heading.MusicIsAvailable", 
        bodyKey = "CoreScripts.FTUX.Label.MusicViewCurrentTrack", 
        localStorageKey = if v46() then v48() .. "_" .. tostring(game.GameId) else v43(), 
        showDelay = v44(), 
        dismissDelay = v45(), 
        onDismissed = if v46() then v103 else nil
    });
    return v2.createElement("Frame", {
        Size = UDim2.new(0, l_ICON_SIZE_0, 0, l_ICON_SIZE_0), 
        BorderSizePixel = 0, 
        BackgroundColor3 = v93.Theme.BackgroundOnHover.Color, 
        BackgroundTransparency = l_toggleTransition_0:map(function(v111) --[[ Line: 446 ]]
            -- upvalues: v93 (copy)
            return 1 - (1 - v93.Theme.BackgroundOnHover.Transparency) * v111;
        end)
    }, {
        v2.createElement("UICorner", {
            Name = "Corner", 
            CornerRadius = UDim.new(1, 0)
        }), 
        v2.createElement(l_ImageSetLabel_0, {
            Name = "Overflow", 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            BackgroundTransparency = 1, 
            Image = l_Images_0["icons/common/hamburgermenu"], 
            Size = l_toggleTransition_0:map(function(v112) --[[ Line: 460 ]]
                -- upvalues: v26 (ref)
                v112 = 1 - v112;
                return UDim2.new(0, v26.ICON_SIZE * v112, 0, v26.ICON_SIZE * v112);
            end), 
            ImageColor3 = v93.Theme.IconEmphasis.Color, 
            ImageTransparency = l_toggleTransition_0:map(function(v113) --[[ Line: 466 ]]
                -- upvalues: v93 (copy)
                return v113 * v93.Theme.IconEmphasis.Transparency;
            end)
        }), 
        if l_GetFFlagPostLaunchUnibarDesignTweaks_0() then v2.createElement(l_ImageSetLabel_0, {
            Name = "Close", 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            BackgroundTransparency = 1, 
            Image = l_Images_0["icons/navigation/close"], 
            Size = l_toggleTransition_0:map(function(v114) --[[ Line: 477 ]]
                -- upvalues: v26 (ref)
                return UDim2.new(0, v26.MEDIUM_ICON_SIZE * v114, 0, v26.MEDIUM_ICON_SIZE * v114);
            end), 
            ImageColor3 = v93.Theme.IconEmphasis.Color, 
            ImageTransparency = l_toggleTransition_0:map(function(v115) --[[ Line: 482 ]]
                -- upvalues: v93 (copy)
                return (1 - v115) * v93.Theme.IconEmphasis.Transparency;
            end)
        }) else nil, 
        if not l_GetFFlagPostLaunchUnibarDesignTweaks_0() then v2.createElement("Frame", {
            Name = "X1", 
            Position = l_toggleTransition_0:map(function(_) --[[ Line: 490 ]]
                return UDim2.new(0.5, 0, 0.5, 0);
            end), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Size = l_toggleTransition_0:map(function(v117) --[[ Line: 494 ]]
                return UDim2.new(0, 16 * v117, 0, 2);
            end), 
            BorderSizePixel = 0, 
            BackgroundColor3 = l_IconEmphasis_0.Color, 
            BackgroundTransparency = l_toggleTransition_0:map(function(v118) --[[ Line: 499 ]]
                return 1 - v118;
            end), 
            Rotation = 45
        }) else nil, 
        if not l_GetFFlagPostLaunchUnibarDesignTweaks_0() then v2.createElement("Frame", {
            Name = "X2", 
            Position = l_toggleTransition_0:map(function(_) --[[ Line: 508 ]]
                return UDim2.new(0.5, 0, 0.5, 0);
            end), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Size = l_toggleTransition_0:map(function(v120) --[[ Line: 512 ]]
                return UDim2.new(0, 16 * v120, 0, 2);
            end), 
            BorderSizePixel = 0, 
            BackgroundColor3 = l_IconEmphasis_0.Color, 
            BackgroundTransparency = l_toggleTransition_0:map(function(v121) --[[ Line: 517 ]]
                return 1 - v121;
            end), 
            Rotation = -45
        }) else nil, 
        if not v27.useCameraOn() or v3:isWindowOpen(l_SELFIE_VIEW_ID_0) or v95 then nil else v2.createElement(v27.CameraStatusDot, {
            Name = "CameraStatusDot", 
            Position = UDim2.new(1, -4, 1, -7), 
            ZIndex = 2
        }), 
        v109, 
        v110
    });
end;
return v3:register({
    initialAvailability = v3.AvailabilitySignal.Pinned, 
    notification = v3:subMenuNotifications("nine_dot"), 
    id = "nine_dot", 
    label = "CoreScripts.TopBar.MoreMenu", 
    components = {
        Icon = function(v122) --[[ Line: 543 ]] --[[ Name: Icon ]]
            -- upvalues: v2 (copy)
            return v2.createElement(HamburgerButton, v122);
        end
    }
});