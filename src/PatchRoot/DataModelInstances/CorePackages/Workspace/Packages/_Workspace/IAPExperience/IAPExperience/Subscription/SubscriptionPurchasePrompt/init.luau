local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_TextService_0 = game:GetService("TextService");
local v3 = require(l_Parent_1.React);
local v4 = require(l_Parent_1.UIBlox);
local l_PartialPageModal_0 = v4.App.Dialog.Modal.PartialPageModal;
local l_getPartialPageModalMiddleContentWidth_0 = v4.App.Dialog.Modal.getPartialPageModalMiddleContentWidth;
local l_ButtonType_0 = v4.App.Button.Enum.ButtonType;
local l_withStyle_0 = v4.Style.withStyle;
local v9 = require(l_Parent_0.Locale.MultiTextLocalizer);
local v10 = require(l_Parent_0.Subscription.SubscriptionTitle);
local v11 = require(l_Parent_0.Flags.GetFFlagEnableRobloxCreditPurchase);
local v12 = require(l_Parent_0.Flags.getEnableDisableSubPurchase);
local function v19(v13, v14, v15, v16, v17) --[[ Line: 47 ]] --[[ Name: generateFooter ]]
    -- upvalues: l_TextService_0 (copy), v3 (copy)
    if not v13 then
        return nil;
    else
        local v18 = l_TextService_0:GetTextSize(v14, 12, v15.Footer.Font, Vector2.new(v17, 1e999)).Y + 2;
        return v3.createElement("Frame", {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.new(0.5, 0, 0, 16), 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            LayoutOrder = 2, 
            Size = UDim2.new(1, -48, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y
        }, {
            DisclaimerText = v3.createElement("TextLabel", {
                LayoutOrder = 1, 
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 0, v18), 
                Font = v15.Footer.Font, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextWrapped = true, 
                Text = v14, 
                TextSize = 12, 
                TextColor3 = v16.TextDefault.Color
            })
        });
    end;
