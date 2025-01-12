local l_script_FirstAncestor_0 = script:FindFirstAncestor("StreamNotifications");
local l_components_0 = l_script_FirstAncestor_0.components;
local l_Players_0 = game:GetService("Players");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v4 = require(l_script_FirstAncestor_0.constants);
local v5 = require(l_Parent_0.Cryo);
local l_EventIngest_0 = require(l_Parent_0.Analytics).AnalyticsReporters.EventIngest;
local l_EventIngestService_0 = game:GetService("EventIngestService");
local v8 = l_EventIngest_0.new(l_EventIngestService_0);
local l_SessionService_0 = game:GetService("SessionService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_GuiService_0 = game:GetService("GuiService");
local v12 = require(l_components_0.EmptyNotifications);
local v13 = require(l_components_0.MetaActionsMenu);
local v14 = require(l_components_0.StreamNotificationAnimationWrapper);
local v15 = require(l_components_0.StreamNotificationBundleWrapper);
local v16 = require(l_Parent_0.React);
local v17 = require(l_Parent_0.NotificationsCommon);
local l_JoinExperience_0 = v17.JoinExperience;
local l_type_0 = v17.type;
local l_NotificationHelper_0 = v17.NotificationHelper;
local v21 = require(l_script_FirstAncestor_0.EnumStreamNotificationsDisplayState);
local v22 = require(l_script_FirstAncestor_0.EnumStreamNotificationsLoadingMoreState);
local v23 = require(l_Parent_0.HttpRequest);
local v24 = v23.config({
    requestFunction = v23.requestFunctions.HttpRbxApi
});
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useDeviceType_0 = require(l_Parent_0.RobloxAppHooks).useDeviceType;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local v28 = require(l_Parent_0.UIBlox);
local l_useStyle_0 = v28.Core.Style.useStyle;
local l_LoadingSpinner_0 = v28.App.Loading.LoadingSpinner;
local l_NavigateDown_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateDown;
local v32 = require(l_script_FirstAncestor_0.utils.getStreamNotifications);
local v33 = require(l_script_FirstAncestor_0.utils.clearUnreadNotifications);
local v34 = require(l_script_FirstAncestor_0.utils.postNotificationsApi);
local v35 = require(l_script_FirstAncestor_0.utils.postReportNotification);
local v36 = require(l_script_FirstAncestor_0.utils.reportEvent);
local v37 = require(l_script_FirstAncestor_0.utils.sortNotifications);
local l_EventStream_0 = require(l_script_FirstAncestor_0.analytics.analyticsService).EventStream;
local v39 = require(l_script_FirstAncestor_0.analytics.analyticsConstants);
local v40 = game:DefineFastFlag("LuaAppNewStreamNotificationsLogFix", false);
return function(v41) --[[ Line: 66 ]]
    -- upvalues: l_useStyle_0 (copy), l_useDispatch_0 (copy), l_useDeviceType_0 (copy), v16 (copy), v21 (copy), v22 (copy), l_UserInputService_0 (copy), v4 (copy), v32 (copy), v24 (copy), v37 (copy), v5 (copy), l_NotificationHelper_0 (copy), l_EventStream_0 (copy), v39 (copy), v33 (copy), v35 (copy), l_Players_0 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy), v40 (copy), l_type_0 (copy), l_JoinExperience_0 (copy), l_SessionService_0 (copy), v36 (copy), v8 (copy), v34 (copy), v17 (copy), v13 (copy), l_LoadingSpinner_0 (copy), v15 (copy), v14 (copy), v12 (copy), l_GuiService_0 (copy)
    local v42 = l_useStyle_0();
    local v43 = l_useDispatch_0();
    local v44 = l_useDeviceType_0();
    local v45, v46 = v16.useState({});
    local v47, v48 = v16.useState(nil);
    local v49, v50 = v16.useState(v21.Initializing);
    local v51 = nil;
    local v52 = nil;
    local v53 = nil;
    local v55 = v41.showOverlay or function(_) --[[ Line: 86 ]]

    end;
    local v56 = v16.useRef(v22.Loading);
    local v57, v58 = v16.useState(v22.Loading);
    local v59 = v16.useRef(0);
    local v60 = if l_UserInputService_0.StatusBarSize then l_UserInputService_0.StatusBarSize.Y else 0;
    local v61 = v4.Modal.HeaderHeight + v60;
    v16.useEffect(function() --[[ Line: 95 ]]
        -- upvalues: v51 (ref)
        v51();
    end, {});
    local function _(v62) --[[ Line: 99 ]]
        -- upvalues: v56 (copy), v58 (copy)
        v56.current = v62;
        v58(v62);
    end;
    v51 = function() --[[ Line: 104 ]]
        -- upvalues: v56 (copy), v22 (ref), v58 (copy), v32 (ref), v24 (ref), v4 (ref), v59 (copy), v37 (ref), v46 (copy), v5 (ref), l_NotificationHelper_0 (ref), l_EventStream_0 (ref), v39 (ref), v50 (copy), v21 (ref), v33 (ref), v45 (copy), v51 (ref)
        if v56.current == v22.NoMoreNotifications then
            return;
        else
            local l_Loading_0 = v22.Loading;
            v56.current = l_Loading_0;
            v58(l_Loading_0);
            v32(v24, v4.DefaultMaxRows, v59.current):andThen(function(v65) --[[ Line: 112 ]]
                -- upvalues: v37 (ref), v46 (ref), v5 (ref), v22 (ref), v56 (ref), v58 (ref), l_NotificationHelper_0 (ref), l_EventStream_0 (ref), v39 (ref), v4 (ref), v50 (ref), v21 (ref), v33 (ref), v24 (ref), v59 (ref), v45 (ref), v51 (ref)
                v65 = v37(v65);
                if v65 and #v65 > 0 then
                    v46(function(v66) --[[ Line: 119 ]]
                        -- upvalues: v5 (ref), v65 (ref)
                        return (v5.List.join(v66, v65));
                    end);
                    local l_Default_0 = v22.Default;
                    v56.current = l_Default_0;
                    v58(l_Default_0);
                    for _, v69 in ipairs(v65) do
                        l_NotificationHelper_0.fireEvent(l_EventStream_0, v39.Context.fetched, v39.EventNames.notificationRetrieved, v5.Dictionary.join(v69.content.clientEventsPayload or {}, {
                            sendrVersion = v4.SENDRVersion, 
                            notificationType = v69.content.notificationType or nil, 
                            notificationId = v69.id or nil
                        }));
                    end;
                else
                    local l_NoMoreNotifications_0 = v22.NoMoreNotifications;
                    v56.current = l_NoMoreNotifications_0;
                    v58(l_NoMoreNotifications_0);
                end;
                v50(v21.Default);
                v33(v24);
                v59.current = (tonumber(v59.current) or 0) + v4.DefaultMaxRows;
                if v45 and #v45 < v4.DefaultMaxRows then
                    v51();
                end;
            end):catch(function(_) --[[ Line: 149 ]]
                -- upvalues: v50 (ref), v21 (ref)
                v50(v21.ErrorRetrieving);
            end);
            return;
        end;
    end;
    local function v79(v72, v73) --[[ Line: 154 ]]
        -- upvalues: v35 (ref), v24 (ref), v52 (ref), v41 (copy), v50 (copy), v21 (ref), v44 (copy), l_Players_0 (ref), v43 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref)
        local function v76() --[[ Line: 158 ]]
            -- upvalues: v35 (ref), v24 (ref), v73 (copy), v52 (ref), v72 (copy), v41 (ref), v50 (ref), v21 (ref)
            v35(v24, v73.id):andThen(function(_) --[[ Line: 160 ]]

            end):catch(function(_) --[[ Line: 161 ]]

            end);
            v52(v72, v73);
            v41.setDisplayScreenGuiEnabled(true);
            v50(v21.Default);
        end;
        local function v77() --[[ Line: 170 ]]
            -- upvalues: v41 (ref), v50 (ref), v21 (ref)
            v41.setDisplayScreenGuiEnabled(true);
            v50(v21.Default);
        end;
        v41.setDisplayScreenGuiEnabled(false);
        local v78 = {
            reportEntryPoint = "Notification", 
            assetId = v73.id, 
            reportSurface = string.lower(v44), 
            submissionEntryPoint = string.lower(v44), 
            submitterUserId = if l_Players_0.LocalPlayer then tostring(l_Players_0.LocalPlayer.UserId) else nil, 
            onSubmitReportCallback = v76, 
            onCloseCallback = v77
        };
        v43(l_NavigateDown_0({
            name = l_AppPage_0.ReportDialog, 
            reportData = v78
        }));
    end;
    local function _(v80) --[[ Line: 193 ]]
        -- upvalues: v53 (ref), v45 (copy), v5 (ref), v46 (copy)
        v53();
        if v45 and v80 then
            local v82 = v5.List.map(v45, function(v81) --[[ Line: 196 ]]
                -- upvalues: v80 (copy)
                if v81.id == v80 then
                    v81.dismiss = true;
                end;
                return v81;
            end);
            v46(v82);
        end;
    end;
    local v88 = v16.useCallback(function(v84) --[[ Line: 207 ]]
        -- upvalues: v45 (copy), v5 (ref), v46 (copy)
        if v45 and v84 then
            local v87 = v5.List.filter(v45, function(v85) --[[ Line: 209 ]]
                -- upvalues: v84 (copy)
                local v86 = false;
                if v85.id ~= v84 then
                    v86 = v85.dismiss ~= true;
                end;
                return v86;
            end);
            v46(v87);
        end;
    end);
    local v101 = v16.useCallback(function(v89, v90) --[[ Line: 219 ]]
        -- upvalues: v47 (copy), v48 (copy), l_NotificationHelper_0 (ref), l_EventStream_0 (ref), v39 (ref), v5 (ref), v40 (ref), v4 (ref), l_type_0 (ref), l_JoinExperience_0 (ref), v41 (copy), l_SessionService_0 (ref), v36 (ref), v8 (ref), v34 (ref), v24 (ref), v52 (ref), v53 (ref), v50 (copy), v21 (ref), v79 (copy), v45 (copy), v46 (copy)
        local v91 = v90 or v47;
        v48(v91);
        l_NotificationHelper_0.fireEvent(l_EventStream_0, v39.Context.click, v89.eventName or "", v5.Dictionary.join(v89.clientEventsPayload or {}, {
            notifType = if v40 then v91 and v91.content and v91.content.notificationType else nil, 
            notifId = if v40 then v91 and v91.id else nil, 
            visualItemType = v89.visualItemType or nil, 
            visualItemName = v89.visualItemName or nil, 
            sendrVersion = v4.SENDRVersion
        }));
        if v89.actions and #v89.actions > 0 and v91 then
            for _, v93 in ipairs(v89.actions) do
                if v93.actionType then
                    if v93.actionType == l_type_0.ActionTypeEnum.Deeplink then
                        if l_JoinExperience_0(v93.path, false) then
                            v41.displayStream(false);
                            l_SessionService_0:SetSession(v4.StreamSessionStructuralIdentifier.Level1, v4.StreamSessionStructuralIdentifier.StreamNotification, v4.StreamSessionStructuralIdentifier.StreamNotification);
                            l_SessionService_0:SetMetadata(v4.StreamSessionStructuralIdentifier.StreamNotification, v4.StreamSessionStructuralIdentifier.DeleteOnGameLeave, "True");
                            v36(v8, {
                                action_type = v93.actionType, 
                                delivery_channel = v4.DeliveryChannel, 
                                notification_type = v91.notificationSourceType, 
                                notification_id = v91.id
                            });
                        end;
                    elseif v93.actionType == l_type_0.ActionTypeEnum.NotificationApi then
                        local v94 = v91 and v91.id or nil;
                        local v95 = v93.path or nil;
                        v34(v24, v94, v95):andThen(function(_) --[[ Line: 278 ]]
                            -- upvalues: v93 (copy), v52 (ref), v91 (copy)
                            if v93.nextState ~= nil and v93.nextState ~= "" then
                                v52(v93.nextState, v91);
                            end;
                        end):catch(function(_) --[[ Line: 283 ]]

                        end);
                        v53();
                    elseif v93.actionType == l_type_0.ActionTypeEnum.Report then
                        v50(v21.AbuseReport);
                        v79(v93.nextState, v91);
                    elseif v93.actionType == l_type_0.ActionTypeEnum.Dismiss then
                        local l_id_0 = v91.id;
                        v53();
                        if v45 and l_id_0 then
                            local v100 = v5.List.map(v45, function(v99) --[[ Line: 196 ]]
                                -- upvalues: l_id_0 (copy)
                                if v99.id == l_id_0 then
                                    v99.dismiss = true;
                                end;
                                return v99;
                            end);
                            v46(v100);
                        end;
                    end;
                end;
            end;
        end;
    end);
    local function v103(v102) --[[ Line: 303 ]]
        -- upvalues: v48 (copy), v50 (copy), v21 (ref), l_NotificationHelper_0 (ref), l_EventStream_0 (ref), v39 (ref), v17 (ref), v4 (ref)
        v48(v102);
        v50(v21.MetaActions);
        l_NotificationHelper_0.fireEvent(l_EventStream_0, v39.Context.click, v39.EventNames.openMetaActions, {
            visualItemType = v17.type.VisualItemTypeEnum.MetaAction, 
            sendrVersion = v4.SENDRVersion
        });
    end;
    v53 = function() --[[ Line: 319 ]]
        -- upvalues: v55 (copy), v48 (copy), v49 (copy), v21 (ref), l_NotificationHelper_0 (ref), l_EventStream_0 (ref), v39 (ref), v17 (ref), v4 (ref), v50 (copy)
        v55(true);
        v48(nil);
        if v49 == v21.MetaActions then
            l_NotificationHelper_0.fireEvent(l_EventStream_0, v39.Context.click, v39.EventNames.closeMetaActions, {
                visualItemType = v17.type.VisualItemTypeEnum.MetaAction, 
                sendrVersion = v4.SENDRVersion
            });
        end;
        v50(v21.Default);
    end;
    v52 = function(v104, v105) --[[ Line: 336 ]]
        -- upvalues: v45 (copy), v46 (copy)
        local v106 = {};
        if v45 and v105 then
            for _, v108 in ipairs(v45) do
                if v108.id == v105.id then
                    v108.content.currentState = v104;
                end;
                table.insert(v106, v108);
            end;
        end;
        v46(v106);
    end;
    local v109 = v16.useMemo(function() --[[ Line: 352 ]]
        -- upvalues: v16 (ref), v13 (ref), v49 (copy), v47 (copy), v41 (copy), v101 (copy), v53 (ref)
        return v16.createElement(v13, {
            displayState = v49, 
            activeNotification = v47, 
            isSmallScreen = v41.isSmallScreen, 
            handleActions = v101, 
            closeNotificationDisplay = v53
        });
    end, {
        v49, 
        v47
    });
    local v119 = v16.useMemo(function() --[[ Line: 362 ]]
        -- upvalues: v49 (copy), v21 (ref), v16 (ref), l_LoadingSpinner_0 (ref), v4 (ref), v45 (copy), v15 (ref), v88 (copy), v101 (copy), v103 (copy), v14 (ref), v56 (copy), v22 (ref), v61 (copy), v12 (ref)
        if v49 == v21.Initializing then
            return v16.createElement(l_LoadingSpinner_0, {
                size = UDim2.fromOffset(v4.InitializingNotifications.Size, v4.InitializingNotifications.Size), 
                position = UDim2.fromScale(0.5, 0.5), 
                anchorPoint = Vector2.new(0.5, 0.5)
            });
        else
            if v45 and #v45 > 0 then
                local v110 = {
                    UIListLayout = v16.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Vertical, 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center
                    })
                };
                local v111 = false;
                local v112 = {};
                for _, v114 in ipairs(v45) do
                    if v114.notificationSourceType == "Sendr" then
                        v111 = true;
                        local l_bundleKey_0 = v114.content.bundleKey;
                        if l_bundleKey_0 and l_bundleKey_0 ~= "" then
                            if v112[l_bundleKey_0] then
                                table.insert(v112[l_bundleKey_0], v114);
                            else
                                v112[l_bundleKey_0] = {
                                    v114
                                };
                            end;
                        end;
                    end;
                end;
                for v116, v117 in ipairs(v45) do
                    if v117.notificationSourceType == "Sendr" then
                        local l_bundleKey_1 = v117.content.bundleKey;
                        if l_bundleKey_1 and l_bundleKey_1 ~= "" and #v112[l_bundleKey_1] > 1 then
                            if not v110[l_bundleKey_1] then
                                v110[l_bundleKey_1] = v16.createElement(v15, {
                                    layoutOrder = v116, 
                                    notifications = v112[l_bundleKey_1], 
                                    finishDismissNotification = v88, 
                                    handleActions = v101, 
                                    openMetaActions = v103
                                }, {});
                            end;
                        else
                            v110[v117.id] = v16.createElement(v14, {
                                layoutOrder = v116, 
                                notification = v117, 
                                finishDismissNotification = v88, 
                                handleActions = v101, 
                                openMetaActions = v103, 
                                collapsed = false
                            }, {});
                        end;
                    end;
                end;
                if v56.current == v22.Loading then
                    v110.LoadingMore = v16.createElement("Frame", {
                        Size = UDim2.new(1, 0, 0, v4.LoadingMoreNotifications.Size), 
                        BackgroundTransparency = 1, 
                        LayoutOrder = 1e999
                    }, {
                        LoadingMoreSpinner = v16.createElement(l_LoadingSpinner_0, {
                            size = UDim2.fromOffset(v4.LoadingMoreNotifications.Size, v4.LoadingMoreNotifications.Size), 
                            position = UDim2.fromScale(0.5, 0.5), 
                            anchorPoint = Vector2.new(0.5, 0.5)
                        })
                    });
                end;
                if v111 then
                    return v16.createElement("Frame", {
                        Size = UDim2.new(1, 0, 0, -v61), 
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        BackgroundTransparency = 1
                    }, v110);
                end;
            end;
            return v16.createElement(v12);
        end;
    end, {
        v45, 
        v49, 
        v57
    });
    local function v124(v120) --[[ Line: 488 ]]
        -- upvalues: v49 (copy), v21 (ref), v4 (ref), v56 (copy), v22 (ref), v51 (ref)
        local l_Y_0 = v120.AbsoluteCanvasSize.Y;
        local l_Y_1 = v120.AbsoluteWindowSize.Y;
        local l_Y_2 = v120.CanvasPosition.Y;
        if l_Y_1 == 0 or l_Y_0 == 0 or v49 ~= v21.Default then
            return;
        else
            if l_Y_0 - l_Y_1 - v4.LoadingMoreNotifications.TriggerDistance <= l_Y_2 and v56.current == v22.Default then
                v51();
            end;
            return;
        end;
    end;
    local v125 = if l_UserInputService_0.BottomBarSize then l_UserInputService_0.BottomBarSize.Y else 0;
    local v126 = if l_GuiService_0:GetSafeZoneOffsets() then l_GuiService_0:GetSafeZoneOffsets().bottom else 0;
    local v127 = if v41.isSmallScreen then math.max(v125, v126) else 0;
    return v16.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        Position = UDim2.new(0.5, 0, 0, 0), 
        AnchorPoint = Vector2.new(0.5, 0), 
        BackgroundTransparency = 1
    }, {
        MetaActionsOpen = v16.createElement("TextButton", {
            Size = UDim2.new(1, 0, 1, 0), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Visible = v49 == v21.MetaActions, 
            BackgroundTransparency = v42.Theme.Overlay.Transparency, 
            BackgroundColor3 = v42.Theme.Overlay.Color, 
            Text = "", 
            AutoButtonColor = false, 
            ZIndex = 2, 
            [v16.Event.Activated] = v53, 
            BorderSizePixel = 0
        }, {
            v109
        }), 
        NotificationsList = v16.createElement("ScrollingFrame", {
            Size = UDim2.new(1, 0, 1, -(v61 + v4.DefaultPadding + v127)), 
            CanvasSize = UDim2.new(1, 0, 1, -(v61 + v4.DefaultPadding + v127)), 
            BackgroundTransparency = 1, 
            Position = UDim2.new(0, 0, 0, v61), 
            AnchorPoint = Vector2.new(0, 0), 
            ScrollBarThickness = 4, 
            BorderSizePixel = 0, 
            VerticalScrollBarInset = Enum.ScrollBarInset.ScrollBar, 
            VerticalScrollBarPosition = Enum.VerticalScrollBarPosition.Right, 
            ScrollBarImageColor3 = v42.Theme.UIEmphasis.Color, 
            AutomaticCanvasSize = Enum.AutomaticSize.XY, 
            ElasticBehavior = Enum.ElasticBehavior.Always, 
            ScrollingEnabled = v49 == v21.Default, 
            ScrollingDirection = Enum.ScrollingDirection.Y, 
            [v16.Change.CanvasPosition] = v124
        }, v119)
    });
end;