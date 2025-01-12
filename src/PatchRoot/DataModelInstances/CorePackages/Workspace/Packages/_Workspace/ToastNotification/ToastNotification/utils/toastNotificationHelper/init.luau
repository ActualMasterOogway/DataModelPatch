local l_UserInputService_0 = game:GetService("UserInputService");
local l_GuiService_0 = game:GetService("GuiService");
local l_Parent_0 = script.Parent.Parent;
local v3 = require(l_Parent_0.type);
local v4 = require(l_Parent_0.constants);
local v5 = require(l_Parent_0.dependencies);
local v6 = require(l_Parent_0.Logger);
local l_Cryo_0 = v5.Cryo;
local l_TimeTrigger_0 = v5.ToastNotificationProtocolEnums.TimeTrigger;
local l_Logging_0 = v5.Logging;
local l_GetFFlagEnableToastReduceMotionSupport_0 = v5.SharedFlags.GetFFlagEnableToastReduceMotionSupport;
local l_FFlagToastNotificationEnableNewLogger_0 = v5.SharedFlags.FFlagToastNotificationEnableNewLogger;
local function v13(v12) --[[ Line: 25 ]]
    -- upvalues: v3 (copy)
    if v12.X > v12.Y then
        return v3.DeviceOrientationEnum.Landscape;
    else
        return v3.DeviceOrientationEnum.Portrait;
    end;
end;
local function v16(v14, v15) --[[ Line: 31 ]]
    -- upvalues: v4 (copy)
    if v15 < v4.FullWidthDeviceThreshold then
        return UDim2.new(0, v15 - 24, 0, 0);
    elseif v14 then
        if v15 < v4.CompactCardThreashold then
            return UDim2.new(0, v4.InExperienceToastWidth, 0, 0);
        else
            return UDim2.new(0, v4.InAppToastWidth, 0, 0);
        end;
    else
        return UDim2.new(0, v4.InAppToastWidth, 0, 0);
    end;
end;
local function _(v17, v18) --[[ Line: 45 ]]
    if v17 then
        table.insert(v17, v18);
        return v17;
    else
        return {
            v18
        };
    end;
end;
local function _(v20) --[[ Line: 57 ]]
    if v20.button ~= nil then
        return "button";
    elseif v20.textBody ~= nil then
        return "textBody";
    elseif v20.thumbnail ~= nil then
        return "thumbnail";
    elseif v20.metaAction ~= nil then
        return "metaAction";
    elseif v20.singleMetaAction ~= nil then
        return "singleMetaAction";
    else
        return "unknown";
    end;
end;
local function v30(v22) --[[ Line: 72 ]]
    if v22 then
        local v23 = {
            button = nil, 
            textBody = nil, 
            thumbnail = nil, 
            metaAction = nil, 
            singleMetaAction = nil
        };
        for _, v25 in ipairs(v22.visualItems) do
            local v26 = v25.button ~= nil and "button" or v25.textBody ~= nil and "textBody" or v25.thumbnail ~= nil and "thumbnail" or v25.metaAction ~= nil and "metaAction" or v25.singleMetaAction ~= nil and "singleMetaAction" or "unknown";
            if v26 ~= "unknown" then
                local v27 = v23[v26];
                local v28 = v25[v26];
                local v29;
                if v27 then
                    table.insert(v27, v28);
                    v29 = v27;
                else
                    v29 = {
                        v28
                    };
                end;
                v23[v26] = v29;
            end;
        end;
        return {
            layoutKey = v22.layoutKey, 
            name = v22.name, 
            timeOnScreenMs = v22.timeOnScreenMs, 
            visualItems = v23
        };
    else
        return nil;
    end;
end;
local function v33(v31) --[[ Line: 99 ]]
    -- upvalues: v30 (copy)
    local v32 = {
        currentState = v31.content.currentState, 
        notificationType = v31.content.notificationType, 
        id = v31.content.id, 
        priority = v31.content.priority, 
        clientEventsPayload = v31.content.clientEventsPayload, 
        deliverTimestamp = v31.deliverTimestamp, 
        notificationReceivedTimestampMs = v31.notificationReceivedTimestampMs, 
        timers = v31.content.timers, 
        luaNotifInfo = v31.luaNotifInfo
    };
    if v31.content.states then
        v32.state = v30(v31.content.states[v31.content.currentState]);
    end;
    return v32;
end;
local function v35(v34) --[[ Line: 122 ]]
    -- upvalues: v3 (copy)
    if v34 == v3.DeviceOrientationEnum.Landscape then
        return true;
    else
        return false;
    end;
