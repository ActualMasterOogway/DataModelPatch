local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_0.dependencies);
local v3 = require(l_Parent_0.Common.TextKeys);
local l_FriendshipOriginSourceType_0 = v2.NetworkingFriendsEnums.FriendshipOriginSourceType;
local v5 = require(l_Parent_1.SocialCommon);
local l_Images_0 = v2.UIBlox.App.ImageSet.Images;
local l_React_0 = v2.React;
local l_useDispatch_0 = v2.Hooks.useDispatch;
local l_useSelector_0 = v2.Hooks.useSelector;
local l_NetworkingFriends_0 = v2.NetworkingFriends;
local l_NetworkStatus_0 = v2.RoduxNetworking.Enum.NetworkStatus;
local l_RoduxFriends_0 = v2.RoduxFriends;
local l_getDeepValue_0 = v2.SocialLibraries.Dictionary.getDeepValue;
local l_EventNames_0 = require(l_Parent_0.Analytics).EventNames;
local l_ContextualInfoTypes_0 = v5.Enums.ContextualInfoTypes;
local v16 = require(l_Parent_0.Flags.getFFlagPYMKDisableButtonsOnFetch);
local l_FFlagFixContactRecsFriendRequestLogging_0 = require(l_Parent_1.SharedFlags).FFlagFixContactRecsFriendRequestLogging;
local l_FriendRequestNicknamesIXP_0 = require(l_Parent_1.FriendRequestNicknames).FriendRequestNicknamesIXP;
local l_AppPage_0 = require(l_Parent_1.RobloxAppEnums).AppPage;
local l_NavigateDown_0 = require(l_Parent_1.NavigationRodux).Thunks.NavigateDown;
local function _(v21, v22, v23) --[[ Line: 46 ]]
    -- upvalues: l_NetworkStatus_0 (copy)
    return v22.getStatus(v21, v23) == l_NetworkStatus_0.Fetching;
