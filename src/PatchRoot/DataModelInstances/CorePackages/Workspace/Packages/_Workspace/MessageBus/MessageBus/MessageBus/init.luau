local l_MessageBusService_0 = game:GetService("MessageBusService");
local _ = require(script.Parent.MessageBusTypes);
local v2 = game:DefineFastFlag("LuaAppFixMessageBusServiceCase", false);
local l_Parent_0 = script:FindFirstAncestor("MessageBus").Parent;
local l_FFlagLuaAppFixMessageBusUnsubscribe_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppFixMessageBusUnsubscribe;
local v5 = game:DefineFastFlag("DisableMessageBusUnSubscribeError", false);
local v6 = game:DefineFastFlag("EnableMessageBusUnSubscribeErrorTelemetry", false);
local v7 = {};
v7.__index = v7;
v7.publish = function(v8, v9) --[[ Line: 45 ]] --[[ Name: publish ]]
    -- upvalues: l_MessageBusService_0 (copy)
    assert(v8.validateParams(v9));
    l_MessageBusService_0:Publish(v8.mid, v9);
end;
v7.publishProtocolMethodRequest = function(v10, v11, v12) --[[ Line: 50 ]] --[[ Name: publishProtocolMethodRequest ]]
    -- upvalues: l_MessageBusService_0 (copy)
    assert(v10.validateParams(v11));
    l_MessageBusService_0:PublishProtocolMethodRequest(v10.protocolName, v10.methodName, v11, v12);
end;
v7.publishProtocolMethodResponse = function(v13, v14, v15, v16) --[[ Line: 59 ]] --[[ Name: publishProtocolMethodResponse ]]
    -- upvalues: v2 (copy), l_MessageBusService_0 (copy)
    assert(v13.validateParams(v14));
    if v2 then
        l_MessageBusService_0:PublishProtocolMethodResponse(v13.protocolName, v13.methodName, v14, v15, v16);
        return;
    else
        l_MessageBusService_0:publishProtocolMethodResponse(v13.protocolName, v13.methodName, v14, v15, v16);
        return;
    end;
end;
v7.getLast = function(v17) --[[ Line: 85 ]] --[[ Name: getLast ]]
    -- upvalues: v2 (copy), l_MessageBusService_0 (copy)
    local v18 = nil;
    v18 = if v2 then l_MessageBusService_0:GetLast(v17.mid) else l_MessageBusService_0:getLast(v17.mid);
    if v18 == nil then
        return nil;
    else
        assert(v17.validateParams(v18));
        return v18;
    end;
end;
v7.getMessageId = function(v19, v20) --[[ Line: 99 ]] --[[ Name: getMessageId ]]
    -- upvalues: l_MessageBusService_0 (copy)
    return l_MessageBusService_0:GetMessageId(v19, v20);
end;
v7.getProtocolMethodRequestMessageId = function(v21, v22) --[[ Line: 103 ]] --[[ Name: getProtocolMethodRequestMessageId ]]
    -- upvalues: l_MessageBusService_0 (copy)
    return l_MessageBusService_0:GetProtocolMethodRequestMessageId(v21, v22);
end;
v7.getProtocolMethodResponseMessageId = function(v23, v24) --[[ Line: 107 ]] --[[ Name: getProtocolMethodResponseMessageId ]]
    -- upvalues: l_MessageBusService_0 (copy)
    return l_MessageBusService_0:GetProtocolMethodResponseMessageId(v23, v24);
end;
v7.call = function(v25, v26) --[[ Line: 111 ]] --[[ Name: call ]]
    -- upvalues: l_MessageBusService_0 (copy)
    assert(v25.validateParams(v26));
    return l_MessageBusService_0:Call(v25.fid, v26);
end;
local v27 = {};
v27.__index = v27;
v27.new = function() --[[ Line: 119 ]] --[[ Name: new ]]
    -- upvalues: v27 (copy)
    return (setmetatable({
        connections = {}
    }, v27));
end;
v27.getSubscriptionCount = function(v28) --[[ Line: 126 ]] --[[ Name: getSubscriptionCount ]]
    local v29 = 0;
    for _ in pairs(v28.connections) do
        v29 = v29 + 1;
    end;
    return v29;
end;
v27.subscribe = function(v31, v32, v33, v34, v35) --[[ Line: 134 ]] --[[ Name: subscribe ]]
    -- upvalues: l_MessageBusService_0 (copy)
    local v36 = true;
    if v34 ~= nil then
        v36 = v34;
    end;
    local v37 = false;
    if v35 ~= nil then
        v37 = v35;
    end;
    local l_mid_0 = v32.mid;
    if v31.connections[l_mid_0] ~= nil then
        v31:unsubscribe(v32);
    end;
    local v39 = l_MessageBusService_0:Subscribe(l_mid_0, v33, v37, v36);
    v31.connections[l_mid_0] = v39;
