local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameTile");
local l_IXPService_0 = game:GetService("IXPService");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.Cryo);
local l_RoactServices_0 = require(l_Parent_0.RoactServices).RoactServices;
local v5 = require(l_Parent_0.RoactServiceTags);
local l_AppSessionService_0 = v5.AppSessionService;
local l_RoactNetworking_0 = v5.RoactNetworking;
local v8 = require(l_Parent_0.Roact);
local v9 = require(l_Parent_0.RoactRodux);
local v10 = require(l_Parent_0.t);
local v11 = require(l_Parent_0.UIBlox);
local l_ExperienceActionRow_0 = v11.App.Tile.ExperienceActionRow;
local l_Images_0 = v11.App.ImageSet.Images;
local l_ButtonType_0 = v11.App.Button.Enum.ButtonType;
local l_MenuDirection_0 = v11.App.Menu.MenuDirection;
local v16 = require(l_Parent_0.RobloxAppSessionization);
local l_SetGamePlaySession_0 = v16.SetGamePlaySession;
local l_SessionType_0 = v16.SessionType;
local l_withLocalization_0 = require(l_Parent_0.Localization).withLocalization;
local v20 = require(l_Parent_0.GamePlayButton);
local l_PlayButtonStates_0 = v20.PlayButtonStates;
local l_usePlayButtonState_0 = v20.usePlayButtonState;
local l_useOnPlaySquadButtonCallback_0 = v20.useOnPlaySquadButtonCallback;
local l_useOnPlayButtonCallback_0 = v20.useOnPlayButtonCallback;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_useUserExperiment_0 = require(l_Parent_0.RoactAppExperiment).useUserExperiment;
local l_AppUserLayers_0 = require(l_Parent_0.ExperimentLayers).AppUserLayers;
local l_GamesProductInfoReducer_0 = require(l_Parent_0.GameProductInfoRodux).GamesProductInfoReducer;
local l_PlayabilityStatusEnum_0 = require(l_Parent_0.PlayabilityRodux).Enums.PlayabilityStatusEnum;
local l_CentralOverlayType_0 = require(l_Parent_0.RobloxAppEnums).CentralOverlayType;
local l_CloseCentralOverlay_0 = require(l_Parent_0.CentralOverlay).Thunks.CloseCentralOverlay;
local l_GetFFlagEnableUISoundAndHaptics_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableUISoundAndHaptics;
local l_GetFFlagLuaAppEnableSquadPage_0 = require(l_Parent_0.SharedFlags).GetFFlagLuaAppEnableSquadPage;
local l_FFlagLuaAppPlayButtonUpdates_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppPlayButtonUpdates;
local l_GetFFlagLuaAppPlayButtonUpdatesIxp_0 = require(l_Parent_0.SharedFlags).GetFFlagLuaAppPlayButtonUpdatesIxp;
local l_FFlagLuaAppFiatPaidAccess_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppFiatPaidAccess;
local l_FFlagLuaAppPlayButtonExposeOnVpc_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppPlayButtonExposeOnVpc;
local l_FFlagLuaAppEnablePlaySquadButton_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppEnablePlaySquadButton;
local l_FFlagLuaAppEnablePlayableStateWhenLoading_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppEnablePlayableStateWhenLoading;
local v40 = v8.PureComponent:extend("AppExperienceActionRow");
v40.validateProps = v10.strictInterface({
    universeId = v10.string, 
    launchExperienceEventContext = v10.optional(v10.string), 
    referralSource = v10.optional(v10.string), 
    launchSource = v10.string, 
    reportExperienceLaunched = v10.optional(v10.callback), 
    entry = v10.table, 
    openGameDetails = v10.callback, 
    horizontalPadding = v10.optional(v10.number), 
    verticalPadding = v10.optional(v10.number), 
    height = v10.optional(v10.number), 
    fetchDelayInSeconds = v10.optional(v10.number), 
    index = v10.optional(v10.number), 
    showButtonText = v10.optional(v10.boolean), 
    price = v10.optional(v10.number), 
    centralOverlayType = v10.optional(v10.string), 
    closeCentralOverlay = v10.optional(v10.callback), 
    playButtonState = v10.string, 
    playabilityStatus = v10.optional(v10.table), 
    onPlayButtonActivated = v10.callback, 
    onPlaySquadButtonActivated = v10.optional(v10.callback), 
    hasUpdatedPlayButtonsIxp = v10.optional(v10.boolean), 
    sessionService = v10.optional(v10.union(v10.Instance, v10.table)), 
    feedbackType = v10.optional(v10.string)
});
local function _(v41) --[[ Line: 91 ]] --[[ Name: modifyPlayButtonState ]]
    -- upvalues: l_PlayButtonStates_0 (copy)
    if v41 == l_PlayButtonStates_0.Loading then
        return l_PlayButtonStates_0.Playable;
    else
        return v41;
    end;
