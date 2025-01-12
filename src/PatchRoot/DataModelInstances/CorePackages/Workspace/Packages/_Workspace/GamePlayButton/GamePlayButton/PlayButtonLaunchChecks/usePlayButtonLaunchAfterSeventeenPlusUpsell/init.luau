local l_script_FirstAncestor_0 = script:FindFirstAncestor("GamePlayButton");
local _ = require(l_script_FirstAncestor_0.PlayButtonTypes);
local v2 = require(l_script_FirstAncestor_0.Flags.GetFFlagLuaAppFetchPlayabilityKillSwitch);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v4 = require(l_Parent_0.React);
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_RoactNetworking_0 = require(l_Parent_0.RoactServiceTags).RoactNetworking;
local l_AppEventIngestService_0 = require(l_Parent_0.RoactServiceTags).AppEventIngestService;
local l_PlayabilityStatusEnum_0 = require(l_Parent_0.PlayabilityRodux).Enums.PlayabilityStatusEnum;
local l_FetchGamePlayabilityAndProductInfo_0 = require(l_Parent_0.GameDetailRodux).FetchGamePlayabilityAndProductInfo;
local l_OpenAgeVerificationModal_0 = require(l_Parent_0.VoiceChat).AgeVerificationOverlay.OpenAgeVerificationModal;
local v12 = require(l_script_FirstAncestor_0.PlayButtonLaunchChecks.useContextualParentalControlsUpsell);
local l_unlockPlayIntent_0 = require(l_Parent_0.DiscoveryAnalytics).Events.unlockPlayIntent;
local l_FFlagLuaAppVpcUpsell_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppVpcUpsell;
local l_FFlagLuaAppUnlockPlayIntentEvent_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppUnlockPlayIntentEvent;
local v16 = game:DefineFastFlag("LuaAppRemoveExtraIntentEvent", false);
return function(v17, v18, v19) --[[ Line: 23 ]]
    -- upvalues: l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), l_FFlagLuaAppUnlockPlayIntentEvent_0 (copy), l_AppEventIngestService_0 (copy), l_useDispatch_0 (copy), v4 (copy), l_unlockPlayIntent_0 (copy), l_FFlagLuaAppVpcUpsell_0 (copy), v12 (copy), l_PlayabilityStatusEnum_0 (copy), v2 (copy), l_FetchGamePlayabilityAndProductInfo_0 (copy), l_OpenAgeVerificationModal_0 (copy), v16 (copy)
    local v20 = l_useRoactService_0(l_RoactNetworking_0);
    local v21 = nil;
    if l_FFlagLuaAppUnlockPlayIntentEvent_0 then
        v21 = l_useRoactService_0(l_AppEventIngestService_0);
    end;
    local v22 = l_useDispatch_0();
    local v23 = nil;
    if l_FFlagLuaAppUnlockPlayIntentEvent_0 then
        v23 = v4.useCallback(function(v24) --[[ Line: 38 ]]
            -- upvalues: l_unlockPlayIntent_0 (ref), v21 (ref), v18 (copy), v17 (copy)
            l_unlockPlayIntent_0(v21, {
                universeId = v18, 
                upsellName = v24, 
                playabilityStatus = v17 and v17.playabilityStatus or nil
            });
        end, {
            v21, 
            v18, 
            v17
        });
    end;
    local v25 = nil;
    if l_FFlagLuaAppVpcUpsell_0 then
        v25 = v12(v18, v19);
    end;
    return (v4.useCallback(function(v26) --[[ Line: 52 ]]
        -- upvalues: v17 (copy), l_PlayabilityStatusEnum_0 (ref), l_FFlagLuaAppVpcUpsell_0 (ref), v2 (ref), v22 (copy), l_FetchGamePlayabilityAndProductInfo_0 (ref), v20 (copy), v18 (copy), l_OpenAgeVerificationModal_0 (ref), l_FFlagLuaAppUnlockPlayIntentEvent_0 (ref), v23 (ref), v25 (ref), v19 (copy), v16 (ref)
        if v17 then
            local v27 = true;
            if v17.playabilityStatus ~= l_PlayabilityStatusEnum_0.ContextualPlayabilityUnverifiedSeventeenPlusUser then
                v27 = l_FFlagLuaAppVpcUpsell_0 and v17.playabilityStatus == l_PlayabilityStatusEnum_0.ContextualPlayabilityAgeRecommendationParentalControls;
            end;
            if v27 and not v2() then
                v22(l_FetchGamePlayabilityAndProductInfo_0.Fetch(v20, v18)):andThen(function(v28) --[[ Line: 64 ]]
                    -- upvalues: l_PlayabilityStatusEnum_0 (ref), v22 (ref), l_OpenAgeVerificationModal_0 (ref), v18 (ref), l_FFlagLuaAppUnlockPlayIntentEvent_0 (ref), v23 (ref), l_FFlagLuaAppVpcUpsell_0 (ref), v25 (ref), v19 (ref), v26 (copy)
                    if v28 == l_PlayabilityStatusEnum_0.ContextualPlayabilityUnverifiedSeventeenPlusUser then
                        v22(l_OpenAgeVerificationModal_0(v18));
                        if l_FFlagLuaAppUnlockPlayIntentEvent_0 then
                            v23("AgeVerificationUnverifiedSeventeenPlusUser");
                            return;
                        end;
                    elseif l_FFlagLuaAppVpcUpsell_0 and v28 == l_PlayabilityStatusEnum_0.ContextualPlayabilityAgeRecommendationParentalControls then
                        v25();
                        return;
                    else
                        v19(v26);
                        if l_FFlagLuaAppUnlockPlayIntentEvent_0 then
                            v23("GameLaunch");
                        end;
                    end;
                end):catch(function() --[[ Line: 87 ]]
                    -- upvalues: v19 (ref), v26 (copy), l_FFlagLuaAppUnlockPlayIntentEvent_0 (ref), v23 (ref)
                    v19(v26);
                    if l_FFlagLuaAppUnlockPlayIntentEvent_0 then
                        v23("GameLaunch");
                    end;
                end);
                return;
            else
                v19(v26);
                if not v16 and l_FFlagLuaAppUnlockPlayIntentEvent_0 then
                    v23("GameLaunch");
                    return;
                end;
            end;
        else
            v19(v26);
            if not v16 and l_FFlagLuaAppUnlockPlayIntentEvent_0 then
                v23("GameLaunch");
            end;
        end;
    end, {
        v20, 
        v18, 
        v17, 
        v19, 
        v23, 
        v25
    }));
end;