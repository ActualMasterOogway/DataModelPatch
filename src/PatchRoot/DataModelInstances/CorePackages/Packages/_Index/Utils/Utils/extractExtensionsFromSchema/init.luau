local l_Parent_0 = script.Parent.Parent;
local l_Boolean_0 = require(l_Parent_0.LuauPolyfill).Boolean;
local v2 = {};
local l_mapSchema_0 = require(script.Parent.mapSchema).mapSchema;
local _ = require(l_Parent_0.GraphQL);
local _ = require(script.Parent.types);
local l_MapperKind_0 = require(script.Parent.Interfaces).MapperKind;
v2.extractExtensionsFromSchema = function(v7) --[[ Line: 42 ]] --[[ Name: extractExtensionsFromSchema ]]
    -- upvalues: l_Boolean_0 (copy), l_mapSchema_0 (copy), l_MapperKind_0 (copy)
    local v8 = {
        schemaExtensions = l_Boolean_0.toJSBoolean(v7.extensions) and v7.extensions or {}, 
        types = {}
    };
    l_mapSchema_0(v7, {
        [tostring(l_MapperKind_0.OBJECT_TYPE)] = function(v9) --[[ Line: 48 ]]
            -- upvalues: v8 (copy), l_Boolean_0 (ref)
            v8.types[tostring(v9.name)] = {
                fields = {}, 
                type = "object", 
                extensions = l_Boolean_0.toJSBoolean(v9.extensions) and v9.extensions or {}
            };
            return v9;
        end, 
        [tostring(l_MapperKind_0.INTERFACE_TYPE)] = function(v10) --[[ Line: 59 ]]
            -- upvalues: v8 (copy), l_Boolean_0 (ref)
            v8.types[tostring(v10.name)] = {
                fields = {}, 
                type = "interface", 
                extensions = if l_Boolean_0.toJSBoolean(v10.extensions) then v10.extensions else {}
            };
            return v10;
        end, 
        [tostring(l_MapperKind_0.FIELD)] = function(v11, v12, v13) --[[ Line: 73 ]]
            -- upvalues: v8 (copy), l_Boolean_0 (ref)
            v8.types[v13].fields[v12] = {
                arguments = {}, 
                extensions = if l_Boolean_0.toJSBoolean(v11.extensions) then v11.extensions else {}
            };
            local l_args_0 = v11.args;
            if l_args_0 ~= nil then
                for _, v16 in l_args_0 do
                    local v17 = table.unpack(v16);
                    v8.types[v13].fields[v12].arguments[tostring(v17)] = l_Boolean_0.toJSBoolean(l_args_0[tostring(v17)].extensions) and l_args_0[tostring(v17)].extensions or {};
                end;
            end;
            return v11;
        end, 
        [tostring(l_MapperKind_0.ENUM_TYPE)] = function(v18) --[[ Line: 110 ]]
            -- upvalues: v8 (copy), l_Boolean_0 (ref)
            v8.types[tostring(v18.name)] = {
                values = {}, 
                type = "enum", 
                extensions = l_Boolean_0.toJSBoolean(v18.extensions) and v18.extensions or {}
            };
            return v18;
        end, 
        [tostring(l_MapperKind_0.ENUM_VALUE)] = function(v19, v20, _, v22) --[[ Line: 121 ]]
            -- upvalues: v8 (copy), l_Boolean_0 (ref)
            v8.types[v20].values[v22] = l_Boolean_0.toJSBoolean(v19.extensions) and v19.extensions or {};
            return v19;
        end, 
        [tostring(l_MapperKind_0.SCALAR_TYPE)] = function(v23) --[[ Line: 135 ]]
            -- upvalues: v8 (copy), l_Boolean_0 (ref)
            v8.types[tostring(v23.name)] = {
                type = "scalar", 
                extensions = l_Boolean_0.toJSBoolean(v23.extensions) and v23.extensions or {}
            };
            return v23;
        end, 
        [tostring(l_MapperKind_0.UNION_TYPE)] = function(v24) --[[ Line: 145 ]]
            -- upvalues: v8 (copy), l_Boolean_0 (ref)
            v8.types[tostring(v24.name)] = {
                type = "union", 
                extensions = l_Boolean_0.toJSBoolean(v24.extensions) and v24.extensions or {}
            };
            return v24;
        end, 
        [tostring(l_MapperKind_0.INPUT_OBJECT_TYPE)] = function(v25) --[[ Line: 155 ]]
            -- upvalues: v8 (copy), l_Boolean_0 (ref)
            v8.types[tostring(v25.name)] = {
                fields = {}, 
                type = "input", 
                extensions = l_Boolean_0.toJSBoolean(v25.extensions) and v25.extensions or {}
            };
            return v25;
        end, 
        [tostring(l_MapperKind_0.INPUT_OBJECT_FIELD)] = function(v26, v27, v28) --[[ Line: 166 ]]
            -- upvalues: v8 (copy), l_Boolean_0 (ref)
            v8.types[v28].fields[v27] = {
                extensions = l_Boolean_0.toJSBoolean(v26.extensions) and v26.extensions or {}
            };
            return v26;
        end
    });
    return v8;
end;
return v2;