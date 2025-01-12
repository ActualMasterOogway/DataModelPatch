local l_AssetService_0 = game:GetService("AssetService");
local l_AvatarCreationService_0 = game:GetService("AvatarCreationService");
local l_ExperienceAuthService_0 = game:GetService("ExperienceAuthService");
local l_RobloxReplicatedStorage_0 = game:GetService("RobloxReplicatedStorage");
local l_Parent_0 = script.Parent;
local v5 = require(l_Parent_0.Thunks.OpenPublishAssetPrompt);
local v6 = require(l_Parent_0.Thunks.OpenPublishAvatarPrompt);
local v7 = require(l_Parent_0.Thunks.OpenResultModal);
local v8 = require(l_Parent_0.Actions.SetHumanoidModel);
local v9 = require(l_Parent_0.Actions.SetPriceInRobux);
local v10 = require(l_Parent_0.Actions.OpenValidationErrorModal);
local v11 = require(script.Parent.FFlagPublishAvatarPromptEnabled);
local l_game_EngineFeature_0 = game:GetEngineFeature("PromptImportAnimationClipFromVideoAsyncEnabled");
local v13 = game:DefineFastFlag("AvatarPublishPromptUpdateAttachments", false);
local l_game_EngineFeature_1 = game:GetEngineFeature("WrapDeformerUpdateAttachments");
local function v21(v15) --[[ Line: 29 ]] --[[ Name: updateModelAttachmentsWithWrapDeformers ]]
    -- upvalues: l_RobloxReplicatedStorage_0 (copy)
    v15.Parent = l_RobloxReplicatedStorage_0;
    for _, v17 in v15:GetChildren() do
        if v17:IsA("MeshPart") then
            local l_WrapDeformer_0 = v17:FindFirstChildWhichIsA("WrapDeformer");
            if l_WrapDeformer_0 then
                for _, v20 in v17:GetChildren() do
                    if v20:IsA("Attachment") then
                        v20.CFrame = l_WrapDeformer_0:GetDeformedCFrameAsync(v20.CFrame);
                    end;
                end;
            end;
        end;
    end;
end;
return function(v22) --[[ Line: 53 ]] --[[ Name: ConnectAssetServiceEvents ]]
    -- upvalues: l_ExperienceAuthService_0 (copy), l_game_EngineFeature_0 (copy), v5 (copy), l_AssetService_0 (copy), v11 (copy), v6 (copy), v7 (copy), l_AvatarCreationService_0 (copy), l_game_EngineFeature_1 (copy), v13 (copy), v21 (copy), v8 (copy), v9 (copy), v10 (copy)
    local v23 = {};
    table.insert(v23, l_ExperienceAuthService_0.OpenAuthPrompt:Connect(function(v24, v25, v26) --[[ Line: 59 ]]
        -- upvalues: l_game_EngineFeature_0 (ref), v22 (copy), v5 (ref), l_AssetService_0 (ref), v11 (ref), v6 (ref)
        local v27 = l_game_EngineFeature_0 and v26.isVideoToAnimationFlow;
        if #v25 == 1 and v25[1] == Enum.ExperienceAuthScope.CreatorAssetsCreate and not v27 then
            if v26.instanceToPublish then
                v22:dispatch(v5(v26.instanceToPublish, v26.assetType, v24, v25));
                return;
            elseif v26.serializedInstance then
                local v28 = l_AssetService_0:DeserializeInstance(v26.serializedInstance);
                v22:dispatch(v5(v28, v26.assetType, v24, v25));
                return;
            elseif v11 and v26.outfitToPublish then
                v22:dispatch(v6(v24, v25));
            end;
        end;
    end));
    table.insert(v23, l_AssetService_0.OpenPublishResultModal:Connect(function(v29) --[[ Line: 86 ]]
        -- upvalues: v22 (copy), v7 (ref)
        v22:dispatch(v7(v29));
    end));
    local function v30() --[[ Line: 90 ]] --[[ Name: checkNewEventsExist ]]
        -- upvalues: l_AvatarCreationService_0 (ref)
        return l_AvatarCreationService_0.UgcValidationSuccess and l_AvatarCreationService_0.UgcValidationFailure;
    end;
    if pcall(v30) then
        table.insert(v23, l_AvatarCreationService_0.UgcValidationSuccess:Connect(function(v31, v32, v33) --[[ Line: 98 ]]
            -- upvalues: v22 (copy), l_AvatarCreationService_0 (ref), l_game_EngineFeature_1 (ref), v13 (ref), v21 (ref), v8 (ref), v11 (ref), v9 (ref)
            local v34 = v22:getState();
            if v34 and v34.promptRequest.promptInfo.guid == v31 then
                local v35 = l_AvatarCreationService_0:DeserializeAvatarModel(v32);
                if l_game_EngineFeature_1 and v13 then
                    v21(v35);
                end;
                v22:dispatch(v8(v35));
                if v11 then
                    v22:dispatch(v9(v33));
                    return;
                else
                    v22:dispatch(v9(0));
                end;
            end;
        end));
    end;
    if pcall(v30) then
        table.insert(v23, l_AvatarCreationService_0.UgcValidationFailure:Connect(function(v36, v37) --[[ Line: 124 ]]
            -- upvalues: v22 (copy), v10 (ref)
            local v38 = v22:getState();
            if v38 and v38.promptRequest.promptInfo.guid == v36 then
                v22:dispatch(v10(v37));
            end;
        end));
    end;
    return v23;
end;