end;
return function(v25) --[[ Line: 50 ]]
    -- upvalues: l_useDispatch_0 (copy), l_useSelector_0 (copy), l_RoduxFriends_0 (copy), l_getDeepValue_0 (copy), l_FriendRequestNicknamesIXP_0 (copy), v16 (copy), l_NetworkingFriends_0 (copy), l_NetworkStatus_0 (copy), l_React_0 (copy), l_Images_0 (copy), l_EventNames_0 (copy), v3 (copy), l_FFlagFixContactRecsFriendRequestLogging_0 (copy), l_ContextualInfoTypes_0 (copy), l_FriendshipOriginSourceType_0 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy)
    return function() --[[ Line: 51 ]]
        -- upvalues: v25 (copy), l_useDispatch_0 (ref), l_useSelector_0 (ref), l_RoduxFriends_0 (ref), l_getDeepValue_0 (ref), l_FriendRequestNicknamesIXP_0 (ref), v16 (ref), l_NetworkingFriends_0 (ref), l_NetworkStatus_0 (ref), l_React_0 (ref), l_Images_0 (ref), l_EventNames_0 (ref), v3 (ref), l_FFlagFixContactRecsFriendRequestLogging_0 (ref), l_ContextualInfoTypes_0 (ref), l_FriendshipOriginSourceType_0 (ref), l_NavigateDown_0 (ref), l_AppPage_0 (ref)
        local v26 = tostring(v25.userId);
        local v27 = l_useDispatch_0();
        local v29 = l_useSelector_0(function(v28) --[[ Line: 54 ]]
            return (tostring(v28.LocalUserId));
        end);
        local v31 = l_useSelector_0(function(v30) --[[ Line: 57 ]]
            -- upvalues: l_RoduxFriends_0 (ref), v26 (copy)
            return l_RoduxFriends_0.Selectors.selectFriendshipStatusesByUserIds(v30)({
                v26
            })[v26] or nil;
        end);
        local v33 = l_useSelector_0(function(v32) --[[ Line: 61 ]]
            -- upvalues: l_RoduxFriends_0 (ref), v29 (copy), v26 (copy)
            return l_RoduxFriends_0.Selectors.selectRecommendationsForUserId(v32)(v29)[v26] or {};
        end);
        local v35 = l_useSelector_0(function(v34) --[[ Line: 65 ]]
            -- upvalues: l_getDeepValue_0 (ref), v26 (copy)
            return l_getDeepValue_0(v34, string.format("PYMKCarousel.Friends.recommendations.hasIncomingFriendRequest.%s", v26)) or false;
        end);
        local v36 = l_FriendRequestNicknamesIXP_0.useFriendRequestNicknames();
        local v41 = if v16() then l_useSelector_0(function(v37) --[[ Line: 75 ]]
            -- upvalues: l_NetworkingFriends_0 (ref), v26 (copy), l_NetworkStatus_0 (ref)
            local v38 = {};
            local l_RequestFriendshipFromUserId_0 = l_NetworkingFriends_0.RequestFriendshipFromUserId;
            local l_v26_0 = v26;
            v38.RequestFriendshipFromUserId = l_RequestFriendshipFromUserId_0.getStatus(v37, l_v26_0) == l_NetworkStatus_0.Fetching;
            l_RequestFriendshipFromUserId_0 = l_NetworkingFriends_0.AcceptFriendRequestFromUserId;
            l_v26_0 = v26;
            v38.AcceptFriendRequestFromUserId = l_RequestFriendshipFromUserId_0.getStatus(v37, l_v26_0) == l_NetworkStatus_0.Fetching;
            return v38;
        end) else nil;
        return l_React_0.useMemo(function() --[[ Line: 91 ]]
            -- upvalues: v31 (copy), l_Images_0 (ref), v35 (copy), v16 (ref), v41 (copy), v25 (ref), l_EventNames_0 (ref), v33 (copy), v26 (copy), v27 (copy), l_NetworkingFriends_0 (ref), v29 (copy), v3 (ref), l_FFlagFixContactRecsFriendRequestLogging_0 (ref), l_ContextualInfoTypes_0 (ref), l_FriendshipOriginSourceType_0 (ref), l_FriendRequestNicknamesIXP_0 (ref), v36 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref)
            if v31 == Enum.FriendStatus.FriendRequestSent then
                return {
                    {
                        icon = l_Images_0["icons/actions/friends/friendpending"], 
                        isSecondary = true, 
                        isDisabled = true
                    }
                };
            elseif v35 then
                return {
                    {
                        icon = l_Images_0["icons/actions/friends/friendAdd"], 
                        isSecondary = false, 
                        isDisabled = if v16() then if v41 then v41.AcceptFriendRequestFromUserId else false else false, 
                        onActivated = function() --[[ Line: 108 ]] --[[ Name: onActivated ]]
                            -- upvalues: v25 (ref), l_EventNames_0 (ref), v33 (ref), v26 (ref), v27 (ref), l_NetworkingFriends_0 (ref), v29 (ref), v3 (ref)
                            v25.fireAnalyticsEvent(l_EventNames_0.AcceptFriendship, {
                                recommendationContextType = v33.contextType, 
                                requestedId = v26, 
                                recommendationRank = v33.rank, 
                                absolutePosition = v25.absolutePosition
                            });
                            v27(l_NetworkingFriends_0.AcceptFriendRequestFromUserId.API({
                                currentUserId = v29, 
                                targetUserId = v26
                            })):andThen(function() --[[ Line: 119 ]]
                                -- upvalues: v25 (ref), v3 (ref)
                                v25.showToast(v3.FriendAddedToast);
                            end):catch(function() --[[ Line: 122 ]]
                                -- upvalues: v25 (ref), v3 (ref)
                                v25.showToast(v3.SomethingIsWrongToast);
                            end);
                        end
                    }
                };
            elseif not v31 or v31 == Enum.FriendStatus.NotFriend then
                return {
                    {
                        icon = l_Images_0["icons/actions/friends/friendAdd"], 
                        isSecondary = false, 
                        isDisabled = if v16() then if v41 then v41.RequestFriendshipFromUserId else false else false, 
                        onActivated = function() --[[ Line: 136 ]] --[[ Name: onActivated ]]
                            -- upvalues: v25 (ref), l_EventNames_0 (ref), v33 (ref), v26 (ref), l_FFlagFixContactRecsFriendRequestLogging_0 (ref), l_NetworkingFriends_0 (ref), v29 (ref), l_ContextualInfoTypes_0 (ref), l_FriendshipOriginSourceType_0 (ref), l_FriendRequestNicknamesIXP_0 (ref), v36 (ref), v27 (ref), l_NavigateDown_0 (ref), l_AppPage_0 (ref), v3 (ref)
                            v25.fireAnalyticsEvent(l_EventNames_0.RequestFriendship, {
                                recommendationContextType = v33.contextType, 
                                requestedId = v26, 
                                contactId = if l_FFlagFixContactRecsFriendRequestLogging_0 then v25.contactId else nil, 
                                recommendationRank = v33.rank, 
                                absolutePosition = v25.absolutePosition
                            });
                            local v42 = if v25.contactId then l_NetworkingFriends_0.RequestFriendshipFromContactId.API({
                                currentUserId = v29, 
                                targetUserId = v26, 
                                contactId = v25.contactId, 
                                contextType = l_ContextualInfoTypes_0.Contacts, 
                                friendshipOriginSourceType = l_FriendshipOriginSourceType_0.FriendRecommendations.rawValue()
                            }) else l_NetworkingFriends_0.RequestFriendshipFromUserId.API({
                                currentUserId = v29, 
                                targetUserId = v26, 
                                friendshipOriginSourceType = l_FriendshipOriginSourceType_0.FriendRecommendations.rawValue()
                            });
                            if l_FriendRequestNicknamesIXP_0.FFlagFriendRequestNicknames and v36 and not v25.contactId then
                                v27(l_NavigateDown_0({
                                    name = l_AppPage_0.SetNicknameModal, 
                                    extraProps = {
                                        friendRequestParams = {
                                            targetUserId = v26, 
                                            source = l_FriendshipOriginSourceType_0.FriendRecommendations.rawValue()
                                        }
                                    }
                                }));
                                return;
                            else
                                v27(v42):andThen(function() --[[ Line: 174 ]]
                                    -- upvalues: v25 (ref), v3 (ref)
                                    v25.showToast(v3.FriendRequestSentToast);
                                end):catch(function() --[[ Line: 177 ]]
                                    -- upvalues: v25 (ref), v3 (ref)
                                    v25.showToast(v3.SomethingIsWrongToast);
                                end);
                                return;
                            end;
                        end
                    }
                };
            else
                return {};
            end;
        end, {
            v31, 
            v26
        });
    end;
end;