local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v4 = require(l_Parent_0.VerifiedBadges);
local v5 = require(l_Parent_0.UIBlox);
local l_HorizontalPageMargin_0 = v5.App.Container.HorizontalPageMargin;
local l_useStyle_0 = v5.Core.Style.useStyle;
local l_StyledTextLabel_0 = v5.App.Text.StyledTextLabel;
local l_IconButton_0 = v5.App.Button.IconButton;
local l_IconSize_0 = v5.App.ImageSet.Enum.IconSize;
local l_Images_0 = v5.App.ImageSet.Images;
local l_Tooltip_0 = v5.App.Dialog.Tooltip;
local l_TooltipOrientation_0 = v5.App.Dialog.Enum.TooltipOrientation;
local l_OpenTypeSupport_0 = v5.Utility.OpenTypeSupport;
local v15 = require(l_script_FirstAncestor_0.Common.TextKeys);
local l_FFlagFriendRequestNicknames_0 = require(l_Parent_0.SharedFlags).FFlagFriendRequestNicknames;
local l_GetFFlagLuaAppEnableOpenTypeSupport_0 = require(l_Parent_0.SharedFlags).GetFFlagLuaAppEnableOpenTypeSupport;
return function(v18) --[[ Line: 44 ]] --[[ Name: SocialIdentity ]]
    -- upvalues: l_useStyle_0 (copy), l_Images_0 (copy), v4 (copy), l_useLocalization_0 (copy), v15 (copy), v2 (copy), l_HorizontalPageMargin_0 (copy), l_IconButton_0 (copy), l_IconSize_0 (copy), l_Tooltip_0 (copy), l_TooltipOrientation_0 (copy), l_StyledTextLabel_0 (copy), l_FFlagFriendRequestNicknames_0 (copy), l_GetFFlagLuaAppEnableOpenTypeSupport_0 (copy), l_OpenTypeSupport_0 (copy)
    local v19 = l_useStyle_0();
    local l_Theme_0 = v19.Theme;
    local l_Font_0 = v19.Font;
    local v22 = if v18.isEdited then l_Images_0["icons/actions/edit/editOn_small"] else l_Images_0["icons/actions/edit/edit_small"];
    local v23 = (v18.primaryName .. if v18.isPremium then v4.emoji.premium else "") .. if v18.isVerified then v4.emoji.verified else "";
    local v24 = ("@%*"):format(v18.username);
    local v25 = l_useLocalization_0({
        tooltipTitle = if v18.isLocalUser then nil else v15.AliasTooltipHeader, 
        tooltipBody = if v18.isLocalUser then v15.DisplayNameTooltipBody else v15.AliasTooltipBody
    });
    local v26 = v2.useCallback(function() --[[ Line: 63 ]]
        -- upvalues: v18 (copy)
        if v18.openEditName then
            v18.openEditName();
        end;
        v18.dismissTooltip();
    end);
    return v2.createElement(l_HorizontalPageMargin_0, {
        size = v18.size, 
        layoutOrder = v18.layoutOrder, 
        backgroundTransparency = 1
    }, {
        UIListLayout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        PrimaryNameFrame = v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 44), 
            BackgroundTransparency = 1, 
            LayoutOrder = 1
        }, {
            PrimaryNameFrameTouchable = v2.createElement("TextButton", {
                AutomaticSize = Enum.AutomaticSize.XY, 
                Text = "", 
                BackgroundTransparency = 1, 
                LayoutOrder = 1, 
                [v2.Event.Activated] = v26
            }, {
                UIListLayout = v2.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    VerticalAlignment = Enum.VerticalAlignment.Bottom, 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                EditNameButton = if v18.openEditName then v2.createElement(l_IconButton_0, {
                    icon = v22, 
                    iconSize = l_IconSize_0.Small, 
                    size = UDim2.fromOffset(26, 26), 
                    layoutOrder = 1, 
                    onActivated = v26
                }, {
                    tooltip = if v18.isTooltipActive then v2.createElement(l_Tooltip_0, {
                        triggerPosition = Vector2.new(16, 0), 
                        triggerSize = Vector2.new(0, 0), 
                        headerText = v25.tooltipTitle, 
                        bodyText = v25.tooltipBody, 
                        orientation = l_TooltipOrientation_0.Top, 
                        forceClickTriggerPoint = true, 
                        isDirectChild = true
                    }) else nil
                }) else nil, 
                PrimaryName = v2.createElement(l_StyledTextLabel_0, {
                    text = v23, 
                    fontStyle = l_Font_0.Header1, 
                    colorStyle = l_Theme_0.TextEmphasis, 
                    textXAlignment = Enum.TextXAlignment.Left, 
                    textYAlignment = Enum.TextYAlignment.Bottom, 
                    layoutOrder = 2, 
                    size = if l_FFlagFriendRequestNicknames_0 then UDim2.new(1, 0, 1, 0) else nil, 
                    textWrapped = l_FFlagFriendRequestNicknames_0 and true or nil, 
                    fluidSizing = not l_FFlagFriendRequestNicknames_0 and nil, 
                    lineHeight = l_FFlagFriendRequestNicknames_0 and 1 or nil
                })
            })
        }), 
        Username = v2.createElement(l_StyledTextLabel_0, {
            text = v24, 
            fontStyle = l_Font_0.CaptionBody, 
            colorStyle = l_Theme_0.TextDefault, 
            textXAlignment = Enum.TextXAlignment.Left, 
            textYAlignment = Enum.TextYAlignment.Top, 
            layoutOrder = 2, 
            openTypeFeatures = if l_GetFFlagLuaAppEnableOpenTypeSupport_0() then l_OpenTypeSupport_0:getUserNameStylisticAlternative() else nil
        })
    });
end;