local l_AssetService_0 = game:GetService("AssetService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_UGCValidationService_0 = game:GetService("UGCValidationService");
local v3 = require(l_CorePackages_0.Packages.UGCValidation);
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local v5 = require(l_RobloxGui_0.Modules.Common.Flags.FFlagMoveUGCValidationFunctionFeature);
local l_game_EngineFeature_0 = game:GetEngineFeature("EngineUGCValidateEditableMeshAndImage");
local l_game_EngineFeature_1 = game:GetEngineFeature("EngineUGCValidationCallbackResultStrings");
local l_game_EngineFeature_2 = game:GetEngineFeature("EngineUGCValidateRigidMeshPartAccessories");
local l_game_EngineFeature_3 = game:GetEngineFeature("UGCValidationRequiredFolderContextEngineFeature");
local function v30(v10) --[[ Line: 15 ]] --[[ Name: UGCValidationFunction ]]
    -- upvalues: v5 (copy), v3 (copy), l_game_EngineFeature_0 (copy), l_game_EngineFeature_3 (copy), l_game_EngineFeature_2 (copy), l_game_EngineFeature_1 (copy)
    local l_instances_0 = v10.instances;
    local l_assetType_0 = v10.assetType;
    local l_isServer_0 = v10.isServer;
    local l_fullBodyData_0 = v10.fullBodyData;
    local l_allowUnreviewedAssets_0 = v10.allowUnreviewedAssets;
    local l_restrictedUserIds_0 = v10.restrictedUserIds;
    local l_token_0 = v10.token;
    local l_universeId_0 = v10.universeId;
    local l_requireAllFolders_0 = v10.requireAllFolders;
    local v20 = {
        skipSnapshot = true, 
        skipPhysicsDataReset = true
    };
    local v21 = nil;
    local v22 = nil;
    if v5 then
        if l_fullBodyData_0 then
            local v23, v24 = v3.validateFullBody(l_fullBodyData_0, l_isServer_0, l_game_EngineFeature_0, v20, l_game_EngineFeature_0, if l_game_EngineFeature_3 then l_requireAllFolders_0 else nil);
            v21 = v23;
            v22 = v24;
        else
            local v25, v26 = v3.validate(l_instances_0, l_assetType_0, l_isServer_0, l_allowUnreviewedAssets_0, l_restrictedUserIds_0, l_token_0, l_universeId_0, l_game_EngineFeature_0, v20, l_game_EngineFeature_0, l_game_EngineFeature_2, if l_game_EngineFeature_3 then l_requireAllFolders_0 else nil);
            v21 = v25;
            v22 = v26;
        end;
    else
        local v27, v28 = v3.validate(l_instances_0, l_assetType_0, l_isServer_0, l_allowUnreviewedAssets_0, l_restrictedUserIds_0, l_token_0);
        v21 = v27;
        v22 = v28;
    end;
    if not v21 then
        if l_game_EngineFeature_1 then
            return false, v22;
        else
            local v29 = "";
            if v22 then
                v29 = table.concat(v22, "\n");
            end;
            return false, v29;
        end;
    elseif l_game_EngineFeature_1 then
        return true, {
            "Success"
        };
    else
        return true, "Success";
    end;
end;
return function() --[[ Line: 89 ]] --[[ Name: Install ]]
    -- upvalues: v5 (copy), l_UGCValidationService_0 (copy), v30 (copy), l_AssetService_0 (copy)
    if v5 then
        l_UGCValidationService_0:RegisterUGCValidationFunction(v30);
        return;
    else
        l_AssetService_0:RegisterUGCValidationFunction(v30);
        return;
    end;
end;