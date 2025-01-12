local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
game:DefineFastInt("LuaVoiceChatAnalyticsPointsThrottle", 0);
game:DefineFastFlag("LuaVoiceChatAnalyticsUsePointsV2", false);
game:DefineFastFlag("LuaVoiceChatAnalyticsUseCounterV2", false);
game:DefineFastFlag("LuaVoiceChatAnalyticsUseEventsV2", false);
game:DefineFastFlag("LuaVoiceChatAnalyticsBanMessage", true);
game:DefineFastFlag("LuaVoiceChatReconnectMissedSequence", false);
local v1 = {};
v1.__index = v1;
v1.INFO = "info";
v1.WARNING = "warning";
v1.ERROR = "error";
v1.new = function(v2) --[[ Line: 115 ]] --[[ Name: new ]]
    -- upvalues: l_RbxAnalyticsService_0 (copy), v1 (copy)
    if not v2 then
        v2 = l_RbxAnalyticsService_0;
    end;
    assert(v2, "Analytics impl must not be nil.");
    return (setmetatable({
        _impl = v2
    }, v1));
end;
local function v3() --[[ Line: 128 ]] --[[ Name: stub ]]

end;
v1.stubService = function() --[[ Line: 130 ]] --[[ Name: stubService ]]
    -- upvalues: v3 (copy)
    return {
        SetRBXEvent = v3, 
        SetRBXEventStream = v3, 
        SendEventDeferred = v3, 
        ReportCounter = v3, 
        ReportStats = v3, 
        ReportInfluxSeries = v3
    };
end;
v1.setImpl = function(v4, v5) --[[ Line: 141 ]] --[[ Name: setImpl ]]
    v4._impl = v5;
end;
v1._report = function(v6, v7, v8, v9, v10) --[[ Line: 145 ]] --[[ Name: _report ]]
    local v11 = v7 .. "-" .. v8;
    if game:GetFastFlag("LuaVoiceChatAnalyticsUsePointsV2") then
        v6._impl:ReportInfluxSeries(v11, v10, game:GetFastInt("LuaVoiceChatAnalyticsPointsThrottle"));
    end;
    if game:GetFastFlag("LuaVoiceChatAnalyticsUseCounterV2") then
        local l_v11_0 = v11;
        if v9 then
            l_v11_0 = l_v11_0 .. "-" .. v9;
        end;
        local l_l_v11_0_0 = l_v11_0;
        if v10 and v10.result then
            l_l_v11_0_0 = l_l_v11_0_0 .. "-" .. v10.result;
        end;
        v6._impl:ReportCounter(l_l_v11_0_0, 1);
    end;
    if game:GetFastFlag("LuaVoiceChatAnalyticsUseEventsV2") then
        v6._impl:SendEventDeferred("client", v7, v8, v10);
    end;
end;
v1.reportVoiceChatJoinResult = function(v14, v15, v16, v17) --[[ Line: 167 ]] --[[ Name: reportVoiceChatJoinResult ]]
    -- upvalues: v1 (copy)
    v14:_report("voiceChat", "defaultChannelJoinResults", v16, {
        success = v15, 
        result = v16, 
        logLevel = v17 or v1.INFO
    });
end;
v1.reportBanMessageEvent = function(v18, v19) --[[ Line: 175 ]] --[[ Name: reportBanMessageEvent ]]
    if game:GetFastFlag("LuaVoiceChatAnalyticsBanMessage") then
        v18._impl:ReportCounter("voiceChat-reportBanMessage" .. v19, 1);
    end;
end;
v1.reportBanMessageEventV2 = function(v20, v21, v22, v23, v24) --[[ Line: 181 ]] --[[ Name: reportBanMessageEventV2 ]]
    v20:_report("voiceChat", "reportBanEvent", nil, {
        eventType = v21, 
        banReason = v22, 
        userId = v23, 
        voiceSessionId = v24
    });
end;
v1.reportReconnectDueToMissedSequence = function(v25) --[[ Line: 190 ]] --[[ Name: reportReconnectDueToMissedSequence ]]
    if game:GetFastFlag("LuaVoiceChatReconnectMissedSequence") then
        v25._impl:ReportCounter("voiceChat-reconnectMissedSequence", 1);
    end;
end;
v1.reportOutOfOrderSequence = function(v26) --[[ Line: 196 ]] --[[ Name: reportOutOfOrderSequence ]]
    v26._impl:ReportCounter("voiceChat-outOfOrderSequence", 1);
end;
v1.reportReceivedNudge = function(v27, v28, v29, v30) --[[ Line: 200 ]] --[[ Name: reportReceivedNudge ]]
    local l_UnixTimestampMillis_0 = DateTime.fromIsoDate(v28.deliveryTime).UnixTimestampMillis;
    local v32 = DateTime.now().UnixTimestampMillis - l_UnixTimestampMillis_0;
    v27._impl:ReportCounter("voicechat-receivednudge", 1);
    v27._impl:ReportCounter("voicechat-receivednudgeduration", v32);
    v27._impl:SendEventDeferred("client", "voiceChat", "receivedNudge", {
        type = v28.type, 
        durationInMs = v32, 
        userId = v29, 
        voiceSessionId = v30
    });
