local l_script_FirstAncestor_0 = script:FindFirstAncestor("ChromeShared");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_GuiService_0 = game:GetService("GuiService");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Players_0 = game:GetService("Players");
local l_game_EngineFeature_0 = game:GetEngineFeature("RbxAnalyticsServiceExposePlaySessionId");
local l_PlayerGui_0 = l_Players_0.LocalPlayer:FindFirstChildOfClass("PlayerGui");
local v9 = require(l_CorePackages_0.Packages.Cryo);
local l_GetFFlagRemoveChromeRobloxGuiReferences_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagRemoveChromeRobloxGuiReferences;
local v11 = nil;
if not l_GetFFlagRemoveChromeRobloxGuiReferences_0() then
    v11 = require(l_RobloxGui_0.Modules.Common.PerfUtils);
end;
local v12 = require(l_script_FirstAncestor_0.Service);
local v13 = require(l_script_FirstAncestor_0.Unibar.Constants);
local _ = require(l_script_FirstAncestor_0.Service.Types);
local v15 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableChromePinAnalytics();
local v16 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableChromeAnalytics();
local v17 = game:DefineFastFlag("EnabledChromeIntegrationIsActivated", false);
local v18 = require(l_script_FirstAncestor_0.Parent.Flags.GetFFlagChromeTrackWindowPosition);
local v19 = require(l_script_FirstAncestor_0.Analytics.Tracker);
local v20 = {
    INACTIVE = 0, 
    ACTIVE = 1
};
local v21 = {
    NONE = 0, 
    STARTED = 1, 
    DRAGGED = 2
};
local v22 = {};
v22.__index = v22;
local function v25() --[[ Line: 109 ]] --[[ Name: getDynamicEventProps ]]
    -- upvalues: l_PlayerGui_0 (copy), v13 (copy), l_UserInputService_0 (copy), l_GetFFlagRemoveChromeRobloxGuiReferences_0 (copy), v11 (ref)
    local v23 = "Unknown";
    if l_PlayerGui_0 then
        v23 = v13.ANALYTICS.SCREEN_ORIENTATION_MAP[l_PlayerGui_0.CurrentScreenOrientation] or tostring(l_PlayerGui_0.CurrentScreenOrientation);
    end;
    local v24 = v13.ANALYTICS.INPUT_TYPE_MAP[l_UserInputService_0:GetLastInputType()] or tostring(l_UserInputService_0:GetLastInputType());
    return {
        screen_orientation = v23, 
        last_input_device = v24, 
        fps = if not l_GetFFlagRemoveChromeRobloxGuiReferences_0() then v11.getFps() else nil
    };
end;
local function v29() --[[ Line: 127 ]] --[[ Name: getVisibleIntegrationIds ]]
    -- upvalues: v12 (copy)
    local v26 = {};
    for _, v28 in (v12:menuList():get()) do
        if v28.integration and not v28.isDivider then
            table.insert(v26, v28.integration.id);
        end;
    end;
    return table.concat(v26, ",");
end;
local function _(v30, v31) --[[ Line: 138 ]] --[[ Name: getTrackerName ]]
    return v30 .. v31;
end;
local function _(v33) --[[ Line: 142 ]] --[[ Name: getIntegration ]]
    -- upvalues: v12 (copy)
    return v12:integrations()[v33];
end;
local function _(v35) --[[ Line: 146 ]] --[[ Name: getInteractionSource ]]
    -- upvalues: v12 (copy)
    if v12:withinCurrentSubmenu(v35) then
        return v12:currentSubMenu():get();
    elseif v12:withinCurrentTopLevelMenu(v35) then
        return "unibar";
    else
        return "unknown";
    end;
