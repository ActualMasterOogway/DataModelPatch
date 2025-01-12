local l_script_FirstAncestor_0 = script:FindFirstAncestor("AuthCommon");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Roact);
local v3 = require(l_Parent_0.RoactRodux);
local v4 = require(l_Parent_0.UIBlox);
local l_Text_0 = require(l_Parent_0.AppCommonLib).Text;
local l_LinkButton_0 = v4.App.Button.LinkButton;
local l_ContextualMenu_0 = v4.App.Menu.ContextualMenu;
local l_MenuDirection_0 = v4.App.Menu.MenuDirection;
local l_ImageSetLabel_0 = v4.Core.ImageSet.ImageSetLabel;
local l_AppLinking_0 = require(l_Parent_0.RoactServiceTags).AppLinking;
local l_RoactServices_0 = require(l_Parent_0.RoactServices).RoactServices;
local l_RoactAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).RoactAppPolicy;
local v13 = require(l_Parent_0.Cryo);
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local l_UiMode_0 = require(l_Parent_0.RobloxAppEnums).UiMode;
local l_useUiModeInfo_0 = require(l_Parent_0.RobloxAppHooks).useUiModeInfo;
local v17 = require(l_script_FirstAncestor_0.Components.FitChildren);
local l_NavigateDown_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateDown;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local v20 = require(l_script_FirstAncestor_0.Enums.TransitionAnimation);
local l_withLocalization_0 = require(l_Parent_0.Localization).withLocalization;
local l_withStyle_0 = v4.Style.withStyle;
local v23 = require(l_script_FirstAncestor_0.Thunks.OpenExternalBrowser);
local l_UrlBuilder_0 = require(l_Parent_0.UrlBuilder).UrlBuilder;
local v25 = require(l_Parent_0.AuthAnalytics);
local l_authFormInteraction_0 = v25.Events.authFormInteraction;
local l_EventStreamConstants_0 = v25.EventStreamConstants;
local v28 = require(script.Parent.DisclaimerLinkButtons);
local v29 = game:DefineFastFlag("HideHyphenInDisclaimerLinks", false);
local v30 = v2.PureComponent:extend("DisclaimerLinks");
v30.init = function(v31) --[[ Line: 47 ]] --[[ Name: init ]]
    -- upvalues: v23 (copy), l_AppPage_0 (copy), v20 (copy), l_UrlBuilder_0 (copy), l_authFormInteraction_0 (copy), l_EventStreamConstants_0 (copy)
    v31.openDisclaimerLink = function(v32) --[[ Line: 48 ]]
        -- upvalues: v31 (copy), v23 (ref), l_AppPage_0 (ref), v20 (ref)
        if v31.props.useExternalBrowserForDisclaimerLinks then
            v23(v31.props.linking, v32);
            return;
        else
            v31.props.navigateDown({
                name = l_AppPage_0.GenericWebPage, 
                detail = v32, 
                extraProps = {
                    title = "", 
                    transitionAnimation = v20.SlideInFromRight
                }
            });
            return;
        end;
    end;
    v31.openTermsLink = function() --[[ Line: 63 ]]
        -- upvalues: l_UrlBuilder_0 (ref), v31 (copy), l_authFormInteraction_0 (ref), l_EventStreamConstants_0 (ref)
        local v33 = l_UrlBuilder_0.static.about.terms();
        if v31.props.ctx then
            l_authFormInteraction_0(v31.props.ctx, l_EventStreamConstants_0.Field.TermsOfService, v31.props.state);
        end;
        v31.openDisclaimerLink(v33);
    end;
    v31.openPrivacyLink = function() --[[ Line: 71 ]]
        -- upvalues: l_UrlBuilder_0 (ref), v31 (copy), l_authFormInteraction_0 (ref), l_EventStreamConstants_0 (ref)
        local v34 = l_UrlBuilder_0.static.about.privacy();
        if v31.props.ctx then
            l_authFormInteraction_0(v31.props.ctx, l_EventStreamConstants_0.Field.PrivacyPolicy, v31.props.state);
        end;
        v31.openDisclaimerLink(v34);
    end;
