local l_Parent_0 = script.Parent.Parent.Parent;
local l_MarketplaceService_0 = game:GetService("MarketplaceService");
local l_Players_0 = game:GetService("Players");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Roact_0 = require(l_CorePackages_0.Workspace.Packages.PurchasePromptDeps).Roact;
local v5 = require(l_Parent_0.Actions.ErrorOccurred);
local v6 = require(l_Parent_0.Enums.PurchaseError);
local v7 = require(l_Parent_0.Thunks.completePurchase);
local v8 = require(l_Parent_0.Thunks.initiatePurchase);
local v9 = require(l_Parent_0.Thunks.initiateBundlePurchase);
local v10 = require(l_Parent_0.Thunks.initiatePremiumPurchase);
local v11 = require(l_Parent_0.Thunks.initiateSubscriptionPurchase);
local v12 = require(l_Parent_0.connectToStore);
local v13 = require(script.Parent.ExternalEventConnection);
local v14 = require(l_Parent_0.Flags.GetFFlagEnablePromptPurchaseRequestedV2);
local v15 = require(l_Parent_0.Flags.GetFFlagEnablePromptPurchaseRequestedV2Take2);
return (v12(nil, function(v16) --[[ Line: 118 ]]
    -- upvalues: l_Players_0 (copy), v8 (copy), v5 (copy), v6 (copy), v7 (copy), v9 (copy), v10 (copy), v11 (copy)
    local function v21(v17, v18, v19, _) --[[ Line: 119 ]] --[[ Name: onPurchaseRequest ]]
        -- upvalues: l_Players_0 (ref), v16 (copy), v8 (ref)
        if v17 == l_Players_0.LocalPlayer then
            v16(v8(v18, Enum.InfoType.Asset, v19, false, "", ""));
        end;
    end;
    local function v28(v22, v23, v24, _, v26, v27) --[[ Line: 125 ]] --[[ Name: onPurchaseRequestV2 ]]
        -- upvalues: l_Players_0 (ref), v16 (copy), v8 (ref)
        if v22 == l_Players_0.LocalPlayer then
            v16(v8(v23, Enum.InfoType.Asset, v24, false, v26, v27));
        end;
    end;
    local function v31(v29, v30) --[[ Line: 147 ]] --[[ Name: onRobloxPurchaseRequest ]]
        -- upvalues: v16 (copy), v8 (ref)
        v16(v8(v29, Enum.InfoType.Asset, v30, true));
    end;
    local function v36(v32, v33, v34, _) --[[ Line: 151 ]] --[[ Name: onProductPurchaseRequest ]]
        -- upvalues: l_Players_0 (ref), v16 (copy), v8 (ref)
        if v32 == l_Players_0.LocalPlayer then
            v16(v8(v33, Enum.InfoType.Product, v34));
        end;
    end;
    local function v39(v37, v38) --[[ Line: 157 ]] --[[ Name: onPurchaseGamePassRequest ]]
        -- upvalues: l_Players_0 (ref), v16 (copy), v8 (ref)
        if v37 == l_Players_0.LocalPlayer then
            v16(v8(v38, Enum.InfoType.GamePass, false));
        end;
    end;
    local function v48(v40, v41, v42, v43, v44, v45, v46, v47) --[[ Line: 163 ]] --[[ Name: onPromptCollectiblesPurchaseRequest ]]
        -- upvalues: l_Players_0 (ref), v16 (copy), v8 (ref)
        if v40 == l_Players_0.LocalPlayer then
            v16(v8(v41, Enum.InfoType.Asset, false, true, v46, v47, v42, v43, v44, v45));
        end;
    end;
    local function v51(v49) --[[ Line: 192 ]] --[[ Name: onServerPurchaseVerification ]]
        -- upvalues: v16 (copy), v5 (ref), v6 (ref), l_Players_0 (ref), v7 (ref)
        if not v49 then
            v16(v5(v6.UnknownFailure));
            return;
        else
            local l_playerId_0 = v49.playerId;
            if l_playerId_0 ~= nil then
                l_playerId_0 = tonumber(v49.playerId);
            end;
            if l_playerId_0 == l_Players_0.LocalPlayer.UserId then
                v16(v7());
            end;
            return;
        end;
    end;
    local function v54(v52, v53) --[[ Line: 206 ]] --[[ Name: onBundlePurchaseRequest ]]
        -- upvalues: l_Players_0 (ref), v16 (copy), v9 (ref)
        if v52 == l_Players_0.LocalPlayer then
            v16(v9(v53));
        end;
    end;
    local function v63(v55, v56, v57, v58, v59, v60, v61, v62) --[[ Line: 212 ]] --[[ Name: onCollectibleBundlePurchaseRequest ]]
        -- upvalues: l_Players_0 (ref), v16 (copy), v9 (ref)
        if v55 == l_Players_0.LocalPlayer then
            v16(v9(v56, v61, v62, v57, v58, v59, v60));
        end;
    end;
    local function v65(v64) --[[ Line: 237 ]] --[[ Name: onPremiumPurchaseRequest ]]
        -- upvalues: l_Players_0 (ref), v16 (copy), v10 (ref)
        if v64 == l_Players_0.LocalPlayer then
            v16(v10());
        end;
    end;
    local function v67(v66) --[[ Line: 243 ]] --[[ Name: onSubscriptionPurchaseRequest ]]
        -- upvalues: v16 (copy), v11 (ref)
        v16(v11(v66));
    end;
    return {
        onPurchaseRequest = v21, 
        onPurchaseRequestV2 = v28, 
        onRobloxPurchaseRequest = v31, 
        onProductPurchaseRequest = v36, 
        onPurchaseGamePassRequest = v39, 
        onServerPurchaseVerification = v51, 
        onBundlePurchaseRequest = v54, 
        onPremiumPurchaseRequest = v65, 
        onPromptCollectiblesPurchaseRequest = v48, 
        onSubscriptionPurchaseRequest = v67, 
        onCollectibleBundlePurchaseRequest = v63
    };
end)(function(v68) --[[ Line: 27 ]] --[[ Name: MarketplaceServiceEventConnector ]]
    -- upvalues: l_MarketplaceService_0 (copy), v14 (copy), v15 (copy), l_Roact_0 (copy), v13 (copy)
    local l_onPurchaseRequest_0 = v68.onPurchaseRequest;
    local l_onPurchaseRequestV2_0 = v68.onPurchaseRequestV2;
    local l_onProductPurchaseRequest_0 = v68.onProductPurchaseRequest;
    local l_onPurchaseGamePassRequest_0 = v68.onPurchaseGamePassRequest;
    local l_onServerPurchaseVerification_0 = v68.onServerPurchaseVerification;
    local l_onBundlePurchaseRequest_0 = v68.onBundlePurchaseRequest;
    local l_onPremiumPurchaseRequest_0 = v68.onPremiumPurchaseRequest;
    local l_onRobloxPurchaseRequest_0 = v68.onRobloxPurchaseRequest;
    local l_onPromptCollectiblesPurchaseRequest_0 = v68.onPromptCollectiblesPurchaseRequest;
    local l_onSubscriptionPurchaseRequest_0 = v68.onSubscriptionPurchaseRequest;
    local l_onCollectibleBundlePurchaseRequest_0 = v68.onCollectibleBundlePurchaseRequest;
    local function v80() --[[ Line: 40 ]] --[[ Name: checkNewEventExists ]]
        -- upvalues: l_MarketplaceService_0 (ref)
        return l_MarketplaceService_0.PromptPurchaseRequestedV2;
    end;
    local v81 = nil;
    v81 = if not not v14() or v15() and pcall(v80) then l_Roact_0.createElement(v13, {
        event = l_MarketplaceService_0.PromptPurchaseRequestedV2, 
        callback = l_onPurchaseRequestV2_0
    }) else l_Roact_0.createElement(v13, {
        event = l_MarketplaceService_0.PromptPurchaseRequested, 
        callback = l_onPurchaseRequest_0
    });
    local function v82() --[[ Line: 60 ]] --[[ Name: checkPromptCollectiblesPurchaseRequestedEventExists ]]
        -- upvalues: l_MarketplaceService_0 (ref)
        return l_MarketplaceService_0.PromptCollectiblesPurchaseRequested;
    end;
    local v83 = nil;
    if pcall(v82) then
        v83 = l_Roact_0.createElement(v13, {
            event = l_MarketplaceService_0.PromptCollectiblesPurchaseRequested, 
            callback = l_onPromptCollectiblesPurchaseRequest_0
        });
    end;
    local function v84() --[[ Line: 71 ]] --[[ Name: checkCollectibleBundlePurchaseEventExists ]]
        -- upvalues: l_MarketplaceService_0 (ref)
        return l_MarketplaceService_0.PromptCollectibleBundlePurchaseRequested;
    end;
    local v85 = nil;
    if pcall(v84) then
        v85 = l_Roact_0.createElement(v13, {
            event = l_MarketplaceService_0.PromptCollectibleBundlePurchaseRequested, 
            callback = l_onCollectibleBundlePurchaseRequest_0
        });
    end;
    return l_Roact_0.createFragment({
        v81, 
        v83, 
        v85, 
        RobloxPurchase = l_Roact_0.createElement(v13, {
            event = l_MarketplaceService_0.PromptRobloxPurchaseRequested, 
            callback = l_onRobloxPurchaseRequest_0
        }), 
        l_Roact_0.createElement(v13, {
            event = l_MarketplaceService_0.PromptProductPurchaseRequested, 
            callback = l_onProductPurchaseRequest_0
        }), 
        l_Roact_0.createElement(v13, {
            event = l_MarketplaceService_0.PromptGamePassPurchaseRequested, 
            callback = l_onPurchaseGamePassRequest_0
        }), 
        l_Roact_0.createElement(v13, {
            event = l_MarketplaceService_0.ServerPurchaseVerification, 
            callback = l_onServerPurchaseVerification_0
        }), 
        l_Roact_0.createElement(v13, {
            event = l_MarketplaceService_0.PromptBundlePurchaseRequested, 
            callback = l_onBundlePurchaseRequest_0
        }), 
        l_Roact_0.createElement(v13, {
            event = l_MarketplaceService_0.PromptPremiumPurchaseRequested, 
            callback = l_onPremiumPurchaseRequest_0
        }), 
        l_Roact_0.createElement(v13, {
            event = l_MarketplaceService_0.PromptSubscriptionPurchaseRequested, 
            callback = l_onSubscriptionPurchaseRequest_0
        })
    });
end));