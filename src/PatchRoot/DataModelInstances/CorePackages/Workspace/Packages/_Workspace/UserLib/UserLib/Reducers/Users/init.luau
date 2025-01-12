local l_script_FirstAncestor_0 = script:FindFirstAncestor("UserLib");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Immutable_0 = require(l_Parent_0.AppCommonLib).Immutable;
local l_AddUser_0 = require(l_script_FirstAncestor_0.Actions).AddUser;
local l_AddUsers_0 = require(l_script_FirstAncestor_0.Actions).AddUsers;
local l_ReceivedUserPresence_0 = require(l_script_FirstAncestor_0.Actions).ReceivedUserPresence;
local l_RemoveUser_0 = require(l_script_FirstAncestor_0.Actions).RemoveUser;
local l_SetUserIsFriend_0 = require(l_script_FirstAncestor_0.Actions).SetUserIsFriend;
local l_SetUserMembershipType_0 = require(l_script_FirstAncestor_0.Actions).SetUserMembershipType;
local l_SetUserPresence_0 = require(l_script_FirstAncestor_0.Actions).SetUserPresence;
local l_ReceivedDisplayName_0 = require(l_script_FirstAncestor_0.Actions).ReceivedDisplayName;
return function(v11, v12) --[[ Line: 16 ]]
    -- upvalues: l_AddUser_0 (copy), l_Immutable_0 (copy), l_AddUsers_0 (copy), l_SetUserIsFriend_0 (copy), l_SetUserPresence_0 (copy), l_ReceivedUserPresence_0 (copy), l_SetUserMembershipType_0 (copy), l_RemoveUser_0 (copy), l_ReceivedDisplayName_0 (copy)
    v11 = v11 or {};
    assert(v11, "");
    if v12.type == l_AddUser_0.name then
        local l_user_0 = v12.user;
        return (l_Immutable_0.Set(v11, l_user_0.id, l_user_0));
    elseif v12.type == l_AddUsers_0.name then
        local l_users_0 = v12.users;
        local v15 = {};
        for v16, v17 in pairs(l_users_0) do
            local v18 = v11[v16];
            if v18 then
                v15[v16] = l_Immutable_0.JoinDictionaries(v18, v17);
            else
                v15[v16] = v17;
            end;
        end;
        return (l_Immutable_0.JoinDictionaries(v11, v15));
    elseif v12.type == l_SetUserIsFriend_0.name then
        local v19 = v11[v12.userId];
        if v19 then
            local v20 = l_Immutable_0.Set(v19, "isFriend", v12.isFriend);
            return (l_Immutable_0.Set(v11, v19.id, v20));
        else
            warn("Setting isFriend on user", v12.userId, "who doesn't exist yet");
            return v11;
        end;
    elseif v12.type == l_SetUserPresence_0.name then
        local v21 = v11[v12.userId];
        if v21 then
            local v22 = l_Immutable_0.JoinDictionaries(v21, {
                presence = v12.presence, 
                lastLocation = v12.lastLocation
            });
            return (l_Immutable_0.Set(v11, v21.id, v22));
        else
            warn("Setting presence on user", v12.userId, "who doesn't exist yet");
            return v11;
        end;
    else
        if v12.type == l_ReceivedUserPresence_0.name then
            local v23 = v11[v12.userId];
            if v23 then
                return (l_Immutable_0.JoinDictionaries(v11, {
                    [v12.userId] = l_Immutable_0.JoinDictionaries(v23, {
                        presence = v12.presence, 
                        lastLocation = v12.lastLocation, 
                        placeId = v12.placeId, 
                        rootPlaceId = v12.rootPlaceId, 
                        gameInstanceId = v12.gameInstanceId, 
                        lastOnline = v12.lastOnline, 
                        universeId = v12.universeId
                    })
                }));
            end;
        elseif v12.type == l_SetUserMembershipType_0.name then
            local v24 = v11[v12.userId];
            if v24 then
                return (l_Immutable_0.JoinDictionaries(v11, {
                    [v12.userId] = l_Immutable_0.JoinDictionaries(v24, {
                        membership = v12.membershipType
                    })
                }));
            end;
        elseif v12.type == l_RemoveUser_0.name then
            if v11[v12.userId] then
                return (l_Immutable_0.RemoveFromDictionary(v11, v12.userId));
            end;
        elseif v12.type == l_ReceivedDisplayName_0.name then
            local v25 = v11[v12.userId];
            if v25 then
                v11 = l_Immutable_0.JoinDictionaries(v11, {
                    [v12.userId] = l_Immutable_0.JoinDictionaries(v25, {
                        displayName = v12.displayName
                    })
                });
            end;
        end;
        return v11;
    end;
end;