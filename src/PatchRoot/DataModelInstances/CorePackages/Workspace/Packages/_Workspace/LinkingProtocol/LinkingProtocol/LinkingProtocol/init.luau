local l_Parent_0 = script.Parent.Parent;
local l_MessageBusService_0 = game:GetService("MessageBusService");
local l_MessageBus_0 = require(l_Parent_0.MessageBus).MessageBus;
local v3 = require(l_Parent_0.Promise);
local v4 = require(l_Parent_0.t);
local v5 = require(script.Parent.Flags.getOpenURLUseRequestResponse);
local v6 = require(script.Parent.Flags.getFFlagEnableToSwitchToSettingsAppWithRouteLua);
local _ = require(script.Parent.LinkingProtocolTypes);
local _ = require(script.Parent.Enums.SettingsRoute);
local v9 = require(script.Parent.Flags.getFFlagUseLinkingService);
local v10 = nil;
if v9() then
    v10 = require(l_Parent_0.MockableProxyServices).LinkingService;
end;
game:DefineFastFlag("CheckNilUrlWhenStartListening", false);
local v11 = v4.strictInterface({
    url = v4.string
});
local v12 = {
    REGISTER_URL_DESCRIPTOR = {
        mid = l_MessageBus_0.getMessageId("Linking", "registerURL"), 
        validateParams = v4.strictInterface({
            url = v4.string, 
            domain = v4.literal("Lua")
        })
    }, 
    DETECT_URL_DESCRIPTOR = {
        mid = l_MessageBus_0.getMessageId("Linking", "detectURL"), 
        validateParams = v11
    }, 
    HANDLE_LUA_URL_DESCRIPTOR = {
        mid = l_MessageBus_0.getMessageId("Linking", "handleLuaURL"), 
        validateParams = v4.strictInterface({
            matchedUrl = v4.string, 
            url = v4.string, 
            attributionUrl = v4.optional(v4.string)
        })
    }, 
    OPEN_URL_REQUEST_DESCRIPTOR = {
        mid = l_MessageBus_0.getMessageId("Linking", "openURLRequest"), 
        validateParams = v11
    }, 
    OPEN_URL_RESPONSE_DESCRIPTOR = {
        mid = l_MessageBus_0.getMessageId("Linking", "openURLResponse"), 
        validateParams = v4.strictInterface({
            success = v4.boolean
        })
    }, 
    IS_URL_REGISTERED_REQUEST_DESCRIPTOR = {
        mid = l_MessageBus_0.getMessageId("Linking", "isURLRegisteredRequest"), 
        validateParams = v11
    }, 
    IS_URL_REGISTERED_RESPONSE_DESCRIPTOR = {
        mid = l_MessageBus_0.getMessageId("Linking", "isURLRegisteredResponse"), 
        validateParams = v4.strictInterface({
            isRegistered = v4.boolean
        })
    }, 
    SWITCH_TO_SETTINGS_APP_METHOD_REQUEST_DESCRIPTOR = {
        protocolName = "Linking", 
        methodName = "switchToSettingsApp", 
        validateParams = v4.table
    }, 
    SWITCH_TO_SETTINGS_APP_METHOD_RESPONSE_DESCRIPTOR = {
        protocolName = "Linking", 
        methodName = "switchToSettingsApp", 
        validateParams = v4.table
    }, 
    SUPPORTS_SWITCH_TO_SETTINGS_APP_METHOD_REQUEST_DESCRIPTOR = {
        protocolName = "Linking", 
        methodName = "supportsSwitchToSettingsApp", 
        validateParams = v4.table
    }, 
    SUPPORTS_SWITCH_TO_SETTINGS_APP_METHOD_RESPONSE_DESCRIPTOR = {
        protocolName = "Linking", 
        methodName = "supportsSwitchToSettingsApp", 
        validateParams = v4.table
    }
};
v12.__index = v12;
v12.new = function() --[[ Line: 108 ]] --[[ Name: new ]]
    -- upvalues: v10 (ref), l_MessageBus_0 (copy), v12 (copy)
    return (setmetatable({
        subscriber = if v10 == nil then l_MessageBus_0.Subscriber.new() else nil, 
        isListeningForURLs = false, 
        urlConnection = nil
    }, v12));
end;
v12.registerURL = function(v13, v14) --[[ Line: 124 ]] --[[ Name: registerURL ]]
    -- upvalues: v10 (ref), l_MessageBus_0 (copy)
    if v10 then
        v10:RegisterLuaUrl(v14);
        return;
    else
        l_MessageBus_0.publish(v13.REGISTER_URL_DESCRIPTOR, {
            url = v14, 
            domain = "Lua"
        });
        return;
    end;
