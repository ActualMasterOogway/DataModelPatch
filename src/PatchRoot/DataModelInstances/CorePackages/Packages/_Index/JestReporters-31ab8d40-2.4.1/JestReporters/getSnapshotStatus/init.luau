local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Boolean_0 = v1.Boolean;
local l_Array_0 = v1.Array;
local v4 = {};
local v5 = require(l_Parent_0.ChalkLua);
local _ = require(l_Parent_0.JestTestResult);
local l_pluralize_0 = require(l_Parent_0.JestUtil).pluralize;
local function v8(...) --[[ Line: 28 ]]
    -- upvalues: v5 (copy)
    return v5.bold(v5.red(...));
end;
local function v9(...) --[[ Line: 31 ]]
    -- upvalues: v5 (copy)
    return v5.bold(v5.green(...));
end;
local function v10(...) --[[ Line: 34 ]]
    -- upvalues: v5 (copy)
    return v5.bold(v5.green(...));
end;
local function v11(...) --[[ Line: 37 ]]
    -- upvalues: v5 (copy)
    return v5.bold(v5.yellow(...));
end;
v4.default = function(v12, v13) --[[ Line: 42 ]]
    -- upvalues: l_Boolean_0 (copy), v9 (copy), l_pluralize_0 (copy), v10 (copy), v8 (copy), v11 (copy), l_Array_0 (copy)
    local v14 = {};
    if l_Boolean_0.toJSBoolean(v12.added) then
        table.insert(v14, v9(" \226\128\186 " .. l_pluralize_0("snapshot", v12.added) .. " written."));
    end;
    if l_Boolean_0.toJSBoolean(v12.updated) then
        table.insert(v14, v10(" \226\128\186 " .. l_pluralize_0("snapshot", v12.updated) .. " updated."));
    end;
    if l_Boolean_0.toJSBoolean(v12.unmatched) then
        table.insert(v14, v8(" \226\128\186 " .. l_pluralize_0("snapshot", v12.unmatched) .. " failed."));
    end;
    if l_Boolean_0.toJSBoolean(v12.unchecked) then
        if v13 then
            table.insert(v14, v10(" \226\128\186 " .. l_pluralize_0("snapshot", v12.unchecked) .. " removed."));
        else
            table.insert(v14, v11(" \226\128\186 " .. l_pluralize_0("snapshot", v12.unchecked) .. " obsolete."));
        end;
        l_Array_0.forEach(v12.uncheckedKeys, function(v15) --[[ Line: 67 ]]
            -- upvalues: v14 (copy)
            table.insert(v14, "\t" .. " \226\128\162 " .. v15);
        end);
    end;
    if v12.fileDeleted then
        table.insert(v14, v10(" \226\128\186 " .. "snapshot file removed."));
    end;
    return v14;
end;
return v4;