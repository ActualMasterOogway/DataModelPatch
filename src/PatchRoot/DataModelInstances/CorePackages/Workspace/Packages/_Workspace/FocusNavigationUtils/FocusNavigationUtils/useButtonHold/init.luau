local l_script_FirstAncestor_0 = script:FindFirstAncestor("FocusNavigationUtils");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.ArgCheck);
local v3 = require(l_script_FirstAncestor_0.ButtonHoldStateEnum);
local v4 = require(l_Parent_0.InputHandlers);
local v5 = require(l_Parent_0.React);
local function v11(v6, v7, v8) --[[ Line: 18 ]] --[[ Name: useFakeCancelHoldAfterBlur ]]
    -- upvalues: v5 (copy)
    local v9 = v5.useCallback(function() --[[ Line: 19 ]]
        -- upvalues: v7 (copy), v8 (copy)
        v7({
            eventData = {
                UserInputState = Enum.UserInputState.End
            }
        });
        v8();
    end, {
        v7, 
        v8
    });
    v5.useEffect(function() --[[ Line: 31 ]]
        -- upvalues: v6 (copy), v9 (copy)
        if v6 and v6:IsA("GuiObject") then
            local v10 = v6.SelectionLost:Connect(v9);
            return function() --[[ Line: 34 ]]
                -- upvalues: v10 (copy)
                v10:Disconnect();
            end;
        else
            return function() --[[ Line: 38 ]]

            end;
        end;
    end, {
        v6, 
        v9
    });
end;
return function(v12, v13) --[[ Line: 42 ]] --[[ Name: useButtonHold ]]
    -- upvalues: v2 (copy), v5 (copy), v3 (copy), v4 (copy), v11 (copy)
    v2.assert(v12 >= 0, "signalHoldIntentSeconds must be greater than or equal to 0");
    v2.assert(v13 > 0, "signalHoldCompleteSeconds must be greater than 0");
    v2.assert(v12 < v13, "signalHoldIntentSeconds should be less than signalHoldCompleteSeconds");
    local v14, v15 = v5.useState(v3.NOT_HELD);
    local v16, v17 = v5.useBinding(0);
    local v18, v19 = v5.useState(nil);
    local v20 = v5.useCallback(function() --[[ Line: 53 ]]
        -- upvalues: v15 (copy), v3 (ref)
        v15(v3.JUST_PRESSED);
    end, {});
    local v22 = v5.useCallback(function(v21) --[[ Line: 57 ]]
        -- upvalues: v17 (copy), v16 (copy), v12 (copy), v15 (copy), v3 (ref)
        v17(v16:getValue() + v21);
        if v16:getValue() >= v12 then
            v15(v3.HOLDING);
        end;
    end, {
        v16, 
        v12
    });
    local v23 = v5.useCallback(function() --[[ Line: 64 ]]
        -- upvalues: v15 (copy), v3 (ref)
        v15(v3.COMPLETED);
    end, {});
    local v24 = v5.useCallback(function() --[[ Line: 68 ]]
        -- upvalues: v17 (copy), v15 (copy), v3 (ref)
        v17(0);
        v15(v3.NOT_HELD);
    end, {});
    local v25 = v5.useCallback(v4.handleInput({
        hold = {
            durationSeconds = v13, 
            onStep = v22, 
            onComplete = v23
        }, 
        onPress = v20, 
        onRelease = v24
    }), {
        v24, 
        v22, 
        v23, 
        v13
    });
    local v27 = v5.useCallback(function(v26) --[[ Line: 86 ]]
        -- upvalues: v19 (copy), v25 (copy)
        v19(v26.targetInstance);
        v25(v26);
    end, {
        v25
    });
    v11(v18, v25, v24);
    return {
        eventHandler = v27, 
        holdState = v14, 
        holdTime = v16, 
        holdProgress = v16:map(function(v28) --[[ Line: 97 ]]
            -- upvalues: v13 (copy)
            return v28 / v13;
        end), 
        cancelHold = v24
    };
end;