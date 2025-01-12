local v0 = {};
local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v3 = require(l_Parent_1.LuauPolyfill);
local l_Array_0 = v3.Array;
local l_Boolean_0 = v3.Boolean;
local l_clearTimeout_0 = v3.clearTimeout;
local l_Error_0 = v3.Error;
local l_setTimeout_0 = v3.setTimeout;
local v9 = require(l_Parent_0.luaUtils.isCallable);
local l_HttpService_0 = game:GetService("HttpService");
local l_print_0 = require(l_Parent_1.GraphQL).print;
local v12 = require(l_Parent_0.jsutils.equal);
local l_invariant_0 = require(l_Parent_0.jsutils.invariant).invariant;
local l_ApolloLink_0 = require(l_Parent_1.ApolloClient).ApolloLink;
local v15 = require(l_Parent_0.utilities);
local l_Observable_0 = v15.Observable;
local l_addTypenameToDocument_0 = v15.addTypenameToDocument;
local l_removeClientSetsFromDocument_0 = v15.removeClientSetsFromDocument;
local l_removeConnectionDirectiveFromDocument_0 = v15.removeConnectionDirectiveFromDocument;
local l_cloneDeep_0 = v15.cloneDeep;
local l_stringifyForDisplay_0 = v15.stringifyForDisplay;
local function v26(v22, v23) --[[ Line: 49 ]] --[[ Name: requestToKey ]]
    -- upvalues: l_Boolean_0 (copy), l_print_0 (copy), l_addTypenameToDocument_0 (copy), l_HttpService_0 (copy)
    local _ = nil;
    local v25 = {
        query = if l_Boolean_0.toJSBoolean(v22.query) then if v23 then l_print_0(l_addTypenameToDocument_0(v22.query)) else l_print_0(v22.query) else v22.query
    };
    return l_HttpService_0:JSONEncode(v25);
end;
local v27 = setmetatable({}, {
    __index = l_ApolloLink_0
});
v27.__index = v27;
v27.new = function(v28, v29) --[[ Line: 76 ]] --[[ Name: new ]]
    -- upvalues: l_ApolloLink_0 (copy), v27 (copy), l_Boolean_0 (copy), l_Array_0 (copy)
    if v29 == nil then
        v29 = true;
    end;
    local v30 = setmetatable(l_ApolloLink_0.new(), v27);
    v30.addTypename = v29;
    v30.mockedResponsesByKey = {};
    if l_Boolean_0.toJSBoolean(v28) then
        l_Array_0.forEach(v28, function(v31) --[[ Line: 85 ]]
            -- upvalues: v30 (copy)
            v30:addMockedResponse(v31);
        end);
    end;
    return v30;
end;
v27.addMockedResponse = function(v32, v33) --[[ Line: 93 ]] --[[ Name: addMockedResponse ]]
    -- upvalues: v26 (copy), l_Boolean_0 (copy)
    local v34 = v32:normalizeMockedResponse(v33);
    local v35 = v26(v34.request, v32.addTypename);
    local v36 = v32.mockedResponsesByKey[v35];
    if not l_Boolean_0.toJSBoolean(v36) then
        v36 = {};
        v32.mockedResponsesByKey[v35] = v36;
    end;
    table.insert(v36, v34);