end;
local function v27(v20, v21, v22, v23, v24) --[[ Line: 80 ]] --[[ Name: generatePromptText ]]
    -- upvalues: v3 (copy), l_TextService_0 (copy)
    return v3.createElement("TextLabel", {
        LayoutOrder = 2, 
        BackgroundTransparency = 1, 
        Size = UDim2.new(0, v23, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        TextXAlignment = Enum.TextXAlignment.Left, 
        Font = v21.Body.Font, 
        Text = v20.description, 
        TextSize = 16, 
        TextWrapped = true, 
        TextColor3 = v22.TextDefault.Color, 
        TextTransparency = v22.TextDefault.Transparency, 
        RichText = true, 
        [v3.Change.AbsoluteSize] = function(v25) --[[ Line: 94 ]]
            -- upvalues: l_TextService_0 (ref), v24 (copy)
            local l_Y_0 = l_TextService_0:GetTextSize(v25.Text, v25.TextSize, v25.Font, Vector2.new(v25.AbsoluteSize.X, 1e999)).Y;
            v24(l_Y_0);
        end
    });
end;
local function v31(v28, v29) --[[ Line: 102 ]] --[[ Name: createSubscribeButtonStacks ]]
    -- upvalues: v12 (copy), l_ButtonType_0 (copy), v11 (copy)
    if v12() and v28.disablePurchase then
        return {
            {
                buttonType = l_ButtonType_0.PrimarySystem, 
                props = {
                    onActivated = function() --[[ Line: 108 ]] --[[ Name: onActivated ]]

                    end, 
                    isDisabled = true, 
                    text = v28.disablePurchaseText, 
                    layoutOrder = 0
                }
            }
        };
    elseif not v11() then
        return {
            {
                buttonType = l_ButtonType_0.PrimarySystem, 
                props = {
                    onActivated = v28.purchaseSubscriptionActivated, 
                    text = v29.subscribe, 
                    layoutOrder = 0
                }
            }
        };
    elseif v28.secondaryPaymentMethod == nil or v28.secondaryPaymentMethod == "" then
        return {
            {
                buttonType = l_ButtonType_0.PrimarySystem, 
                props = {
                    onActivated = function() --[[ Line: 135 ]] --[[ Name: onActivated ]]
                        -- upvalues: v28 (copy)
                        v28.purchaseSubscriptionActivated(v28.primaryPaymentMethod);
                    end, 
                    text = v29.subscribe, 
                    layoutOrder = 0
                }
            }
        };
    else
        local v30 = nil;
        if v28.primaryPaymentMethod == "Stripe" then
            v30 = v29.subscribeWithCreditDebitCard;
        elseif v28.primaryPaymentMethod == "CreditBalance" then
            v30 = v29.subscribeWithRobloxCredit;
        end;
        return {
            {
                buttonType = l_ButtonType_0.PrimarySystem, 
                props = {
                    onActivated = function() --[[ Line: 156 ]] --[[ Name: onActivated ]]
                        -- upvalues: v28 (copy)
                        v28.purchaseSubscriptionActivated(v28.primaryPaymentMethod);
                    end, 
                    text = v30, 
                    layoutOrder = 0
                }
            }, 
            {
                buttonType = l_ButtonType_0.Secondary, 
                props = {
                    onActivated = function() --[[ Line: 166 ]] --[[ Name: onActivated ]]
                        -- upvalues: v28 (copy)
                        v28.purchaseSubscriptionActivated(v28.secondaryPaymentMethod);
                    end, 
                    text = v29.payAnotherWay, 
                    layoutOrder = 1
                }
            }
        };
    end;
end;
return function(v32) --[[ Line: 176 ]] --[[ Name: SubscriptionPurchasePrompt ]]
    -- upvalues: v3 (copy), v10 (copy), v9 (copy), v11 (copy), l_withStyle_0 (copy), l_getPartialPageModalMiddleContentWidth_0 (copy), l_PartialPageModal_0 (copy), v31 (copy), v19 (copy), v27 (copy)
    local v33, v34 = v3.useState(0);
    local function v36(v35) --[[ Line: 178 ]] --[[ Name: calculatePromptHeight ]]
        -- upvalues: v34 (copy), v10 (ref), v32 (copy)
        v34(24 + v10:getTitleHeight(v32.screenSize.Y - 240) + 24 + v35);
    end;
    return v3.createElement(v9, {
        keys = {
            titleText = {
                key = "IAPExperience.SubscriptionPurchasePrompt.Label.GetSubscription"
            }, 
            subscribe = if v11() then {
                key = "Feature.Subscription.Action.Subscribe"
            } else {
                key = "IAPExperience.PremiumUpsell.Action.Subscribe"
            }, 
            subscribeWithCreditDebitCard = {
                key = "Feature.Subscription.Action.SubscribeWithCreditDebitCard"
            }, 
            subscribeWithRobloxCredit = {
                key = "Feature.Subscription.Action.SubscribeWithRobloxCredit"
            }, 
            payAnotherWay = {
                key = "Feature.Subscription.Action.SubscribePayAnotherWay"
            }, 
            footerText = {
                key = "IAPExperience.SubscriptionPurchasePrompt.Label.TestFlowDisclaimer"
            }
        }, 
        render = function(v37) --[[ Line: 198 ]] --[[ Name: render ]]
            -- upvalues: l_withStyle_0 (ref), l_getPartialPageModalMiddleContentWidth_0 (ref), v32 (copy), v3 (ref), l_PartialPageModal_0 (ref), v31 (ref), v11 (ref), v19 (ref), v33 (copy), v10 (ref), v27 (ref), v36 (copy)
            return l_withStyle_0(function(v38) --[[ Line: 199 ]]
                -- upvalues: l_getPartialPageModalMiddleContentWidth_0 (ref), v32 (ref), v3 (ref), l_PartialPageModal_0 (ref), v37 (copy), v31 (ref), v11 (ref), v19 (ref), v33 (ref), v10 (ref), v27 (ref), v36 (ref)
                local l_Theme_0 = v38.Theme;
                local l_Font_0 = v38.Font;
                local v41 = l_getPartialPageModalMiddleContentWidth_0(v32.screenSize.X);
                return v3.createElement(l_PartialPageModal_0, {
                    title = v37.titleText, 
                    screenSize = v32.screenSize, 
                    contentPadding = UDim.new(0, 24), 
                    buttonStackProps = {
                        buttons = v31(v32, v37), 
                        buttonHeight = 48, 
                        forcedFillDirection = if v11() then Enum.FillDirection.Vertical else nil
                    }, 
                    onCloseClicked = v32.cancelPurchaseActivated, 
                    footerContent = function() --[[ Line: 216 ]] --[[ Name: footerContent ]]
                        -- upvalues: v19 (ref), v32 (ref), v37 (ref), l_Font_0 (copy), l_Theme_0 (copy), v41 (copy)
                        return v19(v32.isTestingMode, v37.footerText, l_Font_0, l_Theme_0, v41);
                    end
                }, {
                    v3.createElement("Frame", {
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(1, 0, 0, 0), 
                        AutomaticSize = Enum.AutomaticSize.Y
                    }, {
                        PromptScroll = v3.createElement("ScrollingFrame", {
                            BackgroundTransparency = 1, 
                            LayoutOrder = 3, 
                            Size = UDim2.new(1, 0, 0, (math.min(v33, v32.screenSize.Y - 240))), 
                            BorderSizePixel = 0, 
                            ZIndex = 2, 
                            ScrollingEnabled = v33 > v32.screenSize.Y - 240, 
                            ScrollBarThickness = v33 > v32.screenSize.Y - 240 and 5 or nil, 
                            ScrollingDirection = Enum.ScrollingDirection.Y, 
                            Selectable = false, 
                            CanvasSize = UDim2.new(1, 0, 0, v33)
                        }, {
                            Padding = v3.createElement("UIPadding", {
                                PaddingTop = UDim.new(0, 24), 
                                PaddingBottom = UDim.new(0, 24)
                            }), 
                            Layout = v3.createElement("UIListLayout", {
                                SortOrder = Enum.SortOrder.LayoutOrder, 
                                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                                Padding = UDim.new(0, 24)
                            }), 
                            SubscriptionTitleSection = v3.createElement(v10, {
                                subscriptionProviderName = v32.subscriptionProviderName, 
                                name = v32.name, 
                                displayPrice = v32.displayPrice, 
                                period = v32.period, 
                                disclaimerText = v32.disclaimerText, 
                                layoutOrder = 2, 
                                contentHeight = v32.screenSize.Y - 240, 
                                itemIcon = v32.itemIcon
                            }); 
                            v27(v32, l_Font_0, l_Theme_0, v41, v36)
                        })
                    })
                });
            end);
        end
    });
end;