local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.dependencies);
local l_Roact_0 = v2.Roact;
local l_UIBlox_0 = v2.UIBlox;
local l_withLocalization_0 = v2.withLocalization;
local l_Actions_0 = v2.RoactNavigation.Actions;
local v7 = require(l_script_FirstAncestor_0.FriendsLandingContext);
local v8 = require(l_script_FirstAncestor_0.EnumScreens);
local v9 = require(script.FriendsLandingHeaderBarPresentational);
local l_HeaderBar_0 = l_UIBlox_0.App.Bar.HeaderBar;
local l_AppHeaderBar_0 = v2.AppHeaderBar;
local v12 = require(l_script_FirstAncestor_0.Navigator.getActiveChildNavigationOptionsSafely);
local l_GetFFlagUIBloxUseNewHeaderBar_0 = require(l_Parent_0.SharedFlags).UIBlox.GetFFlagUIBloxUseNewHeaderBar;
local v14 = l_Roact_0.PureComponent:extend("FriendsLandingHeaderBar");
v14.init = function(v15) --[[ Line: 21 ]] --[[ Name: init ]]
    -- upvalues: l_GetFFlagUIBloxUseNewHeaderBar_0 (copy), l_AppHeaderBar_0 (copy), l_HeaderBar_0 (copy), l_Actions_0 (copy)
    v15.renderLeft = function(v16, v17, v18) --[[ Line: 22 ]]
        -- upvalues: l_GetFFlagUIBloxUseNewHeaderBar_0 (ref), l_AppHeaderBar_0 (ref), l_HeaderBar_0 (ref), l_Actions_0 (ref)
        if v18 then
            return function() --[[ Line: 24 ]]
                return nil;
            end;
        else
            return (if l_GetFFlagUIBloxUseNewHeaderBar_0() then l_AppHeaderBar_0.makeBackButton else l_HeaderBar_0.renderLeft.backButton)(function() --[[ Line: 33 ]]
                -- upvalues: v16 (copy), v17 (copy), l_Actions_0 (ref)
                if v16.state.index == 1 and v17 then
                    v17();
                    return;
                else
                    v16.dispatch(l_Actions_0.back());
                    return;
                end;
            end);
        end;
    end;
end;
v14.render = function(v19) --[[ Line: 46 ]] --[[ Name: render ]]
    -- upvalues: v7 (copy), v12 (copy), v8 (copy), l_withLocalization_0 (copy), l_Roact_0 (copy), v9 (copy)
    return v7.with(function(v20) --[[ Line: 47 ]]
        -- upvalues: v19 (copy), v12 (ref), v8 (ref), l_withLocalization_0 (ref), l_Roact_0 (ref), v9 (ref)
        local l_navigation_0 = v19.props.navigation;
        local v22 = v12(l_navigation_0);
        local v23 = v20 and v20.exitFriendsLanding or nil;
        local l_headerText_0 = v22.headerText;
        local v25 = v20.getScreenTopBar(v8.FriendsLanding);
        return l_withLocalization_0({
            titleText = l_headerText_0.raw
        })(function(v26) --[[ Line: 55 ]]
            -- upvalues: v20 (copy), l_Roact_0 (ref), v9 (ref), v25 (copy), v22 (copy), v19 (ref), l_navigation_0 (copy), v23 (copy)
            local l_titleText_0 = v26.titleText;
            if v20.addFriendsPageSearchbarEnabled then
                return l_Roact_0.createElement(v9, {
                    title = l_titleText_0, 
                    renderLeft = not v25.shouldRenderCenter and v22.renderLeft or v19.renderLeft(l_navigation_0, v23, v25.shouldRenderCenter), 
                    renderCenter = if v25.shouldRenderCenter then v22.renderCenter else nil, 
                    renderRight = v22.renderRight, 
                    isSecondary = v22.useSecondaryHeader, 
                    shouldHideSecondaryLeftItem = v25.shouldRenderCenter
                });
            else
                return l_Roact_0.createElement(v9, {
                    title = l_titleText_0, 
                    renderLeft = not v25.shouldRenderCenter and v22.renderLeft or v19.renderLeft(l_navigation_0, v23, v25.shouldRenderCenter), 
                    renderCenter = v25.shouldRenderCenter and v22.renderCenter or nil, 
                    renderRight = v22.renderRight
                });
            end;
        end);
    end);
end;
return v14;