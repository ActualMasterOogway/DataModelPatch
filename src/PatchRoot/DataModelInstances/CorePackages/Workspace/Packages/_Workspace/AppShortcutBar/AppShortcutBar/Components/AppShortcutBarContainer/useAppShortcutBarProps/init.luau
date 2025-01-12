local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppShortcutBar");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Cryo);
local l_FocusNavigationEventNameEnum_0 = require(l_Parent_0.FocusNavigationUtils).FocusNavigationEventNameEnum;
local v5 = require(l_Parent_0.ReactFocusNavigation);
local _ = require(l_script_FirstAncestor_0.Components.AppShortcutBar);
local l_LocalizationRoactContext_0 = require(l_Parent_0.Localization).LocalizationRoactContext;
local l_UiMode_0 = require(l_Parent_0.RobloxAppEnums).UiMode;
local l_useHeldProgressByEvent_0 = require(l_script_FirstAncestor_0.Hooks.AppShortcutBarContext).useHeldProgressByEvent;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useLastInputMethod_0 = require(l_Parent_0.FocusNavigationUtils).useLastInputMethod;
local l_useUiModeInfo_0 = require(l_Parent_0.RobloxAppHooks).useUiModeInfo;
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local l_FFlagEnableUniversalFocusNavigation_0 = require(l_Parent_0.SharedFlags).FFlagEnableUniversalFocusNavigation;
local v15 = {
    [Enum.KeyCode.Thumbstick1] = {
        vertical = "rbxasset://textures/ui/Controls/DesignSystem/Thumbstick1Vertical.png", 
        horizontal = "rbxasset://textures/ui/Controls/DesignSystem/Thumbstick1Horizontal.png"
    }, 
    [Enum.KeyCode.Thumbstick2] = {
        vertical = "rbxasset://textures/ui/Controls/DesignSystem/Thumbstick2Vertical.png", 
        horizontal = "rbxasset://textures/ui/Controls/DesignSystem/Thumbstick2Horizontal.png"
    }
};
local v16 = {
    Enum.KeyCode.ButtonA, 
    Enum.KeyCode.ButtonX, 
    Enum.KeyCode.ButtonY, 
    Enum.KeyCode.ButtonL3, 
    Enum.KeyCode.ButtonR3, 
    Enum.KeyCode.Thumbstick1, 
    Enum.KeyCode.Thumbstick2, 
    Enum.KeyCode.ButtonStart, 
    Enum.KeyCode.Slash, 
    Enum.KeyCode.Escape, 
    Enum.KeyCode.LeftBracket, 
    Enum.KeyCode.PageUp, 
    Enum.KeyCode.RightBracket, 
    Enum.KeyCode.PageDown
};
local v17 = {
    l_FocusNavigationEventNameEnum_0.HoldToPlay, 
    l_FocusNavigationEventNameEnum_0.Play, 
    l_FocusNavigationEventNameEnum_0.Search, 
    l_FocusNavigationEventNameEnum_0.SeeAll, 
    l_FocusNavigationEventNameEnum_0.DisplayStatsAndInfo, 
    l_FocusNavigationEventNameEnum_0.AcceptFriendRequest, 
    l_FocusNavigationEventNameEnum_0.AddFriend, 
    l_FocusNavigationEventNameEnum_0.IgnoreFriendRequest, 
    l_FocusNavigationEventNameEnum_0.OpenQuickMenu, 
    l_FocusNavigationEventNameEnum_0.NavigateBack, 
    l_FocusNavigationEventNameEnum_0.ScrollUp, 
    l_FocusNavigationEventNameEnum_0.ScrollDown
};
local v18 = {
    [Enum.KeyCode.ButtonA] = true, 
    [Enum.KeyCode.ButtonB] = true, 
    [Enum.KeyCode.ButtonX] = true, 
    [Enum.KeyCode.ButtonY] = true, 
    [Enum.KeyCode.ButtonL1] = true, 
    [Enum.KeyCode.ButtonL2] = true, 
    [Enum.KeyCode.ButtonL3] = true, 
    [Enum.KeyCode.ButtonR1] = true, 
    [Enum.KeyCode.ButtonR2] = true, 
    [Enum.KeyCode.ButtonR3] = true, 
    [Enum.KeyCode.ButtonSelect] = true, 
    [Enum.KeyCode.ButtonStart] = true, 
    [Enum.KeyCode.DPadDown] = true, 
    [Enum.KeyCode.DPadLeft] = true, 
    [Enum.KeyCode.DPadRight] = true, 
    [Enum.KeyCode.DPadUp] = true, 
    [Enum.KeyCode.Thumbstick1] = true, 
    [Enum.KeyCode.Thumbstick2] = true
};
local v19 = {
    [Enum.KeyCode.ButtonB] = true, 
    [Enum.KeyCode.ButtonL1] = true, 
    [Enum.KeyCode.ButtonR1] = true
};
local v20 = {
    [Enum.KeyCode.ButtonA] = "rbxasset://textures/ui/Controls/DesignSystem/ButtonA.png", 
    [Enum.KeyCode.ButtonB] = "rbxasset://textures/ui/Controls/DesignSystem/ButtonB.png", 
    [Enum.KeyCode.ButtonY] = "rbxasset://textures/ui/Controls/DesignSystem/ButtonY.png", 
    [Enum.KeyCode.ButtonX] = "rbxasset://textures/ui/Controls/DesignSystem/ButtonX.png", 
    [Enum.KeyCode.ButtonL3] = "rbxasset://textures/ui/Controls/DesignSystem/ButtonL3.png", 
    [Enum.KeyCode.ButtonR3] = "rbxasset://textures/ui/Controls/DesignSystem/ButtonR3.png", 
    [Enum.KeyCode.Thumbstick1] = "rbxasset://textures/ui/Controls/DesignSystem/Thumbstick1Directional.png", 
    [Enum.KeyCode.Thumbstick2] = "rbxasset://textures/ui/Controls/DesignSystem/Thumbstick2Directional.png", 
    [Enum.KeyCode.ButtonStart] = "rbxasset://textures/ui/Controls/DesignSystem/ButtonStart.png"
};
local v21 = {
    [Enum.KeyCode.ButtonY] = {
        [l_FocusNavigationEventNameEnum_0.Search] = v20[Enum.KeyCode.ButtonY], 
        [l_FocusNavigationEventNameEnum_0.DisplayStatsAndInfo] = v20[Enum.KeyCode.ButtonY]
    }, 
    [Enum.KeyCode.ButtonX] = {
        [l_FocusNavigationEventNameEnum_0.Play] = v20[Enum.KeyCode.ButtonX], 
        [l_FocusNavigationEventNameEnum_0.SeeAll] = v20[Enum.KeyCode.ButtonX], 
        [l_FocusNavigationEventNameEnum_0.AcceptFriendRequest] = v20[Enum.KeyCode.ButtonX], 
        [l_FocusNavigationEventNameEnum_0.AddFriend] = v20[Enum.KeyCode.ButtonX]
    }, 
    [Enum.KeyCode.ButtonA] = {
        [l_FocusNavigationEventNameEnum_0.HoldToPlay] = v20[Enum.KeyCode.ButtonA]
    }, 
    [Enum.KeyCode.ButtonR3] = {
        [l_FocusNavigationEventNameEnum_0.IgnoreFriendRequest] = v20[Enum.KeyCode.ButtonR3]
    }, 
    [Enum.KeyCode.ButtonStart] = {
        [l_FocusNavigationEventNameEnum_0.OpenQuickMenu] = v20[Enum.KeyCode.ButtonStart]
    }
};
local v22 = {
    [l_FocusNavigationEventNameEnum_0.Search] = "CommonUI.Features.Label.ControllerBar.Search", 
    [l_FocusNavigationEventNameEnum_0.SeeAll] = "Feature.Home.ActionSeeAll", 
    [l_FocusNavigationEventNameEnum_0.Play] = "Common.VisitGame.Label.Play", 
    [l_FocusNavigationEventNameEnum_0.DisplayStatsAndInfo] = "Feature.GameDetails.Label.LearnMore", 
    [l_FocusNavigationEventNameEnum_0.HoldToPlay] = "CommonUI.Features.Label.ControllerBar.ToPlaySuffix", 
    [l_FocusNavigationEventNameEnum_0.IgnoreFriendRequest] = "Feature.AddFriends.Action.IgnoreFriendRequest", 
    [l_FocusNavigationEventNameEnum_0.AcceptFriendRequest] = "Feature.Friends.Action.AcceptFriend", 
    [l_FocusNavigationEventNameEnum_0.AddFriend] = "Feature.PlayerSearchResults.Action.AddFriend", 
    [l_FocusNavigationEventNameEnum_0.OpenQuickMenu] = "Feature.Catalog.Heading.QuickMenu", 
    [l_FocusNavigationEventNameEnum_0.ScrollUp] = l_FFlagEnableUniversalFocusNavigation_0 and "Feature.Accessibility.Action.ScrollUp" or nil, 
    [l_FocusNavigationEventNameEnum_0.ScrollDown] = l_FFlagEnableUniversalFocusNavigation_0 and "Feature.Accessibility.Action.ScrollDown" or nil, 
    [l_FocusNavigationEventNameEnum_0.NavigateBack] = l_FFlagEnableUniversalFocusNavigation_0 and "CommonUI.Controls.Action.Back" or nil
};
local v23 = {
    [l_FocusNavigationEventNameEnum_0.HoldToPlay] = "CommonUI.Features.Label.ControllerBar.HoldPrefix"
};
local v24 = {
    [l_FocusNavigationEventNameEnum_0.HoldToPlay] = true
};
local function v32(v25, v26, v27) --[[ Line: 161 ]] --[[ Name: getLegacyInputBindings ]]
    -- upvalues: v15 (copy), v20 (copy)
    if v26.axes then
        local l_vertical_0 = v26.axes.vertical;
        local l_horizontal_0 = v26.axes.horizontal;
        local v30 = v15[v25];
        local v31 = {};
        if l_vertical_0 then
            table.insert(v31, {
                icon = v30.vertical, 
                text = v27:Format(l_vertical_0.key)
            });
        end;
        if l_horizontal_0 then
            table.insert(v31, {
                icon = v30.horizontal, 
                text = v27:Format(l_horizontal_0.key)
            });
        end;
        return v31;
    elseif v26.key then
        return {
            {
                icon = v20[v25], 
                text = v27:Format(v26.key)
            }
        };
    else
        return {};
    end;
