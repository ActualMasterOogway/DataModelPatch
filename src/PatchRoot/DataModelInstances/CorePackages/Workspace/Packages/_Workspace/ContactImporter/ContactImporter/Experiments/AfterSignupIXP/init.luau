local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_IXPService_0 = game:GetService("IXPService");
local l_useUserExperiment_0 = require(l_Parent_1.RoactAppExperiment).useUserExperiment;
local v4 = require(l_Parent_0.Flags.FStringPVCIAfterSignupLayer);
local v5 = require(l_Parent_0.Flags.FStringPVCIAfterSignupVariantKey);
local v6 = game:DefineFastFlag("PVAndCIAfterSignupExperimentEnabled", false);
local function v8(v7) --[[ Line: 14 ]]
    -- upvalues: v4 (copy), v5 (copy)
    return (v7[v4] or {})[v5];
end;
return {
    FFlagPVandCIAfterSignupExperimentEnabled = v6, 
    usePVAndCIAfterSignupVariant = function(v9) --[[ Line: 21 ]] --[[ Name: usePVAndCIAfterSignupVariant ]]
        -- upvalues: l_useUserExperiment_0 (copy), v4 (copy), v8 (copy)
        local v10 = v9 or {
            isExposureEnabled = false
        };
        return (l_useUserExperiment_0({
            v4
        }, v8, v10.isExposureEnabled));
    end, 
    logExposure = function() --[[ Line: 29 ]] --[[ Name: logExposure ]]
        -- upvalues: l_IXPService_0 (copy), v4 (copy)
        l_IXPService_0:LogUserLayerExposure(v4);
    end
};