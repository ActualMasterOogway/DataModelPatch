local v0 = require(script.Parent.RenderChallenge);
local l_script_FirstAncestor_0 = script:FindFirstAncestor("GenericChallenges");
local v2 = require(l_script_FirstAncestor_0.Types.ChallengeType);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Base64_0 = require(l_Parent_0.AuthCommon).Utils.Base64;
local l_HttpService_0 = game:GetService("HttpService");
local l_GenericChallengeService_0 = game:GetService("GenericChallengeService");
challengeRequiredEventHandler = function(v7, v8, v9) --[[ Line: 11 ]] --[[ Name: challengeRequiredEventHandler ]]
    -- upvalues: v0 (copy), v2 (copy), l_GenericChallengeService_0 (copy), l_Base64_0 (copy), l_HttpService_0 (copy)
    v0({
        challengeType = v2.Generic, 
        challengeParameters = {
            genericChallengeId = v7, 
            genericChallengeType = v8, 
            genericChallengeMetadata = v9
        }, 
        callbacks = {
            OnChallengeLoadFailed = function(_) --[[ Line: 20 ]] --[[ Name: OnChallengeLoadFailed ]]
                -- upvalues: l_GenericChallengeService_0 (ref), v7 (copy)
                l_GenericChallengeService_0:SignalChallengeLoaded(v7, false);
            end, 
            OnChallengeCompleted = function(v11) --[[ Line: 25 ]] --[[ Name: OnChallengeCompleted ]]
                -- upvalues: l_Base64_0 (ref), l_HttpService_0 (ref), l_GenericChallengeService_0 (ref), v7 (copy), v8 (copy)
                if v11.data.metadata ~= nil then
                    local v12 = l_Base64_0.Encode(l_HttpService_0:JSONEncode(v11.data.metadata));
                    l_GenericChallengeService_0:SignalChallengeCompleted(v7, v8, v12);
                end;
            end, 
            OnChallengeInvalidated = function(_) --[[ Line: 31 ]] --[[ Name: OnChallengeInvalidated ]]
                -- upvalues: l_GenericChallengeService_0 (ref), v7 (copy)
                l_GenericChallengeService_0:SignalChallengeInvalidated(v7);
            end, 
            OnChallengeAbandoned = function() --[[ Line: 34 ]] --[[ Name: OnChallengeAbandoned ]]
                -- upvalues: l_GenericChallengeService_0 (ref), v7 (copy)
                l_GenericChallengeService_0:SignalChallengeAbandoned(v7);
            end
        }, 
        renderWebViewInModal = true, 
        onWebViewOpen = function() --[[ Line: 39 ]] --[[ Name: onWebViewOpen ]]
            -- upvalues: l_GenericChallengeService_0 (ref), v7 (copy)
            l_GenericChallengeService_0:SignalChallengeLoaded(v7, true);
        end
    });
end;
return function() --[[ Line: 45 ]]
    -- upvalues: l_GenericChallengeService_0 (copy)
    l_GenericChallengeService_0.ChallengeRequiredEvent:Connect(challengeRequiredEventHandler);
end;