local v0 = {};
v0.__index = v0;
v0.new = function() --[[ Line: 4 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    local l_BindableEvent_0 = Instance.new("BindableEvent");
    local v5 = {
        broadcasts = {}, 
        ShowLeaveConfirmation = {
            Connect = function(_, v3) --[[ Line: 10 ]] --[[ Name: Connect ]]
                -- upvalues: l_BindableEvent_0 (copy)
                return l_BindableEvent_0.Event:Connect(v3);
            end, 
            Fire = function(_, ...) --[[ Line: 13 ]] --[[ Name: Fire ]]
                -- upvalues: l_BindableEvent_0 (copy)
                l_BindableEvent_0:Fire(...);
            end
        }
    };
    setmetatable(v5, {
        __index = v0
    });
    return v5;
end;
v0.BroadcastNotification = function(v6, v7, v8) --[[ Line: 24 ]] --[[ Name: BroadcastNotification ]]
    v6.broadcasts[#v6.broadcasts + 1] = {
        data = v7, 
        notification = v8
    };
end;
v0.SetGlobalGuiInset = function(_, _, _, _, _) --[[ Line: 31 ]] --[[ Name: SetGlobalGuiInset ]]

end;
v0.SafeZoneOffsetsChanged = function(_) --[[ Line: 33 ]] --[[ Name: SafeZoneOffsetsChanged ]]

end;
return v0;