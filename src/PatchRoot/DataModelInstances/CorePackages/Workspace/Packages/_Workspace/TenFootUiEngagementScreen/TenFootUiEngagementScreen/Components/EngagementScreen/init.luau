local l_Parent_0 = script:FindFirstAncestor("TenFootUiEngagementScreen").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.UIBlox);
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local l_Button_0 = v2.App.Button.Button;
local l_ButtonType_0 = v2.App.Button.Enum.ButtonType;
local l_StandardButtonSize_0 = v2.App.Button.Enum.StandardButtonSize;
local l_DividerWithText_0 = require(l_Parent_0.TenFootUiSharedComponents).DividerWithText;
local v8 = require(script.Parent.SwitchAccountButton);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_AppLogging_0 = require(l_Parent_0.RoactServiceTags).AppLogging;
return function(v12) --[[ Line: 20 ]] --[[ Name: EngagementScreen ]]
    -- upvalues: l_useDesignTokens_0 (copy), l_useLocalization_0 (copy), l_useRoactService_0 (copy), l_AppLogging_0 (copy), v1 (copy), l_Button_0 (copy), l_ButtonType_0 (copy), l_StandardButtonSize_0 (copy), l_DividerWithText_0 (copy), v8 (copy)
    local v14 = l_useDesignTokens_0(function(v13) --[[ Line: 21 ]]
        return {
            headerFontStyle = v13.Semantic.Typography.Header, 
            footerFontStyle = v13.Semantic.Typography.Footer, 
            defaultTextColor = v13.Semantic.Color.Text.Default, 
            mutedTextColor = v13.Semantic.Color.Text.Muted, 
            engagementScreen = v13.LuaApps.EngagementScreen
        };
    end);
    local l_headerFontStyle_0 = v14.headerFontStyle;
    local v16 = l_useLocalization_0({
        continue = "CommonUI.Features.Label.EngagementScreen.Continue", 
        orYouCan = "CommonUI.Features.Labels.OrYouCan"
    });
    local v17 = l_useRoactService_0(l_AppLogging_0);
    v1.useLayoutEffect(function() --[[ Line: 38 ]]
        -- upvalues: v17 (copy)
        v17:logEventOnce("engagement_screen_did_mount");
    end, {
        v17
    });
    return v1.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1
    }, v1.createElement("ImageLabel", {
        Position = v14.engagementScreen.robloxLogoTextImagePosition, 
        Size = v14.engagementScreen.robloxLogoTextImageSize, 
        Image = v14.engagementScreen.robloxLogoTextImageUrl, 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        BackgroundTransparency = 1
    }), v1.createElement("Frame", {
        Position = v14.engagementScreen.buttonContainerPosition, 
        Size = UDim2.new(0, v14.engagementScreen.containerWidth, 0, v14.engagementScreen.containerHeight), 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        BackgroundTransparency = 1
    }, v1.createElement("UIListLayout", {
        SortOrder = Enum.SortOrder.LayoutOrder, 
        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
        VerticalAlignment = Enum.VerticalAlignment.Center, 
        Padding = UDim.new(0, v14.engagementScreen.buttonPadding)
    }), v1.createElement(l_Button_0, {
        buttonType = l_ButtonType_0.PrimarySystem, 
        layoutOrder = 1, 
        text = v16.continue, 
        fontStyle = l_headerFontStyle_0, 
        standardSize = l_StandardButtonSize_0.Regular, 
        onActivated = v12.onContinue
    }), if v12.onSwitchAccounts then v1.createElement(v1.Fragment, nil, v1.createElement(l_DividerWithText_0, {
        layoutOrder = 2, 
        size = UDim2.new(0, v14.engagementScreen.dividerWidth, 0, v14.engagementScreen.dividerHeight), 
        width = 0, 
        height = 0, 
        font = v14.footerFontStyle.Font, 
        fontSize = v14.footerFontStyle.FontSize, 
        color3 = v14.mutedTextColor.Color3, 
        transparency = v14.mutedTextColor.Transparency, 
        text = v16.orYouCan, 
        padding = v14.engagementScreen.dividerPadding
    }), v1.createElement(v8, {
        layoutOrder = 3, 
        fontStyle = l_headerFontStyle_0, 
        onActivated = v12.onSwitchAccounts
    })) else nil));
end;