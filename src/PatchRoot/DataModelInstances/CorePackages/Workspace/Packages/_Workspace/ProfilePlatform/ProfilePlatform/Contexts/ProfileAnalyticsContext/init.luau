local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local _ = require(l_script_FirstAncestor_0.Analytics.EventNames);
return v2.createContext({
    fireAnalyticsEvent = function() --[[ Line: 23 ]] --[[ Name: fireAnalyticsEvent ]]

    end
});