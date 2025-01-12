local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_EventIngestService_0 = game:GetService("EventIngestService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_script_FirstAncestor_0.types);
local v5 = require(l_Parent_0.React);
local v6 = require(l_Parent_0.Cryo);
local l_EventStream_0 = require(l_Parent_0.Analytics).AnalyticsReporters.EventStream;
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local l_memo_0 = v5.memo;
local l_useCallback_0 = v5.useCallback;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useEffect_0 = v5.useEffect;
local v13 = require(l_script_FirstAncestor_0.Hooks.useIsExternalNavigationAvailable);
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local v15 = require(l_Parent_0.Loggers).Logger:new("GameCardContainer");
local l_withLocalization_0 = require(l_Parent_0.Localization).withLocalization;
local l_GameParams_0 = require(l_Parent_0.ExperienceService).GameParams;
local l_EventIngest_0 = require(l_Parent_0.Analytics).AnalyticsReporters.EventIngest;
local l_ApiFetchGameDetails_0 = require(l_Parent_0.GameDetailRodux).GameDetails.ApiFetchGameDetails;
local l_ApiFetchPlayabilityStatus_0 = require(l_Parent_0.PlayabilityRodux).PlayabilityStatus.ApiFetchPlayabilityStatus;
local l_ApiFetchGameIcons_0 = require(l_Parent_0.GameIconRodux).GameIcons.ApiFetchGameIcons;
local v22 = require(script.Parent.ReportAnEvent);
local l_AppSessionService_0 = require(l_Parent_0.RoactServiceTags).AppSessionService;
local l_SessionType_0 = require(l_Parent_0.RobloxAppSessionization).SessionType;
local l_RoactServices_0 = require(l_Parent_0.RoactServices).RoactServices;
local l_RoactAnalyticsCommonGameEvents_0 = require(l_Parent_0.RoactServiceTags).RoactAnalyticsCommonGameEvents;
local v27 = require(script.Parent.GameCard);
local l_AppGame_0 = l_RoactServices_0.AppGame;
local l_ExperienceService_0 = require(l_Parent_0.ExperienceService).ExperienceService;
local l_SetGamePlaySession_0 = require(l_Parent_0.RobloxAppSessionization).SetGamePlaySession;
local l_GameIconReducer_0 = require(l_Parent_0.GameIconRodux).GameIcons.GameIconReducer;
local v32 = require(l_script_FirstAncestor_0.Hooks.useIsInExperience);
local v33 = require(l_Parent_0.HttpRequest);
local v37 = v33.config({
    requestFunction = function(v34, v35, v36) --[[ Line: 57 ]] --[[ Name: requestFunction ]]
        -- upvalues: v15 (copy), v33 (copy)
        v15:info("Fetching: {}", string.format("[ requestMethod = %q, url = %q ]", v35, v34));
        return v33.requestFunctions.HttpRbxApi(v34, v35, v36);
    end
});
local v38 = require(l_script_FirstAncestor_0.EnumScreens);
local v39 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatDisableNavToGameDetails);
local v40 = require(l_script_FirstAncestor_0.Flags.getFFlagSupportGameCardForInExpPlatChat);
local v41 = game:DefineFastFlag("AppChatShutdownBeforeLaunch", false);
local v42 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatHidePlayButtonsInExp);
local v53 = {
    networkImpl = v37, 
    eventStream = l_EventStream_0.new(l_RbxAnalyticsService_0), 
    eventIngest = l_EventIngest_0.new(l_EventIngestService_0), 
    placeId = nil, 
    universeId = nil, 
    conversationId = nil, 
    luaChatPlayTogetherEnabled = nil, 
    onDetailsOpened = function() --[[ Line: 96 ]] --[[ Name: onDetailsOpened ]]

    end, 
    onPlayButtonActivated = function(v43) --[[ Line: 98 ]] --[[ Name: onPlayButtonActivated ]]
        -- upvalues: l_SetGamePlaySession_0 (copy), l_SessionType_0 (copy), v22 (copy), v6 (copy), l_GameParams_0 (copy), v41 (copy), l_ExperienceService_0 (copy)
        local l_placeId_0 = v43.placeId;
        local l_senderUserId_0 = v43.senderUserId;
        l_SetGamePlaySession_0(v43.sessionService, l_SessionType_0.StructuralIdentifier.GamePlayFromChat, true);
        v22(v43, "clickBtnFromLinkCardInChat", "touch");
        if l_placeId_0 then
            local function v47(v46) --[[ Line: 107 ]]
                -- upvalues: v43 (ref), v6 (ref), v22 (ref)
                v43 = v6.Dictionary.join(v43, {
                    joinAttemptId = v46
                });
                v22(v43, "gamePlayIntent", "PlayGameFromLinkCard");
            end;
            local v48 = l_GameParams_0.fromParams({
                userId = l_senderUserId_0, 
                placeId = l_placeId_0
            });
            if v41 then
                game:Shutdown();
            end;
            l_ExperienceService_0:LaunchExperience(v48, "PlayGameFromLinkCard", v47);
        end;
    end, 
    openDetails = function(v49) --[[ Line: 125 ]] --[[ Name: openDetails ]]
        -- upvalues: v22 (copy)
        local l_universeId_0 = v49.universeId;
        local l_placeId_1 = v49.placeId;
        v22(v49, "clickLinkCardInChat", "touch");
        v49.onDetailsOpened();
        v49.openGameDetailsPage(l_universeId_0, "LuaChatAssetCard");
        local v52 = v49.analytics and v49.analytics.reportOpenGameDetailFromChat;
        if v52 then
            v52(l_placeId_1, v49.conversationId, l_universeId_0, "GameDetailFromLinkCard");
        end;
    end
};
local function _(v54, v55) --[[ Line: 142 ]] --[[ Name: getGameIcon ]]
    -- upvalues: l_GameIconReducer_0 (copy)
    local v56 = v54[l_GameIconReducer_0.key][v55];
    if v56 then
        return v56.url;
    else
        return "";
    end;
