local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_CoreGui_0 = v1.CoreGui;
local l_Roact_0 = v1.Roact;
local l_TextService_0 = v1.TextService;
local l_UIBlox_0 = v1.UIBlox;
local l_withLocalization_0 = v1.withLocalization;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local v8 = require(l_script_FirstAncestor_0.FriendsLandingAnalytics.ImpressionEvents);
local l_Pill_0 = l_UIBlox_0.App.Control.Pill;
local l_withStyle_0 = l_UIBlox_0.Style.withStyle;
local l_withTooltip_0 = l_UIBlox_0.App.Dialog.TooltipV2.withTooltip;
local l_TooltipOrientation_0 = l_UIBlox_0.App.Dialog.Enum.TooltipOrientation;
local v13 = require(l_script_FirstAncestor_0.Friends.filterStates);
local v14 = require(l_script_FirstAncestor_0.Components.PillWithAlert);
local l_IconSize_0 = l_UIBlox_0.App.ImageSet.Enum.IconSize;
local l_getIconSize_0 = l_UIBlox_0.App.ImageSet.getIconSize;
local v17 = l_Roact_0.PureComponent:extend("FilterByButton");
v17.defaultProps = {
    analytics = nil, 
    layoutOrder = 1, 
    onActivated = function() --[[ Line: 32 ]] --[[ Name: onActivated ]]

    end, 
    filter = v13.All, 
    friendCount = 0, 
    inactiveFriendCount = 0, 
    isDisabled = false, 
    showFriendPruningAlert = false, 
    initialShowFriendPruningTooltip = false, 
    onTooltipDismissal = function() --[[ Line: 39 ]] --[[ Name: onTooltipDismissal ]]

    end
};
v17.init = function(v18) --[[ Line: 42 ]] --[[ Name: init ]]
    -- upvalues: v13 (copy)
    v18.state = {
        showFriendPruningTooltip = v18.props.initialShowFriendPruningTooltip, 
        hasDismissedFriendPruningTooltip = false
    };
    v18.convertFilterToTranslation = function(v19, v20) --[[ Line: 48 ]]
        -- upvalues: v13 (ref)
        if v19 == v13.All then
            return v20.all;
        elseif v19 == v13.Online then
            return v20.online;
        elseif v19 == v13.InExperience then
            return v20.inExperience;
        elseif v19 == v13.Offline then
            return v20.offline;
        elseif v19 == v13.Inactive then
            return v20.inactive;
        else
            return nil;
        end;
    end;
    v18.buildFilterText = function(v21, v22, v23) --[[ Line: 64 ]]
        -- upvalues: v18 (copy)
        local v24 = v18.convertFilterToTranslation(v21, v22);
        if v23 == 0 then
            return v24;
        else
            return v24 .. " (" .. v23 .. ")";
        end;
    end;
    v18.isSelected = function(v25) --[[ Line: 73 ]]
        -- upvalues: v13 (ref)
        if v25 == v13.All then
            return false;
        else
            return true;
        end;
    end;
    v18.dismissFriendPruningTooltip = function() --[[ Line: 81 ]]
        -- upvalues: v18 (copy)
        v18:setState({
            showFriendPruningTooltip = false, 
            hasDismissedFriendPruningTooltip = true
        });
        v18.props.onTooltipDismissal();
    end;
end;
v17.didMount = function(v26) --[[ Line: 90 ]] --[[ Name: didMount ]]
    -- upvalues: v8 (copy)
    if v26.props.initialShowFriendPruningTooltip and v26.props.analytics then
        v26.props.analytics:impressionEvent(v8.FriendPruningTooltipSeen, {
            friendCount = tostring(v26.props.friendCount), 
            inactiveFriendCount = tostring(v26.props.inactiveFriendCount)
        });
    end;
end;
v17.didUpdate = function(v27) --[[ Line: 101 ]] --[[ Name: didUpdate ]]
    v27:setState({
        showFriendPruningTooltip = v27.props.initialShowFriendPruningTooltip and not v27.state.hasDismissedFriendPruningTooltip
    });
