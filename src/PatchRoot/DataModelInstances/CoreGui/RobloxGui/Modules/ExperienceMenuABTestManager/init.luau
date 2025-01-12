local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local _ = script.Parent.InGameMenu;
local v5 = require(l_RobloxGui_0.Modules.Common.IXPServiceWrapper);
local v6 = require(script.Parent.IsExperienceMenuABTestEnabled);
local l_GetFStringLuaAppExperienceMenuLayer_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFStringLuaAppExperienceMenuLayer;
local v8 = require(script.Parent.Flags.GetFStringLuaAppConsoleExperienceMenuLayer);
local v9 = require(script.Parent.Flags.GetFFlagDisableChromeUnibar)();
local v10 = require(script.Parent.Flags.GetFFlagDisableChromePinnedChat)();
local v11 = require(script.Parent.Flags.GetFFlagDisableChromeDefaultOpen)();
local v12 = require(script.Parent.Flags.GetFFlagDisableChromeFollowupUnibar)();
local v13 = require(script.Parent.Flags.GetFFlagDisableChromeFollowupFTUX)();
local v14 = require(script.Parent.Flags.GetFFlagDisableChromeFollowupOcclusion)();
local v15 = require(script.Parent.Flags.GetFFlagDisableChromeV3Baseline)();
local v16 = require(script.Parent.Flags.GetFFlagDisableChromeV3Captures)();
local v17 = require(script.Parent.Flags.GetFFlagDisableChromeV3StaticSelfView)();
local v18 = require(script.Parent.Flags.GetFFlagDisableChromeV3Icon)();
local v19 = require(script.Parent.Flags.GetFFlagDisableChromeV3DockedMic)();
local v20 = require(script.Parent.Flags.GetFFlagDisableChromeV4Baseline)();
local v21 = require(script.Parent.Flags.GetFFlagDisableChromeV4ClosedSelfView)();
local l_GetFFlagSetupSongbirdWindowExperiment_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagSetupSongbirdWindowExperiment;
local v23 = game:DefineFastInt("CSATV3MenuActionThreshold", 7);
local v24 = l_GetFFlagSetupSongbirdWindowExperiment_0() and "s2" or "s1";
local v25 = "v1" .. "t10";
local v26 = "v2" .. "t10";
local v27 = "v3" .. "t10";
local v28 = "ARv2" .. "art2";
local v29 = {
    UNIBAR = "v6.1" .. "t10", 
    PINNED_CHAT = "v6.2" .. "t10", 
    DEFAULT_OPEN = "v6.3" .. "t10"
};
local v30 = {
    UNIBAR = "v7.1.1" .. "t10", 
    FTUX = "v7.2.1" .. "t10", 
    OCCLUSION = "v7.3" .. "t10"
};
local v31 = {
    BASELINE = "v8.1" .. "t10", 
    CAPTURES = "v8.2" .. "t10", 
    STATIC_SELF_VIEW = "v8.3" .. "t10", 
    ICON = "v8.4" .. "t10", 
    DOCKED_MIC = "v8.5" .. "t10"
};
local v32 = {
    SONGBIRD = "v9.1" .. v24, 
    SONGBIRD_UNIBAR = "v9.2" .. v24, 
    SONGBIRD_PEEK = "v9.3" .. v24, 
    SONGBIRD_SCENE_ANALYSIS = "v9.4" .. v24
};
local v33 = {
    BASELINE = "v10.1", 
    CLOSED_SELF_VIEW = "v10.2"
};
local v34 = {
    [v25] = true, 
    [v26] = false, 
    [v27] = false, 
    [v29.UNIBAR] = not v9, 
    [v29.PINNED_CHAT] = not v10, 
    [v29.DEFAULT_OPEN] = not v11, 
    [v28] = false, 
    [v30.UNIBAR] = not v12, 
    [v30.FTUX] = not v13, 
    [v30.OCCLUSION] = not v14, 
    [v32.SONGBIRD] = true, 
    [v32.SONGBIRD_UNIBAR] = true, 
    [v32.SONGBIRD_PEEK] = true, 
    [v32.SONGBIRD_SCENE_ANALYSIS] = not l_GetFFlagSetupSongbirdWindowExperiment_0() or false, 
    [v31.BASELINE] = not v15, 
    [v31.CAPTURES] = not v16, 
    [v31.STATIC_SELF_VIEW] = not v17, 
    [v31.ICON] = not v18, 
    [v31.DOCKED_MIC] = not v19, 
    ["v10.0"] = true, 
    [v33.BASELINE] = not v20, 
    [v33.CLOSED_SELF_VIEW] = not v21
};
local v35 = {};
v35.__index = v35;
v35.getCachedVersion = function() --[[ Line: 117 ]] --[[ Name: getCachedVersion ]]
    -- upvalues: l_AppStorageService_0 (copy), v34 (copy)
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 119 ]]
        -- upvalues: l_AppStorageService_0 (ref)
        return l_AppStorageService_0:GetItem("ExperienceMenuVersion");
    end);
    if l_status_0 and l_result_0 ~= "" and v34[l_result_0] then
        return l_result_0;
    else
        return nil;
    end;
