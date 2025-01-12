local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_GuiService_0 = game:GetService("GuiService");
local l_Players_0 = game:GetService("Players");
local l_RunService_0 = game:GetService("RunService");
local l_StarterGui_0 = game:GetService("StarterGui");
local l_VRService_0 = game:GetService("VRService");
local v8 = require(l_CorePackages_0.Packages.Cryo);
local v9 = require(l_CorePackages_0.Packages.Otter);
local v10 = require(l_CorePackages_0.Packages.React);
local v11 = require(l_CorePackages_0.Packages.Roact);
local v12 = require(l_CorePackages_0.Packages.RoactRodux);
local v13 = require(l_CorePackages_0.Packages.UIBlox);
local l_BaseMenu_0 = v13.App.Menu.BaseMenu;
local l_SystemBar_0 = v13.App.Navigation.SystemBar;
local l_Placement_0 = v13.App.Navigation.Enum.Placement;
local l_Panel3D_0 = v13.Core.VR.Panel3D;
local l_Constants_0 = v13.Core.VR.Constants;
local l_ImageSetLabel_0 = v13.Core.ImageSet.ImageSetLabel;
local l_withStyle_0 = v13.Core.Style.withStyle;
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v22 = require(l_RobloxGui_0.Modules.RobloxTranslator);
local v23 = require(l_RobloxGui_0.Modules.VR.VRHub);
local l_VRUtil_0 = require(l_CorePackages_0.Workspace.Packages.VrCommon).VRUtil;
local l_ExternalEventConnection_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).ExternalEventConnection;
local l_UIManager_0 = l_RobloxGui_0:WaitForChild("Modules"):WaitForChild("UIManager");
local l_PanelType_0 = require(l_UIManager_0.Constants).PanelType;
local v28 = require(l_UIManager_0.registerRoactPanel);
local v29 = require(l_UIManager_0.UIManager);
local v30 = require(l_UIManager_0.Constants);
local v31 = require(l_RobloxGui_0.Modules.InGameMenuConstants);
local l_GameSettings_0 = UserSettings().GameSettings;
local v33 = require(l_RobloxGui_0.Modules.InGameMenuInit);
local v34 = require(l_RobloxGui_0.Modules.ChatSelector);
local v35 = v11.PureComponent:extend("TopBarApp");
local v36 = require(script.Parent.VRBarSeparator);
local v37 = require(script.Parent.VRBarVoiceIcon);
local v38 = require(l_RobloxGui_0.Modules.EmotesMenu.EmotesMenuMaster);
local v39 = require(l_RobloxGui_0.Modules.BackpackScript);
local v40 = require(l_RobloxGui_0.Modules.PlayerList.PlayerListManager);
local l_StarterPlayer_0 = game:GetService("StarterPlayer");
local l_game_EngineFeature_0 = game:GetEngineFeature("EnableVRBottomBarWorksBehindObjects");
local v43 = require(l_RobloxGui_0.Modules.Flags.FFlagVRMoveVoiceIndicatorToBottomBar);
local v44 = require(l_RobloxGui_0.Modules.Flags.FFlagVRBottomBarDebugPositionConfig);
local v45 = require(l_RobloxGui_0.Modules.Flags.FIntVRBottomBarPositionOffsetVerticalNumber);
local v46 = require(l_RobloxGui_0.Modules.Flags.FIntVRBottomBarPositionOffsetDepthNumber);
local v47 = require(l_RobloxGui_0.Modules.Flags.FFlagVRBottomBarHighlightedLeaveGameIcon);
local v48 = require(l_RobloxGui_0.Modules.Flags.FFlagEnableSpatialRobloxGui);
local l_SplashScreenManager_0 = require(l_CorePackages_0.Workspace.Packages.SplashScreenManager).SplashScreenManager;
local v50 = (require(l_RobloxGui_0.Modules.Flags.GetFIntVRScaleGuiDistance) or 100)() * 0.01;
local function _(v51) --[[ Line: 79 ]] --[[ Name: safeRequire ]]
    local l_status_0, l_result_0 = pcall(require, v51);
    if l_status_0 then
        return l_result_0;
    else
        warn("Failure to Start CoreScript module " .. v51.Name .. ".\n" .. l_result_0);
        return;
    end;
