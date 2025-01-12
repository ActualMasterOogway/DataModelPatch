local l_script_FirstAncestor_0 = script:FindFirstAncestor("GraphQLServer");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_GraphQLError_0 = require(l_script_FirstAncestor_0.Parent.GraphQL).GraphQLError;
local _ = require(l_script_FirstAncestor_0.graphql.generatedTypes);
local _ = require(l_Parent_0.LuauPolyfill);
local v5 = require(l_script_FirstAncestor_0.graphql.connectors.FriendsConnector);
local l_getAllFriendsByUserId_0 = v5.getAllFriendsByUserId;
local l_getOnlineFriendsByUserId_0 = v5.getOnlineFriendsByUserId;
local v8 = game:DefineFastFlag("SetHasVerifiedBadgeToFalseGraphQL", false);
local function _(v9) --[[ Line: 22 ]] --[[ Name: convertToStringWithDefault ]]
    if v9 then
        return (tostring(v9));
    else
        return "";
    end;
end;
return {
    UserPresence = {
        id = function(v11) --[[ Line: 28 ]] --[[ Name: id ]]
            return v11.id;
        end, 
        userPresenceType = function(v12) --[[ Line: 31 ]] --[[ Name: userPresenceType ]]
            return v12.userPresence.UserPresenceType;
        end, 
        gameId = function(v13) --[[ Line: 34 ]] --[[ Name: gameId ]]
            local l_gameInstanceId_0 = v13.userPresence.gameInstanceId;
            if l_gameInstanceId_0 then
                return (tostring(l_gameInstanceId_0));
            else
                return "";
            end;
        end, 
        placeId = function(v15) --[[ Line: 37 ]] --[[ Name: placeId ]]
            local l_placeId_0 = v15.userPresence.placeId;
            if l_placeId_0 then
                return (tostring(l_placeId_0));
            else
                return "";
            end;
        end, 
        rootPlaceId = function(v17) --[[ Line: 40 ]] --[[ Name: rootPlaceId ]]
            local l_rootPlaceId_0 = v17.userPresence.rootPlaceId;
            if l_rootPlaceId_0 then
                return (tostring(l_rootPlaceId_0));
            else
                return "";
            end;
        end, 
        universeId = function(v19) --[[ Line: 43 ]] --[[ Name: universeId ]]
            local l_universeId_0 = v19.userPresence.universeId;
            if l_universeId_0 then
                return (tostring(l_universeId_0));
            else
                return "";
            end;
        end, 
        lastLocation = function(v21) --[[ Line: 46 ]] --[[ Name: lastLocation ]]
            return v21.userPresence.lastLocation;
        end, 
        lastOnline = function(v22) --[[ Line: 49 ]] --[[ Name: lastOnline ]]
            return v22.userPresence.lastOnline;
        end
    }, 
    Friend = {
        targetUserId = function(_, _, _, v26) --[[ Line: 54 ]] --[[ Name: targetUserId ]]
            return v26.variableValues.userId;
        end, 
        displayName = function() --[[ Line: 57 ]] --[[ Name: displayName ]]
            -- upvalues: l_GraphQLError_0 (copy)
            return l_GraphQLError_0.new("The displayName field is being deprecated, please use UserProfile to retrieve names");
        end, 
        presence = function(v27) --[[ Line: 62 ]] --[[ Name: presence ]]
            return v27;
        end, 
        hasVerifiedBadge = v8 and function(_) --[[ Line: 66 ]]
            return false;
        end or nil
    }, 
    AllFriendsPage = {
        targetUserId = function(_, _, _, v32) --[[ Line: 72 ]] --[[ Name: targetUserId ]]
            return v32.variableValues.userId;
        end, 
        curCursor = function(_, _, _, v36) --[[ Line: 75 ]] --[[ Name: curCursor ]]
            return v36.variableValues.pageCursor or "";
        end, 
        nextCursor = function(v37) --[[ Line: 78 ]] --[[ Name: nextCursor ]]
            return v37.NextCursor or "";
        end, 
        prevCursor = function(v38) --[[ Line: 81 ]] --[[ Name: prevCursor ]]
            return v38.PreviousCursor or "";
        end, 
        friends = function(v39) --[[ Line: 84 ]] --[[ Name: friends ]]
            return v39.PageItems or {};
        end
    }, 
    Query = {
        allFriendsByUserId = function(_, v41, v42) --[[ Line: 89 ]] --[[ Name: allFriendsByUserId ]]
            -- upvalues: l_getAllFriendsByUserId_0 (copy)
            return l_getAllFriendsByUserId_0(v41, v42.fetchImpl);
        end, 
        onlineFriendsByUserId = function(_, v44, v45) --[[ Line: 92 ]] --[[ Name: onlineFriendsByUserId ]]
            -- upvalues: l_getOnlineFriendsByUserId_0 (copy)
            return l_getOnlineFriendsByUserId_0(v44, v45.fetchImpl);
        end
    }
};