end;
v27.request = function(v37, v38) --[[ Line: 104 ]] --[[ Name: request ]]
    -- upvalues: v26 (copy), l_Boolean_0 (copy), l_Array_0 (copy), v12 (copy), l_Error_0 (copy), l_print_0 (copy), l_stringifyForDisplay_0 (copy), l_Observable_0 (copy), l_setTimeout_0 (copy), v9 (copy), l_clearTimeout_0 (copy)
    v37.operation = v38;
    local v39 = v26(v38, v37.addTypename);
    local v40 = {};
    local v41 = l_Boolean_0.toJSBoolean(v38.variables) and v38.variables or {};
    local v42 = v37.mockedResponsesByKey[v39];
    local v43 = nil;
    v43 = if l_Boolean_0.toJSBoolean(v42) then l_Array_0.findIndex(v42, function(v44, _) --[[ Line: 114 ]]
        -- upvalues: l_Boolean_0 (ref), v12 (ref), v41 (copy), v40 (copy)
        local v46 = l_Boolean_0.toJSBoolean(v44.request.variables) and v44.request.variables or {};
        if v12(v41, v46) then
            return true;
        else
            table.insert(v40, v46);
            return false;
        end;
    end) else -1;
    local v47 = nil;
    v47 = if v43 >= 0 then v42[v43] else nil;
    local v48 = nil;
    if not l_Boolean_0.toJSBoolean(v47) then
        v48 = l_Error_0.new(("No more mocked responses for the query: %s\nExpected variables: %s\n%s"):format(l_print_0(v38.query), l_stringifyForDisplay_0(v38.variables), (function() --[[ Line: 141 ]]
            -- upvalues: v40 (copy), l_Array_0 (ref), l_stringifyForDisplay_0 (ref)
            if #v40 > 0 then
                return ("\nFailed to match %s mock%s for this query, which had the following variables:\n\t%s\n"):format(tostring(#v40), #v40 == 1 and "" or "s", l_Array_0.join(l_Array_0.map(v40, function(v49) --[[ Line: 151 ]]
                    -- upvalues: l_stringifyForDisplay_0 (ref)
                    return ("  %s"):format(l_stringifyForDisplay_0(v49));
                end, nil), "\n"));
            else
                return "";
            end;
        end)()));
    else
        l_Array_0.splice(v42, v43, 1);
        local l_newData_0 = v47.newData;
        if l_Boolean_0.toJSBoolean(l_newData_0) then
            v47.result = l_newData_0();
            table.insert(v42, v47);
        end;
        if not l_Boolean_0.toJSBoolean(v47.result) and not l_Boolean_0.toJSBoolean(v47.error) then
            v48 = l_Error_0.new(("Mocked response should contain either result or error: %s"):format(v39));
        end;
    end;
    return l_Observable_0.new(function(v51) --[[ Line: 174 ]]
        -- upvalues: l_setTimeout_0 (ref), l_Boolean_0 (ref), v48 (ref), v37 (copy), v47 (ref), v9 (ref), l_clearTimeout_0 (ref)
        local v53 = l_setTimeout_0(function() --[[ Line: 175 ]]
            -- upvalues: l_Boolean_0 (ref), v48 (ref), v37 (ref), v51 (copy), v47 (ref), v9 (ref)
            if l_Boolean_0.toJSBoolean(v48) then
                xpcall(function() --[[ Line: 177 ]]
                    -- upvalues: v37 (ref), v48 (ref), v51 (ref)
                    if v37:onError(v48, v51) ~= false then
                        error(v48);
                    end;
                end, function(v52) --[[ Line: 186 ]]
                    -- upvalues: v51 (ref)
                    v51:error(v52);
                end);
                return;
            else
                if l_Boolean_0.toJSBoolean(v47) then
                    if l_Boolean_0.toJSBoolean(v47.error) then
                        v51:error(v47.error);
                        return;
                    else
                        if l_Boolean_0.toJSBoolean(v47.result) then
                            v51:next((function() --[[ Line: 194 ]]
                                -- upvalues: v9 (ref), v47 (ref)
                                if v9(v47.result) then
                                    return v47.result();
                                else
                                    return v47.result;
                                end;
                            end)());
                        end;
                        v51:complete();
                    end;
                end;
                return;
            end;
        end, l_Boolean_0.toJSBoolean(v47) and l_Boolean_0.toJSBoolean(v47.delay) and v47.delay or 0);
        return function() --[[ Line: 207 ]]
            -- upvalues: l_clearTimeout_0 (ref), v53 (copy)
            l_clearTimeout_0(v53);
        end;
    end);
end;
v27.normalizeMockedResponse = function(_, v55) --[[ Line: 213 ]] --[[ Name: normalizeMockedResponse ]]
    -- upvalues: l_cloneDeep_0 (copy), l_removeConnectionDirectiveFromDocument_0 (copy), l_invariant_0 (copy), l_removeClientSetsFromDocument_0 (copy), l_Boolean_0 (copy)
    local v56 = l_cloneDeep_0(v55);
    local v57 = l_removeConnectionDirectiveFromDocument_0(v56.request.query);
    l_invariant_0(v57, "query is required");
    v56.request.query = v57;
    local v58 = l_removeClientSetsFromDocument_0(v56.request.query);
    if l_Boolean_0.toJSBoolean(v58) then
        v56.request.query = v58;
    end;
    return v56;
end;
v0.MockLink = v27;
v0.mockSingleLink = function(...) --[[ Line: 232 ]] --[[ Name: mockSingleLink ]]
    -- upvalues: l_Array_0 (copy), v27 (copy)
    local v59 = {
        ...
    };
    local v60 = v59[#v59];
    local v61 = l_Array_0.slice(v59, 1, #v59);
    if typeof(v60) ~= "boolean" then
        v61 = v59;
        v60 = true;
    end;
    return v27.new(v61, v60);
end;
return v0;