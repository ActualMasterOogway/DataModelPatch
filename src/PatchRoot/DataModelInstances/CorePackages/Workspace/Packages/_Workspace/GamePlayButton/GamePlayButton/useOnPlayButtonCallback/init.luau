local l_script_FirstAncestor_0 = script:FindFirstAncestor("GamePlayButton");
local v1 = require(l_script_FirstAncestor_0.ApiPostPreparePurchase);
local v2 = require(l_script_FirstAncestor_0.GamePlayButtonShareLinkAnalytics);
local v3 = require(l_script_FirstAncestor_0.OpenCentralOverlayForPurchaseGame);
local v4 = require(l_script_FirstAncestor_0.PlayButtonReferralSource);
local v5 = require(l_script_FirstAncestor_0.PlayButtonStates);
local _ = require(l_script_FirstAncestor_0.PlayButtonTypes);
local v7 = require(l_script_FirstAncestor_0.PlayButtonLaunchChecks.usePlayButtonLaunchAfterSeventeenPlusUpsell);
local v8 = require(l_script_FirstAncestor_0.PlayButtonLaunchChecks.usePlayButtonLaunchGame);
local v9 = require(l_script_FirstAncestor_0.PlayButtonLaunchChecks.useAgeVerificationOverlayCallback);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v11 = require(l_Parent_0.React);
local v12 = require(l_Parent_0.RoactUtils);
local l_useDispatch_0 = v12.Hooks.RoactRodux.useDispatch;
local l_useSelector_0 = v12.Hooks.RoactRodux.useSelector;
local l_useRouteName_0 = require(l_Parent_0.Navigation).useRouteName;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local v17 = require(l_Parent_0.RoactServiceTags);
local l_RoactAnalytics_0 = v17.RoactAnalytics;
local l_RoactNetworking_0 = v17.RoactNetworking;
local l_AppUpdateService_0 = v17.AppUpdateService;
local l_joinGamePlayButton_0 = require(l_Parent_0.DiscoveryAnalytics).Points.joinGamePlayButton;
local l_unlockPlayIntent_0 = require(l_Parent_0.DiscoveryAnalytics).Events.unlockPlayIntent;
local l_AppEventIngestService_0 = require(l_Parent_0.RoactServiceTags).AppEventIngestService;
local l_LaunchErrorLocalizationKeys_0 = require(l_Parent_0.GameLaunch).LaunchErrorLocalizationKeys;
local l_PlayabilityStatusEnum_0 = require(l_Parent_0.PlayabilityRodux).Enums.PlayabilityStatusEnum;
local v26 = require(l_Parent_0.ToastRodux);
local l_SetCurrentToastMessage_0 = v26.Actions.SetCurrentToastMessage;
local l_ToastType_0 = v26.Enums.ToastType;
local l_getAppFeaturePolicies_0 = require(l_Parent_0.UniversalAppPolicy).getAppFeaturePolicies;
local l_Localization_0 = require(l_Parent_0.RobloxAppLocales).Localization;
local l_CheckForUpdate_0 = require(l_Parent_0.RobloxAppUpdate).Thunks.CheckForUpdate;
local l_useGameProductInfoSelector_0 = require(l_Parent_0.GameProductInfoRodux).useGameProductInfoSelector;
local l_useGameInfosSelector_0 = require(l_Parent_0.GameInfosRodux).useGameInfosSelector;
local l_FFlagAXPassGameJoinContext_0 = require(l_Parent_0.SharedFlags).FFlagAXPassGameJoinContext;
local l_GetFFlagLuaAppEnableSquadPage_0 = require(l_Parent_0.SharedFlags).GetFFlagLuaAppEnableSquadPage;
local l_FFlagLuaAppPlayButtonUpdates_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppPlayButtonUpdates;
local l_GetFFlagLuaAppPlayButtonUpdatesIxp_0 = require(l_Parent_0.SharedFlags).GetFFlagLuaAppPlayButtonUpdatesIxp;
local l_FFlagLuaAppUnplayableActivatedNoOp_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppUnplayableActivatedNoOp;
local l_GetFFlagLuaAppEnableVirtualEventPlaceId_0 = require(l_Parent_0.SharedFlags).GetFFlagLuaAppEnableVirtualEventPlaceId;
local l_FFlagLuaAppFiatPaidAccess_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppFiatPaidAccess;
local l_CreateExperienceInvite_0 = require(l_Parent_0.Squads).Thunks.CreateExperienceInvite;
local l_SquadExternalContractContext_0 = require(l_Parent_0.SquadsCore).SquadExternalContractProvider.SquadExternalContractContext;
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_game_EngineFeature_0 = game:GetEngineFeature("AutoUpgradeEngineFeatureOnly");
local l_game_EngineFeature_1 = game:GetEngineFeature("CanPerformBinaryUpdateEnabled");
local v46 = game:DefineFastFlag("IncludeWaitingForPartyInCondition", false);
local v47 = nil;
local v48 = "";
local function _(v49, v50) --[[ Line: 68 ]] --[[ Name: translateString ]]
    -- upvalues: l_LocalizationService_0 (copy), v47 (ref), l_Localization_0 (copy), v48 (ref)
    local l_RobloxLocaleId_0 = l_LocalizationService_0.RobloxLocaleId;
    if v47 == nil then
        v47 = l_Localization_0.new(l_RobloxLocaleId_0);
        v48 = l_RobloxLocaleId_0;
    end;
    if v48 ~= l_RobloxLocaleId_0 then
        v47:SetLocale(l_RobloxLocaleId_0);
        v48 = l_RobloxLocaleId_0;
    end;
    return v47:Format(v49, v50);
