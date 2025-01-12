local l_CorePackages_0 = game:GetService("CorePackages");
local l_TextService_0 = game:GetService("TextService");
local l_GuiService_0 = game:GetService("GuiService");
local l_MarketplaceService_0 = game:GetService("MarketplaceService");
local v4 = require(l_CorePackages_0.Packages.Roact);
local v5 = require(l_CorePackages_0.Packages.RoactRodux);
local l_AppFonts_0 = require(l_CorePackages_0.Workspace.Packages.Style).AppFonts;
local l_Parent_0 = script.Parent.Parent;
local v8 = require(l_Parent_0.Colors);
local v9 = require(l_Parent_0.Thunks.PromptPurchase);
local v10 = require(l_Parent_0.getSelectionImageObjectRounded);
local v11 = require(l_Parent_0.Flags.FFlagEnableFavoriteButtonForUgc);
local v12 = require(l_Parent_0.UtilityFunctions);
local v13 = v4.PureComponent:extend("BuyButton");
v13.init = function(v14) --[[ Line: 24 ]] --[[ Name: init ]]
    -- upvalues: v10 (copy), l_GuiService_0 (copy)
    v14.selectedImage = v10();
    v14.connections = {};
    v14.lastGamepadFocus = nil;
    v14.onPromptPurchaseFinished = function() --[[ Line: 29 ]]
        -- upvalues: v14 (copy), l_GuiService_0 (ref)
        if v14.props.gamepadEnabled and v14.props.visible then
            l_GuiService_0.SelectedCoreObject = v14.lastGamepadFocus;
        end;
    end;
end;
v13.render = function(v15) --[[ Line: 37 ]] --[[ Name: render ]]
    -- upvalues: v12 (copy), v11 (copy), v4 (copy), v8 (copy), l_GuiService_0 (copy), l_AppFonts_0 (copy)
    local l_itemType_0 = v15.props.itemType;
    local l_itemId_0 = v15.props.itemId;
    local l_showRobuxIcon_0 = v15.props.showRobuxIcon;
    local l_forSale_0 = v15.props.forSale;
    local l_promptPurchase_0 = v15.props.promptPurchase;
    local l_buyText_0 = v15.props.buyText;
    local l_buyButtonRef_0 = v15.props.buyButtonRef;
    local l_collectibleItemId_0 = v15.props.collectibleItemId;
    local l_collectibleLowestAvailableResaleProductId_0 = v15.props.collectibleLowestAvailableResaleProductId;
    local l_collectibleLowestAvailableResaleItemInstanceId_0 = v15.props.collectibleLowestAvailableResaleItemInstanceId;
    local l_collectibleLowestResalePrice_0 = v15.props.collectibleLowestResalePrice;
    local v27 = v12.isLimited2Point0_Or_LimitedCollectible(v15.props.assetInfo);
    local v28 = UDim2.new(0, v15:getBuyButtonTextSize(l_buyText_0), 1, 0);
    local l_assetInfo_0 = v15.props.assetInfo;
    local v30 = l_assetInfo_0 and l_assetInfo_0.creatorId or 0;
    local v31 = v11 and -32 or v30 == "1" and -32 or -5;
    local v32 = 0;
    if not l_forSale_0 then
        v32 = 0.5;
    end;
    return v4.createElement("ImageButton", {
        AnchorPoint = Vector2.new(0.5, 0), 
        BackgroundTransparency = 1, 
        Size = UDim2.new(0.5, v31, 0, 44), 
        Image = "rbxasset://textures/ui/InspectMenu/Button_white.png", 
        ImageColor3 = v8.Green, 
        SelectionImageObject = v15.selectedImage, 
        LayoutOrder = 3, 
        ImageTransparency = v32, 
        [v4.Ref] = l_buyButtonRef_0, 
        [v4.Event.Activated] = function() --[[ Line: 73 ]]
            -- upvalues: l_forSale_0 (copy), v15 (copy), l_GuiService_0 (ref), l_promptPurchase_0 (copy), l_itemId_0 (copy), l_itemType_0 (copy), l_collectibleItemId_0 (copy), l_collectibleLowestAvailableResaleProductId_0 (copy), l_collectibleLowestAvailableResaleItemInstanceId_0 (copy), l_collectibleLowestResalePrice_0 (copy), v27 (copy)
            if l_forSale_0 then
                if v15.props.gamepadEnabled and v15.props.visible then
                    v15.lastGamepadFocus = l_GuiService_0.SelectedCoreObject;
                    l_GuiService_0.SelectedCoreObject = nil;
                end;
                l_promptPurchase_0(l_itemId_0, l_itemType_0, l_collectibleItemId_0, l_collectibleLowestAvailableResaleProductId_0, l_collectibleLowestAvailableResaleItemInstanceId_0, l_collectibleLowestResalePrice_0, v27);
            end;
        end
    }, {
        UIListLayout = v4.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center
        }), 
        RobuxIcon = v4.createElement("ImageLabel", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, 16, 0, 16), 
            Image = "rbxasset://textures/ui/common/robux_small.png", 
            ImageTransparency = v32, 
            ImageColor3 = v8.White, 
            LayoutOrder = 1, 
            Visible = l_showRobuxIcon_0
        }), 
        BuyText = v4.createElement("TextLabel", {
            BackgroundTransparency = 1, 
            Size = v28, 
            Text = tostring(l_buyText_0), 
            Font = l_AppFonts_0.default:getDefault(), 
            TextSize = 16, 
            TextColor3 = v8.White, 
            TextTransparency = v32, 
            LayoutOrder = 2, 
            TextXAlignment = Enum.TextXAlignment.Center
        })
    });
