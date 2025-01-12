local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameInvite");
local l_TextService_0 = game:GetService("TextService");
local l_Components_0 = l_script_FirstAncestor_0.Components;
local l_Context_0 = l_script_FirstAncestor_0.Context;
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_utils_0 = l_script_FirstAncestor_0.utils;
local v6 = require(l_Parent_0.FriendsMenu);
local v7 = require(l_Parent_0.React);
local v8 = require(l_Parent_0.UIBlox);
local v9 = require(l_Parent_0.UniversalAppPolicy);
local l_DeviceInfo_0 = require(l_Parent_0.NotificationsCommon).DeviceInfo;
local l_IsVRAppBuild_0 = require(l_Parent_0.AppCommonLib).IsVRAppBuild;
local l_FriendsMenuSearch_0 = v6.FriendsMenuSearch;
local l_FriendsListContext_0 = v6.FriendsListContext;
local l_InviteFriendContext_0 = v6.InviteFriendContext;
local v15 = require(l_script_FirstAncestor_0.analytics.GameInviteAnalyticsManager);
local v16 = require(l_script_FirstAncestor_0.GameInviteModalManager);
local v17 = require(l_Components_0.ShareGameInviteLink);
local v18 = require(l_utils_0.isExperienceOlderThanOneWeek);
local _ = require(l_script_FirstAncestor_0.gameInviteModalType);
local l_LocalizationHelper_0 = require(l_Parent_0.NotificationsCommon).LocalizationHelper;
local v21 = require(l_script_FirstAncestor_0.GameInviteConstants);
local v22 = require(l_Context_0.GameInviteModalLayoutContext);
local v23 = require(l_Context_0.GameDetailsContext);
local l_useStyle_0 = v8.Core.Style.useStyle;
local l_ImageSetButton_0 = v8.Core.ImageSet.ImageSetButton;
local l_Images_0 = v8.App.ImageSet.Images;
local l_getLocalizedStrings_0 = l_LocalizationHelper_0.getLocalizedStrings;
local l_useAppPolicy_0 = v9.useAppPolicy;
local l_GetFFlagEnableGameInviteModalVRSupport_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableGameInviteModalVRSupport;
local l_TitleIconSize_0 = v21.Layout.TitleIconSize;
local l_SidePadding_0 = v21.Layout.SidePadding;
local v32 = l_Images_0["icons/navigation/close"];
local v33 = l_Images_0["icons/menu/search"];
local v34 = {
    cancelText = "Feature.SettingsHub.Action.CancelSearch", 
    invitefriends = "Feature.SettingsHub.Heading.InviteFriends", 
    copyLink = "Feature.SocialShare.Action.CopyLink"
};
local function v38(v35, v36, v37) --[[ Line: 55 ]]
    -- upvalues: l_GetFFlagEnableGameInviteModalVRSupport_0 (copy), l_IsVRAppBuild_0 (copy), v18 (copy)
    if l_GetFFlagEnableGameInviteModalVRSupport_0() then
        return not l_IsVRAppBuild_0() and v37 and not v36 and v35 and v35.isCoreScript and v35.serverType == "StandardServer" and v18(v35.gameDetails);
    else
        return not v36 and v37 and v35 and v35.isCoreScript and v35.serverType == "StandardServer" and v18(v35.gameDetails);
    end;
