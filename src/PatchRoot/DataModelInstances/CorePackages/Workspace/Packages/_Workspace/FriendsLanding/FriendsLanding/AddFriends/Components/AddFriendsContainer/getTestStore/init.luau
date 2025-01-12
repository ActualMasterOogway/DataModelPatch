local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local l_AddFriends_0 = l_script_FirstAncestor_0.AddFriends;
local v2 = require(l_AddFriends_0.dependencies);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Rodux_0 = v2.Rodux;
local l_llama_0 = v2.llama;
local v6 = require(l_script_FirstAncestor_0.TestHelpers.getBaseTestStates);
local l_FFlagAddFriendsSeparateReducers_0 = require(l_Parent_0.SharedFlags).FFlagAddFriendsSeparateReducers;
local v8 = if l_FFlagAddFriendsSeparateReducers_0 then require(l_AddFriends_0.Redux.RODUX_KEY) else require(l_script_FirstAncestor_0.Common.Constants).RODUX_KEY;
return function(v9, v10, v11) --[[ Line: 16 ]]
    -- upvalues: v6 (copy), v8 (copy), l_llama_0 (copy), l_Rodux_0 (copy), l_FFlagAddFriendsSeparateReducers_0 (copy)
    local v12 = if not v10 or v9 then if v10 and v9 then v6({
        roduxKey = v8
    }).friendsAndRecommendations else v6({
        roduxKey = v8
    }).smallNumbersOfFriends else v6({
        roduxKey = v8
    }).recommendationsOnly;
    local v13 = v12[v8];
    local v14 = {};
    local v15 = 0;
    local v16 = nil;
    local v17 = {};
    local v18 = {};
    local v19 = {};
    local v20 = {};
    local v21 = {};
    local v22 = {};
    local v23 = {};
    if v9 then
        v14 = v13.Users.byUserId;
        v15 = #l_llama_0.Dictionary.keys(v13.Users.byUserId);
        v16 = "next";
        v20 = {
            ["36"] = "game_universe_id_36", 
            ["37"] = "game_universe_id_37", 
            ["38"] = "game_universe_id_39"
        };
        v18 = {
            ["36"] = {
                isFollowing = true, 
                isFollowed = true
            }
        };
        v19 = {
            game_universe_id_36 = {
                name = "test game"
            }, 
            game_universe_id_37 = {
                name = "test game"
            }, 
            game_universe_id_38 = {
                name = "test game"
            }
        };
        v21 = {
            ["1"] = {
                "Bob", 
                "Corey", 
                "Andrew"
            }, 
            ["2"] = {}, 
            ["3"] = {}
        };
        v22 = {
            shouldShowContactImporterFeature = true, 
            shouldShowContactImporterUpsellModal = true, 
            isDiscoverabilityUnset = false
        };
    end;
    if v10 then
        v23 = v6({
            roduxKey = v8
        }).recommendationsOnly[v8].Friends.recommendations;
    end;
    return l_Rodux_0.Store.new(function() --[[ Line: 71 ]]
        -- upvalues: l_FFlagAddFriendsSeparateReducers_0 (ref), v13 (copy), v12 (copy), l_llama_0 (ref), v8 (ref), v14 (ref), v15 (ref), v16 (ref), v20 (ref), v21 (ref), v23 (ref), v17 (copy), v18 (ref), v19 (ref), v22 (ref), v11 (copy)
        return {
            FriendsLanding = if l_FFlagAddFriendsSeparateReducers_0 then {
                NetworkStatus = v13.NetworkStatus
            } else nil, 
            ScreenSize = Vector2.new(540, 960), 
            GlobalGuiInset = {
                top = 20, 
                bottom = 20, 
                left = 20, 
                right = 20
            }, 
            LocalUserId = v12.LocalUserId, 
            FriendStatuses = l_llama_0.Dictionary.map(v13.Users.byUserId, function() --[[ Line: 82 ]]
                return Enum.FriendStatus.FriendRequestReceived;
            end), 
            [v8] = l_llama_0.Dictionary.join({
                Friends = {
                    requests = {
                        byUserId = v14, 
                        receivedCount = v15, 
                        nextPageCursor = v16, 
                        sourceUniverseIds = v20, 
                        mutualFriends = v21
                    }, 
                    recommendations = v23
                }, 
                Users = v13.Users, 
                Presence = v13.Presence, 
                NetworkStatus = v13.NetworkStatus, 
                UserFollowers = v17, 
                IsUserFollowing = v18, 
                Games = {
                    byGameId = v19
                }, 
                ShowContactImporterParams = v22
            }, v11 or {})
        };
    end, {}, {
        l_Rodux_0.thunkMiddleware
    });
end;