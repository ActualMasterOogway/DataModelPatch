local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Boolean_0 = v1.Boolean;
local l_Map_0 = v1.Map;
local l_Set_0 = v1.Set;
local v6 = {};
local l_memoize5_0 = require(script.Parent.memoize).memoize5;
local v8 = require(l_Parent_0.GraphQL);
local l_Kind_0 = v8.Kind;
local l_getDirectiveValues_0 = v8.getDirectiveValues;
local l_GraphQLSkipDirective_0 = v8.GraphQLSkipDirective;
local l_GraphQLIncludeDirective_0 = v8.GraphQLIncludeDirective;
local l_isAbstractType_0 = v8.isAbstractType;
local l_typeFromAST_0 = v8.typeFromAST;
local v15 = nil;
local v16 = nil;
local v17 = nil;
local function v18(v19, v20, v21, v22, v23, v24, v25) --[[ Line: 52 ]] --[[ Name: collectFields ]]
    -- upvalues: l_Kind_0 (copy), l_Boolean_0 (copy), v15 (ref), v16 (ref), v17 (ref), v18 (copy)
    for _, v27 in v23.selections do
        local l_kind_0 = v27.kind;
        if l_kind_0 == l_Kind_0.FIELD then
            if l_Boolean_0.toJSBoolean(v15(v21, v27)) then
                local v29 = v16(v27);
                local v30 = v24:get(v29);
                if v30 ~= nil then
                    table.insert(v30, v27);
                else
                    v24:set(v29, {
                        v27
                    });
                end;
            end;
        elseif l_kind_0 == l_Kind_0.INLINE_FRAGMENT then
            if v15(v21, v27) and v17(v19, v27, v22) then
                v18(v19, v20, v21, v22, v27.selectionSet, v24, v25);
            end;
        elseif l_kind_0 == l_Kind_0.FRAGMENT_SPREAD then
            local l_value_0 = v27.name.value;
            if not v25:has(l_value_0) and v15(v21, v27) then
                v25:add(l_value_0);
                local v32 = v20[tostring(l_value_0)];
                if l_Boolean_0.toJSBoolean(v32) and l_Boolean_0.toJSBoolean(v17(v19, v32, v22)) then
                    v18(v19, v20, v21, v22, v32.selectionSet, v24, v25);
                end;
            end;
        end;
    end;
    return v24;
end;
v6.collectFields = v18;
v15 = function(v33, v34) --[[ Line: 164 ]] --[[ Name: shouldIncludeNode ]]
    -- upvalues: l_getDirectiveValues_0 (copy), l_GraphQLSkipDirective_0 (copy), l_GraphQLIncludeDirective_0 (copy)
    local v35 = l_getDirectiveValues_0(l_GraphQLSkipDirective_0, v34, v33);
    if (if typeof(v35) == "table" then v35["if"] else nil) == true then
        return false;
    else
        local v36 = l_getDirectiveValues_0(l_GraphQLIncludeDirective_0, v34, v33);
        if (if typeof(v36) == "table" then v36["if"] else nil) == false then
            return false;
        else
            return true;
        end;
    end;
end;
v17 = function(v37, v38, v39) --[[ Line: 184 ]] --[[ Name: doesFragmentConditionMatch ]]
    -- upvalues: l_Boolean_0 (copy), l_typeFromAST_0 (copy), l_isAbstractType_0 (copy), l_Array_0 (copy)
    local l_typeCondition_0 = v38.typeCondition;
    if not l_Boolean_0.toJSBoolean(l_typeCondition_0) then
        return true;
    else
        local v41 = l_typeFromAST_0(v37, l_typeCondition_0);
        if v41 == v39 then
            return true;
        elseif l_Boolean_0.toJSBoolean(l_isAbstractType_0(v41)) then
            local v42 = v37:getPossibleTypes(v41);
            return l_Array_0.includes(v42, v39);
        else
            return false;
        end;
    end;
end;
v16 = function(v43) --[[ Line: 218 ]] --[[ Name: getFieldEntryKey ]]
    if v43.alias then
        return v43.alias.value;
    else
        return v43.name.value;
    end;
end;
v6.collectSubFields = l_memoize5_0(function(v44, v45, v46, v47, v48) --[[ Line: 226 ]]
    -- upvalues: l_Map_0 (copy), l_Set_0 (copy), v18 (copy)
    local v49 = l_Map_0.new();
    local v50 = l_Set_0.new();
    for _, v52 in v48 do
        if v52.selectionSet then
            v18(v44, v45, v46, v47, v52.selectionSet, v49, v50);
        end;
    end;
    return v49;
end);
return v6;