end;
v40.init = function(v43) --[[ Line: 100 ]] --[[ Name: init ]]
    -- upvalues: l_FFlagLuaAppFiatPaidAccess_0 (copy), l_SetGamePlaySession_0 (copy), l_SessionType_0 (copy)
    v43.onPlayPressed = function() --[[ Line: 101 ]]
        -- upvalues: v43 (copy), l_FFlagLuaAppFiatPaidAccess_0 (ref), l_SetGamePlaySession_0 (ref), l_SessionType_0 (ref)
        if v43:requiresPurchase() or l_FFlagLuaAppFiatPaidAccess_0 and v43:requiresFiatPurchase() then
            v43.props.openGameDetails();
            return;
        else
            if v43:isButtonEnabled() then
                l_SetGamePlaySession_0(v43.props.sessionService, l_SessionType_0.StructuralIdentifier.GamePlayFromHoverTile, true);
                local v44 = if v43.props.reportExperienceLaunched then v43.reportExperienceLaunched else nil;
                v43.props.onPlayButtonActivated(v43.props.playButtonState, v44);
            end;
            return;
        end;
    end;
    v43.reportExperienceLaunched = function() --[[ Line: 115 ]]
        -- upvalues: v43 (copy)
        v43.props.reportExperienceLaunched(v43.props.entry, v43.props.referralSource, v43.props.launchSource, v43.props.launchExperienceEventContext, v43.props.index);
    end;
end;
v40.willUnmount = function(v45) --[[ Line: 126 ]] --[[ Name: willUnmount ]]
    -- upvalues: l_FFlagLuaAppEnablePlaySquadButton_0 (copy), l_CentralOverlayType_0 (copy)
    if l_FFlagLuaAppEnablePlaySquadButton_0 and v45.props.centralOverlayType == l_CentralOverlayType_0.GameDetailsSquad then
        v45.props.closeCentralOverlay();
    end;
end;
v40.render = function(v46) --[[ Line: 133 ]] --[[ Name: render ]]
    -- upvalues: l_withLocalization_0 (copy), l_FFlagLuaAppFiatPaidAccess_0 (copy), v8 (copy), l_ExperienceActionRow_0 (copy), l_FFlagLuaAppPlayButtonUpdates_0 (copy), l_FFlagLuaAppEnablePlaySquadButton_0 (copy), l_GetFFlagEnableUISoundAndHaptics_0 (copy)
    return l_withLocalization_0({
        privateText = "Feature.ExperienceDetails.PlayButtonText.Private", 
        actionNeededText = "Feature.ExperienceDetails.PlayButtonText.ActionNeeded", 
        unavailableText = "Feature.ExperienceDetails.PlayButtonText.Unavailable", 
        buyText = l_FFlagLuaAppFiatPaidAccess_0 and "Feature.ExperienceDetails.PlayButtonText.Buy" or nil
    })(function(v47) --[[ Line: 139 ]]
        -- upvalues: v8 (ref), l_ExperienceActionRow_0 (ref), v46 (copy), l_FFlagLuaAppPlayButtonUpdates_0 (ref), l_FFlagLuaAppEnablePlaySquadButton_0 (ref), l_GetFFlagEnableUISoundAndHaptics_0 (ref)
        return v8.createElement(l_ExperienceActionRow_0, {
            isActionable = v46:isButtonEnabled(), 
            text = v46:getButtonText(v47), 
            icon = v46:getButtonIcon(), 
            buttonType = if l_FFlagLuaAppPlayButtonUpdates_0 then v46:getButtonType() else nil, 
            onPlayPressed = v46.onPlayPressed, 
            onOverflowPressed = if l_FFlagLuaAppEnablePlaySquadButton_0 and v46:isOverflowButtonVisible() then v46.props.onPlaySquadButtonActivated else nil, 
            horizontalPadding = v46.props.horizontalPadding, 
            verticalPadding = v46.props.verticalPadding, 
            height = v46.props.height, 
            feedbackType = l_GetFFlagEnableUISoundAndHaptics_0() and "PlayExperienceButton" or nil
        });
    end);
