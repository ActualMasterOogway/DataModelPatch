local l_Parent_0 = script.Parent.Parent;
local l_MessageBus_0 = require(l_Parent_0.MessageBus).MessageBus;
local v2 = require(l_Parent_0.Promise);
local v3 = require(l_Parent_0.t);
local v4 = require(script.Parent.Flags.getFFlagLuaPermissionContactAccess);
local l_GetFFlagLuaEnableShowUpsellMethod_0 = require(l_Parent_0.SharedFlags).GetFFlagLuaEnableShowUpsellMethod;
local _ = require(script.Parent.PermissionsProtocolTypes);
game:DefineFastFlag("DebugRomarkAudioPermissionsBypass", false);
local v7 = {
    CAMERA_ACCESS = "CAMERA_ACCESS", 
    MICROPHONE_ACCESS = "MICROPHONE_ACCESS", 
    LOCAL_NETWORK = "LOCAL_NETWORK", 
    CONTACTS_ACCESS = "CONTACTS_ACCESS", 
    WRITE_MEDIA_STORAGE = "WRITE_MEDIA_STORAGE", 
    POST_NOTIFICATIONS = "POST_NOTIFICATIONS"
};
local v8 = {
    AUTHORIZED = "AUTHORIZED", 
    DENIED = "DENIED", 
    RESTRICTED = "RESTRICTED", 
    UNSUPPORTED = "UNSUPPORTED"
};
local v9 = {
    SHOW = "SHOW", 
    HIDE = "HIDE", 
    UNSUPPORTED = "UNSUPPORTED"
};
local v10 = v3.array(v3.valueOf(v7));
local v11 = v3.valueOf(v8);
local v12 = v3.valueOf(v9);
local v13 = {
    Permissions = v7, 
    Status = v8, 
    UpsellStatus = v9, 
    PERMISSION_REQUEST_PROTOCOL_METHOD_REQUEST_DESCRIPTOR = {
        protocolName = "PermissionsProtocol", 
        methodName = "PermissionsRequest", 
        validateParams = v3.strictInterface({
            permissions = v10
        })
    }, 
    PERMISSION_REQUEST_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR = {
        protocolName = "PermissionsProtocol", 
        methodName = "PermissionsRequest", 
        validateParams = v3.strictInterface({
            status = v11, 
            missingPermissions = v10
        })
    }, 
    HAS_PERMISSIONS_PROTOCOL_METHOD_REQUEST_DESCRIPTOR = {
        protocolName = "PermissionsProtocol", 
        methodName = "HasPermissions", 
        validateParams = v3.strictInterface({
            permissions = v10
        })
    }, 
    HAS_PERMISSIONS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR = {
        protocolName = "PermissionsProtocol", 
        methodName = "HasPermissions", 
        validateParams = v3.strictInterface({
            status = v11, 
            missingPermissions = v10
        })
    }, 
    SUPPORTS_PERMISSIONS_PROTOCOL_METHOD_REQUEST_DESCRIPTOR = {
        protocolName = "PermissionsProtocol", 
        methodName = "SupportsPermissions", 
        validateParams = v3.strictInterface({
            includeStatus = v3.literal(false)
        })
    }, 
    SUPPORTS_PERMISSIONS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR = {
        protocolName = "PermissionsProtocol", 
        methodName = "SupportsPermissions", 
        validateParams = v3.strictInterface({
            permissions = v10
        })
    }, 
    SHOULD_SHOW_PERMISSION_UPSELL_PROTOCOL_METHOD_REQUEST_DESCRIPTOR = {
        protocolName = "PermissionsProtocol", 
        methodName = "ShouldShowPermissionUpsell", 
        validateParams = v3.strictInterface({
            permissions = v10
        })
    }, 
    SHOULD_SHOW_PERMISSION_UPSELL_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR = {
        protocolName = "PermissionsProtocol", 
        methodName = "ShouldShowPermissionUpsell", 
        validateParams = v3.strictInterface({
            hiddenUpsellPermissions = v10, 
            upsellStatus = v12
        })
    }
};
v13.__index = v13;
local function v18(v14) --[[ Line: 126 ]] --[[ Name: getPermissionRequestTelemetryData ]]
    -- upvalues: v13 (copy), v4 (copy)
    local v15 = {};
    for _, v17 in pairs(v14) do
        if v17 == v13.Permissions.CAMERA_ACCESS then
            v15.camera_access_requested = "";
        end;
        if v17 == v13.Permissions.MICROPHONE_ACCESS then
            v15.microphone_access_requested = "";
        end;
        if v17 == v13.Permissions.LOCAL_NETWORK then
            v15.local_network_requested = "";
        end;
        if v17 == v13.Permissions.CONTACTS_ACCESS and v4() then
            v15.contacts_access_requested = "";
        end;
    end;
    return v15;
