local v0 = {};
local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v3 = require(l_Parent_1.LuauPolyfill);
local l_Array_0 = v3.Array;
local l_Boolean_0 = v3.Boolean;
local _ = require(l_Parent_1.GraphQL);
local v7 = require(l_Parent_0.jsutils.invariant);
local l_invariant_0 = v7.invariant;
local l_InvariantError_0 = v7.InvariantError;
local l_valueToObjectRepresentation_0 = require(script.Parent.storeUtils).valueToObjectRepresentation;
local function v15(v11) --[[ Line: 23 ]] --[[ Name: checkDocument ]]
    -- upvalues: l_invariant_0 (copy), l_Array_0 (copy), l_InvariantError_0 (copy)
    l_invariant_0(v11 and v11.kind == "Document", "Expecting a parsed GraphQL document. Perhaps you need to wrap the query string in a \"gql\" tag? http://docs.apollostack.com/apollo-client/core.html#gql");
    local v14 = l_Array_0.map(l_Array_0.filter(v11.definitions, function(v12) --[[ Line: 30 ]]
        return v12.kind ~= "FragmentDefinition";
    end), function(v13) --[[ Line: 33 ]]
        -- upvalues: l_InvariantError_0 (ref)
        if v13.kind ~= "OperationDefinition" then
            error(l_InvariantError_0.new(("Schema type definitions not allowed in queries. Found: \"%s\""):format(v13.kind)));
        end;
        return v13;
    end);
    l_invariant_0(#v14 <= 1, ("Ambiguous GraphQL document: contains %s operations"):format((tostring(#v14))));
    return v11;
end;
v0.checkDocument = v15;
v0.getOperationDefinition = function(v16) --[[ Line: 51 ]] --[[ Name: getOperationDefinition ]]
    -- upvalues: v15 (copy), l_Array_0 (copy)
    v15(v16);
    return l_Array_0.filter(v16.definitions, function(v17) --[[ Line: 53 ]]
        return v17.kind == "OperationDefinition";
    end)[1];
end;
v0.getOperationName = function(v18) --[[ Line: 59 ]] --[[ Name: getOperationName ]]
    -- upvalues: l_Array_0 (copy), l_Boolean_0 (copy)
    local v21 = l_Array_0.map(l_Array_0.filter(v18.definitions, function(v19) --[[ Line: 61 ]]
        -- upvalues: l_Boolean_0 (ref)
        if l_Boolean_0.toJSBoolean(v19.kind == "OperationDefinition") then
            return v19.name;
        else
            return v19.kind == "OperationDefinition";
        end;
    end), function(v20) --[[ Line: 68 ]]
        -- upvalues: l_Boolean_0 (ref)
        return l_Boolean_0.toJSBoolean(v20) and l_Boolean_0.toJSBoolean(v20.name) and v20.name.value or nil;
    end);
    return l_Boolean_0.toJSBoolean(v21[1]) and v21[1] or nil;
end;
v0.getFragmentDefinitions = function(v22) --[[ Line: 78 ]] --[[ Name: getFragmentDefinitions ]]
    -- upvalues: l_Array_0 (copy)
    return (l_Array_0.filter(v22.definitions, function(v23) --[[ Line: 79 ]]
        return v23.kind == "FragmentDefinition";
    end));
end;
v0.getQueryDefinition = function(v24) --[[ Line: 85 ]] --[[ Name: getQueryDefinition ]]
    -- upvalues: v15 (copy), l_Array_0 (copy), l_invariant_0 (copy), l_Boolean_0 (copy)
    v15(v24);
    local v26 = l_Array_0.filter(v24.definitions, function(v25) --[[ Line: 53 ]]
        return v25.kind == "OperationDefinition";
    end)[1];
    l_invariant_0(l_Boolean_0.toJSBoolean(v26) and v26.operation == "query", "Must contain a query definition.");
    return v26;
end;
v0.getFragmentDefinition = function(v27) --[[ Line: 93 ]] --[[ Name: getFragmentDefinition ]]
    -- upvalues: l_invariant_0 (copy)
    l_invariant_0(v27.kind == "Document", "Expecting a parsed GraphQL document. Perhaps you need to wrap the query string in a \"gql\" tag? http://docs.apollostack.com/apollo-client/core.html#gql");
    l_invariant_0(#v27.definitions <= 1, "Fragment must have exactly one definition.");
    local v28 = v27.definitions[1];
    l_invariant_0(v28.kind == "FragmentDefinition", "Must be a fragment definition.");
    return v28;
end;
v0.getMainDefinition = function(v29) --[[ Line: 114 ]] --[[ Name: getMainDefinition ]]
    -- upvalues: v15 (copy), l_Boolean_0 (copy), l_InvariantError_0 (copy)
    v15(v29);
    local v30 = nil;
    for _, v32 in ipairs(v29.definitions) do
        if v32.kind == "OperationDefinition" then
            local l_operation_0 = v32.operation;
            if l_operation_0 == "query" or l_operation_0 == "mutation" or l_operation_0 == "subscription" then
                return v32;
            end;
        end;
        if v32.kind == "FragmentDefinition" and not l_Boolean_0.toJSBoolean(v30) then
            v30 = v32;
        end;
    end;
    if l_Boolean_0.toJSBoolean(v30) then
        return v30;
    else
        error(l_InvariantError_0.new("Expected a parsed GraphQL query with a query, mutation, subscription, or a fragment."));
        return;
    end;
end;
v0.getDefaultValues = function(v34) --[[ Line: 142 ]] --[[ Name: getDefaultValues ]]
    -- upvalues: l_Array_0 (copy), l_Boolean_0 (copy), l_valueToObjectRepresentation_0 (copy)
    local v35 = {};
    local v36 = nil;
    v36 = if v34 ~= nil then v34.variableDefinitions else nil;
    if v36 ~= nil and #v36 > 0 then
        l_Array_0.forEach(v36, function(v37) --[[ Line: 151 ]]
            -- upvalues: l_Boolean_0 (ref), l_valueToObjectRepresentation_0 (ref), v35 (copy)
            if l_Boolean_0.toJSBoolean(v37.defaultValue) then
                l_valueToObjectRepresentation_0(v35, v37.variable.name, v37.defaultValue);
            end;
        end);
    end;
    return v35;
end;
return v0;