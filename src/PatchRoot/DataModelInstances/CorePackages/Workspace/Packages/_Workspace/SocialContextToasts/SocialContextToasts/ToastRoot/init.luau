local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialContextToasts");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.ToastWrapper);
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local v4 = require(l_Parent_0.React);
local v5 = require(l_script_FirstAncestor_0.Enums.ToastTypes);
local l_ButtonType_0 = require(l_Parent_0.UIBlox).App.Button.Enum.ButtonType;
local v7 = require(l_Parent_0.Cryo);
local l_GetFFlagSocialContextToastEventStream_0 = require(l_Parent_0.SharedFlags).GetFFlagSocialContextToastEventStream;
return function(v9) --[[ Line: 42 ]] --[[ Name: ToastRoot ]]
    -- upvalues: l_useSelector_0 (copy), l_GetFFlagSocialContextToastEventStream_0 (copy), v7 (copy), v5 (copy), v4 (copy), v2 (copy), l_ButtonType_0 (copy)
    local v11 = l_useSelector_0(function(v10) --[[ Line: 43 ]]
        return v10.ToastContent;
    end);
    local v12 = if l_GetFFlagSocialContextToastEventStream_0() then v7.Dictionary.join(v9.analyticsProps, {
        toastType = v11.toastType
    }) else nil;
    if v11.toastType == v5.None then
        return nil;
    elseif v11.toastType == v5.YouJoinedFriends then
        local v13 = nil;
        local l_userList_0 = v11.userList;
        if #l_userList_0 == 1 then
            v13 = {
                label = {
                    "Feature.SocialContextToast.Message.YouJoinedOneFriend"; 
                    FRIEND_NAME = l_userList_0[1].name
                }
            };
        elseif #l_userList_0 == 2 then
            v13 = {
                label = {
                    "Feature.SocialContextToast.Message.YouJoinedTwoFriends"; 
                    FRIEND_NAME_ONE = l_userList_0[1].name, 
                    FRIEND_NAME_TWO = l_userList_0[2].name
                }
            };
        elseif #l_userList_0 > 2 then
            v13 = {
                label = {
                    "Feature.SocialContextToast.Message.YouJoinedManyFriends"; 
                    FRIEND_NAME = l_userList_0[1].name, 
                    FRIEND_COUNT = #l_userList_0 - 1
                }
            };
        end;
        local v15 = {};
        for v16, _ in l_userList_0 do
            table.insert(v15, l_userList_0[v16].userId);
        end;
        return v4.createElement(v2, {
            toastStrings = v13, 
            userIdList = v15, 
            analyticsProps = v12
        });
    elseif v11.toastType == v5.FriendJoinedYou then
        return v4.createElement(v2, {
            toastStrings = {
                label = {
                    "Feature.SocialContextToast.Message.FriendJoinedYou"; 
                    FRIEND_NAME = v11.joinerName
                }
            }, 
            userIdList = {
                v11.joinerUserId
            }, 
            analyticsProps = v12
        });
    elseif v11.toastType == v5.FriendInNonRootPlace then
        return v4.createElement(v2, {
            toastStrings = {
                label = {
                    "Feature.SocialContextToast.Message.FriendInNonRootPlace"; 
                    FRIEND_NAME = v11.joinerName
                }
            }, 
            userIdList = {
                v11.joinerUserId
            }, 
            analyticsProps = v12
        });
    elseif v11.toastType == v5.FollowYourFriend then
        return v4.createElement(v2, {
            toastStrings = {
                label = {
                    "Feature.SocialContextToast.Message.FollowedFriendInOtherUniverse"; 
                    FRIEND_NAME = v11.joinerName, 
                    EXPERIENCE_NAME = v11.experienceName
                }, 
                button = "Feature.SocialContextToast.Action.JoinFriend"
            }, 
            userIdList = {
                v11.joinerUserId
            }, 
            onActivated = v11.onActivated, 
            buttonType = l_ButtonType_0.PrimaryContextual, 
            analyticsProps = v12
        });
    elseif v11.toastType == v5.InviteBack then
        return v4.createElement(v2, {
            toastStrings = {
                label = {
                    "Feature.SocialContextToast.Message.FollowedFriendNotInGame"; 
                    FRIEND_NAME = v11.joinerName
                }, 
                button = "Feature.SocialContextToast.Action.InviteBack"
            }, 
            userIdList = {
                v11.joinerUserId
            }, 
            onActivated = v11.onActivated, 
            areUsersActive = false, 
            analyticsProps = v12
        });
    elseif v11.toastType == v5.InviteSuccess then
        return v4.createElement(v2, {
            toastStrings = {
                label = "Feature.SocialContextToast.Message.InvitationConfirmation"
            }, 
            analyticsProps = v12
        });
    elseif v11.toastType == v5.InviteFailure then
        return v4.createElement(v2, {
            toastStrings = {
                label = "Feature.SocialContextToast.Message.InvitationFailure"
            }, 
            analyticsProps = v12
        });
    else
        return nil;
    end;
end;