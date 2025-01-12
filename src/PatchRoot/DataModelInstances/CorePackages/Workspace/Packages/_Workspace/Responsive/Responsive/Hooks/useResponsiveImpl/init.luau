local l_Parent_0 = script:FindFirstAncestor("Responsive").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(script.Parent.Parent.Responsive);
local v3 = require(script.Parent.Parent.Context.ContainerRef);
id = function(v4) --[[ Line: 7 ]] --[[ Name: id ]]
    return v4;
end;
useResponsiveImpl = function(v5, v6, v7) --[[ Line: 15 ]] --[[ Name: useResponsiveImpl ]]
    -- upvalues: v1 (copy), v3 (copy), v2 (copy)
    local v8 = if typeof(v5) == "function" then v5 else id;
    local v9 = v1.useContext(v3);
    local v10, v11 = v1.useState(v8(v2.DefaultKey));
    local v12 = v1.useRef("");
    local v13 = v1.useRef({
        Key = v2.DefaultKey
    });
    local v14 = nil;
    if typeof(v5) == "table" then
        v14 = {};
        for _, v16 in v5 do
            v14[v16] = true;
        end;
    end;
    v1.useEffect(function() --[[ Line: 31 ]]
        -- upvalues: v9 (copy), v2 (ref), v6 (copy), v7 (copy), v14 (ref), v12 (copy), v13 (copy), v11 (copy), v8 (copy)
        if v9 and v9.current then
            local v17 = v2.bindContainer(v9.current, v6);
            local v19 = v17:connect(function() --[[ Line: 34 ]]
                -- upvalues: v17 (copy), v7 (ref), v14 (ref), v12 (ref), v13 (ref), v11 (ref), v8 (ref)
                local v18 = v17:currentKey(v7);
                if v14 then
                    if v14[v18] or v12.current and v14[v12.current] then
                        v13.current = v17:currentRule(v7);
                        v11(v18);
                    end;
                else
                    v13.current = v17:currentRule(v7);
                    v11(v8(v18));
                end;
                v12.current = v18;
            end);
            v13.current = v17:currentRule(v7);
            local v20 = v17:currentKey(v7);
            v11(v8(v20));
            v12.current = v20;
            return function() --[[ Line: 53 ]]
                -- upvalues: v19 (copy), v17 (copy)
                v19:disconnect();
                v17:destroy();
            end;
        else
            return function() --[[ Line: 58 ]]

            end;
        end;
    end, {
        v9, 
        v9 and v9.current or false
    });
    return v10, v13.current;
end;
return useResponsiveImpl;