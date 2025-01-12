local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_AddFriends_0 = l_script_FirstAncestor_0.AddFriends;
local l_Dash_0 = v1.Dash;
local l_llama_0 = v1.llama;
local l_Rodux_0 = v1.Rodux;
local l_Constants_0 = require(l_Parent_0.ContactImporter).Constants;
local l_FFlagAddFriendsSeparateReducers_0 = require(l_Parent_0.SharedFlags).FFlagAddFriendsSeparateReducers;
local v9 = if l_FFlagAddFriendsSeparateReducers_0 then require(l_AddFriends_0.Networking.FriendsNetworking) else v1.FriendsNetworking;
local l_FriendRequestCreated_0 = (if l_FFlagAddFriendsSeparateReducers_0 then require(l_AddFriends_0.Redux.RoduxFriends) else v1.RoduxFriends).Actions.FriendRequestCreated;
local v11 = require(script.Parent.Actions.ContactImporterWarningSeen);
local v12 = {
    contactImporterFriendRequests = {}, 
    seenContactImporterFriendRequest = false
};
local function v17(v13, v14) --[[ Line: 36 ]]
    -- upvalues: l_llama_0 (copy), l_Dash_0 (copy)
    return {
        seenContactImporterFriendRequest = v13.seenContactImporterFriendRequest, 
        contactImporterFriendRequests = l_llama_0.Dictionary.filter(v13.contactImporterFriendRequests, function(_, v16) --[[ Line: 39 ]]
            -- upvalues: l_Dash_0 (ref), v14 (copy)
            return not l_Dash_0.includes(v14, v16);
        end)
    };
end;
return l_Rodux_0.createReducer(v12, {
    [v9.AcceptFriendRequestFromUserId.Succeeded.name] = function(v18, v19) --[[ Line: 46 ]]
        -- upvalues: v17 (copy)
        return (v17(v18, v19.ids));
    end, 
    [v9.DeclineFriendRequestFromUserId.Succeeded.name] = function(v20, v21) --[[ Line: 52 ]]
        -- upvalues: v17 (copy)
        return (v17(v20, v21.ids));
    end, 
    [l_FriendRequestCreated_0.name] = function(v22, v23) --[[ Line: 58 ]]
        -- upvalues: l_Constants_0 (copy), l_llama_0 (copy)
        local l_id_0 = v23.id;
        if v23.originSourceType == l_Constants_0.PHONE_CONTACT_IMPORTER then
            return l_llama_0.Dictionary.join(v22, {
                contactImporterFriendRequests = l_llama_0.Dictionary.join(v22.contactImporterFriendRequests, {
                    [tostring(l_id_0)] = true
                })
            });
        else
            return v22;
        end;
    end, 
    [v9.GetFriendRequests.Succeeded.name] = function(v25, v26) --[[ Line: 72 ]]
        -- upvalues: l_Constants_0 (copy), l_llama_0 (copy)
        local l_data_0 = v26.responseBody.data;
        local v28 = {};
        for _, v30 in pairs(l_data_0) do
            if v30.friendRequest.originSourceType == l_Constants_0.PHONE_CONTACT_IMPORTER then
                v28[tostring(v30.id)] = true;
            end;
        end;
        return l_llama_0.Dictionary.join(v25, {
            contactImporterFriendRequests = l_llama_0.Dictionary.join(v25.contactImporterFriendRequests, v28)
        });
    end, 
    [v11.name] = function(v31, _) --[[ Line: 88 ]]
        -- upvalues: l_llama_0 (copy)
        if not l_llama_0.isEmpty(v31.contactImporterFriendRequests) then
            return l_llama_0.Dictionary.join(v31, {
                seenContactImporterFriendRequest = true
            });
        else
            return v31;
        end;
    end
});