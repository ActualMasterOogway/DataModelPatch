local l_script_FirstAncestor_0 = script:FindFirstAncestor("ChromeShared");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_reverse_0 = require(l_CorePackages_0.Packages.LuauPolyfill).Array.reverse;
local v5 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib);
local l_Localization_0 = require(l_CorePackages_0.Workspace.Packages.InExperienceLocales).Localization;
local l_Signal_0 = v5.Signal;
local v8 = require(l_script_FirstAncestor_0.Service.ChromeUtils);
local v9 = require(l_script_FirstAncestor_0.Service.LocalStore);
local v10 = require(l_script_FirstAncestor_0.Service.ViewportUtil);
local v11 = require(l_script_FirstAncestor_0.Service.WindowSizeSignal);
local v12 = require(l_script_FirstAncestor_0.Service.ContainerSlotSignal);
local l_ObservableValue_0 = v8.ObservableValue;
local l_NotifySignal_0 = v8.NotifySignal;
local l_AvailabilitySignal_0 = v8.AvailabilitySignal;
local _ = require(l_script_FirstAncestor_0.Service.Types);
local v17 = require(l_script_FirstAncestor_0.Unibar.Constants);
local v18 = require(l_script_FirstAncestor_0.Service.PeekService);
local l_GetFFlagRefactorChromeAssert_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagRefactorChromeAssert;
local v20 = nil;
if not l_GetFFlagRefactorChromeAssert_0() then
    v20 = require(l_script_FirstAncestor_0.Parent.Enabled);
end;
local l_GetFFlagEnableChromeEscapeFix_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableChromeEscapeFix;
local l_GetFFlagEnableChromePinIntegrations_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableChromePinIntegrations;
local l_GetFFlagEnableSaveUserPins_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableSaveUserPins;
local l_GetFFlagEnableUserPinPortraitFix_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableUserPinPortraitFix;
local l_GetFFlagFixChromeReferences_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagFixChromeReferences;
local l_GetFFlagChromePeekArchitecture_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagChromePeekArchitecture;
local v27 = require(l_script_FirstAncestor_0.Parent.Flags.GetFFlagChromeTrackWindowStatus);
local v28 = require(l_script_FirstAncestor_0.Parent.Flags.GetFFlagChromeTrackWindowPosition);
local l_GetFFlagChromeDefaultWindowStartingPosition_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagChromeDefaultWindowStartingPosition;
local v30 = game:DefineFastString("ChromeServiceDefaultPins", "leaderboard,trust_and_safety");
local v31 = {};
v31.__index = v31;
v31.AvailabilitySignal = v8.AvailabilitySignalState;
v31.MenuStatus = {
    Closed = 0, 
    Open = 1
};
v31.IntegrationStatus = {
    None = 0, 
    Icon = 1, 
    Window = 2
};
v31.Key = {
    MostRecentlyUsed = "MRU", 
    UserPinned = l_GetFFlagEnableChromePinIntegrations_0 and "UP" or nil
};
noop = function() --[[ Line: 91 ]] --[[ Name: noop ]]

end;
local v32 = {
    id = "div", 
    label = "div", 
    initialAvailability = v31.AvailabilitySignal.Unavailable, 
    availability = l_AvailabilitySignal_0.new(v31.AvailabilitySignal.Unavailable), 
    notification = l_NotifySignal_0.new(), 
    components = {}, 
    hideNotificationCountWhileOpen = false
};
createUnibarLayoutInfo = function(v33, v34, v35) --[[ Line: 252 ]] --[[ Name: createUnibarLayoutInfo ]]
    -- upvalues: v31 (copy)
    return {
        [v31.MenuStatus.Open] = Rect.new(v33, v33 + v35), 
        [v31.MenuStatus.Closed] = Rect.new(v33, v33 + v34)
    };