end;
v1.reportClosedNudge = function(v33, v34, v35) --[[ Line: 217 ]] --[[ Name: reportClosedNudge ]]
    v33._impl:ReportCounter("voicechat-closednudge", 1);
    v33._impl:SendEventDeferred("client", "voiceChat", "closedNudge", {
        userId = v34, 
        voiceSessionId = v35, 
        closeType = "CLOSED"
    });
end;
v1.reportAcknowledgedNudge = function(v36, v37, v38) --[[ Line: 226 ]] --[[ Name: reportAcknowledgedNudge ]]
    v36._impl:ReportCounter("voicechat-acknowledgednudge", 1);
    v36._impl:SendEventDeferred("client", "voiceChat", "closedNudge", {
        userId = v37, 
        voiceSessionId = v38, 
        closeType = "ACKNOWLEDGED"
    });
end;
v1.reportDeniedNudge = function(v39, v40, v41) --[[ Line: 235 ]] --[[ Name: reportDeniedNudge ]]
    v39._impl:ReportCounter("voicechat-deniednudge", 1);
    v39._impl:SendEventDeferred("client", "voiceChat", "closedNudge", {
        userId = v40, 
        voiceSessionId = v41, 
        closeType = "DENIED"
    });
end;
v1.reportVoiceMuteIndividual = function(v42, v43) --[[ Line: 244 ]] --[[ Name: reportVoiceMuteIndividual ]]
    v42._impl:SendEventDeferred("client", "voice", "voiceUIMuteUnmuteIndividual", {
        user_id = v43.userId, 
        client_session_id = v43.clientSessionId, 
        target_user_id = v43.targetUserId, 
        channel_id = v43.channelId, 
        context = v43.context, 
        muted = v43.muted
    });
end;
v1.reportVoiceMuteGroup = function(v44, v45) --[[ Line: 255 ]] --[[ Name: reportVoiceMuteGroup ]]
    v44._impl:SendEventDeferred("client", "voice", "voiceUIMuteUnmuteGroup", {
        user_id = v45.userId, 
        client_session_id = v45.clientSessionId, 
        channel_id = v45.channelId, 
        context = v45.context, 
        group_type = v45.groupType, 
        muted = v45.muted
    });
end;
v1.reportVoiceMuteSelf = function(v46, v47) --[[ Line: 266 ]] --[[ Name: reportVoiceMuteSelf ]]
    v46._impl:SendEventDeferred("client", "voice", "voiceUIMuteUnmuteSelf", {
        user_id = v47.userId, 
        client_session_id = v47.clientSessionId, 
        channel_id = v47.channelId, 
        context = v47.context, 
        muted = v47.muted
    });
end;
v1.reportJoinVoiceButtonEvent = function(v48, v49, v50, v51, v52) --[[ Line: 276 ]] --[[ Name: reportJoinVoiceButtonEvent ]]
    v48._impl:SendEventDeferred("client", "voice", "joinVoiceButtonEvent", {
        eventType = v49, 
        universeId = v50, 
        placeId = v51, 
        playSessionId = v52
    });
end;
v1.reportJoinVoiceButtonEventWithVoiceSessionId = function(v53, v54, v55, v56, v57, v58) --[[ Line: 290 ]] --[[ Name: reportJoinVoiceButtonEventWithVoiceSessionId ]]
    v53._impl:SendEventDeferred("client", "voice", "joinVoiceButtonEvent", {
        eventType = v54, 
        universeId = v55, 
        placeId = v56, 
        playSessionId = v57, 
        voiceSessionId = v58
    });
end;
v1.reportLeaveVoiceButtonEvent = function(v59, v60, v61, v62, v63, v64) --[[ Line: 306 ]] --[[ Name: reportLeaveVoiceButtonEvent ]]
    v59._impl:SendEventDeferred("client", "voice", "leaveVoiceButtonEvent", {
        eventType = v60, 
        universeId = v61, 
        placeId = v62, 
        playSessionId = v63, 
        voiceSessionId = v64
    });
end;
v1.reportInExpConsent = function(v65, v66, v67, v68, v69, v70) --[[ Line: 322 ]] --[[ Name: reportInExpConsent ]]
    v65._impl:SendEventDeferred("client", "voiceChat", "inExpConsentModalEvent", {
        eventType = v66, 
        entry = v67, 
        universeId = v68, 
        placeId = v69, 
        playSessionId = v70
    });
end;
v1.reportDevicePermissionsModalEvent = function(v71, v72, v73, v74, v75, v76) --[[ Line: 338 ]] --[[ Name: reportDevicePermissionsModalEvent ]]
    local v77 = string.sub(v76, 2, #v76 - 1);
    v71._impl:SendEventDeferred("client", "voiceChat", "devicePermissionsModalEvent", {
        eventType = v72, 
        universeId = v74, 
        placeId = v75, 
        playSessionId = v77, 
        voiceSessionId = v73
    });
end;
v1.reportConnectDisconnectEvents = function(v78, v79, v80) --[[ Line: 357 ]] --[[ Name: reportConnectDisconnectEvents ]]
    v78._impl:SendEventDeferred("client", "voiceChat", v79, v80);
end;
return v1;