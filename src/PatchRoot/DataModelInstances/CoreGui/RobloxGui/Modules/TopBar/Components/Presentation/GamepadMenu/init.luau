local l_CorePackages_0 = game:GetService("CorePackages");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_GuiService_0 = game:GetService("GuiService");
local l_VRService_0 = game:GetService("VRService");
local l_TextChatService_0 = game:GetService("TextChatService");
local v6 = require(l_CorePackages_0.Packages.Roact);
local v7 = require(l_CorePackages_0.Packages.RoactRodux);
local v8 = require(l_CorePackages_0.Packages.Cryo);
local v9 = require(l_CorePackages_0.Packages.t);
local v10 = require(l_CorePackages_0.Packages.UIBlox);
local l_withStyle_0 = v10.Core.Style.withStyle;
local l_Images_0 = v10.App.ImageSet.Images;
local l_ImageSetLabel_0 = v10.Core.ImageSet.ImageSetLabel;
local v14 = require(script.MenuHeader);
local v15 = require(script.ChatIcon);
local v16 = require(script.MenuCell);
local v17 = require(script.QuickMenuControllerBar);
local v18 = require(script.MenuNavigationToggleDialog);
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v20 = require(l_RobloxGui_0.Modules.TenFootInterface);
local v21 = require(l_RobloxGui_0.Modules.BackpackScript);
local v22 = require(l_RobloxGui_0.Modules.EmotesMenu.EmotesMenuMaster);
local v23 = require(l_RobloxGui_0.Modules.ChatSelector);
local v24 = require(l_RobloxGui_0.Modules.PlayerList.PlayerListManager);
local v25 = require(l_RobloxGui_0.Modules.isNewInGameMenuEnabled);
local v26 = require(l_RobloxGui_0.Modules.InGameMenuConstants);
local v27 = require(l_RobloxGui_0.Modules.Chrome.Enabled);
local l_GameSettings_0 = UserSettings().GameSettings;
local l_Actions_0 = script.Parent.Parent.Parent.Actions;
local v30 = require(l_Actions_0.SetGamepadMenuOpen);
local v31 = l_Images_0["icons/logo/block"];
local v32 = l_Images_0["icons/menu/AR"];
local v33 = l_Images_0["icons/actions/respawn"];
local v34 = l_Images_0["icons/navigation/close"];
local v35 = l_Images_0["component_assets/circle_17"];
local v36 = Rect.new(8, 8, 9, 9);
local v37 = v6.PureComponent:extend("GamepadMenu");
local v38 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_FFlagAddMenuNavigationToggleDialog_0 = v38.FFlagAddMenuNavigationToggleDialog;
local l_GetFFlagToastNotificationsGamepadSupport_0 = v38.GetFFlagToastNotificationsGamepadSupport;
local l_GetFFlagReenableTextChatForTenFootInterfaces_0 = v38.GetFFlagReenableTextChatForTenFootInterfaces;
local v42 = game:DefineFastFlag("SaveChatVisibilityUserSettings", false);
local v43 = nil;
local v44 = nil;
local v45 = nil;
if l_GetFFlagToastNotificationsGamepadSupport_0() then
    task.spawn(function() --[[ Line: 92 ]]
        -- upvalues: v43 (ref), l_CoreGui_0 (copy), v44 (ref), v45 (ref)
        v43 = l_CoreGui_0:WaitForChild("ToastNotification", 3);
        v44 = if v43 ~= nil then v43:WaitForChild("ToastNotificationWrapper", 3) else nil;
        v45 = if v44 ~= nil then v44:FindFirstChild("Toast", true) else nil;
    end);
