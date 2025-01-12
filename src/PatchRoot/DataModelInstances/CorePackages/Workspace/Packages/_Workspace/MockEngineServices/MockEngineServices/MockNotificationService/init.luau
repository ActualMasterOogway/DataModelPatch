local v0 = {};
v0.__index = v0;
v0.ScheduleNotification = function(_, _, _, _) --[[ Line: 8 ]] --[[ Name: ScheduleNotification ]]

end;
v0.CancelNotification = function(_, _) --[[ Line: 10 ]] --[[ Name: CancelNotification ]]

end;
v0.CancelAllNotification = function(_) --[[ Line: 12 ]] --[[ Name: CancelAllNotification ]]

end;
v0.GetScheduledNotifications = function(_) --[[ Line: 14 ]] --[[ Name: GetScheduledNotifications ]]

end;
v0.ActionEnabled = function(_) --[[ Line: 16 ]] --[[ Name: ActionEnabled ]]

end;
v0.ActionTaken = function(_) --[[ Line: 18 ]] --[[ Name: ActionTaken ]]

end;
v0.GetPropertyChangedSignal = function(v11, v12) --[[ Line: 20 ]] --[[ Name: GetPropertyChangedSignal ]]
    if v12 == "SelectedTheme" then
        return v11._selectedThemeChanged.Event;
    else
        error(("%s is not a valid property name"):format((tostring(v12))));
        return;
    end;
end;
v0.new = function() --[[ Line: 27 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    local v13 = {
        SelectedTheme = "", 
        _selectedThemeChanged = Instance.new("BindableEvent")
    };
    setmetatable(v13, v0);
    v13.RobloxEventReceived = {
        BindableEvent = Instance.new("BindableEvent")
    };
    v13.RobloxConnectionChanged = {
        BindableEvent = Instance.new("BindableEvent")
    };
    v13.RobloxEventReceived.Connect = function(_, v15) --[[ Line: 42 ]] --[[ Name: Connect ]]
        -- upvalues: v13 (copy)
        return v13.RobloxEventReceived.BindableEvent.Event:Connect(v15);
    end;
    v13.RobloxEventReceived.Fire = function(_, v17) --[[ Line: 46 ]] --[[ Name: Fire ]]
        -- upvalues: v13 (copy)
        v13.RobloxEventReceived.BindableEvent:Fire(v17);
    end;
    v13.RobloxConnectionChanged.Connect = function(_, v19) --[[ Line: 50 ]] --[[ Name: Connect ]]
        -- upvalues: v13 (copy)
        return v13.RobloxConnectionChanged.BindableEvent.Event:Connect(v19);
    end;
    v13.RobloxConnectionChanged.Fire = function(_, v21, v22, v23, v24) --[[ Line: 54 ]] --[[ Name: Fire ]]
        -- upvalues: v13 (copy)
        v13.RobloxConnectionChanged.BindableEvent:Fire(v21, v22, v23, v24);
    end;
    return v13;
end;
return v0;