end;
local function v34(v33) --[[ Line: 194 ]] --[[ Name: selectRoactGamepadBindings ]]
    if v33.GamepadBottomBar then
        return v33.GamepadBottomBar.boundInputs;
    else
        return nil;
    end;
end;
local function v54(v35, v36, v37, v38) --[[ Line: 198 ]] --[[ Name: getGamepadItems ]]
    -- upvalues: v16 (copy), v18 (copy), v19 (copy), v32 (copy), v21 (copy), v22 (copy), v23 (copy), v24 (copy)
    local v39 = {};
    for _, v41 in v16 do
        if v18[v41] and (not v38 or not v19[v41]) then
            if v38 then
                if not v19[v41] then
                    local v42 = v38[v41];
                    if v42 then
                        for _, v44 in (v32(v41, v42, v37)) do
                            table.insert(v39, v44);
                        end;
                    end;
                else
                    continue;
                end;
            end;
            local v45 = v35[v41];
            if v45 then
                local v46 = v21[v41];
                local v47 = if v46 then v46[v45] else nil;
                local v48 = v22[v45];
                local v49 = if v48 then v37:Format(v48) else nil;
                local v50 = v23[v45];
                local v51 = if v50 then v37:Format(v50) else nil;
                local v52 = v36[v45];
                local v53 = v24[v45];
                if v47 and v49 then
                    table.insert(v39, {
                        icon = v47, 
                        text = v49, 
                        actionText = v51, 
                        progress = v52, 
                        hasProgress = v53
                    });
                end;
            end;
        end;
    end;
    return v39;
