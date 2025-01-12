local l_Parent_0 = script:FindFirstAncestor("DiscoveryMonolith").Parent;
return require(l_Parent_0.Rodux).makeActionCreator(script.Name, function(v1, v2, v3) --[[ Line: 5 ]]
    return {
        topicId = v1, 
        sortIndex = v2, 
        numberOfTiles = v3
    };
end);