local l_Parent_0 = script:FindFirstAncestor("ExpChatShared").Parent;
return require(l_Parent_0.Rodux).makeActionCreator(script.Name, function(v1) --[[ Line: 9 ]]
    return {
        textChannel = v1
    };
end);