end;
v31.new = function() --[[ Line: 259 ]] --[[ Name: new ]]
    -- upvalues: l_LocalizationService_0 (copy), l_GetFFlagChromePeekArchitecture_0 (copy), v18 (copy), v8 (copy), v31 (copy), l_ObservableValue_0 (copy), l_NotifySignal_0 (copy), l_GetFFlagEnableSaveUserPins_0 (copy), l_GetFFlagEnableUserPinPortraitFix_0 (copy), l_Localization_0 (copy), l_Signal_0 (copy), l_GetFFlagEnableChromeEscapeFix_0 (copy), l_GetFFlagRefactorChromeAssert_0 (copy), l_GetFFlagFixChromeReferences_0 (copy), v20 (ref), v10 (copy)
    local l_RobloxLocaleId_0 = l_LocalizationService_0.RobloxLocaleId;
    local v37 = {
        _peekService = if l_GetFFlagChromePeekArchitecture_0() then v18.new() else nil
    };
    local v38 = v8.ObservableValue.new(v31.MenuStatus.Open);
    v37._status = v38;
    v37._layout = v8.ObservableValue.new(createUnibarLayoutInfo(Vector2.zero, Vector2.zero, Vector2.zero));
    v37._menuAbsolutePosition = Vector2.zero;
    v37._menuAbsoluteSizeOpen = Vector2.zero;
    v37._menuAbsoluteSizeClosed = Vector2.zero;
    v37._currentSubMenu = v8.ObservableValue.new(nil);
    v37._selectedItem = v8.ObservableValue.new(nil);
    v37._selectedItemIdx = 0;
    v37._integrations = {};
    v37._integrationsConnections = {};
    v37._integrationsStatus = {};
    v37._menuConfig = {};
    v37._subMenuConfig = {};
    v37._compactUtilityConfig = {};
    v37._currentCompactUtility = l_ObservableValue_0.new(nil);
    v37._subMenuNotifications = {};
    v37._menuList = l_ObservableValue_0.new({});
    v37._windowList = l_ObservableValue_0.new({});
    v37._peekList = l_ObservableValue_0.new({});
    v37._peekId = l_ObservableValue_0.new(nil);
    v37._dragConnection = {};
    v37._windowPositions = l_ObservableValue_0.new({});
    v37._totalNotifications = l_NotifySignal_0.new(true);
    v37._mostRecentlyUsedFullRecord = {};
    v37._mostRecentlyUsed = {};
    v37._userPins = if l_GetFFlagEnableSaveUserPins_0() then getUserPinStartingState() else {};
    v37._mostRecentlyUsedAndPinnedLimit = l_GetFFlagEnableUserPinPortraitFix_0() and -1 or 1;
    v37._localization = l_Localization_0.new(l_RobloxLocaleId_0);
    v37._localizedLabelKeys = {};
    v37._notificationIndicator = l_ObservableValue_0.new(nil);
    v37._lastDisplayedNotificationTick = 0;
    v37._lastDisplayedNotificationId = "";
    v37._orderAlignment = l_ObservableValue_0.new(Enum.HorizontalAlignment.Left);
    v37._onIntegrationRegistered = l_Signal_0.new();
    v37._onIntegrationActivated = l_Signal_0.new();
    v37._onIntegrationStatusChanged = l_Signal_0.new();
    v37._onIntegrationHovered = l_Signal_0.new();
    v37._lastInputToOpenMenu = if l_GetFFlagEnableChromeEscapeFix_0() and v38:get() == v31.MenuStatus.Open then Enum.UserInputType.MouseButton1 else Enum.UserInputType.None;
    v37._inFocusNav = l_ObservableValue_0.new(false);
    local v39 = setmetatable(v37, v31);
    if not l_GetFFlagRefactorChromeAssert_0() and l_GetFFlagFixChromeReferences_0() then
        assert(v20(), "ChromeService should not be initialized when Chrome is not enabled");
    end;
    v10.viewport:connect(function(v40) --[[ Line: 325 ]]
        -- upvalues: v39 (copy)
        v39:updateScreenSize(v40.size, v40.isMobileDevice, v40.portraitOrientation, v40.tinyPortrait);
    end, true);
    if l_GetFFlagChromePeekArchitecture_0() then
        v37._peekService.onPeekChanged:connect(function() --[[ Line: 335 ]]
            -- upvalues: v39 (copy)
            v39:updateMenuList();
        end);
        v37._peekService.onPeekShown:connect(function(v41) --[[ Line: 339 ]]
            -- upvalues: v39 (copy)
            v39._peekId:set(v41);
        end);
        v37._peekService.onPeekHidden:connect(function() --[[ Line: 343 ]]
            -- upvalues: v39 (copy)
            v39._peekId:set(nil);
        end);
    end;
    return v39;
end;
v31.storeChromeInteracted = function(_) --[[ Line: 353 ]] --[[ Name: storeChromeInteracted ]]
    -- upvalues: v9 (copy)
    if v9.isEnabled() then
        v9.storeForLocalPlayer("ChromeInteracted3", true);
    end;
end;
v31.updateScreenSize = function(v43, _, v45, v46, v47) --[[ Line: 359 ]] --[[ Name: updateScreenSize ]]
    -- upvalues: v17 (copy), l_GetFFlagEnableChromePinIntegrations_0 (copy)
    local v48 = 0;
    v48 = if v45 then if v47 then v17.MOBILE_TINY_PORTRAIT_SLOTS - v17.CORE_SLOTS else if v46 then v17.MOBILE_PORTRAIT_SLOTS - v17.CORE_SLOTS else v17.MOBILE_LANDSCAPE_SLOTS - v17.CORE_SLOTS else v17.NON_MOBILE_SLOTS - v17.CORE_SLOTS;
    if v48 ~= v43._mostRecentlyUsedAndPinnedLimit then
        v43._mostRecentlyUsedAndPinnedLimit = v48;
        if l_GetFFlagEnableChromePinIntegrations_0() then
            v43:rebuildUserPins();
        end;
        v43:rebuildMostRecentlyUsed();
    end;
    v43:updateWindowSizeSignals();
    v43:updateContainerSlotSignals();
end;
v31.rebuildMostRecentlyUsed = function(v49) --[[ Line: 400 ]] --[[ Name: rebuildMostRecentlyUsed ]]
    -- upvalues: l_GetFFlagEnableChromePinIntegrations_0 (copy)
    table.clear(v49._mostRecentlyUsed);
    local v50 = #v49._mostRecentlyUsedFullRecord;
    if v50 > 0 then
        local v51 = v50 - v49._mostRecentlyUsedAndPinnedLimit + 1;
        if l_GetFFlagEnableChromePinIntegrations_0() then
            v51 = v50 - v49._mostRecentlyUsedAndPinnedLimit + #v49._userPins + 1;
        end;
        table.move(v49._mostRecentlyUsedFullRecord, math.max(1, v51), v50, 1, v49._mostRecentlyUsed);
    end;
    v49:updateMenuList();
    v49:updateNotificationTotals();
end;
getUserPinStartingState = function() --[[ Line: 424 ]] --[[ Name: getUserPinStartingState ]]
    -- upvalues: l_GetFFlagEnableSaveUserPins_0 (copy), v30 (copy), v9 (copy)
    if l_GetFFlagEnableSaveUserPins_0() then
        local v52 = {};
        for v53 in v30:gmatch("([^,]+),?") do
            table.insert(v52, v53);
        end;
        return v9.loadForLocalPlayer("ChromePinned") or v52;
    else
        return nil;
    end;
