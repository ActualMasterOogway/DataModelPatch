local l_Parent_0 = script.Parent.Parent;
local l_HttpService_0 = game:GetService("HttpService");
local l_ContentProvider_0 = game:GetService("ContentProvider");
local l_MarketplaceService_0 = game:GetService("MarketplaceService");
local l_InsertService_0 = game:GetService("InsertService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Players_0 = game:GetService("Players");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_UrlBuilder_0 = require(l_CorePackages_0.Workspace.Packages.PurchasePromptDeps).UrlBuilder.UrlBuilder;
local v9 = require(l_Parent_0.Promise);
local v10 = require(l_Parent_0.Models.PremiumProduct);
local v11 = require(l_Parent_0.Utils.debugLog);
local v12 = require(l_Parent_0.Utils.serializeTable);
local v13 = require(l_Parent_0.Utils.isGenericChallengeResponse);
local l_game_EngineFeature_0 = game:GetEngineFeature("EnablePlayerOwnsBundleApi");
local v15 = require(l_Parent_0.Flags.GetFFlagEnablePromptPurchaseRequestedV2);
local v16 = require(l_Parent_0.Flags.GetFFlagEnablePromptPurchaseRequestedV2Take2);
local v17 = require(l_Parent_0.Flags.GetFFlagUseCatalogItemDetailsToResolveBundlePurchase);
local l_FFlagEnablePreSignedVngShopRedirectUrl_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnablePreSignedVngShopRedirectUrl;
local v19 = string.gsub(l_ContentProvider_0.BaseUrl:lower(), "/m.", "/www.");
v19 = string.gsub(v19, "http:", "https:");
local _ = string.gsub(v19, "https://www", "https://api");
local v21 = string.gsub(v19, "https://www", "https://apis");
local v22 = string.gsub(v19, "https://www", "https://abtesting");
local v23 = string.gsub(v19, "https://www.", "https://catalog.");
local v24 = string.gsub(v19, "https://www.", "https://economy.");
local v25 = string.gsub(v19, "https://www.", "https://premiumfeatures.");
local v26 = string.gsub(v19, "https://www.", "https://economycreatorstats.");
local v27 = string.gsub(v19, "https://www", "https://users");
local function v36(v28, v29, v30) --[[ Line: 43 ]] --[[ Name: request ]]
    -- upvalues: v11 (copy), v12 (copy), l_HttpService_0 (copy)
    v11(function() --[[ Line: 44 ]]
        -- upvalues: v28 (copy), v12 (ref)
        return "Request " .. v28.Url .. "\n" .. v12(v28);
    end);
    return l_HttpService_0:RequestInternal(v28):Start(function(v31, v32) --[[ Line: 47 ]]
        -- upvalues: v11 (ref), v28 (copy), v12 (ref), l_HttpService_0 (ref), v29 (copy), v30 (copy)
        v11(function() --[[ Line: 48 ]]
            -- upvalues: v28 (ref), v12 (ref), v32 (copy)
            return "Response " .. v28.Url .. "\n" .. v12(v32);
        end);
        if v31 then
            local v33 = nil;
            local l_status_0, l_result_0 = pcall(l_HttpService_0.JSONDecode, l_HttpService_0, v32.Body);
            v31 = l_status_0;
            v33 = l_result_0;
            if v31 then
                v29(v33);
                return;
            else
                v30("Could not parse JSON.");
                return;
            end;
        else
            v30((tostring(v32.StatusMessage)));
            return;
        end;
    end);
end;
local function v42(v37, v38) --[[ Line: 68 ]] --[[ Name: getABTestGroup ]]
    -- upvalues: v9 (copy), v36 (copy), v22 (copy), l_HttpService_0 (copy)
    local v39 = {
        {
            ExperimentName = v38, 
            SubjectType = 1, 
            SubjectTargetId = v37
        }
    };
    return v9.new(function(v40, v41) --[[ Line: 77 ]]
        -- upvalues: v36 (ref), v22 (ref), l_HttpService_0 (ref), v39 (copy)
        return v36({
            Url = v22 .. "v1/get-enrollments", 
            Method = "POST", 
            Body = l_HttpService_0:JSONEncode(v39), 
            Headers = {
                ["Content-Type"] = "application/json", 
                Accept = "application/json"
            }
        }, v40, v41);
    end);
end;
local function v45(v43, v44) --[[ Line: 90 ]] --[[ Name: getProductInfo ]]
    -- upvalues: l_MarketplaceService_0 (copy)
    return l_MarketplaceService_0:GetProductInfo(v43, v44);
end;
local function v53() --[[ Line: 94 ]] --[[ Name: getPremiumProductInfo ]]
    -- upvalues: v9 (copy), v36 (copy), v25 (copy), v10 (copy), l_UserInputService_0 (copy)
    return v9.new(function(v46, v47) --[[ Line: 95 ]]
        -- upvalues: v36 (ref), v25 (ref), v10 (ref), l_UserInputService_0 (ref)
        v36({
            Url = v25 .. "v1/products?typeName=Subscription", 
            Method = "GET"
        }, function(v48) --[[ Line: 99 ]]
            -- upvalues: v10 (ref), l_UserInputService_0 (ref), v46 (copy)
            local v49 = nil;
            for _, v51 in ipairs(v48.products) do
                local v52 = v10(v51);
                if v52 ~= nil and (v49 == nil or v49.robuxAmount > v52.robuxAmount) then
                    v49 = v52;
                end;
            end;
            if l_UserInputService_0:GetPlatform() == Enum.Platform.Android and v49 ~= nil and v49.mobileProductId ~= nil then
                v49.mobileProductId = v49.mobileProductId:lower();
            end;
            v46(v49);
        end, v47);
    end);
end;
local function v57(v54, v55, v56) --[[ Line: 122 ]] --[[ Name: getPlayerOwns ]]
    -- upvalues: l_MarketplaceService_0 (copy), l_game_EngineFeature_0 (copy)
    if v56 == Enum.InfoType.Asset then
        return l_MarketplaceService_0:PlayerOwnsAsset(v54, v55);
    elseif l_game_EngineFeature_0 and v56 == Enum.InfoType.Bundle then
        return l_MarketplaceService_0:PlayerOwnsBundle(v54, v55);
    elseif v56 == Enum.InfoType.GamePass then
        return l_MarketplaceService_0:UserOwnsGamePassAsync(v54.UserId, v55);
    elseif v56 == Enum.InfoType.Subscription then
        return l_MarketplaceService_0:IsPlayerSubscribed(v54, v55);
    else
        return false;
    end;
end;
local function v69(v58, v59, v60, v61, v62, v63, v64, v65, v66) --[[ Line: 136 ]] --[[ Name: performPurchase ]]
    -- upvalues: v15 (copy), v16 (copy), l_MarketplaceService_0 (copy), v13 (copy)
    local l_status_1, l_result_1 = pcall(function() --[[ Line: 147 ]]
        -- upvalues: v15 (ref), v16 (ref), l_MarketplaceService_0 (ref), v58 (copy), v59 (copy), v60 (copy), v61 (copy), v62 (copy), v63 (copy), v64 (copy), v65 (copy), v66 (copy)
        if v15() or v16() then
            return l_MarketplaceService_0:PerformPurchase(v58, v59, v60, v61, v62, v63, v64, v65, v66);
        else
            return l_MarketplaceService_0:PerformPurchase(v58, v59, v60, v61, v62, v63, v64, v65);
        end;
    end);
    if l_status_1 then
        return l_result_1;
    elseif v13(l_result_1) then
        return l_result_1;
    else
        error((tostring(l_result_1)));
        return;
    end;
end;
local function v83(v70, v71, v72, v73, v74, v75, v76, v77, v78, v79) --[[ Line: 188 ]] --[[ Name: performPurchaseV2 ]]
    -- upvalues: l_MarketplaceService_0 (copy), v13 (copy)
    local l_status_2, l_result_2 = pcall(function() --[[ Line: 200 ]]
        -- upvalues: v75 (copy), v76 (copy), v77 (copy), v78 (copy), v79 (copy), l_MarketplaceService_0 (ref), v70 (copy), v71 (copy), v72 (copy), v73 (copy), v74 (copy)
        local v80 = {
            CollectibleItemId = v75, 
            CollectibleProductId = v76, 
            IdempotencyKey = v77, 
            PurchaseAuthToken = v78, 
            CollectibleItemInstanceId = v79
        };
        return l_MarketplaceService_0:PerformPurchaseV2(v70, v71, v72, v73, v74, v80);
    end);
    if l_status_2 then
        return l_result_2;
    elseif v13(l_result_2) then
        return l_result_2;
    else
        error((tostring(l_result_2)));
        return;
    end;
end;
local function v85(v84) --[[ Line: 233 ]] --[[ Name: loadAssetForEquip ]]
    -- upvalues: l_InsertService_0 (copy)
    return l_InsertService_0:LoadAsset(v84);
end;
local function v88() --[[ Line: 237 ]] --[[ Name: getAccountInfo ]]
    -- upvalues: v9 (copy), v36 (copy), v27 (copy)
    return v9.new(function(v86, v87) --[[ Line: 238 ]]
        -- upvalues: v36 (ref), v27 (ref)
        v36({
            Url = v27 .. "v1/users/authenticated/app-launch-info", 
            Method = "GET"
        }, v86, v87);
    end);
end;
local function v91() --[[ Line: 246 ]] --[[ Name: getBalanceInfo ]]
    -- upvalues: v9 (copy), v36 (copy), v24 (copy)
    return v9.new(function(v89, v90) --[[ Line: 247 ]]
        -- upvalues: v36 (ref), v24 (ref)
        v36({
            Url = v24 .. "v1/user/currency", 
            Method = "GET"
        }, v89, v90);
    end);
end;
local function v96(v92) --[[ Line: 255 ]] --[[ Name: getBundleDetails ]]
    -- upvalues: v23 (copy), v9 (copy), v36 (copy)
    local v93 = {
        Url = v23 .. "v1/bundles/" .. tostring(v92) .. "/details", 
        Method = "GET"
    };
    return v9.new(function(v94, v95) --[[ Line: 262 ]]
        -- upvalues: v36 (ref), v93 (copy)
        spawn(function() --[[ Line: 263 ]]
            -- upvalues: v36 (ref), v93 (ref), v94 (copy), v95 (copy)
            v36(v93, v94, v95);
        end);
    end);
end;
local function v101(v97) --[[ Line: 269 ]] --[[ Name: getProductPurchasableDetails ]]
    -- upvalues: v24 (copy), v9 (copy), v36 (copy)
    local v98 = {
        Url = v24 .. "v1/products/" .. tostring(v97) .. "?showPurchasable=true", 
        Method = "GET"
    };
    return v9.new(function(v99, v100) --[[ Line: 276 ]]
        -- upvalues: v36 (ref), v98 (copy)
        spawn(function() --[[ Line: 277 ]]
            -- upvalues: v36 (ref), v98 (ref), v99 (copy), v100 (copy)
            v36(v98, v99, v100);
        end);
    end);
end;
local function v107(v102, v103) --[[ Line: 283 ]] --[[ Name: getCatalogItemDetails ]]
    -- upvalues: v23 (copy), v9 (copy), v36 (copy)
    local v104 = {
        Url = string.format("%sv1/catalog/items/%d/details?itemType=%s", v23, v102, v103), 
        Method = "GET"
    };
    return v9.new(function(v105, v106) --[[ Line: 289 ]]
        -- upvalues: v36 (ref), v104 (copy)
        spawn(function() --[[ Line: 290 ]]
            -- upvalues: v36 (ref), v104 (ref), v105 (copy), v106 (copy)
            v36(v104, v105, v106);
        end);
    end);
end;
local function v114(v108, v109, v110) --[[ Line: 296 ]] --[[ Name: getRobuxUpsellProduct ]]
    -- upvalues: v21 (copy), l_HttpService_0 (copy), v9 (copy), v36 (copy)
    local v111 = {
        Url = v21 .. "payments-gateway/v1/products/get-upsell-product", 
        Method = "POST", 
        Body = l_HttpService_0:JSONEncode({
            upsell_platform = v110, 
            user_robux_balance = v109, 
            attempt_robux_amount = v108
        }), 
        Headers = {
            ["Content-Type"] = "application/json", 
            Accept = "application/json"
        }
    };
    return v9.new(function(v112, v113) --[[ Line: 311 ]]
        -- upvalues: v36 (ref), v111 (copy)
        spawn(function() --[[ Line: 312 ]]
            -- upvalues: v36 (ref), v111 (ref), v112 (copy), v113 (copy)
            v36(v111, v112, v113);
        end);
    end);
end;
local function v120() --[[ Line: 318 ]] --[[ Name: postPremiumImpression ]]
    -- upvalues: v26 (copy), l_HttpService_0 (copy), v9 (copy)
    local v115 = {
        Url = v26 .. "v1/universes/" .. tostring(game.GameId) .. "/premium-impressions/increment", 
        Method = "POST", 
        Body = l_HttpService_0:JSONEncode("{}"), 
        Headers = {
            ["Content-Type"] = "application/json", 
            Accept = "application/json"
        }
    };
    return v9.new(function(_, _) --[[ Line: 333 ]]
        -- upvalues: l_HttpService_0 (ref), v115 (copy)
        spawn(function() --[[ Line: 334 ]]
            -- upvalues: l_HttpService_0 (ref), v115 (ref)
            return l_HttpService_0:RequestInternal(v115):Start(function(_, _) --[[ Line: 335 ]]

            end);
        end);
    end);
end;
local function v126() --[[ Line: 342 ]] --[[ Name: getPremiumUpsellPrecheck ]]
    -- upvalues: v25 (copy), l_Players_0 (copy), v9 (copy), l_HttpService_0 (copy)
    local v121 = {
        Url = string.format("%sv1/users/%d/premium-upsell-precheck?universeId=%d&placeId=%d", v25, l_Players_0.LocalPlayer.UserId, game.GameId, game.PlaceId), 
        Method = "GET"
    };
    return v9.new(function(v122, v123) --[[ Line: 354 ]]
        -- upvalues: l_HttpService_0 (ref), v121 (copy)
        spawn(function() --[[ Line: 355 ]]
            -- upvalues: l_HttpService_0 (ref), v121 (ref), v122 (copy), v123 (copy)
            return l_HttpService_0:RequestInternal(v121):Start(function(v124, v125) --[[ Line: 356 ]]
                -- upvalues: v122 (ref), v123 (ref)
                if v124 and v125.StatusCode == 200 then
                    v122();
                    return;
                else
                    v123();
                    return;
                end;
            end);
        end);
    end);
end;
local function v128(v127) --[[ Line: 367 ]] --[[ Name: getSubscriptionPurchaseInfo ]]
    -- upvalues: l_MarketplaceService_0 (copy)
    return l_MarketplaceService_0:GetSubscriptionPurchaseInfoAsync(v127);
end;
local function v130(v129) --[[ Line: 371 ]] --[[ Name: DEPRECATED_performSubscriptionPurchase ]]
    -- upvalues: l_MarketplaceService_0 (copy)
    return l_MarketplaceService_0:performSubscriptionPurchase(v129);
end;
local function v133(v131, v132) --[[ Line: 376 ]] --[[ Name: performSubscriptionPurchase ]]
    -- upvalues: l_MarketplaceService_0 (copy)
    return l_MarketplaceService_0:PerformSubscriptionPurchaseV2(v131, v132);
end;
local function v140(v134, v135, v136) --[[ Line: 380 ]] --[[ Name: getPurchaseWarning ]]
    -- upvalues: l_UrlBuilder_0 (copy), v9 (copy), v36 (copy)
    local v137 = {
        Url = l_UrlBuilder_0.economy.purchaseWarning.getPurchaseWarning(v134, v135, not v136), 
        Method = "GET"
    };
    return v9.new(function(v138, v139) --[[ Line: 387 ]]
        -- upvalues: v36 (ref), v137 (copy)
        spawn(function() --[[ Line: 388 ]]
            -- upvalues: v36 (ref), v137 (ref), v138 (copy), v139 (copy)
            v36(v137, v138, v139);
        end);
    end);
end;
local function v147(v141) --[[ Line: 394 ]] --[[ Name: postPurchaseWarningAcknowledge ]]
    -- upvalues: l_UrlBuilder_0 (copy), l_HttpService_0 (copy), v9 (copy)
    local v142 = {
        Url = l_UrlBuilder_0.economy.purchaseWarning.ackPurchaseWarning(), 
        Method = "POST", 
        Body = l_HttpService_0:JSONEncode({
            acknowledgement = v141
        }), 
        Headers = {
            ["Content-Type"] = "application/json", 
            Accept = "application/json"
        }
    };
    return v9.new(function(_, _) --[[ Line: 408 ]]
        -- upvalues: l_HttpService_0 (ref), v142 (copy)
        spawn(function() --[[ Line: 409 ]]
            -- upvalues: l_HttpService_0 (ref), v142 (ref)
            return l_HttpService_0:RequestInternal(v142):Start(function(_, _) --[[ Line: 410 ]]

            end);
        end);
    end);
end;
local function v151() --[[ Line: 417 ]] --[[ Name: checkUserPurchaseSettings ]]
    -- upvalues: l_UrlBuilder_0 (copy), l_HttpService_0 (copy), v9 (copy), v36 (copy)
    local v148 = {
        Url = l_UrlBuilder_0.economy.paymentsGateway.checkUserPurchaseSettings(), 
        Method = "POST", 
        Body = l_HttpService_0:JSONEncode("{}"), 
        Headers = {
            ["Content-Type"] = "application/json", 
            Accept = "application/json"
        }
    };
    return v9.new(function(v149, v150) --[[ Line: 430 ]]
        -- upvalues: v36 (ref), v148 (copy)
        spawn(function() --[[ Line: 431 ]]
            -- upvalues: v36 (ref), v148 (ref), v149 (copy), v150 (copy)
            v36(v148, v149, v150);
        end);
    end);
end;
local function v155() --[[ Line: 437 ]] --[[ Name: getVngShopUrl ]]
    -- upvalues: l_UrlBuilder_0 (copy), v9 (copy), v36 (copy)
    local v152 = {
        Url = l_UrlBuilder_0.economy.vngPayments.getVngShopUrl(), 
        Method = "GET"
    };
    return v9.new(function(v153, v154) --[[ Line: 445 ]]
        -- upvalues: v36 (ref), v152 (copy)
        spawn(function() --[[ Line: 446 ]]
            -- upvalues: v36 (ref), v152 (ref), v153 (copy), v154 (copy)
            v36(v152, v153, v154);
        end);
    end);
end;
return {
    new = function() --[[ Line: 456 ]] --[[ Name: new ]]
        -- upvalues: v9 (copy), v42 (copy), v45 (copy), v57 (copy), v69 (copy), v83 (copy), v85 (copy), v88 (copy), v91 (copy), v96 (copy), v101 (copy), v17 (copy), v107 (copy), v114 (copy), v53 (copy), v120 (copy), v126 (copy), v128 (copy), v130 (copy), v133 (copy), v140 (copy), v147 (copy), v151 (copy), l_FFlagEnablePreSignedVngShopRedirectUrl_0 (copy), v155 (copy)
        local v156 = {
            getABTestGroup = v9.promisify(v42), 
            getProductInfo = v9.promisify(v45), 
            getPlayerOwns = v9.promisify(v57), 
            performPurchase = v9.promisify(v69), 
            performPurchaseV2 = v9.promisify(v83), 
            loadAssetForEquip = v9.promisify(v85), 
            getAccountInfo = v9.promisify(v88), 
            getBalanceInfo = v9.promisify(v91), 
            getBundleDetails = v96, 
            getProductPurchasableDetails = v101, 
            getCatalogItemDetails = if v17() then v107 else nil, 
            getRobuxUpsellProduct = v9.promisify(v114), 
            getPremiumProductInfo = v9.promisify(v53), 
            postPremiumImpression = v9.promisify(v120), 
            getPremiumUpsellPrecheck = v9.promisify(v126), 
            getSubscriptionPurchaseInfo = v9.promisify(v128), 
            DEPRECATED_performSubscriptionPurchase = v9.promisify(v130), 
            performSubscriptionPurchase = v9.promisify(v133), 
            getPurchaseWarning = v9.promisify(v140), 
            postPurchaseWarningAcknowledge = v9.promisify(v147), 
            checkUserPurchaseSettings = v9.promisify(v151), 
            getVngShopUrl = if l_FFlagEnablePreSignedVngShopRedirectUrl_0 then v9.promisify(v155) else nil
        };
        setmetatable(v156, {
            __tostring = function() --[[ Line: 485 ]] --[[ Name: __tostring ]]
                return "Service(Network)";
            end
        });
        return v156;
    end
};