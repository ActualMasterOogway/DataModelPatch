local l_CorePackages_0 = game:GetService("CorePackages");
local l_MarketplaceService_0 = game:GetService("MarketplaceService");
local l_Players_0 = game:GetService("Players");
local l_HttpService_0 = game:GetService("HttpService");
local v4 = require(l_CorePackages_0.Packages.Promise);
local l_AvatarEditorService_0 = game:GetService("AvatarEditorService");
local l_Url_0 = require(l_CorePackages_0.Workspace.Packages.Http).Url;
local v7 = string.format("https://develop.%s", l_Url_0.DOMAIN);
local function _(v8, v9, v10, v11) --[[ Line: 20 ]] --[[ Name: request ]]
    -- upvalues: l_HttpService_0 (copy)
    return l_HttpService_0:RequestInternal(v8):Start(function(v12, v13) --[[ Line: 21 ]]
        -- upvalues: v9 (copy), l_HttpService_0 (ref), v10 (copy), v11 (copy)
        if v12 and v13.StatusCode == 200 then
            local v14 = true;
            local v15 = nil;
            if v9 and v13.Body ~= "null" then
                local l_status_0, l_result_0 = pcall(l_HttpService_0.JSONDecode, l_HttpService_0, v13.Body);
                v14 = l_status_0;
                v15 = l_result_0;
            else
                v15 = v13.Body;
            end;
            if v14 then
                v10(v15);
                return;
            else
                v11("Could not parse JSON.");
                return;
            end;
        else
            v11(v13);
            return;
        end;
    end);
end;
local function v34(v19, v20) --[[ Line: 43 ]] --[[ Name: createYieldingPromise ]]
    -- upvalues: v4 (copy), l_HttpService_0 (copy)
    return v4.new(function(v21, v22) --[[ Line: 44 ]]
        -- upvalues: v19 (copy), v20 (copy), l_HttpService_0 (ref)
        coroutine.wrap(function() --[[ Line: 45 ]]
            -- upvalues: v19 (ref), v20 (ref), v21 (copy), v22 (copy), l_HttpService_0 (ref)
            local l_v19_0 = v19;
            local l_v20_0 = v20;
            local l_v21_0 = v21;
            local l_v22_0 = v22;
            local _ = l_HttpService_0:RequestInternal(l_v19_0):Start(function(v27, v28) --[[ Line: 21 ]]
                -- upvalues: l_v20_0 (copy), l_HttpService_0 (ref), l_v21_0 (copy), l_v22_0 (copy)
                if v27 and v28.StatusCode == 200 then
                    local v29 = true;
                    local v30 = nil;
                    if l_v20_0 and v28.Body ~= "null" then
                        local l_status_1, l_result_1 = pcall(l_HttpService_0.JSONDecode, l_HttpService_0, v28.Body);
                        v29 = l_status_1;
                        v30 = l_result_1;
                    else
                        v30 = v28.Body;
                    end;
                    if v29 then
                        l_v21_0(v30);
                        return;
                    else
                        l_v22_0("Could not parse JSON.");
                        return;
                    end;
                else
                    l_v22_0(v28);
                    return;
                end;
            end);
        end)();
    end);
end;
local function v40(v35) --[[ Line: 54 ]] --[[ Name: getProductInfo ]]
    -- upvalues: v4 (copy), l_MarketplaceService_0 (copy)
    return v4.new(function(v36, v37) --[[ Line: 55 ]]
        -- upvalues: l_MarketplaceService_0 (ref), v35 (copy)
        local l_status_2, l_result_2 = pcall(function() --[[ Line: 56 ]]
            -- upvalues: l_MarketplaceService_0 (ref), v35 (ref)
            return l_MarketplaceService_0:GetProductInfo(v35);
        end);
        if l_status_2 then
            v36(l_result_2);
            return;
        else
            v37("Failure in getProductInfo: ", (tostring(l_result_2)));
            return;
        end;
    end);
end;
local function v47(v41, v42) --[[ Line: 71 ]] --[[ Name: getItemDetails ]]
    -- upvalues: v4 (copy), l_AvatarEditorService_0 (copy)
    return v4.new(function(v43, v44) --[[ Line: 72 ]]
        -- upvalues: l_AvatarEditorService_0 (ref), v41 (copy), v42 (copy)
        local l_status_3, l_result_3 = pcall(function() --[[ Line: 73 ]]
            -- upvalues: l_AvatarEditorService_0 (ref), v41 (ref), v42 (ref)
            return l_AvatarEditorService_0:GetItemDetails(v41, v42);
        end);
        if l_status_3 then
            v43(l_result_3);
            return;
        else
            v44("Failure in getItemDetails: ", (tostring(l_result_3)));
            return;
        end;
    end);