end;
v22.new = function() --[[ Line: 157 ]] --[[ Name: new ]]
    -- upvalues: l_RbxAnalyticsService_0 (copy), v19 (copy), v22 (copy), l_game_EngineFeature_0 (copy), v16 (copy), v12 (copy), v20 (copy), v9 (copy), v25 (copy), l_GuiService_0 (copy)
    local v37 = setmetatable({
        _target = "client", 
        _context = "chrome", 
        _defaultProps = {
            screen_width = 0, 
            screen_height = 0, 
            universeid = tostring(game.GameId), 
            placeid = tostring(game.PlaceId), 
            sessionid = l_RbxAnalyticsService_0:GetSessionId(), 
            is_game_menu_opened = false
        }, 
        _tracker = v19.new()
    }, v22);
    if l_game_EngineFeature_0 then
        v37._defaultProps.playsessionid = l_RbxAnalyticsService_0:GetPlaySessionId();
    end;
    if not v16 then
        return v37;
    else
        v37._observeIntegration = function(v38) --[[ Line: 182 ]]
            -- upvalues: v12 (ref), v37 (copy), v20 (ref)
            local v39 = v12:integrations()[v38];
            if v39 and v39.windowSize then
                v37._tracker:set("window_size_" .. v38, v39.windowSize:get());
                v39.windowSize:connect(function(v40) --[[ Line: 191 ]]
                    -- upvalues: v39 (copy), v37 (ref), v38 (copy), v20 (ref)
                    if typeof(v40) ~= "UDim2" then
                        return;
                    else
                        local v41 = v39.windowSize:get();
                        local v42 = v37._tracker:get("window_status_" .. v38);
                        local v43 = "window_size_" .. v38;
                        if v42 == v20.ACTIVE then
                            if v37._tracker:get(v43) then
                                v37:onWindowResize(v38, v41);
                            end;
                            v37._tracker:set(v43, v41);
                        end;
                        return;
                    end;
                end);
            end;
        end;
        v37._resetWindowTrackers = function(v44) --[[ Line: 214 ]]
            -- upvalues: v37 (copy)
            v37._tracker:reset("window_dposition_" .. v44);
            v37._tracker:reset("window_position_" .. v44);
            v37._tracker:reset("window_size_" .. v44);
            v37._tracker:reset("window_drag_" .. v44);
            v37._tracker:reset("window_status_" .. v44);
        end;
        v37._defaultWindowTrackers = function(v45) --[[ Line: 222 ]]
            -- upvalues: v37 (copy), v20 (ref)
            v37._resetWindowTrackers(v45);
            v37._tracker:startTime("window_time_" .. v45);
            v37._tracker:set("window_status_" .. v45, v20.ACTIVE);
        end;
        v37._sendEvent = function(v46, v47) --[[ Line: 228 ]]
            -- upvalues: v9 (ref), v25 (ref), v37 (copy), l_RbxAnalyticsService_0 (ref)
            local v48 = v9.Dictionary.join(v25(), v37._defaultProps, v47 or {});
            l_RbxAnalyticsService_0:SendEventDeferred(v37._target, v37._context, v46, v48);
        end;
        v37._calculateWindowAbsolutePosition = function(v49, v50) --[[ Line: 233 ]]
            -- upvalues: v37 (copy)
            local l_screen_width_0 = v37._defaultProps.screen_width;
            local l_screen_height_0 = v37._defaultProps.screen_height;
            return Vector2.new(v49.X.Scale * l_screen_width_0 + v49.X.Offset - v50.Width.Offset / 2, v49.Y.Scale * l_screen_height_0 + v49.Y.Offset - v50.Height.Offset / 2);
        end;
        v37._setWindowLastPosition = function(v53, v54) --[[ Line: 242 ]]
            -- upvalues: v37 (copy)
            v37._tracker:set("window_position_" .. v53, v54);
        end;
        v12:status():connect(function(v55) --[[ Line: 246 ]]
            -- upvalues: v37 (copy)
            v37:onUnibarToggle(v55);
        end);
        l_GuiService_0.MenuOpened:Connect(function() --[[ Line: 250 ]]
            -- upvalues: v37 (copy)
            v37._defaultProps.is_game_menu_opened = not v37._defaultProps.is_game_menu_opened;
        end);
        for _, v57 in v12:integrations() do
            v37._observeIntegration(v57.id);
        end;
        v12:onIntegrationRegistered():connect(function(v58) --[[ Line: 258 ]]
            -- upvalues: v37 (copy)
            v37._observeIntegration(v58);
        end);
        v12:onIntegrationActivated():connect(function(v59) --[[ Line: 262 ]]
            -- upvalues: v37 (copy)
            v37:onIconActivated(v59);
        end);
        v12:onIntegrationStatusChanged():connect(function(v60, v61) --[[ Line: 266 ]]
            -- upvalues: v12 (ref), v37 (copy)
            local v62 = v12:integrations()[v60];
            if v62 and v62.components.Window then
                if v61 == v12.IntegrationStatus.Window then
                    v37:onWindowOpened(v60);
                    return;
                else
                    v37:onWindowClosed(v60);
                end;
            end;
        end);
        return v37;
    end;
