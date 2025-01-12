local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.SocialLuaAnalytics);
local v5 = require(l_Parent_0.RoactUtils);
local l_SubPages_0 = v4.Analytics.Enums.SubPages;
local v7 = require(l_script_FirstAncestor_0.Analytics.initializeProfileAnalytics);
local v8 = require(l_script_FirstAncestor_0.Contexts.ProfileAnalyticsContext);
local v9 = require(l_script_FirstAncestor_0.Contexts.useProfileWrapperContext);
local l_dependencyArray_0 = v5.Hooks.dependencyArray;
local v11 = require(script.Parent.ProfilePlatformNavigator);
local function v17(v12) --[[ Line: 16 ]]
    -- upvalues: v3 (copy), v9 (copy), l_HttpService_0 (copy), v7 (copy), l_SubPages_0 (copy), l_dependencyArray_0 (copy), v8 (copy), v11 (copy)
    local v13 = v3.createRef();
    local v14 = v9();
    local v16 = v3.useMemo(function() --[[ Line: 20 ]]
        -- upvalues: v13 (copy), l_HttpService_0 (ref), v7 (ref), v14 (copy), l_SubPages_0 (ref)
        if v13.current == nil then
            v13.current = l_HttpService_0:GenerateGUID(false);
        end;
        local v15 = v7();
        v15.updateInfoForAllEvents({
            profileSessionId = if v14.sessionIdOverride then v14.sessionIdOverride else v13.current, 
            profileUserId = v14.profileUserId, 
            subpage = l_SubPages_0.PeekView
        });
        return v15;
    end, l_dependencyArray_0(v14.profileUserId, v14.sessionIdOverride));
    return v3.createElement(v8.Provider, {
        value = v16
    }, {
        v3.createElement(v11, v12)
    });
end;
local v18 = v3.PureComponent:extend("ProfilePlatformNavigatorWithProviders");
v18.render = function(v19) --[[ Line: 45 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy), v17 (copy)
    return v3.createElement(v17, v19.props);
end;
v18.router = v11.router;
return v18;