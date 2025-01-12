local l_CoreGui_0 = game:GetService("CoreGui");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("TenFootUiShell");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local v4 = require(l_script_FirstAncestor_0.Constants);
local v5 = require(l_script_FirstAncestor_0.Hooks.TenFootUiScene);
local l_GlobalNavContainer_0 = require(l_Parent_0.TenFootUiGlobalNav).GlobalNavContainer;
local l_TenFootUiContext_0 = require(l_Parent_0.TenFootUiCommon).TenFootUiContext;
local l_useGlobalFocusHandler_0 = require(l_Parent_0.FocusNavigationUtils).useGlobalFocusHandler;
local v9 = require(l_script_FirstAncestor_0.Hooks.CrossPlay.useInitializeCrossPlaySettings);
local v10 = require(l_script_FirstAncestor_0.Hooks.useRegisterPlatformFriendListRefresh);
local v11 = require(l_script_FirstAncestor_0.Hooks.useRegisterPlatformSocialGraphSync);
local v12 = require(l_Parent_0.AppShortcutBar);
local l_AppShortcutBarContainer_0 = v12.AppShortcutBarContainer;
local l_AppShortcutBarContext_0 = v12.AppShortcutBarContext;
local v15 = require(script.Parent.TenFootUiLayout);
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local v17 = require(l_Parent_0.RoactUtils);
local l_useSelector_0 = v17.Hooks.RoactRodux.useSelector;
local l_useDispatch_0 = v17.Hooks.RoactRodux.useDispatch;
local l_usePrevious_0 = v17.Hooks.usePrevious;
local l_ProviderContainer_0 = v17.Components.ProviderContainer;
local l_SetCentralOverlay_0 = require(l_Parent_0.CentralOverlay).Actions.SetCentralOverlay;
local l_CentralOverlayType_0 = require(l_Parent_0.RobloxAppEnums).CentralOverlayType;
local v24 = require(l_script_FirstAncestor_0.Hooks.useHideMouseCursorEffect);
local v25 = require(l_script_FirstAncestor_0.Hooks.useForceNotificationServiceThemeEffect);
local l_useGamepadDisconnectOverlayEffect_0 = require(l_Parent_0.InputUi).Gamepad.useGamepadDisconnectOverlayEffect;
local v27 = require(l_Parent_0.Navigation);
local l_useNavigation_0 = v27.useNavigation;
local l_getRouteIsActive_0 = v27.getRouteIsActive;
local l_getRouteIsFocused_0 = v27.getRouteIsFocused;
local l_getCurrentNavigationState_0 = v27.getCurrentNavigationState;
local l_AppEventIngestService_0 = require(l_Parent_0.RoactServiceTags).AppEventIngestService;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_AvatarScreen_0 = require(l_Parent_0.AvatarExperienceNavigation).Enums.AvatarScreen;
local v35 = require(l_Parent_0.SharedFlags);
local l_FFlagEnableUniversalFocusNavigation_0 = v35.FFlagEnableUniversalFocusNavigation;
local l_GetFFlagGamepadAnalytics_0 = v35.GetFFlagGamepadAnalytics;
local v38 = game:DefineFastFlag("LuaAppAvatarHardLockFix", false);
local v39 = game:DefineFastFlag("EnablePlatformSocialGraphSync1", false);
local l_FFlagAXMigrateCatalogContextMenuFromRoactGamepad_0 = v35.FFlagAXMigrateCatalogContextMenuFromRoactGamepad;
local l_FFlagAXMigrateSaveOutfitPromptFromRoactGamepad_0 = v35.FFlagAXMigrateSaveOutfitPromptFromRoactGamepad;
local function _(v42) --[[ Line: 51 ]] --[[ Name: getAvatarRouteIsActive ]]
    -- upvalues: l_getRouteIsActive_0 (copy), l_AppPage_0 (copy)
    return l_getRouteIsActive_0(v42, l_AppPage_0.AvatarExperienceRoot);
end;
local function _(v44) --[[ Line: 55 ]] --[[ Name: getAvatarRouteIsFocused ]]
    -- upvalues: l_getRouteIsFocused_0 (copy), l_AppPage_0 (copy)
    return l_getRouteIsFocused_0(v44, l_AppPage_0.AvatarExperienceRoot);
end;
local function _(v46, v47) --[[ Line: 63 ]] --[[ Name: applyAvatarCameraFix ]]
    -- upvalues: l_getRouteIsActive_0 (copy), l_AppPage_0 (copy), v4 (copy)
    local v48 = l_getRouteIsActive_0(v46, l_AppPage_0.AvatarExperienceRoot);
    local v49 = l_getRouteIsActive_0(v47, l_AppPage_0.AvatarExperienceRoot);
    if v48 and not v49 and workspace.CurrentCamera then
        workspace.CurrentCamera.CFrame = CFrame.new(v4.CAMERA_POSITION);
    end;