end;
v37.validateProps = v9.strictInterface({
    screenSize = v9.Vector2, 
    chatVersion = v9.optional(v9.EnumItem), 
    chatEnabled = v9.boolean, 
    leaderboardEnabled = v9.boolean, 
    emotesEnabled = v9.boolean, 
    backpackEnabled = v9.boolean, 
    respawnEnabled = v9.boolean, 
    leaderboardOpen = v9.boolean, 
    backpackOpen = v9.boolean, 
    emotesOpen = v9.boolean, 
    menuOpen = v9.boolean, 
    setGamepadMenuOpen = v9.callback, 
    isGamepadMenuOpen = v9.boolean
});
v37.init = function(v46) --[[ Line: 120 ]] --[[ Name: init ]]
    -- upvalues: l_GetFFlagToastNotificationsGamepadSupport_0 (copy), v45 (ref), v37 (copy), l_GuiService_0 (copy)
    v46:setState({
        selectedIndex = 1, 
        menuActions = {}
    });
    v46.boundMenuOpenActions = false;
    v46.lastMenuButtonPress = 0;
    v46.toggleChatVisibilityAction = function(_, v48, _) --[[ Line: 130 ]]
        -- upvalues: v46 (copy)
        if v48 == Enum.UserInputState.Begin then
            v46.toggleChatVisible();
        end;
    end;
    v46.toggleMenuVisibleAction = function(_, v51, _) --[[ Line: 136 ]]
        -- upvalues: l_GetFFlagToastNotificationsGamepadSupport_0 (ref), v46 (copy), v45 (ref)
        if l_GetFFlagToastNotificationsGamepadSupport_0() then
            if v46.props.menuOpen then
                return Enum.ContextActionResult.Pass;
            else
                local v53 = false;
                if v45 ~= nil then
                    v53 = v45.Visible;
                end;
                if v51 == Enum.UserInputState.Begin then
                    v46.lastMenuButtonPress = tick();
                    return Enum.ContextActionResult.Pass;
                elseif v51 == Enum.UserInputState.End and (not v53 or tick() - v46.lastMenuButtonPress < 1) then
                    v46.props.setGamepadMenuOpen(not v46.props.isGamepadMenuOpen);
                    return Enum.ContextActionResult.Sink;
                else
                    return Enum.ContextActionResult.Pass;
                end;
            end;
        elseif v51 ~= Enum.UserInputState.Begin or v46.props.menuOpen then
            return Enum.ContextActionResult.Pass;
        else
            v46.props.setGamepadMenuOpen(not v46.props.isGamepadMenuOpen);
            return Enum.ContextActionResult.Sink;
        end;
    end;
    v46.closeMenuAction = function(_, v55, _) --[[ Line: 165 ]]
        -- upvalues: v46 (copy)
        if v55 ~= Enum.UserInputState.Begin then
            return Enum.ContextActionResult.Pass;
        else
            v46.props.setGamepadMenuOpen(false);
            return Enum.ContextActionResult.Sink;
        end;
    end;
    v46.leaveGameMenuAction = function(_, v58, _) --[[ Line: 175 ]]
        -- upvalues: v37 (ref), v46 (copy)
        if v58 ~= Enum.UserInputState.Begin then
            return Enum.ContextActionResult.Pass;
        else
            v37.leaveGame();
            v46.props.setGamepadMenuOpen(false);
            return Enum.ContextActionResult.Sink;
        end;
    end;
    v46.respawnMenuAction = function(_, v61, _) --[[ Line: 187 ]]
        -- upvalues: v37 (ref), v46 (copy)
        if v61 ~= Enum.UserInputState.Begin then
            return Enum.ContextActionResult.Pass;
        else
            v37.respawnCharacter();
            v46.props.setGamepadMenuOpen(false);
            return Enum.ContextActionResult.Sink;
        end;
    end;
    v46.lastThumbStickMove = 0;
    v46.moveSelectionAction = function(_, v64, v65) --[[ Line: 201 ]]
        -- upvalues: v46 (copy)
        if v64 == Enum.UserInputState.Begin then
            if v65.KeyCode == Enum.KeyCode.DPadUp then
                if v46.state.selectedIndex > 1 then
                    v46:setState({
                        selectedIndex = v46.state.selectedIndex - 1
                    });
                end;
                return Enum.ContextActionResult.Sink;
            elseif v65.KeyCode == Enum.KeyCode.DPadDown then
                if v46.state.selectedIndex < #v46.state.menuActions then
                    v46:setState({
                        selectedIndex = v46.state.selectedIndex + 1
                    });
                end;
                return Enum.ContextActionResult.Sink;
            end;
        elseif v65.KeyCode == Enum.KeyCode.Thumbstick1 then
            if tick() - v46.lastThumbStickMove < 0.15 then
                return Enum.ContextActionResult.Pass;
            elseif v65.Position.Y > 0.8 then
                if v46.state.selectedIndex > 1 then
                    v46:setState({
                        selectedIndex = v46.state.selectedIndex - 1
                    });
                    v46.lastThumbStickMove = tick();
                end;
                return Enum.ContextActionResult.Pass;
            elseif v65.Position.Y < -0.8 then
                if v46.state.selectedIndex < #v46.state.menuActions then
                    v46:setState({
                        selectedIndex = v46.state.selectedIndex + 1
                    });
                    v46.lastThumbStickMove = tick();
                end;
                return Enum.ContextActionResult.Sink;
            end;
        end;
        return Enum.ContextActionResult.Pass;
    end;
    v46.goToTopAction = function(_, v67, _) --[[ Line: 243 ]]
        -- upvalues: v46 (copy)
        if v67 ~= Enum.UserInputState.Begin then
            return Enum.ContextActionResult.Pass;
        else
            v46:setState({
                selectedIndex = 1
            });
            return;
        end;
    end;
    v46.goToBottomAction = function(_, v70, _) --[[ Line: 253 ]]
        -- upvalues: v46 (copy)
        if v70 ~= Enum.UserInputState.Begin then
            return Enum.ContextActionResult.Pass;
        else
            v46:setState({
                selectedIndex = #v46.state.menuActions
            });
            return;
        end;
    end;
    v46.activateSelectionAction = function(_, v73, _) --[[ Line: 263 ]]
        -- upvalues: v46 (copy), l_GuiService_0 (ref)
        if v73 ~= Enum.UserInputState.Begin then
            return Enum.ContextActionResult.Pass;
        else
            local v75 = v46.state.menuActions[v46.state.selectedIndex];
            v46.props.setGamepadMenuOpen(false);
            l_GuiService_0:SetMenuIsOpen(false, "GamepadMenu");
            v75.onActivated();
            return Enum.ContextActionResult.Sink;
        end;
    end;
    v46.overlayDismiss = function() --[[ Line: 281 ]]
        -- upvalues: v46 (copy)
        v46.props.setGamepadMenuOpen(false);
    end;