end;
v13.didMount = function(v33) --[[ Line: 121 ]] --[[ Name: didMount ]]
    -- upvalues: l_MarketplaceService_0 (copy)
    local v34 = l_MarketplaceService_0.PromptPurchaseFinished:Connect(v33.onPromptPurchaseFinished);
    local v35 = l_MarketplaceService_0.PromptBundlePurchaseFinished:Connect(v33.onPromptPurchaseFinished);
    table.insert(v33.connections, v34);
    table.insert(v33.connections, v35);
end;
v13.willUnmount = function(v36) --[[ Line: 129 ]] --[[ Name: willUnmount ]]
    for _, v38 in pairs(v36.connections) do
        v38:Disconnect();
    end;
end;
v13.getBuyButtonTextSize = function(v39, v40) --[[ Line: 135 ]] --[[ Name: getBuyButtonTextSize ]]
    -- upvalues: l_TextService_0 (copy), l_AppFonts_0 (copy)
    if v39.props.buyButtonRef.current then
        local l_l_TextService_0_TextSize_0 = l_TextService_0:GetTextSize(tostring(v40), 16, l_AppFonts_0.default:getDefault(), Vector2.new(v39.props.buyButtonRef.current.AbsoluteSize.X, 5000));
        v39.props.buyButtonRef.Size = UDim2.new(0, 1, 0, l_l_TextService_0_TextSize_0.Y);
        return l_l_TextService_0_TextSize_0.X > 32 and l_l_TextService_0_TextSize_0.X or 32;
    else
        return 0;
    end;
end;
return v5.UNSTABLE_connect2(function(v42, _) --[[ Line: 150 ]]
    local l_assetId_0 = v42.detailsInformation.assetId;
    return {
        locale = v42.locale, 
        view = v42.view, 
        assetInfo = v42.assets[l_assetId_0], 
        gamepadEnabled = v42.gamepadEnabled, 
        visible = v42.visible
    };
end, function(v45) --[[ Line: 160 ]]
    -- upvalues: v9 (copy)
    return {
        promptPurchase = function(v46, v47, v48, v49, v50, v51, v52) --[[ Line: 162 ]] --[[ Name: promptPurchase ]]
            -- upvalues: v45 (copy), v9 (ref)
            v45(v9(v46, v47, v48, v49, v50, v51, v52));
        end
    };
end)(v13);