end;
local v55 = {
    Y = v45 / 100, 
    Z = v46 / 100
};
local _ = 0.2 + v55.Z / 10;
local v57 = {
    Default = {
        dampingRatio = 1, 
        frequency = 4.5
    }, 
    Slower = {
        dampingRatio = 1, 
        frequency = 0.66
    }
};
local v58 = {
    iconOn = "rbxasset://textures/ui/MenuBar/icon_menu.png", 
    iconOff = "rbxasset://textures/ui/MenuBar/icon_menu.png", 
    onActivated = function() --[[ Line: 114 ]] --[[ Name: onActivated ]]
        -- upvalues: v23 (copy), v33 (copy), v31 (copy), l_RbxAnalyticsService_0 (copy)
        v23:SetShowTopBar(true);
        if not v33.getOpen() then
            v33.openInGameMenu(v31.MainPagePageKey);
            v23:SetShowMoreMenu(false);
        else
            v33.closeInGameMenu();
        end;
        l_RbxAnalyticsService_0:ReportCounter("VR-BottomBar-MainMenu");
    end
};
local v59 = {
    iconOn = "rbxasset://textures/ui/MenuBar/icon_maximize.png", 
    iconOff = "rbxasset://textures/ui/MenuBar/icon_minimize.png", 
    onActivated = function() --[[ Line: 130 ]] --[[ Name: onActivated ]]
        -- upvalues: v23 (copy), v33 (copy), l_RbxAnalyticsService_0 (copy)
        if not v23.ShowTopBar then
            v23:SetShowTopBar(false);
            v23:SetShowTopBar(true);
        else
            v23:SetShowTopBar(false);
            v33.closeInGameMenu();
        end;
        l_RbxAnalyticsService_0:ReportCounter("VR-BottomBar-ToggleGui");
    end
};
local v60 = {
    iconOn = "rbxasset://textures/ui/MenuBar/icon__backpack.png", 
    iconOff = "rbxasset://textures/ui/MenuBar/icon__backpack.png", 
    onActivated = function() --[[ Line: 146 ]] --[[ Name: onActivated ]]
        -- upvalues: v23 (copy), v39 (copy), l_RbxAnalyticsService_0 (copy)
        if not v23.ShowTopBar then
            v23:SetShowTopBar(true);
            if not v39.IsOpen then
                v39.OpenClose();
            end;
        else
            v39.OpenClose();
        end;
        l_RbxAnalyticsService_0:ReportCounter("VR-BottomBar-Backpack");
    end
};
local v61 = {
    iconOn = "rbxasset://textures/ui/MenuBar/icon_leaderboard.png", 
    iconOff = "rbxasset://textures/ui/MenuBar/icon_leaderboard.png", 
    onActivated = function() --[[ Line: 164 ]] --[[ Name: onActivated ]]
        -- upvalues: v23 (copy), v40 (copy), l_RbxAnalyticsService_0 (copy)
        if not v23.ShowTopBar then
            v23:SetShowTopBar(true);
            if not v40:GetSetVisible() then
                v40:SetVisibility(true);
            end;
        else
            v40:SetVisibility(not v40:GetSetVisible());
        end;
        l_RbxAnalyticsService_0:ReportCounter("VR-BottomBar-PlayerList");
    end
};
local v62 = {
    iconOn = "rbxasset://textures/ui/MenuBar/icon_emote.png", 
    iconOff = "rbxasset://textures/ui/MenuBar/icon_emote.png", 
    onActivated = function() --[[ Line: 182 ]] --[[ Name: onActivated ]]
        -- upvalues: v23 (copy), v38 (copy), l_RbxAnalyticsService_0 (copy)
        if not v23.ShowTopBar then
            v23:SetShowTopBar(true);
            if not v38:isOpen() then
                v38:open();
            end;
        elseif v38:isOpen() then
            v38:close();
        else
            v38:open();
        end;
        l_RbxAnalyticsService_0:ReportCounter("VR-BottomBar-Emotes");
    end
};
local v63 = {
    iconOn = "rbxasset://textures/ui/MenuBar/icon_chat.png", 
    iconOff = "rbxasset://textures/ui/MenuBar/icon_chat.png", 
    onActivated = function() --[[ Line: 204 ]] --[[ Name: onActivated ]]
        -- upvalues: v23 (copy), v34 (copy), l_GameSettings_0 (copy), l_RbxAnalyticsService_0 (copy)
        if not v23.ShowTopBar then
            v23:SetShowTopBar(true);
            if not v34:GetVisibility() then
                v34:ToggleVisibility();
                l_GameSettings_0.ChatVisible = v34:GetVisibility();
            end;
        else
            v34:ToggleVisibility();
            l_GameSettings_0.ChatVisible = v34:GetVisibility();
        end;
        l_RbxAnalyticsService_0:ReportCounter("VR-BottomBar-Chat");
    end
};
local v64 = {
    iconOn = "rbxasset://textures/ui/MenuBar/icon_safety_on.png", 
    iconOff = "rbxasset://textures/ui/MenuBar/icon_safety_on.png", 
    onActivated = function() --[[ Line: 224 ]] --[[ Name: onActivated ]]
        -- upvalues: v23 (copy), l_RbxAnalyticsService_0 (copy)
        v23:ToggleSafetyBubble();
        l_RbxAnalyticsService_0:ReportCounter("VR-BottomBar-Safety");
    end
};
local v65 = {
    iconOn = "rbxasset://textures/ui/MenuBar/icon_safety_off.png", 
    iconOff = "rbxasset://textures/ui/MenuBar/icon_safety_off.png", 
    onActivated = function() --[[ Line: 234 ]] --[[ Name: onActivated ]]
        -- upvalues: v23 (copy), l_RbxAnalyticsService_0 (copy)
        v23:ToggleSafetyBubble();
        l_RbxAnalyticsService_0:ReportCounter("VR-BottomBar-Safety");
    end
};
local v66 = {
    iconOn = "rbxasset://textures/ui/MenuBar/icon_leave.png", 
    iconOff = "rbxasset://textures/ui/MenuBar/icon_leave.png", 
    onActivated = function() --[[ Line: 244 ]] --[[ Name: onActivated ]]
        -- upvalues: v23 (copy), v33 (copy), v31 (copy), l_RbxAnalyticsService_0 (copy)
        v23:SetShowTopBar(true);
        v23:SetShowMoreMenu(false);
        if v33 then
            if not v33.getOpen() then
                v33.openInGameMenu(v31.MainPagePageKey);
            end;
            v33.openGameLeavePage();
        end;
        l_RbxAnalyticsService_0:ReportCounter("VR-BottomBar-LeaveGame");
    end
};
local v67 = {
    iconOn = "rbxasset://textures/ui/MenuBar/icon_leave_highlighted.png", 
    iconOff = "rbxasset://textures/ui/MenuBar/icon_leave_highlighted.png", 
    onActivated = v66.onActivated
};
local v68 = {
    iconOn = "rbxasset://textures/ui/MenuBar/icon_more.png", 
    iconOff = "rbxasset://textures/ui/MenuBar/icon_more.png", 
    onActivated = function() --[[ Line: 268 ]] --[[ Name: onActivated ]]
        -- upvalues: v23 (copy), l_RbxAnalyticsService_0 (copy)
        v23:SetShowTopBar(true);
        v23:SetShowMoreMenu(not v23.ShowMoreMenu);
        l_RbxAnalyticsService_0:ReportCounter("VR-BottomBar-More");
    end
};
local v69 = {
    iconComponent = v36, 
    itemSize = UDim2.new(0, 28, 0, 44)
};
local v70 = {
    icon = "rbxasset://textures/ui/MenuBar/icon_emote.png", 
    text = v22:FormatByKey("CoreScripts.TopBar.Emotes"), 
    onActivated = function() --[[ Line: 283 ]] --[[ Name: onActivated ]]
        -- upvalues: v62 (copy), l_RbxAnalyticsService_0 (copy)
        v62.onActivated();
        l_RbxAnalyticsService_0:ReportCounter("VR-BottomBar-MoreMenu-Emotes");
    end
};
local v71 = {
    icon = "rbxasset://textures/ui/MenuBar/icon_leaderboard.png", 
    text = v22:FormatByKey("CoreScripts.TopBar.Leaderboard"), 
    onActivated = function() --[[ Line: 292 ]] --[[ Name: onActivated ]]
        -- upvalues: v61 (copy), l_RbxAnalyticsService_0 (copy)
        v61.onActivated();
        l_RbxAnalyticsService_0:ReportCounter("VR-BottomBar-MoreMenu-PlayerList");
    end
};
local v72 = {
    icon = "rbxasset://textures/ui/MenuBar/icon__backpack.png", 
    text = v22:FormatByKey("CoreScripts.TopBar.Inventory"), 
    onActivated = function() --[[ Line: 301 ]] --[[ Name: onActivated ]]
        -- upvalues: v60 (copy), l_RbxAnalyticsService_0 (copy)
        v60.onActivated();
        l_RbxAnalyticsService_0:ReportCounter("VR-BottomBar-MoreMenu-Backpack");
    end
};
local function _(v73) --[[ Line: 308 ]] --[[ Name: roundOffset ]]
    return v73 >= 0 and math.floor(v73 * 10 + 0.5) / 10 or math.ceil(v73 * 10 - 0.5) / 10;