end;
local function v53(v48) --[[ Line: 88 ]] --[[ Name: getPlayerName ]]
    -- upvalues: v4 (copy), l_Players_0 (copy)
    return v4.new(function(v49, v50) --[[ Line: 89 ]]
        -- upvalues: l_Players_0 (ref), v48 (copy)
        local l_status_4, l_result_4 = pcall(function() --[[ Line: 90 ]]
            -- upvalues: l_Players_0 (ref), v48 (ref)
            return l_Players_0:GetNameFromUserIdAsync(v48);
        end);
        if l_status_4 then
            v49(l_result_4);
            return;
        else
            v50("Failure in getPlayerName: ", (tostring(l_result_4)));
            return;
        end;
    end);
end;
local function v56(v54) --[[ Line: 105 ]] --[[ Name: getAssetBundles ]]
    -- upvalues: l_Url_0 (copy), v34 (copy)
    local v55 = {
        Url = l_Url_0.CATALOG_URL .. "v1/assets/" .. tostring(v54) .. "/bundles", 
        Method = "GET"
    };
    return v34(v55, true);
end;
local function v61(v57) --[[ Line: 118 ]] --[[ Name: getHumanoidDescriptionFromCostumeId ]]
    -- upvalues: v4 (copy), l_Players_0 (copy)
    return v4.new(function(v58, _) --[[ Line: 119 ]]
        -- upvalues: l_Players_0 (ref), v57 (copy)
        spawn(function() --[[ Line: 120 ]]
            -- upvalues: l_Players_0 (ref), v57 (ref), v58 (copy)
            local l_l_Players_0_HumanoidDescriptionFromOutfitId_0 = l_Players_0:GetHumanoidDescriptionFromOutfitId(v57);
            if l_l_Players_0_HumanoidDescriptionFromOutfitId_0 then
                v58(l_l_Players_0_HumanoidDescriptionFromOutfitId_0);
            end;
        end);
    end);
end;
local function v64(v62) --[[ Line: 133 ]] --[[ Name: getAssetFavoriteCount ]]
    -- upvalues: l_Url_0 (copy), v34 (copy)
    local v63 = {
        Url = l_Url_0.CATALOG_URL .. "v1/favorites/assets/" .. tostring(v62) .. "/count", 
        Method = "GET"
    };
    return v34(v63, false);
end;
local function v67(v65) --[[ Line: 146 ]] --[[ Name: getBundleFavoriteCount ]]
    -- upvalues: l_Url_0 (copy), v34 (copy)
    local v66 = {
        Url = l_Url_0.CATALOG_URL .. "v1/favorites/bundles/" .. tostring(v65) .. "/count", 
        Method = "GET"
    };
    return v34(v66, false);
end;
local function v71(v68) --[[ Line: 159 ]] --[[ Name: getFavoriteForAsset ]]
    -- upvalues: l_Players_0 (copy), l_Url_0 (copy), v34 (copy)
    local l_UserId_0 = l_Players_0.LocalPlayer.UserId;
    local v70 = {
        Url = l_Url_0.CATALOG_URL .. "v1/favorites/users/" .. tostring(l_UserId_0) .. "/assets/" .. tostring(v68) .. "/favorite", 
        Method = "GET"
    };
    return v34(v70, true);
end;
local function v75(v72) --[[ Line: 178 ]] --[[ Name: getFavoriteForBundle ]]
    -- upvalues: l_Players_0 (copy), l_Url_0 (copy), v34 (copy)
    local l_UserId_1 = l_Players_0.LocalPlayer.UserId;
    local v74 = {
        Url = l_Url_0.CATALOG_URL .. "v1/favorites/users/" .. tostring(l_UserId_1) .. "/bundles/" .. tostring(v72) .. "/favorite", 
        Method = "GET"
    };
    return v34(v74, true);
end;
local function v79(v76) --[[ Line: 197 ]] --[[ Name: createFavoriteForAsset ]]
    -- upvalues: l_Players_0 (copy), l_Url_0 (copy), l_HttpService_0 (copy), v34 (copy)
    local l_UserId_2 = l_Players_0.LocalPlayer.UserId;
    local v78 = {
        Url = l_Url_0.CATALOG_URL .. "v1/favorites/users/" .. tostring(l_UserId_2) .. "/assets/" .. tostring(v76) .. "/favorite", 
        Method = "POST", 
        Body = l_HttpService_0:JSONEncode({})
    };
    return v34(v78, true);
end;
local function v83(v80) --[[ Line: 217 ]] --[[ Name: deleteFavoriteForAsset ]]
    -- upvalues: l_Players_0 (copy), l_Url_0 (copy), v34 (copy)
    local l_UserId_3 = l_Players_0.LocalPlayer.UserId;
    local v82 = {
        Url = l_Url_0.CATALOG_URL .. "v1/favorites/users/" .. tostring(l_UserId_3) .. "/assets/" .. tostring(v80) .. "/favorite", 
        Method = "DELETE"
    };
    return v34(v82, true);
end;
local function v87(v84) --[[ Line: 236 ]] --[[ Name: createFavoriteForBundle ]]
    -- upvalues: l_Players_0 (copy), l_Url_0 (copy), l_HttpService_0 (copy), v34 (copy)
    local l_UserId_4 = l_Players_0.LocalPlayer.UserId;
    local v86 = {
        Url = l_Url_0.CATALOG_URL .. "v1/favorites/users/" .. tostring(l_UserId_4) .. "/bundles/" .. tostring(v84) .. "/favorite", 
        Method = "POST", 
        Body = l_HttpService_0:JSONEncode({})
    };
    return v34(v86, true);
