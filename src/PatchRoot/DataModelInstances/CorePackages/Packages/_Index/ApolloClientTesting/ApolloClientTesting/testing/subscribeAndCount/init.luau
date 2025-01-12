local v0 = {};
local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v3 = require(l_Parent_1.Promise);
local _ = require(l_Parent_1.ApolloClient);
local _ = require(l_Parent_1.ApolloClient);
local _ = require(l_Parent_0.utilities.observables.Observable);
local l_asyncMap_0 = require(l_Parent_0.utilities.observables.asyncMap).asyncMap;
v0.default = function(v8, v9, v10) --[[ Line: 27 ]] --[[ Name: subscribeAndCount ]]
    -- upvalues: v3 (copy), l_asyncMap_0 (copy)
    local v11 = nil;
    local v12 = v3.delay(0);
    local v13 = 0;
    local v16 = l_asyncMap_0(v9, function(v14) --[[ Line: 39 ]]
        -- upvalues: v12 (ref), v3 (ref), v13 (ref), v10 (copy), v11 (ref)
        v12 = v12:andThen(function() --[[ Line: 45 ]]
            -- upvalues: v3 (ref)
            return v3.delay(0);
        end):andThen(function() --[[ Line: 49 ]]
            -- upvalues: v13 (ref), v10 (ref), v14 (copy)
            v13 = v13 + 1;
            return v10(v13, v14);
        end):catch(v11);
        return v12;
    end):subscribe({
        error = function(_, ...) --[[ Line: 56 ]] --[[ Name: error ]]
            -- upvalues: v11 (ref)
            v11(...);
        end
    });
    v11 = function(v17) --[[ Line: 61 ]] --[[ Name: error_ ]]
        -- upvalues: v16 (copy), v8 (copy)
        v16:unsubscribe();
        v8(v17);
    end;
    return v16;
end;
return v0;