end;
v37.openRootMenu = function() --[[ Line: 286 ]] --[[ Name: openRootMenu ]]
    -- upvalues: v25 (copy), l_RobloxGui_0 (copy), v26 (copy)
    if v25() then
        require(l_RobloxGui_0.Modules.InGameMenuInit).openInGameMenu(v26.MainPagePageKey);
        return;
    else
        require(l_RobloxGui_0.Modules.Settings.SettingsHub):SetVisibility(true, nil, nil, true, v26.AnalyticsMenuOpenTypes.PlayersTriggered);
        return;
    end;
end;
v37.openUnibarMenu = function() --[[ Line: 297 ]] --[[ Name: openUnibarMenu ]]
    -- upvalues: l_RobloxGui_0 (copy)
    require(l_RobloxGui_0.Modules.Chrome.Service):enableFocusNav();
end;
v37.closeUnibarMenu = function() --[[ Line: 302 ]] --[[ Name: closeUnibarMenu ]]
    -- upvalues: l_RobloxGui_0 (copy)
    require(l_RobloxGui_0.Modules.Chrome.Service):disableFocusNav();
end;
v37.toggleChatVisible = function() --[[ Line: 307 ]] --[[ Name: toggleChatVisible ]]
    -- upvalues: v23 (copy), v42 (copy), l_GameSettings_0 (copy)
    v23:ToggleVisibility();
    if v42 then
        l_GameSettings_0.ChatVisible = v23:GetVisibility();
    end;
end;
v37.focusChatBar = function() --[[ Line: 314 ]] --[[ Name: focusChatBar ]]
    -- upvalues: l_GetFFlagReenableTextChatForTenFootInterfaces_0 (copy), v23 (copy), v42 (copy), l_GameSettings_0 (copy)
    if l_GetFFlagReenableTextChatForTenFootInterfaces_0() then
        v23:SetVisible(true);
        if v42 then
            l_GameSettings_0.ChatVisible = true;
        end;
        v23:FocusChatBar();
    end;
end;
v37.toggleLeaderboard = function() --[[ Line: 324 ]] --[[ Name: toggleLeaderboard ]]
    -- upvalues: v25 (copy), l_RobloxGui_0 (copy), v24 (copy)
    if v25() then
        require(l_RobloxGui_0.Modules.InGameMenuInit).openPlayersPage();
        return;
    else
        v24:SetVisibility(not v24:GetSetVisible());
        return;
    end;