end;
local function v62(v53, v54, v55, v56) --[[ Line: 82 ]] --[[ Name: setLaunchError ]]
    -- upvalues: l_PlayabilityStatusEnum_0 (copy), l_FFlagLuaAppFiatPaidAccess_0 (copy), l_getAppFeaturePolicies_0 (copy), l_LocalizationService_0 (copy), v47 (ref), l_Localization_0 (copy), v48 (ref), l_LaunchErrorLocalizationKeys_0 (copy), l_SetCurrentToastMessage_0 (copy), l_ToastType_0 (copy)
    local v57 = nil;
    local v58 = nil;
    if v53 == nil or (v54.playabilityStatus == l_PlayabilityStatusEnum_0.PurchaseRequired or l_FFlagLuaAppFiatPaidAccess_0 and v54.playabilityStatus == l_PlayabilityStatusEnum_0.FiatPurchaseRequired) and (v55 == nil or v55.isForSale == false) then
        v57 = "Feature.ExperienceDetails.UnplayableError.UnplayableOther";
    else
        if v54.playabilityStatus == l_PlayabilityStatusEnum_0.DeviceRestricted then
            local v59 = l_getAppFeaturePolicies_0().getPlatformDisplayName() or "";
            if v59 ~= "" then
                local v60 = {
                    device = v59
                };
                local l_RobloxLocaleId_1 = l_LocalizationService_0.RobloxLocaleId;
                if v47 == nil then
                    v47 = l_Localization_0.new(l_RobloxLocaleId_1);
                    v48 = l_RobloxLocaleId_1;
                end;
                if v48 ~= l_RobloxLocaleId_1 then
                    v47:SetLocale(l_RobloxLocaleId_1);
                    v48 = l_RobloxLocaleId_1;
                end;
                v57 = v47:Format("Feature.ExperienceDetails.UnplayableError.DeviceRestrictedCustom", v60);
                v58 = true;
            end;
        end;
        if not v57 then
            v57 = l_LaunchErrorLocalizationKeys_0[v54.playabilityStatus];
        end;
    end;
    v56(l_SetCurrentToastMessage_0({
        toastType = l_ToastType_0.PlayButtonError, 
        toastMessage = v57, 
        isLocalized = v58
    }));
