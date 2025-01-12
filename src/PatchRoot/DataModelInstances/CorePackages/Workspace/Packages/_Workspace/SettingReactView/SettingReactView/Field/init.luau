local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_FieldType_0 = require(l_Parent_1.SettingsService).FieldType;
local v3 = require(l_Parent_1.React);
local v4 = require(l_Parent_0.Toggle);
return function(v5) --[[ Line: 17 ]]
    -- upvalues: l_FieldType_0 (copy), v3 (copy), v4 (copy)
    local v6 = {};
    if v5.field_type == l_FieldType_0.Toggle then
        v6 = v3.createElement(v4, v5);
    end;
    return v6;
end;