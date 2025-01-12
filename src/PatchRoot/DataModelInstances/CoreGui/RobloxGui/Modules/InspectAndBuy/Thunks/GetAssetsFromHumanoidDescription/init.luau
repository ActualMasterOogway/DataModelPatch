local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Thunk);
local v2 = require(l_Parent_0.Thunks.GetProductInfo);
local v3 = require(l_Parent_0.Thunks.GetVersionInfo);
local v4 = require(l_Parent_0.Models.AssetInfo);
local v5 = require(l_Parent_0.Actions.SetAssets);
local v6 = require(l_Parent_0.Actions.SetEquippedAssets);
local v7 = require(l_Parent_0.Constants);
local v8 = require(l_Parent_0.Thunks.GetAssetBundles);
local v9 = require(l_Parent_0.Flags.FFlagAttributionInInspectAndBuy);
local v10 = {};
local function v26(v11) --[[ Line: 17 ]] --[[ Name: getAssetIds ]]
    -- upvalues: v7 (copy), v4 (copy)
    local v12 = {};
    for v13, v14 in pairs(v7.AssetTypeIdStringToHumanoidDescriptionProp) do
        if v7.AssetTypeIdToAccessoryTypeEnum[v13] == nil then
            local v15 = v11[v14] or "";
            for _, v17 in pairs(string.split(v15)) do
                if tonumber(v17) and v17 ~= "0" then
                    table.insert(v12, v4.fromHumanoidDescription(v17));
                end;
            end;
        end;
    end;
    local l_v11_Accessories_0 = v11:GetAccessories(true);
    for _, v20 in pairs(l_v11_Accessories_0) do
        v12[#v12 + 1] = v4.fromHumanoidDescription(v20.AssetId);
    end;
    local l_v11_Emotes_0 = v11:GetEmotes();
    for _, v23 in pairs(l_v11_Emotes_0) do
        for _, v25 in pairs(v23) do
            v12[#v12 + 1] = v4.fromHumanoidDescription(v25);
        end;
    end;
    return v12;
end;
return function(v27, v28) --[[ Line: 51 ]] --[[ Name: GetAssetsFromHumanoidDescription ]]
    -- upvalues: v1 (copy), v10 (copy), v26 (copy), v2 (copy), v8 (copy), v9 (copy), v3 (copy), v5 (copy), v6 (copy)
    return v1.new(script.Name, v10, function(v29, _) --[[ Line: 52 ]]
        -- upvalues: v26 (ref), v27 (copy), v28 (copy), v2 (ref), v8 (ref), v9 (ref), v3 (ref), v5 (ref), v6 (ref)
        local v31 = v26(v27);
        if not v28 then
            for _, v33 in ipairs(v31) do
                coroutine.wrap(function() --[[ Line: 57 ]]
                    -- upvalues: v29 (copy), v2 (ref), v33 (copy), v8 (ref), v9 (ref), v3 (ref)
                    v29:dispatch(v2(v33.assetId));
                    if v33.parentBundleId == nil then
                        v29:dispatch(v8(v33.assetId));
                    end;
                    if v9 then
                        v29:dispatch(v3(v33.assetId));
                    end;
                end)();
            end;
            v29:dispatch(v5(v31));
            return;
        else
            v29:dispatch(v6(v31));
            return;
        end;
    end);
end;