end;
v35.getCSATQualificationThreshold = function() --[[ Line: 132 ]] --[[ Name: getCSATQualificationThreshold ]]
    -- upvalues: v23 (copy)
    return v23;
end;
v35.v1VersionId = function() --[[ Line: 136 ]] --[[ Name: v1VersionId ]]
    -- upvalues: v25 (copy)
    return v25;
end;
v35.v2VersionId = function() --[[ Line: 140 ]] --[[ Name: v2VersionId ]]
    -- upvalues: v26 (copy)
    return v26;
end;
v35.v3VersionId = function() --[[ Line: 144 ]] --[[ Name: v3VersionId ]]
    -- upvalues: v27 (copy)
    return v27;
end;
v35.reportAbuseMenuV2VersionId = function() --[[ Line: 148 ]] --[[ Name: reportAbuseMenuV2VersionId ]]
    -- upvalues: v28 (copy)
    return v28;
end;
v35.chromeVersionId = function() --[[ Line: 152 ]] --[[ Name: chromeVersionId ]]
    -- upvalues: v29 (copy)
    return v29.UNIBAR;
end;
v35.chromePinnedChatVersionId = function() --[[ Line: 156 ]] --[[ Name: chromePinnedChatVersionId ]]
    -- upvalues: v29 (copy)
    return v29.PINNED_CHAT;
end;
v35.chromeDefaultOpenVersionId = function() --[[ Line: 160 ]] --[[ Name: chromeDefaultOpenVersionId ]]
    -- upvalues: v29 (copy)
    return v29.DEFAULT_OPEN;
end;
v35.chromeFollowupVersionId = function() --[[ Line: 164 ]] --[[ Name: chromeFollowupVersionId ]]
    -- upvalues: v30 (copy)
    return v30.UNIBAR;
end;
v35.chromeFTUXVersionId = function() --[[ Line: 168 ]] --[[ Name: chromeFTUXVersionId ]]
    -- upvalues: v30 (copy)
    return v30.FTUX;
end;
v35.chromeOcclusionVersionId = function() --[[ Line: 172 ]] --[[ Name: chromeOcclusionVersionId ]]
    -- upvalues: v30 (copy)
    return v30.OCCLUSION;
end;
v35.chromeV3BaselineVersionId = function() --[[ Line: 176 ]] --[[ Name: chromeV3BaselineVersionId ]]
    -- upvalues: v31 (copy)
    return v31.BASELINE;
end;
v35.chromeCapturesVersionId = function() --[[ Line: 180 ]] --[[ Name: chromeCapturesVersionId ]]
    -- upvalues: v31 (copy)
    return v31.CAPTURES;
end;
v35.chromeStaticSelfViewVersionId = function() --[[ Line: 184 ]] --[[ Name: chromeStaticSelfViewVersionId ]]
    -- upvalues: v31 (copy)
    return v31.STATIC_SELF_VIEW;
end;
v35.chromeIconVersionId = function() --[[ Line: 188 ]] --[[ Name: chromeIconVersionId ]]
    -- upvalues: v31 (copy)
    return v31.ICON;
end;
v35.chromeDockedMicVersionId = function() --[[ Line: 192 ]] --[[ Name: chromeDockedMicVersionId ]]
    -- upvalues: v31 (copy)
    return v31.DOCKED_MIC;
end;
v35.chromeV4ControlVersionId = function() --[[ Line: 196 ]] --[[ Name: chromeV4ControlVersionId ]]
    return "v10.0";
end;
v35.chromeV4BaselineVersionId = function() --[[ Line: 200 ]] --[[ Name: chromeV4BaselineVersionId ]]
    -- upvalues: v33 (copy)
    return v33.BASELINE;
end;
v35.chromeV4ClosedSelfViewVersionId = function() --[[ Line: 204 ]] --[[ Name: chromeV4ClosedSelfViewVersionId ]]
    -- upvalues: v33 (copy)
    return v33.CLOSED_SELF_VIEW;
