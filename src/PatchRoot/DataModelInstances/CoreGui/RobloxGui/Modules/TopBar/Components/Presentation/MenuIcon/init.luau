local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local _ = game:GetService("GuiService");
local l_VRService_0 = game:GetService("VRService");
local l_GamepadService_0 = game:GetService("GamepadService");
local v5 = require(l_CorePackages_0.Packages.Roact);
local v6 = require(l_CorePackages_0.Packages.RoactRodux);
local v7 = require(l_CorePackages_0.Packages.t);
local v8 = require(l_CorePackages_0.Packages.UIBlox);
local l_Images_0 = v8.App.ImageSet.Images;
local l_withTooltip_0 = v8.App.Dialog.TooltipV2.withTooltip;
local l_TooltipOrientation_0 = v8.App.Dialog.Enum.TooltipOrientation;
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v13 = require(l_RobloxGui_0.Modules.Chrome.Enabled);
local _ = require(l_RobloxGui_0.Modules.TenFootInterface);
local v15 = require(l_RobloxGui_0.Modules.isNewInGameMenuEnabled);
local v16 = require(l_RobloxGui_0.Modules.InGameMenuConstants);
local _ = require(l_RobloxGui_0.Modules.PlayerList.PlayerListManager);
local v18 = require(l_RobloxGui_0.Modules.RobloxTranslator);
local v19 = require(script.Parent.BadgeOver12);
local v20 = require(l_RobloxGui_0.Modules.VR.VRHub);
local l_isSubjectToDesktopPolicies_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).isSubjectToDesktopPolicies;
local l_ExternalEventConnection_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).ExternalEventConnection;
local v23 = require(script.Parent.Parent.Parent.Flags.GetFFlagChangeTopbarHeightCalculation);
local v24 = require(script.Parent.Parent.Parent.Flags.GetFFlagEnableChromeBackwardsSignalAPI)();
local l_FFlagEnableUnibarFtuxTooltips_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableUnibarFtuxTooltips;
local l_Parent_0 = script.Parent.Parent;
local l_Actions_0 = l_Parent_0.Parent.Actions;
local v28 = require(l_Parent_0.Parent.Constants);
local v29 = require(l_Actions_0.SetGamepadMenuOpen);
local v30 = require(l_Actions_0.SetKeepOutArea);
local v31 = require(script.Parent.menuIconHoveredSignal);
local v32 = nil;
if v15() then
    v32 = require(l_RobloxGui_0.Modules.InGameMenuInit);
end;
local v33 = require(l_RobloxGui_0.Modules.isNewTiltIconEnabled);
local v34 = require(script.Parent.IconButton);
local v35 = v5.PureComponent:extend("MenuIcon");
local v36 = if v33() then v28.TopBarHeight - 4 else 32;
if v23() then
    v36 = v28.TopBarButtonHeight;
