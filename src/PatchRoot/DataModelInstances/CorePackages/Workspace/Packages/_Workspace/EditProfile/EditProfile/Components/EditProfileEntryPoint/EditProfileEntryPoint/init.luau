local l_script_FirstAncestor_0 = script:FindFirstAncestor("EditProfile");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local v4 = require(l_Parent_0.UserLib);
local l_LoadableImage_0 = v3.App.Loading.LoadableImage;
local l_ImageSetLabel_0 = v3.Core.ImageSet.ImageSetLabel;
local l_Images_0 = v3.App.ImageSet.Images;
local l_useStyle_0 = v3.Core.Style.useStyle;
local v9 = require(l_script_FirstAncestor_0.Components.EditProfileTopBar);
local v10 = require(l_script_FirstAncestor_0.Components.EditTextButton);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v12 = require(l_script_FirstAncestor_0.Common.TextKeys);
local _ = require(l_script_FirstAncestor_0.Common.Types);
local v14 = require(l_script_FirstAncestor_0.Common.Constants);
local v15 = require(l_script_FirstAncestor_0.Hooks.useDisplayNameText);
local l_getStandardSizeAvatarHeadShotRbxthumb_0 = v4.Utils.getStandardSizeAvatarHeadShotRbxthumb;
local l_StyledTextLabel_0 = v3.App.Text.StyledTextLabel;
local l_VerticalScrollView_0 = v3.App.Container.VerticalScrollView;
local l_useUserExperiment_0 = require(l_Parent_0.RoactAppExperiment).useUserExperiment;
local l_FFlagRealNamesInDisplayNameExperimentEnabled_0 = require(l_Parent_0.SharedFlags).FFlagRealNamesInDisplayNameExperimentEnabled;
local v21 = require(l_script_FirstAncestor_0.Flags.FFlagEditProfileNavigateToAvatar);
local v22 = require(l_script_FirstAncestor_0.Flags.FStringEditProfileToAvatarLayerName);
local v23 = require(l_script_FirstAncestor_0.Flags.SocialNetworksInEditProfileIXP);
local v24 = game:DefineFastFlag("EditProfileScrollable", false);
local v25 = utf8.char(57346);
return function(v26) --[[ Line: 65 ]] --[[ Name: EditProfileEntryPoint ]]
    -- upvalues: l_useUserExperiment_0 (copy), v22 (copy), v23 (copy), l_useStyle_0 (copy), l_useLocalization_0 (copy), v12 (copy), l_FFlagRealNamesInDisplayNameExperimentEnabled_0 (copy), v25 (copy), v15 (copy), v2 (copy), v14 (copy), l_ImageSetLabel_0 (copy), l_Images_0 (copy), v24 (copy), v9 (copy), v21 (copy), l_LoadableImage_0 (copy), l_getStandardSizeAvatarHeadShotRbxthumb_0 (copy), v10 (copy), l_StyledTextLabel_0 (copy), l_VerticalScrollView_0 (copy)
    local v28 = l_useUserExperiment_0({
        v22
    }, function(v27) --[[ Line: 66 ]]
        -- upvalues: v22 (ref)
        return (v27[v22] or {}).profile_picture_on;
    end);
    local v29 = v23.GetFFlagSocialNetworksInEditProfileIXPSetupEnabled();
    local v30 = v23.useGetExperimentVariant({
        isExposureEnabled = true
    });
    local v31 = v30 and v30 ~= v23.Variants.Control;
    local v32 = l_useStyle_0();
    local l_Theme_0 = v32.Theme;
    local l_Font_0 = v32.Font;
    local v35 = l_useLocalization_0({
        thousand = v12.UsernamePrice
    });
    local v36 = l_useLocalization_0({
        About = v12.About, 
        AboutModalCaption = v12.AboutModalCaption, 
        DisplayName = if l_FFlagRealNamesInDisplayNameExperimentEnabled_0 then nil else v12.DisplayName, 
        DisplayNameCaption = if l_FFlagRealNamesInDisplayNameExperimentEnabled_0 then nil else v12.DisplayNameCaption, 
        AboutPlaceholder = v12.AboutPlaceholder, 
        Username = v12.Username, 
        UsernameCaption = {
            v12.UsernameDescription; 
            icon = v25, 
            price = v35.thousand
        }, 
        SocialNetworks = if v29 and v31 then v12.SocialNetworks else nil, 
        SocialNetworksCaption = if v29 and v31 and v26.socialInfo and v26.socialInfo.visibility then v12[v26.socialInfo.visibility] else nil
    });
    local v37 = nil;
    if l_FFlagRealNamesInDisplayNameExperimentEnabled_0 then
        v37 = v15();
    end;
    local v38 = false;
    local v42 = if v29 then v2.useMemo(function() --[[ Line: 108 ]]
        -- upvalues: v26 (copy), v14 (ref), v2 (ref), l_Theme_0 (copy), l_ImageSetLabel_0 (ref), l_Images_0 (ref), v38 (ref)
        local v39 = {};
        if v26.socialInfo and v26.socialInfo.socialLinks then
            for v40, v41 in ipairs(v14.SocialMediaOrder) do
                v39[v41] = v2.createElement("ImageButton", {
                    LayoutOrder = v40, 
                    BackgroundTransparency = 0, 
                    Size = UDim2.new(0, 40, 0, 40), 
                    BackgroundColor3 = l_Theme_0.BackgroundUIDefault.Color, 
                    [v2.Event.Activated] = v26.openEditSocialLinksModal and function() --[[ Line: 118 ]]
                        -- upvalues: v26 (ref), v40 (copy)
                        v26.openEditSocialLinksModal(v40);
                    end or nil
                }, {
                    UICorner = v2.createElement("UICorner", {
                        CornerRadius = UDim.new(0, 8)
                    }), 
                    Icon = v2.createElement(l_ImageSetLabel_0, {
                        Image = l_Images_0[v14.SocialMediaIcons[v41]], 
                        ImageColor3 = l_Theme_0.IconEmphasis.Color, 
                        ImageTransparency = v26.socialInfo.socialLinks[v41] and 0 or 0.5, 
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(0, 28, 0, 28), 
                        Position = UDim2.new(0, 6, 0, 6)
                    })
                });
                if v26.socialInfo.socialLinks[v41] then
                    v38 = true;
                end;
            end;
        end;
        return v39;
    end, {
        v26.socialInfo, 
        l_Theme_0, 
        v26.openEditSocialLinksModal
    }) else nil;
    local v43 = v2.createElement("Frame", {
        BackgroundColor3 = v32.Theme.BackgroundDefault.Color, 
        BackgroundTransparency = v32.Theme.BackgroundDefault.Transparency, 
        Size = UDim2.new(1, 0, 1, 0), 
        AutomaticSize = if v24 then Enum.AutomaticSize.Y else nil, 
        Position = UDim2.fromScale(0.5, 0), 
        AnchorPoint = Vector2.new(0.5, 0)
    }, {
        SizeConstraint = v2.createElement("UISizeConstraint", {
            MaxSize = Vector2.new(640, 1e999)
        }), 
        Layout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 24)
        }), 
        TopPadding = v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 20), 
            BackgroundTransparency = 1
        }), 
        TopBar = v2.createElement(v9, {
            layoutOrder = 1, 
            onClose = v26.onClose
        }), 
        ProfilePicture = if not not v21 or v28 then v2.createElement("Frame", {
            AutomaticSize = Enum.AutomaticSize.X, 
            Size = UDim2.new(1, 0, 0, 100), 
            LayoutOrder = 2, 
            BackgroundTransparency = 1
        }, {
            Picture = v2.createElement("ImageButton", {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.fromScale(0.5, 0.5), 
                LayoutOrder = 1, 
                Size = UDim2.new(0, 100, 0, 100), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 10, 
                [v2.Event.Activated] = v26.openEditProfilePicture
            }, {
                UICorner = v2.createElement("UICorner", {
                    CornerRadius = UDim.new(0.5, 0)
                }), 
                UserAvatar = v2.createElement(l_LoadableImage_0, {
                    Size = UDim2.new(1, 0, 1, 0), 
                    useShimmerAnimationWhileLoading = true, 
                    cornerRadius = UDim.new(0.5, 0), 
                    shouldHandleReloads = true, 
                    Image = l_getStandardSizeAvatarHeadShotRbxthumb_0(v26.localUserId), 
                    BackgroundColor3 = l_Theme_0.PlaceHolder.Color, 
                    BackgroundTransparency = l_Theme_0.PlaceHolder.Transparency
                })
            }), 
            Button = v2.createElement("ImageButton", {
                Size = UDim2.new(0, 36, 0, 36), 
                AnchorPoint = Vector2.new(0.5, 1), 
                Position = UDim2.new(0.5, 80, 1, 0), 
                BackgroundTransparency = l_Theme_0.UIMuted.Transparency, 
                BackgroundColor3 = l_Theme_0.UIMuted.Color, 
                [v2.Event.Activated] = v26.openEditProfilePicture
            }, {
                UICorner = v2.createElement("UICorner", {
                    CornerRadius = UDim.new(0, 4)
                }), 
                Icon = v2.createElement(l_ImageSetLabel_0, {
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Image = l_Images_0["icons/menu/profilepicture_large"], 
                    ImageColor3 = l_Theme_0.IconEmphasis.Color, 
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(0, 28, 0, 28), 
                    Position = UDim2.fromScale(0.5, 0.5)
                })
            })
        }) else nil, 
        Content = v2.createElement("Frame", {
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, -48, 0, 0), 
            BorderSizePixel = 0, 
            LayoutOrder = 3
        }, {
            Layout = v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 24)
            }), 
            DisplayNameButton = v2.createElement(v10, {
                layoutOrder = 1, 
                shouldShimmerName = v26.shouldShimmerName, 
                title = if l_FFlagRealNamesInDisplayNameExperimentEnabled_0 then v37.displayNameTitle else v36.DisplayName, 
                description = if l_FFlagRealNamesInDisplayNameExperimentEnabled_0 then v37.displayNameCaption else v36.DisplayNameCaption, 
                placeHolderText = v26.displayName, 
                localUserId = v26.localUserId, 
                onActivated = v26.openDisplayNameModal, 
                expandSizing = false, 
                transparentText = false
            }), 
            UsernameButton = v2.createElement(v10, {
                layoutOrder = 2, 
                shouldShimmerName = v26.shouldShimmerName, 
                title = v36.Username, 
                description = v36.UsernameCaption, 
                placeHolderText = "@" .. v26.username, 
                localUserId = v26.localUserId, 
                onActivated = v26.navigateToEditUsername, 
                expandSizing = false, 
                transparentText = false
            }), 
            Divider = v2.createElement("Frame", {
                LayoutOrder = 3, 
                BackgroundColor3 = v32.Theme.Divider.Color, 
                BackgroundTransparency = v32.Theme.Divider.Transparency, 
                BorderSizePixel = 0, 
                Size = UDim2.new(1, 0, 0, 1)
            }), 
            AboutMeButton = v2.createElement(v10, {
                layoutOrder = 4, 
                title = v36.About, 
                description = v36.AboutModalCaption, 
                placeHolderText = if v26.description ~= nil and v26.description ~= "" then v26.description else v36.AboutPlaceholder, 
                shouldShimmerName = false, 
                localUserId = v26.localUserId, 
                expandSizing = true, 
                onActivated = v26.openEditDescription, 
                transparentText = not v26.description or v26.description == ""
            }), 
            Divider2 = if not (v29 and v31) or v26.isUnder13 then nil else v2.createElement("Frame", {
                LayoutOrder = 5, 
                BackgroundColor3 = v32.Theme.Divider.Color, 
                BackgroundTransparency = v32.Theme.Divider.Transparency, 
                BorderSizePixel = 0, 
                Size = UDim2.new(1, 0, 0, 1)
            }), 
            SocialNetworksButton = if not (v29 and v31 and v26.socialInfo and v26.socialInfo.socialLinks) or v26.isUnder13 then nil else v2.createElement("Frame", {
                LayoutOrder = 6, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 0, 0), 
                BorderSizePixel = 0
            }, {
                Layout = v2.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, 12)
                }), 
                UIPadding = v2.createElement("UIPadding", {
                    PaddingBottom = UDim.new(0, 20)
                }), 
                Title = v2.createElement(l_StyledTextLabel_0, {
                    layoutOrder = 1, 
                    text = v36.SocialNetworks, 
                    fontStyle = l_Font_0.Header2, 
                    colorStyle = l_Theme_0.TextEmphasis
                }), 
                Description = if v38 then v2.createElement(l_StyledTextLabel_0, {
                    layoutOrder = 2, 
                    text = v36.SocialNetworksCaption, 
                    fontStyle = l_Font_0.CaptionBody, 
                    colorStyle = l_Theme_0.TextDefault, 
                    automaticSize = Enum.AutomaticSize.Y, 
                    size = UDim2.new(1, 0, 0, 0), 
                    lineHeight = 1
                }) else nil, 
                NetworkIcons = v2.createElement("Frame", {
                    LayoutOrder = 3, 
                    Size = UDim2.new(1, 0, 0, 40), 
                    BackgroundTransparency = 1
                }, {
                    Layout = v2.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Horizontal, 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        Padding = UDim.new(0, 12)
                    }), 
                    SocialNetworks = v2.createElement(v2.Fragment, {}, v42), 
                    Padding = v2.createElement("Frame", {
                        LayoutOrder = 6, 
                        Size = UDim2.new(1, -318, 0, 40), 
                        BackgroundTransparency = 1
                    }), 
                    PencilIcon = v2.createElement("ImageButton", {
                        LayoutOrder = 7, 
                        BackgroundTransparency = 0, 
                        Size = UDim2.new(0, 40, 0, 40), 
                        BackgroundColor3 = v32.Theme.BackgroundDefault.Color, 
                        BorderSizePixel = 0, 
                        [v2.Event.Activated] = v26.openEditSocialLinksModal and function() --[[ Line: 374 ]]
                            -- upvalues: v26 (copy)
                            v26.openEditSocialLinksModal(-1);
                        end or nil
                    }, {
                        UICorner = v2.createElement("UICorner", {
                            CornerRadius = UDim.new(0, 8)
                        }), 
                        Icon = v2.createElement(l_ImageSetLabel_0, {
                            Image = l_Images_0["icons/actions/edit/edit"], 
                            ImageColor3 = l_Theme_0.IconEmphasis.Color, 
                            BackgroundTransparency = 1, 
                            Size = UDim2.new(0, 28, 0, 28), 
                            Position = UDim2.new(0, 6, 0, 6)
                        })
                    })
                })
            })
        })
    });
    if v24 then
        return v2.createElement(l_VerticalScrollView_0, {
            useAutomaticCanvasSize = true, 
            canvasSizeY = UDim.new(), 
            elasticBehavior = Enum.ElasticBehavior.Never
        }, {
            v43
        });
    else
        return v43;
    end;
end;