end;
return function(v63, v64, v65, _, v67, v68, v69, v70) --[[ Line: 125 ]]
    -- upvalues: l_useRoactService_0 (copy), l_RoactAnalytics_0 (copy), l_AppUpdateService_0 (copy), l_FFlagLuaAppFiatPaidAccess_0 (copy), l_AppEventIngestService_0 (copy), l_useDispatch_0 (copy), l_useSelector_0 (copy), l_useGameInfosSelector_0 (copy), l_useGameProductInfoSelector_0 (copy), l_useRouteName_0 (copy), l_GetFFlagLuaAppEnableSquadPage_0 (copy), v11 (copy), l_SquadExternalContractContext_0 (copy), l_GetFFlagLuaAppEnableVirtualEventPlaceId_0 (copy), v8 (copy), l_FFlagAXPassGameJoinContext_0 (copy), v7 (copy), v9 (copy), l_RoactNetworking_0 (copy), l_joinGamePlayButton_0 (copy), v4 (copy), v2 (copy), l_FFlagLuaAppPlayButtonUpdates_0 (copy), l_GetFFlagLuaAppPlayButtonUpdatesIxp_0 (copy), v5 (copy), l_game_EngineFeature_0 (copy), l_CheckForUpdate_0 (copy), l_game_EngineFeature_1 (copy), v62 (copy), v3 (copy), v1 (copy), l_unlockPlayIntent_0 (copy), l_CreateExperienceInvite_0 (copy), v46 (copy), l_FFlagLuaAppUnplayableActivatedNoOp_0 (copy)
    local v71 = l_useRoactService_0(l_RoactAnalytics_0);
    local v72 = l_useRoactService_0(l_AppUpdateService_0);
    local v73 = nil;
    if l_FFlagLuaAppFiatPaidAccess_0 then
        v73 = l_useRoactService_0(l_AppEventIngestService_0);
    end;
    local v74 = l_useDispatch_0();
    local v76 = l_useSelector_0(function(v75) --[[ Line: 143 ]]
        -- upvalues: v63 (copy)
        return v75.GameDetails[v63];
    end);
    local v77 = l_useGameInfosSelector_0(v63);
    local v78 = l_useGameProductInfoSelector_0(v63);
    local v80 = l_useSelector_0(function(v79) --[[ Line: 148 ]]
        -- upvalues: v63 (copy)
        return v79.PlayabilityStatus[v63];
    end);
    local v81 = l_useRouteName_0();
    local v82 = if l_GetFFlagLuaAppEnableSquadPage_0() then v11.useContext(l_SquadExternalContractContext_0) else nil;
    local v83 = v76 and v76.rootPlaceId or v77 and v77.placeId or nil;
    v70 = if l_GetFFlagLuaAppEnableVirtualEventPlaceId_0() and v70 ~= "0" then v70 or v83 else v83;
    local v84 = v76 and v76.name or v77 and v77.name or nil;
    local v85 = v8(v63, v70, v83, v64, v65, v67, l_FFlagAXPassGameJoinContext_0 and v68 or nil);
    local v86 = v7(v80, v63, v85);
    local v87 = v9(v63, v85, v86);
    local v88 = if l_FFlagLuaAppFiatPaidAccess_0 then l_useRoactService_0(l_RoactNetworking_0) else nil;
    return (v11.useCallback(function(v89, v90) --[[ Line: 187 ]]
        -- upvalues: l_joinGamePlayButton_0 (ref), v71 (copy), v64 (copy), v83 (copy), v65 (copy), v4 (ref), v2 (ref), l_GetFFlagLuaAppEnableVirtualEventPlaceId_0 (ref), v70 (ref), v63 (copy), l_FFlagLuaAppPlayButtonUpdates_0 (ref), l_GetFFlagLuaAppPlayButtonUpdatesIxp_0 (ref), v69 (copy), v5 (ref), v87 (copy), v86 (copy), l_game_EngineFeature_0 (ref), v74 (copy), l_CheckForUpdate_0 (ref), v72 (copy), l_game_EngineFeature_1 (ref), v62 (ref), v80 (copy), v78 (copy), v3 (ref), v84 (copy), v81 (copy), l_FFlagLuaAppFiatPaidAccess_0 (ref), v1 (ref), v88 (copy), l_unlockPlayIntent_0 (ref), v73 (ref), l_GetFFlagLuaAppEnableSquadPage_0 (ref), l_CreateExperienceInvite_0 (ref), v82 (copy), v46 (ref), l_FFlagLuaAppUnplayableActivatedNoOp_0 (ref)
        l_joinGamePlayButton_0(v71.InfluxDb, "playButtonClicked", {
            isUniversalApp = true, 
            referralSource = v64, 
            placeId = v83, 
            buttonState = v89 and v89 or "Invalid", 
            ctx = v65
        });
        if v64 == v4.ExperienceDetailsLink then
            v2(v71, {
                placeId = if l_GetFFlagLuaAppEnableVirtualEventPlaceId_0() then v70 else v83, 
                playButtonState = v89, 
                universeId = v63
            });
        end;
        local v91 = l_FFlagLuaAppPlayButtonUpdates_0 and (not l_GetFFlagLuaAppPlayButtonUpdatesIxp_0() or v69);
        if v89 == v5.Playable or l_FFlagLuaAppPlayButtonUpdates_0 and v89 == v5.ActionNeeded then
            local v92 = nil;
            v92 = game:GetEngineFeature("VoiceChatSupported") and function() --[[ Line: 212 ]]
                -- upvalues: v87 (ref), v90 (copy)
                v87(v90);
            end or function() --[[ Line: 216 ]]
                -- upvalues: v86 (ref), v90 (copy)
                v86(v90);
            end;
            if l_game_EngineFeature_0 then
                v74(l_CheckForUpdate_0(v72, l_game_EngineFeature_1, v71, v92, {
                    ctx = v65
                }));
                return;
            else
                v92();
                return;
            end;
        elseif not v91 and (v89 == v5.UnplayableOther or v89 == v5.Private) then
            v62(v83, v80, v78, v74);
            return;
        elseif v89 == v5.PaidAccess then
            local v93 = v78 and v78.price or nil;
            local v94 = v78 and v78.productId or nil;
            local v95 = v78 and v78.sellerId or nil;
            v74(v3(v63, v84, v93, v94, v95, {
                v81
            }));
            return;
        else
            if l_FFlagLuaAppFiatPaidAccess_0 and v89 == v5.FiatPaidAccess then
                if v83 and v78 and v78.fiatBasePriceId then
                    v74(v1.Fetch(v88, v83, v63, v78.fiatBasePriceId));
                    l_unlockPlayIntent_0(v73, {
                        universeId = v63, 
                        upsellName = "FiatPurchase", 
                        playabilityStatus = v80 and v80.playabilityStatus or nil
                    });
                    return;
                end;
            elseif v89 == v5.Loading then
                return;
            elseif l_GetFFlagLuaAppEnableSquadPage_0() and v89 == v5.PlayableWithParty then
                if v83 then
                    v74(l_CreateExperienceInvite_0(v83, v82));
                    return;
                end;
            elseif v46 and v89 == v5.WaitingForParty then
                return;
            elseif v91 and v89 == v5.UnplayableOther then
                if l_FFlagLuaAppUnplayableActivatedNoOp_0 then
                    return;
                else
                    error("Play button should never be activated while play button state is UnplayableOther");
                    return;
                end;
            else
                error((("invalid play button state %*!"):format(v89)));
            end;
            return;
        end;
    end, {
        v71, 
        v72, 
        l_game_EngineFeature_1, 
        v63, 
        if l_GetFFlagLuaAppEnableVirtualEventPlaceId_0() then v70 else nil, 
        v83, 
        v84, 
        v64, 
        v65, 
        v87, 
        v86, 
        v78, 
        v81, 
        if l_GetFFlagLuaAppPlayButtonUpdatesIxp_0() then v69 else nil, 
        if l_GetFFlagLuaAppEnableSquadPage_0() then v82 else nil
    }));
end;