end;
local v37 = v13();
local v38 = v37 and 0.65 or 0.4;
local v39 = {
    Enum.KeyCode.Escape
};
local v40 = require(l_RobloxGui_0.Modules.Flags.GetFFlagVoiceRecordingIndicatorsEnabled);
v35.validateProps = v7.strictInterface({
    layoutOrder = v7.integer, 
    setGamepadMenuOpen = v7.callback, 
    iconScale = v7.optional(v7.number), 
    onAreaChanged = v7.optional(v7.callback), 
    showBadgeOver12 = v7.optional(v7.boolean)
});
v35.init = function(v41) --[[ Line: 78 ]] --[[ Name: init ]]
    -- upvalues: v37 (copy), v40 (copy), v13 (copy), l_VRService_0 (copy), v20 (copy), l_GamepadService_0 (copy), v32 (ref), v16 (copy), v15 (copy), l_RobloxGui_0 (copy), v31 (copy), l_FFlagEnableUnibarFtuxTooltips_0 (copy), v38 (copy), l_isSubjectToDesktopPolicies_0 (copy)
    v41:setState({
        vrShowMenuIcon = false, 
        showTooltip = false, 
        isHovering = false, 
        clickLatched = not v37 and nil, 
        enableFlashingDot = false
    });
    if v40() and not v13() then
        task.spawn(function() --[[ Line: 89 ]]
            -- upvalues: v41 (copy)
            v41:setState({
                enableFlashingDot = true
            });
        end);
    end;
    v41.menuIconActivated = function() --[[ Line: 96 ]]
        -- upvalues: v41 (copy), v37 (ref), l_VRService_0 (ref), v20 (ref), l_GamepadService_0 (ref), v32 (ref), v16 (ref), v15 (ref), l_RobloxGui_0 (ref)
        v41:setState({
            showTooltip = false, 
            isHovering = if v37 then nil else false, 
            clickLatched = v37 and true or nil
        });
        if l_VRService_0.VREnabled and (v20.ShowTopBar or l_GamepadService_0.GamepadCursorEnabled) then
            v32.openInGameMenu(v16.MainPagePageKey);
            return;
        elseif v15() then
            v32.openInGameMenu(v16.MainPagePageKey);
            return;
        else
            require(l_RobloxGui_0.Modules.Settings.SettingsHub):ToggleVisibility(v16.AnalyticsMenuOpenTypes.TopbarButton);
            return;
        end;
    end;
    v41.fireMenuIconHoveredSignal = function(v42) --[[ Line: 115 ]]
        -- upvalues: v31 (ref)
        v31:fire(v42);
    end;
    v41.menuIconOnHover = function() --[[ Line: 118 ]]
        -- upvalues: v37 (ref), v41 (copy), l_FFlagEnableUnibarFtuxTooltips_0 (ref), v38 (ref), v15 (ref), l_isSubjectToDesktopPolicies_0 (ref), v32 (ref), v16 (ref)
        if v37 then
            v41:setState({
                isHovering = true
            });
            if l_FFlagEnableUnibarFtuxTooltips_0 then
                v41.fireMenuIconHoveredSignal(true);
            end;
            delay(v38, function() --[[ Line: 127 ]]
                -- upvalues: v41 (ref)
                if v41.state.isHovering and not v41.state.clickLatched then
                    v41:setState({
                        showTooltip = true
                    });
                end;
            end);
        elseif l_FFlagEnableUnibarFtuxTooltips_0 then
            v41.fireMenuIconHoveredSignal(false);
        end;
        if v15() then
            if not l_isSubjectToDesktopPolicies_0() then
                return;
            else
                v32.openInGameMenu(v16.InitalPageKey);
                v32.setMenuIconTooltipOpen(false);
            end;
        end;
    end;
    v41.menuIconOnHoverEnd = function() --[[ Line: 150 ]]
        -- upvalues: v41 (copy), v37 (ref)
        v41:setState({
            showTooltip = false, 
            isHovering = false, 
            clickLatched = not v37 and nil
        });
    end;
    v41.showTopBarCallback = function() --[[ Line: 158 ]]
        -- upvalues: v41 (copy)
        if v41.state.vrShowMenuIcon ~= false then
            v41:setState({
                vrShowMenuIcon = false
            });
        end;
    end;