end;
v31.rebuildUserPins = function(v54) --[[ Line: 438 ]] --[[ Name: rebuildUserPins ]]
    -- upvalues: l_GetFFlagEnableChromePinIntegrations_0 (copy), l_GetFFlagEnableSaveUserPins_0 (copy), v9 (copy)
    if l_GetFFlagEnableChromePinIntegrations_0() and v54._mostRecentlyUsedAndPinnedLimit < #v54._userPins then
        local v55 = {};
        local v56 = #v54._userPins;
        table.move(v54._userPins, math.max(1, v56 - v54._mostRecentlyUsedAndPinnedLimit + 1), v56, 1, v55);
        v54._userPins = v55;
        if l_GetFFlagEnableSaveUserPins_0() then
            v9.storeForLocalPlayer("ChromePinned", v54._userPins);
        end;
        v54:updateMenuList();
        v54:updateNotificationTotals();
    end;
end;
v31.updateWindowSizeSignals = function(v57) --[[ Line: 460 ]] --[[ Name: updateWindowSizeSignals ]]
    for _, v59 in v57._integrations do
        if v59.windowSize then
            v59.windowSize:updateConstraints();
        end;
    end;
end;
v31.updateContainerSlotSignals = function(v60) --[[ Line: 468 ]] --[[ Name: updateContainerSlotSignals ]]
    for _, v62 in v60._integrations do
        if v62.containerWidthSlots then
            v62.containerWidthSlots:updateConstraints();
        end;
    end;
end;
v31.triggerNotificationIndicator = function(v63, v64) --[[ Line: 476 ]] --[[ Name: triggerNotificationIndicator ]]
    -- upvalues: v31 (copy)
    local l__status_0 = v63._status;
    local v66 = v63._integrations[v64];
    local v67 = v66.availability:get();
    if v67 == v31.AvailabilitySignal.Unavailable or v67 == v31.AvailabilitySignal.Pinned then
        return;
    elseif l__status_0:get() ~= v31.MenuStatus.Closed then
        return;
    else
        local v68 = v66.notification:get();
        if v68.type == "count" and v68.value > 0 then
            local v69 = tick();
            local v70 = v69 - v63._lastDisplayedNotificationTick;
            v63._lastDisplayedNotificationTick = v69;
            if v63._lastDisplayedNotificationId == v64 and v70 < 10 then
                return;
            else
                v63._lastDisplayedNotificationId = v64;
                v63._notificationIndicator:setMomentary(v63:createIconProps(v64, 0, false), 2.5);
            end;
        end;
        return;
    end;
end;
v31.notificationIndicator = function(v71) --[[ Line: 522 ]] --[[ Name: notificationIndicator ]]
    return v71._notificationIndicator;
end;
v31.toggleSubMenu = function(v72, v73) --[[ Line: 526 ]] --[[ Name: toggleSubMenu ]]
    -- upvalues: v31 (copy)
    if v72._status:get() == v31.MenuStatus.Closed then
        warn("Can't toggleSubMenu while menu is closed");
        return;
    elseif not v72._subMenuConfig[v73] then
        warn("Not a valid subMenuId:" .. v73);
        return;
    elseif v72._currentSubMenu:get() == v73 then
        v72._currentSubMenu:set(nil);
        return;
    else
        v72._currentSubMenu:set(v73);
        return;
    end;
end;
v31.currentSubMenu = function(v74) --[[ Line: 546 ]] --[[ Name: currentSubMenu ]]
    return v74._currentSubMenu;
end;
v31.inFocusNav = function(v75) --[[ Line: 550 ]] --[[ Name: inFocusNav ]]
    return v75._inFocusNav;
end;
v31.enableFocusNav = function(v76) --[[ Line: 554 ]] --[[ Name: enableFocusNav ]]
    if not v76._inFocusNav:get() then
        v76._inFocusNav:set(true);
    end;
end;
v31.disableFocusNav = function(v77) --[[ Line: 560 ]] --[[ Name: disableFocusNav ]]
    if v77._inFocusNav:get() then
        v77._inFocusNav:set(false);
        v77._selectedItem:set(nil);
        v77._currentSubMenu:set(nil);
    end;
end;
v31.getLastInputToOpenMenu = function(v78) --[[ Line: 569 ]] --[[ Name: getLastInputToOpenMenu ]]
    return v78._lastInputToOpenMenu;
end;
v31.toggleWindow = function(v79, v80) --[[ Line: 573 ]] --[[ Name: toggleWindow ]]
    -- upvalues: v31 (copy), v27 (copy), v9 (copy)
    if v79._integrations[v80].components.Window then
        if not v79._integrationsStatus[v80] or v79._integrationsStatus[v80] == v31.IntegrationStatus.None or v79._integrationsStatus[v80] == v31.IntegrationStatus.Icon then
            v79._integrationsStatus[v80] = v31.IntegrationStatus.Window;
        else
            v79._integrationsStatus[v80] = v31.IntegrationStatus.Icon;
        end;
        v79._onIntegrationStatusChanged:fire(v80, v79._integrationsStatus[v80]);
    end;
    if v27() and v9.isEnabled() and v79._integrations[v80] and v79._integrations[v80].persistWindowState then
        local v81 = v9.loadForLocalPlayer("ChromeWindowStatus") or {};
        v81[v80] = v79._integrationsStatus[v80] == v31.IntegrationStatus.Window;
        v9.storeForLocalPlayer("ChromeWindowStatus", v81);
    end;
    v79:updateMenuList();
end;
v31.isWindowOpen = function(v82, v83) --[[ Line: 599 ]] --[[ Name: isWindowOpen ]]
    -- upvalues: v31 (copy)
    return v82._integrations[v83].components.Window and v82._integrationsStatus[v83] == v31.IntegrationStatus.Window;
end;
v31.status = function(v84) --[[ Line: 604 ]] --[[ Name: status ]]
    return v84._status;
end;
v31.menuList = function(v85) --[[ Line: 608 ]] --[[ Name: menuList ]]
    return v85._menuList;
end;
v31.windowList = function(v86) --[[ Line: 612 ]] --[[ Name: windowList ]]
    return v86._windowList;
