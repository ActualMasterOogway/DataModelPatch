return function(v0) --[[ Line: 6 ]] --[[ Name: tryGetService ]]
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 7 ]]
        -- upvalues: v0 (copy)
        return game:GetService(v0);
    end);
    if l_status_0 then
        return l_result_0;
    else
        return nil;
    end;
end;