end;
v40.isOverflowButtonVisible = function(v48) --[[ Line: 157 ]] --[[ Name: isOverflowButtonVisible ]]
    -- upvalues: l_FFlagLuaAppEnablePlaySquadButton_0 (copy), l_PlayButtonStates_0 (copy)
    return l_FFlagLuaAppEnablePlaySquadButton_0 and (v48.props.playButtonState == l_PlayButtonStates_0.PlayableWithParty or v48.props.playButtonState == l_PlayButtonStates_0.WaitingForParty);
end;
v40.isButtonEnabled = function(v49) --[[ Line: 167 ]] --[[ Name: isButtonEnabled ]]
    -- upvalues: l_FFlagLuaAppEnablePlayableStateWhenLoading_0 (copy), l_GetFFlagLuaAppEnableSquadPage_0 (copy), l_PlayButtonStates_0 (copy), l_FFlagLuaAppPlayButtonUpdates_0 (copy), l_FFlagLuaAppFiatPaidAccess_0 (copy)
    if l_FFlagLuaAppEnablePlayableStateWhenLoading_0 and v49.props.playabilityStatus == nil and l_GetFFlagLuaAppEnableSquadPage_0() and v49.props.playButtonState == l_PlayButtonStates_0.WaitingForParty then
        return false;
    else
        local v50 = true;
        if v49.props.playabilityStatus ~= nil then
            v50 = true;
            if v49.props.playButtonState ~= l_PlayButtonStates_0.Playable then
                v50 = true;
                if v49.props.playButtonState ~= l_PlayButtonStates_0.Loading then
                    v50 = l_GetFFlagLuaAppEnableSquadPage_0() and v49.props.playButtonState == l_PlayButtonStates_0.PlayableWithParty or l_FFlagLuaAppPlayButtonUpdates_0 and v49:isActionNeeded() or v49:requiresPurchase() or l_FFlagLuaAppFiatPaidAccess_0 and v49:requiresFiatPurchase();
                end;
            end;
        end;
        return v50;
    end;
end;
if l_FFlagLuaAppFiatPaidAccess_0 then
    v40.requiresFiatPurchase = function(v51) --[[ Line: 193 ]] --[[ Name: requiresFiatPurchase ]]
        -- upvalues: l_PlayButtonStates_0 (copy)
        return v51.props.playButtonState == l_PlayButtonStates_0.FiatPaidAccess;
    end;
end;
v40.requiresPurchase = function(v52) --[[ Line: 198 ]] --[[ Name: requiresPurchase ]]
    -- upvalues: l_PlayButtonStates_0 (copy)
    return v52.props.playButtonState == l_PlayButtonStates_0.PaidAccess;
end;
v40.isPrivate = function(v53) --[[ Line: 202 ]] --[[ Name: isPrivate ]]
    -- upvalues: l_PlayButtonStates_0 (copy)
    return v53.props.playButtonState == l_PlayButtonStates_0.Private;
end;
if l_FFlagLuaAppPlayButtonUpdates_0 then
    v40.isActionNeeded = function(v54) --[[ Line: 207 ]] --[[ Name: isActionNeeded ]]
        -- upvalues: l_PlayButtonStates_0 (copy)
        return v54.props.playButtonState == l_PlayButtonStates_0.ActionNeeded;
    end;