end;
v22.setPin = function(v63, v64, v65, v66) --[[ Line: 280 ]] --[[ Name: setPin ]]
    -- upvalues: v15 (copy), v13 (copy), v12 (copy)
    if v15 then
        local v67 = if v65 then v13.ANALYTICS.PIN_ADDED else v13.ANALYTICS.PIN_REMOVED;
        v63._sendEvent(v67, {
            integration_id = v64, 
            source = if v12:withinCurrentSubmenu(v64) then v12:currentSubMenu():get() else v12:withinCurrentTopLevelMenu(v64) and "unibar" or "unknown", 
            user_pins = table.concat(v66, ",")
        });
    end;
    return nil;
end;
v22.setScreenSize = function(v68, v69) --[[ Line: 292 ]] --[[ Name: setScreenSize ]]
    v68._defaultProps.screen_width = v69.X;
    v68._defaultProps.screen_height = v69.Y;
    return nil;
end;
v22.onUnibarToggle = function(v70, v71) --[[ Line: 298 ]] --[[ Name: onUnibarToggle ]]
    -- upvalues: v29 (copy), v9 (copy), v12 (copy), v13 (copy)
    local v72 = {
        visible_integrations = v29(), 
        mru_slots = #v9.Dictionary.keys(v12:mostRecentlyUsed())
    };
    if v71 == v12.MenuStatus.Open then
        v70._tracker:startTime("unibar_time");
        v70._sendEvent(v13.ANALYTICS.UNIBAR_OPENED, v72);
    elseif v71 == v12.MenuStatus.Closed then
        v72.total_open_time = v70._tracker:finishTime("unibar_time");
        v70._sendEvent(v13.ANALYTICS.UNIBAR_CLOSED, v72);
    end;
    return nil;
end;
v22.onIconActivated = function(v73, v74) --[[ Line: 314 ]] --[[ Name: onIconActivated ]]
    -- upvalues: v12 (copy), v17 (copy), v13 (copy)
    local v75 = v12:integrations()[v74];
    if v75 then
        local v76 = v75.notification:get();
        local v77 = 0;
        if v76.type == "count" then
            v77 = tonumber(v76.value) or 0;
        end;
        local v78 = if v75.isActivated and v17 then not v75.isActivated() else nil;
        v73._sendEvent(v13.ANALYTICS.ICON_ACTIVATED, {
            integration_id = v74, 
            source = if v12:withinCurrentSubmenu(v74) then v12:currentSubMenu():get() else v12:withinCurrentTopLevelMenu(v74) and "unibar" or "unknown", 
            notification_count = v77, 
            is_toggle_on = v78
        });
    end;
    return nil;
end;
v22.onIconTouchBegan = function(v79, v80) --[[ Line: 338 ]] --[[ Name: onIconTouchBegan ]]
    -- upvalues: v21 (copy)
    v79._tracker:set("icon_drag_" .. v80, v21.STARTED);
    return nil;
