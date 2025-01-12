local l_script_FirstAncestor_0 = script:FindFirstAncestor("RoactUtils");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local _ = require(l_script_FirstAncestor_0.types);
local v4 = game:DefineFastFlag("UseImprovedLazyComponent", false);
return function(v5) --[[ Line: 17 ]] --[[ Name: createLazyComponent ]]
    -- upvalues: v4 (copy), v2 (copy)
    if v4 then
        local v8 = v2.memo(function(v6) --[[ Line: 19 ]]
            -- upvalues: v2 (ref), v5 (copy)
            local v7 = v2.useMemo(v5, {});
            return v2.createElement(v7, v6);
        end);
        return function(v9) --[[ Line: 23 ]]
            -- upvalues: v2 (ref), v8 (copy)
            return v2.createElement(v8, v9);
        end;
    else
        return function(v10) --[[ Line: 27 ]]
            -- upvalues: v2 (ref), v5 (copy)
            return v2.createElement(v5(), v10);
        end;
    end;
end;