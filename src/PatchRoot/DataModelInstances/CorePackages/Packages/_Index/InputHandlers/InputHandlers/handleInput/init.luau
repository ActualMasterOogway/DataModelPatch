local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.FocusNavigation);
local v2 = require(script.Parent.Heartbeat);
local function v6(v3, v4) --[[ Line: 26 ]] --[[ Name: cancellableDelay ]]
    local v5 = false;
    task.delay(v3, function() --[[ Line: 28 ]]
        -- upvalues: v5 (ref), v4 (copy)
        if not v5 then
            v4();
        end;
    end);
    return {
        cancel = function() --[[ Line: 34 ]] --[[ Name: cancel ]]
            -- upvalues: v5 (ref)
            v5 = true;
        end
    };
end;
return function(v7) --[[ Line: 40 ]] --[[ Name: handleInput ]]
    -- upvalues: v6 (copy), v2 (copy)
    local l_hold_0 = v7.hold;
    local v9 = nil;
    local v10 = nil;
    local v11 = false;
    local function _() --[[ Line: 47 ]] --[[ Name: clearHeldState ]]
        -- upvalues: v9 (ref), v10 (ref), v11 (ref)
        if v9 then
            v9.cancel();
            v9 = nil;
        end;
        if v10 then
            v10:Disconnect();
            v10 = nil;
        end;
        v11 = false;
    end;
    return function(v13) --[[ Line: 59 ]]
        -- upvalues: v7 (copy), v9 (ref), v10 (ref), v11 (ref), l_hold_0 (copy), v6 (ref), v2 (ref)
        local v14 = if v13.eventData then v13.eventData.UserInputState else nil;
        if v14 == Enum.UserInputState.Begin then
            if v7.onPress then
                v7.onPress(v13);
            end;
            if v9 then
                v9.cancel();
                v9 = nil;
            end;
            if v10 then
                v10:Disconnect();
                v10 = nil;
            end;
            v11 = false;
            if l_hold_0 then
                v9 = v6(l_hold_0.durationSeconds, function() --[[ Line: 72 ]]
                    -- upvalues: l_hold_0 (ref), v11 (ref), v10 (ref)
                    if not l_hold_0.allowReleaseAfterHold then
                        v11 = false;
                    end;
                    l_hold_0.onComplete();
                    if v10 then
                        v10:Disconnect();
                        v10 = nil;
                    end;
                end);
                v10 = if l_hold_0.onStep then v2:Connect(l_hold_0.onStep) else nil;
            end;
            v11 = true;
        end;
        if v14 == Enum.UserInputState.End then
            if v7.onRelease and v11 then
                v7.onRelease(v13);
            end;
            if v9 then
                v9.cancel();
                v9 = nil;
            end;
            if v10 then
                v10:Disconnect();
                v10 = nil;
            end;
            v11 = false;
        end;
        if v14 == Enum.UserInputState.Cancel then
            if v9 then
                v9.cancel();
                v9 = nil;
            end;
            if v10 then
                v10:Disconnect();
                v10 = nil;
            end;
            v11 = false;
        end;
    end;
end;