local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Boolean_0 = v1.Boolean;
local l_Error_0 = v1.Error;
local l_Object_0 = v1.Object;
local v5 = {};
local _ = require(script.Parent["merge-typedefs_types"]);
local l_Kind_0 = require(l_Parent_0.GraphQL).Kind;
local l_mergeFields_0 = require(script.Parent.fields).mergeFields;
local l_mergeDirectives_0 = require(script.Parent.directives).mergeDirectives;
local l_mergeNamedTypeArray_0 = require(script.Parent["merge-named-type-array"]).mergeNamedTypeArray;
v5.mergeType = function(v11, v12, v13) --[[ Line: 29 ]] --[[ Name: mergeType ]]
    -- upvalues: l_Boolean_0 (copy), l_mergeFields_0 (copy), l_mergeDirectives_0 (copy), l_mergeNamedTypeArray_0 (copy), l_Error_0 (copy), l_Object_0 (copy), l_Kind_0 (copy)
    if v12 then
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 41 ]]
            -- upvalues: v11 (copy), l_Boolean_0 (ref), v12 (copy), v13 (copy), l_mergeFields_0 (ref), l_mergeDirectives_0 (ref), l_mergeNamedTypeArray_0 (ref)
            return {
                name = v11.name, 
                description = if l_Boolean_0.toJSBoolean(v11.description) then v11.description else v12.description, 
                kind = (not (not (v13 and l_Boolean_0.toJSBoolean(v13.convertExtensions)) and v11.kind ~= "ObjectTypeDefinition") or v12.kind == "ObjectTypeDefinition") and "ObjectTypeDefinition" or "ObjectTypeExtension", 
                loc = v11.loc, 
                fields = l_mergeFields_0(v11, v11.fields, v12.fields, v13), 
                directives = l_mergeDirectives_0(v11.directives, v12.directives, v13), 
                interfaces = l_mergeNamedTypeArray_0(v11.interfaces, v12.interfaces, v13)
            };
        end);
        if not l_status_0 then
            error(l_Error_0.new(("Unable to merge GraphQL type \"%s\": %s"):format(tostring(v11.name.value), (tostring(l_result_0.message)))));
        end;
        return l_result_0;
    elseif v13 and l_Boolean_0.toJSBoolean(v13.convertExtensions) then
        return (l_Object_0.assign({}, v11, {
            kind = l_Kind_0.OBJECT_TYPE_DEFINITION
        }));
    else
        return v11;
    end;
end;
return v5;