end;
v40.getButtonText = function(v55, v56) --[[ Line: 212 ]] --[[ Name: getButtonText ]]
    -- upvalues: l_FFlagLuaAppPlayButtonUpdates_0 (copy), l_GetFFlagLuaAppPlayButtonUpdatesIxp_0 (copy), l_FFlagLuaAppEnablePlaySquadButton_0 (copy), l_PlayButtonStates_0 (copy), l_FFlagLuaAppFiatPaidAccess_0 (copy)
    local v57 = l_FFlagLuaAppPlayButtonUpdates_0 and (not l_GetFFlagLuaAppPlayButtonUpdatesIxp_0() or v55.props.hasUpdatedPlayButtonsIxp);
    if v57 and v55.props.showButtonText then
        if v55:isActionNeeded() then
            return v56.actionNeededText;
        elseif not v55:isButtonEnabled() then
            if l_FFlagLuaAppEnablePlaySquadButton_0 and v55.props.playButtonState == l_PlayButtonStates_0.WaitingForParty then
                return nil;
            else
                return v56.unavailableText;
            end;
        end;
    end;
    if not v57 and v55:isPrivate() then
        return v56.privateText;
    elseif v55:requiresPurchase() then
        return (tostring(v55.props.price or "--"));
    elseif l_FFlagLuaAppFiatPaidAccess_0 and v55:requiresFiatPurchase() then
        return v56.buyText;
    else
        return nil;
    end;
end;
if l_FFlagLuaAppPlayButtonUpdates_0 then
    v40.getButtonType = function(v58) --[[ Line: 243 ]] --[[ Name: getButtonType ]]
        -- upvalues: l_GetFFlagLuaAppPlayButtonUpdatesIxp_0 (copy), l_ButtonType_0 (copy)
        local v59 = not l_GetFFlagLuaAppPlayButtonUpdatesIxp_0() or v58.props.hasUpdatedPlayButtonsIxp;
        if v59 and v58:isActionNeeded() then
            return l_ButtonType_0.PrimarySystem;
        elseif v59 and not v58:isButtonEnabled() then
            return l_ButtonType_0.Secondary;
        else
            return l_ButtonType_0.PrimaryContextual;
        end;
    end;
end;
v40.getButtonIcon = function(v60) --[[ Line: 257 ]] --[[ Name: getButtonIcon ]]
    -- upvalues: l_FFlagLuaAppPlayButtonUpdates_0 (copy), l_GetFFlagLuaAppPlayButtonUpdatesIxp_0 (copy), l_Images_0 (copy), l_FFlagLuaAppFiatPaidAccess_0 (copy), l_FFlagLuaAppEnablePlaySquadButton_0 (copy), l_PlayButtonStates_0 (copy)
    local v61 = l_FFlagLuaAppPlayButtonUpdates_0 and (not l_GetFFlagLuaAppPlayButtonUpdatesIxp_0() or v60.props.hasUpdatedPlayButtonsIxp);
    if not v61 and v60:isPrivate() then
        return l_Images_0["icons/status/private"];
    elseif v61 and v60:isActionNeeded() then
        return l_Images_0["icons/status/private"];
    elseif v60:requiresPurchase() then
        return l_Images_0["icons/common/robux"];
    elseif l_FFlagLuaAppFiatPaidAccess_0 and v60:requiresFiatPurchase() then
        return nil;
    elseif not v60:isButtonEnabled() then
        if l_FFlagLuaAppEnablePlaySquadButton_0 and v60.props.playButtonState == l_PlayButtonStates_0.WaitingForParty then
            return l_Images_0["icons/common/play"];
        else
            return l_Images_0["icons/status/unavailable"];
        end;
    else
        return l_Images_0["icons/common/play"];
    end;
