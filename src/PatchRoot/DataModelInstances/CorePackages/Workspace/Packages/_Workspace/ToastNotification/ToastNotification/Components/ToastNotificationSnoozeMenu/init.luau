local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_0.dependencies);
local l_NotificationTypeEnum_0 = require(l_Parent_0.type).NotificationTypeEnum;
local l_ShowNotificationSnoozeMenuSignal_0 = require(l_Parent_0.Signals).ShowNotificationSnoozeMenuSignal;
local l_DismissNotificationSnoozeMenuSignal_0 = require(l_Parent_0.Signals).DismissNotificationSnoozeMenuSignal;
local l_default_0 = require(l_Parent_0.ToastNotificationSnoozeManager).default;
local l_Cryo_0 = v2.Cryo;
local l_dependencyArray_0 = v2.Hooks.dependencyArray;
local l_Localization_0 = v2.Localization;
local l_React_0 = v2.React;
local l_Roact_0 = v2.Roact;
local l_UIBlox_0 = v2.UIBlox;
local l_useLocalization_0 = l_Localization_0.Hooks.useLocalization;
local l_Colors_0 = l_UIBlox_0.App.Style.Colors;
local l_Interactable_0 = l_UIBlox_0.Core.Control.Interactable;
local l_useStyle_0 = l_UIBlox_0.Core.Style.useStyle;
local l_FFlagSnoozeIndefiniteEnabled_0 = require(l_Parent_1.SharedFlags).FFlagSnoozeIndefiniteEnabled;
local l_GetFFlagAppChatInExpToastSnoozeMenuDismissFix_0 = require(l_Parent_1.SharedFlags).GetFFlagAppChatInExpToastSnoozeMenuDismissFix;
local l_GetFFlagAppChatRebrandStringUpdates_0 = require(l_Parent_1.SharedFlags).GetFFlagAppChatRebrandStringUpdates;
local v20 = game:DefineFastFlag("EnableSnoozeMenuTitleWrapping", false);
local v21 = {
    [l_NotificationTypeEnum_0.ChatNewMessage] = l_GetFFlagAppChatRebrandStringUpdates_0() and "Feature.Squads.Label.Party" or "Feature.Chat.Action.StartChatWithFriends"
};
local v22 = nil;
v22 = if l_FFlagSnoozeIndefiniteEnabled_0 then {
    [1] = {
        textKey = "fifteenMinutes", 
        durationMinutes = 15
    }, 
    [2] = {
        textKey = "fourHours", 
        durationMinutes = 240
    }, 
    [3] = {
        textKey = "oneDay", 
        durationMinutes = 1440
    }, 
    [4] = {
        textKey = "untilITurnItBackOn", 
        durationMinutes = -1
    }
} else {
    [1] = {
        textKey = "fifteenMinutes", 
        durationMinutes = 15
    }, 
    [2] = {
        textKey = "oneHour", 
        durationMinutes = 60
    }, 
    [3] = {
        textKey = "fourHours", 
        durationMinutes = 240
    }, 
    [4] = {
        textKey = "oneDay", 
        durationMinutes = 1440
    }
};
return function() --[[ Line: 82 ]]
    -- upvalues: l_useStyle_0 (copy), l_useLocalization_0 (copy), l_Cryo_0 (copy), v21 (copy), l_React_0 (copy), l_dependencyArray_0 (copy), l_ShowNotificationSnoozeMenuSignal_0 (copy), l_GetFFlagAppChatInExpToastSnoozeMenuDismissFix_0 (copy), l_DismissNotificationSnoozeMenuSignal_0 (copy), v22 (ref), l_Colors_0 (copy), l_default_0 (copy), l_Interactable_0 (copy), v20 (copy), l_Roact_0 (copy)
    local v23 = l_useStyle_0();
    local v24 = l_useLocalization_0((l_Cryo_0.Dictionary.union(v21, {
        fifteenMinutes = "Feature.Notifications.Action.SnoozeFifteenMinutes", 
        fourHours = "Feature.Notifications.Action.SnoozeFourHours", 
        oneDay = "Feature.Notifications.Action.SnoozeOneDay", 
        oneHour = "Feature.Notifications.Action.SnoozeOneHour", 
        untilITurnItBackOn = "Feature.Notifications.Action.UntilITurnItBackOn", 
        snoozeFeedback = "Feature.Notifications.Heading.SnoozeFeedback"
    })));
    local v25, v26 = l_React_0.useState(false);
    local v27, v28 = l_React_0.useState({});
    local v29 = l_React_0.useCallback(function() --[[ Line: 96 ]]
        -- upvalues: v26 (copy)
        v26(false);
    end, l_dependencyArray_0(v26));
    l_React_0.useEffect(function() --[[ Line: 100 ]]
        -- upvalues: l_ShowNotificationSnoozeMenuSignal_0 (ref), v28 (copy), v26 (copy), l_GetFFlagAppChatInExpToastSnoozeMenuDismissFix_0 (ref), l_DismissNotificationSnoozeMenuSignal_0 (ref), v29 (copy)
        local v30 = nil;
        v30 = l_ShowNotificationSnoozeMenuSignal_0:connect(function(v31) --[[ Line: 103 ]]
            -- upvalues: v28 (ref), v26 (ref)
            v28(v31);
            v26(true);
        end);
        local v32 = nil;
        if l_GetFFlagAppChatInExpToastSnoozeMenuDismissFix_0() then
            v32 = l_DismissNotificationSnoozeMenuSignal_0:connect(function() --[[ Line: 113 ]]
                -- upvalues: v29 (ref)
                v29();
            end);
        end;
        return function() --[[ Line: 118 ]]
            -- upvalues: v30 (ref), l_GetFFlagAppChatInExpToastSnoozeMenuDismissFix_0 (ref), v32 (ref)
            v30:disconnect();
            if l_GetFFlagAppChatInExpToastSnoozeMenuDismissFix_0() then
                v32:disconnect();
            end;
        end;
    end, l_dependencyArray_0(v26));
    local v36 = l_React_0.useMemo(function() --[[ Line: 126 ]]
        -- upvalues: v22 (ref), l_React_0 (ref), v23 (copy), v24 (copy), l_Colors_0 (ref), v27 (copy), l_default_0 (ref), v26 (copy)
        local v33 = {};
        for v34, v35 in ipairs(v22) do
            table.insert(v33, l_React_0.createElement("TextButton", {
                Size = UDim2.new(1, 0, 0, 56), 
                BackgroundTransparency = 1, 
                Font = v23.Font.Header2.Font, 
                LayoutOrder = v34, 
                Text = v24[v35.textKey], 
                TextSize = v23.Font.Header2.RelativeSize * v23.Font.BaseSize, 
                TextColor3 = l_Colors_0.White, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                [l_React_0.Event.Activated] = function() --[[ Line: 142 ]]
                    -- upvalues: v27 (ref), l_default_0 (ref), v35 (copy), v24 (ref), v26 (ref)
                    if v27.notificationType then
                        l_default_0:snoozeNotification({
                            context = v27.context, 
                            notificationType = v27.notificationType, 
                            durationMinutes = v35.durationMinutes, 
                            modalMessage = v24.snoozeFeedback:gsub("{title}", v24[v27.notificationType] or ""):gsub("{duration}", v24[v35.textKey])
                        });
                    end;
                    v26(false);
                end
            }, {
                Border = l_React_0.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 1), 
                    BackgroundTransparency = 0.8, 
                    BackgroundColor3 = l_Colors_0.White, 
                    LayoutOrder = v34
                })
            }));
            v34 = v34 + 1;
        end;
        return v33;
    end, l_dependencyArray_0(v27));
    if v25 then
        return (l_React_0.createElement(l_Interactable_0, {
            Size = UDim2.fromScale(1, 1), 
            AutoButtonColor = false, 
            BackgroundColor3 = l_Colors_0.Black, 
            BackgroundTransparency = 0.6, 
            onStateChanged = function() --[[ Line: 176 ]] --[[ Name: onStateChanged ]]

            end, 
            [l_React_0.Event.Activated] = v29
        }, {
            SnoozeMenu = l_React_0.createElement(l_Interactable_0, {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.fromScale(0.5, 0.5), 
                Size = UDim2.new(1, -16, 0, 0), 
                AutoButtonColor = false, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundColor3 = v23.Theme.BackgroundDefault.Color, 
                BackgroundTransparency = v23.Theme.BackgroundDefault.Transparency, 
                onStateChanged = function() --[[ Line: 187 ]] --[[ Name: onStateChanged ]]

                end
            }, {
                UICorner = l_React_0.createElement("UICorner", {
                    CornerRadius = UDim.new(0, v23.Tokens.Semantic.Radius.XLarge)
                }), 
                UIListLayout = l_React_0.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    VerticalAlignment = Enum.VerticalAlignment.Center
                }), 
                UIPadding = l_React_0.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, 24)
                }), 
                UISizeConstraint = l_React_0.createElement("UISizeConstraint", {
                    MaxSize = Vector2.new(400, 1e999)
                }), 
                TitleContainer = l_React_0.createElement("Frame", {
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 1
                }, {
                    UIListLayout = l_React_0.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Vertical, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        VerticalAlignment = Enum.VerticalAlignment.Center
                    }), 
                    UIPadding = l_React_0.createElement("UIPadding", {
                        PaddingBottom = UDim.new(0, 20), 
                        PaddingRight = if v20 then UDim.new(0, 24) else nil, 
                        PaddingTop = UDim.new(0, 20)
                    }), 
                    Title = l_React_0.createElement("TextLabel", {
                        AutomaticSize = Enum.AutomaticSize.XY, 
                        BackgroundTransparency = 1, 
                        Font = v23.Font.Body.Font, 
                        LayoutOrder = 1, 
                        Text = v27.title or "", 
                        TextSize = v23.Font.Body.RelativeSize * v23.Font.BaseSize, 
                        TextColor3 = l_Colors_0.White, 
                        TextWrapped = v20 and true or nil
                    }), 
                    Description = if v27 and v27.description and v27.description ~= "" then l_React_0.createElement("TextLabel", {
                        AutomaticSize = Enum.AutomaticSize.XY, 
                        BackgroundTransparency = 1, 
                        Font = v23.Font.CaptionBody.Font, 
                        LayoutOrder = 2, 
                        Text = v27.description or "", 
                        TextSize = v23.Font.CaptionBody.RelativeSize * v23.Font.BaseSize, 
                        TextColor3 = v23.Theme.TextDefault.Color
                    }) else nil
                }), 
                SnoozeOptions = l_React_0.createElement("Frame", {
                    LayoutOrder = 2, 
                    BackgroundTransparency = 1, 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    Size = UDim2.new(1, 0, 0, 0)
                }, {
                    UIListLayout = l_React_0.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Vertical, 
                        SortOrder = Enum.SortOrder.LayoutOrder
                    }), 
                    SnoozeOptions = l_Roact_0.createFragment(v36)
                })
            })
        }));
    else
        return nil;
    end;
end;