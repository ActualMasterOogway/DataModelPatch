game:DefineFastFlag("EditProfileIXPEnabledV1", false);
local l_Parent_0 = script:FindFirstAncestor("EditProfile").Parent;
local v1 = require(l_Parent_0.RoactAppExperiment);
local l_getFStringSelfProfileView_0 = require(l_Parent_0.SharedFlags).getFStringSelfProfileView;
local l_useUserExperiment_0 = v1.useUserExperiment;
local v4 = require(script.Parent.FFlagEditProfileSetupNewExperimentFlow);
local v5 = game:DefineFastString("EditProfileExperimentKey", "can_view_edit_profile");
local function v6() --[[ Line: 13 ]] --[[ Name: EditProfileExperimentEnabled ]]
    return game:GetFastFlag("EditProfileIXPEnabledV1");
end;
local function v9(v7) --[[ Line: 17 ]]
    -- upvalues: l_getFStringSelfProfileView_0 (copy), v4 (copy), v5 (copy)
    local v8 = (v7 or {})[l_getFStringSelfProfileView_0()] or {};
    if v4 then
        return v8[v5] == true;
    else
        return game:GetFastFlag("EditProfileIXPEnabledV1") and v8.can_view_edit_profile == true;
    end;
end;
return {
    isEditProfileExperimentEnabled = v6, 
    isExperimentEnabled = v9, 
    useIsExperimentEnabled = function(v10) --[[ Line: 32 ]] --[[ Name: useIsExperimentEnabled ]]
        -- upvalues: l_useUserExperiment_0 (copy), l_getFStringSelfProfileView_0 (copy), v9 (copy)
        return l_useUserExperiment_0({
            l_getFStringSelfProfileView_0()
        }, v9, if v10 then v10.isExposureEnabled else nil);
    end
};