end;
v13.new = function() --[[ Line: 145 ]] --[[ Name: new ]]
    -- upvalues: l_MessageBus_0 (copy), v13 (copy)
    return (setmetatable({
        subscriber = l_MessageBus_0.Subscriber.new()
    }, v13));
end;
v13.hasPermissions = function(v19, v20) --[[ Line: 162 ]] --[[ Name: hasPermissions ]]
    -- upvalues: v2 (copy), l_MessageBus_0 (copy), v18 (copy)
    local v25 = v2.new(function(v21, _) --[[ Line: 163 ]]
        -- upvalues: v19 (copy)
        local l_HAS_PERMISSIONS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR_0 = v19.HAS_PERMISSIONS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR;
        v19.subscriber:subscribeProtocolMethodResponse(l_HAS_PERMISSIONS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR_0, function(v24) --[[ Line: 165 ]]
            -- upvalues: v19 (ref), l_HAS_PERMISSIONS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR_0 (copy), v21 (copy)
            v19.subscriber:unsubscribeToProtocolMethodResponse(l_HAS_PERMISSIONS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR_0);
            v21(v24);
        end);
    end);
    l_MessageBus_0.publishProtocolMethodRequest(v19.HAS_PERMISSIONS_PROTOCOL_METHOD_REQUEST_DESCRIPTOR, {
        permissions = v20
    }, (v18(v20)));
    return v25;
end;
v13.requestPermissions = function(v26, v27) --[[ Line: 185 ]] --[[ Name: requestPermissions ]]
    -- upvalues: v13 (copy), v2 (copy), l_MessageBus_0 (copy), v18 (copy)
    if game:GetFastFlag("DebugRomarkAudioPermissionsBypass") then
        local v28 = {
            missingPermissions = {}, 
            status = v13.Status.AUTHORIZED
        };
        return v2.resolve(v28);
    else
        local v33 = v2.new(function(v29, _) --[[ Line: 194 ]]
            -- upvalues: v26 (copy)
            local l_PERMISSION_REQUEST_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR_0 = v26.PERMISSION_REQUEST_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR;
            v26.subscriber:subscribeProtocolMethodResponse(l_PERMISSION_REQUEST_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR_0, function(v32) --[[ Line: 196 ]]
                -- upvalues: v26 (ref), l_PERMISSION_REQUEST_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR_0 (copy), v29 (copy)
                v26.subscriber:unsubscribeToProtocolMethodResponse(l_PERMISSION_REQUEST_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR_0);
                v29(v32);
            end);
        end);
        l_MessageBus_0.publishProtocolMethodRequest(v26.PERMISSION_REQUEST_PROTOCOL_METHOD_REQUEST_DESCRIPTOR, {
            permissions = v27
        }, (v18(v27)));
        return v33;
    end;
end;
v13.getSupportedPermissionsList = function(v34) --[[ Line: 214 ]] --[[ Name: getSupportedPermissionsList ]]
    -- upvalues: v2 (copy), l_MessageBus_0 (copy)
    local v39 = v2.new(function(v35, _) --[[ Line: 215 ]]
        -- upvalues: v34 (copy)
        local l_SUPPORTS_PERMISSIONS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR_0 = v34.SUPPORTS_PERMISSIONS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR;
        v34.subscriber:subscribeProtocolMethodResponse(l_SUPPORTS_PERMISSIONS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR_0, function(v38) --[[ Line: 217 ]]
            -- upvalues: v34 (ref), l_SUPPORTS_PERMISSIONS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR_0 (copy), v35 (copy)
            v34.subscriber:unsubscribeToProtocolMethodResponse(l_SUPPORTS_PERMISSIONS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR_0);
            v35(v38);
        end);
    end);
    l_MessageBus_0.publishProtocolMethodRequest(v34.SUPPORTS_PERMISSIONS_PROTOCOL_METHOD_REQUEST_DESCRIPTOR, {
        includeStatus = false
    }, {});
    return v39;