end;
local l_v40_0 = v40;
v40 = v9.connect(function(v63, v64) --[[ Line: 348 ]]
    -- upvalues: l_GamesProductInfoReducer_0 (copy), l_FFlagLuaAppEnablePlaySquadButton_0 (copy)
    local l_universeId_0 = v64.universeId;
    local v66 = if v63[l_GamesProductInfoReducer_0.key] then v63[l_GamesProductInfoReducer_0.key][l_universeId_0] else nil;
    return {
        price = if v66 ~= nil then v66.price else nil, 
        centralOverlayType = if l_FFlagLuaAppEnablePlaySquadButton_0 then v63.CentralOverlay.OverlayType else nil
    };
end, function(v67) --[[ Line: 357 ]]
    -- upvalues: l_CloseCentralOverlay_0 (copy)
    return {
        closeCentralOverlay = function() --[[ Line: 359 ]] --[[ Name: closeCentralOverlay ]]
            -- upvalues: v67 (copy), l_CloseCentralOverlay_0 (ref)
            return v67(l_CloseCentralOverlay_0());
        end
    };
end)(function(v68) --[[ Line: 281 ]]
    -- upvalues: l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), l_GetFFlagLuaAppPlayButtonUpdatesIxp_0 (copy), l_useUserExperiment_0 (copy), l_AppUserLayers_0 (copy), l_usePlayButtonState_0 (copy), l_FFlagLuaAppEnablePlayableStateWhenLoading_0 (copy), l_PlayButtonStates_0 (copy), l_PlayabilityStatusEnum_0 (copy), l_FFlagLuaAppPlayButtonExposeOnVpc_0 (copy), l_IXPService_0 (copy), l_useOnPlayButtonCallback_0 (copy), l_FFlagLuaAppEnablePlaySquadButton_0 (copy), l_useOnPlaySquadButtonCallback_0 (copy), l_MenuDirection_0 (copy), v3 (copy), v8 (copy), l_v40_0 (copy)
    local v69 = l_useRoactService_0(l_RoactNetworking_0);
    local v71 = if l_GetFFlagLuaAppPlayButtonUpdatesIxp_0() then l_useUserExperiment_0({
        l_AppUserLayers_0.PlayButtonUXExposureLayer
    }, function(v70) --[[ Line: 284 ]]
        -- upvalues: l_AppUserLayers_0 (ref)
        return (v70[l_AppUserLayers_0.PlayButtonUXExposureLayer] or {}).HasUpdatedPlayButtons;
    end, false) else nil;
    local v72 = l_usePlayButtonState_0(v69, v68.universeId, v68.fetchDelayInSeconds, if l_GetFFlagLuaAppPlayButtonUpdatesIxp_0() then v71 else nil, l_FFlagLuaAppEnablePlayableStateWhenLoading_0 and true or nil);
    if l_GetFFlagLuaAppPlayButtonUpdatesIxp_0() then
        local v73 = v72.playabilityStatus and v72.playabilityStatus.playabilityStatus;
        if v72.playButtonState == l_PlayButtonStates_0.UnplayableOther or v72.playButtonState == l_PlayButtonStates_0.Private or v73 == l_PlayabilityStatusEnum_0.ContextualPlayabilityUnverifiedSeventeenPlusUser or l_FFlagLuaAppPlayButtonExposeOnVpc_0 and v73 == l_PlayabilityStatusEnum_0.ContextualPlayabilityAgeRecommendationParentalControls then
            l_IXPService_0:LogUserLayerExposure(l_AppUserLayers_0.PlayButtonUXExposureLayer);
        end;
    end;
    local v74 = l_useOnPlayButtonCallback_0(v68.universeId, v68.referralSource, v68.launchExperienceEventContext or "PlayButton", nil, v68.launchSource or "UnknownLaunchSource", nil, if l_GetFFlagLuaAppPlayButtonUpdatesIxp_0() then v71 else nil);
    local v75 = if l_FFlagLuaAppEnablePlaySquadButton_0 then l_useOnPlaySquadButtonCallback_0(l_MenuDirection_0.Up, v72.playButtonState, v68.referralSource, v68.universeId) else nil;
    local l_join_0 = v3.Dictionary.join;
    local l_v68_0 = v68;
    local v78 = {
        playabilityStatus = v72.playabilityStatus, 
        onPlayButtonActivated = v74, 
        onPlaySquadButtonActivated = v75
    };
    local v79;
    if l_FFlagLuaAppEnablePlayableStateWhenLoading_0 then
        v79 = v72.playButtonState;
    else
        local l_playButtonState_0 = v72.playButtonState;
        v79 = if l_playButtonState_0 == l_PlayButtonStates_0.Loading then l_PlayButtonStates_0.Playable else l_playButtonState_0;
    end;
    v78.playButtonState = v79;
    v78.hasUpdatedPlayButtonsIxp = if l_GetFFlagLuaAppPlayButtonUpdatesIxp_0() then v71 else nil;
    l_join_0 = l_join_0(l_v68_0, v78);
    return v8.createElement(l_v40_0, l_join_0);
end);
return (l_RoactServices_0.connect({
    sessionService = l_AppSessionService_0
})(v40));