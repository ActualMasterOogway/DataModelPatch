local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("DiscoveryMonolith");
local l_IXPService_0 = game:GetService("IXPService");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v4 = require(l_Parent_0.Roact);
local v5 = require(l_Parent_0.RoactRodux);
local v6 = require(l_Parent_0.t);
local v7 = require(l_Parent_0.UIBlox);
local l_StyledTextLabel_0 = v7.App.Text.StyledTextLabel;
local l_VoteStates_0 = v7.App.Indicator.Enum.VoteStates;
local l_RateCount_0 = v7.App.Indicator.RateCount;
local l_withStyle_0 = v7.Core.Style.withStyle;
local l_RoactServices_0 = require(l_Parent_0.RoactServices).RoactServices;
local l_RoactNetworking_0 = require(l_Parent_0.RoactServiceTags).RoactNetworking;
local l_AppEventIngestService_0 = require(l_Parent_0.RoactServiceTags).AppEventIngestService;
local l_RoactAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).RoactAppPolicy;
local l_memoize_0 = require(l_Parent_0.AppCommonLib).memoize;
local l_Localization_0 = require(l_Parent_0.RobloxAppLocales).Localization;
local l_abbreviateCount_0 = require(l_Parent_0.Localization).abbreviateCount;
local l_UiMode_0 = require(l_Parent_0.RobloxAppEnums).UiMode;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local v22 = require(l_Parent_0.GameVotesRodux);
local l_FetchGameVotes_0 = v22.GameVotes.FetchGameVotes;
local l_FetchUserGameVotes_0 = v22.UserGameVotes.FetchUserGameVotes;
local l_PatchUserVotes_0 = v22.UserGameVotes.PatchUserVotes;
local l_ReasonForNotVoteable_0 = v22.Enums.ReasonForNotVoteable;
local l_VoteStatus_0 = v22.Enums.VoteStatus;
local l_RetrievalStatus_0 = require(l_Parent_0.Http).Enum.RetrievalStatus;
local l_ToastType_0 = require(l_Parent_0.ToastRodux).Enums.ToastType;
local l_SetCurrentToastMessage_0 = require(l_Parent_0.ToastRodux).Actions.SetCurrentToastMessage;
local l_GameInfosReducer_0 = require(l_Parent_0.GameInfosRodux).GameInfosReducer;
local v32 = require(l_Parent_0.RoactAppExperiment);
local l_AppUserLayers_0 = require(l_Parent_0.ExperimentLayers).AppUserLayers;
local l_GamePlayerFeedbackPrompt_0 = require(l_Parent_0.PlayerFeedback).GamePlayerFeedbackPrompt;
local l_GetGamePlayerFeedbackMetadata_0 = require(l_Parent_0.PlayerFeedback).Thunks.GetGamePlayerFeedbackMetadata;
local l_SetCentralOverlay_0 = require(l_Parent_0.CentralOverlay).Actions.SetCentralOverlay;
local l_CentralOverlayType_0 = require(l_Parent_0.RobloxAppEnums).CentralOverlayType;
local l_Logging_0 = require(l_Parent_0.AppCommonLib).Logging;
local l_Modules_0 = l_script_FirstAncestor_0.Modules;
local l_Vote_0 = require(l_Modules_0.LuaApp.Analytics.Events.Games.GameDetailsEvents).Vote;
local v41 = require(l_Modules_0.LuaApp.Components.ExperienceDetails.Flags.FFlagEDPAddRatingTitle10ft);
local l_GetFFlagEdpPlayerFeedbackEnabled_0 = require(l_Parent_0.SharedFlags).GetFFlagEdpPlayerFeedbackEnabled;
local l_GetFFlagEdpPlayerFeedbackLogIXPExposure_0 = require(l_Parent_0.SharedFlags).GetFFlagEdpPlayerFeedbackLogIXPExposure;
local l_FFlagHideAggregateLikeCountsOnEdp_0 = require(l_Parent_0.SharedFlags).FFlagHideAggregateLikeCountsOnEdp;
local v45 = v4.PureComponent:extend("ExperienceRatings");
v45.validateProps = v6.interface({
    universeId = v6.string, 
    uiMode = if v41 then v6.optional(v6.string) else nil
});
local v46 = {
    [l_VoteStatus_0.NotVoted] = l_VoteStates_0.notVoted, 
    [l_VoteStatus_0.VotedDown] = l_VoteStates_0.votedDown, 
    [l_VoteStatus_0.VotedUp] = l_VoteStates_0.votedUp
};
v45.init = function(v47) --[[ Line: 65 ]] --[[ Name: init ]]
    -- upvalues: l_GetFFlagEdpPlayerFeedbackEnabled_0 (copy), l_Logging_0 (copy), l_UiMode_0 (copy), l_VoteStatus_0 (copy), l_Localization_0 (copy), l_LocalizationService_0 (copy), l_memoize_0 (copy), l_abbreviateCount_0 (copy), l_FFlagHideAggregateLikeCountsOnEdp_0 (copy), l_ReasonForNotVoteable_0 (copy), l_GetFFlagEdpPlayerFeedbackLogIXPExposure_0 (copy), l_IXPService_0 (copy), l_AppUserLayers_0 (copy), l_RetrievalStatus_0 (copy), l_Vote_0 (copy), l_ToastType_0 (copy)
    v47.isMounted = false;
    if l_GetFFlagEdpPlayerFeedbackEnabled_0() then
        v47.state = {
            isFeedbackPromptOpen = false, 
            playerFeedbackMetadata = nil
        };
        v47.openInlineFeedbackPrompt = function() --[[ Line: 73 ]]
            -- upvalues: v47 (copy)
            v47:setState({
                isFeedbackPromptOpen = true
            });
        end;
        v47.closeInlineFeedbackPrompt = function() --[[ Line: 78 ]]
            -- upvalues: v47 (copy)
            v47:setState({
                isFeedbackPromptOpen = false
            });
        end;
        v47.onClickFeedbackPromptButton = function() --[[ Line: 83 ]]
            -- upvalues: v47 (copy), l_Logging_0 (ref)
            if not v47.state.playerFeedbackMetadata then
                l_Logging_0.warn("Player feedback metadata is not available from feedback prompt");
                return;
            else
                v47.props.openFeedbackForm(v47.props.universeId, v47.state.playerFeedbackMetadata, v47.closeInlineFeedbackPrompt);
                return;
            end;
        end;
        v47.onVoteSuccess = function(v48) --[[ Line: 94 ]]
            -- upvalues: v47 (copy), l_UiMode_0 (ref), l_VoteStatus_0 (ref), l_Logging_0 (ref)
            if v47.props.uiMode == l_UiMode_0.TenFoot then
                return;
            elseif not v47.props.enablePlayerFeedback then
                return;
            else
                local l_universeId_0 = v47.props.universeId;
                local l_networking_0 = v47.props.networking;
                local l_rootPlaceId_0 = v47.props.rootPlaceId;
                if v48 == l_VoteStatus_0.NotVoted then
                    v47.closeInlineFeedbackPrompt();
                    return;
                else
                    v47.props.getGamePlayerFeedbackMetadata(l_networking_0, l_universeId_0, v48, l_rootPlaceId_0):andThen(function(v52) --[[ Line: 113 ]]
                        -- upvalues: v47 (ref), l_universeId_0 (copy)
                        if v52 and v52.canSubmitReview then
                            if v47.props.showInlineFeedbackPrompt then
                                v47:setState({
                                    playerFeedbackMetadata = v52
                                });
                                v47.openInlineFeedbackPrompt();
                                return;
                            else
                                v47.props.openFeedbackForm(l_universeId_0, v52);
                            end;
                        end;
                    end, function() --[[ Line: 124 ]]
                        -- upvalues: l_Logging_0 (ref)
                        l_Logging_0.warn("Failed to get player feedback metadata");
                    end);
                    return;
                end;
            end;
        end;
    end;
    local v53 = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId);
    v47.getVoteTexts = l_memoize_0(function(v54, v55, v56, v57) --[[ Line: 133 ]]
        -- upvalues: l_abbreviateCount_0 (ref), v53 (copy), l_FFlagHideAggregateLikeCountsOnEdp_0 (ref)
        local v58 = nil;
        if v54 and v55 then
            v58 = v54 + v55;
        end;
        local v59 = v58 and l_abbreviateCount_0(v58, v53:GetLocale()) or "--";
        v59 = if v56 and (not l_FFlagHideAggregateLikeCountsOnEdp_0 or v57) then string.upper(v53:Format("Feature.GameDetails.Label.Votes", {
            votes = v59
        })) else if l_FFlagHideAggregateLikeCountsOnEdp_0 then string.upper(v53:Format("Feature.GameDetails.Label.Upvoted")) else string.upper(v53:Format("Feature.GameDetails.Label.VotesNoTotal"));
        return {
            votePercentageText = v58 and v58 > 0 and tostring((math.floor(v54 / v58 * 100))) .. "%" or "--", 
            totalVotesText = v59
        };
    end);
    local v60 = {
        [l_ReasonForNotVoteable_0.PlayGame] = "Feature.Toast.VoteError.PlayGame", 
        [l_ReasonForNotVoteable_0.FloodCheckThresholdMet] = "Feature.Toast.VoteError.FloodCheckThresholdMet", 
        [l_ReasonForNotVoteable_0.AssetNotVoteable] = "Feature.Toast.VoteError.AssetNotVoteable", 
        Default = "Feature.Toast.VoteError.Default"
    };
    v47.onVoteButtonActivated = function(v61) --[[ Line: 169 ]]
        -- upvalues: v47 (copy), l_GetFFlagEdpPlayerFeedbackLogIXPExposure_0 (ref), l_IXPService_0 (ref), l_AppUserLayers_0 (ref), l_RetrievalStatus_0 (ref), l_GetFFlagEdpPlayerFeedbackEnabled_0 (ref), l_VoteStatus_0 (ref), l_Vote_0 (ref), v60 (copy), l_ToastType_0 (ref)
        local l_universeId_1 = v47.props.universeId;
        local l_networking_1 = v47.props.networking;
        local l_rootPlaceId_1 = v47.props.rootPlaceId;
        if v47.props.voteDataIsLoading then
            return;
        elseif not v47.isMounted or not l_rootPlaceId_1 then
            return;
        else
            if l_GetFFlagEdpPlayerFeedbackLogIXPExposure_0() then
                l_IXPService_0:LogUserLayerExposure(l_AppUserLayers_0.EDPPlayerFeedbackExposureLayer);
            end;
            if not v47.props.voteDataLoadSucceed then
                if v47.props.gameVotesFetchingStatus == l_RetrievalStatus_0.Failed then
                    v47.props.dispatchFetchGameVotes(l_networking_1, l_universeId_1);
                else
                    local l_eventIngest_0 = v47.props.eventIngest;
                    if l_GetFFlagEdpPlayerFeedbackEnabled_0() then
                        v47.props.patchUserVotes(l_networking_1, l_universeId_1, v61, l_VoteStatus_0.NotVoted):andThen(function(v66) --[[ Line: 198 ]]
                            -- upvalues: v47 (ref), v61 (ref)
                            if v66 ~= nil then
                                v47.onVoteSuccess(v61);
                            end;
                        end);
                    else
                        v47.props.patchUserVotes(l_networking_1, l_universeId_1, v61, l_VoteStatus_0.NotVoted);
                    end;
                    l_Vote_0(l_eventIngest_0, "GameRatings", l_rootPlaceId_1, v61, l_VoteStatus_0.NotVoted);
                end;
                return;
            else
                local l_userGameVotes_0 = v47.props.userGameVotes;
                local l_reasonForNotVoteable_0 = l_userGameVotes_0.reasonForNotVoteable;
                if l_userGameVotes_0.canVote then
                    local l_eventIngest_1 = v47.props.eventIngest;
                    local l_userVote_0 = l_userGameVotes_0.userVote;
                    if l_userVote_0 == v61 then
                        v61 = l_VoteStatus_0.NotVoted;
                    end;
                    if l_GetFFlagEdpPlayerFeedbackEnabled_0() then
                        v47.props.patchUserVotes(l_networking_1, l_universeId_1, v61, l_userVote_0):andThen(function(v71) --[[ Line: 225 ]]
                            -- upvalues: v47 (ref), v61 (ref)
                            if v71 ~= nil then
                                v47.onVoteSuccess(v61);
                            end;
                        end);
                    else
                        v47.props.patchUserVotes(l_networking_1, l_universeId_1, v61, l_userVote_0);
                    end;
                    l_Vote_0(l_eventIngest_1, "GameRatings", l_rootPlaceId_1, v61, l_userVote_0);
                else
                    local v72 = v60[l_reasonForNotVoteable_0] or v60.Default;
                    v47.props.setCurrentToastMessage({
                        toastType = l_ToastType_0.NetworkingError, 
                        toastMessage = v72
                    });
                end;
                return;
            end;
        end;
    end;
    v47.onVoteUpActivated = function() --[[ Line: 244 ]]
        -- upvalues: v47 (copy), l_VoteStatus_0 (ref)
        v47.onVoteButtonActivated(l_VoteStatus_0.VotedUp);
    end;
    v47.onVoteDownActivated = function() --[[ Line: 248 ]]
        -- upvalues: v47 (copy), l_VoteStatus_0 (ref)
        v47.onVoteButtonActivated(l_VoteStatus_0.VotedDown);
    end;
