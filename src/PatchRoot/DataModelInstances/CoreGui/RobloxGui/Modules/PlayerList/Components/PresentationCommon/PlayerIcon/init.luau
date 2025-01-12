local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local v2 = require(l_RobloxGui_0.Modules.Flags.FFlagPlayerIconAvatarFix);
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Packages.RoactRodux);
local v5 = require(l_CorePackages_0.Packages.UIBlox);
local v6 = require(l_CorePackages_0.Packages.t);
local v7 = require(l_RobloxGui_0.Modules.Interfaces.playerInterface);
local l_Connection_0 = script.Parent.Parent.Connection;
local l_WithLayoutValues_0 = require(l_Connection_0.LayoutValues).WithLayoutValues;
local l_ImageSetLabel_0 = v5.Core.ImageSet.ImageSetLabel;
local v11 = v3.PureComponent:extend("PlayerIcon");
v11.validateProps = v6.strictInterface({
    player = v7, 
    layoutOrder = v6.optional(v6.integer), 
    isSmallTouchDevice = v6.optional(v6.boolean), 
    playerIconInfo = v6.strictInterface({
        isPlaceOwner = v6.boolean, 
        avatarIcon = v6.optional(v6.table), 
        specialGroupIcon = v6.optional(v6.table)
    }), 
    playerRelationship = v6.strictInterface({
        isBlocked = v6.boolean, 
        friendStatus = v6.enum(Enum.FriendStatus), 
        isFollowing = v6.boolean, 
        isFollower = v6.boolean
    })
});
local function _(v12, v13) --[[ Line: 42 ]] --[[ Name: getSocialIconImage ]]
    local v14 = v12.FriendIcons[v13.friendStatus];
    if v13.isBlocked then
        return v12.BlockedIcon;
    elseif v14 then
        return v14;
    else
        return nil;
    end;
end;
local function _(v16, v17, v18, v19) --[[ Line: 54 ]] --[[ Name: getIconImage ]]
    local v20 = v16.MembershipIcons[v17.MembershipType];
    local v21 = v16.FriendIcons[v19.friendStatus];
    local v22 = if v19.isBlocked then v16.BlockedIcon else v21 or nil;
    if v22 then
        return v22;
    elseif v18.isPlaceOwner then
        return v16.PlaceOwnerIcon;
    elseif v16.CustomPlayerIcons[v17.UserId] then
        return v16.CustomPlayerIcons[v17.UserId];
    elseif v18.specialGroupIcon then
        return v18.specialGroupIcon;
    elseif v19.isFollowing then
        return v16.FollowingIcon;
    elseif v20 then
        return v20;
    else
        return "";
    end;
end;
v11.render = function(v24) --[[ Line: 74 ]] --[[ Name: render ]]
    -- upvalues: l_WithLayoutValues_0 (copy), v2 (copy), v3 (copy), l_ImageSetLabel_0 (copy)
    return l_WithLayoutValues_0(function(v25) --[[ Line: 75 ]]
        -- upvalues: v2 (ref), v24 (copy), v3 (ref), l_ImageSetLabel_0 (ref)
        local v26 = nil;
        v26 = if v2 then v24.props.playerIconInfo and v24.props.playerIconInfo.avatarIcon else v24.props.playerIconInfo.avatarIcon;
        if v26 == nil then
            v26 = v25.DefaultThumbnail;
        end;
        if v25.IsTenFoot then
            return v3.createElement("ImageLabel", {
                LayoutOrder = v24.props.layoutOrder or 1, 
                Size = v25.PlayerIconBackgroundSize, 
                BackgroundTransparency = 1, 
                Image = v25.PlayerBackgroundImage
            }, {
                v3.createElement("ImageLabel", {
                    Size = v25.PlayerIconSize, 
                    Position = UDim2.new(0.5, 0, 0.5, 0), 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    BackgroundTransparency = 1, 
                    Image = v26, 
                    BorderSizePixel = 0
                })
            });
        elseif v24.props.isSmallTouchDevice then
            local l_createElement_0 = v3.createElement;
            local l_l_ImageSetLabel_0_0 = l_ImageSetLabel_0;
            local v29 = {
                AnchorPoint = Vector2.new(0, 0.5), 
                Position = UDim2.new(0, v25.PlayerNamePaddingXMobile, 0.5, 0), 
                Size = v25.PlayerIconSizeMobile, 
                BackgroundTransparency = 1
            };
            local l_player_0 = v24.props.player;
            local l_playerIconInfo_0 = v24.props.playerIconInfo;
            local l_playerRelationship_0 = v24.props.playerRelationship;
            local v33 = v25.MembershipIcons[l_player_0.MembershipType];
            local v34 = v25.FriendIcons[l_playerRelationship_0.friendStatus];
            local v35 = if l_playerRelationship_0.isBlocked then v25.BlockedIcon else v34 or nil;
            v29.Image = if v35 then v35 else if l_playerIconInfo_0.isPlaceOwner then v25.PlaceOwnerIcon else if v25.CustomPlayerIcons[l_player_0.UserId] then v25.CustomPlayerIcons[l_player_0.UserId] else if l_playerIconInfo_0.specialGroupIcon then l_playerIconInfo_0.specialGroupIcon else if l_playerRelationship_0.isFollowing then v25.FollowingIcon else v33 or "";
            v29.BorderSizePixel = 0;
            return l_createElement_0(l_l_ImageSetLabel_0_0, v29);
        else
            local l_createElement_1 = v3.createElement;
            local l_l_ImageSetLabel_0_1 = l_ImageSetLabel_0;
            local v38 = {
                LayoutOrder = v24.props.layoutOrder, 
                Size = v25.PlayerIconSize, 
                BackgroundTransparency = 1
            };
            local l_player_1 = v24.props.player;
            local l_playerIconInfo_1 = v24.props.playerIconInfo;
            local l_playerRelationship_1 = v24.props.playerRelationship;
            local v42 = v25.MembershipIcons[l_player_1.MembershipType];
            local v43 = v25.FriendIcons[l_playerRelationship_1.friendStatus];
            local v44 = if l_playerRelationship_1.isBlocked then v25.BlockedIcon else v43 or nil;
            v38.Image = if v44 then v44 else if l_playerIconInfo_1.isPlaceOwner then v25.PlaceOwnerIcon else if v25.CustomPlayerIcons[l_player_1.UserId] then v25.CustomPlayerIcons[l_player_1.UserId] else if l_playerIconInfo_1.specialGroupIcon then l_playerIconInfo_1.specialGroupIcon else if l_playerRelationship_1.isFollowing then v25.FollowingIcon else v42 or "";
            v38.BorderSizePixel = 0;
            return l_createElement_1(l_l_ImageSetLabel_0_1, v38);
        end;
    end);
end;
return v4.connect(function(v45) --[[ Line: 133 ]] --[[ Name: mapStateToProps ]]
    return {
        isSmallTouchDevice = v45.displayOptions.isSmallTouchDevice
    };
end, nil)(v11);