end;
if l_GetFFlagChromePeekArchitecture_0() then
    v31.peekList = function(v87) --[[ Line: 617 ]] --[[ Name: peekList ]]
        return v87._peekList;
    end;
    v31.peekId = function(v88) --[[ Line: 621 ]] --[[ Name: peekId ]]
        return v88._peekId;
    end;
end;
v31.dragConnection = function(v89, v90) --[[ Line: 626 ]] --[[ Name: dragConnection ]]
    if v89._integrations[v90] then
        return v89._dragConnection[v90];
    else
        return nil;
    end;
end;
v31.updateLocalization = function(v91, v92) --[[ Line: 634 ]] --[[ Name: updateLocalization ]]
    local v93 = "";
    local v94 = "";
    v91._localizedLabelKeys[v92.id] = {};
    v91._localizedLabelKeys[v92.id].label = v92.label;
    v93 = v92.label;
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 645 ]]
        -- upvalues: v93 (ref), v91 (copy)
        v93 = v91._localization:Format(v93);
    end);
    if not l_status_0 then
        v93 = v92.label;
        warn(l_result_0);
    end;
    v92.label = v93;
    if v92.secondaryAction then
        v91._localizedLabelKeys[v92.id].secondaryActionLabel = v92.secondaryAction.label;
        v94 = v92.secondaryAction.label;
        local l_status_1, l_result_1 = pcall(function() --[[ Line: 659 ]]
            -- upvalues: v94 (ref), v91 (copy)
            v94 = v91._localization:Format(v94);
        end);
        if not l_status_1 then
            v94 = v92.secondaryAction.label;
            warn(l_result_1);
        end;
        v92.secondaryAction.label = v94;
    end;
    return v92;
end;
v31.register = function(v99, v100) --[[ Line: 674 ]] --[[ Name: register ]]
    -- upvalues: v31 (copy), l_AvailabilitySignal_0 (copy), l_NotifySignal_0 (copy), v11 (copy), v27 (copy), l_GetFFlagChromeDefaultWindowStartingPosition_0 (copy), v28 (copy), v17 (copy), v12 (copy)
    if v99._integrations[v100.id] then
        warn(string.format(v100.id .. "already registered", debug.traceback()));
        for _, v102 in v99._integrationsConnections[v100.id] do
            v102:disconnect();
        end;
    end;
    v99._integrationsConnections[v100.id] = {};
    local v103 = v99._integrationsConnections[v100.id];
    if v100.initialAvailability == nil then
        v100.initialAvailability = v31.AvailabilitySignal.Unavailable;
    end;
    if v100.availability == nil then
        v100.availability = l_AvailabilitySignal_0.new(v100.initialAvailability or v31.AvailabilitySignal.Unavailable);
    end;
    if v100.notification == nil then
        v100.notification = l_NotifySignal_0.new();
    end;
    if v100.components == nil then
        v100.components = {};
    end;
    if v100.availability then
        v103[#v103 + 1] = v100.availability:connect(function() --[[ Line: 703 ]]
            -- upvalues: v99 (copy), v100 (ref)
            v99:availabilityChanged(v100);
        end);
    end;
    if v100.notification and not v100.notification:excludeFromTotalCounts() then
        v103[#v103 + 1] = v100.notification:connect(function() --[[ Line: 709 ]]
            -- upvalues: v99 (copy), v100 (ref)
            v99:triggerNotificationIndicator(v100.id);
            v99:updateNotificationTotals();
        end);
    end;
    if v100.windowSize == nil and v100.components and v100.components.Window then
        v100.windowSize = v11.new();
    end;
    if v27() and v31:getWindowStatusFromStore(v100.id) and v100.persistWindowState or v100.windowDefaultOpen then
        v99._integrationsStatus[v100.id] = v31.IntegrationStatus.Window;
        v99._onIntegrationStatusChanged:fire(v100.id, v99._integrationsStatus[v100.id]);
    end;
    if l_GetFFlagChromeDefaultWindowStartingPosition_0() then
        if v28() then
            local v104 = UDim2.fromOffset(v17.MENU_ICON_SCREEN_SIDE_OFFSET, v17.WINDOW_DEFAULT_PADDING);
            if v100.startingWindowPosition then
                v104 = if v100.persistWindowState then v99:getWindowPositionFromStore(v100.id) or v100.startingWindowPosition else v100.startingWindowPosition;
            end;
            v99._windowPositions[v100.id] = v104;
        end;
    elseif v28() and v100.startingWindowPosition then
        local v105 = nil;
        v105 = if v100.persistWindowState then v99:getWindowPositionFromStore(v100.id) or v100.startingWindowPosition else v100.startingWindowPosition;
        v99._windowPositions[v100.id] = v105;
    end;
    if v100.containerWidthSlots == nil and v100.components and v100.components.Container then
        v100.containerWidthSlots = v12.new();
    end;
    if v100.containerWidthSlots then
        v103[#v103 + 1] = v100.containerWidthSlots:connect(function() --[[ Line: 760 ]]
            -- upvalues: v99 (copy), v100 (ref)
            v99:containerWidthSlotsChanged(v100);
        end);
    end;
    v100 = v99:updateLocalization(v100);
    local l_v100_0 = v100;
    v99._integrations[v100.id] = l_v100_0;
    return l_v100_0;
end;
v31.createIconProps = function(v107, v108, v109, v110) --[[ Line: 773 ]] --[[ Name: createIconProps ]]
    -- upvalues: v32 (copy)
    local v111 = v109 or 0;
    if v107._integrations[v108] then
        return {
            id = v108, 
            children = {}, 
            order = v111, 
            component = v107._integrations[v108].components.Icon, 
            integration = v107._integrations[v108], 
            isDivider = false, 
            recentlyUsedItem = v110 or false, 
            activated = function() --[[ Line: 788 ]] --[[ Name: activated ]]
                -- upvalues: v107 (copy), v108 (copy)
                v107:activate(v108);
            end
        };
    else
        return {
            id = v108, 
            children = {}, 
            order = v111, 
            activated = noop, 
            integration = v32
        };
    end;
