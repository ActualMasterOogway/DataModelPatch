local l_Parent_0 = script:FindFirstAncestor("DiscoveryMonolith").Parent;
local l_makeActionCreator_0 = require(l_Parent_0.Rodux).makeActionCreator;
local _ = require(l_Parent_0.DiscoveryTypes);
return l_makeActionCreator_0(script.Name, function(v3, v4, v5) --[[ Line: 6 ]]
    return {
        appPage = v3, 
        topicInfos = v4, 
        isAppend = v5
    };
end);