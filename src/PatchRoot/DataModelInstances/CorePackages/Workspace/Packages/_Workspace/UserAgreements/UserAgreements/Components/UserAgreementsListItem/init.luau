local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_TextService_0 = game:GetService("TextService");
local l_Roact_0 = v1.Roact;
local l_RoactRodux_0 = v1.RoactRodux;
local l_UIBlox_0 = v1.UIBlox;
local l_t_0 = v1.t;
local l_RobloxAppEnums_0 = v1.RobloxAppEnums;
local l_AppPage_0 = l_RobloxAppEnums_0.AppPage;
local l_RoactServices_0 = v1.RoactServices.RoactServices;
local l_AppLinking_0 = v1.RoactServiceTags.AppLinking;
local l_NavigateDown_0 = v1.NavigationRodux.Thunks.NavigateDown;
local l_NotificationType_0 = l_RobloxAppEnums_0.NotificationType;
local l_withStyle_0 = l_UIBlox_0.Core.Style.withStyle;
local l_ArgCheck_0 = v1.ArgCheck;
local v15 = require(script.Parent.DEPRECATED_ImageSetLabel);
local l_withLocalization_0 = v1.Localization.withLocalization;
local l_FFlagEnableModularizedUserAgreementsList_0 = v1.SharedFlags.FFlagEnableModularizedUserAgreementsList;
local l_GetFFlagVngTOSRevisedEnabled_0 = v1.SharedFlags.GetFFlagVngTOSRevisedEnabled;
local v19 = game:DefineFastFlag("TrimLongTitleForTOSEnabled", false);
local l_RoactAppPolicy_0 = v1.UniversalAppPolicy.RoactAppPolicy;
local l_FitFrame_0 = v1.FitFrame;
local l_ImageSetLabel_0 = l_UIBlox_0.Core.ImageSet.ImageSetLabel;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local l_StyledTextLabel_0 = l_UIBlox_0.App.Text.StyledTextLabel;
local v25 = l_Roact_0.PureComponent:extend("UserAgreementsListItem");
v25.validateProps = l_t_0.strictInterface({
    LayoutOrder = l_t_0.integer, 
    Size = if not l_GetFFlagVngTOSRevisedEnabled_0() then l_t_0.UDim2 else nil, 
    agreement = l_t_0.strictInterface({
        id = l_t_0.string, 
        agreementType = l_t_0.string, 
        clientType = l_t_0.string, 
        displayUrl = l_t_0.string, 
        regulationType = l_t_0.string
    }), 
    minHeight = l_t_0.optional(l_t_0.integer), 
    margin = l_t_0.optional(l_t_0.strictInterface({
        top = l_t_0.integer, 
        right = l_t_0.integer, 
        bottom = l_t_0.integer, 
        left = l_t_0.integer
    })), 
    navigateDown = l_t_0.callback, 
    agreementTypeExists = l_t_0.optional(l_t_0.boolean), 
    useExternalBrowserForDisclaimerLinks = l_t_0.optional(l_t_0.boolean), 
    linking = l_t_0.optional(l_t_0.table), 
    hideLink = l_t_0.optional(l_t_0.boolean), 
    checkBoxPresent = l_t_0.optional(l_t_0.boolean)
});
v25.defaultProps = {
    margin = l_FitFrame_0.Rect.square(0), 
    agreementTypeExists = false
};
openExternalBrowser = function(v26, v27) --[[ Line: 82 ]] --[[ Name: openExternalBrowser ]]
    -- upvalues: l_ArgCheck_0 (copy)
    l_ArgCheck_0.isNotNil(v26, "linking");
    l_ArgCheck_0.isType(v27, "string", "url");
    v26:openURL(v27);