end;
v35.chromeSongbirdVersionId = function() --[[ Line: 208 ]] --[[ Name: chromeSongbirdVersionId ]]
    -- upvalues: v32 (copy)
    return v32.SONGBIRD;
end;
v35.chromeSongbirdUnibarVersionId = function() --[[ Line: 212 ]] --[[ Name: chromeSongbirdUnibarVersionId ]]
    -- upvalues: v32 (copy)
    return v32.SONGBIRD_UNIBAR;
end;
v35.chromeSongbirdPeekVersionId = function() --[[ Line: 216 ]] --[[ Name: chromeSongbirdPeekVersionId ]]
    -- upvalues: v32 (copy)
    return v32.SONGBIRD_PEEK;
end;
if not l_GetFFlagSetupSongbirdWindowExperiment_0() then
    v35.sceneAnalysisVersionId = function() --[[ Line: 221 ]] --[[ Name: sceneAnalysisVersionId ]]
        -- upvalues: v32 (copy)
        return v32.SONGBIRD_SCENE_ANALYSIS;
    end;
end;
parseCountData = function(v38) --[[ Line: 226 ]] --[[ Name: parseCountData ]]
    if not v38 or typeof(v38) ~= "string" then
        return nil, nil;
    else
        local v39 = v38:split(":");
        return v39[1], v39[2];
    end;
end;
v35.new = function(v40) --[[ Line: 234 ]] --[[ Name: new ]]
    -- upvalues: v5 (copy), v35 (copy)
    local v41 = {
        _currentMenuVersion = nil, 
        _currentMenuVersionIsDefault = false, 
        _isCSATQualified = nil, 
        _ixpServiceWrapper = v40 or v5
    };
    setmetatable(v41, v35);
    return v41;
end;
v35.getVersion = function(v42) --[[ Line: 245 ]] --[[ Name: getVersion ]]
    -- upvalues: v6 (copy), v25 (copy)
    if not v6() then
        return v25;
    else
        if not v42._currentMenuVersion then
            local v43 = v42.getCachedVersion();
            if v43 ~= nil and v43 ~= "" then
                v42._currentMenuVersion = v43;
            else
                v42._currentMenuVersionIsDefault = true;
                v42._currentMenuVersion = v25;
            end;
        end;
        return v42._currentMenuVersion;
    end;
end;
v35.isV2MenuEnabled = function(v44) --[[ Line: 264 ]] --[[ Name: isV2MenuEnabled ]]
    -- upvalues: v26 (copy)
    return v44:getVersion() == v26;
end;
v35.isV3MenuEnabled = function(v45) --[[ Line: 268 ]] --[[ Name: isV3MenuEnabled ]]
    -- upvalues: v27 (copy)
    return v45:getVersion() == v27;
end;
v35.isReportAbuseMenuV2Enabled = function(v46) --[[ Line: 272 ]] --[[ Name: isReportAbuseMenuV2Enabled ]]
    -- upvalues: v28 (copy)
    return v46:getVersion() == v28;
end;
v35.isChromeEnabled = function(v47) --[[ Line: 276 ]] --[[ Name: isChromeEnabled ]]
    -- upvalues: v33 (copy), v31 (copy), v29 (copy), v30 (copy), v32 (copy), l_GetFFlagSetupSongbirdWindowExperiment_0 (copy)
    if v47:getVersion() == "v10.0" then
        return false;
    else
        for _, v49 in v33 do
            if v47:getVersion() == v49 then
                return true;
            end;
        end;
        for _, v51 in v31 do
            if v47:getVersion() == v51 then
                return true;
            end;
        end;
        for _, v53 in v29 do
            if v47:getVersion() == v53 then
                return true;
            end;
        end;
        for _, v55 in v30 do
            if v47:getVersion() == v55 then
                return true;
            end;
        end;
        for _, v57 in v32 do
            if (l_GetFFlagSetupSongbirdWindowExperiment_0() or v57 ~= v47.sceneAnalysisVersionId()) and v47:getVersion() == v57 then
                return true;
            end;
        end;
        return false;
    end;
end;
v35.shouldShowFTUX = function(v58) --[[ Line: 323 ]] --[[ Name: shouldShowFTUX ]]
    -- upvalues: v30 (copy)
    return v58:getVersion() == v30.FTUX;
end;
v35.shouldShowCaptures = function(v59) --[[ Line: 327 ]] --[[ Name: shouldShowCaptures ]]
    -- upvalues: v31 (copy)
    return v59:getVersion() == v31.CAPTURES;
