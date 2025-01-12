local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_UIBlox_0 = v1.UIBlox;
local l_Roact_0 = v1.Roact;
local l_memoize_0 = v1.memoize;
local l_TextService_0 = v1.TextService;
local l_withLocalization_0 = v1.withLocalization;
local l_PartialPageModal_0 = l_UIBlox_0.App.Dialog.Modal.PartialPageModal;
local l_SmallRadioButtonGroup_0 = l_UIBlox_0.App.Cell.Small.SelectionGroup.SmallRadioButtonGroup;
local l_ButtonType_0 = l_UIBlox_0.App.Button.Enum.ButtonType;
local l_Badge_0 = l_UIBlox_0.App.Indicator.Badge;
local l_withStyle_0 = l_UIBlox_0.Style.withStyle;
local l_compose_0 = v1.SocialLibraries.RoduxTools.compose;
local v13 = require(l_script_FirstAncestor_0.FriendsLandingAnalytics);
local v14 = require(l_script_FirstAncestor_0.FriendsLandingAnalytics.ButtonClickEvents);
local v15 = require(l_script_FirstAncestor_0.FriendsLandingAnalytics.ImpressionEvents);
local v16 = require(l_script_FirstAncestor_0.FriendsLandingContext);
local v17 = require(l_script_FirstAncestor_0.Friends.makeFilterButtons);
local v18 = require(l_script_FirstAncestor_0.Friends.filterStates);
local v19 = require(script.navigationParamKeys);
local l_InputHandlers_0 = v1.InputHandlers;
local l_FocusNavigationUtils_0 = v1.FocusNavigationUtils;
local l_FocusNavigableSurfaceWrapper_0 = l_FocusNavigationUtils_0.FocusNavigableSurfaceWrapper;
local l_FocusNavigableSurfaceIdentifierEnum_0 = l_FocusNavigationUtils_0.FocusNavigableSurfaceIdentifierEnum;
local l_FocusNavigationEventNameEnum_0 = l_FocusNavigationUtils_0.FocusNavigationEventNameEnum;
local l_FFlagEnableUniversalFocusNavigation_0 = v1.FFlagEnableUniversalFocusNavigation;
local v26 = require(l_script_FirstAncestor_0.Flags.FFlagFriendsLandingPaginatedFriends);
local v27 = l_Roact_0.PureComponent:extend("FriendsLandingFilter");
v27.defaultProps = {
    analytics = nil, 
    navigation = nil
};
v27.init = function(v28) --[[ Line: 52 ]] --[[ Name: init ]]
    -- upvalues: l_FFlagEnableUniversalFocusNavigation_0 (copy), l_FocusNavigationEventNameEnum_0 (copy), l_InputHandlers_0 (copy), l_memoize_0 (copy), v14 (copy), v18 (copy), l_TextService_0 (copy), v26 (copy), v19 (copy)
    v28.state = {
        selectedValue = v28.props.filter
    };
    v28.onClose = function() --[[ Line: 58 ]]
        -- upvalues: v28 (copy)
        v28.props.navigation.goBack();
    end;
    if l_FFlagEnableUniversalFocusNavigation_0 then
        v28.focusEventHandlers = {
            [l_FocusNavigationEventNameEnum_0.NavigateBack] = {
                handler = l_InputHandlers_0.onRelease(function(v29) --[[ Line: 65 ]]
                    -- upvalues: v28 (copy)
                    v28.onClose();
                    v29:cancel();
                end)
            }
        };
    end;
    v28.onApply = l_memoize_0(function(v30) --[[ Line: 73 ]]
        -- upvalues: v28 (copy), v14 (ref), v18 (ref)
        return function() --[[ Line: 74 ]]
            -- upvalues: v28 (ref), v14 (ref), v30 (copy), v18 (ref)
            v28.props.analytics:buttonClick(v14.FriendFilterApply, {
                filter = v28.state.selectedValue
            });
            v30(v28.state.selectedValue);
            v28.onClose();
            if v28.state.selectedValue == v18.Inactive then
                v28.onFewestInteractionsSelection()();
            end;
        end;
    end);
    v28.setSelectedValue = function(v31) --[[ Line: 86 ]]
        -- upvalues: v28 (copy)
        v28:setState({
            selectedValue = v31
        });
    end;
    v28.onCurrentSelected = function(v32) --[[ Line: 92 ]]
        -- upvalues: v28 (copy)
        return v32 == v28.state.selectedValue;
    end;
    v28.getAlertPlacement = function(v33, v34, v35, v36) --[[ Line: 96 ]]
        -- upvalues: l_TextService_0 (ref)
        local v37 = 0;
        local v38 = "";
        for v39, v40 in ipairs(v34) do
            if v40.id == v33 then
                v37 = v39;
                v38 = v40.text;
                break;
            end;
        end;
        assert(v37 ~= 0, "getAlertPlacement expects alertFilterId to have an entry in filterButtons");
        local v41 = v36.Header2.RelativeSize * v36.BaseSize;
        local v42 = 24 + l_TextService_0:GetTextSize(v38, v41, v36.Header2.Font, Vector2.new(10000, 10000)).X + 12;
        local v43 = (v37 - 1) * 57 + math.floor(28 - v35 / 2);
        return UDim2.fromOffset(v42, v43);
    end;
    v28.showFriendPruningAlert = v26 and function() --[[ Line: 128 ]]

    end or function() --[[ Line: 129 ]]
        -- upvalues: v28 (copy), v19 (ref)
        if v28.props.navigation.getParam then
            return (v28.props.navigation.getParam(v19.ShowFriendPruningAlert));
        else
            return nil;
        end;
    end;
    v28.showInactiveFilterOption = function() --[[ Line: 135 ]]
        -- upvalues: v28 (copy), v19 (ref)
        if v28.props.navigation.getParam then
            return (v28.props.navigation.getParam(v19.ShowInactiveFilterOption));
        else
            return nil;
        end;
    end;
    v28.onFewestInteractionsSelection = function() --[[ Line: 141 ]]
        -- upvalues: v28 (copy), v19 (ref)
        if v28.props.navigation.getParam then
            return (v28.props.navigation.getParam(v19.OnFewestInteractionsSelection));
        else
            return nil;
        end;
    end;
