local l_Parent_0 = script:FindFirstAncestor("AppShortcutBar").Parent;
local v1 = require(l_Parent_0.React);
local _ = require(l_Parent_0.FocusNavigationUtils);
local v3 = {
    ButtonHoldStarted = "ButtonHoldStarted", 
    ButtonHoldEnded = "ButtonHoldEnded"
};
local v10 = {
    [v3.ButtonHoldStarted] = function(v4, v5) --[[ Line: 33 ]]
        local v6 = table.clone(v4);
        v6.heldProgress[v5.eventName] = v5.progress;
        return v6;
    end, 
    [v3.ButtonHoldEnded] = function(v7, v8) --[[ Line: 38 ]]
        local v9 = table.clone(v7);
        v9.heldProgress[v8.eventName] = nil;
        return v9;
    end
};
local function v14(v11, v12) --[[ Line: 45 ]] --[[ Name: registryReducer ]]
    -- upvalues: v10 (copy)
    local v13 = v10[v12.type];
    if v13 then
        return v13(v11, v12.payload);
    else
        error("Unknown action: " .. v12.type);
        return;
    end;
end;
local v15 = v1.createContext(nil);
return {
    Context = v15, 
    Provider = function(v16) --[[ Line: 55 ]] --[[ Name: AppShortcutBarStateProvider ]]
        -- upvalues: v1 (copy), v14 (copy), v15 (copy)
        local v17, v18 = v1.useReducer(v14, {
            heldProgress = {}
        });
        return v1.createElement(v15.Provider, {
            value = {
                state = v17, 
                dispatch = v18
            }
        }, v16.children);
    end, 
    useDispatchButtonHoldStarted = function() --[[ Line: 70 ]] --[[ Name: useDispatchButtonHoldStarted ]]
        -- upvalues: v1 (copy), v15 (copy), v3 (copy)
        local v19 = v1.useContext(v15);
        local v20 = if v19 then v19.dispatch else nil;
        return (v1.useCallback(function(v21, v22) --[[ Line: 73 ]]
            -- upvalues: v20 (copy), v3 (ref)
            if v20 then
                v20({
                    type = v3.ButtonHoldStarted, 
                    payload = {
                        eventName = v21, 
                        progress = v22
                    }
                });
            end;
        end, {
            v20
        }));
    end, 
    useDispatchButtonHoldEnded = function() --[[ Line: 87 ]] --[[ Name: useDispatchButtonHoldEnded ]]
        -- upvalues: v1 (copy), v15 (copy), v3 (copy)
        local v23 = v1.useContext(v15);
        local v24 = if v23 then v23.dispatch else nil;
        return (v1.useCallback(function(v25) --[[ Line: 90 ]]
            -- upvalues: v24 (copy), v3 (ref)
            if v24 then
                v24({
                    type = v3.ButtonHoldEnded, 
                    payload = {
                        eventName = v25
                    }
                });
            end;
        end, {
            v24
        }));
    end, 
    useHeldProgressByEvent = function() --[[ Line: 62 ]] --[[ Name: useHeldProgressByEvent ]]
        -- upvalues: v1 (copy), v15 (copy)
        local v26 = v1.useContext(v15);
        if v26 then
            return v26.state.heldProgress;
        else
            return {};
        end;
    end, 
    AppShortcutBarStateActionEnum = v3
};