end;
v13.supportsPermissions = function(v40, v41) --[[ Line: 236 ]] --[[ Name: supportsPermissions ]]
    -- upvalues: v10 (copy), v2 (copy)
    assert(v10(v41));
    return (v40:getSupportedPermissionsList():andThen(function(v42) --[[ Line: 239 ]]
        -- upvalues: v41 (copy), v2 (ref)
        local v43 = v42 and v42.permissions;
        if v43 then
            for _, v45 in pairs(v41) do
                local v46 = false;
                for _, v48 in pairs(v43) do
                    if v45 == v48 then
                        v46 = true;
                        break;
                    end;
                end;
                if not v46 then
                    return v2.resolve(false);
                end;
            end;
            return v2.resolve(true);
        else
            return v2.reject();
        end;
    end));
end;
v13.checkOrRequestPermissions = function(v49, v50) --[[ Line: 278 ]] --[[ Name: checkOrRequestPermissions ]]
    -- upvalues: v10 (copy), v2 (copy), v13 (copy)
    assert(v10(v50));
    return v49:supportsPermissions(v50):andThen(function(v51) --[[ Line: 281 ]]
        -- upvalues: v2 (ref), v13 (ref), v49 (copy), v50 (copy)
        if not v51 then
            return v2.resolve(v13.Status.UNSUPPORTED);
        else
            return (v49:hasPermissions(v50):andThen(function(v52) --[[ Line: 288 ]]
                -- upvalues: v13 (ref), v2 (ref), v49 (ref), v50 (ref)
                if v52.status == v13.Status.AUTHORIZED then
                    return v2.resolve(v52.status);
                else
                    return v49:requestPermissions(v50):andThen(function(v53) --[[ Line: 294 ]]
                        -- upvalues: v2 (ref)
                        return v2.resolve(v53.status);
                    end);
                end;
            end));
        end;
    end, function(_) --[[ Line: 300 ]]
        -- upvalues: v2 (ref), v13 (ref)
        return v2.resolve(v13.Status.UNSUPPORTED);
    end);
end;
v13.shouldShowUpsell = function(v55, v56) --[[ Line: 315 ]] --[[ Name: shouldShowUpsell ]]
    -- upvalues: l_GetFFlagLuaEnableShowUpsellMethod_0 (copy), v2 (copy), l_MessageBus_0 (copy), v18 (copy)
    if not l_GetFFlagLuaEnableShowUpsellMethod_0() then
        return v2.resolve({});
    else
        local v61 = v2.new(function(v57, _) --[[ Line: 319 ]]
            -- upvalues: v55 (copy)
            local l_SHOULD_SHOW_PERMISSION_UPSELL_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR_0 = v55.SHOULD_SHOW_PERMISSION_UPSELL_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR;
            v55.subscriber:subscribeProtocolMethodResponse(l_SHOULD_SHOW_PERMISSION_UPSELL_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR_0, function(v60) --[[ Line: 321 ]]
                -- upvalues: v55 (ref), l_SHOULD_SHOW_PERMISSION_UPSELL_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR_0 (copy), v57 (copy)
                v55.subscriber:unsubscribeToProtocolMethodResponse(l_SHOULD_SHOW_PERMISSION_UPSELL_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR_0);
                v57(v60);
            end);
        end);
        l_MessageBus_0.publishProtocolMethodRequest(v55.SHOULD_SHOW_PERMISSION_UPSELL_PROTOCOL_METHOD_REQUEST_DESCRIPTOR, {
            permissions = v56
        }, (v18(v56)));
        return v61;
    end;
end;
v13.default = v13.new();
return v13;