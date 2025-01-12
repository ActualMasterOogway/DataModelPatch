local l_Parent_0 = script:FindFirstAncestor("OtaPatchLoader").Parent;
local v1 = require(script.Parent.OtaPatchLoaderTelemetry);
local l_Events_0 = v1.Events;
local l_FFlagLuaAppBetterOtaPackageError_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppBetterOtaPackageError;
local v4 = game:DefineFastInt("LuaAppUpdatePatchDeferTimeMs", 45000);
local v5 = {};
local _ = function(v6, v7) --[[ Line: 11 ]] --[[ Name: FindFromPath ]]
    local l_v6_0 = v6;
    for _, v10 in v7 do
        l_v6_0 = l_v6_0:FindFirstChild(v10, false);
        if not l_v6_0 then
            return nil;
        end;
    end;
    return l_v6_0;
end;
local function _(v12, v13, v14, v15) --[[ Line: 23 ]] --[[ Name: recordEvent ]]
    -- upvalues: v1 (copy)
    v1.sendTelemetryEvent(v12, v13, {
        patchName = v14, 
        extraMessage = v15
    });
end;
return function(v17, v18, v19, v20, v21, v22, v23) --[[ Line: 34 ]]
    -- upvalues: l_Events_0 (copy), v1 (copy), v5 (copy), v4 (copy), l_FFlagLuaAppBetterOtaPackageError_0 (copy)
    if not v18 then
        return nil;
    else
        local l_loggingProtocol_0 = v23.loggingProtocol;
        local l_dataModelPatchService_0 = v23.dataModelPatchService;
        if not l_dataModelPatchService_0 then
            error("DataModelPatchService not provided to loadOtaPackages");
        end;
        if not v17 or v17 == 0 then
            local l_NoUserId_0 = l_Events_0.NoUserId;
            v1.sendTelemetryEvent(l_loggingProtocol_0, l_NoUserId_0, {
                patchName = v18, 
                extraMessage = nil
            });
            return nil;
        else
            local v27 = ("%*:%*"):format(v17, v18);
            local v28 = v5[v27];
            if v28 ~= nil then
                if v28 == "NONE" then
                    return nil;
                else
                    return v5[v27];
                end;
            else
                local l_PatchLoadEntryPoint_0 = l_Events_0.PatchLoadEntryPoint;
                v1.sendTelemetryEvent(l_loggingProtocol_0, l_PatchLoadEntryPoint_0, {
                    patchName = v18, 
                    extraMessage = nil
                });
                local l_status_0, l_result_0 = pcall(function() --[[ Line: 70 ]]
                    -- upvalues: v19 (copy), v20 (copy), v21 (copy), l_dataModelPatchService_0 (copy), v18 (copy), v17 (copy), v1 (ref), l_loggingProtocol_0 (copy), v4 (ref), l_Events_0 (ref), v22 (copy), l_FFlagLuaAppBetterOtaPackageError_0 (ref)
                    local v30 = false;
                    local v31 = false;
                    assert(v19, "patchBehavior is nil");
                    assert(v20, "patchConfig is nil");
                    assert(v21, "patchPackagesRoot is nil");
                    local v32 = tick();
                    l_dataModelPatchService_0:RegisterPatch(v18, v19, v20, v17);
                    local l_l_dataModelPatchService_0_Patch_0 = l_dataModelPatchService_0:GetPatch(v18);
                    local v34 = tick() - v32;
                    v1.logCheckpointGetPatch(l_loggingProtocol_0, v34, {
                        patchName = v18
                    });
                    task.defer(function() --[[ Line: 84 ]]
                        -- upvalues: v4 (ref), l_dataModelPatchService_0 (ref), v17 (ref), v18 (ref)
                        local v35 = v4 / 1000;
                        if v35 > 0 then
                            task.wait(v35);
                        end;
                        l_dataModelPatchService_0:UpdatePatch(v17, v18, function() --[[ Line: 91 ]]

                        end);
                    end);
                    if not l_l_dataModelPatchService_0_Patch_0 then
                        local l_l_loggingProtocol_0_0 = l_loggingProtocol_0;
                        local l_NoPatchFound_0 = l_Events_0.NoPatchFound;
                        local l_v18_0 = v18;
                        v1.sendTelemetryEvent(l_l_loggingProtocol_0_0, l_NoPatchFound_0, {
                            patchName = l_v18_0, 
                            extraMessage = nil
                        });
                        return nil;
                    else
                        local l_v21_0 = v21;
                        local l_l_l_dataModelPatchService_0_Patch_0_0 = l_l_dataModelPatchService_0_Patch_0;
                        local v41;
                        for _, v43 in l_v21_0 do
                            l_l_l_dataModelPatchService_0_Patch_0_0 = l_l_l_dataModelPatchService_0_Patch_0_0:FindFirstChild(v43, false);
                            if not l_l_l_dataModelPatchService_0_Patch_0_0 then
                                v41 = nil;
                                v30 = true;
                            end;
                            if v30 then
                                break;
                            end;
                        end;
                        if not v30 then
                            v41 = l_l_l_dataModelPatchService_0_Patch_0_0;
                        end;
                        v30 = false;
                        if not v41 then
                            l_v21_0 = table.concat(v21, ".");
                            l_l_l_dataModelPatchService_0_Patch_0_0 = l_loggingProtocol_0;
                            local l_MissingPatchRoot_0 = l_Events_0.MissingPatchRoot;
                            local l_v18_1 = v18;
                            v1.sendTelemetryEvent(l_l_l_dataModelPatchService_0_Patch_0_0, l_MissingPatchRoot_0, {
                                patchName = l_v18_1, 
                                extraMessage = l_v21_0
                            });
                            return nil;
                        else
                            assert(v41, "otaPackagesRoot is nil");
                            if v22 then
                                l_l_l_dataModelPatchService_0_Patch_0_0 = v22;
                                local l_l_l_dataModelPatchService_0_Patch_0_1 = l_l_dataModelPatchService_0_Patch_0;
                                for _, v48 in l_l_l_dataModelPatchService_0_Patch_0_0 do
                                    l_l_l_dataModelPatchService_0_Patch_0_1 = l_l_l_dataModelPatchService_0_Patch_0_1:FindFirstChild(v48, false);
                                    if not l_l_l_dataModelPatchService_0_Patch_0_1 then
                                        l_v21_0 = nil;
                                        v31 = true;
                                    end;
                                    if v31 then
                                        break;
                                    end;
                                end;
                                if not v31 then
                                    l_v21_0 = l_l_l_dataModelPatchService_0_Patch_0_1;
                                end;
                                v31 = false;
                                if l_v21_0 then
                                    l_l_l_dataModelPatchService_0_Patch_0_0 = tick();
                                    if l_FFlagLuaAppBetterOtaPackageError_0 then
                                        l_l_l_dataModelPatchService_0_Patch_0_1 = require(l_v21_0);
                                        if l_l_l_dataModelPatchService_0_Patch_0_1 then
                                            l_l_l_dataModelPatchService_0_Patch_0_1();
                                        end;
                                    else
                                        l_l_l_dataModelPatchService_0_Patch_0_1 = require(l_v21_0);
                                    end;
                                    l_l_l_dataModelPatchService_0_Patch_0_1 = tick() - l_l_l_dataModelPatchService_0_Patch_0_0;
                                    v1.logCheckpointRequireStarter(l_loggingProtocol_0, l_l_l_dataModelPatchService_0_Patch_0_1, {
                                        patchName = v18
                                    });
                                end;
                            end;
                            return v41;
                        end;
                    end;
                end);
                if l_status_0 and l_result_0 then
                    local l_PatchLoadedOk_0 = l_Events_0.PatchLoadedOk;
                    v1.sendTelemetryEvent(l_loggingProtocol_0, l_PatchLoadedOk_0, {
                        patchName = v18, 
                        extraMessage = nil
                    });
                    v5[v27] = l_result_0;
                    return l_result_0;
                else
                    if not l_status_0 then
                        local l_PatchLoadError_0 = l_Events_0.PatchLoadError;
                        local v53 = tostring(l_result_0);
                        v1.sendTelemetryEvent(l_loggingProtocol_0, l_PatchLoadError_0, {
                            patchName = v18, 
                            extraMessage = v53
                        });
                    else
                        local l_PatchLoadFailed_0 = l_Events_0.PatchLoadFailed;
                        v1.sendTelemetryEvent(l_loggingProtocol_0, l_PatchLoadFailed_0, {
                            patchName = v18, 
                            extraMessage = nil
                        });
                    end;
                    v5[v27] = "NONE";
                    return nil;
                end;
            end;
        end;
    end;
end;