end;
v27.subscribeProtocolMethodRequest = function(v40, v41, v42, v43, v44) --[[ Line: 147 ]] --[[ Name: subscribeProtocolMethodRequest ]]
    -- upvalues: v7 (copy), l_FFlagLuaAppFixMessageBusUnsubscribe_0 (copy), l_MessageBusService_0 (copy)
    local v45 = true;
    if v43 ~= nil then
        v45 = v43;
    end;
    local v46 = false;
    if v44 ~= nil then
        v46 = v44;
    end;
    local l_protocolName_0 = v41.protocolName;
    local l_methodName_0 = v41.methodName;
    local v49 = v7.getProtocolMethodRequestMessageId(l_protocolName_0, l_methodName_0);
    if v40.connections[v49] ~= nil then
        if l_FFlagLuaAppFixMessageBusUnsubscribe_0 then
            v40:unsubscribeWithMsgId(v49);
        else
            v40:unsubscribe(v49);
        end;
    end;
    local v50 = l_MessageBusService_0:SubscribeToProtocolMethodRequest(l_protocolName_0, l_methodName_0, v42, v46, v45);
    v40.connections[v49] = v50;
end;
v27.subscribeProtocolMethodResponse = function(v51, v52, v53, v54, v55) --[[ Line: 171 ]] --[[ Name: subscribeProtocolMethodResponse ]]
    -- upvalues: v7 (copy), l_FFlagLuaAppFixMessageBusUnsubscribe_0 (copy), l_MessageBusService_0 (copy)
    local v56 = true;
    if v54 ~= nil then
        v56 = v54;
    end;
    local v57 = false;
    if v55 ~= nil then
        v57 = v55;
    end;
    local l_protocolName_1 = v52.protocolName;
    local l_methodName_1 = v52.methodName;
    local v60 = v7.getProtocolMethodResponseMessageId(l_protocolName_1, l_methodName_1);
    if v51.connections[v60] ~= nil then
        if l_FFlagLuaAppFixMessageBusUnsubscribe_0 then
            v51:unsubscribeWithMsgId(v60);
        else
            v51:unsubscribe(v60);
        end;
    end;
    local v61 = l_MessageBusService_0:SubscribeToProtocolMethodResponse(l_protocolName_1, l_methodName_1, v53, v57, v56);
    v51.connections[v60] = v61;
end;
v27.unsubscribeToProtocolMethodRequest = function(v62, v63) --[[ Line: 195 ]] --[[ Name: unsubscribeToProtocolMethodRequest ]]
    -- upvalues: l_MessageBusService_0 (copy)
    v62:unsubscribeWithMsgId(l_MessageBusService_0:GetProtocolMethodRequestMessageId(v63.protocolName, v63.methodName));
end;
v27.unsubscribeToProtocolMethodResponse = function(v64, v65) --[[ Line: 199 ]] --[[ Name: unsubscribeToProtocolMethodResponse ]]
    -- upvalues: l_MessageBusService_0 (copy)
    v64:unsubscribeWithMsgId(l_MessageBusService_0:GetProtocolMethodResponseMessageId(v65.protocolName, v65.methodName));
end;
v27.unsubscribe = function(v66, v67) --[[ Line: 203 ]] --[[ Name: unsubscribe ]]
    v66:unsubscribeWithMsgId(v67.mid);
end;
v27.unsubscribeWithMsgId = function(v68, v69) --[[ Line: 207 ]] --[[ Name: unsubscribeWithMsgId ]]
    -- upvalues: v5 (copy), v6 (copy), l_MessageBusService_0 (copy)
    local v70 = v68.connections[v69];
    if v70 == nil then
        if v5 then
            if v6 then
                local v71 = {
                    err = "unsubscribing from a message id not subscribed to: " .. v69
                };
                local v72 = {
                    eventType = "RobloxTelemetry", 
                    config = {
                        eventName = "MessageBusErrorEvent", 
                        backends = {
                            "Points"
                        }, 
                        throttlingPercentage = 10000, 
                        lastUpdated = {
                            24, 
                            11, 
                            20
                        }, 
                        description = "Report MessageBus errors to Points\"", 
                        links = ""
                    }, 
                    data = {
                        standardizedFields = nil, 
                        customFields = v71, 
                        eventContext = nil
                    }
                };
                l_MessageBusService_0:Call("Telemetry.logEventFromLua", v72);
            end;
            return;
        else
            error("unsubscribing from a message id not subscribed to: " .. v69);
        end;
    end;
    v68.connections[v69] = nil;
    v70:Disconnect();
end;
v27.unsubscribeFromAllMessages = function(v73) --[[ Line: 250 ]] --[[ Name: unsubscribeFromAllMessages ]]
    for v74, v75 in pairs(v73.connections) do
        v73.connections[v74] = nil;
        v75:Disconnect();
    end;
end;
v7.Subscriber = v27;
return v7;