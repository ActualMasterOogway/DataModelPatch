local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v3 = require(l_Parent_2.Roact);
local v4 = require(l_Parent_2.t);
local v5 = require(l_Parent_2.RoactFitComponents);
local l_FitFrameVertical_0 = v5.FitFrameVertical;
local l_FitTextLabel_0 = v5.FitTextLabel;
local v8 = require(l_Parent_2.UIBlox);
local l_InteractiveAlert_0 = v8.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v8.App.Button.Enum.ButtonType;
local l_Images_0 = v8.App.ImageSet.Images;
local l_ImageSetLabel_0 = v8.Core.ImageSet.ImageSetLabel;
local l_IconSize_0 = v8.App.Constant.IconSize;
local l_withStyle_0 = v8.Core.Style.withStyle;
local v15 = require(l_Parent_1.Locale.MultiTextLocalizer);
local v16 = require(l_Parent_0.ProductDetails);
local v17 = l_Images_0["icons/common/robux"];
local v18 = v3.Component:extend(script.Name);
v18.validateProps = v4.strictInterface({
    anchorPoint = v4.optional(v4.Vector2), 
    position = v4.optional(v4.UDim2), 
    screenSize = v4.Vector2, 
    isLoading = v4.optional(v4.boolean), 
    isDisabled = v4.optional(v4.boolean), 
    isDelayedInput = v4.optional(v4.boolean), 
    enableInputDelayed = v4.optional(v4.boolean), 
    model = v4.optional(v4.table), 
    itemIcon = v4.table, 
    itemName = v4.string, 
    itemRobuxCost = v4.number, 
    robuxPurchaseAmount = v4.number, 
    balanceAmount = v4.number, 
    buyItemControllerIcon = v4.optional(v4.table), 
    cancelControllerIcon = v4.optional(v4.table), 
    buyItemActivated = v4.callback, 
    cancelPurchaseActivated = v4.callback, 
    isLuobu = v4.optional(v4.boolean), 
    isVng = v4.optional(v4.boolean)
});
v18.defaultProps = {
    anchorPoint = Vector2.new(0.5, 0.5), 
    position = UDim2.new(0.5, 0, 0.5, 0), 
    isLoading = false, 
    isDisabled = false, 
    isDelayedInput = false, 
    enableInputDelayed = false, 
    isLuobu = false
};
v18.init = function(v19) --[[ Line: 69 ]] --[[ Name: init ]]
    -- upvalues: v3 (copy)
    v19.contentRef = v3.createRef();
    v19.footerRef = v3.createRef();
    v19.state = {
        contentSize = Vector2.new(0, 0), 
        footerSize = Vector2.new(0, 0)
    };
    v19.changeContentSize = function(v20) --[[ Line: 77 ]]
        -- upvalues: v19 (copy)
        if v19.state.contentSize ~= v20.AbsoluteSize then
            v19:setState({
                contentSize = v20.AbsoluteSize
            });
        end;
    end;
    v19.changeFooterSize = function(v21) --[[ Line: 85 ]]
        -- upvalues: v19 (copy)
        if v19.state.footerSize ~= v21.AbsoluteSize then
            v19:setState({
                footerSize = v21.AbsoluteSize
            });
        end;
    end;