end;
local function v71(v55, v56, v57) --[[ Line: 246 ]] --[[ Name: getKeyboardItems ]]
    -- upvalues: v18 (copy), v17 (copy), v22 (copy), v23 (copy), v24 (copy)
    local v58 = {};
    local v59 = {};
    for v60, v61 in v55 do
        if not v18[v60] then
            if typeof(v59[v61]) == "table" then
                table.insert(v59[v61], v60);
            else
                v59[v61] = {
                    v60
                };
            end;
        end;
    end;
    for _, v63 in v17 do
        local v64 = v59[v63];
        if v64 then
            local v65 = v22[v63];
            local v66 = if v65 then v57:Format(v65) else nil;
            local v67 = v23[v63];
            local v68 = if v67 then v57:Format(v67) else nil;
            local v69 = v56[v63];
            local v70 = v24[v63];
            if v66 then
                table.insert(v58, {
                    icon = v64, 
                    text = v66, 
                    actionText = v68, 
                    progress = v69, 
                    hasProgress = v70
                });
            end;
        end;
    end;
    return v58;
end;
local function v75() --[[ Line: 289 ]] --[[ Name: useShortcutBarFrameProps ]]
    -- upvalues: l_useUiModeInfo_0 (copy), l_useDesignTokens_0 (copy), l_UiMode_0 (copy)
    local v72 = l_useUiModeInfo_0();
    local v73 = if v72 then v72.uiMode else nil;
    local v74 = l_useDesignTokens_0();
    if v73 == l_UiMode_0.TenFoot then
        return {};
    else
        return {
            Position = UDim2.new(0.5, 0, 1, if v74 then -v74.Global.Space_100 else 0), 
            AnchorPoint = Vector2.new(0.5, 1)
        };
    end;
