local l_Parent_0 = script:FindFirstAncestor("DiscoveryMonolith").Parent;
return require(l_Parent_0.Rodux).makeActionCreator(script.Name, function(v1, v2, v3) --[[ Line: 5 ]]
    return {
        appPage = v1, 
        feedItemPosition = v2, 
        numberOfRows = v3
    };
end);