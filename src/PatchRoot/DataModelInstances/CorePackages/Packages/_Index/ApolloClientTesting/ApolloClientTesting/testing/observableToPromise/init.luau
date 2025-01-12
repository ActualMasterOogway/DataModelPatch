local v0 = {};
local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v3 = require(l_Parent_1.LuauPolyfill);
local l_Boolean_0 = v3.Boolean;
local l_Error_0 = v3.Error;
local l_setTimeout_0 = v3.setTimeout;
local v7 = require(l_Parent_1.Promise);
local _ = require(l_Parent_1.ApolloClient);
local _ = require(l_Parent_1.ApolloClient);
local _ = require(l_Parent_0.utilities.observables.Observable);
local function v35(v11, ...) --[[ Line: 49 ]] --[[ Name: observableToPromiseAndSubscription ]]
    -- upvalues: v7 (copy), l_setTimeout_0 (copy), l_Boolean_0 (copy), l_Error_0 (copy)
    local v12 = {
        ...
    };
    local l_observable_0 = v11.observable;
    local v14 = nil;
    local v15 = nil;
    local v16 = nil;
    v14 = v11.shouldResolve == nil or v11.shouldResolve;
    v15 = if v11.wait ~= nil then v11.wait else -1;
    v16 = if v11.errorCallbacks ~= nil then v11.errorCallbacks else {};
    local v17 = nil;
    return {
        promise = v7.new(function(v18, v19) --[[ Line: 78 ]]
            -- upvalues: v14 (ref), v17 (ref), v12 (copy), v16 (ref), v15 (ref), l_setTimeout_0 (ref), v7 (ref), l_observable_0 (copy), l_Boolean_0 (ref), l_Error_0 (ref)
            local v20 = 0;
            local v21 = 0;
            local v22 = {};
            local function v24() --[[ Line: 83 ]] --[[ Name: tryToResolve ]]
                -- upvalues: v14 (ref), v17 (ref), v18 (copy), v22 (copy), v21 (ref), v12 (ref), v20 (ref), v16 (ref), v15 (ref), l_setTimeout_0 (ref)
                if not v14 then
                    return;
                else
                    local function v23() --[[ Line: 88 ]] --[[ Name: done ]]
                        -- upvalues: v17 (ref), v18 (ref), v22 (ref)
                        v17:unsubscribe();
                        v18(v22);
                    end;
                    if v21 == #v12 and v20 == #v16 then
                        if v15 == -1 then
                            v17:unsubscribe();
                            v18(v22);
                            return;
                        else
                            l_setTimeout_0(v23, v15);
                        end;
                    end;
                    return;
                end;
            end;
            local v25 = v7.delay(0);
            v17 = l_observable_0:subscribe({
                next = function(_, v27) --[[ Line: 106 ]] --[[ Name: next ]]
                    -- upvalues: v25 (ref), v21 (ref), v12 (ref), l_Boolean_0 (ref), v19 (copy), l_Error_0 (ref), v22 (copy), v24 (copy)
                    v25 = v25:andThen(function() --[[ Line: 108 ]]
                        -- upvalues: v21 (ref), v12 (ref), l_Boolean_0 (ref), v27 (copy), v19 (ref), l_Error_0 (ref)
                        local l_v21_0 = v21;
                        v21 = v21 + 1;
                        local v29 = v12[l_v21_0 + 1];
                        if l_Boolean_0.toJSBoolean(v29) then
                            return v29(v27);
                        else
                            v19(l_Error_0.new(("Observable 'next' method called more than %d times"):format(#v12)));
                            return nil;
                        end;
                    end):andThen(function(v30) --[[ Line: 118 ]]
                        -- upvalues: v22 (ref), v24 (ref)
                        table.insert(v22, v30);
                        v24();
                    end, v19);
                end, 
                error = function(_, v32) --[[ Line: 123 ]] --[[ Name: error ]]
                    -- upvalues: v25 (ref), v20 (ref), v16 (ref), l_Boolean_0 (ref), v19 (copy), v24 (copy)
                    v25 = v25:andThen(function() --[[ Line: 125 ]]
                        -- upvalues: v20 (ref), v16 (ref), l_Boolean_0 (ref), v32 (copy), v19 (ref)
                        local l_v20_0 = v20;
                        v20 = v20 + 1;
                        local v34 = v16[l_v20_0 + 1];
                        if l_Boolean_0.toJSBoolean(v34) then
                            return v34(v32);
                        else
                            v19(v32);
                            return nil;
                        end;
                    end):andThen(v24, v19);
                end
            });
        end), 
        subscription = v17
    };
end;
v0.observableToPromiseAndSubscription = v35;
v0.default = function(v36, ...) --[[ Line: 148 ]]
    -- upvalues: v35 (copy)
    return v35(v36, ...).promise;
end;
return v0;