end;
v12.getUID = function(_) --[[ Line: 146 ]] --[[ Name: getUID ]]
    -- upvalues: v3 (copy), l_MessageBusService_0 (copy)
    if not game:GetEngineFeature("EnableAppflyerUIDReporting") then
        return v3.resolve("");
    else
        return v3.new(function(v16, _) --[[ Line: 151 ]]
            -- upvalues: l_MessageBusService_0 (ref)
            l_MessageBusService_0:MakeRequest("Linking", "getUID", {}, function(v18) --[[ Line: 152 ]]
                -- upvalues: v16 (copy)
                v16(v18.uid);
            end, {});
        end);
    end;
end;
v12.detectURL = function(v19, v20) --[[ Line: 165 ]] --[[ Name: detectURL ]]
    -- upvalues: v10 (ref), l_MessageBus_0 (copy)
    if v10 then
        v10:DetectUrl(v20);
        return;
    else
        l_MessageBus_0.publish(v19.DETECT_URL_DESCRIPTOR, {
            url = v20
        });
        return;
    end;
end;
v12.getLastLuaURL = function(v21) --[[ Line: 181 ]] --[[ Name: getLastLuaURL ]]
    -- upvalues: v10 (ref), l_MessageBus_0 (copy)
    if v10 then
        return v10:GetLastLuaUrl();
    else
        local v22 = l_MessageBus_0.getLast(v21.HANDLE_LUA_URL_DESCRIPTOR);
        if v22 ~= nil then
            return v22.url;
        else
            return nil;
        end;
    end;
end;
v12.listenForLuaURLs = function(v23, v24, v25) --[[ Line: 198 ]] --[[ Name: listenForLuaURLs ]]
    -- upvalues: v10 (ref)
    if v10 then
        if game:GetFastFlag("CheckNilUrlWhenStartListening") and v23.isListeningForURLs then
            v23:stopListeningForLuaURLs();
        end;
        v23.urlConnection = v10.OnLuaUrl:Connect(function(v26, _, v28) --[[ Line: 203 ]]
            -- upvalues: v24 (copy)
            v24(v26, v28);
        end);
        v23.isListeningForURLs = true;
        local v29 = v10:StartLuaUrlDelivery();
        if game:GetFastFlag("CheckNilUrlWhenStartListening") then
            if v29 and v29.url then
                v24(v29.url, v29.attributionUrl);
                return;
            end;
        elseif v29 then
            v24(v29.url, v29.attributionUrl);
            return;
        end;
    else
        if v23.isListeningForURLs then
            v23:stopListeningForLuaURLs();
        end;
        v23.subscriber:subscribe(v23.HANDLE_LUA_URL_DESCRIPTOR, function(v30) --[[ Line: 223 ]]
            -- upvalues: v24 (copy)
            v24(v30.url, v30.attributionUrl);
        end, v25);
        v23.isListeningForURLs = true;
    end;
end;
v12.stopListeningForLuaURLs = function(v31) --[[ Line: 237 ]] --[[ Name: stopListeningForLuaURLs ]]
    -- upvalues: v10 (ref)
    if v10 then
        if v31.isListeningForURLs then
            if game:GetFastFlag("CheckNilUrlWhenStartListening") then
                v31.urlConnection:Disconnect();
            end;
            v10:StopLuaUrlDelivery();
            v31.isListeningForURLs = false;
            return;
        end;
    elseif v31.isListeningForURLs then
        v31.subscriber:unsubscribe(v31.HANDLE_LUA_URL_DESCRIPTOR);
        v31.isListeningForURLs = false;
    end;
end;
v12.openURL = function(v32, v33) --[[ Line: 270 ]] --[[ Name: openURL ]]
    -- upvalues: v10 (ref), v3 (copy), v5 (copy), l_MessageBusService_0 (copy), l_MessageBus_0 (copy)
    local v34 = nil;
    if v10 then
        return (v3.new(function(v35, _) --[[ Line: 273 ]]
            -- upvalues: v10 (ref), v33 (copy)
            v35(v10:OpenUrl(v33));
        end));
    elseif v5() then
        return (v3.new(function(v37, _) --[[ Line: 278 ]]
            -- upvalues: l_MessageBusService_0 (ref), v33 (copy)
            l_MessageBusService_0:MakeRequest("Linking", "openURL", {
                url = v33
            }, function(v39) --[[ Line: 283 ]]
                -- upvalues: v37 (copy)
                v37(v39.success);
            end, {});
        end));
    else
        v34 = v3.new(function(v40, _) --[[ Line: 290 ]]
            -- upvalues: v32 (copy)
            local l_OPEN_URL_RESPONSE_DESCRIPTOR_0 = v32.OPEN_URL_RESPONSE_DESCRIPTOR;
            v32.subscriber:subscribe(l_OPEN_URL_RESPONSE_DESCRIPTOR_0, function(v43) --[[ Line: 292 ]]
                -- upvalues: v32 (ref), l_OPEN_URL_RESPONSE_DESCRIPTOR_0 (copy), v40 (copy)
                v32.subscriber:unsubscribe(l_OPEN_URL_RESPONSE_DESCRIPTOR_0);
                v40(v43.success);
            end);
        end);
        l_MessageBus_0.publish(v32.OPEN_URL_REQUEST_DESCRIPTOR, {
            url = v33
        });
        return v34;
    end;
