local l_Parent_0 = script:FindFirstAncestor("InputUi").Parent;
local v1 = require(l_Parent_0.React);
local l_useInputType_0 = require(l_Parent_0.RoactUtils).Hooks.useInputType;
local l_InputTypeConstants_0 = require(l_Parent_0.InputType).InputTypeConstants;
local v4 = require(script.Parent.useGamepadConnectedEvent);
local l_GetFFlagGamepadAnalytics_0 = require(l_Parent_0.SharedFlags).GetFFlagGamepadAnalytics;
return function(v6, v7, v8, v9) --[[ Line: 9 ]] --[[ Name: useGamepadDisconnectOverlayEffect ]]
    -- upvalues: l_useInputType_0 (copy), l_InputTypeConstants_0 (copy), v1 (copy), l_GetFFlagGamepadAnalytics_0 (copy), v4 (copy)
    local v10 = l_useInputType_0() == l_InputTypeConstants_0.Gamepad;
    local v11 = v1.useRef(false);
    local v13 = v1.useCallback(function() --[[ Line: 19 ]]
        -- upvalues: v11 (copy), l_GetFFlagGamepadAnalytics_0 (ref), v8 (copy), v9 (copy), v7 (copy)
        if v11.current then
            if l_GetFFlagGamepadAnalytics_0() then
                local v12 = {
                    connectionEvent = "gamepadReconnected"
                };
                v8:sendEventDeferred(v9 or "", "gamepadConnectionEvent", v12);
            end;
            v11.current = false;
            v7();
        end;
    end, {
        v7
    });
    local v15 = v1.useCallback(function() --[[ Line: 32 ]]
        -- upvalues: v10 (copy), v11 (copy), l_GetFFlagGamepadAnalytics_0 (ref), v8 (copy), v9 (copy), v6 (copy)
        if not v10 then
            return;
        else
            if not v11.current then
                if l_GetFFlagGamepadAnalytics_0() then
                    local v14 = {
                        connectionEvent = "gamepadDisconnected"
                    };
                    v8:sendEventDeferred(v9 or "", "gamepadConnectionEvent", v14);
                end;
                v11.current = true;
                v6();
            end;
            return;
        end;
    end, {
        v10, 
        v6
    });
    v4(v13, v15);
end;