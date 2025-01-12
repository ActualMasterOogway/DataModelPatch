local v0 = {};
local l_Parent_0 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v2.Array;
local l_Object_0 = v2.Object;
local function v5(v6) --[[ Line: 24 ]] --[[ Name: stripSymbols ]]
    -- upvalues: l_Object_0 (copy), l_Array_0 (copy), v5 (copy)
    local v7 = l_Object_0.assign({}, v6);
    l_Array_0.forEach(l_Object_0.keys(v7), function(v8) --[[ Line: 33 ]]
        -- upvalues: v7 (copy), l_Array_0 (ref), v5 (ref)
        if typeof(v8) == "userdata" and string.sub(tostring(v8), 1, 7) == "Symbol(" and v8 ~= tostring(v8) then
            v7[v8] = nil;
            return;
        else
            if typeof(v7[v8]) == "table" and not l_Array_0.isArray(v7) then
                v7[v8] = v5(v7[v8]);
            end;
            return;
        end;
    end);
    return v7;
end;
v0.stripSymbols = v5;
return v0;