end;
return function(v39) --[[ Line: 83 ]]
    -- upvalues: l_useStyle_0 (copy), v7 (copy), v22 (copy), v23 (copy), l_FriendsListContext_0 (copy), l_InviteFriendContext_0 (copy), l_getLocalizedStrings_0 (copy), v34 (copy), l_useAppPolicy_0 (copy), l_DeviceInfo_0 (copy), v38 (copy), l_TextService_0 (copy), l_TitleIconSize_0 (copy), v16 (copy), l_SidePadding_0 (copy), l_ImageSetButton_0 (copy), v32 (copy), v33 (copy), v17 (copy), l_FriendsMenuSearch_0 (copy), v15 (copy)
    local v40 = l_useStyle_0();
    local v41 = v7.useContext(v22);
    local v42 = v7.useContext(v23);
    local v43 = v7.useContext(l_FriendsListContext_0);
    local v44 = v7.useContext(l_InviteFriendContext_0);
    local v45, v46 = v7.useState(false);
    local v47 = l_getLocalizedStrings_0(v34);
    local l_searchFriends_0 = v43.searchFriends;
    local v50 = l_useAppPolicy_0(function(v49) --[[ Line: 95 ]]
        return v49.getExperienceInviteShareLinkEnabled();
    end);
    local v51 = v41.modalMode == "compact";
    local l_isFullWidth_0 = v41.isFullWidth;
    local v53 = l_DeviceInfo_0.isDesktopDevice();
    local v54 = l_DeviceInfo_0.isConsole();
    local v55 = v38(v42, v54, v50);
    local v56 = v53 and not l_isFullWidth_0;
    local v57 = v40.Font.BaseSize * v40.Font.Header2.RelativeSize;
    local v58 = v40.Font.BaseSize * v40.Font.Body.RelativeSize;
    local l_l_TextService_0_TextSize_0 = l_TextService_0:GetTextSize(v47.copyLink, v57, v40.Font.Header2.Font, Vector2.new(300 - l_TitleIconSize_0, 1e999));
    local v60 = nil;
    local v61 = 0;
    if v55 then
        if v53 and v56 then
            local v62 = math.ceil(l_l_TextService_0_TextSize_0.X) + 10;
            v60 = UDim2.new(0, v62, 1, 0);
            v61 = v61 + v62;
        else
            v60 = UDim2.new(0, l_TitleIconSize_0, 0, l_TitleIconSize_0);
            v61 = v61 + l_TitleIconSize_0;
        end;
    end;
    if v51 then
        v61 = v61 + l_TitleIconSize_0;
    end;
    if v51 and v55 then
        v61 = v61 + 4;
    end;
    local function v63() --[[ Line: 136 ]]
        -- upvalues: v16 (ref), v44 (copy)
        v16:closeModal(v44.getMaxRecipientRowNum());
    end;
    local function v64() --[[ Line: 140 ]]
        -- upvalues: v46 (copy)
        v46(true);
    end;
    local function v65() --[[ Line: 144 ]]
        -- upvalues: v46 (copy), l_searchFriends_0 (copy)
        v46(false);
        l_searchFriends_0("");
    end;
    if not v51 and v45 then
        v46(false);
        l_searchFriends_0("");
    end;
    local v66 = v7.useMemo(function() --[[ Line: 155 ]]
        -- upvalues: v7 (ref), l_SidePadding_0 (ref), v61 (ref), l_ImageSetButton_0 (ref), l_TitleIconSize_0 (ref), v63 (copy), v32 (ref), v40 (copy), v47 (copy), v57 (copy), v51 (copy), v64 (copy), v33 (ref), v55 (copy), v17 (ref), v53 (copy), v56 (copy), v60 (ref)
        return {
            UIPadding = v7.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, l_SidePadding_0), 
                PaddingRight = UDim.new(0, l_SidePadding_0)
            }), 
            UIListLayout = v7.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }), 
            LeftActionContainer = v7.createElement("Frame", {
                Size = UDim2.new(0, v61, 1, 0), 
                LayoutOrder = 0, 
                BackgroundTransparency = 1
            }, {
                UIListLayout = v7.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    Padding = UDim.new(0, 4)
                }), 
                CloseButton = v7.createElement(l_ImageSetButton_0, {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(0, l_TitleIconSize_0, 0, l_TitleIconSize_0), 
                    [v7.Event.Activated] = v63, 
                    Image = v32, 
                    ImageColor3 = v40.Theme.IconEmphasis.Color, 
                    ImageTransparency = v40.Theme.IconEmphasis.Transparency, 
                    BorderSizePixel = 0
                })
            }), 
            Title = v7.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                Text = v47.invitefriends, 
                TextSize = v57, 
                TextWrapped = true, 
                TextXAlignment = Enum.TextXAlignment.Center, 
                TextColor3 = v40.Theme.TextEmphasis.Color, 
                Font = v40.Font.Header2.Font, 
                Size = UDim2.new(1, -1 * (2 * v61), 1, 0), 
                LayoutOrder = 1
            }), 
            RightActionContainer = v7.createElement("Frame", {
                Size = UDim2.new(0, v61, 1, 0), 
                LayoutOrder = 2, 
                BackgroundTransparency = 1
            }, {
                UIListLayout = v7.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                    Padding = UDim.new(0, 4)
                }), 
                SearchButton = v51 and v7.createElement(l_ImageSetButton_0, {
                    LayoutOrder = 0, 
                    BackgroundTransparency = 1, 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Size = UDim2.new(0, l_TitleIconSize_0, 0, l_TitleIconSize_0), 
                    [v7.Event.Activated] = v64, 
                    Image = v33, 
                    ImageColor3 = v40.Theme.IconEmphasis.Color, 
                    ImageTransparency = v40.Theme.IconEmphasis.Transparency, 
                    BorderSizePixel = 0
                }) or nil, 
                ShareGameInviteLink = v55 and v7.createElement(v17, {
                    layoutOrder = 1, 
                    isDesktop = v53, 
                    isFullSize = v56, 
                    size = v60
                }) or nil
            })
        };
    end, {
        v45, 
        v56, 
        v51, 
        v55, 
        v53
    });
    local v67 = v7.useMemo(function() --[[ Line: 232 ]]
        -- upvalues: v7 (ref), l_FriendsMenuSearch_0 (ref), v15 (ref), v58 (copy), v40 (copy), v47 (copy), v65 (copy)
        return {
            UIListLayout = v7.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                Padding = UDim.new(0, 4)
            }), 
            SearchBox = v7.createElement(l_FriendsMenuSearch_0, {
                layoutOrder = 0, 
                size = UDim2.new(1, -120, 1, -20), 
                focusElement = true, 
                onFocus = function() --[[ Line: 245 ]] --[[ Name: onFocus ]]
                    -- upvalues: v15 (ref)
                    v15:onSearchFocused();
                end
            }), 
            CancelButton = v7.createElement("TextButton", {
                LayoutOrder = 1, 
                BackgroundTransparency = 1, 
                AnchorPoint = Vector2.new(1, 0.5), 
                Position = UDim2.new(1, 0, 0.5, 0), 
                Size = UDim2.new(0, 100, 1, 0), 
                TextSize = v58, 
                TextColor3 = v40.Theme.UIDefault.Color, 
                Text = v47.cancelText, 
                Font = v40.Font.Body.Font, 
                [v7.Event.Activated] = v65
            })
        };
    end, {
        v45
    });
    return v7.createElement("Frame", {
        BackgroundTransparency = 1, 
        AnchorPoint = Vector2.new(0, 1), 
        LayoutOrder = v39.layoutOrder, 
        Position = UDim2.new(0, 0, 1, 0), 
        Size = v39.size
    }, if v45 then v67 else v66);
end;