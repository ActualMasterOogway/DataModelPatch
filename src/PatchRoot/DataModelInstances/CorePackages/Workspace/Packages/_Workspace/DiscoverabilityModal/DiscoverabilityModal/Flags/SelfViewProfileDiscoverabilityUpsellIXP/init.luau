game:DefineFastFlag("SelfViewProfileDiscoverabilityUpsellIXPSetupEnabled_v1", false);
game:DefineFastFlag("SelfViewProfileDiscoverabilityUpsellEnabledForAll", false);
game:DefineFastFlag("SelfViewProfileDiscoverabilityUpsellIXPEnabled", false);
game:DefineFastInt("SelfViewProfileDiscoverabilityUpsellRolloutEnabled", 0);
local l_script_FirstAncestor_0 = script:FindFirstAncestor("DiscoverabilityModal");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_rolloutByApplicationId_0 = v1.rolloutByApplicationId;
local l_getFStringSocialProfileLayer_0 = v1.getFStringSocialProfileLayer;
local function v4() --[[ Line: 12 ]]
    return game:GetFastInt("SelfViewProfileDiscoverabilityUpsellRolloutEnabled");
end;
local function v5() --[[ Line: 16 ]] --[[ Name: selfViewProfileDiscoverabilityUpsellIXPSetupEnabled ]]
    return game:GetFastFlag("SelfViewProfileDiscoverabilityUpsellIXPSetupEnabled_v1");
end;
local function _() --[[ Line: 20 ]] --[[ Name: selfViewProfileDiscoverabilityUpsellRolloutEnabled ]]
    -- upvalues: l_rolloutByApplicationId_0 (copy), v4 (copy)
    return l_rolloutByApplicationId_0(v4)();
end;
local function _() --[[ Line: 24 ]] --[[ Name: selfViewProfileDiscoverabilityUpsellExperimentEnabled ]]
    return game:GetFastFlag("SelfViewProfileDiscoverabilityUpsellIXPEnabled");
end;
local function _() --[[ Line: 28 ]] --[[ Name: selfViewProfileDiscoverabilityUpsellEnabledForAll ]]
    return game:GetFastFlag("SelfViewProfileDiscoverabilityUpsellEnabledForAll");
end;
return {
    SetupEnabled = v5, 
    experimentOrRolloutEnabled = function(v9) --[[ Line: 34 ]] --[[ Name: experimentOrRolloutEnabled ]]
        -- upvalues: l_getFStringSocialProfileLayer_0 (copy), l_rolloutByApplicationId_0 (copy), v4 (copy)
        if game:GetFastFlag("SelfViewProfileDiscoverabilityUpsellIXPSetupEnabled_v1") then
            local v10 = v9[l_getFStringSocialProfileLayer_0()] or {
                show_discoverability_upsell_profile_view = "False"
            };
            return game:GetFastFlag("SelfViewProfileDiscoverabilityUpsellIXPEnabled") and v10.show_discoverability_upsell_profile_view == "True" or l_rolloutByApplicationId_0(v4)() or game:GetFastFlag("SelfViewProfileDiscoverabilityUpsellEnabledForAll");
        else
            return false;
        end;
    end
};