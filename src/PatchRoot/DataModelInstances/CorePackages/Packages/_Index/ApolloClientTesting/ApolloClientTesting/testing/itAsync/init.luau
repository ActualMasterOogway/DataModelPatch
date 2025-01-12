local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.LuauPolyfill);
local v2 = require(l_Parent_0.Promise);
local l_it_0 = require(l_Parent_0.JestGlobals).it;
local v4 = {};
local function _(v5) --[[ Line: 19 ]] --[[ Name: wrap ]]
    -- upvalues: l_it_0 (copy), v2 (copy)
    return function(v6, v7, v8) --[[ Line: 20 ]]
        -- upvalues: v5 (copy), l_it_0 (ref), v2 (ref)
        return (if v5 then l_it_0[v5] else l_it_0)(v6, function() --[[ Line: 21 ]]
            -- upvalues: v2 (ref), v7 (copy)
            return v2.new(function(v9, v10) --[[ Line: 23 ]]
                -- upvalues: v7 (ref)
                v7(v9, v10);
            end):andThen(function(v11) --[[ Line: 32 ]]
                -- upvalues: v2 (ref)
                return v2.delay(0.016666666666666666):andThenReturn(v11);
            end);
        end, v8);
    end;
end;
local v13 = nil;
local function v20(v14, v15, v16) --[[ Line: 20 ]]
    -- upvalues: v13 (copy), l_it_0 (copy), v2 (copy)
    return (if v13 then l_it_0[v13] else l_it_0)(v14, function() --[[ Line: 21 ]]
        -- upvalues: v2 (ref), v15 (copy)
        return v2.new(function(v17, v18) --[[ Line: 23 ]]
            -- upvalues: v15 (ref)
            v15(v17, v18);
        end):andThen(function(v19) --[[ Line: 32 ]]
            -- upvalues: v2 (ref)
            return v2.delay(0.016666666666666666):andThenReturn(v19);
        end);
    end, v16);
end;
local v21 = {};
local v22 = "only";
local l_v22_0 = v22 --[[ copy: 12 -> 13 ]];
v21.only = function(v24, v25, v26) --[[ Line: 20 ]]
    -- upvalues: l_v22_0 (copy), l_it_0 (copy), v2 (copy)
    return (if l_v22_0 then l_it_0[l_v22_0] else l_it_0)(v24, function() --[[ Line: 21 ]]
        -- upvalues: v2 (ref), v25 (copy)
        return v2.new(function(v27, v28) --[[ Line: 23 ]]
            -- upvalues: v25 (ref)
            v25(v27, v28);
        end):andThen(function(v29) --[[ Line: 32 ]]
            -- upvalues: v2 (ref)
            return v2.delay(0.016666666666666666):andThenReturn(v29);
        end);
    end, v26);
end;
v22 = "skip";
local l_v22_1 = v22 --[[ copy: 12 -> 14 ]];
v21.skip = function(v31, v32, v33) --[[ Line: 20 ]]
    -- upvalues: l_v22_1 (copy), l_it_0 (copy), v2 (copy)
    return (if l_v22_1 then l_it_0[l_v22_1] else l_it_0)(v31, function() --[[ Line: 21 ]]
        -- upvalues: v2 (ref), v32 (copy)
        return v2.new(function(v34, v35) --[[ Line: 23 ]]
            -- upvalues: v32 (ref)
            v32(v34, v35);
        end):andThen(function(v36) --[[ Line: 32 ]]
            -- upvalues: v2 (ref)
            return v2.delay(0.016666666666666666):andThenReturn(v36);
        end);
    end, v33);
end;
v22 = "todo";
v21.todo = function(v37, v38, v39) --[[ Line: 20 ]]
    -- upvalues: v22 (copy), l_it_0 (copy), v2 (copy)
    return (if v22 then l_it_0[v22] else l_it_0)(v37, function() --[[ Line: 21 ]]
        -- upvalues: v2 (ref), v38 (copy)
        return v2.new(function(v40, v41) --[[ Line: 23 ]]
            -- upvalues: v38 (ref)
            v38(v40, v41);
        end):andThen(function(v42) --[[ Line: 32 ]]
            -- upvalues: v2 (ref)
            return v2.delay(0.016666666666666666):andThenReturn(v42);
        end);
    end, v39);
end;
v4.itAsync = setmetatable(v21, {
    __call = function(_, v44, v45, v46) --[[ Line: 48 ]] --[[ Name: __call ]]
        -- upvalues: v20 (copy)
        return v20(v44, v45, v46);
    end
});
return v4;