end;
v35.init = function(v75) --[[ Line: 313 ]] --[[ Name: init ]]
    -- upvalues: v55 (copy), v50 (copy), l_VRService_0 (copy), l_RobloxGui_0 (copy), v11 (copy), l_SplashScreenManager_0 (copy), v10 (copy), v37 (copy), v8 (copy), l_Players_0 (copy), l_RbxAnalyticsService_0 (copy), v58 (copy), v69 (copy), v59 (copy), v66 (copy), v48 (copy), v23 (copy), l_VRUtil_0 (copy), v9 (copy), v57 (copy), v44 (copy)
    local v76 = false;
    local v77 = {
        yOffset = v55.Y * v50, 
        zOffset = v55.Z * v50, 
        moreMenuOpen = false, 
        vrMenuOpen = true, 
        lookAway = false
    };
    local v78;
    if l_VRService_0.VREnabled then
        local l_UserGui_0 = l_RobloxGui_0.Modules.VR.UserGui;
        local l_status_1, l_result_1 = pcall(require, l_UserGui_0);
        if l_status_1 then
            v78 = l_result_1;
        else
            warn("Failure to Start CoreScript module " .. l_UserGui_0.Name .. ".\n" .. l_result_1);
            v78 = nil;
        end;
        v76 = v78;
    end;
    if not v76 then
        v78 = v11.None;
    end;
    v76 = false;
    v77.userGui = v78;
    v77.hidden = not l_SplashScreenManager_0.isFPSAtTarget();
    v75:setState(v77);
    v75.backpackHasItems = false;
    v75.emotesLoaded = false;
    v75.onTargetFPSSTateChange = function(v82) --[[ Line: 327 ]]
        -- upvalues: v75 (copy)
        v75:setState({
            hidden = not v82
        });
    end;
    l_SplashScreenManager_0.addStatusChangeListener(v75.onTargetFPSSTateChange);
    v75.getVoiceIcon = function() --[[ Line: 332 ]]
        -- upvalues: v10 (ref), v37 (ref), v8 (ref), l_Players_0 (ref), v75 (copy), l_RbxAnalyticsService_0 (ref)
        return {
            iconImageComponent = function(v83) --[[ Line: 334 ]] --[[ Name: iconImageComponent ]]
                -- upvalues: v10 (ref), v37 (ref), v8 (ref), l_Players_0 (ref)
                return v10.createElement(v37, v8.Dictionary.join(v83, {
                    userId = tostring(l_Players_0.LocalPlayer.UserId), 
                    iconStyle = "MicLight"
                }));
            end, 
            onActivated = function() --[[ Line: 343 ]] --[[ Name: onActivated ]]
                -- upvalues: v75 (ref), l_RbxAnalyticsService_0 (ref)
                if v75.props.voiceState == Enum.VoiceChatState.Failed then
                    v75.props.voiceChatServiceManager:RejoinPreviousChannel();
                else
                    v75.props.voiceChatServiceManager:ToggleMic("VRBottomBar");
                end;
                l_RbxAnalyticsService_0:ReportCounter("VR-BottomBar-Voice");
            end
        };
    end;
    v75.getDebugYOffsetUp = function() --[[ Line: 357 ]]
        -- upvalues: v75 (copy)
        return {
            iconOn = "rbxasset://textures/ui/MenuBar/arrow_up.png", 
            iconOff = "rbxasset://textures/ui/MenuBar/arrow_up.png", 
            onActivated = function() --[[ Line: 361 ]] --[[ Name: onActivated ]]
                -- upvalues: v75 (ref)
                v75:setState({
                    yOffset = v75.state.yOffset + 0.1
                });
            end
        };
    end;
    v75.getDebugYOffsetDown = function() --[[ Line: 370 ]]
        -- upvalues: v75 (copy)
        return {
            iconOn = "rbxasset://textures/ui/MenuBar/arrow_down.png", 
            iconOff = "rbxasset://textures/ui/MenuBar/arrow_down.png", 
            onActivated = function() --[[ Line: 374 ]] --[[ Name: onActivated ]]
                -- upvalues: v75 (ref)
                v75:setState({
                    yOffset = v75.state.yOffset - 0.1
                });
            end
        };
    end;
    v75.getDebugZOffsetUp = function() --[[ Line: 383 ]]
        -- upvalues: v75 (copy)
        return {
            iconOn = "rbxasset://textures/ui/MenuBar/arrow_left.png", 
            iconOff = "rbxasset://textures/ui/MenuBar/arrow_left.png", 
            onActivated = function() --[[ Line: 387 ]] --[[ Name: onActivated ]]
                -- upvalues: v75 (ref)
                v75:setState({
                    zOffset = v75.state.zOffset + 0.1
                });
            end
        };
    end;
    v75.getDebugZOffsetDown = function() --[[ Line: 396 ]]
        -- upvalues: v75 (copy)
        return {
            iconOn = "rbxasset://textures/ui/MenuBar/arrow_right.png", 
            iconOff = "rbxasset://textures/ui/MenuBar/arrow_right.png", 
            onActivated = function() --[[ Line: 400 ]] --[[ Name: onActivated ]]
                -- upvalues: v75 (ref)
                v75:setState({
                    zOffset = v75.state.zOffset - 0.1
                });
            end
        };
    end;
    v75.getDebugTextLabel = function() --[[ Line: 409 ]]
        -- upvalues: v75 (copy), v11 (ref)
        return {
            iconComponent = function(v84) --[[ Line: 411 ]] --[[ Name: iconComponent ]]
                -- upvalues: v75 (ref), v11 (ref)
                local l_yOffset_0 = v75.state.yOffset;
                local v86 = l_yOffset_0 >= 0 and math.floor(l_yOffset_0 * 10 + 0.5) / 10 or math.ceil(l_yOffset_0 * 10 - 0.5) / 10;
                local l_zOffset_0 = v75.state.zOffset;
                l_zOffset_0 = "Y " .. v86 .. ", Z " .. (l_zOffset_0 >= 0 and math.floor(l_zOffset_0 * 10 + 0.5) / 10 or math.ceil(l_zOffset_0 * 10 - 0.5) / 10);
                return v11.createElement("TextLabel", {
                    BackgroundTransparency = 1, 
                    Text = l_zOffset_0, 
                    TextColor3 = Color3.new(1, 1, 1), 
                    TextWrapped = true, 
                    TextScaled = true, 
                    Size = UDim2.fromScale(1, 1), 
                    [v11.Children] = v84[v11.Children]
                });
            end, 
            itemSize = UDim2.new(0, 44, 0, 44)
        };
    end;
    v75:setState({
        itemList = {
            v58, 
            v69, 
            v59, 
            v69, 
            v66
        }, 
        moreItemList = {}
    });
    v75.onShowTopBarChanged = function() --[[ Line: 434 ]]
        -- upvalues: v48 (ref), v23 (ref), v75 (copy)
        if v48 then
            return;
        else
            if not v23.ShowTopBar then
                v23:SetShowMoreMenu(false);
            end;
            v75:setState({
                vrMenuOpen = v23.ShowTopBar
            });
            return;
        end;
    end;
    v75.onShowMoreMenuChanged = function() --[[ Line: 446 ]]
        -- upvalues: v75 (copy), v23 (ref)
        v75:setState({
            moreMenuOpen = v23.ShowMoreMenu
        });
    end;
    v75.updateItemListState = function() --[[ Line: 452 ]]
        -- upvalues: v75 (copy)
        local v88, v89 = v75:updateItems();
        v75:setState({
            itemList = v88, 
            moreItemList = v89
        });
    end;
    v75.onBackpackItemAdded = function() --[[ Line: 460 ]]
        -- upvalues: v75 (copy)
        if not v75.backpackHasItems then
            v75.backpackHasItems = true;
            v75.updateItemListState();
        end;
    end;
    v75.onBackpackEmpty = function() --[[ Line: 467 ]]
        -- upvalues: v75 (copy)
        if v75.backpackHasItems then
            v75.backpackHasItems = false;
            v75.updateItemListState();
        end;
    end;
    v75.onEmotesLoaded = function(v90) --[[ Line: 474 ]]
        -- upvalues: v75 (copy)
        if v90 ~= v75.emotesLoaded then
            v75.emotesLoaded = v90;
            v75.updateItemListState();
        end;
    end;
    v75.onVREnabledChanged = function() --[[ Line: 481 ]]
        -- upvalues: v75 (copy), l_VRService_0 (ref), l_RobloxGui_0 (ref), v11 (ref)
        local v91 = false;
        local l_v75_0 = v75;
        local v93 = {};
        local v94;
        if l_VRService_0.VREnabled then
            local l_UserGui_1 = l_RobloxGui_0.Modules.VR.UserGui;
            local l_status_2, l_result_2 = pcall(require, l_UserGui_1);
            if l_status_2 then
                v94 = l_result_2;
            else
                warn("Failure to Start CoreScript module " .. l_UserGui_1.Name .. ".\n" .. l_result_2);
                v94 = nil;
            end;
            v91 = v94;
        end;
        if not v91 then
            v94 = v11.None;
        end;
        v91 = false;
        v93.userGui = v94;
        l_v75_0:setState(v93);
    end;
    v75.onRenderStepped = function() --[[ Line: 487 ]]
        -- upvalues: l_VRUtil_0 (ref), v75 (copy)
        local v98 = l_VRUtil_0.GetUserCFrameWorldSpace(Enum.UserCFrame.Head).LookVector.Y > -0.2;
        if v75.state.lookAway ~= v98 then
            v75:setState({
                lookAway = v98
            });
        end;
    end;
    local v99, v100 = v11.createBinding(0);
    v75.fadeTransparency = v99;
    v75.setFadeTransparency = v100;
    v75.fadeTransparencyMotor = v9.createSingleMotor(v75.fadeTransparency:getValue());
    v75.fadeTransparencyMotor:onStep(v75.setFadeTransparency);
    v75.fadeTransparencyMotor:setGoal(v9.spring(0, v57.Default));
    v75.getAlignedPanelPart = function() --[[ Line: 502 ]]
        -- upvalues: v75 (copy)
        local v101 = if v75.state.userGui then v75.state.userGui:getPanel() else nil;
        local v102 = v101 and v101:GetPart();
        if v102 and (v101:IsPositionLockedType() or v101:IsUIManagerManagedType()) and (v101:IsVisible() or v101.alwaysUpdatePosition) then
            return v102;
        else
            return;
        end;
    end;
    v75.bottomBarPanelOffsetCallback = function(v103) --[[ Line: 513 ]]
        -- upvalues: v75 (copy), l_VRUtil_0 (ref)
        local l_finalPosition_0 = v103.finalPosition;
        local l_cameraHeadScale_0 = v103.cameraHeadScale;
        local v106 = v75.getAlignedPanelPart();
        if v106 then
            local l_yOffset_1 = v75.state.yOffset;
            local l_zOffset_1 = v75.state.zOffset;
            local v109 = l_VRUtil_0.GetUserCFrameWorldSpace(Enum.UserCFrame.Head);
            local v110 = CFrame.new(0, 0, l_zOffset_1 * l_cameraHeadScale_0 - v106.Size.Z * 0.5);
            local v111 = v106.CFrame:ToWorldSpace(v110);
            l_finalPosition_0 = Vector3.new(v111.Position.X, v109.Position.Y + l_yOffset_1 * l_cameraHeadScale_0, v111.Position.Z);
        end;
        return l_finalPosition_0;
    end;
    v75.moreMenuPanelOffsetCallback = function(v112) --[[ Line: 536 ]]
        -- upvalues: v75 (copy), l_VRUtil_0 (ref), v50 (ref), v44 (ref)
        local l_finalPosition_1 = v112.finalPosition;
        local l_cameraHeadScale_1 = v112.cameraHeadScale;
        local v115 = v75.getAlignedPanelPart();
        if v115 then
            local v116 = v75.bottomBarPanelOffsetCallback(v112);
            local v117 = l_VRUtil_0.GetUserCFrameWorldSpace(Enum.UserCFrame.Head);
            local v118 = CFrame.new(v116, v117.Position);
            local v119 = (0.2 + v75.state.zOffset / 10) * v50;
            local v120 = v44 and (#v75.state.itemList - 3) / 2 * v119 or (#v75.state.itemList - 2.5) / 2 * v119;
            local v121 = v118:ToWorldSpace((CFrame.new(-v120 * l_cameraHeadScale_1, v119 / 2 * l_cameraHeadScale_1, -0.025)));
            l_finalPosition_1 = (CFrame.new(v121.Position) * v115.CFrame.Rotation):ToWorldSpace((CFrame.new(0, #v75.state.moreItemList * v119 / 2 * l_cameraHeadScale_1, 0.025))).Position;
        end;
        return l_finalPosition_1;
    end;
    v75.moreMenuPanelTiltCallback = function(v122) --[[ Line: 565 ]]
        -- upvalues: v75 (copy)
        local l_panelCFrame_0 = v122.panelCFrame;
        local v124 = v75.getAlignedPanelPart();
        if v124 then
            l_panelCFrame_0 = CFrame.new(l_panelCFrame_0.Position) * v124.CFrame.Rotation;
        end;
        return l_panelCFrame_0;
    end;
end;
v35.didMount = function(v125) --[[ Line: 576 ]] --[[ Name: didMount ]]
    -- upvalues: v38 (copy), v39 (copy)
    v125.emotesLoaded = v38:isEmotesLoaded();
    v125.backpackHasItems = v39.IsInventoryEmpty();
    v125.updateItemListState();
end;
v35.updateItems = function(v126) --[[ Line: 583 ]] --[[ Name: updateItems ]]
    -- upvalues: l_StarterGui_0 (copy), v48 (copy), v58 (copy), v69 (copy), v44 (copy), v59 (copy), l_StarterPlayer_0 (copy), v63 (copy), v43 (copy), v23 (copy), v64 (copy), v65 (copy), v47 (copy), v67 (copy), v66 (copy), v70 (copy), v71 (copy), v72 (copy), v68 (copy)
    local l_l_StarterGui_0_CoreGuiEnabled_0 = l_StarterGui_0:GetCoreGuiEnabled(Enum.CoreGuiType.Backpack);
    local l_l_StarterGui_0_CoreGuiEnabled_1 = l_StarterGui_0:GetCoreGuiEnabled(Enum.CoreGuiType.EmotesMenu);
    local l_l_StarterGui_0_CoreGuiEnabled_2 = l_StarterGui_0:GetCoreGuiEnabled(Enum.CoreGuiType.Chat);
    local l_l_StarterGui_0_CoreGuiEnabled_3 = l_StarterGui_0:GetCoreGuiEnabled(Enum.CoreGuiType.PlayerList);
    local v131 = nil;
    if v48 then
        v131 = {
            v58, 
            v69
        };
        if v44 then
            v131 = {
                v126.getDebugYOffsetUp(), 
                v126.getDebugYOffsetDown(), 
                v126.getDebugZOffsetUp(), 
                v126.getDebugZOffsetDown(), 
                v126.getDebugTextLabel(), 
                v69, 
                v58, 
                v69
            };
        end;
    else
        v131 = {
            v58, 
            v69, 
            v59
        };
        if v44 then
            v131 = {
                v126.getDebugYOffsetUp(), 
                v126.getDebugYOffsetDown(), 
                v126.getDebugZOffsetUp(), 
                v126.getDebugZOffsetDown(), 
                v126.getDebugTextLabel(), 
                v69, 
                v58, 
                v69, 
                v59
            };
        end;
    end;
    local v132 = l_l_StarterGui_0_CoreGuiEnabled_1 and not (l_StarterPlayer_0.UserEmotesEnabled and v126.emotesLoaded == false);
    local v133 = l_l_StarterGui_0_CoreGuiEnabled_0 and v126.backpackHasItems;
    if l_l_StarterGui_0_CoreGuiEnabled_2 then
        table.insert(v131, v63);
    end;
    if v43 and v126.props.voiceEnabled then
        table.insert(v131, v126.getVoiceIcon());
    end;
    table.insert(v131, v69);
    if v23.SafetyBubble and v23.SafetyBubble.enabled then
        table.insert(v131, v64);
    else
        table.insert(v131, v65);
    end;
    if v47 then
        if v23.ShowHighlightedLeaveGameIcon then
            table.insert(v131, v67);
        else
            table.insert(v131, v66);
        end;
    else
        table.insert(v131, v66);
    end;
    local v134 = {};
    if v132 then
        table.insert(v134, v70);
    end;
    if l_l_StarterGui_0_CoreGuiEnabled_3 then
        table.insert(v134, v71);
    end;
    if v133 then
        table.insert(v134, v72);
    end;
    if #v134 > 0 then
        table.insert(v131, v68);
    end;
    return v131, v134;
end;
v35.renderWithStyle = function(v135, v136) --[[ Line: 671 ]] --[[ Name: renderWithStyle ]]
    -- upvalues: v50 (copy), v44 (copy), v11 (copy), l_Panel3D_0 (copy), v48 (copy), v30 (copy), l_Constants_0 (copy), l_game_EngineFeature_0 (copy), l_GuiService_0 (copy), v28 (copy), l_PanelType_0 (copy), v29 (copy), l_SystemBar_0 (copy), l_Placement_0 (copy), l_BaseMenu_0 (copy), l_ImageSetLabel_0 (copy), v47 (copy), l_ExternalEventConnection_0 (copy), v23 (copy), l_StarterGui_0 (copy), v39 (copy), v38 (copy), l_RunService_0 (copy), l_VRService_0 (copy)
    local v137 = (0.2 + v135.state.zOffset / 10) * v50;
    local l_itemList_0 = v135.state.itemList;
    local l_moreItemList_0 = v135.state.moreItemList;
    local v140 = v44 and 7 or 1;
    if not v135.state.vrMenuOpen then
        v140 = v44 and 9 or 3;
    elseif v135.state.moreMenuOpen and #l_moreItemList_0 > 0 then
        v140 = #l_itemList_0;
    end;
    return v11.createFragment({
        BottomBarPanel3D = v11.createElement(l_Panel3D_0, {
            panelName = "BottomBar", 
            partSize = if v48 then Vector2.new((#l_itemList_0 - 1) * v30.BOTTOM_BAR_BASE_PART_SIZE, v30.BOTTOM_BAR_BASE_PART_SIZE) else Vector2.new((#l_itemList_0 - 1) * v137, v137), 
            virtualScreenSize = Vector2.new((#l_itemList_0 - 1) * 50, 50), 
            offset = v135.state.vrMenuOpen and CFrame.new(0, 0, 0) or CFrame.new(0, -0.5, 0), 
            offsetCallback = v135.bottomBarPanelOffsetCallback, 
            lerp = true, 
            tilt = 0, 
            anchoring = if v48 then l_Constants_0.AnchoringTypes.PanelManaged else l_Constants_0.AnchoringTypes.Head, 
            faceCamera = true, 
            curvature = 0, 
            alwaysOnTop = l_game_EngineFeature_0 and true or nil, 
            parent = l_game_EngineFeature_0 and l_GuiService_0.CoreGuiFolder or nil, 
            zOffset = 1, 
            connectPanelManagerFunction = v48 and function(v141) --[[ Line: 708 ]]
                -- upvalues: v28 (ref), l_PanelType_0 (ref), v29 (ref)
                if v141 then
                    v28(v141, l_PanelType_0.BottomBar);
                    return;
                else
                    v29:removeRoactPanel(l_PanelType_0.BottomBar);
                    return;
                end;
            end or nil
        }, {
            CanvasGroup = v11.createElement("CanvasGroup", {
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                GroupTransparency = v135.fadeTransparency, 
                Size = UDim2.new(1, 0, 1, 0)
            }, {
                SystemBar = v11.createElement(l_SystemBar_0, {
                    itemList = l_itemList_0, 
                    selection = v140, 
                    placement = l_Placement_0.Bottom, 
                    hidden = v135.state.hidden, 
                    onSafeAreaChanged = function() --[[ Line: 728 ]] --[[ Name: onSafeAreaChanged ]]

                    end, 
                    size = UDim2.new(1, 0, 1, 0), 
                    position = UDim2.new(), 
                    layoutOrder = 1, 
                    roundCorners = true, 
                    buttonStroke = true, 
                    bgTransparency = 0, 
                    sortOrder = Enum.SortOrder.LayoutOrder
                })
            })
        }), 
        MoreMenuPanel3D = v135.state.moreMenuOpen and v11.createElement(l_Panel3D_0, {
            panelName = "MoreMenu", 
            partSize = if v48 then Vector2.new(5 * v30.BOTTOM_BAR_BASE_PART_SIZE, #l_moreItemList_0 * v30.BOTTOM_BAR_BASE_PART_SIZE) else Vector2.new(5 * v137, #l_moreItemList_0 * v137), 
            virtualScreenSize = Vector2.new(250, #l_moreItemList_0 * 56 + 8), 
            offset = v135.state.vrMenuOpen and CFrame.new(0, 0, 0) or CFrame.new(0, -0.5, 0), 
            offsetCallback = v135.moreMenuPanelOffsetCallback, 
            lerp = true, 
            tilt = 0, 
            tiltCallback = v135.moreMenuPanelTiltCallback, 
            anchoring = if v48 then l_Constants_0.AnchoringTypes.PanelManaged else l_Constants_0.AnchoringTypes.Head, 
            faceCamera = true, 
            alwaysOnTop = l_game_EngineFeature_0 and true or nil, 
            parent = l_game_EngineFeature_0 and l_GuiService_0.CoreGuiFolder or nil, 
            connectPanelManagerFunction = v48 and function(v142) --[[ Line: 760 ]]
                -- upvalues: v28 (ref), l_PanelType_0 (ref), v29 (ref)
                if v142 then
                    v28(v142, l_PanelType_0.MoreMenu);
                    return;
                else
                    v29:removeRoactPanel(l_PanelType_0.MoreMenu);
                    return;
                end;
            end or nil, 
            zOffset = 2
        }, {
            Content = v11.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 1, 0)
            }, {
                MoreMenu = v11.createElement(l_BaseMenu_0, {
                    anchorPoint = Vector2.new(0.5, 1), 
                    buttonProps = l_moreItemList_0, 
                    position = UDim2.new(0.5, 0, 1, -8), 
                    background = v136.Theme.BackgroundContrast
                }), 
                Caret = v11.createElement(l_ImageSetLabel_0, {
                    AnchorPoint = Vector2.new(0.5, 1), 
                    BackgroundTransparency = 1, 
                    Image = "rbxasset://textures/ui/MenuBar/dropdown-arrow.png", 
                    ImageColor3 = Color3.fromRGB(25, 27, 29), 
                    Position = UDim2.new(0.5, 0, 1, 0), 
                    Size = UDim2.new(0, 24, 0, 10)
                })
            })
        }), 
        ShowHighlightedLeaveGameIconToggled = v47 and v11.createElement(l_ExternalEventConnection_0, {
            event = v23.ShowHighlightedLeaveGameIconToggled.Event, 
            callback = v135.updateItemListState
        }), 
        ShowTopBarChanged = v11.createElement(l_ExternalEventConnection_0, {
            event = v23.ShowTopBarChanged.Event, 
            callback = v135.onShowTopBarChanged
        }), 
        ShowMoreMenuChanged = v11.createElement(l_ExternalEventConnection_0, {
            event = v23.ShowMoreMenuChanged.Event, 
            callback = v135.onShowMoreMenuChanged
        }), 
        CoreGuiChanged = v11.createElement(l_ExternalEventConnection_0, {
            event = l_StarterGui_0.CoreGuiChangedSignal, 
            callback = v135.updateItemListState
        }), 
        SafetyBubbleToggled = v23.SafetyBubble and v11.createElement(l_ExternalEventConnection_0, {
            event = v23.SafetyBubble.Toggled.Event, 
            callback = v135.updateItemListState
        }), 
        BackpackItemAdded = v11.createElement(l_ExternalEventConnection_0, {
            event = v39.BackpackItemAdded.Event, 
            callback = v135.onBackpackItemAdded
        }), 
        BackpackEmpty = v11.createElement(l_ExternalEventConnection_0, {
            event = v39.BackpackEmpty.Event, 
            callback = v135.onBackpackEmpty
        }), 
        EmotesLoaded = v11.createElement(l_ExternalEventConnection_0, {
            event = v38.EmotesLoaded.Event, 
            callback = v135.onEmotesLoaded
        }), 
        RenderStepped = v11.createElement(l_ExternalEventConnection_0, {
            event = l_RunService_0.RenderStepped, 
            callback = v135.onRenderStepped
        }), 
        VREnabled = v11.createElement(l_ExternalEventConnection_0, {
            event = l_VRService_0:GetPropertyChangedSignal("VREnabled"), 
            callback = v135.onVREnabledChanged
        })
    });
end;
v35.render = function(v143) --[[ Line: 835 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy)
    return l_withStyle_0(function(v144) --[[ Line: 836 ]]
        -- upvalues: v143 (copy)
        return v143:renderWithStyle(v144);
    end);
end;
v35.didUpdate = function(v145, v146, v147) --[[ Line: 841 ]] --[[ Name: didUpdate ]]
    -- upvalues: v9 (copy), v57 (copy), v23 (copy), v43 (copy)
    if v147.lookAway ~= v145.state.lookAway or v147.vrMenuOpen ~= v145.state.vrMenuOpen then
        if not v145.state.vrMenuOpen and v145.state.lookAway then
            v145.fadeTransparencyMotor:setGoal(v9.spring(1, v57.Slower));
        else
            v145.fadeTransparencyMotor:setGoal(v9.spring(0, v57.Default));
        end;
    end;
    if v145.state.moreMenuOpen and #v145.state.moreItemList == 0 then
        v23:SetShowMoreMenu(false);
    end;
    if v43 and v146.voiceEnabled ~= v145.props.voiceEnabled then
        v145.updateItemListState();
        return;
    else
        if v147.yOffset ~= v145.state.yOffset or v147.zOffset ~= v145.state.zOffset then
            v145.updateItemListState();
        end;
        return;
    end;
end;
v35.willUnmount = function(v148) --[[ Line: 863 ]] --[[ Name: willUnmount ]]
    v148.fadeTransparencyMotor:stop();
end;
return v12.UNSTABLE_connect2(nil, nil)(v35);