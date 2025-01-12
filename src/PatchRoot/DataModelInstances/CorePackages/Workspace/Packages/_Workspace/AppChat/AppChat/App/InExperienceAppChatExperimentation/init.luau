local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.SharedFlags);
local l_GetFFlagEnableAppChatInExperience_0 = v2.GetFFlagEnableAppChatInExperience;
local l_getFStringAppChatInExperienceIXPLayer_0 = v2.getFStringAppChatInExperienceIXPLayer;
local l_ExperimentCacheManager_0 = require(l_Parent_0.ExperimentCacheManager).ExperimentCacheManager;
local v6 = require(l_script_FirstAncestor_0.App.Constants);
local v7 = game:DefineFastString("DebugInExperienceAppChatIXPVariant", "None");
local v8 = {};
v8.__index = v8;
v8.new = function() --[[ Line: 40 ]] --[[ Name: new ]]
    -- upvalues: v8 (copy)
    local v9 = {
        initialized = false, 
        variant = {}, 
        cachedShouldUseIndependentAppChatContainer = nil
    };
    setmetatable(v9, v8);
    return v9;
end;
v8.initialize = function(v10) --[[ Line: 52 ]] --[[ Name: initialize ]]
    -- upvalues: l_ExperimentCacheManager_0 (copy), l_getFStringAppChatInExperienceIXPLayer_0 (copy), v7 (copy), v6 (copy)
    local v11 = l_ExperimentCacheManager_0.default:getLayerVariables(l_getFStringAppChatInExperienceIXPLayer_0());
    if v11 ~= nil then
        v10.initialized = true;
        v10.variant = table.clone(v11);
    end;
    if v7 ~= "None" then
        v10.initialized = true;
        v10.variant = v6.InExperienceAppChatVariants[v7] or v10.variant;
    end;
    if v10.initialized then
        v10:logLayerExposure();
    end;
end;
v8.logLayerExposure = function(_) --[[ Line: 72 ]] --[[ Name: logLayerExposure ]]
    -- upvalues: l_ExperimentCacheManager_0 (copy), l_getFStringAppChatInExperienceIXPLayer_0 (copy)
    l_ExperimentCacheManager_0.default:logLayerExposure(l_getFStringAppChatInExperienceIXPLayer_0());
end;
v8.getHasInExperienceAppChatEntryPoint = function() --[[ Line: 77 ]] --[[ Name: getHasInExperienceAppChatEntryPoint ]]
    -- upvalues: v8 (copy)
    return v8.default.variant.ShowPlatformChatTiltMenuEntryPoint2 or v8.default.variant.ShowPlatformChatChromeUnibarEntryPoint or v8.default.variant.ShowPlatformChatChromeDropdownEntryPoint;
end;
v8.getShowPlatformChatInChrome = function() --[[ Line: 84 ]] --[[ Name: getShowPlatformChatInChrome ]]
    -- upvalues: v8 (copy)
    return v8.default.variant.ShowPlatformChatChromeUnibarEntryPoint or v8.default.variant.ShowPlatformChatChromeDropdownEntryPoint;
end;
v8.shouldUseIndependentAppChatContainer = function(v13) --[[ Line: 89 ]] --[[ Name: shouldUseIndependentAppChatContainer ]]
    -- upvalues: v8 (copy)
    if v13.cachedShouldUseIndependentAppChatContainer == nil then
        v13.cachedShouldUseIndependentAppChatContainer = v8.default.getShowPlatformChatInChrome() == true;
    end;
    return v13.cachedShouldUseIndependentAppChatContainer;
end;
v8.default = if l_GetFFlagEnableAppChatInExperience_0() then v8.new() else nil;
return v8;