end;
v37.toggleEmotesMenu = function() --[[ Line: 334 ]] --[[ Name: toggleEmotesMenu ]]
    -- upvalues: v22 (copy)
    if v22:isOpen() then
        v22:close();
        return;
    else
        v22:open();
        return;
    end;
end;
v37.toggleBackpack = function() --[[ Line: 342 ]] --[[ Name: toggleBackpack ]]
    -- upvalues: v21 (copy)
    v21:OpenClose();
end;
v37.leaveGame = function() --[[ Line: 346 ]] --[[ Name: leaveGame ]]
    -- upvalues: v25 (copy), l_RobloxGui_0 (copy), v26 (copy)
    if v25() then
        require(l_RobloxGui_0.Modules.InGameMenuInit).openGameLeavePage();
        return;
    else
        local v76 = require(l_RobloxGui_0.Modules.Settings.SettingsHub);
        v76:SetVisibility(true, false, v76.Instance.LeaveGamePage, true, v26.AnalyticsMenuOpenTypes.GamepadLeaveGame);
        return;
    end;
end;
v37.respawnCharacter = function() --[[ Line: 363 ]] --[[ Name: respawnCharacter ]]
    -- upvalues: v25 (copy), l_RobloxGui_0 (copy), v26 (copy)
    if v25() then
        require(l_RobloxGui_0.Modules.InGameMenuInit).openCharacterResetPage();
        return;
    else
        local v77 = require(l_RobloxGui_0.Modules.Settings.SettingsHub);
        v77:SetVisibility(true, false, v77.Instance.ResetCharacterPage, true, v26.AnalyticsMenuOpenTypes.GamepadResetCharacter);
        return;
    end;
end;
v37.shouldShowChatMenuOption = function(v78, v79) --[[ Line: 379 ]] --[[ Name: shouldShowChatMenuOption ]]
    -- upvalues: v20 (copy), l_TextChatService_0 (copy)
    if not v20:IsEnabled() then
        return v79;
    else
        v78 = v78 or l_TextChatService_0.ChatVersion;
        return v79 and v78 == Enum.ChatVersion.TextChatService;
    end;
end;
v37.getMenuActionsFromProps = function(v80) --[[ Line: 392 ]] --[[ Name: getMenuActionsFromProps ]]
    -- upvalues: v31 (copy), v37 (copy), l_GetFFlagReenableTextChatForTenFootInterfaces_0 (copy), v15 (copy), v27 (copy), v32 (copy), v20 (copy), v33 (copy), v34 (copy)
    local v81 = {};
    table.insert(v81, {
        name = "Menu", 
        icon = v31, 
        iconComponent = nil, 
        localizationKey = "CoreScripts.TopBar.Menu", 
        onActivated = v37.openRootMenu
    });
    if l_GetFFlagReenableTextChatForTenFootInterfaces_0() and v37.shouldShowChatMenuOption(v80.chatVersion, v80.chatEnabled) then
        table.insert(v81, {
            name = "Chat", 
            icon = nil, 
            iconComponent = v15, 
            localizationKey = "CoreScripts.TopBar.Chat", 
            onActivated = v37.focusChatBar
        });
    end;
    if v27() then
        table.insert(v81, {
            name = "Unibar", 
            icon = v32, 
            iconComponent = nil, 
            localizationKey = "CoreScripts.TopBar.Title.ExperienceControls", 
            onActivated = v37.openUnibarMenu
        });
    end;
    if not l_GetFFlagReenableTextChatForTenFootInterfaces_0() and v80.chatEnabled and not v20:IsEnabled() then
        table.insert(v81, {
            name = "Chat", 
            icon = nil, 
            iconComponent = v15, 
            localizationKey = "CoreScripts.TopBar.Chat", 
            onActivated = v37.toggleChatVisible
        });
    end;
    if v80.leaderboardEnabled or v20:IsEnabled() then
        local v82 = nil;
        v82 = v80.leaderboardOpen and "rbxasset://textures/ui/TopBar/leaderboardOn.png" or "rbxasset://textures/ui/TopBar/leaderboardOff.png";
        table.insert(v81, {
            name = "Leaderboard", 
            icon = v82, 
            iconComponent = nil, 
            localizationKey = "CoreScripts.TopBar.Leaderboard", 
            onActivated = v37.toggleLeaderboard
        });
    end;
    if v80.emotesEnabled then
        local v83 = nil;
        v83 = v80.emotesOpen and "rbxasset://textures/ui/TopBar/emotesOn.png" or "rbxasset://textures/ui/TopBar/emotesOff.png";
        table.insert(v81, {
            name = "Emotes", 
            icon = v83, 
            iconComponent = nil, 
            localizationKey = "CoreScripts.TopBar.Emotes", 
            onActivated = v37.toggleEmotesMenu
        });
    end;
    if v80.backpackEnabled then
        local v84 = nil;
        v84 = v80.backpackOpen and "rbxasset://textures/ui/TopBar/inventoryOn.png" or "rbxasset://textures/ui/TopBar/inventoryOff.png";
        table.insert(v81, {
            name = "Inventory", 
            icon = v84, 
            iconComponent = nil, 
            localizationKey = "CoreScripts.TopBar.Inventory", 
            onActivated = v37.toggleBackpack
        });
    end;
    if v80.respawnEnabled then
        table.insert(v81, {
            name = "Respawn", 
            icon = v33, 
            iconComponent = nil, 
            localizationKey = "CoreScripts.TopBar.Respawn", 
            onActivated = v37.respawnCharacter
        });
    end;
    table.insert(v81, {
        name = "Leave", 
        icon = v34, 
        iconComponent = nil, 
        localizationKey = "CoreScripts.TopBar.Leave", 
        onActivated = v37.leaveGame
    });
    return v81;
