local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.Cryo);
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local l_useAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).useAppPolicy;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_getDeepValue_0 = v1.SocialLibraries.Dictionary.getDeepValue;
local l_getRbxthumbWithTypeSizeAndOptions_0 = v1.getRbxthumbWithTypeSizeAndOptions;
local l_UserLibConstants_0 = v1.UserLibConstants;
local v11 = require(l_script_FirstAncestor_0.Components.FriendsLandingPage);
local v12 = require(l_script_FirstAncestor_0.FriendsLandingContext);
local l_PresenceType_0 = v1.RoduxPresence.Enums.PresenceType;
local l_PresenceType_1 = require(l_Parent_0.GraphQLServer).types.PresenceType;
local l_useFriendsListOrderedByPresence_0 = require(l_Parent_0.FriendsCommon).Hooks.useFriendsListOrderedByPresence;
local l_useLocalUserId_0 = require(l_Parent_0.RobloxAppHooks).useLocalUserId;
local v17 = require(l_script_FirstAncestor_0.Friends.filterStates);
local v18 = game:DefineFastInt("FriendsLandingPageSize", 50);
local v19 = {
    [l_PresenceType_1.Offline] = l_PresenceType_0.Offline, 
    [l_PresenceType_1.Online] = l_PresenceType_0.Online, 
    [l_PresenceType_1.InGame] = l_PresenceType_0.InGame, 
    [l_PresenceType_1.InStudio] = l_PresenceType_0.InStudio
};
FriendsLandingContainer = function(_) --[[ Line: 45 ]] --[[ Name: FriendsLandingContainer ]]
    -- upvalues: l_useLocalUserId_0 (copy), l_useSelector_0 (copy), l_getDeepValue_0 (copy), l_useAppPolicy_0 (copy), v3 (copy), v12 (copy), l_useFriendsListOrderedByPresence_0 (copy), v18 (copy), v17 (copy), v4 (copy), l_PresenceType_1 (copy), l_dependencyArray_0 (copy), l_getRbxthumbWithTypeSizeAndOptions_0 (copy), l_UserLibConstants_0 (copy), v19 (copy), l_PresenceType_0 (copy), v11 (copy)
    local v21 = l_useLocalUserId_0();
    local v23 = l_useSelector_0(function(v22) --[[ Line: 47 ]]
        -- upvalues: l_getDeepValue_0 (ref), v21 (copy)
        return l_getDeepValue_0(v22, (("FriendsLanding.Friends.countsByUserId.%*"):format(v21)));
    end);
    local v25 = l_useAppPolicy_0(function(v24) --[[ Line: 51 ]]
        return v24.getShowDisplayName();
    end);
    local v26 = v3.useContext(v12.Context);
    local v27 = l_useFriendsListOrderedByPresence_0({
        userId = v21, 
        pageSize = v18
    });
    local v31 = v3.useMemo(function() --[[ Line: 62 ]]
        -- upvalues: v27 (copy), v26 (copy), v17 (ref), v4 (ref), l_PresenceType_1 (ref)
        local v28 = {};
        if v27.onlineFriends and v27.offlineFriends then
            if v26.filter == v17.All then
                return (v4.List.join(v27.onlineFriends, v27.offlineFriends));
            elseif v26.filter == v17.Offline then
                return v27.offlineFriends;
            elseif v26.filter == v17.Online then
                return v27.onlineFriends;
            else
                local l_onlineFriends_0 = v27.onlineFriends;
                v28 = v4.List.filter(l_onlineFriends_0, function(v30) --[[ Line: 73 ]]
                    -- upvalues: l_PresenceType_1 (ref)
                    return v30.presence and v30.presence.userPresenceType == l_PresenceType_1.InGame;
                end);
            end;
        end;
        return v28;
    end, l_dependencyArray_0(v26.filter, v27.onlineFriends, v27.offlineFriends));
    local v36 = v3.useMemo(function() --[[ Line: 82 ]]
        -- upvalues: v4 (ref), v31 (copy), l_getRbxthumbWithTypeSizeAndOptions_0 (ref), l_UserLibConstants_0 (ref), v19 (ref), l_PresenceType_0 (ref)
        return v4.List.map(v31, function(v32, _) --[[ Line: 83 ]]
            -- upvalues: l_getRbxthumbWithTypeSizeAndOptions_0 (ref), l_UserLibConstants_0 (ref), v19 (ref), l_PresenceType_0 (ref)
            local v34 = l_getRbxthumbWithTypeSizeAndOptions_0(v32.id, l_UserLibConstants_0.RbxthumbTypes.Avatar, 352);
            local v35 = if v32.presence then v19[v32.presence.userPresenceType] else l_PresenceType_0.Offline;
            return {
                id = v32.id, 
                username = "", 
                thumbnail = v34, 
                userPresenceType = v35, 
                universeId = v32.presence and v32.presence.universeId or nil, 
                lastLocation = if v32.presence then v32.presence.lastLocation else nil
            };
        end);
    end, {
        v31
    });
    return v3.createElement(v11, {
        totalFriendCount = v23, 
        friends = v36, 
        fetchMoreFriends = if not v27 or v27.isEndOfList then nil else v27.fetchMoreFriends, 
        refreshFriends = v27.refreshFriendsData, 
        enableDisplayNamePolicy = v25, 
        localUserId = v21
    });
end;
return FriendsLandingContainer;