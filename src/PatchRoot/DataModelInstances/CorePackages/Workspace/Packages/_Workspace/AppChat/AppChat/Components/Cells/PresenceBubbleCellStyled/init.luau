local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatMakeBackgroundTransparent);
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.Cryo);
local _ = require(l_Parent_0.UIBlox);
local v6 = require(l_script_FirstAncestor_0.SocialLibraries);
local v7 = require(script.Parent.PresenceBubbleCell);
local l_TestStyle_0 = v6.Components.TestStyle;
local v9 = {
    Size = UDim2.new(1, 0, 1, 0), 
    avatarCirclePresenceImage = nil, 
    subTitleText = nil, 
    subTitleIcon = nil, 
    titleText = "TestUser", 
    secondaryTitleText = nil, 
    thumbnails = {}, 
    conversationId = nil, 
    childWidth = 0, 
    style = v4.Dictionary.join(l_TestStyle_0, {
        Tokens = {
            Global = {
                Color = {
                    None = {}
                }
            }
        }
    }), 
    showDivider = true, 
    boldTitle = true, 
    isLoading = false, 
    hideLeftPadding = false
};
return v3.memo(function(v10) --[[ Line: 65 ]] --[[ Name: StyledCell ]]
    -- upvalues: v4 (copy), v9 (copy), v3 (copy), v7 (copy), v2 (copy)
    local v11 = v4.Dictionary.join(v9, v10);
    local l_style_0 = v11.style;
    local l_Theme_0 = l_style_0.Theme;
    local l_Font_0 = l_style_0.Font;
    local v15 = type(v11.avatarCirclePresenceImage) == "table";
    return v3.createElement(v7, {
        childWidth = v11.childWidth, 
        titleText = v11.titleText, 
        secondaryTitleText = v11.secondaryTitleText, 
        subTitleText = v11.subTitleText, 
        subTitleIcon = v11.subTitleIcon, 
        avatarCirclePresenceImage = v11.avatarCirclePresenceImage, 
        thumbnails = v11.thumbnails, 
        onActivated = v11.onActivated, 
        onCircleActivated = v11.onCircleActivated, 
        Size = v11.Size, 
        isLoading = v11.isLoading, 
        showNewPresenceImage = v15, 
        conversationId = v11.conversationId, 
        BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
        BackgroundTransparency = if v2() then l_style_0.Tokens.Global.Color.None.Transparency else l_Theme_0.BackgroundDefault.Transparency, 
        onPressedBackgroundColor3 = l_Theme_0.BackgroundOnPress.Color, 
        onPressedBackgroundTransparency = l_Theme_0.BackgroundOnPress.Transparency, 
        avatarCircleBackgroundColor3 = l_Theme_0.PlaceHolder.Color, 
        avatarCircleDividerColor3 = l_Theme_0.PlaceHolder.Color, 
        avatarCirclePresenceImageColor3 = if v15 then l_Theme_0.OnlineStatus.Color else nil, 
        avatarCirclePresenceImageTransparency = if v15 then l_Theme_0.OnlineStatus.Transparency else nil, 
        subTitleTextFont = l_Font_0.CaptionBody.Font, 
        subTitleTextTransparency = l_Theme_0.TextDefault.Transparency, 
        subTitleTextColor3 = l_Theme_0.TextDefault.Color, 
        subTitleTextSize = l_Font_0.CaptionBody.RelativeSize * l_Font_0.BaseSize, 
        subTitleIconColor3 = l_style_0.Theme.IconDefault.Color, 
        subTitleIconTransparency = l_style_0.Theme.IconDefault.Transparency, 
        titleFont = l_Font_0.Header2.Font, 
        titleTextTransparency = if not v11.boldTitle then l_Theme_0.TextDefault.Transparency else l_Theme_0.TextEmphasis.Transparency, 
        titleTextColor3 = if not v11.boldTitle then l_Theme_0.TextDefault.Color else l_Theme_0.TextEmphasis.Color, 
        titleTextSize = l_Font_0.Header2.RelativeSize * l_Font_0.BaseSize, 
        secondaryTitleFont = l_Font_0.Header2.Font, 
        secondaryTitleTextTransparency = l_Theme_0.TextMuted.Transparency, 
        secondaryTitleTextColor3 = l_Theme_0.TextMuted.Color, 
        secondaryTitleTextSize = l_Font_0.Header2.RelativeSize * l_Font_0.BaseSize, 
        showDivider = v11.showDivider, 
        dividerTransparency = l_Theme_0.Divider.Transparency, 
        dividerColor3 = l_Theme_0.Divider.Color, 
        avatarCircleCellWidth = v11.hideLeftPadding and 48 or nil, 
        hideLeftPadding = v11.hideLeftPadding
    }, v11.children or {});
end);