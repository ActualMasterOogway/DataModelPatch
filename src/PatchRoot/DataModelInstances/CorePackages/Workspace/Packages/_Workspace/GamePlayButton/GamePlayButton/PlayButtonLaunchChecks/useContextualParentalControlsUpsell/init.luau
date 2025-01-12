local l_script_FirstAncestor_0 = script:FindFirstAncestor("GamePlayButton");
local _ = require(l_script_FirstAncestor_0.PlayButtonTypes);
local v2 = require(l_script_FirstAncestor_0.FetchGamePlayButtonData);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v4 = require(l_Parent_0.React);
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_RoactNetworking_0 = require(l_Parent_0.RoactServiceTags).RoactNetworking;
local l_AppEventIngestService_0 = require(l_Parent_0.RoactServiceTags).AppEventIngestService;
local l_flaggedMutedError_0 = require(l_Parent_0.Loggers).flaggedMutedError;
local l_GameInfosReducer_0 = require(l_Parent_0.GameInfosRodux).GameInfosReducer;
local l_FetchUserSettingsAndOptions_0 = require(l_Parent_0.GameDetailRodux).FetchUserSettingsAndOptions;
local v13 = require(l_Parent_0.Dash);
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_NavigateDown_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateDown;
local l_NavigateBack_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateBack;
local l_OpenCloseOnlyInteractiveAlert_0 = require(l_Parent_0.DiscoveryRouting).OpenCloseOnlyInteractiveAlert;
local l_OpenUpsellModal_0 = require(l_Parent_0.DiscoveryRouting).OpenUpsellModal;
local l_CloseCentralOverlay_0 = require(l_Parent_0.CentralOverlay).Thunks.CloseCentralOverlay;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).useAppPolicy;
local l_OpenAmpWizardContainer_0 = require(l_Parent_0.AmpUpsell).OpenAmpWizardContainer;
local l_authButtonClick_0 = require(l_Parent_0.AuthAnalytics).Events.authButtonClick;
local v24 = require(l_Parent_0.LoggingProtocol);
local l_PlayabilityStatusEnum_0 = require(l_Parent_0.PlayabilityRodux).Enums.PlayabilityStatusEnum;
local l_unlockPlayIntent_0 = require(l_Parent_0.DiscoveryAnalytics).Events.unlockPlayIntent;
local v27 = game:DefineFastInt("UnknownUpsellErrorEventHundredthsPercent", 0);
local l_FFlagLuaAppAskParentModalTelemetry_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppAskParentModalTelemetry;
local l_FFlagLuaAppParentUpsellPolicy_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppParentUpsellPolicy;
local l_FFlagLuaAppUnlockPlayIntentEvent_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppUnlockPlayIntentEvent;
local v31 = game:DefineFastFlag("LuaAppUpdateMinimumAgePriority", false);
local v32 = game:DefineFastFlag("LuaAppNoRatingMinimumAge", false);
local v33 = {
    SelfUpdateSetting = "SelfUpdateSetting", 
    ParentalConsent = "ParentalConsent", 
    ContentAgeRestrictionVerification = "ContentAgeRestrictionVerification"
};
return function(v34, v35) --[[ Line: 47 ]]
    -- upvalues: l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), l_FFlagLuaAppUnlockPlayIntentEvent_0 (copy), l_AppEventIngestService_0 (copy), l_useDispatch_0 (copy), l_useSelector_0 (copy), v31 (copy), v32 (copy), l_GameInfosReducer_0 (copy), l_useLocalization_0 (copy), v4 (copy), l_OpenAmpWizardContainer_0 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy), l_OpenUpsellModal_0 (copy), l_OpenCloseOnlyInteractiveAlert_0 (copy), l_NavigateBack_0 (copy), l_CloseCentralOverlay_0 (copy), v2 (copy), l_FFlagLuaAppAskParentModalTelemetry_0 (copy), l_authButtonClick_0 (copy), l_unlockPlayIntent_0 (copy), l_PlayabilityStatusEnum_0 (copy), l_FFlagLuaAppParentUpsellPolicy_0 (copy), l_useAppPolicy_0 (copy), l_FetchUserSettingsAndOptions_0 (copy), l_flaggedMutedError_0 (copy), v24 (copy), v27 (copy), v13 (copy), v33 (copy)
    local v36 = l_useRoactService_0(l_RoactNetworking_0);
    local v37 = nil;
    if l_FFlagLuaAppUnlockPlayIntentEvent_0 then
        v37 = l_useRoactService_0(l_AppEventIngestService_0);
    end;
    local v38 = l_useDispatch_0();
    local v44 = l_useSelector_0(function(v39) --[[ Line: 58 ]]
        -- upvalues: v31 (ref), v34 (copy), v32 (ref), l_GameInfosReducer_0 (ref)
        if v31 then
            local v40 = v39.AgeRecommendations[v34];
            if v32 and v40 and v40.summary and not v40.summary.ageRecommendation then
                return -1;
            elseif v40 and v40.summary and v40.summary.ageRecommendation and v40.summary.ageRecommendation.minimumAge then
                return v40.summary.ageRecommendation.minimumAge;
            else
                local v41 = v39.Personalization[l_GameInfosReducer_0.key][v34];
                if v41 and v41.minimumAge then
                    return v41.minimumAge;
                end;
            end;
        else
            local v42 = v39.Personalization[l_GameInfosReducer_0.key][v34];
            if v42 and v42.minimumAge then
                return v42.minimumAge;
            else
                local v43 = v39.AgeRecommendations[v34];
                if v32 and v43 and v43.summary and not v43.summary.ageRecommendation then
                    return -1;
                elseif v43 and v43.summary and v43.summary.ageRecommendation and v43.summary.ageRecommendation.minimumAge then
                    return v43.summary.ageRecommendation.minimumAge;
                end;
            end;
        end;
        return nil;
    end);
    local v45 = l_useLocalization_0({
        unplayableTitleText = "Feature.ExperienceDetails.RestrictedUnplayableModal.Label.Title", 
        unplayableBodyText = "Feature.ExperienceDetails.RestrictedUnplayableModal.Label.Body", 
        unplayableButtonText = "Feature.ExperienceDetails.RestrictedUnplayableModal.Action.Ok", 
        askYourParentTitleText = "Feature.ExperienceDetails.AskYourParentModal.Label.Title", 
        askYourParentBodyText = "Feature.ExperienceDetails.AskYourParentModal.Label.Body", 
        askYourParentActionButtonText = "Feature.ExperienceDetails.AskYourParentModal.Action.AskNow", 
        askYourParentCancelButtonText = "Feature.ExperienceDetails.AskYourParentModal.Action.Cancel", 
        consoleSelfUpdateSettingTitleText = "Feature.ExperienceDetails.UpdateMaturitySettingModal.Console.Label.Title", 
        consoleSelfUpdateSettingBodyText = "Feature.ExperienceDetails.UpdateMaturitySettingModal.Console.Label.Body", 
        consoleSelfUpdateSettingButtonText = "Feature.ExperienceDetails.UpdateMaturitySettingModal.Console.Action.Ok"
    });
    local v50 = v4.useCallback(function(v46, v47, v48, v49) --[[ Line: 139 ]]
        -- upvalues: v38 (copy), l_OpenAmpWizardContainer_0 (ref)
        v38(l_OpenAmpWizardContainer_0(v46, v47, v48, v49));
    end, {
        v38
    });
    local v55 = v4.useCallback(function(v51, v52, v53, v54) --[[ Line: 146 ]]
        -- upvalues: v38 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref)
        v38(l_NavigateDown_0({
            name = l_AppPage_0.AccountSettingsUpsell, 
            extraProps = {
                featureName = v51, 
                localizationStrings = v52, 
                onCloseModal = v53, 
                onCancelled = v54
            }
        }, true));
    end, {
        v38
    });
    local v63 = v4.useCallback(function(v56, v57, v58, v59, v60, v61, v62) --[[ Line: 161 ]]
        -- upvalues: v38 (copy), l_OpenUpsellModal_0 (ref)
        v38(l_OpenUpsellModal_0(v56, v57, v58, v59, v60, v61, v62));
    end, {
        v38
    });
    local v69 = v4.useCallback(function(v64, v65, v66, v67, v68) --[[ Line: 185 ]]
        -- upvalues: v38 (copy), l_OpenCloseOnlyInteractiveAlert_0 (ref)
        v38(l_OpenCloseOnlyInteractiveAlert_0(v64, v65, v66, v67, v68));
    end, {
        v38
    });
    local v70 = v4.useCallback(function() --[[ Line: 189 ]]
        -- upvalues: v38 (copy), l_NavigateBack_0 (ref)
        v38(l_NavigateBack_0(true));
    end, {
        v38
    });
    local v71 = v4.useCallback(function() --[[ Line: 193 ]]
        -- upvalues: v38 (copy), l_CloseCentralOverlay_0 (ref)
        v38(l_CloseCentralOverlay_0());
    end, {
        v38
    });
    local v72 = v4.useCallback(function() --[[ Line: 197 ]]
        -- upvalues: v38 (copy), v2 (ref), v36 (copy), v34 (copy)
        v38(v2.Fetch(v36, v34, true));
    end, {
        v38, 
        v36, 
        v34
    });
    local v73 = v4.useCallback(function() --[[ Line: 201 ]]
        -- upvalues: v70 (copy), v72 (copy)
        v70();
        v72();
    end, {
        v70, 
        v72
    });
    local v74 = v4.useCallback(function() --[[ Line: 208 ]]
        -- upvalues: v71 (copy), l_FFlagLuaAppAskParentModalTelemetry_0 (ref), l_authButtonClick_0 (ref), v72 (copy)
        v71();
        if l_FFlagLuaAppAskParentModalTelemetry_0 then
            l_authButtonClick_0("gameJoinContentMaturityLock", "cancelAskParent");
        end;
        v72();
    end, {
        v71, 
        v72
    });
    local v76 = v4.useCallback(function(v75) --[[ Line: 219 ]]
        -- upvalues: v71 (copy), l_FFlagLuaAppAskParentModalTelemetry_0 (ref), l_authButtonClick_0 (ref), v50 (copy), v70 (copy)
        v71();
        if l_FFlagLuaAppAskParentModalTelemetry_0 then
            l_authButtonClick_0("gameJoinContentMaturityLock", "askParent");
        end;
        v50("CanChangeSetting", v70, {
            contentAgeRestriction = v75
        }, l_FFlagLuaAppAskParentModalTelemetry_0 and "gameJoinContentMaturityLock" or "gameJoinContentMaturityLock");
    end, {
        v50, 
        v70, 
        v71
    });
    local v77 = nil;
    if l_FFlagLuaAppUnlockPlayIntentEvent_0 then
        v77 = v4.useCallback(function(v78) --[[ Line: 234 ]]
            -- upvalues: l_unlockPlayIntent_0 (ref), v37 (ref), v34 (copy), l_PlayabilityStatusEnum_0 (ref)
            l_unlockPlayIntent_0(v37, {
                universeId = v34, 
                upsellName = v78, 
                playabilityStatus = l_PlayabilityStatusEnum_0.ContextualPlayabilityAgeRecommendationParentalControls
            });
        end, {
            v37, 
            v34
        });
    end;
    local v79 = nil;
    if l_FFlagLuaAppParentUpsellPolicy_0 then
        v79 = l_useAppPolicy_0(function(v80) --[[ Line: 245 ]]
            return v80.getShouldShowVpcPlayButtonUpsells();
        end);
    end;
    local v82 = l_useAppPolicy_0(function(v81) --[[ Line: 250 ]]
        return v81.getWebViewSupport();
    end);
    return (v4.useCallback(function(v83) --[[ Line: 254 ]]
        -- upvalues: l_FFlagLuaAppParentUpsellPolicy_0 (ref), v79 (ref), v35 (copy), l_FFlagLuaAppUnlockPlayIntentEvent_0 (ref), v77 (ref), l_FetchUserSettingsAndOptions_0 (ref), v36 (copy), v44 (copy), l_flaggedMutedError_0 (ref), v32 (ref), v24 (ref), v27 (ref), v34 (copy), v13 (ref), v33 (ref), v82 (copy), v69 (copy), v45 (copy), v71 (copy), v55 (copy), l_FFlagLuaAppAskParentModalTelemetry_0 (ref), v73 (copy), v63 (copy), v76 (copy), v74 (copy), v50 (copy), v72 (copy)
        if l_FFlagLuaAppParentUpsellPolicy_0 and not v79 then
            v35(v83);
            if l_FFlagLuaAppUnlockPlayIntentEvent_0 then
                v77("GameLaunch");
            end;
            return;
        else
            l_FetchUserSettingsAndOptions_0(v36):andThen(function(v84) --[[ Line: 265 ]]
                -- upvalues: v44 (ref), l_flaggedMutedError_0 (ref), v35 (ref), v83 (copy), l_FFlagLuaAppUnlockPlayIntentEvent_0 (ref), v77 (ref), v32 (ref), v24 (ref), v27 (ref), v34 (ref), v13 (ref), v33 (ref), v82 (ref), v69 (ref), v45 (ref), v71 (ref), v55 (ref), l_FFlagLuaAppAskParentModalTelemetry_0 (ref), v73 (ref), v63 (ref), v76 (ref), v74 (ref), v50 (ref), v72 (ref)
                local l_contentAgeRestriction_0 = v84.contentAgeRestriction;
                if not l_contentAgeRestriction_0 or not v44 then
                    l_flaggedMutedError_0("ExperienceParentalControlsUpsellUnknownMinimumAge", (("Unknown minimum age %* or age restriction setting %* for Contextual Parental Controls upsell on play button click"):format(v44, l_contentAgeRestriction_0)));
                    v35(v83);
                    if l_FFlagLuaAppUnlockPlayIntentEvent_0 then
                        v77("GameLaunch");
                    end;
                    return;
                else
                    assert(v44, "Minimum age must be present to show correct upsell");
                    local v86 = {
                        [-1] = v32 and "ThirteenPlus" or nil, 
                        [9] = "NinePlus", 
                        [13] = "ThirteenPlus", 
                        [17] = "SeventeenPlus", 
                        [18] = "EighteenPlus"
                    };
                    if not v86[v44] then
                        v24.default:logRobloxTelemetryEvent({
                            eventName = "ExperienceParentalControlsUpsellUnexpectedMinimumAge", 
                            backends = {
                                v24.TelemetryBackends.Points
                            }, 
                            throttlingPercentage = v27, 
                            lastUpdated = {
                                24, 
                                10, 
                                23
                            }, 
                            description = "Unexpected minimum age for Contextual Parental Controls upsell on play button click"
                        }, {
                            v24.default.StandardizedFields.addOsInfo
                        }, {
                            eventName = "ExperienceParentalControlsUpsellUnexpectedMinimumAge", 
                            minimumAge = v44, 
                            universeId = v34
                        });
                        v35(v83);
                        if l_FFlagLuaAppUnlockPlayIntentEvent_0 then
                            v77("GameLaunch");
                        end;
                        return;
                    else
                        local v87 = v86[v44];
                        local v89 = v13.find(l_contentAgeRestriction_0.options, function(v88) --[[ Line: 322 ]]
                            -- upvalues: v87 (copy)
                            return v88 and v88.option and v88.option.optionValue == v87 or false;
                        end);
                        if v89 then
                            local l_requirement_0 = v89.requirement;
                            if l_requirement_0 == v33.SelfUpdateSetting then
                                if not v82 then
                                    v69(v45.consoleSelfUpdateSettingTitleText, v45.consoleSelfUpdateSettingBodyText, v71, v45.consoleSelfUpdateSettingButtonText, true);
                                else
                                    v55(l_FFlagLuaAppAskParentModalTelemetry_0 and "gameJoinContentMaturityLock" or "gameJoinContentMaturityLock", {
                                        title = "Feature.ExperienceDetails.UpdateMaturitySettingModal.Label.Title", 
                                        message = "Feature.ExperienceDetails.UpdateMaturitySettingModal.Label.Body", 
                                        buttonCancel = "Feature.ExperienceDetails.UpdateMaturitySettingModal.Action.Cancel", 
                                        buttonSettings = "Feature.ExperienceDetails.UpdateMaturitySettingModal.Action.GoToSettings"
                                    }, v73, v73);
                                end;
                            elseif l_requirement_0 == v33.ParentalConsent then
                                v63(v45.askYourParentTitleText, v45.askYourParentBodyText, v45.askYourParentActionButtonText, v45.askYourParentCancelButtonText, function() --[[ Line: 358 ]]
                                    -- upvalues: v76 (ref), v89 (copy)
                                    v76(v89.option.optionValue);
                                end, v74, v74);
                            elseif l_requirement_0 == v33.ContentAgeRestrictionVerification then
                                v50("ShouldNotPromptSeventeenPlusSettingVerifications", v72, nil, nil);
                            else
                                l_flaggedMutedError_0("ExperienceParentalControlsUnknownUpsellRequirement", (("Unknown requirement %* for ContentAgeRestriction option %* on play button click"):format(l_requirement_0, v89)));
                                v35(v83);
                            end;
                            if l_FFlagLuaAppUnlockPlayIntentEvent_0 then
                                v77(l_requirement_0 or "GameLaunch");
                                return;
                            end;
                        else
                            v69(v45.unplayableTitleText, v45.unplayableBodyText, v71, v45.unplayableButtonText, true);
                            if l_FFlagLuaAppUnlockPlayIntentEvent_0 then
                                v77("RestrictedUnplayableOptionNotFound");
                            end;
                        end;
                        return;
                    end;
                end;
            end, function() --[[ Line: 400 ]]
                -- upvalues: v35 (ref), v83 (copy), l_FFlagLuaAppUnlockPlayIntentEvent_0 (ref), v77 (ref)
                v35(v83);
                if l_FFlagLuaAppUnlockPlayIntentEvent_0 then
                    v77("GameLaunch");
                end;
            end);
            return;
        end;
    end, {
        v36, 
        v34, 
        v35, 
        v44, 
        v38, 
        v55, 
        v50, 
        v69, 
        v63, 
        v76, 
        v73, 
        v74, 
        v71, 
        v77, 
        v45.unplayableTitleText, 
        v45.unplayableBodyText, 
        v45.unplayableButtonText, 
        v45.askYourParentTitleText, 
        v45.askYourParentBodyText, 
        v45.askYourParentActionButtonText, 
        v45.askYourParentCancelButtonText, 
        v45.consoleSelfUpdateSettingTitleText, 
        v45.consoleSelfUpdateSettingBodyText, 
        v45.consoleSelfUpdateSettingButtonText, 
        v79, 
        v82
    }));
end;