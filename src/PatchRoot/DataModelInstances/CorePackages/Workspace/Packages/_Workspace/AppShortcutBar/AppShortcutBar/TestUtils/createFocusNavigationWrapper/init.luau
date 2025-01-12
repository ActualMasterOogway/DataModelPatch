local l_Parent_0 = script:FindFirstAncestor("AppShortcutBar").Parent;
local v1 = require(l_Parent_0.Dev.Rodux);
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.ReactFocusNavigation);
local l_mockProviders_0 = require(l_Parent_0.Dev.UnitTestHelpers).mockProviders;
local function v11(v5) --[[ Line: 7 ]] --[[ Name: FocusNavigationWrapper ]]
    -- upvalues: v3 (copy), v2 (copy)
    local v6 = v3.useFocusGuiObject();
    local v8 = v2.useCallback(function(v7) --[[ Line: 9 ]]
        -- upvalues: v6 (copy)
        if v7 then
            v6(v7, false);
        end;
    end, {
        v6
    });
    local v9 = v3.useEventMap(v5.eventMap, v8);
    local v10 = v3.useEventHandlerMap(v5.eventHandlerMap, v9);
    return v2.createElement("Frame", {
        ref = v10
    }, v5.children);
end;
return function(v12, v13) --[[ Line: 19 ]] --[[ Name: createFocusNavigationWrapper ]]
    -- upvalues: v1 (copy), v2 (copy), v3 (copy), v11 (copy), l_mockProviders_0 (copy)
    local v15 = v1.Store.new(function(v14) --[[ Line: 27 ]]
        return v14;
    end, v13 or {});
    return function(v16) --[[ Line: 31 ]] --[[ Name: CreatedWrapper ]]
        -- upvalues: v2 (ref), v3 (ref), v12 (copy), v11 (ref), l_mockProviders_0 (ref), v15 (copy)
        local v17 = v2.createElement(v3.FocusNavigationContext.Provider, {
            value = v12.focusNavigation
        }, v2.createElement(v11, {
            eventMap = v12.eventMap or {}, 
            eventHandlerMap = v12.eventHandlerMap or {}
        }, v16.children));
        return l_mockProviders_0(v17, {
            store = v15
        });
    end;
end;