end;
v35.render = function(v43) --[[ Line: 168 ]] --[[ Name: render ]]
    -- upvalues: l_VRService_0 (copy), v28 (copy), v5 (copy), v34 (copy), v33 (copy), l_Images_0 (copy), v37 (copy), l_GamepadService_0 (copy), l_ExternalEventConnection_0 (copy), v20 (copy), v19 (copy), v13 (copy), v18 (copy), v39 (copy), l_CoreGui_0 (copy), l_TooltipOrientation_0 (copy), l_withTooltip_0 (copy), v36 (ref), v24 (copy)
    local v44 = not l_VRService_0.VREnabled or v43.state.vrShowMenuIcon;
    local function v46(v45) --[[ Line: 171 ]]
        -- upvalues: v43 (copy), v28 (ref)
        if v45 then
            v43.props.onAreaChanged(v28.MenuIconKeepOutAreaId, v45.AbsolutePosition, v45.AbsoluteSize);
        end;
    end;
    local v47 = v5.createElement(v34, {
        icon = if v33() then l_Images_0["icons/logo/block"] else "rbxasset://textures/ui/TopBar/coloredlogo.png", 
        iconSize = 24 * (v43.props.iconScale or 1), 
        useIconScaleAnimation = v33(), 
        onActivated = v43.menuIconActivated, 
        onHover = v43.menuIconOnHover, 
        onHoverEnd = if v37 then v43.menuIconOnHoverEnd else nil, 
        enableFlashingDot = v43.state.enableFlashingDot
    });
    local v48 = l_GamepadService_0 and v5.createElement(l_ExternalEventConnection_0, {
        event = v20.ShowTopBarChanged.Event or l_GamepadService_0:GetPropertyChangedSignal("GamepadCursorEnabled"), 
        callback = v43.showTopBarCallback
    });
    local v49 = if v43.props.showBadgeOver12 then v5.createElement(v19, {
        position = if v13() then UDim2.new(0, 1, 1, -(v28.TopBarButtonPadding + 1)) else UDim2.new(0, -4, 1, 4)
    }) else nil;
    if v37 then
        local v50 = "Roblox Menu";
        pcall(function() --[[ Line: 205 ]]
            -- upvalues: v50 (ref), v18 (ref)
            v50 = v18:FormatByKey("CoreScripts.TopBar.RobloxMenu");
        end);
        local v51 = {
            textAlignment = Enum.TextXAlignment.Center, 
            headerText = v50, 
            hotkeyCodes = v39
        };
        local v52 = {
            active = v43.state.showTooltip, 
            guiTarget = l_CoreGui_0, 
            preferredOrientation = l_TooltipOrientation_0.Bottom, 
            DisplayOrder = 10
        };
        return l_withTooltip_0(v51, v52, function(v53) --[[ Line: 220 ]]
            -- upvalues: v43 (copy), v28 (ref), v5 (ref), v44 (copy), v36 (ref), v49 (copy), v47 (copy), v48 (copy)
            local function v55(v54) --[[ Line: 221 ]]
                -- upvalues: v43 (ref), v28 (ref), v53 (copy)
                if v54 then
                    v43.props.onAreaChanged(v28.MenuIconKeepOutAreaId, v54.AbsolutePosition, v54.AbsoluteSize);
                end;
                v53(v54);
            end;
            return v5.createElement("Frame", {
                Visible = v44, 
                BackgroundTransparency = 1, 
                Size = UDim2.new(0, v36, 1, 0), 
                LayoutOrder = v43.props.layoutOrder, 
                [v5.Change.AbsoluteSize] = v55, 
                [v5.Change.AbsolutePosition] = v55
            }, {
                BadgeOver12 = v49, 
                Background = v47, 
                ShowTopBarListener = v48
            });
        end);
    else
        return v5.createElement("Frame", {
            Visible = v44, 
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, v36, 1, 0), 
            LayoutOrder = v43.props.layoutOrder, 
            [v5.Change.AbsoluteSize] = if not not v24 or v13() then v46 else nil, 
            [v5.Change.AbsolutePosition] = if not not v24 or v13() then v46 else nil
        }, {
            BadgeOver12 = v49, 
            Background = v47, 
            ShowTopBarListener = v48
        });
    end;
end;
return v6.UNSTABLE_connect2(nil, function(v56) --[[ Line: 260 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v29 (copy), v30 (copy)
    return {
        setGamepadMenuOpen = function(v57) --[[ Line: 262 ]] --[[ Name: setGamepadMenuOpen ]]
            -- upvalues: v56 (copy), v29 (ref)
            return v56(v29(v57));
        end, 
        onAreaChanged = function(v58, v59, v60) --[[ Line: 265 ]] --[[ Name: onAreaChanged ]]
            -- upvalues: v56 (copy), v30 (ref)
            return v56(v30(v58, v59, v60));
        end
    };
end)(v35);