local l_script_FirstAncestor_0 = script:FindFirstAncestor("BulkPurchaseApp");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v5 = require(l_Parent_0.UIBlox);
local l_Button_0 = v5.App.Button.Button;
local l_ButtonType_0 = v5.App.Button.Enum.ButtonType;
local v8 = require(script.Parent.Box);
local v9 = require(script.Parent.PriceBoxLine);
local v10 = require(l_script_FirstAncestor_0.Enums.PriceBoxLineVariantEnum);
local v11 = require(l_script_FirstAncestor_0.Flags.FFlagAddTimerToBulkPurchaseBuyButton);
local v12 = require(l_script_FirstAncestor_0.Flags.FIntBulkPurchaseEnabledCountdownMS);
local v13 = {
    heading = "CoreScripts.BulkPurchasePrompt.RequestPrompt.PriceBox.TotalCost", 
    currentBalanceLine = "CoreScripts.BulkPurchasePrompt.RequestPrompt.PriceBox.CurrentBalance", 
    projectedBalanceLine = "CoreScripts.BulkPurchasePrompt.RequestPrompt.PriceBox.NewBalance", 
    missingRobuxLine = "CoreScripts.BulkPurchasePrompt.RequestPrompt.PriceBox.MissingRobux", 
    confirmCTA = "CoreScripts.BulkPurchasePrompt.RequestPrompt.PriceBox.ConfirmCTA", 
    buyRobuxCTA = "CoreScripts.BulkPurchasePrompt.RequestPrompt.PriceBox.BuyRobuxCTA"
};
local function v15(v14) --[[ Line: 25 ]] --[[ Name: mapTokens ]]
    return {
        background = v14.Semantic.Color.Background.Contrast.Color3, 
        padding = v14.Global.Space_300, 
        cornerRadius = v14.Semantic.Radius.Medium, 
        buttonMarginTop = v14.Global.Space_300, 
        headerMarginBottom = v14.Global.Space_200, 
        lineItemSpacing = v14.Global.Space_50, 
        buttonHeight = v14.Global.Size_450
    };
end;
return function(v16) --[[ Line: 46 ]] --[[ Name: PriceBox ]]
    -- upvalues: l_useDesignTokens_0 (copy), v15 (copy), l_useLocalization_0 (copy), v13 (copy), v2 (copy), v8 (copy), v9 (copy), v10 (copy), l_Button_0 (copy), l_ButtonType_0 (copy), v11 (copy), v12 (copy)
    local v17 = l_useDesignTokens_0(v15);
    local v18 = l_useLocalization_0(v13);
    return v2.createElement(v8, {
        padding = v17.padding, 
        cornerRadius = UDim.new(0, v17.cornerRadius), 
        Size = UDim2.fromScale(1, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundColor3 = v17.background, 
        BorderSizePixel = 0
    }, {
        Layout = v2.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            VerticalAlignment = Enum.VerticalAlignment.Bottom, 
            Padding = UDim.new(0, v17.buttonMarginTop)
        }), 
        LineItems = v2.createElement("Frame", {
            BorderSizePixel = 0, 
            Size = UDim2.fromScale(1, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1
        }, {
            Layout = v2.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Bottom, 
                Padding = UDim.new(0, v17.headerMarginBottom)
            }), 
            PriceBoxHeader = v2.createElement(v9, {
                text = v18.heading, 
                amount = v16.totalCost, 
                highlight = true, 
                LayoutOrder = 1
            }), 
            Something = v2.createElement("Frame", {
                BorderSizePixel = 0, 
                Size = UDim2.fromScale(1, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1, 
                LayoutOrder = 2
            }, {
                Layout = v2.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    VerticalAlignment = Enum.VerticalAlignment.Bottom, 
                    Padding = UDim.new(0, v17.lineItemSpacing)
                }), 
                PriceBoxCurrentBalance = v2.createElement(v9, {
                    text = v18.currentBalanceLine, 
                    amount = v16.currentBalance, 
                    LayoutOrder = 1
                }), 
                PriceBoxProjectedBalance = v2.createElement(v9, {
                    text = if v16.missingRobux then v18.missingRobuxLine else v18.projectedBalanceLine, 
                    amount = math.abs(v16.totalCost - v16.currentBalance), 
                    variant = if v16.missingRobux then v10.Danger else nil, 
                    LayoutOrder = 2
                })
            })
        }), 
        PriceBoxConfirmButton = v2.createElement(l_Button_0, {
            text = if v16.missingRobux then v18.buyRobuxCTA else v18.confirmCTA, 
            onActivated = v16.onAccept, 
            buttonType = l_ButtonType_0.PrimarySystem, 
            size = UDim2.new(1, 0, 0, v17.buttonHeight), 
            buttonRef = v16.buttonRef, 
            isDisabled = v16.isDisabled, 
            isDelayedInput = v11 and true or nil, 
            enableInputDelayed = v11 and true or nil, 
            delayInputSeconds = if v11 then math.max(0, v12) / 1000 else nil
        })
    });
end;