end;
local function v55(v51, v52) --[[ Line: 71 ]] --[[ Name: setSceneTransparency ]]
    if v51 then
        for _, v54 in ipairs(v51:GetChildren()) do
            if v54:IsA("BasePart") then
                v54.Transparency = v52;
            end;
        end;
    end;
end;
local function v60(v56) --[[ Line: 81 ]] --[[ Name: applySceneSwitch ]]
    -- upvalues: v5 (copy), l_getRouteIsActive_0 (copy), l_AppPage_0 (copy), v55 (copy)
    local v57 = v5.getBackgroundInstance();
    if v57 then
        local v58 = l_getRouteIsActive_0(v56, l_AppPage_0.AvatarExperienceRoot);
        local v59 = v58 and 1 or 0;
        if v58 then
            task.spawn(function() --[[ Line: 91 ]]
                -- upvalues: v55 (ref), v57 (copy), v59 (copy)
                if workspace:WaitForChild("AvatarSceneNew") then
                    v55(v57, v59);
                end;
            end);
            return;
        else
            v55(v57, v59);
        end;
    end;
end;
local function _() --[[ Line: 103 ]] --[[ Name: getOrCreateSurfaceGuiContainer ]]
    -- upvalues: l_CoreGui_0 (copy), v4 (copy)
    local l_l_CoreGui_0_FirstChild_0 = l_CoreGui_0:FindFirstChild(v4.SURFACE_GUI_FOLDER_NAME);
    if not l_l_CoreGui_0_FirstChild_0 then
        local l_Folder_0 = Instance.new("Folder");
        l_Folder_0.Name = v4.SURFACE_GUI_FOLDER_NAME;
        l_Folder_0.Parent = l_CoreGui_0;
        l_l_CoreGui_0_FirstChild_0 = l_Folder_0;
    end;
    return l_l_CoreGui_0_FirstChild_0;
end;
local function _() --[[ Line: 115 ]] --[[ Name: getOrCreateWorkSpaceContainer ]]
    -- upvalues: v4 (copy)
    local l_workspace_FirstChild_0 = workspace:FindFirstChild(v4.WORKSPACE_FOLDER_NAME);
    if not l_workspace_FirstChild_0 then
        local l_Folder_1 = Instance.new("Folder");
        l_Folder_1.Name = v4.WORKSPACE_FOLDER_NAME;
        l_Folder_1.Parent = workspace;
        l_workspace_FirstChild_0 = l_Folder_1;
    end;
    return l_workspace_FirstChild_0;
end;
local function v73() --[[ Line: 132 ]] --[[ Name: useAppGamepadDisconnectListener ]]
    -- upvalues: l_useDispatch_0 (copy), l_useSelector_0 (copy), l_CentralOverlayType_0 (copy), v3 (copy), l_SetCentralOverlay_0 (copy), l_GetFFlagGamepadAnalytics_0 (copy), l_useRoactService_0 (copy), l_AppEventIngestService_0 (copy), l_useGamepadDisconnectOverlayEffect_0 (copy)
    local v67 = l_useDispatch_0();
    local v69 = l_useSelector_0(function(v68) --[[ Line: 134 ]]
        -- upvalues: l_CentralOverlayType_0 (ref)
        return v68.CentralOverlay.OverlayType == l_CentralOverlayType_0.GamepadDisconnected;
    end);
    local v70 = v3.useCallback(function() --[[ Line: 138 ]]
        -- upvalues: v69 (copy), v67 (copy), l_SetCentralOverlay_0 (ref)
        if v69 then
            v67(l_SetCentralOverlay_0());
        end;
    end, {
        v67, 
        v69
    });
    local v71 = v3.useCallback(function() --[[ Line: 144 ]]
        -- upvalues: v67 (copy), l_SetCentralOverlay_0 (ref), l_CentralOverlayType_0 (ref)
        v67(l_SetCentralOverlay_0(l_CentralOverlayType_0.GamepadDisconnected));
    end, {
        v67
    });
    if l_GetFFlagGamepadAnalytics_0() then
        local v72 = l_useRoactService_0(l_AppEventIngestService_0);
        l_useGamepadDisconnectOverlayEffect_0(v71, v70, v72, "InApp");
        return;
    else
        l_useGamepadDisconnectOverlayEffect_0(v71, v70);
        return;
    end;
