local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsMenu");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_getRbxthumbWithTypeSizeAndOptions_0 = require(l_Parent_0.UserLib).Utils.getRbxthumbWithTypeSizeAndOptions;
local v4 = require(l_Parent_0.UserLib);
local v5 = require(l_Parent_0.UIBlox);
local l_UserModel_0 = require(l_Parent_0.UserLib).Models.UserModel;
local _ = require(l_script_FirstAncestor_0.friendsMenuModalType);
local l_ImageSetLabel_0 = v5.Core.ImageSet.ImageSetLabel;
local l_IconSize_0 = v5.App.Constant.IconSize;
local l_ShimmerPanel_0 = v5.App.Loading.ShimmerPanel;
local l_Images_0 = v5.App.ImageSet.Images;
local l_useStyle_0 = v5.Core.Style.useStyle;
local l_Constants_0 = v4.Utils.Constants;
local l_Size150x150_0 = l_Constants_0.RbxThumbnailSizes.Size150x150;
local l_AvatarHeadShot_0 = l_Constants_0.RbxthumbTypes.AvatarHeadShot;
local v16 = {
    [l_UserModel_0.PresenceType.ONLINE] = {
        Image = "component_assets/circle_16", 
        Color = Color3.fromRGB(0, 180, 109), 
        Size = UDim2.new(0, 12, 0, 12)
    }, 
    [l_UserModel_0.PresenceType.IN_GAME] = {
        Image = "icons/menu/games_small"
    }, 
    [l_UserModel_0.PresenceType.IN_STUDIO] = {
        Image = "icons/logo/studiologo_small"
    }
};
return function(v17) --[[ Line: 52 ]]
    -- upvalues: l_useStyle_0 (copy), v2 (copy), l_Constants_0 (copy), l_Size150x150_0 (copy), l_getRbxthumbWithTypeSizeAndOptions_0 (copy), l_AvatarHeadShot_0 (copy), l_UserModel_0 (copy), v16 (copy), l_ShimmerPanel_0 (copy), l_ImageSetLabel_0 (copy), l_Images_0 (copy), l_IconSize_0 (copy)
    local l_friend_0 = v17.friend;
    assert(l_friend_0, "friend should be non-nil. Silence type checker.");
    local v19 = l_useStyle_0();
    local v22 = v2.useMemo(function() --[[ Line: 57 ]]
        -- upvalues: l_friend_0 (copy), l_Constants_0 (ref), l_Size150x150_0 (ref), l_getRbxthumbWithTypeSizeAndOptions_0 (ref), l_AvatarHeadShot_0 (ref)
        local v20 = nil;
        if l_friend_0 then
            local v21 = l_Constants_0.RbxThumbnailSizeToNumberSize[l_Size150x150_0];
            v20 = l_getRbxthumbWithTypeSizeAndOptions_0(l_friend_0.id, l_AvatarHeadShot_0, v21);
        end;
        if not v20 then
            v20 = "rbxasset://textures/ui/LuaApp/graphic/ph-avatar-portrait.png";
        end;
        return v20;
    end, {
        l_friend_0
    });
    local l_PlayerBackgroundDefault_0 = v19.Theme.PlayerBackgroundDefault;
    local v24 = if l_friend_0.presence ~= l_UserModel_0.PresenceType.OFFLINE then v16[l_UserModel_0.PresenceType.ONLINE] else nil;
    return v2.createElement("Frame", {
        Size = v17.size, 
        Position = v17.position, 
        AnchorPoint = v17.anchorPoint, 
        BackgroundTransparency = 1
    }, {
        Background = l_PlayerBackgroundDefault_0 and v2.createElement("Frame", {
            Size = v17.size, 
            Position = v17.position, 
            AnchorPoint = v17.anchorPoint, 
            BackgroundColor3 = v19.Theme.UIDefault.Color, 
            BackgroundTransparency = v19.Theme.UIDefault.Transparency
        }, {
            Corner = v2.createElement("UICorner", {
                CornerRadius = UDim.new(0.5, 0)
            })
        }), 
        Thumbnail = v17.isFetchingFriends and v2.createElement(l_ShimmerPanel_0, {
            Size = UDim2.new(1, 0, 1, 0), 
            cornerRadius = UDim.new(0.5, 0)
        }) or v2.createElement(l_ImageSetLabel_0, {
            Size = v17.size, 
            Position = v17.position, 
            AnchorPoint = v17.anchorPoint, 
            Image = v22, 
            BorderSizePixel = 0, 
            BackgroundColor3 = v19 and v19.Theme.UIDefault.Color, 
            BackgroundTransparency = l_PlayerBackgroundDefault_0 and 1 or v19.Theme.UIDefault.Transparency
        }, {
            Corner = v2.createElement("UICorner", {
                CornerRadius = UDim.new(0.5, 0)
            })
        }), 
        PresenceIcon = not (not v24 or v17.isFetchingFriends) and v2.createElement(l_ImageSetLabel_0, {
            Image = l_Images_0[v24.Image], 
            BackgroundTransparency = 0, 
            BackgroundColor3 = v17.isHoverRow and v19.Theme.BackgroundOnHover.Color or v19.Theme.BackgroundDefault.Color, 
            ImageColor3 = v24.Color, 
            Position = UDim2.new(1, -1, 1, -1), 
            AnchorPoint = Vector2.new(1, 1), 
            Size = v24.Size or UDim2.new(0, l_IconSize_0.Small, 0, l_IconSize_0.Small), 
            ZIndex = 2
        }, {
            Border = v2.createElement("UIStroke", {
                ApplyStrokeMode = Enum.ApplyStrokeMode.Border, 
                Color = v19.Theme.BackgroundDefault.Color, 
                Transparency = v19.Theme.BackgroundDefault.Transparency, 
                Thickness = 3
            }), 
            Corner = v2.createElement("UICorner", {
                CornerRadius = UDim.new(0.5, 0)
            })
        }) or nil
    });
end;