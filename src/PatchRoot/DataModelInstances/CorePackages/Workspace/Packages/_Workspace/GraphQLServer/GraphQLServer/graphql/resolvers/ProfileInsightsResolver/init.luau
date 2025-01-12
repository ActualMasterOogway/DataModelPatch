local l_Parent_0 = script:FindFirstAncestor("GraphQLServer").Parent;
local l_HttpService_0 = game:GetService("HttpService");
local v2 = require(l_Parent_0.Cryo);
local _ = require(script.Parent.Parent.generatedTypes);
local _ = require(l_Parent_0.LuauPolyfill);
local v5 = require(script.Parent.Parent.connectors.ProfileInsightsConnector);
local l_findProfileInsightsByUserIds_0 = v5.findProfileInsightsByUserIds;
local l_findProfileInsightsByUserIdsFeed_0 = v5.findProfileInsightsByUserIdsFeed;
local function _(v8) --[[ Line: 22 ]]
    return v8 and v8.profileInsights and v8.profileInsights[1] or nil;
end;
return {
    ProfileInsights = {
        targetUserId = function(v10) --[[ Line: 29 ]] --[[ Name: targetUserId ]]
            return v10.targetUser;
        end, 
        mutualFriends = function(v11) --[[ Line: 32 ]] --[[ Name: mutualFriends ]]
            -- upvalues: v2 (copy)
            local v12 = v11 and v11.profileInsights and v11.profileInsights[1] or nil;
            local v13 = if v12 and v12.mutualFriendInsight then v12.mutualFriendInsight.mutualFriends else {};
            if not v13 then
                return {};
            else
                return v2.List.foldLeft(v2.Dictionary.keys(v13), function(v14, v15) --[[ Line: 43 ]]
                    -- upvalues: v13 (copy)
                    local v16 = v13[v15];
                    table.insert(v14, {
                        id = v15, 
                        username = v16.username, 
                        displayName = v16.displayName
                    });
                    return v14;
                end, {});
            end;
        end, 
        isOfflineFrequents = function(v17) --[[ Line: 54 ]] --[[ Name: isOfflineFrequents ]]
            local v18 = v17 and v17.profileInsights and v17.profileInsights[1] or nil;
            local v19 = v18 and v18.offlineFrequentsInsight or nil;
            if v19 and v19.havePlayedTogether then
                return true;
            else
                return false;
            end;
        end
    }, 
    ProfileInsightsPages = {
        id = function(v20) --[[ Line: 63 ]] --[[ Name: id ]]
            -- upvalues: l_HttpService_0 (copy)
            if v20.pageId then
                return v20.pageId;
            else
                return (l_HttpService_0:GenerateGUID(false));
            end;
        end, 
        profileInsights = function(v21) --[[ Line: 66 ]] --[[ Name: profileInsights ]]
            return v21.profileInsights;
        end
    }, 
    Query = {
        profilesInsights = function(_, v23, v24) --[[ Line: 72 ]] --[[ Name: profilesInsights ]]
            -- upvalues: l_findProfileInsightsByUserIdsFeed_0 (copy)
            return l_findProfileInsightsByUserIdsFeed_0(v23.userIds, v23.count, v23.pageId, v24.fetchImpl);
        end, 
        profilesInsightsByUserIds = function(_, v26, v27) --[[ Line: 75 ]] --[[ Name: profilesInsightsByUserIds ]]
            -- upvalues: l_findProfileInsightsByUserIds_0 (copy)
            return l_findProfileInsightsByUserIds_0(v26.userIds, v26.count, v27.fetchImpl);
        end
    }
};