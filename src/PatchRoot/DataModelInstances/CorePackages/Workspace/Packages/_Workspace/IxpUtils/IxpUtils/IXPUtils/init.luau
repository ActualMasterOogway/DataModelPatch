local l_IXPService_0 = game:GetService("IXPService");
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.ArgCheck);
local l_Symbol_0 = require(l_Parent_0.AppCommonLib).Symbol;
local v4 = require(l_Parent_0.Dash);
local v5 = require(l_Parent_0.React);
local v6 = require(l_Parent_0.RoactAppExperiment);
local l_useUserExperiment_0 = v6.useUserExperiment;
local l_ExperimentCacheManager_0 = require(l_Parent_0.ExperimentCacheManager).ExperimentCacheManager;
local v9 = game:DefineFastFlag("AXDefaultRecordExposureFalse", false);
local v10 = require(l_Parent_0.AppDebug).LogTree.logger("ax.ixp");
local v11 = l_Symbol_0.named("NO_VALUE");
local l_l_IXPService_0_0 = l_IXPService_0;
local l_connectUserLayer_0 = v6.connectUserLayer;
local l_default_0 = l_ExperimentCacheManager_0.default;
local v19 = {
    defineIXPTest = function(v15) --[[ Line: 205 ]] --[[ Name: defineIXPTest ]]
        -- upvalues: v9 (copy), v10 (copy), v11 (copy)
        local v16 = {
            name = v15.name, 
            layer = v15.layer, 
            recordExposure = if v9 then if v15.recordExposure then v15.recordExposure else false else v15.recordExposure ~= false, 
            getIsUserInExperiment = v15.getIsUserInExperiment, 
            isEnabled = function() --[[ Line: 217 ]] --[[ Name: isEnabled ]]
                -- upvalues: v15 (copy)
                return v15.getDependentFlagsEnabled() and (v15.getEnabledFlag() or v15.getEnabledForAllFlag());
            end, 
            isEnabledForAll = function() --[[ Line: 222 ]] --[[ Name: isEnabledForAll ]]
                -- upvalues: v15 (copy)
                return v15.getDependentFlagsEnabled() and v15.getEnabledForAllFlag();
            end
        };
        v10:info("[Define IXP Test] {}, layer: {}, isEnabled: {}, isEnabledForAll: {}", v16.name, v16.layer, v16.isEnabled(), v16.isEnabledForAll());
        for v17, v18 in v15.variables do
            v16[v17] = {
                name = v17, 
                ixpTest = v16, 
                mapLayerToValue = v18, 
                lastValue = v11
            };
        end;
        return v16;
    end
};
local function v21(v20) --[[ Line: 249 ]] --[[ Name: readLayerVariablesForTest ]]
    -- upvalues: l_l_IXPService_0_0 (ref), l_default_0 (ref)
    v20.usedExperimentCacheManager = v20.usedExperimentCacheManager or l_l_IXPService_0_0:GetUserStatusForLayer(v20.layer) ~= Enum.IXPLoadingStatus.Initialized;
    return (if v20.usedExperimentCacheManager then l_default_0:getLayerVariables(v20.layer) else l_l_IXPService_0_0:GetUserLayerVariables(v20.layer)) or {};
end;
local function v26(v22, v23) --[[ Line: 260 ]] --[[ Name: mapTestVariable ]]
    -- upvalues: v21 (copy), v10 (copy)
    local l_ixpTest_0 = v22.ixpTest;
    if not v23 then
        v23 = v21(l_ixpTest_0);
    end;
    local v25 = v22.mapLayerToValue(v23, l_ixpTest_0.isEnabledForAll());
    if v25 ~= v22.lastValue then
        v10:info("[Read IXP Variable] {} {} = {}", l_ixpTest_0.name, v22.name, v25);
        v22.lastValue = v25;
    end;
    return v25;
end;
local function _(v27, v28) --[[ Line: 273 ]] --[[ Name: accessLayer ]]
    if v27.usedExperimentCacheManager then
        return nil;
    else
        return v28[v27.layer];
    end;
end;
local function v39(v30, v31, v32) --[[ Line: 281 ]] --[[ Name: doConnectTestVariables ]]
    -- upvalues: l_connectUserLayer_0 (ref), v26 (copy)
    return l_connectUserLayer_0(v31, function(v33) --[[ Line: 286 ]]
        -- upvalues: v30 (copy), v26 (ref)
        local v34 = {};
        for v35, v36 in v30 do
            local l_ixpTest_1 = v36.ixpTest;
            if l_ixpTest_1.isEnabled() then
                local v38 = if l_ixpTest_1.usedExperimentCacheManager then nil else v33[l_ixpTest_1.layer];
                v34[v35] = v26(v36, v38);
            end;
        end;
        return v34;
    end, v32);
end;
v19.connectTestVariables = function(v40) --[[ Line: 313 ]] --[[ Name: connectTestVariables ]]
    -- upvalues: v4 (copy), v39 (copy)
    local v41 = {};
    local v42 = {};
    local v43 = {};
    local v44 = {};
    for v45, v46 in v40 do
        local l_ixpTest_2 = v46.ixpTest;
        if l_ixpTest_2.recordExposure then
            v42[l_ixpTest_2.layer] = true;
            v44[v45] = v46;
        else
            v41[l_ixpTest_2.layer] = true;
            v43[v45] = v46;
        end;
    end;
    local v48 = {};
    local v49 = v4.keys(v41);
    if #v49 > 0 then
        table.sort(v49);
        table.insert(v48, v39(v43, v49, false));
    end;
    local v50 = v4.keys(v42);
    if #v50 > 0 then
        table.sort(v50);
        table.insert(v48, v39(v44, v50, true));
    end;
    return v4.compose(table.unpack(v48));