end;
local function v91(v88) --[[ Line: 256 ]] --[[ Name: deleteFavoriteForBundle ]]
    -- upvalues: l_Players_0 (copy), l_Url_0 (copy), v34 (copy)
    local l_UserId_5 = l_Players_0.LocalPlayer.UserId;
    local v90 = {
        Url = l_Url_0.CATALOG_URL .. "v1/favorites/users/" .. tostring(l_UserId_5) .. "/bundles/" .. tostring(v88) .. "/favorite", 
        Method = "DELETE"
    };
    return v34(v90, true);
end;
local function v94(v92) --[[ Line: 275 ]] --[[ Name: getEconomyProductInfo ]]
    -- upvalues: l_Url_0 (copy), v34 (copy)
    local v93 = {
        Url = l_Url_0.ECONOMY_URL .. "v1/products/" .. tostring(v92) .. "?showPurchasable=true", 
        Method = "GET"
    };
    return v34(v93, true);
end;
local function v99(v95) --[[ Line: 288 ]] --[[ Name: getModelFromUserId ]]
    -- upvalues: v4 (copy), l_Players_0 (copy)
    return v4.new(function(v96, v97) --[[ Line: 289 ]]
        -- upvalues: l_Players_0 (ref), v95 (copy)
        spawn(function() --[[ Line: 290 ]]
            -- upvalues: l_Players_0 (ref), v95 (ref), v96 (copy), v97 (copy)
            local l_l_Players_0_HumanoidModelFromUserId_0 = l_Players_0:CreateHumanoidModelFromUserId(v95);
            if l_l_Players_0_HumanoidModelFromUserId_0 then
                v96(l_l_Players_0_HumanoidModelFromUserId_0);
                return;
            else
                v97("Failure in getModelFromUserId");
                return;
            end;
        end);
    end);
end;
local function v104(v100, v101) --[[ Line: 305 ]] --[[ Name: getCollectibleResellableInstances ]]
    -- upvalues: l_Url_0 (copy), v34 (copy)
    local v102 = l_Url_0:makeQueryString({
        ownerId = tostring(v101), 
        ownerType = "User", 
        cursor = "", 
        limit = 500
    });
    local v103 = {
        Url = string.format("%smarketplace-sales/v1/item/%s/resellable-instances?%s", l_Url_0.APIS_URL, v100, v102), 
        Method = "GET"
    };
    return v34(v103, true);
end;
local function v107(v105) --[[ Line: 322 ]] --[[ Name: getVersionInfo ]]
    -- upvalues: v7 (copy), v34 (copy)
    local v106 = {
        Url = string.format("%sv1/assets/%s/saved-versions", v7, v105), 
        Method = "GET"
    };
    return v34(v106, true);
end;
local function v110(v108) --[[ Line: 331 ]] --[[ Name: getExperiencePlayability ]]
    -- upvalues: l_Url_0 (copy), v34 (copy)
    local v109 = {
        Url = string.format("%sv1/games/multiget-playability-status?universeIds=%s", l_Url_0.GAME_URL, v108), 
        Method = "GET"
    };
    return v34(v109, true);
end;
local function v113(v111) --[[ Line: 340 ]] --[[ Name: getExperienceInfo ]]
    -- upvalues: l_Url_0 (copy), v34 (copy)
    local v112 = {
        Url = string.format("%sv1/games?universeIds=%s", l_Url_0.GAME_URL, v111), 
        Method = "GET"
    };
    return v34(v112, true);
end;
return {
    new = function() --[[ Line: 351 ]] --[[ Name: new ]]
        -- upvalues: v40 (copy), v94 (copy), v53 (copy), v56 (copy), v61 (copy), v64 (copy), v67 (copy), v71 (copy), v75 (copy), v79 (copy), v83 (copy), v87 (copy), v91 (copy), v99 (copy), v104 (copy), v107 (copy), v110 (copy), v113 (copy), v47 (copy)
        local v114 = {
            getProductInfo = v40, 
            getEconomyProductInfo = v94, 
            getPlayerName = v53, 
            getAssetBundles = v56, 
            getHumanoidDescriptionFromCostumeId = v61, 
            getAssetFavoriteCount = v64, 
            getBundleFavoriteCount = v67, 
            getFavoriteForAsset = v71, 
            getFavoriteForBundle = v75, 
            createFavoriteForAsset = v79, 
            deleteFavoriteForAsset = v83, 
            createFavoriteForBundle = v87, 
            deleteFavoriteForBundle = v91, 
            getModelFromUserId = v99, 
            getCollectibleResellableInstances = v104, 
            getVersionInfo = v107, 
            getExperiencePlayability = v110, 
            getExperienceInfo = v113, 
            getItemDetails = v47
        };
        setmetatable(v114, {
            __tostring = function() --[[ Line: 381 ]] --[[ Name: __tostring ]]
                return "Service(Network)";
            end
        });
        return v114;
    end
};