end;
v22.onIconDrag = function(v81, v82) --[[ Line: 343 ]] --[[ Name: onIconDrag ]]
    -- upvalues: v21 (copy), v13 (copy), v12 (copy)
    local v83 = "icon_drag_" .. v82;
    if v81._tracker:get(v83) == v21.STARTED then
        v81._tracker:set(v83, v21.DRAGGED);
        v81._sendEvent(v13.ANALYTICS.ICON_DRAG_START, {
            integration_id = v82, 
            source = if v12:withinCurrentSubmenu(v82) then v12:currentSubMenu():get() else v12:withinCurrentTopLevelMenu(v82) and "unibar" or "unknown"
        });
    end;
    return nil;
end;
v22.onIconTouchEnded = function(v84, v85, v86, v87) --[[ Line: 356 ]] --[[ Name: onIconTouchEnded ]]
    -- upvalues: v12 (copy), v21 (copy), v13 (copy)
    local v88 = "icon_drag_" .. v85;
    local v89 = v84._tracker:get(v88);
    local v90 = v12:integrations()[v85];
    if v90 and v90.windowSize and v89 == v21.DRAGGED then
        v84._tracker:reset(v88);
        v84._setWindowLastPosition(v85, v86);
        local v91 = v90.windowSize:get();
        v84._sendEvent(v13.ANALYTICS.ICON_DRAG_END, {
            integration_id = v85, 
            source = if v12:withinCurrentSubmenu(v85) then v12:currentSubMenu():get() else v12:withinCurrentTopLevelMenu(v85) and "unibar" or "unknown", 
            window_position_x = v86.X, 
            window_position_y = v86.Y, 
            window_width = v91.Width.Offset, 
            window_height = v91.Height.Offset, 
            will_reposition = v87
        });
    end;
    return nil;
end;
v22.onWindowOpened = function(v92, v93) --[[ Line: 383 ]] --[[ Name: onWindowOpened ]]
    -- upvalues: v12 (copy), v20 (copy), v18 (copy), v21 (copy), v13 (copy)
    local v94 = v12:integrations()[v93];
    local v95 = v92._tracker:get("window_status_" .. v93);
    if v94 and v95 ~= v20.ACTIVE then
        v92._defaultWindowTrackers(v93);
        local v96 = v92._tracker:get("icon_drag_" .. v93);
        if v18() then
            local v97 = "window_dposition_" .. v93;
            if not v92._tracker:get(v97) and v94.windowSize then
                local v98 = v94.windowSize:get();
                if v98 then
                    local v99 = v12:windowPosition(v94.id) or v94.startingWindowPosition or UDim2.fromOffset(0, 0);
                    v92:setWindowDefaultPosition(v93, (v92._calculateWindowAbsolutePosition(v99, v98)));
                end;
            end;
        elseif v96 ~= v21.DRAGGED then
            local v100 = "window_dposition_" .. v93;
            if not v92._tracker:get(v100) and v94.windowSize and v94.startingWindowPosition then
                local v101 = v94.windowSize:get();
                if v101 then
                    v92:setWindowDefaultPosition(v93, (v92._calculateWindowAbsolutePosition(v94.startingWindowPosition, v101)));
                end;
            end;
        end;
        v92._sendEvent(v13.ANALYTICS.WINDOW_OPENED, {
            integration_id = v93
        });
    end;
    return nil;
end;
v22.onWindowClosed = function(v102, v103) --[[ Line: 430 ]] --[[ Name: onWindowClosed ]]
    -- upvalues: v20 (copy), v13 (copy)
    if v102._tracker:get("window_status_" .. v103) == v20.ACTIVE then
        v102._sendEvent(v13.ANALYTICS.WINDOW_CLOSED, {
            integration_id = v103, 
            total_open_time = v102._tracker:finishTime("window_time_" .. v103)
        });
        v102._resetWindowTrackers(v103);
    end;
    return nil;
end;
v22.onWindowTouchBegan = function(v104, v105, _) --[[ Line: 443 ]] --[[ Name: onWindowTouchBegan ]]
    -- upvalues: v12 (copy), v21 (copy)
    local v107 = v12:integrations()[v105];
    if v107 and v107.windowSize then
        v104._tracker:set("window_drag_" .. v105, v21.STARTED);
    end;
    return nil;
