local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Cryo);
local v2 = require(l_CorePackages_0.Packages.Rodux);
local l_Parent_0 = script.Parent.Parent;
local v4 = require(l_Parent_0.Models.AssetInfo);
local v5 = require(l_Parent_0.Actions.SetAssets);
local v6 = require(l_Parent_0.Actions.SetBundlesAssetIsPartOf);
local v7 = require(l_Parent_0.Actions.SetAssetFromBundleInfo);
return v2.createReducer({}, {
    [v5.name] = function(v8, v9) --[[ Line: 15 ]]
        -- upvalues: v1 (copy), v4 (copy)
        local v10 = {};
        for _, v12 in ipairs(v9.assets) do
            assert(v12.assetId ~= nil, "Expected an asset id when setting an asset's information.");
            local v13 = v8[v12.assetId] or {};
            v10[v12.assetId] = v1.Dictionary.join(v13, v12);
            if v10[v12.assetId] then
                v10[v12.assetId] = v4.getSaleDetailsForCollectibles(v10[v12.assetId]);
            end;
        end;
        return (v1.Dictionary.join(v8, v10));
    end, 
    [v6.name] = function(v14, v15) --[[ Line: 37 ]]
        -- upvalues: v4 (copy), v1 (copy)
        local v16 = tostring(v15.assetId);
        local l_bundleIds_0 = v15.bundleIds;
        local v18 = v14[v16] or {};
        local v19 = v4.fromGetAssetBundles(v16, l_bundleIds_0);
        v19 = v1.Dictionary.join(v18, v19);
        return v1.Dictionary.join(v14, {
            [v16] = v19
        });
    end, 
    [v7.name] = function(v20, v21) --[[ Line: 46 ]]
        -- upvalues: v4 (copy), v1 (copy)
        local l_bundleInfo_0 = v21.bundleInfo;
        local v23 = tostring(v21.assetId);
        local v24 = v20[v23] or {};
        local v25 = v4.fromBundleInfo(v23, l_bundleInfo_0);
        v25 = v1.Dictionary.join(v24, v25);
        return v1.Dictionary.join(v20, {
            [v23] = v25
        });
    end
});