end;
v27.didMount = function(v44) --[[ Line: 148 ]] --[[ Name: didMount ]]
    -- upvalues: v19 (copy), v26 (copy), v15 (copy)
    if v44.showInactiveFilterOption() and v44.showFriendPruningAlert() then
        local v45 = if v44.props.navigation and v44.props.navigation.getParam then v44.props.navigation.getParam(v19.FriendCount) else 0;
        local v46 = if v44.props.navigation and v44.props.navigation.getParam then v44.props.navigation.getParam(v19.InactiveFriendCount) else 0;
        if v26 then
            return;
        else
            v44.props.analytics:impressionEvent(v15.FriendPruningNewBadgeSeen, {
                friendCount = tostring(v45), 
                inactiveFriendCount = tostring(v46)
            });
        end;
    end;
end;
v27.render = function(v47) --[[ Line: 168 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), l_withLocalization_0 (copy), v17 (copy), l_Roact_0 (copy), l_PartialPageModal_0 (copy), l_ButtonType_0 (copy), l_SmallRadioButtonGroup_0 (copy), l_Badge_0 (copy), v18 (copy), l_FFlagEnableUniversalFocusNavigation_0 (copy), l_FocusNavigableSurfaceWrapper_0 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy)
    return l_withStyle_0(function(v48) --[[ Line: 169 ]]
        -- upvalues: l_withLocalization_0 (ref), v17 (ref), v47 (copy), l_Roact_0 (ref), l_PartialPageModal_0 (ref), l_ButtonType_0 (ref), l_SmallRadioButtonGroup_0 (ref), l_Badge_0 (ref), v18 (ref), l_FFlagEnableUniversalFocusNavigation_0 (ref), l_FocusNavigableSurfaceWrapper_0 (ref), l_FocusNavigableSurfaceIdentifierEnum_0 (ref)
        return l_withLocalization_0({
            apply = "CommonUI.Messages.Action.Apply", 
            all = "Feature.Friends.Label.All", 
            inactive = "Feature.Friends.Label.FewestInteractions", 
            inExperience = "Feature.Friends.Label.InGame", 
            online = "Common.Presence.Label.Online", 
            offline = "Common.Presence.Label.Offline", 
            filterBy = "Feature.Friends.Heading.FilterBy", 
            upsellNew = "Feature.Catalog.Label.New"
        })(function(v49) --[[ Line: 179 ]]
            -- upvalues: v17 (ref), v47 (ref), l_Roact_0 (ref), l_PartialPageModal_0 (ref), l_ButtonType_0 (ref), l_SmallRadioButtonGroup_0 (ref), l_Badge_0 (ref), v18 (ref), v48 (copy), l_FFlagEnableUniversalFocusNavigation_0 (ref), l_FocusNavigableSurfaceWrapper_0 (ref), l_FocusNavigableSurfaceIdentifierEnum_0 (ref)
            local v50 = v17(v49, v47.showInactiveFilterOption());
            local v51 = l_Roact_0.createElement(l_PartialPageModal_0, {
                title = v49.filterBy, 
                screenSize = v47.props.screenSize, 
                onCloseClicked = v47.onClose, 
                marginSize = 0, 
                buttonStackProps = {
                    buttons = {
                        {
                            buttonType = l_ButtonType_0.PrimarySystem, 
                            props = {
                                isDisabled = v47.onCurrentSelected(v47.props.filter), 
                                onActivated = v47.onApply(v47.props.setFilterKeys), 
                                text = v49.apply
                            }
                        }
                    }
                }
            }, {
                ButtonContainer = l_Roact_0.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 58 * #v50 + 20), 
                    BackgroundTransparency = 1
                }, {
                    RadioButtons = l_Roact_0.createElement(l_SmallRadioButtonGroup_0, {
                        onActivated = v47.setSelectedValue, 
                        selectedValue = v47.state.selectedValue, 
                        items = v50
                    }), 
                    InactiveFriendsAlert = if v47.showFriendPruningAlert() then l_Roact_0.createElement(l_Badge_0, {
                        position = v47.getAlertPlacement(v18.Inactive, v50, 24, v48.Font), 
                        value = v49.upsellNew
                    }) else nil
                })
            });
            if l_FFlagEnableUniversalFocusNavigation_0 then
                return (l_Roact_0.createElement(l_FocusNavigableSurfaceWrapper_0, {
                    surfaceIdentifier = l_FocusNavigableSurfaceIdentifierEnum_0.PopUp, 
                    isIsolated = true, 
                    customEventHandlers = v47.focusEventHandlers
                }, {
                    Modal = v51
                }));
            else
                return v51;
            end;
        end);
    end);
end;
return l_compose_0(v13.connect(function(v52) --[[ Line: 235 ]]
    return {
        analytics = v52
    };
end), v16.connect(function(v53, _) --[[ Line: 240 ]]
    return {
        filter = v53.filter, 
        screenSize = v53.screenSize, 
        setFilterKeys = v53.setFilterKeys
    };
end))(v27);