end;
v22.onWindowDrag = function(v108, v109, v110) --[[ Line: 451 ]] --[[ Name: onWindowDrag ]]
    -- upvalues: v12 (copy), v21 (copy), v13 (copy)
    local v111 = "window_drag_" .. v109;
    local v112 = v108._tracker:get(v111);
    local v113 = v12:integrations()[v109];
    if v113 and v113.windowSize and v112 == v21.STARTED then
        local v114 = v108._tracker:get("window_position_" .. v109);
        if v114 then
            local v115 = Vector2.new(v110.X - v114.X, v110.Y - v114.Y);
            if v115.X ~= 0 or v115.Y ~= 0 then
                v108._tracker:set(v111, v21.DRAGGED);
                local v116 = v113.windowSize:get();
                local v117 = v108._tracker:get("window_dposition_" .. v109);
                v108._sendEvent(v13.ANALYTICS.WINDOW_DRAG_START, {
                    integration_id = v109, 
                    position_x = v114.X, 
                    position_y = v114.Y, 
                    width = v116.Width.Offset, 
                    height = v116.Height.Offset, 
                    is_starting_position = v117 == v114
                });
            end;
        end;
    end;
    return nil;
end;
v22.onWindowTouchEnded = function(v118, v119, v120, v121) --[[ Line: 484 ]] --[[ Name: onWindowTouchEnded ]]
    -- upvalues: v12 (copy), v21 (copy), v13 (copy)
    local v122 = v118._tracker:get("icon_drag_" .. v119);
    local v123 = v12:integrations()[v119];
    if v122 == v21.DRAGGED then
        return v118:onIconTouchEnded(v119, v120, v121);
    else
        local v124 = "window_drag_" .. v119;
        local v125 = v118._tracker:get(v124);
        if v123 and v123.windowSize and v125 == v21.DRAGGED then
            local v126 = v123.windowSize:get();
            v118._tracker:reset(v124);
            v118._setWindowLastPosition(v119, v120);
            v118._sendEvent(v13.ANALYTICS.WINDOW_DRAG_END, {
                integration_id = v119, 
                position_x = v120.X, 
                position_y = v120.Y, 
                width = v126.Width.Offset, 
                height = v126.Height.Offset, 
                will_autoposition = v121
            });
        end;
        return nil;
    end;
end;
v22.setWindowDefaultPosition = function(v127, v128, v129) --[[ Line: 516 ]] --[[ Name: setWindowDefaultPosition ]]
    v127._tracker:set("window_dposition_" .. v128, v129);
    v127._setWindowLastPosition(v128, v129);
    return nil;
end;
v22.onWindowResize = function(v130, v131, v132) --[[ Line: 522 ]] --[[ Name: onWindowResize ]]
    -- upvalues: v12 (copy), v13 (copy)
    local v133 = v12:integrations()[v131];
    if v133 and v133.windowSize then
        local v134 = "window_size_" .. v131;
        local v135 = "window_position_" .. v131;
        local v136 = v130._tracker:get(v134);
        local v137 = v130._tracker:get(v135);
        local v138 = nil;
        if v137 then
            local v139 = (v136.Height.Offset - v132.Height.Offset) / 2;
            local v140 = (v136.Width.Offset - v132.Width.Offset) / 2;
            v138 = Vector2.new(v137.X + v140, v137.Y + v139);
        end;
        if v138 then
            v130._setWindowLastPosition(v131, v138);
        end;
        v130._tracker:set(v134, v132);
        v130._sendEvent(v13.ANALYTICS.WINDOW_RESIZE, {
            integration_id = v131, 
            previous_position_x = v137 and v137.X or nil, 
            previous_position_y = v137 and v137.Y or nil, 
            previous_width = v136 and v136.Width.Offset or nil, 
            previous_height = v136 and v136.Height.Offset or nil, 
            current_position_x = v138 and v138.X or nil, 
            current_position_y = v138 and v138.Y or nil, 
            current_width = v132.Width.Offset, 
            current_height = v132.Height.Offset
        });
    end;
    return nil;
end;
v22.default = v22.new();
return v22;