end;
local v74 = {
    [l_AvatarScreen_0.CatalogContextMenu] = true, 
    [l_AvatarScreen_0.SaveOutfitPrompt] = l_FFlagAXMigrateSaveOutfitPromptFromRoactGamepad_0 and true or nil
};
local function _(v75) --[[ Line: 161 ]] --[[ Name: getRouteInGreenList ]]
    -- upvalues: l_getCurrentNavigationState_0 (copy), v74 (copy)
    local v76 = l_getCurrentNavigationState_0(v75.state);
    local v77 = if v76 then v76.routeName else nil;
    if v77 then
        return v74[v77];
    else
        return false;
    end;
end;
local function v89() --[[ Line: 168 ]] --[[ Name: useDisableAutoFocus ]]
    -- upvalues: l_useNavigation_0 (copy), v38 (copy), l_getRouteIsFocused_0 (copy), l_AppPage_0 (copy), l_FFlagAXMigrateCatalogContextMenuFromRoactGamepad_0 (copy), l_getCurrentNavigationState_0 (copy), v74 (copy), l_getRouteIsActive_0 (copy), l_useSelector_0 (copy)
    local v79 = l_useNavigation_0();
    local v80;
    if v38 then
        local l_state_0 = v79.state;
        v80 = l_getRouteIsFocused_0(l_state_0, l_AppPage_0.AvatarExperienceRoot);
        if v80 then
            if l_FFlagAXMigrateCatalogContextMenuFromRoactGamepad_0 then
                local v82 = l_getCurrentNavigationState_0(v79.state);
                local v83 = if v82 then v82.routeName else nil;
                v80 = not if v83 then v74[v83] else false;
            else
                v80 = true;
            end;
        end;
    else
        local l_state_1 = v79.state;
        v80 = l_getRouteIsActive_0(l_state_1, l_AppPage_0.AvatarExperienceRoot);
        if v80 then
            if l_FFlagAXMigrateCatalogContextMenuFromRoactGamepad_0 then
                local v85 = l_getCurrentNavigationState_0(v79.state);
                local v86 = if v85 then v85.routeName else nil;
                v80 = not if v86 then v74[v86] else false;
            else
                v80 = true;
            end;
        end;
    end;
    local v88 = l_useSelector_0(function(v87) --[[ Line: 178 ]]
        return v87.CentralOverlay.OverlayType ~= nil;
    end);
    return v80 and not v88;
end;
local function v96() --[[ Line: 185 ]] --[[ Name: useAvatarSceneEffects ]]
    -- upvalues: l_useNavigation_0 (copy), l_usePrevious_0 (copy), v3 (copy), l_getRouteIsActive_0 (copy), l_AppPage_0 (copy), v4 (copy), v60 (copy)
    local l_state_2 = l_useNavigation_0().state;
    local v91 = l_usePrevious_0(l_state_2) or l_state_2;
    v3.useEffect(function() --[[ Line: 190 ]]
        -- upvalues: v91 (copy), l_state_2 (copy), l_getRouteIsActive_0 (ref), l_AppPage_0 (ref), v4 (ref), v60 (ref)
        local l_v91_0 = v91;
        local l_l_state_2_0 = l_state_2;
        local v94 = l_getRouteIsActive_0(l_v91_0, l_AppPage_0.AvatarExperienceRoot);
        local v95 = l_getRouteIsActive_0(l_l_state_2_0, l_AppPage_0.AvatarExperienceRoot);
        if v94 and not v95 and workspace.CurrentCamera then
            workspace.CurrentCamera.CFrame = CFrame.new(v4.CAMERA_POSITION);
        end;
        v60(l_state_2);
    end, {
        l_state_2
    });
end;
local function _() --[[ Line: 196 ]] --[[ Name: useTenFootUiScene ]]
    -- upvalues: v3 (copy), v5 (copy)
    v3.useLayoutEffect(function() --[[ Line: 197 ]]
        -- upvalues: v5 (ref)
        v5.initialize();
        return function() --[[ Line: 199 ]]
            -- upvalues: v5 (ref)
            v5.deinitialize();
        end;
    end, {});
end;
local function v100(v98) --[[ Line: 205 ]] --[[ Name: GlobalEffects ]]
    -- upvalues: v89 (copy), v96 (copy), v25 (copy), v24 (copy), l_FFlagEnableUniversalFocusNavigation_0 (copy), l_useGlobalFocusHandler_0 (copy), v9 (copy), v73 (copy), v10 (copy), v39 (copy), v11 (copy), v3 (copy), v5 (copy)
    local v99 = v89();
    v96();
    v25();
    v24();
    if not l_FFlagEnableUniversalFocusNavigation_0 then
        l_useGlobalFocusHandler_0(v99);
    end;
    v9();
    v73();
    v10();
    if v39 then
        v11();
    end;
    v3.useLayoutEffect(function() --[[ Line: 197 ]]
        -- upvalues: v5 (ref)
        v5.initialize();
        return function() --[[ Line: 199 ]]
            -- upvalues: v5 (ref)
            v5.deinitialize();
        end;
    end, {});
    return v3.createElement(v3.Fragment, nil, v98.children);