end;
v25.init = function(v28) --[[ Line: 89 ]] --[[ Name: init ]]
    -- upvalues: l_Roact_0 (copy), l_FFlagEnableModularizedUserAgreementsList_0 (copy)
    local v29, v30 = l_Roact_0.createBinding(false);
    v28.buttonPressed = v29;
    v28.updateButtonPressed = v30;
    v28.onButtonInputBegan = function(_, v32) --[[ Line: 92 ]]
        -- upvalues: v28 (copy)
        if v32.UserInputType == Enum.UserInputType.Touch or v32.UserInputType == Enum.UserInputType.MouseButton1 then
            if v28.buttonPressed:getValue() then
                return;
            else
                v28.updateButtonPressed(true);
            end;
        end;
    end;
    v28.onButtonInputEnded = function() --[[ Line: 104 ]]
        -- upvalues: v28 (copy)
        if v28.buttonPressed:getValue() then
            v28.updateButtonPressed(false);
        end;
    end;
    v28.showLinkText = function() --[[ Line: 110 ]]
        -- upvalues: l_FFlagEnableModularizedUserAgreementsList_0 (ref), v28 (copy)
        if l_FFlagEnableModularizedUserAgreementsList_0 then
            return not v28.props.hideLink and not v28.props.agreementTypeExists;
        else
            return not v28.props.agreementTypeExists;
        end;
    end;
