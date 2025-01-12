local l_script_FirstAncestor_0 = script:FindFirstAncestor("DiscoveryMonolith");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_Parent_0.RobloxAppHooks);
local _ = require(l_Parent_0.Style);
local l_UiMode_0 = require(l_Parent_0.RobloxAppEnums).UiMode;
local l_Modules_0 = l_script_FirstAncestor_0.Modules;
local v6 = require(l_Modules_0.LuaApp.Components.ExperienceDetails.Flags.FFlagEDPAddRatingTitle10ft);
local l_GetFFlagConsoleApplyTokenizationEdp_0 = require(l_Parent_0.SharedFlags).GetFFlagConsoleApplyTokenizationEdp;
return function(v8, v9) --[[ Line: 18 ]] --[[ Name: makeExperienceDetailsTokenMapper ]]
    -- upvalues: l_UiMode_0 (copy), l_GetFFlagConsoleApplyTokenizationEdp_0 (copy), v6 (copy)
    local v10 = nil;
    local v11 = nil;
    local v12 = nil;
    local v13 = nil;
    local v14 = nil;
    local v15 = nil;
    local v16 = nil;
    local v17 = nil;
    local v18 = nil;
    local v19 = nil;
    local v20 = nil;
    local v21 = nil;
    local v22 = nil;
    local v23 = nil;
    local v24 = nil;
    local v25 = nil;
    local v26 = nil;
    local l_Medium_0 = v9.Semantic.Radius.Medium;
    local l_Size_200_0 = v9.Global.Size_200;
    local v29 = 1;
    local l_Size_300_0 = v9.Global.Size_300;
    local l_Size_200_1 = v9.Global.Size_200;
    local l_Header_0 = v9.Semantic.Typography.Header;
    local v33 = {
        Color = v9.Semantic.Color.Text.Emphasis.Color3, 
        Transparency = v9.Semantic.Color.Text.Emphasis.Transparency
    };
    if v8.uiMode == l_UiMode_0.TenFoot then
        if l_GetFFlagConsoleApplyTokenizationEdp_0() then
            v26 = v9.Global.Size_100 * 49;
            v10 = v9.Global.Size_100 * 33;
        else
            v10 = 400;
        end;
        v11 = 0;
        v18 = 0;
        v14 = 0;
        v15 = 4;
        v12 = v9.Global.Space_400;
        v13 = v9.Global.Space_100;
        v16 = v9.Global.LineHeight_300;
        v17 = 0;
        v19 = v9.Global.Space_500;
        v20 = v9.Semantic.Color.BackgroundUi.Default;
        v21 = Vector2.new(v9.Global.Size_200, v9.Global.Size_100);
        v22 = {
            dampingRatio = 1, 
            frequency = 3
        };
        v23 = v9.Global.Space_300;
        v24 = Vector2.new(v9.Global.Size_800, v9.Global.Size_1200);
        v25 = 3000;
        v29 = 0.6;
    end;
    return {
        ThumbnailSize = v10, 
        ThumbnailMargin = v12, 
        SideMargin = v11, 
        HeaderItemPadding = v13, 
        HeaderDescriptionMaxRows = v15, 
        HeaderDescriptionLineHeight = v16, 
        ThumbnailShadowHeight = v17, 
        HeaderGradientHeight = v18, 
        HeaderBarBackgroundHeight = v14, 
        HeaderBottomMargin = v19, 
        ActionBarButtonBackgroundColor = v20, 
        ActionBarTextButtonPadding = v21, 
        AnimationConfig = v22, 
        ItemPadding = v23, 
        SafeAreaSize = v24, 
        TrailingWhitespace = v25, 
        PanelRadius = l_Medium_0, 
        PanelHeaderMargin = l_Size_200_0, 
        PanelWidthScale = v29, 
        PanelInnerPadding = l_Size_300_0, 
        IconSize = v9.Semantic.Icon.Size.Medium, 
        SectionListPadding = if v6 then l_Size_200_1 else nil, 
        TitleFontStyle = if v6 then l_Header_0 else nil, 
        TitleColorStyle = if v6 then v33 else nil, 
        ExpandableAreaHeightOffset = if l_GetFFlagConsoleApplyTokenizationEdp_0() then v26 else nil
    };
end;