end;
v12.isURLRegistered = function(v44, v45) --[[ Line: 325 ]] --[[ Name: isURLRegistered ]]
    -- upvalues: v10 (ref), v3 (copy), l_MessageBus_0 (copy)
    local v46 = nil;
    if v10 then
        return (v3.new(function(v47, _) --[[ Line: 328 ]]
            -- upvalues: v10 (ref), v45 (copy)
            v47(v10:IsUrlRegistered(v45));
        end));
    else
        v46 = v3.new(function(v49, _) --[[ Line: 332 ]]
            -- upvalues: v44 (copy)
            local l_IS_URL_REGISTERED_RESPONSE_DESCRIPTOR_0 = v44.IS_URL_REGISTERED_RESPONSE_DESCRIPTOR;
            v44.subscriber:subscribe(l_IS_URL_REGISTERED_RESPONSE_DESCRIPTOR_0, function(v52) --[[ Line: 334 ]]
                -- upvalues: v44 (ref), l_IS_URL_REGISTERED_RESPONSE_DESCRIPTOR_0 (copy), v49 (copy)
                v44.subscriber:unsubscribe(l_IS_URL_REGISTERED_RESPONSE_DESCRIPTOR_0);
                v49(v52.isRegistered);
            end);
        end);
        l_MessageBus_0.publish(v44.IS_URL_REGISTERED_REQUEST_DESCRIPTOR, {
            url = v45
        });
        return v46;
    end;
end;
v12.getAndClearLastPendingURL = function(_) --[[ Line: 356 ]] --[[ Name: getAndClearLastPendingURL ]]
    -- upvalues: v3 (copy), v10 (ref), l_MessageBusService_0 (copy)
    if not game:GetEngineFeature("LinkingProtocolGetLastPendingUrlEnabled") then
        return v3.resolve({
            hasPendingUrl = false
        });
    elseif v10 then
        return v3.new(function(v54, _) --[[ Line: 364 ]]
            -- upvalues: v10 (ref)
            v54(v10:GetAndClearLastPendingUrl());
        end);
    else
        return v3.new(function(v56, _) --[[ Line: 368 ]]
            -- upvalues: l_MessageBusService_0 (ref)
            l_MessageBusService_0:MakeRequest("Linking", "getAndClearLastPendingURL", {}, function(v58) --[[ Line: 369 ]]
                -- upvalues: v56 (copy)
                v56(v58);
            end, {});
        end);
    end;
end;
v12.switchToSettingsApp = function(_, v60) --[[ Line: 382 ]] --[[ Name: switchToSettingsApp ]]
    -- upvalues: v6 (copy), v10 (ref), v3 (copy), l_MessageBusService_0 (copy)
    local _ = nil;
    local v62 = if v6() then v60 else nil;
    if v10 then
        return (v3.new(function(v63, _) --[[ Line: 386 ]]
            -- upvalues: v10 (ref), v62 (copy)
            v63(v10:SwitchToSettingsApp(v62));
        end));
    else
        return (v3.new(function(v65, _) --[[ Line: 390 ]]
            -- upvalues: l_MessageBusService_0 (ref), v62 (copy)
            l_MessageBusService_0:MakeRequest("Linking", "switchToSettingsApp", {
                includeStatus = false, 
                route = v62
            }, function(_) --[[ Line: 394 ]]
                -- upvalues: v65 (copy)
                v65();
            end, {});
        end));
    end;
end;
v12.supportsSwitchToSettingsApp = function(_, v69) --[[ Line: 409 ]] --[[ Name: supportsSwitchToSettingsApp ]]
    -- upvalues: v10 (ref), v3 (copy), l_MessageBusService_0 (copy), v6 (copy)
    local _ = nil;
    if v10 then
        return (v3.new(function(v71, _) --[[ Line: 412 ]]
            -- upvalues: v10 (ref)
            v71(v10:SupportsSwitchToSettingsApp());
        end));
    else
        return (v3.new(function(v73, _) --[[ Line: 416 ]]
            -- upvalues: l_MessageBusService_0 (ref), v6 (ref), v69 (copy)
            l_MessageBusService_0:MakeRequest("Linking", "supportsSwitchToSettingsApp", {
                includeStatus = false, 
                route = if v6() then v69 else nil
            }, function(v75) --[[ Line: 420 ]]
                -- upvalues: v73 (copy)
                v73(v75.support);
            end, {});
        end));
    end;
end;
v12.default = v12.new();
return v12;