end;
v25.renderWithProviders = function(v33, v34, v35) --[[ Line: 119 ]] --[[ Name: renderWithProviders ]]
    -- upvalues: l_FFlagEnableModularizedUserAgreementsList_0 (copy), l_GetFFlagVngTOSRevisedEnabled_0 (copy), l_TextService_0 (copy), l_ImageSetLabel_0 (copy), l_Images_0 (copy), v15 (copy), l_Roact_0 (copy), v19 (copy), l_AppPage_0 (copy), l_NotificationType_0 (copy), l_StyledTextLabel_0 (copy)
    local l_LayoutOrder_0 = v33.props.LayoutOrder;
    local l_Size_0 = v33.props.Size;
    local v38 = v33.props.minHeight or 55;
    local l_margin_0 = v33.props.margin;
    local l_agreement_0 = v33.props.agreement;
    local v41 = v33.props.checkBoxPresent or false;
    local l_Font_0 = v35.Font;
    local l_Theme_0 = v35.Theme;
    local l_Tokens_0 = v35.Tokens;
    local v45 = -(l_margin_0.left + l_margin_0.right + 14);
    local v46 = if l_FFlagEnableModularizedUserAgreementsList_0 and v41 then l_Tokens_0.Global.FontSize_100 else l_Font_0.BaseSize * l_Font_0.Header2.RelativeSize;
    local v47 = 20 / v46;
    local v48 = l_Font_0.BaseSize * l_Font_0.CaptionHeader.RelativeSize;
    local v49 = 14 / v48;
    local l_displayUrl_0 = l_agreement_0.displayUrl;
    local l_agreementTitle_0 = v34.agreementTitle;
    local l_shortTitle_0 = v34.shortTitle;
    local l_v38_0 = v38;
    if l_GetFFlagVngTOSRevisedEnabled_0() and v33.state.titleTextWidth and v33.state.titleTextWidth > 100 then
        l_v38_0 = math.max(v38, l_TextService_0:GetTextSize(l_agreementTitle_0, v46, l_Font_0.Body.Font, Vector2.new(v33.state.titleTextWidth, 1e999)).Y + 20 + l_margin_0.top + l_margin_0.bottom);
    end;
    local v54 = nil;
    local v55 = nil;
    local v56 = nil;
    if l_FFlagEnableModularizedUserAgreementsList_0 then
        v54 = l_ImageSetLabel_0;
        v55 = 3;
        v56 = l_Images_0["icons/navigation/pushRight"];
    else
        v54 = v15;
        v55 = 1;
        v56 = "LuaApp/icons/navigation/pushRight_small";
    end;
    local function v60(v57, v58, v59) --[[ Line: 174 ]] --[[ Name: createImageElement ]]
        -- upvalues: l_Roact_0 (ref), l_margin_0 (copy), l_FFlagEnableModularizedUserAgreementsList_0 (ref), l_Theme_0 (copy)
        return l_Roact_0.createElement(v57, {
            AnchorPoint = Vector2.new(1, 0.5), 
            Size = UDim2.new(0, 14 * v58, 0, 14 * v58), 
            Position = UDim2.new(1, -l_margin_0.right, 0.5, 0), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Image = v59, 
            ImageColor3 = if l_FFlagEnableModularizedUserAgreementsList_0 then l_Theme_0.UIEmphasis.Color else l_Theme_0.SecondaryDefault.Color, 
            ImageTransparency = l_FFlagEnableModularizedUserAgreementsList_0 and 0 or l_Theme_0.SecondaryDefault.Transparency
        });
    end;
    return l_Roact_0.createElement("ImageButton", {
        LayoutOrder = l_LayoutOrder_0, 
        Size = if l_GetFFlagVngTOSRevisedEnabled_0() then UDim2.new(1, 0, 0, l_v38_0) else l_Size_0, 
        AutoButtonColor = false, 
        BackgroundColor3 = v35.Theme.BackgroundOnPress.Color, 
        BackgroundTransparency = v33.buttonPressed:map(function(v61) --[[ Line: 196 ]]
            -- upvalues: v35 (copy)
            return v61 and v35.Theme.BackgroundOnPress.Transparency or 1;
        end), 
        BorderSizePixel = 0, 
        [l_Roact_0.Event.InputBegan] = v33.onButtonInputBegan, 
        [l_Roact_0.Event.InputEnded] = v33.onButtonInputEnded, 
        [l_Roact_0.Event.Activated] = function() --[[ Line: 202 ]]
            -- upvalues: v33 (copy), l_displayUrl_0 (copy), l_agreementTitle_0 (copy), v19 (ref), l_shortTitle_0 (copy), l_AppPage_0 (ref), l_NotificationType_0 (ref)
            if v33.props.useExternalBrowserForDisclaimerLinks then
                openExternalBrowser(v33.props.linking, l_displayUrl_0);
                return;
            else
                local l_l_agreementTitle_0_0 = l_agreementTitle_0;
                if v19 and string.len(l_agreementTitle_0) > 30 then
                    l_l_agreementTitle_0_0 = (not (l_shortTitle_0 ~= nil) or l_shortTitle_0 == "") and "Terms" or l_shortTitle_0;
                end;
                v33.props.navigateDown({
                    name = l_AppPage_0.GenericWebPage, 
                    detail = l_displayUrl_0, 
                    extraProps = {
                        title = l_l_agreementTitle_0_0, 
                        notificationType = l_NotificationType_0.OPEN_CUSTOM_WEBVIEW
                    }
                });
                return;
            end;
        end
    }, {
        Padding = l_Roact_0.createElement("UIPadding", {
            PaddingTop = UDim.new(0, l_margin_0.top), 
            PaddingBottom = UDim.new(0, l_margin_0.bottom), 
            PaddingLeft = UDim.new(0, l_margin_0.left), 
            PaddingRight = if l_FFlagEnableModularizedUserAgreementsList_0 and v41 then UDim.new(0, l_margin_0.right * 2) else UDim.new(0, 0)
        }), 
        TextLayout = l_Roact_0.createElement("Frame", {
            Size = UDim2.new(1, v45, 1, 0), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0
        }, {
            ListLayout = l_Roact_0.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            TitleText = if l_GetFFlagVngTOSRevisedEnabled_0() then l_Roact_0.createElement(l_StyledTextLabel_0, {
                layoutOrder = 1, 
                size = UDim2.new(1, 0, 0, 0), 
                text = l_agreementTitle_0, 
                fontStyle = l_Font_0.Body, 
                colorStyle = l_Theme_0.TextMuted, 
                textXAlignment = Enum.TextXAlignment.Left, 
                textYAlignment = Enum.TextYAlignment.Center, 
                textTruncate = Enum.TextTruncate.None, 
                automaticSize = Enum.AutomaticSize.Y, 
                onAbsoluteSizeChange = function(v63) --[[ Line: 251 ]] --[[ Name: onAbsoluteSizeChange ]]
                    -- upvalues: v33 (copy)
                    local l_AbsoluteSize_0 = v63.AbsoluteSize;
                    if v33.state.titleTextWidth ~= l_AbsoluteSize_0.X then
                        v33:setState({
                            titleTextWidth = l_AbsoluteSize_0.X
                        });
                    end;
                end
            }) else l_Roact_0.createElement("TextLabel", {
                LayoutOrder = 1, 
                Size = UDim2.new(l_FFlagEnableModularizedUserAgreementsList_0 and v41 and 0.9 or 1, 0, 0, l_FFlagEnableModularizedUserAgreementsList_0 and 40 or 20), 
                Position = UDim2.new(0, 0, 0.5, 0), 
                AnchorPoint = Vector2.new(0, 0.5), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Text = l_agreementTitle_0, 
                Font = if l_FFlagEnableModularizedUserAgreementsList_0 then l_Font_0.Body.Font else l_Font_0.Header2.Font, 
                TextSize = v46, 
                LineHeight = v47, 
                TextColor3 = l_Theme_0.TextMuted.Color, 
                TextTransparency = l_Theme_0.TextMuted.Transparency, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextWrapped = l_FFlagEnableModularizedUserAgreementsList_0 and true or false, 
                TextYAlignment = Enum.TextYAlignment.Center
            }), 
            LinkText = v33.showLinkText() and l_Roact_0.createElement("TextLabel", {
                LayoutOrder = 2, 
                Size = UDim2.new(1, 0, 0, 14), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Text = l_displayUrl_0, 
                Font = l_Font_0.Header2.Font, 
                TextSize = v48, 
                LineHeight = v49, 
                TextColor3 = l_Theme_0.TextEmphasis.Color, 
                TextTransparency = 0.5, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                TextTruncate = Enum.TextTruncate.AtEnd
            }) or nil
        }), 
        RightImage = v60(v54, v55, v56)
    });
