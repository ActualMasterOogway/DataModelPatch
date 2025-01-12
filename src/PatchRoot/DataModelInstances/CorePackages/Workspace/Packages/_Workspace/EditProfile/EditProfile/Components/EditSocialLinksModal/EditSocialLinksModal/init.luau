local l_script_FirstAncestor_0 = script:FindFirstAncestor("EditProfile");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local l_useStyle_0 = v3.Core.Style.useStyle;
local v5 = require(l_script_FirstAncestor_0.Components.EditSocialNetworksItem);
local l_DropdownMenu_0 = v3.App.Menu.DropdownMenu;
local l_VerticalScrollView_0 = v3.App.Container.VerticalScrollView;
local l_InteractiveAlert_0 = v3.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v3.App.Button.Enum.ButtonType;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v11 = require(l_script_FirstAncestor_0.Common.TextKeys);
local l_useScreenSize_0 = require(l_Parent_0.RobloxAppHooks).useScreenSize;
local l_useNavigationProps_0 = require(l_Parent_0.RobloxAppNavigation).useNavigationProps;
local v14 = require(l_script_FirstAncestor_0.Common.Constants);
local _ = require(l_script_FirstAncestor_0.Common.Types);
local v16 = require(l_script_FirstAncestor_0.Flags.SocialNetworksInEditProfileIXP);
return function(v17) --[[ Line: 39 ]]
    -- upvalues: v2 (copy), v14 (copy), l_useLocalization_0 (copy), v11 (copy), l_useNavigationProps_0 (copy), v16 (copy), l_useStyle_0 (copy), l_useScreenSize_0 (copy), l_VerticalScrollView_0 (copy), l_InteractiveAlert_0 (copy), v5 (copy), l_DropdownMenu_0 (copy), l_ButtonType_0 (copy)
    local v18, v19 = v2.useState(v17.socialNetworks.facebook);
    local v20, v21 = v2.useState(v17.socialNetworks.twitter);
    local v22, v23 = v2.useState(v17.socialNetworks.youtube);
    local v24, v25 = v2.useState(v17.socialNetworks.twitch);
    local v26, v27 = v2.useState(v17.socialNetworks.guilded);
    local v28, v29 = v2.useState(v17.socialNetworksVisbility);
    local v30, v31 = v2.useState(0);
    local v32 = v28 == v14.VisibilitySettings.NoOne;
    local v33 = l_useLocalization_0({
        cancelButtonText = v11.CancelButtonText, 
        saveButtonText = v11.SaveButtonText, 
        socialNetworks = v11.SocialNetworks, 
        Facebook = v11.Facebook, 
        X = v11.X, 
        YouTube = v11.YouTube, 
        Twitch = v11.Twitch, 
        Guilded = v11.Guilded, 
        FacebookExample = v11.FacebookExample, 
        TwitterExample = v11.TwitterExample, 
        YouTubeExample = v11.YouTubeExample, 
        TwitchExample = v11.TwitchExample, 
        GuildedExample = v11.GuildedExample, 
        AllUsers = v11.AllUsersDropDown, 
        Friends = v11.FriendsDropDown, 
        NoOne = v11.NoOneDropDown, 
        FriendsFollowingAndFollowers = v11.FriendsFollowingAndFollowersDropDown, 
        FriendsAndFollowing = v11.FriendsAndFollowingDropDown, 
        VisibleTo = v11.VisibleTo
    });
    local v36 = l_useNavigationProps_0(function(_, v35) --[[ Line: 69 ]]
        return {
            focusOn = v35.focusOn
        };
    end);
    local v37 = v16.useGetExperimentVariant({
        isExposureEnabled = true
    });
    local v38 = l_useStyle_0();
    local l_Font_0 = v38.Font;
    local l_Theme_0 = v38.Theme;
    local v41 = l_Font_0.BaseSize * l_Font_0.Body.RelativeSize;
    local v42 = l_useScreenSize_0();
    local function v43() --[[ Line: 83 ]] --[[ Name: onSave ]]
        -- upvalues: v17 (copy), v28 (copy), v18 (copy), v20 (copy), v22 (copy), v24 (copy), v26 (copy)
        v17.saveOnActivated(v28, v18, v20, v22, v24, v26);
    end;
    local v45 = v2.useCallback(function(v44) --[[ Line: 87 ]]
        -- upvalues: v29 (copy)
        v29(v44);
    end, {});
    return v2.createElement(l_VerticalScrollView_0, {
        useAutomaticCanvasSize = true, 
        canvasSizeY = UDim.new(), 
        elasticBehavior = Enum.ElasticBehavior.Never
    }, {
        v2.createElement(l_InteractiveAlert_0, {
            title = v33.socialNetworks, 
            screenSize = v42, 
            anchorPoint = Vector2.new(0.5, 0), 
            position = UDim2.new(0.5, 0, 0, 30 + v30), 
            middleContent = function() --[[ Line: 101 ]] --[[ Name: middleContent ]]
                -- upvalues: v2 (ref), v5 (ref), v19 (copy), v33 (copy), v18 (copy), v37 (copy), v16 (ref), v36 (copy), v32 (copy), v31 (copy), v21 (copy), v20 (copy), v23 (copy), v22 (copy), v25 (copy), v24 (copy), v27 (copy), v26 (copy), l_Font_0 (copy), v41 (copy), l_Theme_0 (copy), l_DropdownMenu_0 (ref), v28 (copy), v45 (copy), v42 (copy), v14 (ref)
                return v2.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    AutomaticSize = Enum.AutomaticSize.XY
                }, {
                    UIListLayout = v2.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Vertical, 
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                        SortOrder = Enum.SortOrder.LayoutOrder
                    }), 
                    Facebook = v2.createElement(v5, {
                        textChanged = v19, 
                        networkTitle = v33.Facebook, 
                        initialText = v18, 
                        placeholderText = v33.FacebookExample, 
                        layoutOrder = v37 == v16.Variants.VisibilityLast and 1 or 2, 
                        focusOn = v36.focusOn == 1, 
                        isVisibilityNoOne = v32, 
                        setKeyboardOffset = v31
                    }), 
                    Twitter = v2.createElement(v5, {
                        textChanged = v21, 
                        networkTitle = v33.X, 
                        initialText = v20, 
                        placeholderText = v33.TwitterExample, 
                        layoutOrder = v37 == v16.Variants.VisibilityLast and 2 or 3, 
                        focusOn = v36.focusOn == 2, 
                        isVisibilityNoOne = v32, 
                        setKeyboardOffset = v31
                    }), 
                    YouTube = v2.createElement(v5, {
                        textChanged = v23, 
                        networkTitle = v33.YouTube, 
                        initialText = v22, 
                        placeholderText = v33.YouTubeExample, 
                        layoutOrder = v37 == v16.Variants.VisibilityLast and 3 or 4, 
                        focusOn = v36.focusOn == 3, 
                        isVisibilityNoOne = v32, 
                        setKeyboardOffset = v31
                    }), 
                    Twitch = v2.createElement(v5, {
                        textChanged = v25, 
                        networkTitle = v33.Twitch, 
                        initialText = v24, 
                        placeholderText = v33.TwitchExample, 
                        layoutOrder = v37 == v16.Variants.VisibilityLast and 4 or 5, 
                        focusOn = v36.focusOn == 4, 
                        isVisibilityNoOne = v32, 
                        setKeyboardOffset = v31
                    }), 
                    Guilded = v2.createElement(v5, {
                        textChanged = v27, 
                        networkTitle = v33.Guilded, 
                        initialText = v26, 
                        placeholderText = v33.GuildedExample, 
                        layoutOrder = v37 == v16.Variants.VisibilityLast and 5 or 6, 
                        focusOn = v36.focusOn == 5, 
                        isVisibilityNoOne = v32, 
                        setKeyboardOffset = v31
                    }), 
                    Visibility = v2.createElement("Frame", {
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(1, 0, 0, 0), 
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        LayoutOrder = v37 == v16.Variants.VisibilityLast and 6 or 1, 
                        ZIndex = 2
                    }, {
                        UIListLayout = v2.createElement("UIListLayout", {
                            FillDirection = Enum.FillDirection.Vertical, 
                            SortOrder = Enum.SortOrder.LayoutOrder, 
                            Padding = UDim.new(0, 12)
                        }), 
                        NetworkLabel = v2.createElement("TextLabel", {
                            LayoutOrder = -1, 
                            BackgroundTransparency = 1, 
                            Font = l_Font_0.Body.Font, 
                            Text = v33.VisibleTo, 
                            TextSize = v41, 
                            TextColor3 = l_Theme_0.TextDefault.Color, 
                            AutomaticSize = Enum.AutomaticSize.XY, 
                            RichText = true, 
                            ZIndex = 0
                        }), 
                        Dropdown = v2.createElement(l_DropdownMenu_0, {
                            placeholder = v33[v28], 
                            onChange = v45, 
                            screenSize = Vector2.new(math.clamp(v42.X - 48, 272, 400) - 48, 640), 
                            height = UDim.new(0, v41 + 20), 
                            dropdownMenuListPositionFixed = true, 
                            cellDatas = {
                                {
                                    text = v33.AllUsers, 
                                    key = v14.VisibilitySettings.AllUsers
                                }, 
                                {
                                    text = v33.FriendsFollowingAndFollowers, 
                                    key = v14.VisibilitySettings.FriendsFollowingAndFollowers
                                }, 
                                {
                                    text = v33.FriendsAndFollowing, 
                                    key = v14.VisibilitySettings.FriendsAndFollowing
                                }, 
                                {
                                    text = v33.Friends, 
                                    key = v14.VisibilitySettings.Friends
                                }, 
                                {
                                    text = v33.NoOne, 
                                    key = v14.VisibilitySettings.NoOne
                                }
                            }, 
                            showDropShadow = true, 
                            defaultKey = v28
                        })
                    })
                });
            end, 
            buttonStackInfo = {
                buttons = {
                    {
                        buttonType = l_ButtonType_0.Secondary, 
                        props = {
                            onActivated = v17.cancelOnActivated, 
                            text = v33.cancelButtonText
                        }
                    }, 
                    {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        props = {
                            onActivated = v43, 
                            text = v33.saveButtonText
                        }
                    }
                }, 
                buttonHeight = 48, 
                marginBetween = 6, 
                forcedFillDirection = Enum.FillDirection.Horizontal
            }
        })
    });
end;