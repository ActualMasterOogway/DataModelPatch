local l_Parent_0 = script:FindFirstAncestor("TenFootUiShell").Parent;
local v1 = require(l_Parent_0.React);
local _ = require(l_Parent_0.TenFootUiCommon);
return function(v3) --[[ Line: 8 ]] --[[ Name: useSwitchScreenKeys ]]
    -- upvalues: v1 (copy)
    local v4, v5 = v1.useState({});
    local v6 = v3.keepVisitedScreensMounted == nil or v3.keepVisitedScreensMounted;
    v1.useLayoutEffect(function() --[[ Line: 21 ]]
        -- upvalues: v5 (copy), v6 (copy), v3 (copy)
        v5(function(v7) --[[ Line: 22 ]]
            -- upvalues: v6 (ref), v3 (ref)
            local v8 = {};
            if v6 then
                for _, v10 in v7 do
                    if v3.descriptors[v10] then
                        table.insert(v8, v10);
                    end;
                end;
            end;
            if table.find(v8, v3.activeKey) == nil then
                table.insert(v8, v3.activeKey);
            end;
            return v8;
        end);
    end, {
        v3.activeKey, 
        v3.descriptors, 
        v6
    });
    return v4;
end;