end;
v25.render = function(v65) --[[ Line: 303 ]] --[[ Name: render ]]
    -- upvalues: l_withLocalization_0 (copy), l_withStyle_0 (copy)
    local l_agreement_1 = v65.props.agreement;
    local v67 = v65.props.agreementTypeExists and "CommonUI.UserAgreements.Popup.Agreement." .. l_agreement_1.agreementType or "CommonUI.UserAgreements.Popup.DefaultAgreementTitle";
    return l_withLocalization_0({
        agreementTitle = v67, 
        shortTitle = "CommonUI.UserAgreements.Popup.TitleOnWebview"
    })(function(v68) --[[ Line: 312 ]]
        -- upvalues: l_withStyle_0 (ref), v65 (copy)
        return l_withStyle_0(function(v69) --[[ Line: 313 ]]
            -- upvalues: v65 (ref), v68 (copy)
            return v65:renderWithProviders(v68, v69);
        end);
    end);
end;
v25 = l_RoactAppPolicy_0.connect(function(v70) --[[ Line: 319 ]]
    return {
        useExternalBrowserForDisclaimerLinks = v70.shouldUseExternalBrowserForDisclaimerLinks()
    };
end)(v25);
v25 = l_RoactServices_0.connect({
    linking = l_AppLinking_0
})(v25);
return (l_RoactRodux_0.connect(nil, function(v71) --[[ Line: 329 ]]
    -- upvalues: l_NavigateDown_0 (copy)
    return {
        navigateDown = function(v72) --[[ Line: 331 ]] --[[ Name: navigateDown ]]
            -- upvalues: v71 (copy), l_NavigateDown_0 (ref)
            v71(l_NavigateDown_0(v72));
        end
    };
end)(v25));