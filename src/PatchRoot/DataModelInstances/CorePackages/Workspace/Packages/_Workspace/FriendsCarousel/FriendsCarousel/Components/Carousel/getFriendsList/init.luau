local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_SocialLibraries_0 = v1.SocialLibraries;
local l_User_0 = l_SocialLibraries_0.User;
local l_llama_0 = v1.llama;
local l_RoduxPresence_0 = v1.RoduxPresence;
local v6 = require(script.Parent.mapIdToUser);
local _ = require(l_Parent_0.Common.LocalTypes);
local l_getDeepValue_0 = l_SocialLibraries_0.Dictionary.getDeepValue;
return function(v9, v10, v11) --[[ Line: 11 ]]
    -- upvalues: l_getDeepValue_0 (copy), l_llama_0 (copy), v6 (copy), l_RoduxPresence_0 (copy), l_User_0 (copy)
    local v12 = tostring(v9.LocalUserId);
    local v13 = l_getDeepValue_0(v9, string.format("%s.Friends.byUserId.%s", v10, v12)) or {};
    local function v16(v14) --[[ Line: 15 ]]
        -- upvalues: l_getDeepValue_0 (ref), v9 (copy), v10 (copy), v12 (copy), l_llama_0 (ref), v6 (ref), v11 (copy), l_RoduxPresence_0 (ref)
        local v15 = l_getDeepValue_0(v9, string.format("%s.Friends.friendsRankByUserId.%s.%s", v10, v12, v14));
        return l_llama_0.Dictionary.join(v6(v9, v10, v11)(v14), l_RoduxPresence_0.Selectors.getUserPresenceByUserId(v9, v14), {
            isFriendWithUser = true, 
            friendRank = v15
        });
    end;
    return l_llama_0.List.sort(l_llama_0.List.map(v13, v16), l_User_0.sortFriendsByCorrectedPresenceAndRank);
end;