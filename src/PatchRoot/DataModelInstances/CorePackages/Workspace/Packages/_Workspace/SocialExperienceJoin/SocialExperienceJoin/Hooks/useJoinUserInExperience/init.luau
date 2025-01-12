local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialExperienceJoin");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.GameLaunch);
local v3 = require(l_Parent_0.LuaSocialLibrariesDeps);
local v4 = require(l_Parent_0.NavigationRodux);
local v5 = require(l_Parent_0.Promise);
local v6 = require(l_Parent_0.React);
local v7 = require(l_Parent_0.RoactServiceTags);
local v8 = require(l_Parent_0.RoactUtils);
local v9 = require(l_Parent_0.RobloxAppEnums);
local v10 = require(l_Parent_0.RobloxAppHooks);
local v11 = require(l_Parent_0.RobloxAppSessionization);
local v12 = require(l_script_FirstAncestor_0.Rodux.Games);
local v13 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local v14 = require(l_script_FirstAncestor_0.Analytics.JoinExperienceStatus);
local v15 = require(l_script_FirstAncestor_0.Analytics.initializeSocialExperienceJoinAnalytics);
local v16 = require(l_script_FirstAncestor_0.Common.Constants);
local v17 = require(l_script_FirstAncestor_0.Networking.NetworkingGames);
local v18 = require(l_script_FirstAncestor_0.Networking.myRoduxNetworking);
local l_useSelector_0 = v8.Hooks.RoactRodux.useSelector;
local l_PlayabilityStatus_0 = v12.Enums.PlayabilityStatus;
local l_NetworkStatus_0 = v18.Enum.NetworkStatus;
local l_LaunchGame_0 = v2.LaunchGame;
local l_useDispatch_0 = v8.Hooks.RoactRodux.useDispatch;
local l_SetGamePlaySession_0 = v11.SetGamePlaySession;
local l_SessionType_0 = v11.SessionType;
local l_AppSessionService_0 = v7.AppSessionService;
local l_useRoactService_0 = v10.useRoactService;
local l_AppPage_0 = v9.AppPage;
local l_NavigateDown_0 = v4.Thunks.NavigateDown;
local l_AppGame_0 = v7.AppGame;
local l_useLocalUserId_0 = v10.useLocalUserId;
local l_getDeepValue_0 = v3.SocialLibraries.config({}).Dictionary.getDeepValue;
return function(v33, v34) --[[ Line: 43 ]]
    -- upvalues: l_useDispatch_0 (copy), l_useRoactService_0 (copy), l_AppSessionService_0 (copy), l_AppGame_0 (copy), v6 (copy), v15 (copy), l_useLocalUserId_0 (copy), l_useSelector_0 (copy), l_getDeepValue_0 (copy), v16 (copy), v17 (copy), l_NetworkStatus_0 (copy), l_SetGamePlaySession_0 (copy), l_SessionType_0 (copy), v13 (copy), v14 (copy), v5 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy), l_PlayabilityStatus_0 (copy), l_LaunchGame_0 (copy)
    local v35 = l_useDispatch_0();
    local v36 = l_useRoactService_0(l_AppSessionService_0);
    local v37 = l_useRoactService_0(l_AppGame_0);
    local v38 = v6.useMemo(function() --[[ Line: 58 ]]
        -- upvalues: v15 (ref), v34 (copy)
        return v15(v34.analyticProps);
    end, {});
    local v39 = l_useLocalUserId_0();
    local v45 = l_useSelector_0(function(v40) --[[ Line: 63 ]]
        -- upvalues: l_getDeepValue_0 (ref), v16 (ref), v33 (copy), v17 (ref), l_NetworkStatus_0 (ref)
        local v41 = l_getDeepValue_0(v40, (("%*.Presence.byUserId.%*"):format(v16.RODUX_KEY, v33)));
        local v42 = if v41 and v41.universeId then tostring(v41.universeId) else "";
        local v43 = false;
        if v42 ~= "" then
            local v44 = true;
            if v17.GetExperiencesPlayabilityStatus.getStatus(v40, v42) ~= l_NetworkStatus_0.Fetching then
                v44 = true;
                if v17.GetExperiencesDetails.getStatus(v40, v42) ~= l_NetworkStatus_0.Fetching then
                    v44 = v17.GetExperiencesProductInfo.getStatus(v40, v42) == l_NetworkStatus_0.Fetching;
                end;
            end;
            v43 = v44;
        end;
        return {
            universeId = v42, 
            presenceType = if v41 and v41.userPresenceType then v41.userPresenceType else "", 
            lastLocation = if v41 and v41.lastLocation then v41.lastLocation else nil, 
            placeId = if v41 and v41.placeId then tostring(v41.placeId) else "", 
            rootPlaceId = if v41 and v41.rootPlaceId then tostring(v41.rootPlaceId) else "", 
            gameId = if v41 and v41.gameId then tostring(v41.gameId) else "", 
            isLoading = v43
        };
    end);
    local v68 = v6.useCallback(function() --[[ Line: 88 ]]
        -- upvalues: v35 (copy), v17 (ref), l_SetGamePlaySession_0 (ref), v36 (copy), l_SessionType_0 (ref), v38 (copy), v13 (ref), v45 (copy), v33 (copy), v39 (copy), v34 (copy), v14 (ref), v5 (ref), l_NavigateDown_0 (ref), l_AppPage_0 (ref), l_PlayabilityStatus_0 (ref), l_LaunchGame_0 (ref), v37 (copy), v16 (ref)
        local function _(v46) --[[ Line: 89 ]]
            -- upvalues: v35 (ref), v17 (ref)
            return v35(v17.GetExperiencesDetails.API({
                v46
            }));
        end;
        local function v49(v48) --[[ Line: 93 ]]
            -- upvalues: v35 (ref), v17 (ref)
            return v35(v17.GetExperiencesProductInfo.API({
                v48
            }));
        end;
        local function _(v50) --[[ Line: 97 ]]
            -- upvalues: l_SetGamePlaySession_0 (ref), v36 (ref), l_SessionType_0 (ref), v38 (ref), v13 (ref), v45 (ref), v33 (ref), v39 (ref), v34 (ref)
            return function(v51) --[[ Line: 98 ]]
                -- upvalues: l_SetGamePlaySession_0 (ref), v36 (ref), l_SessionType_0 (ref), v38 (ref), v13 (ref), v45 (ref), v33 (ref), v39 (ref), v50 (copy), v34 (ref)
                l_SetGamePlaySession_0(v36, l_SessionType_0.StructuralIdentifier.GamePlayFromFriendsList, true);
                v38.fireAnalyticsEvent(v13.JoinExperience, {
                    placeId = v45.placeId, 
                    rootPlaceId = v45.rootPlaceId, 
                    gameInstanceId = v45.gameId, 
                    profileUserId = v33, 
                    uid = v39, 
                    joinAttemptId = v51, 
                    status = v50, 
                    isHomePageCarousel = v34.isHomePageCarousel or false, 
                    absolutePosition = v34.homepageCarouselAbsolutePosition
                });
            end;
        end;
        local function v56() --[[ Line: 116 ]]
            -- upvalues: v14 (ref), l_SetGamePlaySession_0 (ref), v36 (ref), l_SessionType_0 (ref), v38 (ref), v13 (ref), v45 (ref), v33 (ref), v39 (ref), v34 (ref), v5 (ref), v35 (ref), v17 (ref), v49 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref)
            local l_PurchaseRequired_0 = v14.PurchaseRequired;
            l_PurchaseRequired_0 = function(v54) --[[ Line: 98 ]]
                -- upvalues: l_SetGamePlaySession_0 (ref), v36 (ref), l_SessionType_0 (ref), v38 (ref), v13 (ref), v45 (ref), v33 (ref), v39 (ref), l_PurchaseRequired_0 (copy), v34 (ref)
                l_SetGamePlaySession_0(v36, l_SessionType_0.StructuralIdentifier.GamePlayFromFriendsList, true);
                v38.fireAnalyticsEvent(v13.JoinExperience, {
                    placeId = v45.placeId, 
                    rootPlaceId = v45.rootPlaceId, 
                    gameInstanceId = v45.gameId, 
                    profileUserId = v33, 
                    uid = v39, 
                    joinAttemptId = v54, 
                    status = l_PurchaseRequired_0, 
                    isHomePageCarousel = v34.isHomePageCarousel or false, 
                    absolutePosition = v34.homepageCarouselAbsolutePosition
                });
            end;
            l_PurchaseRequired_0();
            l_PurchaseRequired_0 = v5.all;
            local l_universeId_0 = v45.universeId;
            l_PurchaseRequired_0(v35(v17.GetExperiencesDetails.API({
                l_universeId_0
            })), v49(v45.universeId)):andThen(function() --[[ Line: 124 ]]
                -- upvalues: v35 (ref), l_NavigateDown_0 (ref), l_AppPage_0 (ref), v45 (ref), v33 (ref), v34 (ref)
                v35(l_NavigateDown_0({
                    name = l_AppPage_0.SocialPurchaseExperience, 
                    detail = v45.universeId, 
                    extraProps = {
                        userId = v33, 
                        analyticProps = v34.analyticProps
                    }
                }));
            end);
        end;
        local function v59() --[[ Line: 136 ]]
            -- upvalues: v14 (ref), l_SetGamePlaySession_0 (ref), v36 (ref), l_SessionType_0 (ref), v38 (ref), v13 (ref), v45 (ref), v33 (ref), v39 (ref), v34 (ref), v35 (ref), l_NavigateDown_0 (ref), l_AppPage_0 (ref)
            local l_PurchaseRequired_1 = v14.PurchaseRequired;
            l_PurchaseRequired_1 = function(v58) --[[ Line: 98 ]]
                -- upvalues: l_SetGamePlaySession_0 (ref), v36 (ref), l_SessionType_0 (ref), v38 (ref), v13 (ref), v45 (ref), v33 (ref), v39 (ref), l_PurchaseRequired_1 (copy), v34 (ref)
                l_SetGamePlaySession_0(v36, l_SessionType_0.StructuralIdentifier.GamePlayFromFriendsList, true);
                v38.fireAnalyticsEvent(v13.JoinExperience, {
                    placeId = v45.placeId, 
                    rootPlaceId = v45.rootPlaceId, 
                    gameInstanceId = v45.gameId, 
                    profileUserId = v33, 
                    uid = v39, 
                    joinAttemptId = v58, 
                    status = l_PurchaseRequired_1, 
                    isHomePageCarousel = v34.isHomePageCarousel or false, 
                    absolutePosition = v34.homepageCarouselAbsolutePosition
                });
            end;
            l_PurchaseRequired_1(v14.Unable);
            v35(l_NavigateDown_0({
                name = l_AppPage_0.SocialUnableToJoinExperience, 
                detail = v45.universeId, 
                extraProps = {
                    userId = v33, 
                    analyticProps = v34.analyticProps, 
                    openGameDetailsPeekViewClosed = v34.openGameDetailsPeekViewClosed
                }
            }));
        end;
        (function(v60) --[[ Line: 153 ]]
            -- upvalues: v35 (ref), v17 (ref)
            return v35(v17.GetExperiencesPlayabilityStatus.API({
                v60
            })):andThen(function(v61) --[[ Line: 155 ]]
                return v61.responseBody[1].playabilityStatus;
            end);
        end)(v45.universeId):andThen(function(v62) --[[ Line: 162 ]]
            -- upvalues: l_PlayabilityStatus_0 (ref), v56 (copy), v14 (ref), l_SetGamePlaySession_0 (ref), v36 (ref), l_SessionType_0 (ref), v38 (ref), v13 (ref), v45 (ref), v33 (ref), v39 (ref), v34 (ref), l_LaunchGame_0 (ref), v37 (ref), v16 (ref), v59 (copy)
            if v62 == l_PlayabilityStatus_0.PurchaseRequired.rawValue() then
                v56();
                return;
            elseif v62 == l_PlayabilityStatus_0.Playable.rawValue() then
                local l_Success_0 = v14.Success;
                local function v65(v64) --[[ Line: 98 ]]
                    -- upvalues: l_SetGamePlaySession_0 (ref), v36 (ref), l_SessionType_0 (ref), v38 (ref), v13 (ref), v45 (ref), v33 (ref), v39 (ref), l_Success_0 (copy), v34 (ref)
                    l_SetGamePlaySession_0(v36, l_SessionType_0.StructuralIdentifier.GamePlayFromFriendsList, true);
                    v38.fireAnalyticsEvent(v13.JoinExperience, {
                        placeId = v45.placeId, 
                        rootPlaceId = v45.rootPlaceId, 
                        gameInstanceId = v45.gameId, 
                        profileUserId = v33, 
                        uid = v39, 
                        joinAttemptId = v64, 
                        status = l_Success_0, 
                        isHomePageCarousel = v34.isHomePageCarousel or false, 
                        absolutePosition = v34.homepageCarouselAbsolutePosition
                    });
                end;
                l_LaunchGame_0(nil, nil, {
                    userId = v33
                }, v37, v16.AnalyticsContext.PeopleListInHomePage, v65);
                return;
            else
                v59();
                return;
            end;
        end):catch(function() --[[ Line: 180 ]]
            -- upvalues: v14 (ref), l_SetGamePlaySession_0 (ref), v36 (ref), l_SessionType_0 (ref), v38 (ref), v13 (ref), v45 (ref), v33 (ref), v39 (ref), v34 (ref)
            local l_Failure_0 = v14.Failure;
            l_Failure_0 = function(v67) --[[ Line: 98 ]]
                -- upvalues: l_SetGamePlaySession_0 (ref), v36 (ref), l_SessionType_0 (ref), v38 (ref), v13 (ref), v45 (ref), v33 (ref), v39 (ref), l_Failure_0 (copy), v34 (ref)
                l_SetGamePlaySession_0(v36, l_SessionType_0.StructuralIdentifier.GamePlayFromFriendsList, true);
                v38.fireAnalyticsEvent(v13.JoinExperience, {
                    placeId = v45.placeId, 
                    rootPlaceId = v45.rootPlaceId, 
                    gameInstanceId = v45.gameId, 
                    profileUserId = v33, 
                    uid = v39, 
                    joinAttemptId = v67, 
                    status = l_Failure_0, 
                    isHomePageCarousel = v34.isHomePageCarousel or false, 
                    absolutePosition = v34.homepageCarouselAbsolutePosition
                });
            end;
            l_Failure_0();
        end);
    end, {
        v35, 
        v45.universeId, 
        v45.placeId, 
        v45.rootPlaceId, 
        v45.gameId, 
        v33, 
        v39, 
        v38, 
        v36, 
        v37, 
        v34.isHomePageCarousel, 
        v34.homepageCarouselAbsolutePosition
    });
    local v69 = if v45.presenceType and v45.lastLocation then v45.universeId ~= "" else false;
    return v6.useMemo(function() --[[ Line: 207 ]]
        -- upvalues: v68 (copy), v69 (copy), v45 (copy)
        return {
            joinExperience = v68, 
            isInExperience = v69, 
            isLoading = v45.isLoading
        };
    end, {
        v45.presenceType, 
        v45.lastLocation, 
        v68, 
        v45.isLoading
    });
end;