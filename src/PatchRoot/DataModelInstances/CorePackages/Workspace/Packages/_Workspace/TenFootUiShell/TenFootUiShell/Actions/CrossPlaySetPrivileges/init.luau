local l_Parent_0 = script:FindFirstAncestor("TenFootUiShell").Parent;
return require(l_Parent_0.Rodux).makeActionCreator(script.Name, function(v1) --[[ Line: 5 ]]
    return {
        privileges = v1
    };
end);