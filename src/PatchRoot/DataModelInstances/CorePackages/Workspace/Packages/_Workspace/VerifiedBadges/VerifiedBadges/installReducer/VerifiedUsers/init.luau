local l_script_FirstAncestor_0 = script:FindFirstAncestor("VerifiedBadges");
local v1 = require(l_script_FirstAncestor_0.Parent.Rodux);
local v2 = require(l_script_FirstAncestor_0.Parent.Cryo);
local v3 = require(l_script_FirstAncestor_0.dependencies);
local l_UsersNetworking_0 = v3.UsersNetworking;
local l_FriendsNetworking_0 = v3.FriendsNetworking;
local v6 = {};
local function v12(v7, v8) --[[ Line: 19 ]]
    -- upvalues: v2 (copy)
    local v9 = {};
    for _, v11 in ipairs(v8) do
        v9[tostring(v11.id)] = v11.hasVerifiedBadge and true or v2.None;
    end;
    return v2.Dictionary.join(v7, v9);
end;
return v1.createReducer(v6, {
    [l_UsersNetworking_0.GetUserV2FromUserId.Succeeded.name] = function(v13, v14) --[[ Line: 30 ]]
        -- upvalues: v12 (copy)
        return v12(v13, {
            v14.responseBody
        });
    end, 
    [l_FriendsNetworking_0.GetFriendsFromUserId.Succeeded.name] = function(v15, v16) --[[ Line: 34 ]]
        -- upvalues: v12 (copy)
        return v12(v15, v16.responseBody.data);
    end, 
    AddGameDetails = function(v17, v18) --[[ Line: 38 ]] --[[ Name: AddGameDetails ]]
        -- upvalues: v2 (copy)
        local v19 = {};
        for _, v21 in pairs(v18.gameDetails) do
            local v22 = tostring(v21.creator.id);
            local l_type_0 = v21.creator.type;
            local l_hasVerifiedBadge_0 = v21.creator.hasVerifiedBadge;
            if l_type_0 == Enum.CreatorType.User.Name then
                v19[v22] = l_hasVerifiedBadge_0 and true or v2.None;
            end;
        end;
        return v2.Dictionary.join(v17, v19);
    end, 
    SetAssetInfoFromCatalogItemAction = function(v25, v26) --[[ Line: 54 ]] --[[ Name: SetAssetInfoFromCatalogItemAction ]]
        -- upvalues: v2 (copy)
        if v26.assetData.creatorType ~= Enum.CreatorType.User.Name then
            return v25;
        else
            local v27 = tostring(v26.assetData.creatorTargetId);
            local l_creatorHasVerifiedBadge_0 = v26.assetData.creatorHasVerifiedBadge;
            return v2.Dictionary.join(v25, {
                [v27] = l_creatorHasVerifiedBadge_0 and true or v2.None
            });
        end;
    end
});