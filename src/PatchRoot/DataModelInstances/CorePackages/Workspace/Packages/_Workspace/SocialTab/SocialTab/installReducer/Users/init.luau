local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialTab");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_NetworkingChat_0 = v1.NetworkingChat;
local v3 = require(l_script_FirstAncestor_0.utils.getUsersFromConversations);
local v4 = require(l_script_FirstAncestor_0.Flags.getFFlagSocialTabReplaceRefreshConversations);
local l_llama_0 = v1.llama;
local l_RoduxUsers_0 = v1.RoduxUsers;
local function v8(v7) --[[ Line: 12 ]] --[[ Name: userUpdatedFromUser ]]
    -- upvalues: l_RoduxUsers_0 (copy)
    return l_RoduxUsers_0.Actions.UserUpdated({
        id = v7.id, 
        username = v7.name, 
        displayName = v7.displayName, 
        friendRank = v7.friendRank, 
        hasVerifiedBadge = v7.hasVerifiedBadge
    });
end;
local v11 = {
    AddUser = function(v9) --[[ Line: 23 ]] --[[ Name: AddUser ]]
        -- upvalues: v8 (copy)
        return {
            v8(v9.user)
        };
    end, 
    AddUsers = function(v10) --[[ Line: 27 ]] --[[ Name: AddUsers ]]
        -- upvalues: l_llama_0 (copy), v8 (copy)
        return l_llama_0.Dictionary.values(l_llama_0.Dictionary.map(v10.users, v8));
    end, 
    [v4() and l_NetworkingChat_0.GetUserConversations.Succeeded.name or ""] = v4() and v3 or nil
};
local v12 = l_RoduxUsers_0.installReducer();
return function(v13, v14) --[[ Line: 38 ]]
    -- upvalues: v11 (copy), v4 (copy), l_llama_0 (copy), v12 (copy)
    v13 = v13 or {
        byUserId = {}
    };
    local v15 = {
        v14
    };
    local v16 = v11[v14.type];
    if v16 then
        v15 = if v4() then v16(v14, v13) else v16(v14);
    end;
    return l_llama_0.List.reduce(v15, v12, v13);
end;