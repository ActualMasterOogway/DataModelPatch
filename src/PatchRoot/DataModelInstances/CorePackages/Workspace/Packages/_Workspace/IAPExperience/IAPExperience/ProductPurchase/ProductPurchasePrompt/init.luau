local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Roact);
local v3 = require(l_Parent_1.t);
local v4 = require(l_Parent_1.RoactFitComponents);
local l_FitFrameVertical_0 = v4.FitFrameVertical;
local l_FitTextLabel_0 = v4.FitTextLabel;
local v7 = require(l_Parent_1.UIBlox);
local l_InteractiveAlert_0 = v7.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v7.App.Button.Enum.ButtonType;
local l_Images_0 = v7.App.ImageSet.Images;
local l_ImageSetLabel_0 = v7.Core.ImageSet.ImageSetLabel;
local l_withStyle_0 = v7.Core.Style.withStyle;
local v13 = require(script.Parent.Parent.Generic.HumanoidViewport);
local v14 = require(l_Parent_0.Locale.MultiTextLocalizer);
local v15 = require(l_Parent_0.Flags.getEnableHumanoidViewportItemIcon);
local v16 = l_Images_0["icons/common/robux"];
local v17 = utf8.char(57346);
local v18 = v2.Component:extend(script.Name);
v18.validateProps = v3.strictInterface({
    anchorPoint = v3.optional(v3.Vector2), 
    position = v3.optional(v3.UDim2), 
    screenSize = v3.Vector2, 
    isLoading = v3.optional(v3.boolean), 
    isDisabled = v3.optional(v3.boolean), 
    isDelayedInput = v3.optional(v3.boolean), 
    enableInputDelayed = v3.optional(v3.boolean), 
    itemIcon = v3.table, 
    model = v3.optional(v3.table), 
    itemName = v3.string, 
    itemRobuxCost = v3.number, 
    currentBalance = v3.number, 
    isGamePass = v3.optional(v3.boolean), 
    testPurchase = v3.optional(v3.boolean), 
    buyItemControllerIcon = v3.optional(v3.table), 
    cancelControllerIcon = v3.optional(v3.table), 
    buyItemActivated = v3.callback, 
    cancelPurchaseActivated = v3.callback, 
    isLuobu = v3.optional(v3.boolean)
});
v18.defaultProps = {
    anchorPoint = Vector2.new(0.5, 0.5), 
    position = UDim2.new(0.5, 0, 0.5, 0), 
    isLoading = false, 
    isDisabled = false, 
    testPurchase = false, 
    isDelayedInput = false, 
    enableInputDelayed = false, 
    isLuobu = false, 
    isGamePass = false
};
v18.init = function(v19) --[[ Line: 75 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy)
    v19.contentRef = v2.createRef();
    v19.footerRef = v2.createRef();
    v19.state = {
        contentSize = Vector2.new(0, 0), 
        footerSize = Vector2.new(0, 0)
    };
    v19.changeContentSize = function(v20) --[[ Line: 83 ]]
        -- upvalues: v19 (copy)
        if v19.state.contentSize ~= v20.AbsoluteSize then
            v19:setState({
                contentSize = v20.AbsoluteSize
            });
        end;
    end;
    v19.changeFooterSize = function(v21) --[[ Line: 91 ]]
        -- upvalues: v19 (copy)
        if v19.state.footerSize ~= v21.AbsoluteSize then
            v19:setState({
                footerSize = v21.AbsoluteSize
            });
        end;
    end;
end;
v18.render = function(v22) --[[ Line: 100 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v14 (copy)
    local v23 = v22.props.isLuobu and "Text.BuyItemQuestionWithWarning" or "Text.BuyItemQuestion";
    local l_isGamePass_0 = v22.props.isGamePass;
    return v2.createElement(v14, {
        keys = {
            BuyItemTitle = {
                key = l_isGamePass_0 and ("IAPExperience.PurchasePrompt.%s"):format("Title.BuyGamepass") or ("IAPExperience.PurchasePrompt.%s"):format("Title.BuyItem")
            }, 
            BuyItemQuestion = {
                key = ("IAPExperience.PurchasePrompt.%s"):format(v23), 
                params = {
                    name = v22.props.itemName
                }
            }, 
            RemainingBalance = {
                key = ("IAPExperience.PurchasePrompt.%s"):format("Text.RemainingBalance")
            }, 
            TestPurchaseText = {
                key = ("IAPExperience.PurchasePrompt.%s"):format("Text.TestPurchase")
            }, 
            ButtonCancel = {
                key = ("IAPExperience.PurchasePrompt.%s"):format("Action.Cancel")
            }, 
            LoadingText = {
                key = ("IAPExperience.PurchasePrompt.%s"):format("Text.Loading")
            }
        }, 
        render = function(v25) --[[ Line: 128 ]] --[[ Name: render ]]
            -- upvalues: v22 (copy)
            return v22:renderAlert(v25);
        end
    });
end;
v18.renderAlert = function(v26, v27) --[[ Line: 134 ]] --[[ Name: renderAlert ]]
    -- upvalues: l_withStyle_0 (copy), v17 (copy), v15 (copy), v2 (copy), v13 (copy), l_ImageSetLabel_0 (copy), l_InteractiveAlert_0 (copy), l_FitFrameVertical_0 (copy), l_FitTextLabel_0 (copy), l_ButtonType_0 (copy), v16 (copy)
    return l_withStyle_0(function(v28) --[[ Line: 135 ]]
        -- upvalues: v26 (copy), v27 (copy), v17 (ref), v15 (ref), v2 (ref), v13 (ref), l_ImageSetLabel_0 (ref), l_InteractiveAlert_0 (ref), l_FitFrameVertical_0 (ref), l_FitTextLabel_0 (ref), l_ButtonType_0 (ref), v16 (ref)
        local l_Theme_0 = v28.Theme;
        local l_Font_0 = v28.Font;
        local l_Color_0 = l_Theme_0.IconEmphasis.Color;
        local v32 = math.round(l_Color_0.R * 255);
        local v33 = math.round(l_Color_0.G * 255);
        local v34 = math.round(l_Color_0.B * 255);
        local v35 = string.format("rgb(%d,%d,%d)", v32, v33, v34);
        local v36 = v26.state.contentSize.X * 0.85;
        local v37 = string.format("%s <font color=\"%s\">%s</font>%d", v27.RemainingBalance, v35, v17, v26.props.currentBalance - v26.props.itemRobuxCost);
        local v38 = if v15() and v26.props.model then v2.createElement(v13, {
            model = v26.props.model, 
            LayoutOrder = 1, 
            Size = UDim2.fromOffset(85, 85), 
            Position = UDim2.fromOffset(5, 5)
        }) else v2.createElement(l_ImageSetLabel_0, {
            LayoutOrder = 1, 
            BackgroundTransparency = 1, 
            Position = UDim2.new(0, 5, 0, 5), 
            Size = UDim2.new(0, 85, 0, 85), 
            ScaleType = Enum.ScaleType.Stretch, 
            Image = v26.props.itemIcon, 
            ImageTransparency = 0
        });
        return v2.createElement(l_InteractiveAlert_0, {
            screenSize = v26.props.screenSize, 
            position = v26.props.position, 
            anchorPoint = v26.props.anchorPoint, 
            title = v27.BuyItemTitle, 
            middleContent = function() --[[ Line: 177 ]] --[[ Name: middleContent ]]
                -- upvalues: v2 (ref), l_FitFrameVertical_0 (ref), v26 (ref), v38 (copy), l_FitTextLabel_0 (ref), l_Font_0 (copy), v27 (ref), l_Theme_0 (copy)
                return v2.createElement(l_FitFrameVertical_0, {
                    BackgroundTransparency = 1, 
                    width = UDim.new(1, 0), 
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    contentPadding = UDim.new(0, 24), 
                    [v2.Ref] = v26.contentRef, 
                    [v2.Change.AbsoluteSize] = v26.changeContentSize
                }, {
                    ItemIcon = v38, 
                    ItemName = v2.createElement(l_FitTextLabel_0, {
                        LayoutOrder = 2, 
                        BackgroundTransparency = 1, 
                        TextWrapped = true, 
                        width = l_FitTextLabel_0.Width.FitToText, 
                        maximumWidth = v26.state.contentSize.X, 
                        Font = l_Font_0.Footer.Font, 
                        Text = v27.BuyItemQuestion, 
                        TextSize = l_Font_0.BaseSize * l_Font_0.Body.RelativeSize, 
                        TextColor3 = l_Theme_0.TextDefault.Color
                    })
                });
            end, 
            buttonStackInfo = {
                buttons = {
                    {
                        props = {
                            isDisabled = v26.props.isDisabled or v26.props.isLoading, 
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
                            icon = v16, 
                            text = tostring(v26.props.itemRobuxCost), 
                            inputIcon = v26.props.buyItemControllerIcon
                        }
                    }
                }
            }, 
            footerContent = function() --[[ Line: 231 ]] --[[ Name: footerContent ]]
                -- upvalues: v26 (ref), v2 (ref), l_FitFrameVertical_0 (ref), v36 (copy), l_Font_0 (copy), v37 (copy), l_Theme_0 (copy), l_FitTextLabel_0 (ref), v27 (ref)
                if not v26.props.testPurchase then
                    return v2.createElement(l_FitFrameVertical_0, {
                        BackgroundTransparency = 1, 
                        width = UDim.new(1, 0), 
                        FillDirection = Enum.FillDirection.Horizontal, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        contentPadding = UDim.new(0, 2), 
                        [v2.Ref] = v26.footerRef, 
                        [v2.Change.AbsoluteSize] = v26.changeFooterSize
                    }, {
                        RemainingBalanceText = v2.createElement("TextLabel", {
                            LayoutOrder = 1, 
                            BackgroundTransparency = 1, 
                            RichText = true, 
                            Position = UDim2.fromScale(0, 0.5), 
                            Size = UDim2.fromOffset(v36, 0), 
                            AutomaticSize = Enum.AutomaticSize.Y, 
                            TextWrapped = true, 
                            Font = l_Font_0.Footer.Font, 
                            Text = v37, 
                            TextSize = l_Font_0.BaseSize * l_Font_0.Footer.RelativeSize, 
                            TextColor3 = l_Theme_0.TextDefault.Color
                        })
                    });
                else
                    return v2.createElement(l_FitFrameVertical_0, {
                        BackgroundTransparency = 1, 
                        width = UDim.new(1, 0), 
                        FillDirection = Enum.FillDirection.Horizontal, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        contentPadding = UDim.new(0, 2), 
                        [v2.Ref] = v26.footerRef, 
                        [v2.Change.AbsoluteSize] = v26.changeFooterSize
                    }, {
                        TestPurchaseTest = v2.createElement(l_FitTextLabel_0, {
                            LayoutOrder = 1, 
                            BackgroundTransparency = 1, 
                            width = l_FitTextLabel_0.Width.FitToText, 
                            Font = l_Font_0.Footer.Font, 
                            Text = v27.TestPurchaseText, 
                            TextSize = l_Font_0.BaseSize * l_Font_0.Footer.RelativeSize, 
                            TextColor3 = l_Theme_0.TextDefault.Color
                        })
                    });
                end;
            end
        });
    end);
end;
return v18;