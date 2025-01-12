local l_script_FirstAncestor_0 = script:FindFirstAncestor("VerifiedBadges");
local v1 = require(l_script_FirstAncestor_0.Parent.Rodux);
local v2 = require(l_script_FirstAncestor_0.Parent.Cryo);
return v1.createReducer({}, {
    AddGameDetails = function(v3, v4) --[[ Line: 11 ]] --[[ Name: AddGameDetails ]]
        -- upvalues: v2 (copy)
        local v5 = {};
        for _, v7 in pairs(v4.gameDetails) do
            local v8 = tostring(v7.creator.id);
            local l_type_0 = v7.creator.type;
            local l_hasVerifiedBadge_0 = v7.creator.hasVerifiedBadge;
            if l_type_0 == Enum.CreatorType.Group.Name then
                v5[v8] = l_hasVerifiedBadge_0 and true or v2.None;
            end;
        end;
        return v2.Dictionary.join(v3, v5);
    end, 
    SetAssetInfoFromCatalogItemAction = function(v11, v12) --[[ Line: 27 ]] --[[ Name: SetAssetInfoFromCatalogItemAction ]]
        -- upvalues: v2 (copy)
        if v12.assetData.creatorType ~= Enum.CreatorType.Group.Name then
            return v11;
        else
            local v13 = tostring(v12.assetData.creatorTargetId);
            local l_creatorHasVerifiedBadge_0 = v12.assetData.creatorHasVerifiedBadge;
            return v2.Dictionary.join(v11, {
                [v13] = l_creatorHasVerifiedBadge_0 and true or v2.None
            });
        end;
    end
});