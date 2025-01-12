local l_Parent_0 = script:FindFirstAncestor("GameCollections").Parent;
local l_useUserExperiment_0 = require(l_Parent_0.RoactAppExperiment).useUserExperiment;
local l_AppUserLayers_0 = require(l_Parent_0.ExperimentLayers).AppUserLayers;
local l_useUiModeInfo_0 = require(l_Parent_0.RobloxAppHooks).useUiModeInfo;
local l_UiMode_0 = require(l_Parent_0.RobloxAppEnums).UiMode;
local v5 = require(l_Parent_0.Responsive);
return function() --[[ Line: 10 ]] --[[ Name: useIsHoldToPlayEnabledForGames ]]
    -- upvalues: l_useUserExperiment_0 (copy), l_AppUserLayers_0 (copy), v5 (copy), l_useUiModeInfo_0 (copy), l_UiMode_0 (copy)
    local v7 = l_useUserExperiment_0({
        l_AppUserLayers_0.PlatformExcellenceQualityImprovementConsoles
    }, function(v6) --[[ Line: 13 ]]
        -- upvalues: l_AppUserLayers_0 (ref)
        return (v6[l_AppUserLayers_0.PlatformExcellenceQualityImprovementConsoles] or {}).enableHoldToPlay;
    end);
    local v8 = v5.useLastInput();
    local v9 = l_useUiModeInfo_0();
    return v7 and v8 == v5.Input.Directional and v9.uiMode == l_UiMode_0.TenFoot;
end;