end;
v45.render = function(v73) --[[ Line: 253 ]] --[[ Name: render ]]
    -- upvalues: l_RetrievalStatus_0 (copy), l_VoteStatus_0 (copy), l_FFlagHideAggregateLikeCountsOnEdp_0 (copy), l_GetFFlagEdpPlayerFeedbackEnabled_0 (copy), v4 (copy), l_RateCount_0 (copy), v46 (copy), l_withStyle_0 (copy), l_GamePlayerFeedbackPrompt_0 (copy)
    local l_gameVotes_0 = v73.props.gameVotes;
    local l_userGameVotes_1 = v73.props.userGameVotes;
    local l_gameVotesFetchingStatus_0 = v73.props.gameVotesFetchingStatus;
    local l_voteDataLoadSucceed_0 = v73.props.voteDataLoadSucceed;
    local v78 = l_gameVotes_0 and l_gameVotes_0.upVotes;
    local v79 = l_gameVotes_0 and l_gameVotes_0.downVotes;
    if l_gameVotesFetchingStatus_0 == l_RetrievalStatus_0.Done then
        v78 = v78 or 0;
        v79 = v79 or 0;
    end;
    local v80 = l_voteDataLoadSucceed_0 and l_userGameVotes_1 and l_userGameVotes_1.userVote or l_VoteStatus_0.NotVoted;
    local l_showGlobalCounters_0 = v73.props.showGlobalCounters;
    local v82 = nil;
    if l_FFlagHideAggregateLikeCountsOnEdp_0 then
        v82 = v73.props.showLikesFavoritesCount;
    end;
    local v83 = v73.getVoteTexts(v78, v79, l_showGlobalCounters_0, if l_FFlagHideAggregateLikeCountsOnEdp_0 then v82 else nil);
    if l_GetFFlagEdpPlayerFeedbackEnabled_0() then
        return v4.createElement("Frame", {
            Size = UDim2.fromScale(1, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1
        }, {
            UIListLayout = v4.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical, 
                Padding = UDim.new(0, 10)
            }), 
            RateCount = v4.createElement(l_RateCount_0, {
                rateText = v83.votePercentageText, 
                rateLabel = v83.totalVotesText, 
                voteState = v46[v80], 
                onVoteDownActivated = v73.onVoteDownActivated, 
                onVoteUpActivated = v73.onVoteUpActivated
            }), 
            PlayerFeedbackPrompt = v73.state.isFeedbackPromptOpen and l_withStyle_0(function(v84) --[[ Line: 298 ]]
                -- upvalues: v4 (ref), l_GamePlayerFeedbackPrompt_0 (ref), v73 (copy)
                return v4.createElement(l_GamePlayerFeedbackPrompt_0, {
                    placeId = v73.props.rootPlaceId, 
                    backgroundTransparency = v84.Tokens.Semantic.Color.Background.Contrast.Transparency, 
                    backgroundColor3 = v84.Tokens.Semantic.Color.Background.Contrast.Color3, 
                    onDimiss = v73.closeInlineFeedbackPrompt, 
                    onButtonClick = v73.onClickFeedbackPromptButton
                }) or nil;
            end)
        });
    else
        return v4.createElement(l_RateCount_0, {
            rateText = v83.votePercentageText, 
            rateLabel = v83.totalVotesText, 
            voteState = v46[v80], 
            onVoteDownActivated = v73.onVoteDownActivated, 
            onVoteUpActivated = v73.onVoteUpActivated
        });
    end;
