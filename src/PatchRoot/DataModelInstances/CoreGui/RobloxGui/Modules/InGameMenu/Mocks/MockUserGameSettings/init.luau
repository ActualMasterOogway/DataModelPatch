local v0 = {};
v0.__index = v0;
v0.new = function() --[[ Line: 8 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    local l_BindableEvent_0 = Instance.new("BindableEvent");
    local v4 = {
        FullscreenChanged = {
            Connect = function(_, v3) --[[ Line: 13 ]] --[[ Name: Connect ]]
                -- upvalues: l_BindableEvent_0 (copy)
                return l_BindableEvent_0.Event:Connect(v3);
            end, 
            GoFullscreen = function() --[[ Line: 16 ]] --[[ Name: GoFullscreen ]]
                -- upvalues: l_BindableEvent_0 (copy)
                l_BindableEvent_0:Fire(true);
            end
        }
    };
    setmetatable(v4, {
        __index = v0
    });
    return v4;
end;
v0.InFullScreen = function(_) --[[ Line: 28 ]] --[[ Name: InFullScreen ]]
    return false;
end;
return v0;