local v0 = {};
v0.__index = v0;
v0.GetPropertyChangedSignal = function(v1, v2) --[[ Line: 4 ]] --[[ Name: GetPropertyChangedSignal ]]
    if v2 == "VRDeviceAvailable" then
        return v1._vrDeviceAvailableChanged.Event;
    else
        error(("%s is not a valid property name"):format((tostring(v2))));
        return;
    end;
end;
v0.toggleHeadsetConnectionState = function(v3) --[[ Line: 11 ]] --[[ Name: toggleHeadsetConnectionState ]]
    local v4 = not v3.VRDeviceAvailable;
    v3.VRDeviceAvailable = v4;
    v3._vrDeviceAvailableChanged:Fire(v4);
end;
v0.new = function() --[[ Line: 18 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    local v5 = {
        VRDeviceAvailable = true, 
        _vrDeviceAvailableChanged = Instance.new("BindableEvent")
    };
    setmetatable(v5, {
        __index = v0
    });
    return v5;
end;
return v0;