local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local l_Roact_0 = require(l_script_FirstAncestor_0.dependencies).Roact;
local v2 = require(l_script_FirstAncestor_0.EnumScreens);
local v3 = require(l_script_FirstAncestor_0.FriendsLandingContext);
local v4 = require(l_script_FirstAncestor_0.Components.FriendsLandingContainer);
local v5 = l_Roact_0.PureComponent:extend("FriendsLandingScreen");
v5.defaultProps = {
    friends = {}
};
v5.render = function(v6) --[[ Line: 14 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy), v2 (copy), l_Roact_0 (copy), v4 (copy)
    return v3.with(function(v7) --[[ Line: 15 ]]
        -- upvalues: v2 (ref), l_Roact_0 (ref), v4 (ref), v6 (copy)
        local v8 = v7.getScreenTopBar(v2.FriendsLanding);
        return l_Roact_0.createElement(v4, {
            navigation = v6.props.navigation, 
            filterText = v8.filterText, 
            setScreenTopBar = v7.setScreenTopBar
        });
    end);
end;
return v5;