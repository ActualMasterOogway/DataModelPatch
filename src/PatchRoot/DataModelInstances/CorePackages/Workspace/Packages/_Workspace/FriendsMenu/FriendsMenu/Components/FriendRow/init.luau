local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsMenu");
local l_Components_0 = l_script_FirstAncestor_0.Components;
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Context_0 = l_script_FirstAncestor_0.Context;
local l_Enums_0 = l_script_FirstAncestor_0.Enums;
local v5 = require(l_Parent_0.React);
local v6 = require(l_Parent_0.UIBlox);
local v7 = require(l_Parent_0.Cryo);
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local v9 = require(l_Parent_0.SharedFlags);
local l_GetFFlagEnableCommonFriendsMenu_0 = v9.GetFFlagEnableCommonFriendsMenu;
local l_GetFFlagEnableFriendMenuMultiSelect_0 = v9.GetFFlagEnableFriendMenuMultiSelect;
local l_GetFFlagEnableSidePaddingPropsFriendsMenu_0 = v9.GetFFlagEnableSidePaddingPropsFriendsMenu;
local l_GetFFlagFriendsMenuDummyLoadingFriendsFix_0 = v9.GetFFlagFriendsMenuDummyLoadingFriendsFix;
local v14 = require(l_Components_0.FriendThumbnail);
local v15 = require(l_Components_0.FriendsMenuButton);
local v16 = require(l_Components_0.FriendInfo);
local v17 = require(l_Components_0.FriendsMenuCheckbox);
local v18 = if l_GetFFlagEnableCommonFriendsMenu_0() then require(l_Context_0.InviteCallbackContext) else require(l_Context_0.InviteFriendContext);
local v19 = require(l_Context_0.SelectedUsersContext);
local v20 = require(l_Enums_0.FriendMenuType);
local l_useStyle_0 = v6.Core.Style.useStyle;
local _ = require(l_script_FirstAncestor_0.friendsMenuModalType);
local v23 = UDim2.new(1, 0, 0.5, 0);
local v24 = Vector2.new(1, 0.5);
local function v25() --[[ Line: 43 ]]