end;
local function v107(v101) --[[ Line: 223 ]] --[[ Name: RootViewContainer ]]
    -- upvalues: l_CoreGui_0 (copy), v4 (copy), l_useNavigation_0 (copy), v3 (copy)
    local l_l_CoreGui_0_FirstChild_1 = l_CoreGui_0:FindFirstChild(v4.SURFACE_GUI_FOLDER_NAME);
    if not l_l_CoreGui_0_FirstChild_1 then
        local l_Folder_2 = Instance.new("Folder");
        l_Folder_2.Name = v4.SURFACE_GUI_FOLDER_NAME;
        l_Folder_2.Parent = l_CoreGui_0;
        l_l_CoreGui_0_FirstChild_1 = l_Folder_2;
    end;
    local l_l_l_CoreGui_0_FirstChild_1_0 = l_l_CoreGui_0_FirstChild_1;
    local l_workspace_FirstChild_1 = workspace:FindFirstChild(v4.WORKSPACE_FOLDER_NAME);
    if not l_workspace_FirstChild_1 then
        local l_Folder_3 = Instance.new("Folder");
        l_Folder_3.Name = v4.WORKSPACE_FOLDER_NAME;
        l_Folder_3.Parent = workspace;
        l_workspace_FirstChild_1 = l_Folder_3;
    end;
    l_l_CoreGui_0_FirstChild_1 = l_workspace_FirstChild_1;
    l_workspace_FirstChild_1 = l_useNavigation_0();
    return v3.createElement(v101.dependencies.RootNavigator, {
        navigation = l_workspace_FirstChild_1, 
        screenProps = {
            surfaceGuiContainer = l_l_l_CoreGui_0_FirstChild_1_0, 
            worldContainer = l_l_CoreGui_0_FirstChild_1
        }
    });
end;
return function(v108) --[[ Line: 238 ]] --[[ Name: TenFootUiContainer ]]
    -- upvalues: l_CoreGui_0 (copy), v4 (copy), v3 (copy), v15 (copy), v107 (copy), l_GlobalNavContainer_0 (copy), l_AppShortcutBarContainer_0 (copy), v100 (copy), l_TenFootUiContext_0 (copy), l_AppShortcutBarContext_0 (copy), l_ProviderContainer_0 (copy)
    local l_l_CoreGui_0_FirstChild_2 = l_CoreGui_0:FindFirstChild(v4.SURFACE_GUI_FOLDER_NAME);
    if not l_l_CoreGui_0_FirstChild_2 then
        local l_Folder_4 = Instance.new("Folder");
        l_Folder_4.Name = v4.SURFACE_GUI_FOLDER_NAME;
        l_Folder_4.Parent = l_CoreGui_0;
        l_l_CoreGui_0_FirstChild_2 = l_Folder_4;
    end;
    local l_l_l_CoreGui_0_FirstChild_2_0 = l_l_CoreGui_0_FirstChild_2;
    local l_workspace_FirstChild_2 = workspace:FindFirstChild(v4.WORKSPACE_FOLDER_NAME);
    if not l_workspace_FirstChild_2 then
        local l_Folder_5 = Instance.new("Folder");
        l_Folder_5.Name = v4.WORKSPACE_FOLDER_NAME;
        l_Folder_5.Parent = workspace;
        l_workspace_FirstChild_2 = l_Folder_5;
    end;
    l_workspace_FirstChild_2 = v3.createElement(v3.Fragment, nil, {
        Toast = v108.toast, 
        CentralOverlay = v108.centralOverlay, 
        TenFootUiLayout = v3.createElement(v15, {
            adorneeParent = l_workspace_FirstChild_2, 
            surfaceGuiParent = l_l_l_CoreGui_0_FirstChild_2_0, 
            rootViewSlot = v3.createElement(v107, v108), 
            globalNavSlot = v3.createElement(l_GlobalNavContainer_0), 
            controllerBarSlot = v3.createElement(l_AppShortcutBarContainer_0)
        }), 
        GlobalEffects = v3.createElement(v100)
    });
    local v114 = {};
    table.insert(v114, {
        class = l_TenFootUiContext_0.Provider, 
        props = {
            value = v108.dependencies
        }
    });
    table.insert(v114, {
        class = l_AppShortcutBarContext_0.Provider
    });
    return v3.createElement(l_ProviderContainer_0, {
        providers = v114
    }, l_workspace_FirstChild_2);
end;