end;
v31.createContainerProps = function(v112, v113, v114, v115) --[[ Line: 803 ]] --[[ Name: createContainerProps ]]
    -- upvalues: v32 (copy)
    local v116 = v114 or 0;
    if v112._integrations[v113] then
        return {
            id = v113, 
            children = {}, 
            order = v116, 
            component = v112._integrations[v113].components.Container, 
            integration = v112._integrations[v113], 
            isDivider = false, 
            recentlyUsedItem = v115 or false, 
            activated = function() --[[ Line: 818 ]] --[[ Name: activated ]]
                -- upvalues: v112 (copy), v113 (copy)
                v112:activate(v113);
            end
        };
    else
        return {
            id = v113, 
            children = {}, 
            order = v116, 
            activated = noop, 
            integration = v32
        };
    end;
end;
reverseOrder = function(v117) --[[ Line: 833 ]] --[[ Name: reverseOrder ]]
    local v118 = #v117;
    local v119 = {};
    for v120 = 1, v118 do
        v119[v120] = v117[v120].order;
    end;
    for v121 = 1, v118 do
        v117[v121].order = v119[v118 - v121 + 1];
    end;
end;
v31.updateMenuList = function(v122) --[[ Line: 846 ]] --[[ Name: updateMenuList ]]
    -- upvalues: v32 (copy), v31 (copy), l_GetFFlagEnableChromePinIntegrations_0 (copy), l_GetFFlagChromePeekArchitecture_0 (copy), l_reverse_0 (copy)
    local v123 = 0;
    local v124 = 0;
    local function v127(v125, v126) --[[ Line: 850 ]] --[[ Name: iconProps ]]
        -- upvalues: v124 (ref), v122 (copy)
        v124 = v124 + 1;
        return v122:createIconProps(v125, v124, v126);
    end;
    local function v130(v128, v129) --[[ Line: 855 ]] --[[ Name: containerProps ]]
        -- upvalues: v124 (ref), v122 (copy)
        v124 = v124 + 1;
        return v122:createContainerProps(v128, v124, v129);
    end;
    local function v132(v131) --[[ Line: 860 ]] --[[ Name: windowProps ]]
        -- upvalues: v124 (ref), v122 (copy), v32 (ref)
        v124 = v124 + 1;
        if v122._integrations[v131] then
            return {
                id = v131, 
                children = {}, 
                order = v124, 
                component = v122._integrations[v131].components.Window, 
                activated = noop, 
                integration = v122._integrations[v131]
            };
        else
            return {
                id = v131, 
                children = {}, 
                order = v124, 
                activated = noop, 
                integration = v32
            };
        end;
    end;
    local function v134(_) --[[ Line: 882 ]] --[[ Name: divider ]]
        -- upvalues: v123 (ref), v124 (ref), v32 (ref)
        v123 = v123 + 1;
        v124 = v124 + 1;
        return {
            id = "DIV" .. v123, 
            order = v124, 
            isDivider = true, 
            children = {}, 
            activated = noop, 
            integration = v32
        };
    end;
    local function _(v135) --[[ Line: 895 ]] --[[ Name: valid ]]
        -- upvalues: v122 (copy), v31 (ref)
        local v136 = v122._integrations[v135];
        if v136 then
            local l_availability_0 = v136.availability;
            return l_availability_0 and l_availability_0:get() ~= v31.AvailabilitySignal.Unavailable;
        else
            return false;
        end;
    end;
    local function v139(v140, v141, v142, v143) --[[ Line: 906 ]] --[[ Name: collectMenu ]]
        -- upvalues: v31 (ref), v139 (copy), v122 (copy), l_GetFFlagEnableChromePinIntegrations_0 (ref), v134 (copy), v123 (ref), v124 (ref), v132 (copy), v127 (copy), v130 (copy)
        local v144 = 0;
        for v145, v146 in pairs(v140) do
            if v146 == v31.Key.MostRecentlyUsed then
                v139(v122._mostRecentlyUsed, v141, v142);
            elseif l_GetFFlagEnableChromePinIntegrations_0() and v146 == v31.Key.UserPinned then
                v139(v122._userPins, v141, v142);
            elseif type(v146) == "table" then
                if not #v141.children then
                    table.insert(v141.children, (v134(v123)));
                end;
                if v139(v146, v141, v142) > 0 then
                    table.insert(v141.children, (v134(v123)));
                end;
            else
                if typeof(v146) ~= "string" then
                    error((("Only tables or strings should be passed into the items list, received %* (at key %*)"):format(v146, v145)));
                end;
                if v122._subMenuConfig[v146] then
                    local v147 = v122._integrations[v146];
                    local v148;
                    if v147 then
                        local l_availability_1 = v147.availability;
                        v148 = l_availability_1 and l_availability_1:get() ~= v31.AvailabilitySignal.Unavailable;
                    else
                        v148 = false;
                    end;
                    if v148 then
                        v124 = v124 + 1;
                        v148 = v122:createIconProps(v146, v124, v143);
                        v144 = v144 + 1;
                        v139(v122._subMenuConfig[v146], v148, v142);
                        if #v148.children > 0 then
                            table.insert(v141.children, v148);
                        end;
                    end;
                else
                    local v150 = v122._integrations[v146];
                    local v151;
                    if v150 then
                        local l_availability_2 = v150.availability;
                        v151 = l_availability_2 and l_availability_2:get() ~= v31.AvailabilitySignal.Unavailable;
                    else
                        v151 = false;
                    end;
                    if v151 then
                        if v122:isWindowOpen(v146) then
                            table.insert(v142, (v132(v146)));
                            table.insert(v141.children, v127(v146));
                            v144 = v144 + 1;
                        else
                            if v122._integrations[v146].components.Container then
                                table.insert(v141.children, v130(v146));
                            else
                                table.insert(v141.children, v127(v146));
                            end;
                            v144 = v144 + 1;
                        end;
                    end;
                end;
            end;
        end;
        return v144;
    end;
    local v153 = {
        children = {}
    };
    local v154 = {};
    local v155 = v122._currentCompactUtility:get();
    if v155 and v122._compactUtilityConfig[v155] then
        v139(v122._compactUtilityConfig[v155], v153, v154);
    else
        v139(v122._menuConfig, v153, v154);
    end;
    local v156 = nil;
    if l_GetFFlagChromePeekArchitecture_0() then
        v156 = {
            children = {}
        };
        local v157 = v122._peekService:getCurrentPeek();
        local v158 = if v157 then v122._peekService:getPeekConfig(v157) else nil;
        if v158 then
            v139(v158.integrations, v156, v154);
        end;
    end;
    if #v153.children and v153.children[#v153.children] and v153.children[#v153.children].isDivider then
        table.remove(v153.children, #v153.children);
    end;
    if v122._orderAlignment:get() == Enum.HorizontalAlignment.Left then
        v153.children = l_reverse_0(v153.children);
        reverseOrder(v153.children);
    end;
    if v155 and v122._compactUtilityConfig[v155] then
        for _, v160 in v122._windowList:get() do
            if v122:isWindowOpen(v160.integration.id) then
                table.insert(v154, v160);
            end;
        end;
    end;
    v122._menuList:set(v153.children);
    v122._windowList:set(v154);
    if l_GetFFlagChromePeekArchitecture_0() then
        v122._peekList:set(v156.children);
    end;
    v122:repairSelected();
end;
v31.availabilityChanged = function(v161, _) --[[ Line: 1016 ]] --[[ Name: availabilityChanged ]]
    v161:updateNotificationTotals();
    v161:updateMenuList();
end;
v31.containerWidthSlotsChanged = function(v163, _) --[[ Line: 1022 ]] --[[ Name: containerWidthSlotsChanged ]]
    v163:updateMenuList();
end;
v31.subMenuNotifications = function(v165, v166) --[[ Line: 1026 ]] --[[ Name: subMenuNotifications ]]
    -- upvalues: l_NotifySignal_0 (copy)
    if not v165._subMenuNotifications[v166] then
        v165._subMenuNotifications[v166] = l_NotifySignal_0.new(true);
    end;
    return v165._subMenuNotifications[v166];
end;
v31.totalNotifications = function(v167) --[[ Line: 1033 ]] --[[ Name: totalNotifications ]]
    return v167._totalNotifications;
end;
v31.onIntegrationRegistered = function(v168) --[[ Line: 1037 ]] --[[ Name: onIntegrationRegistered ]]
    return v168._onIntegrationRegistered;
end;
v31.onIntegrationActivated = function(v169) --[[ Line: 1041 ]] --[[ Name: onIntegrationActivated ]]
    return v169._onIntegrationActivated;
end;
v31.onIntegrationHovered = function(v170) --[[ Line: 1045 ]] --[[ Name: onIntegrationHovered ]]
    return v170._onIntegrationHovered;
end;
v31.onIntegrationStatusChanged = function(v171) --[[ Line: 1049 ]] --[[ Name: onIntegrationStatusChanged ]]
    return v171._onIntegrationStatusChanged;
end;
v31.integrations = function(v172) --[[ Line: 1053 ]] --[[ Name: integrations ]]
    return v172._integrations;
end;
v31.userPins = function(v173) --[[ Line: 1057 ]] --[[ Name: userPins ]]
    return v173._userPins;
end;
v31.mostRecentlyUsed = function(v174) --[[ Line: 1061 ]] --[[ Name: mostRecentlyUsed ]]
    return v174._mostRecentlyUsed;
end;
v31.updateNotificationTotals = function(v175) --[[ Line: 1065 ]] --[[ Name: updateNotificationTotals ]]
    -- upvalues: v31 (copy)
    local v176 = 0;
    for _, v178 in v175._integrations do
        if v178.availability:get() ~= v31.AvailabilitySignal.Unavailable and v178.availability:get() ~= v31.AvailabilitySignal.Pinned and not v178.notification:excludeFromTotalCounts() then
            local v179 = v178.notification:get();
            if v179 and v179.type == "count" then
                assert(typeof(v179.value) == "number", "Expected count value to be number");
                v176 = v176 + v179.value;
            end;
        end;
    end;
    v175._totalNotifications:fireCount(v176);
    for v180, v181 in v175._subMenuNotifications do
        local v182 = v175:withinCurrentTopLevelMenu(v180);
        v176 = 0;
        if v182 then
            for _, v184 in v182.children do
                if not v175:withinCurrentTopLevelMenu(v184.id) and v184.integration.availability:get() ~= v31.AvailabilitySignal.Unavailable and not v184.integration.notification:excludeFromTotalCounts() then
                    local v185 = v184.integration.notification:get();
                    if v185 and v185.type == "count" then
                        assert(typeof(v185.value) == "number", "Expected count value to be number");
                        v176 = v176 + v185.value;
                    end;
                end;
            end;
            v181:fireCount(v176);
        end;
    end;
end;
v31.configureReset = function(v186) --[[ Line: 1109 ]] --[[ Name: configureReset ]]
    v186._menuConfig = {};
    v186._subMenuConfig = {};
    v186._compactUtilityConfig = {};
    v186._subMenuNotifications = {};
    v186:updateMenuList();
end;
v31.configureMenu = function(v187, v188) --[[ Line: 1117 ]] --[[ Name: configureMenu ]]
    v187._menuConfig = v188;
    v187:updateNotificationTotals();
    v187:updateMenuList();
end;
v31.configureSubMenu = function(v189, v190, v191) --[[ Line: 1123 ]] --[[ Name: configureSubMenu ]]
    -- upvalues: l_NotifySignal_0 (copy)
    v189._subMenuConfig[v190] = v191;
    if not v189._subMenuNotifications[v190] then
        v189._subMenuNotifications[v190] = l_NotifySignal_0.new(true);
    end;
    v189:updateNotificationTotals();
    v189:updateMenuList();
end;
if l_GetFFlagChromePeekArchitecture_0() then
    v31.configurePeek = function(v192, v193, v194) --[[ Line: 1133 ]] --[[ Name: configurePeek ]]
        v192._peekService:configurePeek(v193, v194);
    end;
    v31.tryShowPeek = function(v195, v196) --[[ Line: 1137 ]] --[[ Name: tryShowPeek ]]
        return v195._peekService:tryShowPeek(v196);
    end;
    v31.lockCurrentPeek = function(v197) --[[ Line: 1141 ]] --[[ Name: lockCurrentPeek ]]
        return v197._peekService:lockCurrentPeek();
    end;
    v31.unlockCurrentPeek = function(v198) --[[ Line: 1145 ]] --[[ Name: unlockCurrentPeek ]]
        return v198._peekService:unlockCurrentPeek();
    end;
    v31.dismissPeek = function(v199, v200) --[[ Line: 1149 ]] --[[ Name: dismissPeek ]]
        v199._peekService:dismissPeek(v200);
    end;
    v31.dismissCurrentPeek = function(v201) --[[ Line: 1153 ]] --[[ Name: dismissCurrentPeek ]]
        local v202 = v201._peekService:getCurrentPeek();
        if v202 then
            v201:dismissPeek(v202);
        end;
    end;
end;
v31.getCurrentUtility = function(v203) --[[ Line: 1161 ]] --[[ Name: getCurrentUtility ]]
    return v203._currentCompactUtility;
end;
v31.gesture = function(v204, v205, v206, v207) --[[ Line: 1165 ]] --[[ Name: gesture ]]
    if v204._integrations[v205] then
        v204._dragConnection[v205] = {
            connection = v206, 
            inputObject = v207
        };
    end;
end;
v31.withinCurrentTopLevelMenu = function(v208, v209) --[[ Line: 1178 ]] --[[ Name: withinCurrentTopLevelMenu ]]
    for v210, v211 in (v208._menuList:get()) do
        if v211.id == v209 then
            return v211, v210;
        end;
    end;
    return nil, 0;
end;
v31.withinCurrentSubmenu = function(v212, v213) --[[ Line: 1188 ]] --[[ Name: withinCurrentSubmenu ]]
    local v214 = v212._currentSubMenu:get();
    if not v214 then
        return false;
    else
        local v215 = v212._menuList:get();
        local v216 = nil;
        for _, v218 in v215 do
            if v218.id == v214 then
                v216 = v218.children;
                break;
            end;
        end;
        if not v216 then
            return false;
        else
            for _, v220 in v216 do
                if v220.id == v213 then
                    return true;
                end;
            end;
            return false;
        end;
    end;
end;
v31.removeRecentlyUsed = function(v221, v222) --[[ Line: 1217 ]] --[[ Name: removeRecentlyUsed ]]
    local v223 = table.find(v221._mostRecentlyUsedFullRecord, v222);
    if v223 then
        table.remove(v221._mostRecentlyUsedFullRecord, v223);
    end;
    v221:rebuildMostRecentlyUsed();
end;
v31.isUserPinned = function(v224, v225) --[[ Line: 1226 ]] --[[ Name: isUserPinned ]]
    -- upvalues: l_GetFFlagEnableChromePinIntegrations_0 (copy)
    return l_GetFFlagEnableChromePinIntegrations_0() and table.find(v224._userPins, v225) ~= nil;
end;
v31.removeUserPin = function(v226, v227) --[[ Line: 1230 ]] --[[ Name: removeUserPin ]]
    -- upvalues: l_GetFFlagEnableChromePinIntegrations_0 (copy), l_GetFFlagEnableSaveUserPins_0 (copy), v9 (copy)
    if not l_GetFFlagEnableChromePinIntegrations_0() then
        return;
    else
        local v228 = table.find(v226._userPins, v227);
        if v228 then
            table.remove(v226._userPins, v228);
        end;
        if l_GetFFlagEnableSaveUserPins_0() then
            v9.storeForLocalPlayer("ChromePinned", v226._userPins);
        end;
        v226:updateMenuList();
        v226:updateNotificationTotals();
        return;
    end;
end;
v31.setUserPin = function(v229, v230, v231) --[[ Line: 1248 ]] --[[ Name: setUserPin ]]
    -- upvalues: l_GetFFlagEnableChromePinIntegrations_0 (copy), l_GetFFlagEnableSaveUserPins_0 (copy), v9 (copy)
    if (v231 or v229:withinCurrentSubmenu(v230) and not v229:isUserPinned(v230)) and #v229._userPins < v229._mostRecentlyUsedAndPinnedLimit and l_GetFFlagEnableChromePinIntegrations_0() then
        table.insert(v229._userPins, v230);
        if l_GetFFlagEnableSaveUserPins_0() then
            v9.storeForLocalPlayer("ChromePinned", v229._userPins);
        end;
        v229:removeRecentlyUsed(v230);
    end;
end;
v31.areUserPinsFull = function(v232) --[[ Line: 1265 ]] --[[ Name: areUserPinsFull ]]
    -- upvalues: l_GetFFlagEnableChromePinIntegrations_0 (copy)
    return l_GetFFlagEnableChromePinIntegrations_0() and v232._mostRecentlyUsedAndPinnedLimit <= #v232._userPins;
end;
v31.windowPosition = function(v233, v234) --[[ Line: 1269 ]] --[[ Name: windowPosition ]]
    return v233._windowPositions[v234];
end;
v31.updateWindowPosition = function(v235, v236, v237) --[[ Line: 1273 ]] --[[ Name: updateWindowPosition ]]
    -- upvalues: v28 (copy), v9 (copy)
    if v28() and v9.isEnabled() and v235._integrations[v236] and v235._integrations[v236].persistWindowState then
        local v238 = v9.loadForLocalPlayer("ChromeWindowPosition") or {};
        v238[v236] = {
            v237.X.Scale, 
            v237.X.Offset, 
            v237.Y.Scale, 
            v237.Y.Offset
        };
        v9.storeForLocalPlayer("ChromeWindowPosition", v238);
    end;
    v235._windowPositions[v236] = v237;
end;
v31.getWindowStatusFromStore = function(_, v240) --[[ Line: 1286 ]] --[[ Name: getWindowStatusFromStore ]]
    -- upvalues: v27 (copy), v9 (copy)
    if v27() and v9.isEnabled() then
        return (v9.loadForLocalPlayer("ChromeWindowStatus") or {})[v240] or false;
    else
        return nil;
    end;
end;
v31.getWindowPositionFromStore = function(_, v242) --[[ Line: 1296 ]] --[[ Name: getWindowPositionFromStore ]]
    -- upvalues: v28 (copy), v9 (copy)
    if v28() and v9.isEnabled() then
        local v243 = (v9.loadForLocalPlayer("ChromeWindowPosition") or {})[v242] or nil;
        if v243 then
            return (UDim2.new(v243[1], v243[2], v243[3], v243[4]));
        else
            return nil;
        end;
    else
        return nil;
    end;
end;
v31.activate = function(v244, v245) --[[ Line: 1307 ]] --[[ Name: activate ]]
    local v246 = nil;
    if v244._integrations[v245] then
        local l_activated_0 = v244._integrations[v245].activated;
        v244._onIntegrationActivated:fire(v245);
        v244:storeChromeInteracted();
        if l_activated_0 then
            local l_status_2, l_result_2 = pcall(function() --[[ Line: 1319 ]]
                -- upvalues: l_activated_0 (copy), v244 (copy), v245 (copy)
                l_activated_0(v244._integrations[v245]);
            end);
            if not l_status_2 then
                warn("ChromeService: activate error thrown for " .. v245);
                v246 = l_result_2;
            end;
        else
            if v244._subMenuConfig[v245] then
                v244:toggleSubMenu(v245);
            end;
            v244:toggleWindow(v245);
        end;
        if v244._currentSubMenu:get() ~= v245 then
            v244._currentSubMenu:set(nil);
        end;
    end;
    if v246 then
        error(v246);
    end;
end;
v31.selectedItem = function(v250) --[[ Line: 1344 ]] --[[ Name: selectedItem ]]
    return v250._selectedItem;
end;
v31.setSelected = function(v251, v252) --[[ Line: 1348 ]] --[[ Name: setSelected ]]
    -- upvalues: l_UserInputService_0 (copy)
    local v253, v254 = v251:withinCurrentTopLevelMenu(v252 or "");
    if not v253 then
        return;
    else
        local l_l_UserInputService_0_LastInputType_0 = l_UserInputService_0:GetLastInputType();
        local v256 = true;
        if l_l_UserInputService_0_LastInputType_0 ~= Enum.UserInputType.MouseButton1 then
            v256 = l_l_UserInputService_0_LastInputType_0 == Enum.UserInputType.Touch;
        end;
        local v257 = v251._currentSubMenu:get();
        if v257 and v257 ~= v252 and not v256 then
            v251:toggleSubMenu(v257);
        end;
        v251._selectedItemIdx = v254;
        v251._selectedItem:set(v252);
        return;
    end;
end;
v31.setSelectedByOffset = function(v258, v259) --[[ Line: 1366 ]] --[[ Name: setSelectedByOffset ]]
    local v260 = v258._menuList:get();
    local _, v262 = v258:withinCurrentTopLevelMenu(v258._selectedItem:get() or "");
    if v262 > 0 then
        v258:setSelected(v260[math.clamp(v262 + v259, 1, #v260)].id);
    end;
end;
v31.repairSelected = function(v263) --[[ Line: 1376 ]] --[[ Name: repairSelected ]]
    if v263._selectedItem:get() then
        local _, v265 = v263:withinCurrentTopLevelMenu(v263._selectedItem:get() or "");
        if v265 == 0 then
            v265 = v263._selectedItemIdx;
        end;
        local v266 = v263._menuList:get();
        v263:setSelected(v266[math.clamp(v265, 1, #v266)].id);
    end;
end;
v31.configureOrderAlignment = function(v267, v268) --[[ Line: 1390 ]] --[[ Name: configureOrderAlignment ]]
    if v267._orderAlignment:get() ~= v268 then
        v267._orderAlignment:set(v268);
        v267:updateMenuList();
    end;
end;
v31.orderAlignment = function(v269) --[[ Line: 1397 ]] --[[ Name: orderAlignment ]]
    return v269._orderAlignment;
end;
v31.setMenuAbsolutePosition = function(v270, v271) --[[ Line: 1401 ]] --[[ Name: setMenuAbsolutePosition ]]
    if v271 ~= v270._menuAbsolutePosition then
        v270._menuAbsolutePosition = v271;
        v270._layout:set(createUnibarLayoutInfo(v271, v270._menuAbsoluteSizeClosed, v270._menuAbsoluteSizeOpen));
    end;
end;
v31.setMenuAbsoluteSize = function(v272, v273, v274) --[[ Line: 1408 ]] --[[ Name: setMenuAbsoluteSize ]]
    if v273 ~= v272._menuAbsoluteSizeClosed or v274 ~= v272._menuAbsoluteSizeOpen then
        v272._menuAbsoluteSizeClosed = v273;
        v272._menuAbsoluteSizeOpen = v274;
        v272._layout:set(createUnibarLayoutInfo(v272._menuAbsolutePosition, v273, v274));
    end;
end;
v31.layout = function(v275) --[[ Line: 1416 ]] --[[ Name: layout ]]
    return v275._layout;
end;
return v31;