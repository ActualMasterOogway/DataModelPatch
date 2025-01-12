local l_MarketplaceService_0 = game:GetService("MarketplaceService");
local l_BrowserService_0 = game:GetService("BrowserService");
local l_HttpService_0 = game:GetService("HttpService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("BulkPurchaseApp");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local v7 = require(l_script_FirstAncestor_0.Store.Selectors.selectPurchaseResults);
local v8 = require(l_script_FirstAncestor_0.Store.Selectors.selectOrderRequest);
local v9 = require(l_script_FirstAncestor_0.Store.Selectors.selectItemData);
local v10 = require(l_script_FirstAncestor_0.Store.Actions.BulkPurchaseEnded);
local v11 = require(l_script_FirstAncestor_0.Store.Actions.BulkPurchaseFailed);
local v12 = require(l_script_FirstAncestor_0.Store.Actions.BulkPurchaseSucceeded);
local v13 = require(l_script_FirstAncestor_0.Enums.BulkPurchasePromptStateEnum);
local v14 = require(l_script_FirstAncestor_0.Enums.ErrorCodeEnum);
local v15 = require(l_script_FirstAncestor_0.Enums.PurchasableStateEnum);
local v16 = require(l_script_FirstAncestor_0.Enums.ItemStatusToErrorCodeMap);
local v17 = require(l_script_FirstAncestor_0.Enums.PurchasableStateToItemPurchaseStatusMap);
local v18 = require(l_script_FirstAncestor_0.Utils.getThumbnailUrl);
local _ = require(l_script_FirstAncestor_0.Store.Types);
local v20 = require(l_script_FirstAncestor_0.Enums.PaymentPlatformEnum);
local v21 = require(l_script_FirstAncestor_0.Utils.getPaymentPlatform);
local v22 = require(l_script_FirstAncestor_0.Utils.getRobuxStoreUrl);
local v23 = game:DefineFastFlag("FixBuyRobuxForAndroid", false);
local _ = require(script.Parent.BulkPurchaseRequest);
local v25 = {
    INSUFFICIENT_ROBUX = Enum.MarketplaceItemPurchaseStatus.InsufficientRobux, 
    QUOTA_EXCEEDED = Enum.MarketplaceItemPurchaseStatus.QuotaExceeded, 
    NOT_FOR_SALE = Enum.MarketplaceItemPurchaseStatus.NotForSale, 
    NOT_AVAILABLE_FOR_PURCHASER = Enum.MarketplaceItemPurchaseStatus.NotAvailableForPurchaser, 
    PRICE_MISMATCH = Enum.MarketplaceItemPurchaseStatus.PriceMismatch, 
    SOLD_OUT = Enum.MarketplaceItemPurchaseStatus.SoldOut, 
    PURCHASER_IS_SELLER = Enum.MarketplaceItemPurchaseStatus.PurchaserIsSeller, 
    QUANTITY_LIMIT_EXCEEDED = Enum.MarketplaceItemPurchaseStatus.QuantityLimitExceeded, 
    ALREADY_OWNED = Enum.MarketplaceItemPurchaseStatus.AlreadyOwned, 
    INSUFFICIENT_MEMBERSHIP = Enum.MarketplaceItemPurchaseStatus.InsufficientMembership, 
    PURCHASE_PLACE_INVALID = Enum.MarketplaceItemPurchaseStatus.PlaceInvalid
};
local function _(v26) --[[ Line: 66 ]] --[[ Name: lineItemToStatus ]]
    -- upvalues: v25 (copy)
    local v27 = v25[v26.errorReason];
    if v26.status == "SUCCEEDED" then
        return Enum.MarketplaceItemPurchaseStatus.Success;
    elseif v27 then
        return v27;
    else
        return Enum.MarketplaceItemPurchaseStatus.SystemError;
    end;
end;
local function _(v29) --[[ Line: 77 ]] --[[ Name: getLineItemsFromPurchaseResponse ]]
    if v29.fulfillmentGroups[1] then
        return v29.fulfillmentGroups[1].lineItems;
    else
        return {};
    end;
end;
local function v35(v31) --[[ Line: 81 ]] --[[ Name: filterPurchasableItems ]]
    -- upvalues: v15 (copy)
    local v32 = {};
    for _, v34 in v31 do
        if v34.purchasableState == v15.Purchasable then
            table.insert(v32, v34);
        end;
    end;
    return v32;
end;
local function v46(v36, v37) --[[ Line: 98 ]] --[[ Name: getItemResultsFromResponse ]]
    -- upvalues: v35 (copy), v25 (copy)
    local v38 = v35(v37);
    local v39 = if v36.fulfillmentGroups[1] then v36.fulfillmentGroups[1].lineItems else {};
    local v40 = {};
    for v41, v42 in v38 do
        local v43 = v39[v41];
        if v43 then
            local l_id_0 = v42.id;
            local v45 = v25[v43.errorReason];
            v40[l_id_0] = if v43.status == "SUCCEEDED" then Enum.MarketplaceItemPurchaseStatus.Success else v45 or Enum.MarketplaceItemPurchaseStatus.SystemError;
        end;
    end;
    return v40;
end;
local _ = function(v47) --[[ Line: 115 ]] --[[ Name: getCommonItemStatus ]]
    local v48 = nil;
    for _, v50 in v47 do
        if v48 ~= nil and v50 ~= v48 then
            return nil;
        elseif v48 == nil then
            v48 = v50;
        end;
    end;
    return v48;
end;
local function _(v52) --[[ Line: 128 ]] --[[ Name: createOwnedItem ]]
    -- upvalues: v18 (copy)
    return {
        id = v52.id, 
        name = v52.name, 
        image = v18(v52.id, v52.type), 
        ownedCount = v52.ownedCount
    };
end;
local function _(v54) --[[ Line: 137 ]] --[[ Name: createPurchasableItem ]]
    -- upvalues: v18 (copy)
    return {
        id = v54.id, 
        cost = v54.priceRobux, 
        name = v54.name, 
        image = v18(v54.id, v54.type)
    };
end;
local function _(v56) --[[ Line: 146 ]] --[[ Name: createUnpurchasableItem ]]
    -- upvalues: v18 (copy), v17 (copy)
    return {
        id = v56.id, 
        name = v56.name, 
        image = v18(v56.id, v56.type), 
        status = v17[v56.purchasableState] or Enum.MarketplaceItemPurchaseStatus.SystemError
    };
end;
local function v64(v58) --[[ Line: 156 ]] --[[ Name: selectBulkPurchaseRequestState ]]
    -- upvalues: v15 (copy), v18 (copy), v17 (copy)
    local v59 = {};
    local v60 = {};
    local v61 = {};
    if v58.itemData then
        for _, v63 in v58.itemData do
            if v63.purchasableState == v15.Purchasable then
                table.insert(v59, {
                    id = v63.id, 
                    cost = v63.priceRobux, 
                    name = v63.name, 
                    image = v18(v63.id, v63.type)
                });
                if v63.ownedCount and v63.ownedCount > 0 then
                    table.insert(v60, {
                        id = v63.id, 
                        name = v63.name, 
                        image = v18(v63.id, v63.type), 
                        ownedCount = v63.ownedCount
                    });
                end;
            else
                table.insert(v61, {
                    id = v63.id, 
                    name = v63.name, 
                    image = v18(v63.id, v63.type), 
                    status = v17[v63.purchasableState] or Enum.MarketplaceItemPurchaseStatus.SystemError
                });
            end;
        end;
    end;
    return {
        totalCost = v58.totalCost or 0, 
        items = v59, 
        ownedItems = v60, 
        unpurchasableItems = v61, 
        balance = v58.balance or 0
    };
end;
local function v66(v65) --[[ Line: 182 ]] --[[ Name: selectOptions ]]
    return v65.options;
end;
return function() --[[ Line: 186 ]] --[[ Name: useBulkPurchaseRequestProps ]]
    -- upvalues: l_useDispatch_0 (copy), l_useSelector_0 (copy), v64 (copy), v7 (copy), v8 (copy), v66 (copy), v9 (copy), l_MarketplaceService_0 (copy), v10 (copy), v46 (copy), v12 (copy), v13 (copy), v11 (copy), v16 (copy), v14 (copy), v21 (copy), v20 (copy), v23 (copy), l_HttpService_0 (copy), v22 (copy), l_BrowserService_0 (copy)
    local v67 = l_useDispatch_0();
    local v68 = l_useSelector_0(v64);
    local v69 = l_useSelector_0(v7);
    local v70 = l_useSelector_0(v8);
    local v71 = l_useSelector_0(v66);
    local v72 = l_useSelector_0(v9);
    local l_totalCost_0 = v68.totalCost;
    local l_balance_0 = v68.balance;
    local function v75() --[[ Line: 196 ]]
        -- upvalues: l_MarketplaceService_0 (ref), v69 (copy), v67 (copy), v10 (ref)
        l_MarketplaceService_0:signalPromptBulkPurchaseFinished(2, v69);
        v67(v10());
    end;
    local function v84() --[[ Line: 203 ]]
        -- upvalues: l_MarketplaceService_0 (ref), v70 (copy), v71 (copy), v46 (ref), v72 (copy), v67 (copy), v12 (ref), v13 (ref), v11 (ref), v16 (ref), v14 (ref)
        local v76 = false;
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 204 ]]
            -- upvalues: l_MarketplaceService_0 (ref), v70 (ref), v71 (ref)
            return l_MarketplaceService_0:PerformBulkPurchase(v70, v71);
        end);
        if l_status_0 and l_result_0 then
            local v79 = v46(l_result_0, v72);
            local v80 = nil;
            local v81;
            for _, v83 in v79 do
                if v80 ~= nil and v83 ~= v80 then
                    v81 = nil;
                    v76 = true;
                elseif v80 == nil then
                    v80 = v83;
                end;
                if v76 then
                    break;
                end;
            end;
            if not v76 then
                v81 = v80;
            end;
            v76 = false;
            if not v81 then
                v67(v12(v13.PartialSuccess, v79));
                return;
            elseif v81 == Enum.MarketplaceItemPurchaseStatus.Success then
                v67(v12(v13.Success, v79));
                return;
            else
                v67(v11(v16[v81]));
                return;
            end;
        elseif string.find(l_result_0, "403") then
            v67(v11(v14.TwoStepVerificationRequired));
            return;
        else
            v67(v11(v14.Generic));
            return;
        end;
    end;
    local function v87() --[[ Line: 235 ]]
        -- upvalues: v21 (ref), v20 (ref), v23 (ref), l_HttpService_0 (ref), v22 (ref), l_BrowserService_0 (ref), v67 (copy), v10 (ref), v11 (ref), v14 (ref)
        local v85 = v21();
        if v85 == v20.Desktop or v85 == v20.Mobile then
            if v23 then
                local v86 = l_HttpService_0:JSONEncode({
                    command = "open", 
                    url = v22()
                });
                l_BrowserService_0:SendCommand(v86);
            else
                l_BrowserService_0:OpenBrowserWindow(v22());
            end;
            v67(v10());
            return;
        else
            v67(v11(v14.InsufficientRobux));
            return;
        end;
    end;
    return {
        currentBalance = v68.balance, 
        items = v68.items, 
        ownedItems = v68.ownedItems, 
        unpurchasableItems = v68.unpurchasableItems, 
        onClose = v75, 
        onAccept = if l_balance_0 < l_totalCost_0 then v87 else v84, 
        totalCost = v68.totalCost, 
        isDisabled = #v68.items == 0
    };
end;