end;
v17.render = function(v28) --[[ Line: 109 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), l_Images_0 (copy), l_withLocalization_0 (copy), l_TooltipOrientation_0 (copy), l_CoreGui_0 (copy), l_Roact_0 (copy), l_withTooltip_0 (copy), l_getIconSize_0 (copy), l_IconSize_0 (copy), l_TextService_0 (copy), v14 (copy), l_Pill_0 (copy)
    return l_withStyle_0(function(_) --[[ Line: 110 ]]
        -- upvalues: l_Images_0 (ref), l_withLocalization_0 (ref), v28 (copy), l_TooltipOrientation_0 (ref), l_CoreGui_0 (ref), l_Roact_0 (ref), l_withStyle_0 (ref), l_withTooltip_0 (ref), l_getIconSize_0 (ref), l_IconSize_0 (ref), l_TextService_0 (ref), v14 (ref), l_Pill_0 (ref)
        local v30 = l_Images_0["icons/actions/filter"];
        return l_withLocalization_0({
            all = "Feature.Friends.Label.All", 
            inactive = "Feature.Friends.Label.FewestInteractions", 
            inExperience = "Feature.Friends.Label.InGame", 
            tooltipHeader = "Feature.Friends.Label.ManageFriendsList", 
            tooltipBody = "Feature.Friends.Label.ManageFriendsListCaption", 
            online = "Common.Presence.Label.Online", 
            offline = "Common.Presence.Label.Offline"
        })(function(v31) --[[ Line: 120 ]]
            -- upvalues: v28 (ref), l_TooltipOrientation_0 (ref), l_CoreGui_0 (ref), l_Roact_0 (ref), l_withStyle_0 (ref), l_withTooltip_0 (ref), l_getIconSize_0 (ref), l_IconSize_0 (ref), l_TextService_0 (ref), v14 (ref), v30 (copy), l_Pill_0 (ref)
            local l_filter_0 = v28.props.filter;
            local l_friendCount_0 = v28.props.friendCount;
            local l_isDisabled_0 = v28.props.isDisabled;
            local l_onActivated_0 = v28.props.onActivated;
            local v36 = v28.buildFilterText(l_filter_0, v31, l_friendCount_0);
            local v37 = {
                headerText = v31.tooltipHeader, 
                bodyText = v31.tooltipBody
            };
            local v38 = {
                preferredOrientation = l_TooltipOrientation_0.Bottom, 
                guiTarget = l_CoreGui_0, 
                active = true, 
                DisplayOrder = 2
            };
            return l_Roact_0.createElement("Frame", {
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = UDim2.new(1, 0, 0, 36), 
                LayoutOrder = v28.props.layoutOrder, 
                BackgroundTransparency = 1
            }, {
                Button = if v28.state.showFriendPruningTooltip then l_withStyle_0(function(v39) --[[ Line: 145 ]]
                    -- upvalues: l_withTooltip_0 (ref), v37 (copy), v38 (copy), l_getIconSize_0 (ref), l_IconSize_0 (ref), l_TextService_0 (ref), v36 (copy), l_Roact_0 (ref), v28 (ref), l_CoreGui_0 (ref), v14 (ref), v30 (ref), l_isDisabled_0 (copy), l_filter_0 (copy), l_onActivated_0 (copy), l_Pill_0 (ref)
                    return l_withTooltip_0(v37, v38, function(v40) --[[ Line: 146 ]]
                        -- upvalues: v39 (copy), l_getIconSize_0 (ref), l_IconSize_0 (ref), l_TextService_0 (ref), v36 (ref), l_Roact_0 (ref), v28 (ref), l_CoreGui_0 (ref), v14 (ref), v30 (ref), l_isDisabled_0 (ref), l_filter_0 (ref), l_onActivated_0 (ref), l_Pill_0 (ref)
                        local l_Font_0 = v39.Font;
                        local v42 = l_getIconSize_0(l_IconSize_0.Small);
                        local l_BaseSize_0 = l_Font_0.BaseSize;
                        local v44 = l_Font_0.CaptionHeader.RelativeSize * l_BaseSize_0;
                        local v45 = l_TextService_0:GetTextSize(v36, v44, l_Font_0.CaptionHeader.Font, Vector2.new(10000, 10000)).X + 24;
                        return l_Roact_0.createElement("Frame", {
                            Size = UDim2.fromOffset(v45 + 4 + v42, 28), 
                            LayoutOrder = v28.props.layoutOrder, 
                            BackgroundTransparency = 1, 
                            [l_Roact_0.Change.AbsoluteSize] = v40, 
                            [l_Roact_0.Change.AbsolutePosition] = v40
                        }, {
                            PortalToCoreGui = l_Roact_0.createElement(l_Roact_0.Portal, {
                                target = l_CoreGui_0
                            }, {
                                ScreenGui = l_Roact_0.createElement("ScreenGui", {
                                    ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
                                    DisplayOrder = 1
                                }, {
                                    DismissFriendPruningTooltipButton = l_Roact_0.createElement("TextButton", {
                                        ZIndex = 0, 
                                        BackgroundTransparency = 1, 
                                        Size = UDim2.fromScale(1, 1), 
                                        Text = "", 
                                        [l_Roact_0.Event.Activated] = v28.dismissFriendPruningTooltip, 
                                        [l_Roact_0.Event.TouchSwipe] = v28.dismissFriendPruningTooltip, 
                                        [l_Roact_0.Event.MouseWheelForward] = v28.dismissFriendPruningTooltip, 
                                        [l_Roact_0.Event.MouseWheelBackward] = v28.dismissFriendPruningTooltip
                                    })
                                })
                            }), 
                            FilterByButtonPillPossiblyWithAlert = if v28.props.showFriendPruningAlert then l_Roact_0.createElement(v14, {
                                icon = v30, 
                                text = v36, 
                                isDisabled = l_isDisabled_0, 
                                isSelected = v28.isSelected(l_filter_0), 
                                onActivated = l_onActivated_0
                            }) else l_Roact_0.createElement(l_Pill_0, {
                                icon = v30, 
                                text = v36, 
                                isDisabled = l_isDisabled_0, 
                                isSelected = v28.isSelected(l_filter_0), 
                                onActivated = l_onActivated_0
                            })
                        });
                    end);
                end) else if v28.props.showFriendPruningAlert then l_Roact_0.createElement(v14, {
                    icon = v30, 
                    text = v36, 
                    isDisabled = l_isDisabled_0, 
                    isSelected = v28.isSelected(l_filter_0), 
                    onActivated = l_onActivated_0
                }) else l_Roact_0.createElement(l_Pill_0, {
                    icon = v30, 
                    text = v36, 
                    isDisabled = l_isDisabled_0, 
                    isSelected = v28.isSelected(l_filter_0), 
                    onActivated = l_onActivated_0
                })
            });
        end);
    end);
end;
return v17;