end;
local v36 = {
    positionX = 1, 
    positionXOffset = -20, 
    positionY = 0, 
    anchorX = 1, 
    anchorY = 0
};
local v37 = {
    positionX = 1, 
    positionXOffset = 20, 
    positionY = 0, 
    anchorX = 0, 
    anchorY = 0
};
local v38 = {
    positionX = 0.5, 
    positionXOffset = 0, 
    positionY = 0, 
    anchorX = 0.5, 
    anchorY = 0
};
local v39 = {
    positionX = 0.5, 
    positionXOffset = 0, 
    positionY = 0, 
    anchorX = 0.5, 
    anchorY = 1
};
return {
    calculateToastPosition = function(v40, v41, v42, v43) --[[ Line: 158 ]]
        -- upvalues: l_GuiService_0 (copy), l_GetFFlagEnableToastReduceMotionSupport_0 (copy), l_Cryo_0 (copy), v36 (copy), v38 (copy), v37 (copy), v39 (copy)
        local v44 = if l_GuiService_0 then l_GuiService_0:GetGuiInset() else Vector2.new(0, 0);
        local v45 = if l_GuiService_0 then v44.Y + 20 else 60;
        if v40 then
            if v41 then
                if l_GetFFlagEnableToastReduceMotionSupport_0() then
                    return l_Cryo_0.Dictionary.union(v36, {
                        positionYOffset = v42 + v44.Y
                    });
                else
                    return {
                        positionX = 1, 
                        positionXOffset = -20, 
                        positionY = 0, 
                        positionYOffset = v42 + v44.Y, 
                        anchorX = 1, 
                        anchorY = 0
                    };
                end;
            elseif l_GetFFlagEnableToastReduceMotionSupport_0() then
                return l_Cryo_0.Dictionary.union(v38, {
                    positionYOffset = v42 + v44.Y
                });
            else
                return {
                    positionX = 0.5, 
                    positionXOffset = 0, 
                    positionY = 0, 
                    positionYOffset = v42 + v44.Y, 
                    anchorX = 0.5, 
                    anchorY = 0
                };
            end;
        elseif v41 then
            if l_GetFFlagEnableToastReduceMotionSupport_0() then
                if v43 then
                    return l_Cryo_0.Dictionary.union(v36, {
                        positionYOffset = v42 + v44.Y
                    });
                else
                    return l_Cryo_0.Dictionary.union(v37, {
                        positionYOffset = v42 + v44.Y
                    });
                end;
            else
                return {
                    positionX = 1, 
                    positionXOffset = 20, 
                    positionY = 0, 
                    positionYOffset = v42 + v44.Y, 
                    anchorX = 0, 
                    anchorY = 0
                };
            end;
        elseif l_GetFFlagEnableToastReduceMotionSupport_0() then
            if v43 then
                return l_Cryo_0.Dictionary.union(v38, {
                    positionYOffset = v42 + v44.Y
                });
            else
                return l_Cryo_0.Dictionary.union(v39, {
                    positionYOffset = -1 * v45
                });
            end;
        else
            return {
                positionX = 0.5, 
                positionXOffset = 0, 
                positionY = 0, 
                positionYOffset = -1 * v45, 
                anchorX = 0.5, 
                anchorY = 1
            };
        end;
    end, 
    calculateTimeRemaining = function(v46, v47, v48) --[[ Line: 306 ]] --[[ Name: calculateTimeRemaining ]]
        -- upvalues: l_TimeTrigger_0 (copy)
        v47 = v47 or DateTime.now().UnixTimestampMillis;
        v48 = v48 or DateTime.now().UnixTimestampMillis;
        local v49 = 0;
        if v46.trigger == l_TimeTrigger_0.OnReceive then
            v49 = v46.timespanMs - (DateTime.now().UnixTimestampMillis - v47);
        elseif v46.trigger == l_TimeTrigger_0.OnDisplay then
            v49 = v46.timespanMs - (DateTime.now().UnixTimestampMillis - v48);
        end;
        return (math.max(v49, 0));
    end, 
    getDeviceOrientation = v13, 
    getNotificationSize = v16, 
    marshalNotificationData = v33, 
    isToastToRight = v35, 
    isDesktopDevice = function() --[[ Line: 256 ]]
        -- upvalues: l_UserInputService_0 (copy)
        local l_None_0 = Enum.Platform.None;
        pcall(function() --[[ Line: 258 ]]
            -- upvalues: l_None_0 (ref), l_UserInputService_0 (ref)
            l_None_0 = l_UserInputService_0:GetPlatform();
        end);
        local v51 = true;
        if l_None_0 ~= Enum.Platform.Windows then
            v51 = true;
            if l_None_0 ~= Enum.Platform.OSX then
                v51 = l_None_0 == Enum.Platform.UWP;
            end;
        end;
        return v51;
    end, 
    getNearestWholeNumber = function(v52) --[[ Line: 269 ]] --[[ Name: getNearestWholeNumber ]]
        if v52 % 1 < 0.5 then
            return (math.floor(v52));
        else
            return (math.ceil(v52));
        end;
    end, 
    getTimerFromCardData = function(v53, v54) --[[ Line: 284 ]] --[[ Name: getTimerFromCardData ]]
        -- upvalues: l_FFlagToastNotificationEnableNewLogger_0 (copy), v6 (copy), l_Logging_0 (copy), l_TimeTrigger_0 (copy)
        if v53 and v53.timers and v53.timers[v54] then
            return v53.timers[v54];
        else
            if l_FFlagToastNotificationEnableNewLogger_0 then
                v6:warning("timerKey {} not found in list of timers. Using default.", v54);
            else
                l_Logging_0.warn(string.format("timerKey %s not found in list of timers. Using default.", v54));
            end;
            return {
                timespanMs = 0, 
                trigger = l_TimeTrigger_0.OnDisplay
            };
        end;
    end, 
    fireEvent = function(v55, v56) --[[ Line: 250 ]]
        v55.sendEventDeferred("ToastNotification", "toastNotificationClientEvent", v56);
    end
};