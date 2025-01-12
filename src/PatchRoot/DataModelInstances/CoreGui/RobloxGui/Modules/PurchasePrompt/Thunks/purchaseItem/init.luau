local l_Parent_0 = script.Parent.Parent;
local l_CoreGui_0 = game:GetService("CoreGui");
local l_HttpService_0 = game:GetService("HttpService");
local l_Workspace_0 = game:GetService("Workspace");
local l_Players_0 = game:GetService("Players");
local l_ExperienceAuthService_0 = game:GetService("ExperienceAuthService");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v7 = require(l_Parent_0.Actions.SetPromptState);
local v8 = require(l_Parent_0.Actions.StartPurchase);
local v9 = require(l_Parent_0.Actions.ErrorOccurred);
local v10 = require(l_Parent_0.Enums.PurchaseFlow);
local v11 = require(l_Parent_0.Enums.PromptState);
local v12 = require(l_Parent_0.Enums.ItemType);
local v13 = require(l_Parent_0.Enums.PurchaseError);
local v14 = require(l_Parent_0.Enums.RequestType);
local v15 = require(l_Parent_0.Network.getToolAsset);
local v16 = require(l_Parent_0.Network.performPurchase);
local v17 = require(l_Parent_0.Network.performPurchaseV2);
local v18 = require(l_Parent_0.Services.Network);
local v19 = require(l_Parent_0.Services.Analytics);
local v20 = require(l_Parent_0.Services.ExternalSettings);
local v21 = require(l_Parent_0.Utils.getPlayerPrice);
local v22 = require(l_Parent_0.Thunk);
local v23 = require(l_Parent_0.Promise);
local v24 = require(script.Parent.completePurchase);
local v25 = require(l_Parent_0.Parent.Flags.FFlagEnableCollectibleCheckToPurchaseItem);
local v26 = require(l_RobloxGui_0.Modules.PublishAssetPrompt.FFlagPublishAvatarPromptEnabled);
local v27 = {
    v18, 
    v19, 
    v20
};
return function() --[[ Line: 47 ]] --[[ Name: purchaseItem ]]
    -- upvalues: v22 (copy), v27 (copy), v18 (copy), v20 (copy), v19 (copy), v8 (copy), l_Workspace_0 (copy), v26 (copy), v14 (copy), l_ExperienceAuthService_0 (copy), v24 (copy), v10 (copy), v7 (copy), v11 (copy), l_HttpService_0 (copy), v21 (copy), v25 (copy), v17 (copy), v23 (copy), v13 (copy), v9 (copy), v16 (copy), v12 (copy), v15 (copy), l_Players_0 (copy)
    return v22.new(script.Name, v27, function(v28, v29) --[[ Line: 48 ]]
        -- upvalues: v18 (ref), v20 (ref), v19 (ref), v8 (ref), l_Workspace_0 (ref), v26 (ref), v14 (ref), l_ExperienceAuthService_0 (ref), v24 (ref), v10 (ref), v7 (ref), v11 (ref), l_HttpService_0 (ref), v21 (ref), v25 (ref), v17 (ref), v23 (ref), v13 (ref), v9 (ref), v16 (ref), v12 (ref), v15 (ref), l_Players_0 (ref)
        local v30 = v29[v18];
        local v31 = v29[v20];
        local v32 = v29[v19];
        local v33 = v28:getState();
        local l_purchaseFlow_0 = v33.purchaseFlow;
        local l_requestType_0 = v33.promptRequest.requestType;
        local v36 = v31.getPlatform();
        v28:dispatch(v8(l_Workspace_0.DistributedGameTime));
        if v26 and l_requestType_0 == v14.AvatarCreationFee then
            local v37 = {
                avatarName = v33.productInfo.name, 
                avatarDescription = v33.productInfo.description, 
                priceFromToken = v33.productInfo.price
            };
            local v38 = {
                [1] = Enum.ExperienceAuthScope.CreatorAssetsCreate
            };
            l_ExperienceAuthService_0:ScopeCheckUIComplete(v33.promptRequest.id, v38, Enum.ScopeCheckResult.ConsentAccepted, v37);
            v32.signalAvatarCreationPurchaseSubmit();
            v28:dispatch(v24());
            return;
        else
            if l_purchaseFlow_0 == v10.RobuxUpsellV2 or l_purchaseFlow_0 == v10.LargeRobuxUpsell then
                v28:dispatch(v7(v11.PurchaseInProgress));
            end;
            local v39 = v28:getState();
            local v40 = l_HttpService_0:GenerateGUID(false);
            local l_id_0 = v39.promptRequest.id;
            local l_infoType_0 = v39.promptRequest.infoType;
            local l_equipIfPurchased_0 = v39.promptRequest.equipIfPurchased;
            local l_isRobloxPurchase_0 = v39.promptRequest.isRobloxPurchase;
            local l_purchaseAuthToken_0 = v39.promptRequest.purchaseAuthToken;
            local l_idempotencyKey_0 = v39.promptRequest.idempotencyKey;
            local l_collectibleItemId_0 = v39.promptRequest.collectibleItemId;
            local l_collectibleItemInstanceId_0 = v39.promptRequest.collectibleItemInstanceId;
            local l_collectibleProductId_0 = v39.promptRequest.collectibleProductId;
            local l_expectedPrice_0 = v39.promptRequest.expectedPrice;
            local v51 = v39.accountInfo.membershipType == 4;
            local v52 = v21(v39.productInfo, v51);
            if l_collectibleItemInstanceId_0 and l_collectibleItemInstanceId_0 ~= "" then
                v52 = l_expectedPrice_0;
            end;
            local l_assetTypeId_0 = v39.productInfo.assetTypeId;
            local l_productId_0 = v39.productInfo.productId;
            local l_collectibleItemId_1 = v39.productInfo.collectibleItemId;
            local l_collectibleProductId_1 = v39.productInfo.collectibleProductId;
            local l_itemType_0 = v39.productInfo.itemType;
            v32.signalProductPurchaseConfirmed(l_productId_0, v39.requestType);
            local v58 = false;
            if v25 then
                v58 = l_collectibleItemId_0 and l_collectibleItemId_0 ~= "" and l_infoType_0 == Enum.InfoType.Bundle;
            end;
            if v25 and v58 or l_collectibleItemInstanceId_0 and l_collectibleItemInstanceId_0 ~= "" then
                return v17(v30, l_infoType_0, l_productId_0, v52, v40, l_isRobloxPurchase_0, l_collectibleItemId_0, l_collectibleProductId_0, l_idempotencyKey_0, l_purchaseAuthToken_0, l_collectibleItemInstanceId_0):andThen(function(v59) --[[ Line: 145 ]]
                    -- upvalues: v28 (copy), v24 (ref), v32 (copy), l_id_0 (copy), l_infoType_0 (copy), v52 (ref), v23 (ref)
                    v28:dispatch(v24());
                    v32.signalPurchaseSuccess(l_id_0, l_infoType_0, v52, v59);
                    return v23.resolve();
                end):catch(function(v60) --[[ Line: 156 ]]
                    -- upvalues: v13 (ref), v32 (copy), l_productId_0 (copy), l_infoType_0 (copy), v36 (copy), v28 (copy), v9 (ref)
                    if v60 == v13.TwoFactorNeeded then
                        v32.signalTwoSVSettingsErrorShown(l_productId_0, l_infoType_0);
                        if v36 == Enum.Platform.Windows or v36 == Enum.Platform.OSX then
                            v60 = v13.TwoFactorNeededSettings;
                        end;
                    end;
                    v28:dispatch(v9(v60));
                end);
            else
                return v16(v30, l_infoType_0, l_productId_0, v52, v40, l_isRobloxPurchase_0, l_collectibleItemId_1, l_collectibleProductId_1, l_idempotencyKey_0, l_purchaseAuthToken_0):andThen(function(v61) --[[ Line: 169 ]]
                    -- upvalues: v28 (copy), v24 (ref), l_itemType_0 (copy), v12 (ref), v32 (copy), l_id_0 (copy), l_infoType_0 (copy), v52 (ref), l_equipIfPurchased_0 (copy), l_assetTypeId_0 (copy), v15 (ref), v30 (copy), l_Players_0 (ref), v23 (ref)
                    v28:dispatch(v24());
                    if l_itemType_0 ~= v12.Bundle then
                        v32.signalPurchaseSuccess(l_id_0, l_infoType_0, v52, v61);
                    end;
                    if l_equipIfPurchased_0 and l_assetTypeId_0 == 19 then
                        return v15(v30, l_id_0):andThen(function(v62) --[[ Line: 183 ]]
                            -- upvalues: l_Players_0 (ref)
                            if v62 then
                                v62.Parent = l_Players_0.LocalPlayer.Backpack;
                            end;
                        end);
                    else
                        return v23.resolve();
                    end;
                end):catch(function(v63) --[[ Line: 192 ]]
                    -- upvalues: v13 (ref), v32 (copy), l_productId_0 (copy), l_infoType_0 (copy), v36 (copy), v28 (copy), v9 (ref)
                    if v63 == v13.TwoFactorNeeded then
                        v32.signalTwoSVSettingsErrorShown(l_productId_0, l_infoType_0);
                        if v36 == Enum.Platform.Windows or v36 == Enum.Platform.OSX then
                            v63 = v13.TwoFactorNeededSettings;
                        end;
                    end;
                    v28:dispatch(v9(v63));
                end);
            end;
        end;
    end);
end;