end;
local function v82() --[[ Line: 306 ]] --[[ Name: useShortcutBarItems ]]
    -- upvalues: v5 (copy), v2 (copy), l_LocalizationRoactContext_0 (copy), l_useHeldProgressByEvent_0 (copy), l_useLastInputMethod_0 (copy), l_useSelector_0 (copy), v34 (copy), v54 (copy), v71 (copy)
    local v76 = v5.useActiveEventMap();
    local v77 = v2.useContext(l_LocalizationRoactContext_0);
    local v78 = l_useHeldProgressByEvent_0();
    local v79 = l_useLastInputMethod_0();
    local _ = {};
    local v81 = l_useSelector_0(v34);
    if v79 == "Gamepad" then
        return (v54(v76, v78, v77, v81));
    else
        return (v71(v76, v78, v77));
    end;
end;
useAppShortcutBarProps = function() --[[ Line: 324 ]] --[[ Name: useAppShortcutBarProps ]]
    -- upvalues: l_FFlagEnableUniversalFocusNavigation_0 (copy), v75 (copy), v82 (copy), v3 (copy), v5 (copy), v2 (copy), l_LocalizationRoactContext_0 (copy), l_useHeldProgressByEvent_0 (copy), l_useSelector_0 (copy), v16 (copy), v19 (copy), v32 (copy), v21 (copy), v22 (copy), v23 (copy), v24 (copy)
    local v83 = if l_FFlagEnableUniversalFocusNavigation_0 then v75() else nil;
    local v84 = if l_FFlagEnableUniversalFocusNavigation_0 then v82() else {};
    if l_FFlagEnableUniversalFocusNavigation_0 then
        return v3.Dictionary.union(v83, {
            items = v84
        });
    else
        local v85 = v5.useActiveEventMap();
        local v86 = v2.useContext(l_LocalizationRoactContext_0);
        local v87 = l_useHeldProgressByEvent_0();
        local v89 = l_useSelector_0(function(v88) --[[ Line: 334 ]]
            if v88.GamepadBottomBar then
                return v88.GamepadBottomBar.boundInputs;
            else
                return nil;
            end;
        end);
        for _, v91 in v16 do
            if v89 then
                if not v19[v91] then
                    local v92 = v89[v91];
                    if v92 then
                        for _, v94 in (v32(v91, v92, v86)) do
                            table.insert(v84, v94);
                        end;
                    end;
                else
                    continue;
                end;
            end;
            local v95 = v85[v91];
            if v95 then
                local v96 = v21[v91];
                local v97 = if v96 then v96[v95] else nil;
                local v98 = v22[v95];
                local v99 = if v98 then v86:Format(v98) else nil;
                local v100 = v23[v95];
                local v101 = if v100 then v86:Format(v100) else nil;
                local v102 = v87[v95];
                local v103 = v24[v95];
                if v97 and v99 then
                    table.insert(v84, {
                        icon = v97, 
                        text = v99, 
                        actionText = v101, 
                        progress = v102, 
                        hasProgress = v103
                    });
                end;
            end;
        end;
        return {
            items = v84
        };
    end;
end;
return useAppShortcutBarProps;