end;
v19.useTestVariables = function(...) --[[ Line: 355 ]] --[[ Name: useTestVariables ]]
    -- upvalues: v2 (copy), l_useUserExperiment_0 (copy), v26 (copy)
    local v51 = {
        ...
    };
    local v52 = nil;
    for _, v54 in v51 do
        if v52 then
            v2.assert(v54.ixpTest == v52, "All test variables passed to IXPUtils.useTestVariables must belong to same IXP test.");
        else
            v52 = v54.ixpTest;
        end;
    end;
    return l_useUserExperiment_0({
        v52.layer
    }, function(v55) --[[ Line: 369 ]]
        -- upvalues: v52 (ref), v51 (copy), v26 (ref)
        local l_v52_0 = v52;
        local v57 = if l_v52_0.usedExperimentCacheManager then nil else v55[l_v52_0.layer];
        l_v52_0 = {};
        for v58, v59 in v51 do
            if v52.isEnabled() then
                l_v52_0[v58] = v26(v59, v57);
            end;
        end;
        return table.unpack(l_v52_0);
    end, v52.recordExposure);
end;
local function _(v60, v61) --[[ Line: 383 ]] --[[ Name: readTestVariableImpl ]]
    -- upvalues: v26 (copy)
    local l_ixpTest_3 = v60.ixpTest;
    if not l_ixpTest_3.isEnabled() then
        return nil;
    else
        local v63 = if v61 then v61[l_ixpTest_3.layer] else nil;
        return (v26(v60, v63));
    end;
end;
v19.readTestVariable = function(v65) --[[ Line: 398 ]] --[[ Name: readTestVariable ]]
    -- upvalues: v21 (copy), v10 (copy)
    if not v65.ixpTest.isEnabled() then
        return nil;
    else
        local v66 = nil;
        local l_ixpTest_4 = v65.ixpTest;
        if not v66 then
            v66 = v21(l_ixpTest_4);
        end;
        local v68 = v65.mapLayerToValue(v66, l_ixpTest_4.isEnabledForAll());
        if v68 ~= v65.lastValue then
            v10:info("[Read IXP Variable] {} {} = {}", l_ixpTest_4.name, v65.name, v68);
            v65.lastValue = v68;
        end;
        return v68;
    end;
end;
v19.getFromLayers = function(v69, v70) --[[ Line: 408 ]] --[[ Name: getFromLayers ]]
    -- upvalues: v26 (copy)
    local l_ixpTest_5 = v70.ixpTest;
    if not l_ixpTest_5.isEnabled() then
        return nil;
    else
        local v72 = if v69 then v69[l_ixpTest_5.layer] else nil;
        return (v26(v70, v72));
    end;
end;
v19.logExposure = function(v73) --[[ Line: 412 ]] --[[ Name: logExposure ]]
    -- upvalues: v10 (copy), l_l_IXPService_0_0 (ref)
    v10:debug("LogUserLayerExposure: {}", v73.layer);
    l_l_IXPService_0_0:LogUserLayerExposure(v73.layer);
end;
v19.logExperimentExposure = function(v74) --[[ Line: 421 ]] --[[ Name: logExperimentExposure ]]
    -- upvalues: v10 (copy), v21 (copy), l_l_IXPService_0_0 (ref)
    v10:debug("LogExperimentExposure: {}", v74.layer);
    if v74.isEnabled() and v74.getIsUserInExperiment and v74.getIsUserInExperiment((v21(v74))) then
        l_l_IXPService_0_0:LogUserLayerExposure(v74.layer);
        return true;
    else
        return false;
    end;
end;
v19.useLogExposureOnce = function(v75) --[[ Line: 439 ]] --[[ Name: useLogExposureOnce ]]
    -- upvalues: v5 (copy), v19 (copy)
    local v76 = v5.useRef(false);
    return v5.useCallback(function() --[[ Line: 442 ]]
        -- upvalues: v76 (copy), v19 (ref), v75 (copy)
        if not v76.current then
            v19.logExposure(v75);
            v76.current = true;
        end;
    end, {
        v75.layer
    });
end;
v19.setMocksForTesting = function(v77, v78, v79) --[[ Line: 450 ]] --[[ Name: setMocksForTesting ]]
    -- upvalues: l_l_IXPService_0_0 (ref), l_connectUserLayer_0 (ref), l_default_0 (ref)
    l_l_IXPService_0_0 = v77 or l_l_IXPService_0_0;
    l_connectUserLayer_0 = v78 or l_connectUserLayer_0;
    l_default_0 = v79 or l_default_0;
end;
v19.restoreDefaultsAfterTesting = function() --[[ Line: 456 ]] --[[ Name: restoreDefaultsAfterTesting ]]
    -- upvalues: l_l_IXPService_0_0 (ref), l_IXPService_0 (copy), l_connectUserLayer_0 (ref), v6 (copy), l_default_0 (ref), l_ExperimentCacheManager_0 (copy)
    l_l_IXPService_0_0 = l_IXPService_0;
    l_connectUserLayer_0 = v6.connectUserLayer;
    l_default_0 = l_ExperimentCacheManager_0.default;
end;
return v19;