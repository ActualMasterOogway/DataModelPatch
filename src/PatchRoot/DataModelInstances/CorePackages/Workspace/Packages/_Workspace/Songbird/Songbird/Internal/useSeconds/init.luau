local l_script_FirstAncestor_0 = script:FindFirstAncestor("Songbird");
local v1 = require(l_script_FirstAncestor_0.Parent.React);
local l_useState_0 = v1.useState;
local l_useEffect_0 = v1.useEffect;
return function() --[[ Line: 7 ]] --[[ Name: useSeconds ]]
    -- upvalues: l_useState_0 (copy), l_useEffect_0 (copy)
    local v4, v5 = l_useState_0(0);
    l_useEffect_0(function() --[[ Line: 10 ]]
        -- upvalues: v5 (copy)
        local v6 = true;
        task.spawn(function() --[[ Line: 13 ]]
            -- upvalues: v6 (ref), v5 (ref)
            while v6 do
                task.wait(1);
                v5(function(v7) --[[ Line: 17 ]]
                    return v7 + 1;
                end);
            end;
        end);
        return function() --[[ Line: 23 ]]
            -- upvalues: v6 (ref)
            v6 = false;
        end;
    end, {});
    return v4;
end;