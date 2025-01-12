local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v3 = require(l_Parent_2.Roact);
local l_FitFrameVertical_0 = require(l_Parent_2.RoactFitComponents).FitFrameVertical;
local v5 = require(l_Parent_2.UIBlox);
local l_InteractiveAlert_0 = v5.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v5.App.Button.Enum.ButtonType;
local l_withStyle_0 = v5.Core.Style.withStyle;
local v9 = require(l_Parent_1.Locale.MultiTextLocalizer);
local v10 = require(l_Parent_0.ProductDetails);
local v11 = require(l_Parent_1.Generic.Constants);
local v12 = require(l_Parent_1.Flags.getEnableCondenseRobuxUpsell);
local v13 = v3.Component:extend(script.Name);
v13.defaultProps = {
    anchorPoint = Vector2.new(0.5, 0.5), 
    position = UDim2.new(0.5, 0, 0.5, 0), 
    isLoading = false, 
    isDisabled = false, 
    isDelayedInput = false, 
    isQuest = false, 
    enableInputDelayed = false, 
    inputDelaySec = 3, 
    isVng = false
};
v13.init = function(v14) --[[ Line: 77 ]] --[[ Name: init ]]
    -- upvalues: v3 (copy), v12 (copy), v11 (copy)
    v14.contentRef = v3.createRef();
    v14.state = {
        contentSize = Vector2.new(0, 0), 
        footerSize = Vector2.new(0, 0), 
        isCondensed = false
    };
    v14.validateCondensedCondition = function(v15) --[[ Line: 85 ]]
        -- upvalues: v12 (ref), v11 (ref), v14 (copy)
        if not v12() then
            return;
        else
            local v16 = v15.AbsoluteSize.Y + v11.MODAL_HEIGHT_WITHOUT_CONTENT + v11.MODAL_NORMAL_SECTION_PADDING * 2 + v11.MODAL_NORMAL_BUTTON_HEIGHT * 2;
            if v14.state.isCondensed then
                v14:setState({
                    isCondensed = v14.props.screenSize.Y < v16 + (v11.MODAL_NORMAL_CONTENT_PADDING - v11.MODAL_CONDENSED_CONTENT_PADDING) * 6 + (v11.MODAL_NORMAL_BUTTON_MARGIN - v11.MODAL_CONDENSED_BUTTON_MARGIN) + (v11.NORMAL_ICON_SIZE - v11.CONDENSED_ICON_SIZE)
                });
                return;
            else
                v14:setState({
                    isCondensed = v14.props.screenSize.Y < v16 + v11.MODAL_NORMAL_BUTTON_MARGIN
                });
                return;
            end;
        end;
    end;
    v14.changeContentSize = function(v17) --[[ Line: 113 ]]
        -- upvalues: v14 (copy)
        v14.validateCondensedCondition(v17);
        if v14.state.contentSize ~= v17.AbsoluteSize then
            v14:setState({
                contentSize = v17.AbsoluteSize
            });
        end;
    end;
