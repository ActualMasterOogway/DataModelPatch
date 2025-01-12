local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local l_useStyle_0 = v3.Core.Style.useStyle;
local l_LoadableImage_0 = v3.App.Loading.LoadableImage;
local l_ImageSetLabel_0 = v3.Core.ImageSet.ImageSetLabel;
local l_Images_0 = v3.App.ImageSet.Images;
local v8 = require(l_script_FirstAncestor_0.Components.UserProfileHeader.SocialIdentityContainer);
local v9 = require(l_script_FirstAncestor_0.Components.UserProfileHeader.ContextualInformation);
local v10 = require(l_script_FirstAncestor_0.Components.UserProfileHeader.SocialCountsRow);
local v11 = require(l_script_FirstAncestor_0.Components.UserProfileHeader.UserProfileSettingsToggle);
local v12 = require(l_script_FirstAncestor_0.Flags.FFlagProfilePlatformEnableUserProfileSettings);
return function(v13) --[[ Line: 51 ]] --[[ Name: UserProfileHeader ]]
    -- upvalues: l_useStyle_0 (copy), v2 (copy), l_ImageSetLabel_0 (copy), l_Images_0 (copy), l_LoadableImage_0 (copy), v8 (copy), v12 (copy), v11 (copy), v9 (copy), v10 (copy)
    local v14 = l_useStyle_0();
    local l_userThumbnail_0 = v13.userThumbnail;
    return v2.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 400), 
        BackgroundTransparency = 1, 
        LayoutOrder = v13.layoutOrder
    }, {
        Background = v2.createElement(l_ImageSetLabel_0, {
            Size = UDim2.fromScale(1, 1), 
            BorderSizePixel = 0, 
            Image = l_Images_0[v14.Theme.PlayerBackgroundDefault.Image], 
            ZIndex = 1
        }), 
        AvatarThumbnail = v2.createElement(l_LoadableImage_0, {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.new(0.5, 0, 0.5, -24), 
            Size = UDim2.new(1, -48, 1, -48), 
            ScaleType = Enum.ScaleType.Fit, 
            BackgroundTransparency = 1, 
            Image = l_userThumbnail_0, 
            useShimmerAnimationWhileLoading = true, 
            ZIndex = 2
        }), 
        TopGradient = v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 70), 
            Position = UDim2.fromScale(0, 0), 
            BackgroundColor3 = v14.Theme.BackgroundDefault.Color, 
            BorderSizePixel = 0, 
            ZIndex = 3
        }, {
            UIGradient = v2.createElement("UIGradient", {
                Rotation = 90, 
                Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 0), 
                    NumberSequenceKeypoint.new(1, 1)
                })
            })
        }), 
        BottomGradient = v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 70), 
            Position = UDim2.fromScale(0, 1), 
            AnchorPoint = Vector2.new(0, 1), 
            BackgroundColor3 = v14.Theme.BackgroundDefault.Color, 
            BorderSizePixel = 0, 
            ZIndex = 3
        }, {
            UIGradient = v2.createElement("UIGradient", {
                Rotation = 90, 
                Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 1), 
                    NumberSequenceKeypoint.new(1, 0)
                })
            })
        }), 
        ProfileTextFrame = v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Position = UDim2.new(0, 0, 1, 0), 
            AnchorPoint = Vector2.new(0, 1), 
            BackgroundTransparency = 1, 
            ZIndex = 10
        }, {
            UIListLayoutOrder = v2.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical, 
                Padding = UDim.new(0, 8)
            }), 
            SocialIdentity = v2.createElement(v8, {
                size = UDim2.new(1, 0, 0, 40), 
                layoutOrder = 1, 
                primaryName = v13.primaryName, 
                username = v13.username, 
                isPremium = v13.isPremium, 
                isVerified = v13.isVerified, 
                isEdited = v13.isEdited, 
                openEditName = v13.openEditName
            }), 
            UserProfileSettingsToggle = if v12 and v13.shouldDisplayUserProfileSettings then v2.createElement(v11, {
                size = UDim2.new(1, 0, 0, 30), 
                layoutOrder = 2, 
                isInExperienceNameEnabled = v13.isInExperienceNameEnabled
            }) else nil, 
            ContextualInformation = v2.createElement(v9, {
                size = UDim2.new(1, 0, 0, 20), 
                layoutOrder = v12 and 3 or 2
            }), 
            SocialCountsRow = if v13.shouldDisplayCounts then v2.createElement(v10, {
                size = UDim2.new(1, 0, 0, 44), 
                layoutOrder = v12 and 4 or 3, 
                followersCount = v13.followersCount, 
                followingsCount = v13.followingsCount, 
                friendsCount = v13.friendsCount, 
                onActivatedFollowers = v13.openFollowers, 
                onActivatedFollowings = v13.openFollowings, 
                onActivatedFriends = v13.openFriends
            }) else nil
        })
    });
end;