end;
v45.didMount = function(v85) --[[ Line: 319 ]] --[[ Name: didMount ]]
    v85.isMounted = true;
end;
v45.willUnmount = function(v86) --[[ Line: 323 ]] --[[ Name: willUnmount ]]
    v86.isMounted = false;
end;
v45 = v5.connect(function(v87, v88) --[[ Line: 327 ]]
    -- upvalues: l_FetchGameVotes_0 (copy), l_FetchUserGameVotes_0 (copy), l_PatchUserVotes_0 (copy), l_GameInfosReducer_0 (copy), l_RetrievalStatus_0 (copy)
    local l_universeId_2 = v88.universeId;
    local v90 = l_FetchGameVotes_0.GetFetchingStatus(v87, l_universeId_2);
    local v91 = l_FetchUserGameVotes_0.GetFetchingStatus(v87, l_universeId_2);
    local v92 = l_PatchUserVotes_0.GetPatchingStatus(v87, l_universeId_2);
    local v93 = v87.GameVotes[v88.universeId];
    local v94 = v87.UserGameVotes[v88.universeId];
    local v95 = nil;
    if v87.GameDetails and v87.GameDetails[v88.universeId] then
        v95 = v87.GameDetails[v88.universeId].rootPlaceId;
    else
        local v96 = v87.Personalization[l_GameInfosReducer_0.key][v88.universeId];
        if v96 then
            v95 = v96.placeId;
        end;
    end;
    local v97 = {
        gameVotesFetchingStatus = v90
    };
    local v98 = true;
    if v90 ~= l_RetrievalStatus_0.Fetching then
        v98 = true;
        if v91 ~= l_RetrievalStatus_0.Fetching then
            v98 = v92 == l_RetrievalStatus_0.Fetching;
        end;
    end;
    v97.voteDataIsLoading = v98;
    v97.voteDataLoadSucceed = v93 and v94;
    v97.gameVotes = v93;
    v97.userGameVotes = v94;
    v97.rootPlaceId = v95;
    return v97;
end, function(v99) --[[ Line: 356 ]]
    -- upvalues: l_FetchGameVotes_0 (copy), l_PatchUserVotes_0 (copy), l_GetFFlagEdpPlayerFeedbackEnabled_0 (copy), l_SetCentralOverlay_0 (copy), l_CentralOverlayType_0 (copy), l_GetGamePlayerFeedbackMetadata_0 (copy), l_SetCurrentToastMessage_0 (copy)
    return {
        dispatchFetchGameVotes = function(v100, v101) --[[ Line: 358 ]] --[[ Name: dispatchFetchGameVotes ]]
            -- upvalues: v99 (copy), l_FetchGameVotes_0 (ref)
            return v99(l_FetchGameVotes_0.Fetch(v100, v101));
        end, 
        patchUserVotes = function(v102, v103, v104, v105) --[[ Line: 361 ]] --[[ Name: patchUserVotes ]]
            -- upvalues: v99 (copy), l_PatchUserVotes_0 (ref)
            return v99(l_PatchUserVotes_0.Patch(v102, v103, v104, v105));
        end, 
        openFeedbackForm = l_GetFFlagEdpPlayerFeedbackEnabled_0() and function(v106, v107, v108) --[[ Line: 365 ]]
            -- upvalues: v99 (copy), l_SetCentralOverlay_0 (ref), l_CentralOverlayType_0 (ref)
            return v99(l_SetCentralOverlay_0(l_CentralOverlayType_0.GamePlayerFeedbackForm, {
                universeId = v106, 
                playerFeedbackMetadata = v107, 
                onSubmitted = v108
            }));
        end or nil, 
        getGamePlayerFeedbackMetadata = l_GetFFlagEdpPlayerFeedbackEnabled_0() and function(v109, v110, v111, v112) --[[ Line: 374 ]]
            -- upvalues: v99 (copy), l_GetGamePlayerFeedbackMetadata_0 (ref)
            return v99(l_GetGamePlayerFeedbackMetadata_0.Get(v109, v110, v112, v111));
        end or nil, 
        setCurrentToastMessage = function(v113) --[[ Line: 378 ]] --[[ Name: setCurrentToastMessage ]]
            -- upvalues: v99 (copy), l_SetCurrentToastMessage_0 (ref)
            return v99(l_SetCurrentToastMessage_0(v113));
        end
    };
end)(v45);
if l_GetFFlagEdpPlayerFeedbackEnabled_0() then
    v45 = v32.connectUserLayer({
        l_AppUserLayers_0.EDPPlayerFeedbackExposureLayer
    }, function(v114, _) --[[ Line: 387 ]]
        -- upvalues: l_AppUserLayers_0 (copy)
        local v116 = v114[l_AppUserLayers_0.EDPPlayerFeedbackExposureLayer] or {};
        return {
            enablePlayerFeedback = v116.ShowFeedbackForm, 
            showInlineFeedbackPrompt = v116.ShowInlinePrompt
        };
    end, false)(v45);