end;
local function _(v58, v59) --[[ Line: 151 ]] --[[ Name: getGameDetails ]]
    return v58.GameDetails[v59] or {};
end;
local function _(v61, v62) --[[ Line: 155 ]] --[[ Name: getGamePlayabilityStatus ]]
    return v61.PlayabilityStatus[v62] or {};
end;
GameCardContainer = function(v64) --[[ Line: 159 ]] --[[ Name: GameCardContainer ]]
    -- upvalues: v6 (copy), v53 (copy), l_useSelector_0 (copy), l_useCallback_0 (copy), l_dependencyArray_0 (copy), v40 (copy), l_GameIconReducer_0 (copy), v13 (copy), v38 (copy), l_useDispatch_0 (copy), l_ApiFetchGameIcons_0 (copy), l_ApiFetchGameDetails_0 (copy), l_ApiFetchPlayabilityStatus_0 (copy), l_useEffect_0 (copy), v5 (copy), v27 (copy), v32 (copy), v42 (copy), l_withLocalization_0 (copy), v39 (copy)
    local v65 = v6.Dictionary.join(v53, v64);
    if not v65.universeId then
        assert("universeId does not exist", "universeId does not exist");
    end;
    local v68 = l_useSelector_0(l_useCallback_0(function(v66) --[[ Line: 165 ]]
        -- upvalues: v65 (copy)
        local l_universeId_1 = v65.universeId;
        return v66.GameDetails[l_universeId_1] or {};
    end, l_dependencyArray_0(v65.universeId)));
    local v71 = l_useSelector_0(l_useCallback_0(function(v69) --[[ Line: 169 ]]
        -- upvalues: v65 (copy)
        local l_universeId_2 = v65.universeId;
        return v69.PlayabilityStatus[l_universeId_2] or {};
    end, l_dependencyArray_0(v65.universeId)));
    local v75 = if v40() then ("rbxthumb://type=GameIcon&id=%*&w=%*&h=%*"):format(v65.universeId, 150, 150) else l_useSelector_0(l_useCallback_0(function(v72) --[[ Line: 175 ]]
        -- upvalues: v65 (copy), l_GameIconReducer_0 (ref)
        local l_universeId_3 = v65.universeId;
        local v74 = v72[l_GameIconReducer_0.key][l_universeId_3];
        if v74 then
            return v74.url;
        else
            return "";
        end;
    end, l_dependencyArray_0(v65.universeId)));
    local v76 = v13({
        v38.GameDetail
    });
    local v77 = v65.placeId or v68.rootPlaceId;
    local l_name_0 = v68.name;
    local v79 = v68.description or "";
    local v80 = v68.price or 0;
    local v81 = l_useDispatch_0();
    local function v84(v82, v83) --[[ Line: 189 ]]
        -- upvalues: v40 (ref), v81 (copy), l_ApiFetchGameIcons_0 (ref), l_ApiFetchGameDetails_0 (ref), l_ApiFetchPlayabilityStatus_0 (ref)
        if not v40() then
            v81(l_ApiFetchGameIcons_0(v82, {
                v83
            }));
        end;
        v81(l_ApiFetchGameDetails_0.Fetch(v82, {
            v83
        }));
        v81(l_ApiFetchPlayabilityStatus_0.Fetch(v82, {
            v83
        }));
    end;
    local function _() --[[ Line: 197 ]] --[[ Name: hasAllInformation ]]
        -- upvalues: v77 (copy), l_name_0 (copy), v79 (copy), v71 (copy), v80 (copy)
        if v77 and l_name_0 and v79 and v71 and v71.isPlayable ~= nil and v80 then
            return true;
        else
            return false;
        end;
    end;
    l_useEffect_0(function() --[[ Line: 210 ]]
        -- upvalues: v65 (copy), v84 (copy)
        local l_universeId_4 = v65.universeId;
        if not l_universeId_4 then
            return;
        else
            v84(v65.networkImpl, l_universeId_4);
            return;
        end;
    end, {});
    local function v89(v87, v88) --[[ Line: 220 ]] --[[ Name: renderCard ]]
        -- upvalues: v5 (ref), v27 (ref), v6 (ref), v77 (copy), l_name_0 (copy), v79 (copy), v71 (copy), v80 (copy)
        if not v87.universeId then
            return v5.createElement(v27, v88);
        else
            return v5.createElement(v27, v6.Dictionary.join(v87, v88, {
                isLoading = not if v77 and l_name_0 and v79 and v71 then v71.isPlayable ~= nil and (v80 and true or false) else false
            }));
        end;
    end;
    local v90 = v32();
    local v91 = not v42() or not v90 or false;
    return l_withLocalization_0({
        purchaseGameText = "Feature.GameDetails.Heading.PurchaseGame", 
        viewDetailsText = "Feature.Chat.Action.ViewAssetDetails", 
        playText = "Common.VisitGame.Label.Play", 
        noDescriptionText = "Feature.Chat.Label.NoDescriptionYet"
    })(function(v92) --[[ Line: 243 ]]
        -- upvalues: v89 (copy), v6 (ref), v65 (copy), v68 (copy), v71 (copy), v75 (copy), v77 (copy), l_name_0 (copy), v79 (copy), v80 (copy), v84 (copy), v91 (copy), v39 (ref), v76 (copy), v38 (ref)
        return v89(v6.Dictionary.join(v65, {
            details = v68, 
            playabilityStatus = v71, 
            gameIcon = v75, 
            placeId = v77, 
            gameName = l_name_0, 
            gameDescription = v79, 
            gamePrice = v80, 
            fetchGameData = v84, 
            isPlayButtonEnabled = v91, 
            viewDetailsEnabled = not v39() or v76[v38.GameDetail]
        }), v92);
    end);
end;
return l_RoactServices_0.connect({
    game = l_AppGame_0, 
    sessionService = l_AppSessionService_0, 
    analytics = l_RoactAnalyticsCommonGameEvents_0
})(l_memo_0(GameCardContainer));