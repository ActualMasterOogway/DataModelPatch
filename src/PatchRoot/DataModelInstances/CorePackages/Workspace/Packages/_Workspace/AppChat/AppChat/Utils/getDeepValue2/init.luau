return function(v0, v1) --[[ Line: 20 ]]
    local l_v0_0 = v0;
    for _, v4 in ipairs(v1:split(".")) do
        if l_v0_0[v4] == nil then
            return nil;
        else
            l_v0_0 = l_v0_0[v4];
        end;
    end;
    return l_v0_0;
end;