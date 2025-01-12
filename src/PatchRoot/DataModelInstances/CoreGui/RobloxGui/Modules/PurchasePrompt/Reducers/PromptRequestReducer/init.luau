local l_Parent_0 = script.Parent.Parent;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_HttpService_0 = game:GetService("HttpService");
local l_Rodux_0 = require(l_CorePackages_0.Workspace.Packages.PurchasePromptDeps).Rodux;
local v4 = require(l_Parent_0.Actions.RequestAssetPurchase);
local v5 = require(l_Parent_0.Actions.RequestBundlePurchase);
local v6 = require(l_Parent_0.Actions.RequestGamepassPurchase);
local v7 = require(l_Parent_0.Actions.RequestProductPurchase);
local v8 = require(l_Parent_0.Actions.RequestPremiumPurchase);
local v9 = require(l_Parent_0.Actions.RequestSubscriptionPurchase);
local v10 = require(l_Parent_0.Actions.RequestAvatarCreationFeePurchase);
local v11 = require(l_Parent_0.Actions.CompleteRequest);
local v12 = require(l_Parent_0.Enums.RequestType);
local v13 = {
    requestType = v12.None
};
return (l_Rodux_0.createReducer(v13, {
    [v4.name] = function(_, v15) --[[ Line: 22 ]]
        -- upvalues: l_HttpService_0 (copy), v12 (copy)
        local l_idempotencyKey_0 = v15.idempotencyKey;
        if l_idempotencyKey_0 == nil or l_idempotencyKey_0 == "" then
            l_idempotencyKey_0 = l_HttpService_0:GenerateGUID(false);
        end;
        return {
            id = v15.id, 
            infoType = Enum.InfoType.Asset, 
            requestType = v12.Asset, 
            equipIfPurchased = v15.equipIfPurchased, 
            isRobloxPurchase = v15.isRobloxPurchase, 
            idempotencyKey = l_idempotencyKey_0, 
            purchaseAuthToken = v15.purchaseAuthToken or "", 
            collectibleItemId = v15.collectibleItemId or "", 
            collectibleItemInstanceId = v15.collectibleItemInstanceId or "", 
            collectibleProductId = v15.collectibleProductId or "", 
            expectedPrice = v15.expectedPrice or 0
        };
    end, 
    [v6.name] = function(_, v18) --[[ Line: 41 ]]
        -- upvalues: v12 (copy)
        return {
            id = v18.id, 
            infoType = Enum.InfoType.GamePass, 
            requestType = v12.GamePass, 
            isRobloxPurchase = false
        };
    end, 
    [v7.name] = function(_, v20) --[[ Line: 49 ]]
        -- upvalues: v12 (copy)
        return {
            id = v20.id, 
            infoType = Enum.InfoType.Product, 
            requestType = v12.Product, 
            isRobloxPurchase = false
        };
    end, 
    [v5.name] = function(_, v22) --[[ Line: 57 ]]
        -- upvalues: l_HttpService_0 (copy), v12 (copy)
        local l_idempotencyKey_1 = v22.idempotencyKey;
        if l_idempotencyKey_1 == nil or l_idempotencyKey_1 == "" then
            l_idempotencyKey_1 = l_HttpService_0:GenerateGUID(false);
        end;
        return {
            id = v22.id, 
            infoType = Enum.InfoType.Bundle, 
            requestType = v12.Bundle, 
            isRobloxPurchase = true, 
            idempotencyKey = l_idempotencyKey_1, 
            purchaseAuthToken = v22.purchaseAuthToken or "", 
            collectibleItemId = v22.collectibleItemId or "", 
            collectibleItemInstanceId = v22.collectibleItemInstanceId or "", 
            collectibleProductId = v22.collectibleProductId or "", 
            expectedPrice = v22.expectedPrice or 0
        };
    end, 
    [v8.name] = function(_, _) --[[ Line: 75 ]]
        -- upvalues: v12 (copy)
        return {
            requestType = v12.Premium
        };
    end, 
    [v9.name] = function(_, v27) --[[ Line: 80 ]]
        -- upvalues: v12 (copy)
        return {
            id = v27.id, 
            requestType = v12.Subscription
        };
    end, 
    [v10.name] = function(_, v29) --[[ Line: 86 ]]
        -- upvalues: v12 (copy)
        return {
            requestType = v12.AvatarCreationFee, 
            humanoidModel = v29.humanoidModel, 
            id = v29.guid
        };
    end, 
    [v11.name] = function(_, _) --[[ Line: 93 ]]
        -- upvalues: v13 (copy)
        return v13;
    end
}));