end;
v13.render = function(v18) --[[ Line: 123 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy), v9 (copy)
    local v19 = v18.props.isVng and "Text.VNGDisclosureTermsURL" or "Text.DisclosureTermsURL";
    return v3.createElement(v9, {
        keys = {
            InsufficientRobuxTitle = {
                key = ("IAPExperience.RobuxUpsell.%s"):format("Title.InsufficientRobux")
            }, 
            AdditionalRobux = {
                key = ("IAPExperience.RobuxUpsell.%s"):format("Text.AdditionalRobux")
            }, 
            WouldYouBuy = {
                key = ("IAPExperience.RobuxUpsell.%s"):format("Text.WouldYouBuy")
            }, 
            DisclosurePayment = {
                key = ("IAPExperience.RobuxUpsell.%s"):format("Text.DisclosurePayment")
            }, 
            DisclosureTermsURL = {
                key = ("IAPExperience.RobuxUpsell.%s"):format(v19)
            }, 
            TermsOfUse = {
                key = ("IAPExperience.RobuxUpsell.%s"):format("Text.TermsOfUse")
            }, 
            BuyRobuxButton = {
                key = ("IAPExperience.RobuxUpsell.%s"):format("Action.BuyRobuxAndItem")
            }, 
            ButtonCancel = {
                key = ("IAPExperience.RobuxUpsell.%s"):format("Action.Cancel")
            }, 
            LoadingText = {
                key = ("IAPExperience.RobuxUpsell.%s"):format("Text.Loading")
            }, 
            PurchaseNotAvialableForQuest = {
                key = ("IAPExperience.RobuxUpsell.%s"):format("Text.PurchaseNotAvailableOnHeadSet")
            }
        }, 
        render = function(v20) --[[ Line: 159 ]] --[[ Name: render ]]
            -- upvalues: v18 (copy)
            return v18:renderAlert(v20);
        end
    });
end;
v13.renderAlert = function(v21, v22) --[[ Line: 165 ]] --[[ Name: renderAlert ]]
    -- upvalues: l_withStyle_0 (copy), v12 (copy), v3 (copy), l_InteractiveAlert_0 (copy), l_FitFrameVertical_0 (copy), v11 (copy), v10 (copy), l_ButtonType_0 (copy)
    local l_props_0 = v21.props;
    local l_state_0 = v21.state;
    return l_withStyle_0(function(v25) --[[ Line: 169 ]]
        -- upvalues: v12 (ref), l_state_0 (copy), l_props_0 (copy), v22 (copy), v3 (ref), l_InteractiveAlert_0 (ref), l_FitFrameVertical_0 (ref), v11 (ref), v21 (copy), v10 (ref), l_ButtonType_0 (ref)
        local l_Theme_0 = v25.Theme;
        local l_Font_0 = v25.Font;
        local v28 = l_Font_0.BaseSize * l_Font_0.Body.RelativeSize;
        if v12() then
            v28 = l_state_0.isCondensed and v28 * 0.9 or v28;
        end;
        local v29 = l_props_0.itemRobuxCost - l_props_0.balanceAmount;
        local v30 = v22.AdditionalRobux:gsub("{robux}", utf8.char(57346) .. tostring(v29));
        local v31 = Color3.new(math.round(l_Theme_0.TextEmphasis.Color.R * 255), math.round(l_Theme_0.TextEmphasis.Color.G * 255), (math.round(l_Theme_0.TextEmphasis.Color.B * 255)));
        local v32 = string.format("<font color=\"rgb(%s)\">%s%s</font>", tostring(v31), utf8.char(57346), (tostring(l_props_0.robuxPurchaseAmount)));
        local v33 = v22.WouldYouBuy:gsub("{robux}", v32);
        local v34 = string.split(v22.DisclosureTermsURL, "{termsofuse}");
        local l_TermsOfUse_0 = v22.TermsOfUse;
        if l_props_0.termsOfUseActivated then
            l_TermsOfUse_0 = "<u>" .. l_TermsOfUse_0 .. "</u>";
        end;
        return v3.createElement(l_InteractiveAlert_0, {
            screenSize = l_props_0.screenSize, 
            position = l_props_0.position, 
            anchorPoint = l_props_0.anchorPoint, 
            title = v22.InsufficientRobuxTitle, 
            middleContent = function() --[[ Line: 205 ]] --[[ Name: middleContent ]]
                -- upvalues: v3 (ref), l_FitFrameVertical_0 (ref), v12 (ref), l_state_0 (ref), v11 (ref), v21 (ref), v10 (ref), l_props_0 (ref), l_Theme_0 (copy), l_Font_0 (copy), v30 (copy), v33 (copy), v28 (ref), v22 (ref), v34 (copy), l_TermsOfUse_0 (ref)
                return v3.createElement(l_FitFrameVertical_0, {
                    BackgroundTransparency = 1, 
                    width = UDim.new(1, 0), 
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    contentPadding = if v12() then UDim.new(0, l_state_0.isCondensed and v11.MODAL_CONDENSED_CONTENT_PADDING or v11.MODAL_NORMAL_CONTENT_PADDING) else UDim.new(0, v11.MODAL_NORMAL_CONTENT_PADDING), 
                    [v3.Ref] = v21.contentRef, 
                    [v3.Change.AbsoluteSize] = v21.changeContentSize
                }, {
                    ProductDetails = v3.createElement(v10, {
                        layoutOrder = 1, 
                        model = l_props_0.model, 
                        itemIcon = l_props_0.itemIcon, 
                        itemName = l_props_0.itemName, 
                        itemRobuxCost = l_props_0.itemRobuxCost, 
                        itemIconWidth = if v12() then l_state_0.isCondensed and v11.CONDENSED_ICON_SIZE or nil else nil, 
                        itemIconHeight = if v12() then l_state_0.isCondensed and v11.CONDENSED_ICON_SIZE or nil else nil
                    }), 
                    Underline = v3.createElement("Frame", {
                        LayoutOrder = 2, 
                        BorderSizePixel = 0, 
                        BackgroundColor3 = l_Theme_0.Divider.Color, 
                        BackgroundTransparency = l_Theme_0.Divider.Transparency, 
                        Size = UDim2.new(1, 0, 0, 1)
                    }), 
                    AdditionalBuyText = v3.createElement("TextLabel", {
                        LayoutOrder = 3, 
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(0, v21.state.contentSize.X, 0, 0), 
                        RichText = true, 
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        TextWrapped = true, 
                        Font = l_Font_0.Body.Font, 
                        Text = if v21.props.isQuest then v30 else v30 .. " " .. v33, 
                        TextSize = v28, 
                        TextColor3 = l_Theme_0.TextDefault.Color, 
                        TextTransparency = l_Theme_0.TextDefault.Transparency
                    }), 
                    Underline2 = v3.createElement("Frame", {
                        LayoutOrder = 4, 
                        BorderSizePixel = 0, 
                        BackgroundColor3 = l_Theme_0.Divider.Color, 
                        BackgroundTransparency = l_Theme_0.Divider.Transparency, 
                        Size = UDim2.new(1, 0, 0, 1)
                    }), 
                    DisclosureFrame = v3.createElement(l_FitFrameVertical_0, {
                        LayoutOrder = 5, 
                        BackgroundTransparency = 1, 
                        width = UDim.new(1, 0), 
                        FillDirection = Enum.FillDirection.Vertical, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        contentPadding = UDim.new(0, 1)
                    }, {
                        DisclosurePayment = v3.createElement("TextLabel", {
                            LayoutOrder = 1, 
                            BackgroundTransparency = 1, 
                            AutomaticSize = Enum.AutomaticSize.XY, 
                            Font = l_Font_0.Body.Font, 
                            Text = if v21.props.isQuest then v22.PurchaseNotAvailableOnHeadSet else v22.DisclosurePayment, 
                            TextSize = v28, 
                            TextColor3 = l_Theme_0.TextDefault.Color, 
                            TextTransparency = l_Theme_0.TextDefault.Transparency
                        }), 
                        DisclosureTermsFrame = if v21.props.isQuest then nil else v3.createElement(l_FitFrameVertical_0, {
                            LayoutOrder = 2, 
                            BackgroundTransparency = 1, 
                            width = UDim.new(1, 0), 
                            FillDirection = Enum.FillDirection.Horizontal, 
                            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                            VerticalAlignment = Enum.VerticalAlignment.Center, 
                            contentPadding = UDim.new(0, 1)
                        }, {
                            BeforeDisclosureText = v3.createElement("TextLabel", {
                                LayoutOrder = 0, 
                                BackgroundTransparency = 1, 
                                AutomaticSize = Enum.AutomaticSize.XY, 
                                Font = l_Font_0.Body.Font, 
                                Text = v34[1], 
                                TextSize = v28, 
                                TextColor3 = l_Theme_0.TextDefault.Color, 
                                TextTransparency = l_Theme_0.TextDefault.Transparency
                            }), 
                            TermsOfUse = v3.createElement("TextButton", {
                                LayoutOrder = 1, 
                                BackgroundTransparency = 1, 
                                RichText = true, 
                                AutomaticSize = Enum.AutomaticSize.XY, 
                                Font = l_Font_0.Body.Font, 
                                Text = l_TermsOfUse_0, 
                                TextSize = v28, 
                                TextColor3 = l_Theme_0.TextDefault.Color, 
                                TextTransparency = l_Theme_0.TextDefault.Transparency, 
                                Selectable = l_props_0.termsOfUseActivated ~= nil, 
                                [v3.Event.Activated] = l_props_0.termsOfUseActivated
                            }), 
                            AfterDisclosureText = v3.createElement("TextLabel", {
                                LayoutOrder = 2, 
                                BackgroundTransparency = 1, 
                                AutomaticSize = Enum.AutomaticSize.XY, 
                                Font = l_Font_0.Body.Font, 
                                Text = v34[2], 
                                TextSize = v28, 
                                TextColor3 = l_Theme_0.TextDefault.Color, 
                                TextTransparency = l_Theme_0.TextDefault.Transparency
                            })
                        })
                    })
                });
            end, 
            buttonStackInfo = {
                forcedFillDirection = Enum.FillDirection.Vertical, 
                marginBetween = if v12() then l_state_0.isCondensed and v11.MODAL_CONDENSED_BUTTON_MARGIN or v11.MODAL_NORMAL_BUTTON_MARGIN else v11.MODAL_NORMAL_BUTTON_MARGIN, 
                buttons = if v21.props.isQuest then {
                    {
                        props = {
                            isDisabled = l_props_0.isDisabled, 
                            onActivated = l_props_0.cancelPurchaseActivated, 
                            text = v22.ButtonCancel, 
                            inputIcon = l_props_0.cancelControllerIcon
                        }
                    }
                } else {
                    {
                        props = {
                            isDisabled = l_props_0.isDisabled, 
                            onActivated = l_props_0.cancelPurchaseActivated, 
                            text = v22.ButtonCancel, 
                            inputIcon = l_props_0.cancelControllerIcon
                        }
                    }, 
                    {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        props = {
                            isLoading = l_props_0.isLoading, 
                            isDisabled = l_props_0.isDisabled, 
                            isDelayedInput = l_props_0.isDelayedInput, 
                            enableInputDelayed = l_props_0.enableInputDelayed, 
                            delayInputSeconds = l_props_0.inputDelaySec, 
                            onActivated = l_props_0.buyItemActivated, 
                            text = if l_props_0.enableInputDelayed then v22.LoadingText else if l_props_0.robuxCostStr ~= nil then l_props_0.robuxCostStr else v22.BuyRobuxButton, 
                            inputIcon = l_props_0.buyItemControllerIcon
                        }
                    }
                }
            }
        });
    end);
end;
return v13;