local v0 = {};
local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Object_0 = require(l_Parent_1.LuauPolyfill).Object;
local _ = require(script.Parent.Parent.Parent.core);
local v5 = require(l_Parent_1.React);
local l_useContext_0 = v5.useContext;
local l_useState_0 = v5.useState;
local l_useRef_0 = v5.useRef;
local l_useEffect_0 = v5.useEffect;
local _ = require(l_Parent_1.GraphQL);
local _ = require(l_Parent_0.jsutils.typedDocumentNode);
local _ = require(script.Parent.Parent.types.types);
local l_MutationData_0 = require(script.Parent.Parent.data).MutationData;
local l_getApolloContext_0 = require(script.Parent.Parent.context).getApolloContext;
v0.useMutation = function(v15, v16) --[[ Line: 40 ]] --[[ Name: useMutation ]]
    -- upvalues: l_useContext_0 (copy), l_getApolloContext_0 (copy), l_useState_0 (copy), l_Object_0 (copy), l_useRef_0 (copy), l_MutationData_0 (copy), l_useEffect_0 (copy)
    local v17 = l_useContext_0(l_getApolloContext_0());
    local v18, v19 = l_useState_0({
        called = false, 
        loading = false
    });
    local v20 = if v16 then l_Object_0.assign({}, v16, {
        mutation = v15
    }) else {
        mutation = v15
    };
    local v21 = l_useRef_0(nil);
    local v24 = (function() --[[ Line: 52 ]] --[[ Name: getMutationDataRef ]]
        -- upvalues: v21 (copy), l_MutationData_0 (ref), v20 (copy), v17 (copy), v18 (copy), v19 (copy)
        if not v21.current then
            v21.current = l_MutationData_0.new({
                options = v20, 
                context = v17, 
                result = v18, 
                setResult = function(_, v23) --[[ Line: 58 ]] --[[ Name: setResult ]]
                    -- upvalues: v19 (ref)
                    v19(v23);
                    return nil;
                end
            });
        end;
        return v21.current;
    end)();
    v24:setOptions(v20);
    v24.context = v17;
    l_useEffect_0(function() --[[ Line: 72 ]]
        -- upvalues: v24 (copy)
        return v24:afterExecute();
    end);
    return v24:execute(v18);
end;
return v0;