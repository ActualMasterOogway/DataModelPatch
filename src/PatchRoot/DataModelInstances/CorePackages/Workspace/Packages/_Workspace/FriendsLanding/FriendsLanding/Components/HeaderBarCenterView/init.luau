local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.dependencies);
local l_Roact_0 = v2.Roact;
local l_UIBlox_0 = v2.UIBlox;
local v5 = require(l_script_FirstAncestor_0.EnumScreens);
local l_withLocalization_0 = v2.withLocalization;
local v7 = require(l_script_FirstAncestor_0.FriendsLandingContext);
local v8 = require(l_script_FirstAncestor_0.FriendsLandingAnalytics.PlayerSearchEvent);
local l_SocialLibraries_0 = v2.SocialLibraries;
local l_getDeepValue_0 = l_SocialLibraries_0.Dictionary.getDeepValue;
local l_compose_0 = l_SocialLibraries_0.RoduxTools.compose;
local l_ImageSetButton_0 = l_UIBlox_0.Core.ImageSet.ImageSetButton;
local l_UserSearchBar_0 = v2.SocialCommon.Components.UserSearchBar.UserSearchBar;
local v14 = require(l_script_FirstAncestor_0.FriendsLandingAnalytics);
local l_Sources_0 = require(l_Parent_0.SocialLuaAnalytics).Analytics.Enums.Sources;
local v16 = l_Roact_0.PureComponent:extend("HeaderBarCenterView");
local l_FFlagDisableAutocorrectSocialUserSearch_0 = require(l_Parent_0.SharedFlags).FFlagDisableAutocorrectSocialUserSearch;
v16.init = function(v18) --[[ Line: 27 ]] --[[ Name: init ]]
    -- upvalues: v8 (copy), v5 (copy)
    v18.state = {
        filterText = ""
    };
    v18.goToUserSearch = function(v19) --[[ Line: 32 ]]
        -- upvalues: v18 (copy), v8 (ref), v5 (ref)
        local l_navigation_0 = v18.props.navigation;
        v8(v18.props.analytics, "search", {
            kwd = v18.state.filterText, 
            source = v19, 
            currentRoute = l_navigation_0.state.routeName
        });
        if l_navigation_0.state.routeName == v5.SearchFriends then
            l_navigation_0.replace(v5.SearchFriends, {
                searchText = v18.state.filterText, 
                userSearchSource = v19
            });
            return;
        else
            v18.props.analytics:navigate(v5.SearchFriends);
            l_navigation_0.push(v5.SearchFriends, {
                searchText = v18.state.filterText, 
                userSearchSource = v19
            });
            return;
        end;
    end;
end;
v16.render = function(v21) --[[ Line: 55 ]] --[[ Name: render ]]
    -- upvalues: v7 (copy), v5 (copy), l_getDeepValue_0 (copy), l_Sources_0 (copy), l_withLocalization_0 (copy), l_Roact_0 (copy), l_ImageSetButton_0 (copy), l_UserSearchBar_0 (copy), v8 (copy), l_FFlagDisableAutocorrectSocialUserSearch_0 (copy)
    return v7.with(function(v22) --[[ Line: 56 ]]
        -- upvalues: v5 (ref), v21 (copy), l_getDeepValue_0 (ref), l_Sources_0 (ref), l_withLocalization_0 (ref), l_Roact_0 (ref), l_ImageSetButton_0 (ref), l_UserSearchBar_0 (ref), v8 (ref), l_FFlagDisableAutocorrectSocialUserSearch_0 (ref)
        local v23 = v22.getScreenTopBar(v5.FriendsLanding);
        local l_navigation_1 = v21.props.navigation;
        local v25 = l_navigation_1 and l_navigation_1.state and l_navigation_1.state.routeName;
        local v26 = nil;
        if l_getDeepValue_0(l_navigation_1 or {}, "state.params.userSearchSource") then
            v26 = l_navigation_1.state.params.userSearchSource;
        elseif l_getDeepValue_0(v22, "passedNavParams.userSearchSource") then
            v26 = v22.passedNavParams.userSearchSource;
        elseif v25 == v5.FriendsLanding then
            v26 = l_Sources_0.FriendsLanding;
        end;
        if v22.addFriendsPageSearchbarEnabled then
            if not v23.shouldRenderCenter then
                return nil;
            elseif v25 == v5.AddFriends then
                v22.setScreenTopBar(v5.FriendsLanding, {
                    shouldRenderCenter = false
                });
                return nil;
            end;
        elseif not v23.shouldRenderCenter then
            return nil;
        end;
        return l_withLocalization_0({
            searchPlaceholderText = v22.addFriendsPageSearchbarEnabled and "Feature.AddFriends.Label.InputPlaceholder.SearchForPeople" or "Feature.Chat.Label.SearchWord", 
            cancelText = "Feature.Chat.Action.Cancel"
        })(function(v27) --[[ Line: 95 ]]
            -- upvalues: l_Roact_0 (ref), l_ImageSetButton_0 (ref), v22 (copy), l_UserSearchBar_0 (ref), v21 (ref), v23 (copy), v5 (ref), v8 (ref), v26 (ref), l_FFlagDisableAutocorrectSocialUserSearch_0 (ref)
            return l_Roact_0.createElement(l_ImageSetButton_0, {
                Size = if v22.addFriendsPageSearchbarEnabled and v22.wideMode then UDim2.new(0, 400, 1, 0) else UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1
            }, {
                filterBox = l_Roact_0.createElement(l_UserSearchBar_0, {
                    analytics = v21.props.analytics, 
                    initialInputText = v23.filterText, 
                    cancelText = v27.cancelText, 
                    searchPlaceholderText = v27.searchPlaceholderText, 
                    captureFocusOnMount = v23.shouldAutoFocusCenter, 
                    onSelectCallback = v23.closeInputBar or function() --[[ Line: 108 ]]

                    end, 
                    resetOnMount = function() --[[ Line: 110 ]] --[[ Name: resetOnMount ]]
                        -- upvalues: v22 (ref), v5 (ref)
                        v22.setScreenTopBar(v5.FriendsLanding, {
                            shouldAutoFocusCenter = false
                        });
                    end, 
                    cancelCallback = function() --[[ Line: 116 ]] --[[ Name: cancelCallback ]]
                        -- upvalues: v21 (ref), v22 (ref), v5 (ref), v8 (ref), v26 (ref)
                        v21:setState({
                            filterText = ""
                        });
                        v22.setScreenTopBar(v5.FriendsLanding, {
                            shouldRenderCenter = false
                        });
                        v8(v21.props.analytics, "cancel", {
                            source = v26
                        });
                    end, 
                    textChangedCallback = function(v28) --[[ Line: 126 ]] --[[ Name: textChangedCallback ]]
                        -- upvalues: v21 (ref)
                        v21:setState({
                            filterText = v28
                        });
                    end, 
                    focusChangedCallback = function(v29, v30) --[[ Line: 132 ]] --[[ Name: focusChangedCallback ]]
                        -- upvalues: v21 (ref), v26 (ref)
                        if v29 == false and v30 then
                            v21.goToUserSearch(v26);
                        end;
                    end, 
                    returnPressedFromOnScreenKeyboardCallback = l_FFlagDisableAutocorrectSocialUserSearch_0 and function() --[[ Line: 139 ]]
                        -- upvalues: v21 (ref), v26 (ref)
                        v21.goToUserSearch(v26);
                    end or nil
                })
            });
        end);
    end);
end;
return l_compose_0(v14.connect(function(v31) --[[ Line: 149 ]]
    return {
        analytics = v31
    };
end))(v16);