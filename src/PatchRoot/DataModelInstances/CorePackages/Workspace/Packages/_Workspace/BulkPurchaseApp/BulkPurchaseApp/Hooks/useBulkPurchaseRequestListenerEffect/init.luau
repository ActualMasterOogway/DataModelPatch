local l_MarketplaceService_0 = game:GetService("MarketplaceService");
local l_Players_0 = game:GetService("Players");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("BulkPurchaseApp");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v4 = require(l_Parent_0.React);
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local v6 = require(l_script_FirstAncestor_0.Store.Thunks.InitiateBulkPurchaseFlow);
local l_useNetwork_0 = require(l_Parent_0.EconomyCommonCoreScriptHooks).useNetwork;
local _ = require(l_script_FirstAncestor_0.Store.Types);
local v9 = require(l_script_FirstAncestor_0.Enums.PurchasableStateEnum);
local function v14(v10) --[[ Line: 18 ]] --[[ Name: transformItemDataToBulkPurchaseItemData ]]
    -- upvalues: v9 (copy)
    local v11 = {};
    for _, v13 in v10 do
        table.insert(v11, {
            id = v13.id, 
            name = v13.name, 
            description = v13.description, 
            priceRobux = v13.priceRobux, 
            type = v13.type, 
            ownedCount = v13.ownedCount, 
            quantityLimitPerUser = v13.quantityLimitPerUser, 
            isLimited = v13.isLimited, 
            purchasableState = if v13.purchaseableState == "Purchaseable" then v9.Purchasable else v13.purchaseableState
        });
    end;
    return v11;
end;
return function() --[[ Line: 39 ]] --[[ Name: useBulkPurchaseRequestListenerEffect ]]
    -- upvalues: l_useDispatch_0 (copy), l_useNetwork_0 (copy), v4 (copy), l_MarketplaceService_0 (copy), l_Players_0 (copy), v6 (copy), v14 (copy)
    local v15 = l_useDispatch_0();
    local v16 = l_useNetwork_0();
    v4.useEffect(function() --[[ Line: 42 ]]
        -- upvalues: v15 (copy), v16 (copy), l_MarketplaceService_0 (ref), l_Players_0 (ref), v6 (ref), v14 (ref)
        local v17 = nil;
        if v15 and v16 then
            v17 = l_MarketplaceService_0.PromptBulkPurchaseRequested:Connect(function(v18, v19, v20, v21, v22, v23) --[[ Line: 46 ]]
                -- upvalues: l_Players_0 (ref), v15 (ref), v6 (ref), v16 (ref), v14 (ref)
                if v18 == l_Players_0.LocalPlayer then
                    v15(v6(v16, v14(v19), v20, v21, v22, v23));
                end;
            end);
        end;
        return function() --[[ Line: 69 ]]
            -- upvalues: v17 (ref)
            if v17 then
                v17:Disconnect();
                v17 = nil;
            end;
        end;
    end, {
        v15, 
        v16
    });
end;