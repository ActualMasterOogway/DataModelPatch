local l_Players_0 = game:GetService("Players");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("UserLib");
local v2 = require(l_script_FirstAncestor_0.Utils.isPlayerVerified);
local v3 = require(l_script_FirstAncestor_0.Actions);
local l_AddUser_0 = v3.AddUser;
local l_SetLocalUserId_0 = v3.SetLocalUserId;
local l_SetUserMembershipType_0 = v3.SetUserMembershipType;
local l_SetLocalUserUnder13_0 = v3.SetLocalUserUnder13;
local l_UserModel_0 = require(l_script_FirstAncestor_0.Models).UserModel;
return function() --[[ Line: 13 ]]
    -- upvalues: l_Players_0 (copy), l_UserModel_0 (copy), v2 (copy), l_AddUser_0 (copy), l_SetLocalUserId_0 (copy), l_SetUserMembershipType_0 (copy), l_SetLocalUserUnder13_0 (copy)
    return function(v9) --[[ Line: 14 ]]
        -- upvalues: l_Players_0 (ref), l_UserModel_0 (ref), v2 (ref), l_AddUser_0 (ref), l_SetLocalUserId_0 (ref), l_SetUserMembershipType_0 (ref), l_SetLocalUserUnder13_0 (ref)
        local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
        local v11 = tostring(l_LocalPlayer_0.UserId);
        local v12 = l_UserModel_0.fromDataTable({
            id = v11, 
            name = l_LocalPlayer_0.Name, 
            displayName = l_LocalPlayer_0.displayName, 
            isFriend = false, 
            hasVerifiedBadge = v2(l_LocalPlayer_0)
        });
        v9:dispatch(l_AddUser_0(v12));
        v9:dispatch(l_SetLocalUserId_0(v11));
        v9:dispatch(l_SetUserMembershipType_0(v11, l_LocalPlayer_0.MembershipType));
        v9:dispatch(l_SetLocalUserUnder13_0(l_LocalPlayer_0:GetUnder13()));
    end;
end;