end;
v35.shouldShowStaticSelfView = function(v60) --[[ Line: 331 ]] --[[ Name: shouldShowStaticSelfView ]]
    -- upvalues: v31 (copy)
    return v60:getVersion() == v31.STATIC_SELF_VIEW;
end;
v35.shouldShowNewIcon = function(v61) --[[ Line: 335 ]] --[[ Name: shouldShowNewIcon ]]
    -- upvalues: v31 (copy)
    return v61:getVersion() == v31.ICON;
end;
v35.shouldDockMic = function(v62) --[[ Line: 339 ]] --[[ Name: shouldDockMic ]]
    -- upvalues: v31 (copy)
    return v62:getVersion() == v31.DOCKED_MIC;
end;
v35.shouldCloseSelfViewAtStartup = function(v63) --[[ Line: 342 ]] --[[ Name: shouldCloseSelfViewAtStartup ]]
    -- upvalues: v33 (copy)
    return v63:getVersion() == v33.CLOSED_SELF_VIEW;
end;
if not l_GetFFlagSetupSongbirdWindowExperiment_0() then
    v35.shouldEnableSceneAnalysis = function(v64) --[[ Line: 347 ]] --[[ Name: shouldEnableSceneAnalysis ]]
        -- upvalues: v32 (copy)
        local v65 = v64:getVersion();
        local v66 = true;
        if v65 ~= v32.SONGBIRD then
            v66 = true;
            if v65 ~= v32.SONGBIRD_SCENE_ANALYSIS then
                v66 = true;
                if v65 ~= v32.SONGBIRD_UNIBAR then
                    v66 = v65 == v32.SONGBIRD_PEEK;
                end;
            end;
        end;
        return v66;
    end;
end;
v35.shouldShowSongbirdUnibar = function(v67) --[[ Line: 356 ]] --[[ Name: shouldShowSongbirdUnibar ]]
    -- upvalues: v32 (copy)
    local v68 = v67:getVersion();
    local v69 = true;
    if v68 ~= v32.SONGBIRD then
        v69 = v68 == v32.SONGBIRD_UNIBAR;
    end;
    return v69;
end;
v35.shouldShowSongbirdPeek = function(v70) --[[ Line: 361 ]] --[[ Name: shouldShowSongbirdPeek ]]
    -- upvalues: v32 (copy)
    local v71 = v70:getVersion();
    local v72 = true;
    if v71 ~= v32.SONGBIRD then
        v72 = v71 == v32.SONGBIRD_PEEK;
    end;
    return v72;
end;
v35.initialize = function(v73) --[[ Line: 367 ]] --[[ Name: initialize ]]
    -- upvalues: v6 (copy), l_GetFStringLuaAppExperienceMenuLayer_0 (copy), v8 (copy), l_AppStorageService_0 (copy)
    if not v6() then
        return;
    else
        local l_status_1, l_result_1 = pcall(function() --[[ Line: 373 ]]
            -- upvalues: v73 (copy), l_GetFStringLuaAppExperienceMenuLayer_0 (ref)
            return v73._ixpServiceWrapper:GetLayerData(l_GetFStringLuaAppExperienceMenuLayer_0());
        end);
        local l_status_2, l_result_2 = pcall(function() --[[ Line: 376 ]]
            -- upvalues: v73 (copy), v8 (ref)
            return v73._ixpServiceWrapper:GetLayerData(v8());
        end);
        if not l_status_1 and not l_status_2 then
            return;
        else
            if not v73._currentMenuVersion then
                v73._currentMenuVersion = v73.getCachedVersion();
            end;
            if l_result_1 and l_result_2 then
                if l_result_2.menuVersion and not l_result_1.menuVersion then
                    if l_result_2.menuVersion ~= v73._currentMenuVersion or v73._currentMenuVersionIsDefault then
                        pcall(function() --[[ Line: 394 ]]
                            -- upvalues: l_AppStorageService_0 (ref), l_result_2 (copy)
                            l_AppStorageService_0:SetItem("ExperienceMenuVersion", l_result_2.menuVersion);
                            l_AppStorageService_0:Flush();
                        end);
                        return;
                    end;
                elseif l_result_1.menuVersion ~= v73._currentMenuVersion or v73._currentMenuVersionIsDefault then
                    pcall(function() --[[ Line: 400 ]]
                        -- upvalues: l_AppStorageService_0 (ref), l_result_1 (copy)
                        l_AppStorageService_0:SetItem("ExperienceMenuVersion", l_result_1.menuVersion or "");
                        l_AppStorageService_0:Flush();
                    end);
                end;
            end;
            return;
        end;
    end;
end;
v35.default = v35.new();
return v35;