end;
v30.render = function(v35) --[[ Line: 80 ]] --[[ Name: render ]]
    -- upvalues: l_withLocalization_0 (copy), l_withStyle_0 (copy), l_UiMode_0 (copy), l_Text_0 (copy), v17 (copy), v2 (copy), l_ImageSetLabel_0 (copy), v28 (copy), l_ContextualMenu_0 (copy), l_MenuDirection_0 (copy), l_LinkButton_0 (copy), v29 (copy)
    local l_isDualLayout_0 = v35.props.isDualLayout;
    local l_LoginView_0 = v35.props.tokens.LuaApps.LoginView;
    local v38 = if l_LoginView_0 then l_LoginView_0.boxPadding else 4;
    return l_withLocalization_0({
        termsOfUseText = "CommonUI.Features.Label.Terms", 
        termsOfUseTextLong = "CommonUI.Features.Label.TermsOfUse", 
        privacyPolicyText = "CommonUI.Features.Label.Privacy", 
        privacyPolicyTextLong = "CommonUI.Features.Label.PrivacyPolicy"
    })(function(v39) --[[ Line: 91 ]]
        -- upvalues: l_withStyle_0 (ref), v35 (copy), l_UiMode_0 (ref), l_isDualLayout_0 (copy), l_Text_0 (ref), v38 (copy), v17 (ref), v2 (ref), l_ImageSetLabel_0 (ref), l_LoginView_0 (copy), v28 (ref), l_ContextualMenu_0 (ref), l_MenuDirection_0 (ref), l_LinkButton_0 (ref), v29 (ref)
        return l_withStyle_0(function(v40) --[[ Line: 92 ]]
            -- upvalues: v35 (ref), l_UiMode_0 (ref), l_isDualLayout_0 (ref), v39 (copy), l_Text_0 (ref), v38 (ref), v17 (ref), v2 (ref), l_ImageSetLabel_0 (ref), l_LoginView_0 (ref), v28 (ref), l_ContextualMenu_0 (ref), l_MenuDirection_0 (ref), l_LinkButton_0 (ref), v29 (ref)
            local v41 = v35.props.uiModeInfo.uiMode == l_UiMode_0.TenFoot;
            local l_LayoutOrder_0 = v35.props.LayoutOrder;
            local l_BaseSize_0 = v40.Font.BaseSize;
            local v44 = if l_isDualLayout_0 then v39.termsOfUseTextLong else v39.termsOfUseText;
            local v45 = if l_isDualLayout_0 then v39.privacyPolicyTextLong else "<b>" .. v39.privacyPolicyText .. "</b>";
            local l_Font_0 = v40.Font.Header2.Font;
            local v47 = l_Text_0.GetTextWidth(" ", l_Font_0, l_BaseSize_0) / 2;
            local v48 = l_Text_0.GetTextWidth("-", l_Font_0, l_BaseSize_0);
            local v49 = l_Text_0.GetTextHeight(v39.privacyPolicyText, l_Font_0, l_BaseSize_0) + v38;
            if l_isDualLayout_0 then
                v49 = 2 * (l_Text_0.GetTextHeight(v39.privacyPolicyText, l_Font_0, l_BaseSize_0) + 2 * v38);
            end;
            local v50 = l_isDualLayout_0 and "Frame" or v17.FitFrame;
            local function v51() --[[ Line: 118 ]]
                -- upvalues: v2 (ref), l_ImageSetLabel_0 (ref), l_LoginView_0 (ref), v40 (copy)
                return {
                    Image = v2.createElement(l_ImageSetLabel_0, {
                        Size = UDim2.new(0, l_LoginView_0.disclaimerIconSize, 0, l_LoginView_0.disclaimerIconSize), 
                        Position = UDim2.fromOffset(0, 0), 
                        BackgroundTransparency = 1, 
                        LayoutOrder = 1, 
                        ScaleType = Enum.ScaleType.Fit, 
                        Image = l_LoginView_0.linkIcon, 
                        ImageColor3 = v40.Theme.UIEmphasis.Color, 
                        ImageTransparency = 0
                    })
                };
            end;
            if v41 then
                return v2.createElement(v28, {
                    textTos = v44, 
                    activatedTos = v35.openTermsLink, 
                    textPrivacy = v45, 
                    activatedPrivacy = v35.openPrivacyLink, 
                    fillDirection = v35.props.fillDirection, 
                    layoutOrder = l_LayoutOrder_0, 
                    tokens = l_LoginView_0
                });
            else
                return v2.createElement(v50, {
                    fitAxis = if not l_isDualLayout_0 then v17.FitAxis.Width else nil, 
                    Size = UDim2.new(1, 0, 0, v49), 
                    BackgroundTransparency = 1, 
                    LayoutOrder = l_LayoutOrder_0
                }, {
                    UIListLayout = v2.createElement("UIListLayout", {
                        Padding = UDim.new(0, v47), 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        FillDirection = if l_isDualLayout_0 then Enum.FillDirection.Vertical else Enum.FillDirection.Horizontal, 
                        HorizontalAlignment = if l_isDualLayout_0 then Enum.HorizontalAlignment.Left else Enum.HorizontalAlignment.Center, 
                        VerticalAlignment = Enum.VerticalAlignment.Center
                    }), 
                    ContextualMenu = if l_isDualLayout_0 then v2.createElement(l_ContextualMenu_0, {
                        buttonProps = {
                            {
                                text = v44, 
                                fontStyle = v40.Font.Header1, 
                                onActivated = v35.openTermsLink, 
                                rightSideGadgetSize = Vector2.new(l_LoginView_0.disclaimerIconSize + l_LoginView_0.disclaimerPadding, l_LoginView_0.disclaimerIconSize), 
                                renderRightSideGadget = v51
                            }, 
                            {
                                text = v45, 
                                fontStyle = v40.Font.Header1, 
                                onActivated = v35.openPrivacyLink, 
                                rightSideGadgetSize = Vector2.new(l_LoginView_0.disclaimerIconSize + l_LoginView_0.disclaimerPadding, l_LoginView_0.disclaimerIconSize), 
                                renderRightSideGadget = v51
                            }
                        }, 
                        open = true, 
                        stayOnActivated = true, 
                        isElementBackgroundVisible = false, 
                        isElementDividerVisible = false, 
                        closeBackgroundVisible = false, 
                        topElementRounded = false, 
                        bottomElementRounded = false, 
                        horizontalAlignment = Enum.HorizontalAlignment.Center, 
                        menuDirection = l_MenuDirection_0.Down, 
                        contextMenuWidthOverride = UDim.new(1, 0), 
                        elementHeight = l_LoginView_0.disclaimerElementHeight, 
                        openPositionX = UDim.new(0, 0), 
                        openPositionY = UDim.new(0, 0), 
                        screenSize = Vector2.new(0, 0)
                    }) else nil, 
                    TermsOfUse = if not l_isDualLayout_0 then v2.createElement(l_LinkButton_0, {
                        text = v44, 
                        size = if l_isDualLayout_0 then UDim2.new(1, 0, 0.5, 0) else UDim2.new(0, 0, 1, 0), 
                        fontStyle = "Header2", 
                        layoutOrder = 1, 
                        underlineAlwaysEnabled = true, 
                        onActivated = v35.openTermsLink
                    }) else nil, 
                    Hyphen = if not l_isDualLayout_0 then v2.createElement("TextLabel", {
                        BackgroundTransparency = 1, 
                        Text = v29 and " " or "-", 
                        Size = UDim2.new(0, v48, 1, 0), 
                        Font = l_Font_0, 
                        TextColor3 = v40.Theme.TextEmphasis.Color, 
                        TextTransparency = v40.Theme.TextEmphasis.Transparency, 
                        TextSize = l_BaseSize_0, 
                        LayoutOrder = 2
                    }) else nil, 
                    PrivacyPolicy = if not l_isDualLayout_0 then v2.createElement(l_LinkButton_0, {
                        text = v45, 
                        size = if l_isDualLayout_0 then UDim2.new(1, 0, 0.5, 0) else UDim2.new(0, 0, 1, 0), 
                        fontStyle = "Header2", 
                        layoutOrder = 3, 
                        underlineAlwaysEnabled = true, 
                        onActivated = v35.openPrivacyLink
                    }) else nil
                });
            end;
        end);
    end);
end;
v30 = v3.connect(function(_, _) --[[ Line: 242 ]]
    return {};
end, function(v54) --[[ Line: 244 ]]
    -- upvalues: l_NavigateDown_0 (copy)
    return {
        navigateDown = function(v55) --[[ Line: 246 ]] --[[ Name: navigateDown ]]
            -- upvalues: v54 (copy), l_NavigateDown_0 (ref)
            return v54(l_NavigateDown_0(v55));
        end
    };
end)(v30);
v30 = l_RoactAppPolicy_0.connect(function(v56) --[[ Line: 252 ]]
    return {
        useExternalBrowserForDisclaimerLinks = v56.shouldUseExternalBrowserForDisclaimerLinks()
    };
end)(v30);
local v57 = l_RoactServices_0.connect({
    linking = l_AppLinking_0
})(v30);
return function(v58) --[[ Line: 263 ]]
    -- upvalues: l_useDesignTokens_0 (copy), l_useUiModeInfo_0 (copy), v2 (copy), v57 (copy), v13 (copy)
    local v59 = l_useDesignTokens_0();
    local v60 = l_useUiModeInfo_0();
    return v2.createElement(v57, v13.Dictionary.join({
        tokens = v59, 
        uiModeInfo = v60
    }, v58));
end;