end;
v45 = l_RoactServices_0.connect({
    networking = l_RoactNetworking_0, 
    eventIngest = l_AppEventIngestService_0
})(v45);
v45 = l_RoactAppPolicy_0.connect(function(v117) --[[ Line: 401 ]]
    -- upvalues: l_FFlagHideAggregateLikeCountsOnEdp_0 (copy)
    return {
        showGlobalCounters = v117.getShowGlobalCounters(), 
        showLikesFavoritesCount = if l_FFlagHideAggregateLikeCountsOnEdp_0 then v117.getEnableAggregateLikesFavoritesCount() else nil
    };
end)(v45);
local function v124(v118) --[[ Line: 410 ]] --[[ Name: ExperienceRatingsWrapper ]]
    -- upvalues: l_UiMode_0 (copy), l_useDesignTokens_0 (copy), l_useLocalization_0 (copy), v4 (copy), l_StyledTextLabel_0 (copy), v45 (ref)
    if v118.uiMode == l_UiMode_0.TenFoot then
        local v119 = l_useDesignTokens_0();
        local l_SectionListPadding_0 = v119.LuaApps.ExperienceDetails.SectionListPadding;
        local l_TitleFontStyle_0 = v119.LuaApps.ExperienceDetails.TitleFontStyle;
        local l_TitleColorStyle_0 = v119.LuaApps.ExperienceDetails.TitleColorStyle;
        local v123 = l_useLocalization_0({
            ratingTitle = "Feature.GameDetails.Label.Rating"
        });
        return v4.createElement("Frame", {
            Size = UDim2.fromScale(1, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1
        }, {
            UIListLayout = v4.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical, 
                Padding = UDim.new(0, l_SectionListPadding_0)
            }), 
            RatingsHeader = v4.createElement(l_StyledTextLabel_0, {
                text = v123.ratingTitle, 
                size = UDim2.fromScale(1, 0), 
                fontStyle = l_TitleFontStyle_0, 
                colorStyle = l_TitleColorStyle_0, 
                automaticSize = Enum.AutomaticSize.Y, 
                richText = false, 
                fluidSizing = false, 
                layoutOrder = 1
            }), 
            RatingsContainer = v4.createElement("Frame", {
                Size = UDim2.fromScale(1, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1, 
                LayoutOrder = 2
            }, {
                ExperienceRatings = v4.createElement(v45, v118)
            })
        });
    else
        return v4.createElement(v45, v118);
    end;
end;
if v41 then
    return v124;
else
    return v45;
end;