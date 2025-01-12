local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_AvatarChatService_0 = game:GetService("AvatarChatService");
local v3 = require(l_RobloxGui_0.Modules.Flags.getFFlagMicrophoneDevicePermissionsPromptLogging);
local v4 = game:DefineFastString("MicrophoneDevicePermissionsLoggingEventName", "microphoneDevicePermissionPrompted");
return {
    _initialized = false, 
    placeId = 0, 
    universeId = 0, 
    placeVoiceEnabled = false, 
    universeVoiceEnabled = false, 
    clientSessionId = "", 
    UIType = {
        EXPERIENCE_JOIN = 0, 
        PROMPT_IMPRESSION = 1, 
        PROMPT_INTERACTION = 2
    }, 
    _init = function(v5, v6, v7) --[[ Line: 59 ]] --[[ Name: _init ]]
        -- upvalues: l_AvatarChatService_0 (copy)
        v5._initialized = true;
        v5.placeId = game.PlaceId;
        v5.universeId = game.GameId;
        v5.placeVoiceEnabled = l_AvatarChatService_0:IsEnabled(v6, Enum.AvatarChatServiceFeature.PlaceAudio);
        v5.universeVoiceEnabled = l_AvatarChatService_0:IsEnabled(v6, Enum.AvatarChatServiceFeature.UniverseAudio);
        v5:logExperienceJoin({
            didAuthorize = v7
        });
    end, 
    _getEventPayload = function(v8, v9, v10) --[[ Line: 71 ]] --[[ Name: _getEventPayload ]]
        return {
            uiType = v9, 
            uiContext = v10.uiContext, 
            didAuthorize = v10.didAuthorize, 
            placeId = v8.placeId, 
            universeId = v8.universeId, 
            placeVoiceEnabled = v8.placeVoiceEnabled, 
            universeVoiceEnabled = v8.universeVoiceEnabled, 
            clientSessionId = v8.clientSessionId
        };
    end, 
    _isReady = function(v11) --[[ Line: 84 ]] --[[ Name: _isReady ]]
        -- upvalues: v3 (copy)
        return v3() and v11._initialized;
    end, 
    init = function(v12, v13) --[[ Line: 88 ]] --[[ Name: init ]]
        -- upvalues: l_AvatarChatService_0 (copy)
        if l_AvatarChatService_0.ClientFeaturesInitialized then
            v12:_init(l_AvatarChatService_0.ClientFeatures, v13);
            return;
        else
            local v14 = nil;
            v14 = l_AvatarChatService_0:GetPropertyChangedSignal("ClientFeatures"):Connect(function() --[[ Line: 93 ]]
                -- upvalues: v12 (copy), l_AvatarChatService_0 (ref), v13 (copy), v14 (ref)
                v12:_init(l_AvatarChatService_0.ClientFeatures, v13);
                v14:Disconnect();
            end);
            return;
        end;
    end, 
    logExperienceJoin = function(v15, v16) --[[ Line: 100 ]] --[[ Name: logExperienceJoin ]]
        -- upvalues: l_RbxAnalyticsService_0 (copy), v4 (copy)
        if not v15:_isReady() then
            return;
        else
            l_RbxAnalyticsService_0:SendEventDeferred("client", "voice", v4, v15:_getEventPayload(v15.UIType.EXPERIENCE_JOIN, v16));
            return;
        end;
    end, 
    logPromptImpression = function(v17, v18) --[[ Line: 113 ]] --[[ Name: logPromptImpression ]]
        -- upvalues: l_RbxAnalyticsService_0 (copy), v4 (copy)
        if not v17:_isReady() then
            return;
        else
            l_RbxAnalyticsService_0:SendEventDeferred("client", "voice", v4, v17:_getEventPayload(v17.UIType.PROMPT_IMPRESSION, v18));
            return;
        end;
    end, 
    logPromptInteraction = function(v19, v20) --[[ Line: 126 ]] --[[ Name: logPromptInteraction ]]
        -- upvalues: l_RbxAnalyticsService_0 (copy), v4 (copy)
        if not v19:_isReady() then
            return;
        else
            l_RbxAnalyticsService_0:SendEventDeferred("client", "voice", v4, v19:_getEventPayload(v19.UIType.PROMPT_INTERACTION, v20));
            return;
        end;
    end, 
    setClientSessionId = function(v21, v22) --[[ Line: 139 ]] --[[ Name: setClientSessionId ]]
        if not v21:_isReady() or v21.clientSessionId == v22 then
            return;
        else
            v21.clientSessionId = v22;
            return;
        end;
    end
};