end;
v37.getDerivedStateFromProps = function(v85, v86) --[[ Line: 511 ]] --[[ Name: getDerivedStateFromProps ]]
    -- upvalues: v37 (copy), v8 (copy)
    local v87 = v37.getMenuActionsFromProps(v85);
    local v88 = v86.selectedIndex or 1;
    if #v87 < v88 then
        v88 = #v87;
    end;
    return v8.Dictionary.join(v86, {
        selectedIndex = v88, 
        menuActions = v87
    });
end;
v37.render = function(v89) --[[ Line: 525 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), v6 (copy), v14 (copy), v16 (copy), l_GetFFlagReenableTextChatForTenFootInterfaces_0 (copy), v17 (copy), l_ImageSetLabel_0 (copy), v35 (copy), v36 (copy), l_FFlagAddMenuNavigationToggleDialog_0 (copy), v18 (copy)
    return l_withStyle_0(function(v90) --[[ Line: 526 ]]
        -- upvalues: v6 (ref), v14 (ref), v89 (copy), v16 (ref), l_GetFFlagReenableTextChatForTenFootInterfaces_0 (ref), v17 (ref), l_ImageSetLabel_0 (ref), v35 (ref), v36 (ref), l_FFlagAddMenuNavigationToggleDialog_0 (ref), v18 (ref)
        local l_Theme_0 = v90.Theme;
        local v92 = {
            Layout = v6.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Top, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            MenuHeader = v6.createElement(v14, {
                layoutOrder = 1, 
                height = 120
            })
        };
        for v93, v94 in ipairs(v89.state.menuActions) do
            v92[v94.name] = v6.createElement(v16, {
                layoutOrder = v93 + 1, 
                icon = v94.icon, 
                iconComponent = v94.iconComponent, 
                localizationKey = v94.localizationKey, 
                height = 56, 
                hasDivider = v93 ~= #v89.state.menuActions, 
                isSelected = v93 == v89.state.selectedIndex
            });
        end;
        local v95 = 120 + #v89.state.menuActions * 56;
        local v96 = 1;
        if v89.props.screenSize.Y * 0.75 < v95 then
            v96 = v89.props.screenSize.Y * 0.75 / v95;
        end;
        if v89.props.screenSize.X * 0.75 < 336 then
            local v97 = v89.props.screenSize.X * 0.75 / 336;
            if v97 < v96 then
                v96 = v97;
            end;
        end;
        if v96 < 1 then
            v92.UIScale = v6.createElement("UIScale", {
                Scale = v96
            });
        end;
        local l_isGamepadMenuOpen_0 = v89.props.isGamepadMenuOpen;
        local v99 = nil;
        if l_GetFFlagReenableTextChatForTenFootInterfaces_0() then
            if l_isGamepadMenuOpen_0 then
                v99 = v6.createElement(v17, {
                    chatMenuEnabled = v89.shouldShowChatMenuOption(v89.props.chatVersion, v89.props.chatEnabled)
                });
            end;
        else
            v99 = l_isGamepadMenuOpen_0 and v6.createElement(v17) or nil;
        end;
        local v100 = {
            Menu = v6.createElement(l_ImageSetLabel_0, {
                BackgroundTransparency = 1, 
                Image = v35, 
                SliceCenter = v36, 
                ScaleType = Enum.ScaleType.Slice, 
                ImageTransparency = l_Theme_0.BackgroundUIContrast.Transparency, 
                ImageColor3 = l_Theme_0.BackgroundUIContrast.Color, 
                Size = UDim2.fromOffset(336, v95), 
                Position = UDim2.fromScale(0.5, 0.5), 
                AnchorPoint = Vector2.new(0.5, 0.5)
            }, v92), 
            ControllerBar = v99, 
            MenuNavigationToggleDialog = if l_FFlagAddMenuNavigationToggleDialog_0 then v6.createElement(v18, {
                Position = UDim2.fromScale(0.5, 0.1)
            }) else nil
        };
        return v6.createElement("TextButton", {
            Visible = l_isGamepadMenuOpen_0, 
            Text = "", 
            BackgroundTransparency = l_Theme_0.Overlay.Transparency, 
            BackgroundColor3 = l_Theme_0.Overlay.Color, 
            Size = UDim2.fromScale(1, 1), 
            BorderSizePixel = 0, 
            ZIndex = 10, 
            [v6.Event.Activated] = v89.overlayDismiss
        }, v100);
    end);
end;
v37.didMount = function(v101) --[[ Line: 626 ]] --[[ Name: didMount ]]
    -- upvalues: l_VRService_0 (copy), l_ContextActionService_0 (copy)
    if not l_VRService_0.VREnabled then
        l_ContextActionService_0:BindCoreAction("TopBarGamepadToggleGamepadMenu", v101.toggleMenuVisibleAction, false, Enum.KeyCode.ButtonStart);
    end;
end;
v37.bindMenuOpenActions = function(v102) --[[ Line: 637 ]] --[[ Name: bindMenuOpenActions ]]
    -- upvalues: l_ContextActionService_0 (copy), l_GetFFlagReenableTextChatForTenFootInterfaces_0 (copy)
    v102.boundMenuOpenActions = true;
    l_ContextActionService_0:BindCoreAction("TopBarGamepadFreezeController", function() --[[ Line: 642 ]]

    end, false, Enum.UserInputType.Gamepad1);
    l_ContextActionService_0:BindCoreAction("TopBarGamepadCloseMenu", v102.closeMenuAction, false, Enum.KeyCode.ButtonB);
    l_ContextActionService_0:BindCoreAction("TopBarGamepadLeaveGame", v102.leaveGameMenuAction, false, Enum.KeyCode.ButtonX);
    l_ContextActionService_0:BindCoreAction("TopBarGamepadRespawnAction", v102.respawnMenuAction, false, Enum.KeyCode.ButtonY);
    l_ContextActionService_0:BindCoreAction("TopBarGamepadActivateSelection", v102.activateSelectionAction, false, Enum.KeyCode.ButtonA);
    l_ContextActionService_0:BindCoreAction("TopBarGamepadMoveSelection", v102.moveSelectionAction, false, Enum.KeyCode.Thumbstick1, Enum.KeyCode.DPadUp, Enum.KeyCode.DPadDown);
    l_ContextActionService_0:BindCoreAction("TopBarGamepadMoveSelectionTop", v102.goToTopAction, false, Enum.KeyCode.ButtonL2);
    l_ContextActionService_0:BindCoreAction("TopBarGamepadMoveSelectionBottom", v102.goToBottomAction, false, Enum.KeyCode.ButtonR2);
    if l_GetFFlagReenableTextChatForTenFootInterfaces_0() then
        l_ContextActionService_0:BindCoreAction("TopBarGamepadToggleChatVisibility", v102.toggleChatVisibilityAction, false, Enum.KeyCode.ButtonR1);
    end;
    l_ContextActionService_0:BindCoreAction("TopBarGamepadToggleGamepadMenu", v102.toggleMenuVisibleAction, false, Enum.KeyCode.ButtonStart);
end;
v37.unbindMenuOpenActions = function(v103) --[[ Line: 684 ]] --[[ Name: unbindMenuOpenActions ]]
    -- upvalues: l_ContextActionService_0 (copy), l_GetFFlagReenableTextChatForTenFootInterfaces_0 (copy)
    v103.boundMenuOpenActions = false;
    l_ContextActionService_0:UnbindCoreAction("TopBarGamepadFreezeController");
    l_ContextActionService_0:UnbindCoreAction("TopBarGamepadCloseMenu");
    l_ContextActionService_0:UnbindCoreAction("TopBarGamepadActivateSelection");
    l_ContextActionService_0:UnbindCoreAction("TopBarGamepadLeaveGame");
    l_ContextActionService_0:UnbindCoreAction("TopBarGamepadRespawnAction");
    l_ContextActionService_0:UnbindCoreAction("TopBarGamepadMoveSelection");
    l_ContextActionService_0:UnbindCoreAction("TopBarGamepadMoveSelectionTop");
    l_ContextActionService_0:UnbindCoreAction("TopBarGamepadMoveSelectionBottom");
    if l_GetFFlagReenableTextChatForTenFootInterfaces_0() then
        l_ContextActionService_0:UnbindCoreAction("TopBarGamepadToggleChatVisibility");
    end;
end;
v37.unbindAllActions = function(v104) --[[ Line: 701 ]] --[[ Name: unbindAllActions ]]
    -- upvalues: l_ContextActionService_0 (copy)
    if v104.boundMenuOpenActions then
        v104:unbindMenuOpenActions();
    end;
    l_ContextActionService_0:UnbindCoreAction("TopBarGamepadToggleGamepadMenu");
end;
v37.didUpdate = function(v105, v106, _) --[[ Line: 709 ]] --[[ Name: didUpdate ]]
    -- upvalues: l_GuiService_0 (copy), v27 (copy), v37 (copy)
    local v108 = nil;
    local v109 = nil;
    v108 = v106.isGamepadMenuOpen ~= v105.props.isGamepadMenuOpen;
    v109 = v105.props.isGamepadMenuOpen;
    if v108 then
        if v109 then
            v105:bindMenuOpenActions();
            if v105.state.selectedIndex ~= 1 then
                v105:setState({
                    selectedIndex = 1
                });
            end;
            v105.savedSelectedCoreObject = l_GuiService_0.SelectedCoreObject;
            l_GuiService_0.SelectedCoreObject = nil;
            v105.savedSelectedObject = l_GuiService_0.SelectedObject;
            l_GuiService_0.SelectedObject = nil;
            l_GuiService_0:SetMenuIsOpen(true, "GamepadMenu");
            if v27() then
                v37.closeUnibarMenu();
                return;
            end;
        else
            v105:unbindMenuOpenActions();
            l_GuiService_0:SetMenuIsOpen(false, "GamepadMenu");
        end;
    end;
end;
v37.willUnmount = function(v110) --[[ Line: 742 ]] --[[ Name: willUnmount ]]
    v110:unbindAllActions();
end;
return v7.UNSTABLE_connect2(function(v111) --[[ Line: 746 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: l_VRService_0 (copy)
    local l_topbarEnabled_0 = v111.displayOptions.topbarEnabled;
    return {
        screenSize = v111.displayOptions.screenSize, 
        chatEnabled = v111.coreGuiEnabled[Enum.CoreGuiType.Chat] and l_topbarEnabled_0 and not l_VRService_0.VREnabled, 
        leaderboardEnabled = v111.coreGuiEnabled[Enum.CoreGuiType.PlayerList] and l_topbarEnabled_0, 
        emotesEnabled = v111.moreMenu.emotesEnabled and v111.coreGuiEnabled[Enum.CoreGuiType.EmotesMenu] and l_topbarEnabled_0, 
        backpackEnabled = v111.coreGuiEnabled[Enum.CoreGuiType.Backpack] and l_topbarEnabled_0, 
        respawnEnabled = v111.respawn.enabled, 
        leaderboardOpen = v111.moreMenu.leaderboardOpen, 
        backpackOpen = v111.moreMenu.backpackOpen, 
        emotesOpen = v111.moreMenu.emotesOpen, 
        menuOpen = v111.displayOptions.menuOpen, 
        isGamepadMenuOpen = v111.displayOptions.isGamepadMenuOpen
    };
end, function(v113) --[[ Line: 771 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v30 (copy)
    return {
        setGamepadMenuOpen = function(v114) --[[ Line: 773 ]] --[[ Name: setGamepadMenuOpen ]]
            -- upvalues: v113 (copy), v30 (ref)
            return v113(v30(v114));
        end
    };
end)(v37);