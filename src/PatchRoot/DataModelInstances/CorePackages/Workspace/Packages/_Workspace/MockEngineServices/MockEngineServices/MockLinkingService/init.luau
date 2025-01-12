local v0 = {};
v0.__index = v0;
v0.new = function(_) --[[ Line: 4 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    local v27 = {
        OnLuaUrl = {
            CallCallbacksWith = function(v2, v3, v4, v5) --[[ Line: 7 ]] --[[ Name: CallCallbacksWith ]]
                for _, v7 in v2.callbacks do
                    v7(v3, v4, v5);
                end;
            end, 
            callbacks = {}, 
            Connect = function(v8, v9) --[[ Line: 13 ]] --[[ Name: Connect ]]
                local l_callbacks_0 = v8.callbacks;
                table.insert(l_callbacks_0, v9);
                return {
                    Disconnect = function() --[[ Line: 17 ]] --[[ Name: Disconnect ]]
                        -- upvalues: l_callbacks_0 (copy), v9 (copy)
                        for v11, v12 in l_callbacks_0 do
                            if v12 == v9 then
                                table.remove(l_callbacks_0, v11);
                            end;
                        end;
                    end
                };
            end
        }, 
        emtpyUrlDataForStartDelivery = false, 
        SetEmptyUrlDataForStartDelivery = function(v13, v14) --[[ Line: 28 ]] --[[ Name: SetEmptyUrlDataForStartDelivery ]]
            v13.emtpyUrlDataForStartDelivery = v14;
        end, 
        StartLuaUrlDelivery = function(v15) --[[ Line: 31 ]] --[[ Name: StartLuaUrlDelivery ]]
            if v15.emtpyUrlDataForStartDelivery then
                return {};
            else
                return nil;
            end;
        end, 
        StopLuaUrlDelivery = function(_) --[[ Line: 38 ]] --[[ Name: StopLuaUrlDelivery ]]

        end, 
        OpenUrl = function(_, _) --[[ Line: 39 ]] --[[ Name: OpenUrl ]]
            return true;
        end, 
        IsUrlRegistered = function(_, _) --[[ Line: 42 ]] --[[ Name: IsUrlRegistered ]]
            return true;
        end, 
        lastLuaUrl = nil, 
        GetLastLuaUrl = function(v21) --[[ Line: 46 ]] --[[ Name: GetLastLuaUrl ]]
            return v21.lastLuaUrl;
        end, 
        SetLastLuaUrl = function(v22, v23) --[[ Line: 49 ]] --[[ Name: SetLastLuaUrl ]]
            v22.lastLuaUrl = v23;
        end, 
        switchedToSettingsApp = false, 
        settingsAppRoute = nil, 
        SwitchToSettingsApp = function(v24, v25) --[[ Line: 54 ]] --[[ Name: SwitchToSettingsApp ]]
            v24.switchedToSettingsApp = true;
            v24.settingsAppRoute = v25;
        end, 
        SupportsSwitchToSettingsApp = function(_) --[[ Line: 58 ]] --[[ Name: SupportsSwitchToSettingsApp ]]
            return true;
        end
    };
    setmetatable(v27, {
        __index = v0
    });
    return v27;
end;
return v0;