end;
local v26 = {
    sidePadding = 24, 
    isFullRowActivatable = false, 
    backgroundTransparency = nil
};
return function(v27) --[[ Line: 63 ]]
    -- upvalues: v7 (copy), v26 (copy), v5 (copy), l_useStyle_0 (copy), v18 (copy), v19 (copy), l_dependencyArray_0 (copy), l_GetFFlagEnableFriendMenuMultiSelect_0 (copy), l_GetFFlagFriendsMenuDummyLoadingFriendsFix_0 (copy), v20 (copy), v25 (copy), l_GetFFlagEnableSidePaddingPropsFriendsMenu_0 (copy), v14 (copy), v16 (copy), v17 (copy), v23 (copy), v24 (copy), v15 (copy)
    local v28 = v7.Dictionary.join(v26, v27);
    local v29, v30 = v5.useState(false);
    local l_Theme_0 = l_useStyle_0().Theme;
    local l_friend_0 = v28.friend;
    assert(l_friend_0, "friend should be non-nil. Silence type checker.");
    local v33 = v5.useContext(v18);
    local v34 = v5.useContext(v19);
    local l_sidePadding_0 = v28.sidePadding;
    local v36 = v28.isFullRowActivatable and not v28.isFetchingFriends;
    local v37 = v5.useCallback(function() --[[ Line: 77 ]]
        -- upvalues: v33 (copy), l_friend_0 (copy), v28 (copy)
        if v33 and v33.inviteSingleFriend and not l_friend_0.isLoadingPlaceholder then
            v33.inviteSingleFriend(l_friend_0.id, v28.layoutOrder);
        end;
    end, l_dependencyArray_0(v33, v33.inviteSingleFriend, l_friend_0.id, l_friend_0.isLoadingPlaceholder, v28.layoutOrder));
    local v38 = v5.useCallback(function() --[[ Line: 92 ]]
        -- upvalues: v34 (copy), v28 (copy)
        if v34.isFriendSelected(v28.friend.id) then
            v34.removeFriend(v28.friend.id);
            return;
        else
            v34.addFriend(v28.friend.id, v28.friend.displayName);
            return;
        end;
    end, l_dependencyArray_0(v34.isFriendSelected, v34.removeFriend, v34.addFriend, v28.friend.id));
    local v39 = if l_GetFFlagEnableFriendMenuMultiSelect_0() then v5.useCallback(function() --[[ Line: 109 ]]
        -- upvalues: v36 (copy), l_GetFFlagFriendsMenuDummyLoadingFriendsFix_0 (ref), l_friend_0 (copy), l_GetFFlagEnableFriendMenuMultiSelect_0 (ref), v28 (copy), v20 (ref), v37 (copy), v38 (copy)
        if not v36 or l_GetFFlagFriendsMenuDummyLoadingFriendsFix_0() and l_friend_0.isLoadingPlaceholder then
            return;
        elseif not l_GetFFlagEnableFriendMenuMultiSelect_0() or v28.menuType ~= v20.MultiSelect then
            v37();
            return;
        else
            v38();
            return;
        end;
    end, l_dependencyArray_0(v36, v28.menuType, v37, v38, l_friend_0.isLoadingPlaceholder)) else function() --[[ Line: 132 ]]
        -- upvalues: v36 (copy), l_GetFFlagFriendsMenuDummyLoadingFriendsFix_0 (ref), l_friend_0 (copy), v37 (copy)
        if not v36 or l_GetFFlagFriendsMenuDummyLoadingFriendsFix_0() and l_friend_0.isLoadingPlaceholder then
            return;
        else
            v37();
            return;
        end;
    end;
    return v5.createElement("ImageButton", {
        Size = UDim2.new(1, 0, 0, 72), 
        BackgroundColor3 = v29 and l_Theme_0.BackgroundOnHover.Color or l_Theme_0.BackgroundDefault.Color, 
        BackgroundTransparency = if v29 then l_Theme_0.BackgroundOnHover.Transparency else if v28.backgroundTransparency then v28.backgroundTransparency else l_Theme_0.BackgroundDefault.Transparency, 
        BorderSizePixel = 0, 
        LayoutOrder = v28.layoutOrder, 
        [v5.Event.MouseEnter] = function() --[[ Line: 151 ]]
            -- upvalues: v28 (copy), v30 (copy)
            if not v28.isFetchingFriends then
                v30(true);
            end;
        end, 
        [v5.Event.MouseLeave] = function() --[[ Line: 156 ]]
            -- upvalues: v30 (copy)
            v30(false);
        end, 
        [v5.Event.Activated] = if not (l_GetFFlagFriendsMenuDummyLoadingFriendsFix_0() and l_friend_0.isLoadingPlaceholder) and v36 then v39 else v25, 
        AutoButtonColor = v36
    }, {
        Padding = v5.createElement("UIPadding", {
            PaddingRight = if l_GetFFlagEnableSidePaddingPropsFriendsMenu_0() then UDim.new(0, l_sidePadding_0) else UDim.new(0, 24), 
            PaddingLeft = if l_GetFFlagEnableSidePaddingPropsFriendsMenu_0() then UDim.new(0, l_sidePadding_0) else UDim.new(0, 24), 
            PaddingBottom = UDim.new(0, 8), 
            PaddingTop = UDim.new(0, 8)
        }), 
        ThumbnailAndPresenceWrapper = v5.createElement(v14, {
            friend = l_friend_0, 
            isHoverRow = v29, 
            size = UDim2.new(0, 56, 0, 56), 
            position = UDim2.new(0, 0, 0.5, 0), 
            anchorPoint = Vector2.new(0, 0.5), 
            isFetchingFriends = v28.isFetchingFriends
        }), 
        UserInfo = v5.createElement(v16, {
            position = UDim2.new(0, 56, 0, 0), 
            size = if l_GetFFlagEnableSidePaddingPropsFriendsMenu_0() then UDim2.new(1, -134, 1, 0) else UDim2.new(1, -134, 1, 0), 
            friend = l_friend_0, 
            isFetchingFriendsNames = v28.isFetchingFriendsNames
        }), 
        InviteButton = if l_GetFFlagEnableFriendMenuMultiSelect_0() and v28.menuType == v20.MultiSelect then v5.createElement(v17, {
            size = UDim2.new(0, 66, 0, 36), 
            position = v23, 
            anchorPoint = v24, 
            friend = l_friend_0, 
            isDisabled = v28.isFetchingFriends
        }) else v5.createElement(v15, {
            size = UDim2.new(0, 66, 0, 36), 
            position = v23, 
            anchorPoint = v24, 
            friend = l_friend_0, 
            onInvite = v37, 
            isFullRowActivatable = v28.isFullRowActivatable
        })
    });
end;