end;
v18.render = function(v22) --[[ Line: 94 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy), v15 (copy)
    local v23 = v22.props.isLuobu and "Text.BuyRobuxQuestionWithWarning" or "Text.BuyRobuxQuestion";
    local v24 = v22.props.isVng and "Text.VNGDisclosureTerms" or "Text.DisclosureTerms";
    return v3.createElement(v15, {
        keys = {
            InsufficientFundsTitle = {
                key = ("IAPExperience.RobuxUpsell.%s"):format("Title.InsufficientFunds")
            }, 
            BuyRobuxQuestion = {
                key = ("IAPExperience.RobuxUpsell.%s"):format(v23)
            }, 
            DisclosurePayment = {
                key = ("IAPExperience.RobuxUpsell.%s"):format("Text.DisclosurePayment")
            }, 
            DisclosureTerms = {
                key = ("IAPExperience.RobuxUpsell.%s"):format(v24)
            }, 
            RemainingBalance = {
                key = ("IAPExperience.RobuxUpsell.%s"):format("Text.RemainingBalance")
            }, 
            BuyRobuxButton = {
                key = ("IAPExperience.RobuxUpsell.%s"):format("Action.BuyRobux")
            }, 
            ButtonCancel = {
                key = ("IAPExperience.RobuxUpsell.%s"):format("Action.Cancel")
            }, 
            LoadingText = {
                key = ("IAPExperience.RobuxUpsell.%s"):format("Text.Loading")
            }
        }, 
        render = function(v25) --[[ Line: 125 ]] --[[ Name: render ]]
            -- upvalues: v22 (copy)
            return v22:renderAlert(v25);
        end
    });
end;
v18.renderAlert = function(v26, v27) --[[ Line: 131 ]] --[[ Name: renderAlert ]]
    -- upvalues: l_withStyle_0 (copy), v3 (copy), l_InteractiveAlert_0 (copy), l_FitFrameVertical_0 (copy), v16 (copy), l_FitTextLabel_0 (copy), l_ImageSetLabel_0 (copy), v17 (copy), l_ButtonType_0 (copy), l_IconSize_0 (copy)
    return l_withStyle_0(function(v28) --[[ Line: 132 ]]
        -- upvalues: v26 (copy), v3 (ref), l_InteractiveAlert_0 (ref), v27 (copy), l_FitFrameVertical_0 (ref), v16 (ref), l_FitTextLabel_0 (ref), l_ImageSetLabel_0 (ref), v17 (ref), l_ButtonType_0 (ref), l_IconSize_0 (ref)
        local l_Theme_0 = v28.Theme;
        local l_Font_0 = v28.Font;
        local v31 = v26.props.balanceAmount + v26.props.robuxPurchaseAmount - v26.props.itemRobuxCost;
        return v3.createElement(l_InteractiveAlert_0, {
            screenSize = v26.props.screenSize, 
            position = v26.props.position, 
            anchorPoint = v26.props.anchorPoint, 
            title = v27.InsufficientFundsTitle, 
            middleContent = function() --[[ Line: 143 ]] --[[ Name: middleContent ]]
                -- upvalues: v3 (ref), l_FitFrameVertical_0 (ref), v26 (ref), v16 (ref), l_Theme_0 (copy), l_FitTextLabel_0 (ref), l_Font_0 (copy), v27 (ref), l_ImageSetLabel_0 (ref), v17 (ref)
                return v3.createElement(l_FitFrameVertical_0, {
                    BackgroundTransparency = 1, 
                    width = UDim.new(1, 0), 
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    contentPadding = UDim.new(0, 15), 
                    [v3.Ref] = v26.contentRef, 
                    [v3.Change.AbsoluteSize] = v26.changeContentSize
                }, {
                    ItemDetails = v3.createElement(v16, {
                        layoutOrder = 1, 
                        model = v26.props.model, 
                        itemIcon = v26.props.itemIcon, 
                        itemName = v26.props.itemName, 
                        itemRobuxCost = v26.props.itemRobuxCost
                    }), 
                    Underline = v3.createElement("Frame", {
                        LayoutOrder = 2, 
                        BorderSizePixel = 0, 
                        BackgroundColor3 = l_Theme_0.Divider.Color, 
                        BackgroundTransparency = l_Theme_0.Divider.Transparency, 
                        Size = UDim2.new(1, 0, 0, 1)
                    }), 
                    ConfirmationFrame = v3.createElement(l_FitFrameVertical_0, {
                        LayoutOrder = 3, 
                        BackgroundTransparency = 1, 
                        width = UDim.new(1, 0), 
                        FillDirection = Enum.FillDirection.Horizontal, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        contentPadding = UDim.new(0, 1)
                    }, {
                        WouldYouLikeText = v3.createElement(l_FitTextLabel_0, {
                            LayoutOrder = 1, 
                            BackgroundTransparency = 1, 
                            width = l_FitTextLabel_0.Width.FitToText, 
                            TextWrapped = true, 
                            maximumWidth = v26.state.contentSize.X * 0.8, 
                            Font = l_Font_0.Body.Font, 
                            Text = v27.BuyRobuxQuestion, 
                            TextSize = l_Font_0.BaseSize * l_Font_0.Body.RelativeSize, 
                            TextColor3 = l_Theme_0.TextDefault.Color
                        }), 
                        RobuxIcon = v3.createElement(l_ImageSetLabel_0, {
                            LayoutOrder = 2, 
                            BackgroundTransparency = 1, 
                            Position = UDim2.new(0, 5, 0, 5), 
                            Size = UDim2.new(0, 24, 0, 24), 
                            ScaleType = Enum.ScaleType.Stretch, 
                            Image = v17, 
                            ImageColor3 = l_Theme_0.IconEmphasis.Color, 
                            ImageTransparency = l_Theme_0.IconEmphasis.Transparency
                        }), 
                        RemainingRobux = v3.createElement(l_FitTextLabel_0, {
                            LayoutOrder = 3, 
                            BackgroundTransparency = 1, 
                            width = l_FitTextLabel_0.Width.FitToText, 
                            Font = l_Font_0.Body.Font, 
                            Text = tostring(v26.props.robuxPurchaseAmount), 
                            TextSize = l_Font_0.BaseSize * l_Font_0.Body.RelativeSize, 
                            TextColor3 = l_Theme_0.TextEmphasis.Color
                        })
                    }), 
                    DisclosureFrame = v3.createElement(l_FitFrameVertical_0, {
                        LayoutOrder = 4, 
                        BackgroundTransparency = 1, 
                        width = UDim.new(1, 0), 
                        FillDirection = Enum.FillDirection.Vertical, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        contentPadding = UDim.new(0, 1)
                    }, {
                        DisclosurePayment = v3.createElement(l_FitTextLabel_0, {
                            LayoutOrder = 1, 
                            BackgroundTransparency = 1, 
                            width = l_FitTextLabel_0.Width.FitToText, 
                            Font = l_Font_0.Footer.Font, 
                            Text = v27.DisclosurePayment, 
                            TextSize = l_Font_0.BaseSize * l_Font_0.Footer.RelativeSize, 
                            TextColor3 = l_Theme_0.TextDefault.Color
                        }), 
                        DisclosureTerms = v3.createElement(l_FitTextLabel_0, {
                            LayoutOrder = 2, 
                            BackgroundTransparency = 1, 
                            width = l_FitTextLabel_0.Width.FitToText, 
                            Font = l_Font_0.Footer.Font, 
                            Text = v27.DisclosureTerms, 
                            TextSize = l_Font_0.BaseSize * l_Font_0.Footer.RelativeSize, 
                            TextColor3 = l_Theme_0.TextDefault.Color
                        })
                    })
                });
            end, 
            buttonStackInfo = {
                buttons = {
                    {
                        props = {
                            isDisabled = v26.props.isDisabled, 
                            onActivated = v26.props.cancelPurchaseActivated, 
                            text = v27.ButtonCancel, 
                            inputIcon = v26.props.cancelControllerIcon
                        }
                    }, 
                    {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        props = {
                            isLoading = v26.props.isLoading, 
                            isDisabled = v26.props.isDisabled, 
                            isDelayedInput = v26.props.isDelayedInput, 
                            enableInputDelayed = v26.props.enableInputDelayed, 
                            delayInputSeconds = 3, 
                            onActivated = v26.props.buyItemActivated, 
                            text = v27.BuyRobuxButton, 
                            inputIcon = v26.props.buyItemControllerIcon
                        }
                    }
                }
            }, 
            footerContent = function() --[[ Line: 273 ]] --[[ Name: footerContent ]]
                -- upvalues: v27 (ref), v3 (ref), l_FitFrameVertical_0 (ref), v26 (ref), l_FitTextLabel_0 (ref), l_Font_0 (copy), l_Theme_0 (copy), l_ImageSetLabel_0 (ref), l_IconSize_0 (ref), v17 (ref), v31 (copy)
                local v32 = string.split(v27.RemainingBalance, " {robux} ");
                local v33 = v32[1];
                local v34 = v32[2];
                return v3.createElement(l_FitFrameVertical_0, {
                    BackgroundTransparency = 1, 
                    width = UDim.new(1, 0), 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    contentPadding = UDim.new(0, 1), 
                    [v3.Ref] = v26.footerRef, 
                    [v3.Change.AbsoluteSize] = v26.changeFooterSize
                }, {
                    RemainingBalanceBefore = v3.createElement(l_FitTextLabel_0, {
                        LayoutOrder = 1, 
                        BackgroundTransparency = 1, 
                        width = l_FitTextLabel_0.Width.FitToText, 
                        Font = l_Font_0.Footer.Font, 
                        Text = v33, 
                        TextSize = l_Font_0.BaseSize * l_Font_0.Footer.RelativeSize, 
                        TextColor3 = l_Theme_0.TextDefault.Color
                    }), 
                    RobuxIcon = v3.createElement(l_ImageSetLabel_0, {
                        LayoutOrder = 2, 
                        BackgroundTransparency = 1, 
                        Position = UDim2.new(0, 5, 0, 5), 
                        Size = UDim2.new(0, l_IconSize_0.Small, 0, l_IconSize_0.Small), 
                        ScaleType = Enum.ScaleType.Stretch, 
                        Image = v17, 
                        ImageColor3 = l_Theme_0.IconEmphasis.Color, 
                        ImageTransparency = l_Theme_0.IconEmphasis.Transparency
                    }), 
                    RemainingRobux = v3.createElement(l_FitTextLabel_0, {
                        LayoutOrder = 3, 
                        BackgroundTransparency = 1, 
                        width = l_FitTextLabel_0.Width.FitToText, 
                        Font = l_Font_0.Footer.Font, 
                        Text = v31, 
                        TextSize = l_Font_0.BaseSize * l_Font_0.Footer.RelativeSize, 
                        TextColor3 = l_Theme_0.TextDefault.Color
                    }), 
                    RemainingBalanceAfter = v3.createElement(l_FitTextLabel_0, {
                        LayoutOrder = 4, 
                        BackgroundTransparency = 1, 
                        width = l_FitTextLabel_0.Width.FitToText, 
                        Font = l_Font_0.Footer.Font, 
                        Text = v34, 
                        TextSize = l_Font_0.BaseSize * l_Font_0.Footer.RelativeSize, 
                        TextColor3 = l_Theme_0.TextDefault.Color
                    })
                });
            end
        });
    end);
end;
return v18;