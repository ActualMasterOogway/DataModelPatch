local l_HttpService_0 = game:GetService("HttpService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("GenericChallenges");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_RoactNetworking_0 = require(l_Parent_0.RoactServiceTags).RoactNetworking;
local v4 = require(l_Parent_0.Roact);
local v5 = require(l_Parent_0.Cryo);
local v6 = require(l_Parent_0.RoactNavigation);
local l_RoactAnalytics_0 = require(l_Parent_0.RoactServiceTags).RoactAnalytics;
local v8 = require(l_Parent_0.RoactRodux);
local l_RoactServices_0 = require(l_Parent_0.RoactServices).RoactServices;
local l_AppLogging_0 = require(l_Parent_0.RoactServiceTags).AppLogging;
local v11 = require(l_script_FirstAncestor_0.Types.GenericType);
local l_UrlBuilder_0 = require(l_Parent_0.UrlBuilder).UrlBuilder;
local l_UrlBase_0 = require(l_Parent_0.UrlBuilder).UrlBase;
local v14 = require(l_Parent_0.Promise);
local v15 = require(script.Parent.ChallengeNativeWrapperEvent);
local l_DeviceIntegrityTokenChallenge_0 = require(script.Parent.Challenges).DeviceIntegrityTokenChallenge;
local l_DeviceAccessTokenChallenge_0 = require(script.Parent.Challenges).DeviceAccessTokenChallenge;
local v18 = require(script.Parent.Flags.GetFFlagLuaAppChallengeMoreTelemetryEnabled);
local v19 = require(script.Parent.Flags.GetFFlagEnableNativeToWebviewMiddleware);
local v20 = nil;
pcall(function() --[[ Line: 25 ]]
    -- upvalues: v20 (ref)
    v20 = game:GetService("AccountService");
end);
local v21 = v4.PureComponent:extend(script.Name);
v21.defaultProps = {
    accountService = v20
};
local v22 = l_UrlBuilder_0.new({
    base = l_UrlBase_0.APIS, 
    path = "challenge/v1/continue"
});
canRenderNativeChallenge = function(v23, _) --[[ Line: 43 ]] --[[ Name: canRenderNativeChallenge ]]
    -- upvalues: v11 (copy)
    local v25 = true;
    if v23 ~= v11.DeviceIntegrity then
        v25 = v23 == v11.DeviceAccessToken;
    end;
    return v25;
end;
v21.init = function(v26) --[[ Line: 62 ]] --[[ Name: init ]]
    v26:validateChallengeAndSetState(v26.props.challengeType, v26.props.challengeMetadata);
end;
v21.render = function(v27) --[[ Line: 66 ]] --[[ Name: render ]]
    -- upvalues: v11 (copy), v4 (copy), l_DeviceIntegrityTokenChallenge_0 (copy), l_DeviceAccessTokenChallenge_0 (copy)
    local l_challengeType_0 = v27.state.challengeType;
    local l_challengeMetadata_0 = v27.state.challengeMetadata;
    if l_challengeType_0 == v11.DeviceIntegrity then
        return v4.createElement(l_DeviceIntegrityTokenChallenge_0, {
            challengeId = v27.props.challengeId, 
            challengeMetadata = l_challengeMetadata_0, 
            onChallengeCompleted = function(v30) --[[ Line: 74 ]] --[[ Name: onChallengeCompleted ]]
                -- upvalues: v27 (copy)
                v27:challengeContinue(v30);
            end, 
            onChallengeFailed = function(v31) --[[ Line: 77 ]] --[[ Name: onChallengeFailed ]]
                -- upvalues: v27 (copy)
                v27:failSession(v31);
            end, 
            accountService = v27.props.accountService
        });
    elseif l_challengeType_0 == v11.DeviceAccessToken then
        return v4.createElement(l_DeviceAccessTokenChallenge_0, {
            challengeId = v27.props.challengeId, 
            challengeMetadata = l_challengeMetadata_0, 
            onChallengeCompleted = function(v32) --[[ Line: 86 ]] --[[ Name: onChallengeCompleted ]]
                -- upvalues: v27 (copy)
                v27:challengeContinue(v32);
            end, 
            onChallengeFailed = function(v33) --[[ Line: 89 ]] --[[ Name: onChallengeFailed ]]
                -- upvalues: v27 (copy)
                v27:failSession(v33);
            end, 
            accountService = v27.props.accountService
        });
    else
        return nil;
    end;
end;
v21.clearState = function(v34) --[[ Line: 99 ]] --[[ Name: clearState ]]
    v34.props.navigation.goBack();
end;
v21.failSession = function(v35, v36) --[[ Line: 103 ]] --[[ Name: failSession ]]
    v35.props.onSessionFailed(v36);
    v35:clearState();
end;
v21.validateChallengeAndSetState = function(v37, v38, v39) --[[ Line: 108 ]] --[[ Name: validateChallengeAndSetState ]]
    -- upvalues: v11 (copy), v18 (copy), v15 (copy), v19 (copy)
    local v40 = v11.toRawValue(v38);
    if v38 == nil or v38 == v11.Denied or v39 == nil or v39 == "" then
        if v18() then
            v37.props.loggingProtocol:logRobloxTelemetryEvent(v15, {}, {
                context = "renderFailure", 
                challengeId = v37.props.challengeId, 
                challengeType = v40, 
                challengeMetadata = v39
            });
        end;
        v37:failSession();
        return;
    elseif canRenderNativeChallenge(v38, v39) then
        if v18() then
            v37.props.loggingProtocol:logRobloxTelemetryEvent(v15, {}, {
                context = "challengeTriggered", 
                challengeId = v37.props.challengeId, 
                challengeType = v40, 
                challengeMetadata = v39
            });
        end;
        v37:setState({
            challengeType = v38, 
            challengeMetadata = v39
        });
        return;
    elseif v19() then
        if v18() then
            v37.props.loggingProtocol:logRobloxTelemetryEvent(v15, {}, {
                context = "webviewChallengeTriggered", 
                challengeId = v37.props.challengeId, 
                challengeType = v40, 
                challengeMetadata = v39
            });
        end;
        v37:clearState();
        v37.props.onWebViewChallengeIssued(v40, v39);
        return;
    else
        if v18() then
            v37.props.loggingProtocol:logRobloxTelemetryEvent(v15, {}, {
                context = "renderFailure", 
                challengeId = v37.props.challengeId, 
                challengeType = v40, 
                challengeMetadata = v39
            });
        end;
        v37:failSession();
        return;
    end;
end;
v21.challengeContinue = function(v41, v42) --[[ Line: 176 ]] --[[ Name: challengeContinue ]]
    -- upvalues: v11 (copy), v14 (copy), l_HttpService_0 (copy), v22 (copy), v18 (copy), v15 (copy)
    local v43 = v11.toRawValue(v41.state.challengeType);
    return v14.new(function(v44, _) --[[ Line: 179 ]]
        -- upvalues: l_HttpService_0 (ref), v41 (copy), v43 (copy), v42 (copy), v22 (ref), v11 (ref), v18 (ref), v15 (ref)
        local v46 = {
            postBody = l_HttpService_0:JSONEncode({
                challengeId = v41.props.challengeId, 
                challengeType = v43, 
                challengeMetadata = v42
            })
        };
        local v47, _ = v41.props.networkImpl(v22(), "POST", v46);
        return v47:andThen(function(v49) --[[ Line: 188 ]]
            -- upvalues: v11 (ref), v41 (ref), v44 (copy)
            local l_responseBody_0 = v49.responseBody;
            if l_responseBody_0.challengeType ~= nil and l_responseBody_0.challengeType ~= "" then
                local v51 = v11.fromRawValue(l_responseBody_0.challengeType);
                v41:validateChallengeAndSetState(v51, l_responseBody_0.challengeMetadata);
                v44();
                return;
            else
                v41.props.onSessionCompleted();
                v41:clearState();
                v44();
                return;
            end;
        end, function(v52) --[[ Line: 199 ]]
            -- upvalues: v18 (ref), v41 (ref), v15 (ref), v43 (ref), v42 (ref), v44 (copy)
            if v18() then
                v41.props.loggingProtocol:logRobloxTelemetryEvent(v15, {}, {
                    context = "continueFailure", 
                    challengeId = v41.props.challengeId, 
                    challengeType = v43, 
                    challengeMetadata = v42, 
                    error = tostring(v52.StatusCode)
                });
            end;
            v41:failSession(v52);
            v44();
        end);
    end);
end;
local l_v21_0 = v21;
v21 = v6.withNavigation(function(v54) --[[ Line: 217 ]]
    -- upvalues: v4 (copy), l_v21_0 (copy), v5 (copy)
    return v4.createElement(l_v21_0, v5.Dictionary.join(v54, v54.navigation.getParam("extraProps", {})));
end);
v21 = v8.connect(nil, nil)(v21);
return (l_RoactServices_0.connect({
    networkImpl = l_RoactNetworking_0, 
    analytics = l_RoactAnalytics_0, 
    loggingProtocol = l_AppLogging_0
})(v21));