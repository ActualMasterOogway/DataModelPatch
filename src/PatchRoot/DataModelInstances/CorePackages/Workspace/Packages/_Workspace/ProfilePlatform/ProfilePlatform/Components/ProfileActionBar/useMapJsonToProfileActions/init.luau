local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.RoactUtils);
local l_useSelector_0 = v3.Hooks.RoactRodux.useSelector;
local l_useDispatch_0 = v3.Hooks.RoactRodux.useDispatch;
local v6 = require(l_Parent_0.LuaSocialLibrariesDeps);
local v7 = require(l_script_FirstAncestor_0.Networking.NetworkingPresence);
local l_getDeepValue_0 = v6.SocialLibraries.config({}).Dictionary.getDeepValue;
local v9 = require(l_script_FirstAncestor_0.Networking.myRoduxNetworking);
local l_useEffectOnce_0 = v3.Hooks.useEffectOnce;
local l_NetworkStatus_0 = v9.Enum.NetworkStatus;
local v12 = require(l_script_FirstAncestor_0.Common.Enums);
local v13 = require(l_script_FirstAncestor_0.Common.Constants);
local v14 = require(l_script_FirstAncestor_0.Hooks.useProfileActions);
return function(v15) --[[ Line: 22 ]]
    -- upvalues: l_useDispatch_0 (copy), l_useSelector_0 (copy), l_getDeepValue_0 (copy), v13 (copy), v12 (copy), v7 (copy), l_NetworkStatus_0 (copy), v14 (copy), l_useEffectOnce_0 (copy), v2 (copy)
    local v16 = l_useDispatch_0();
    local v18 = l_useSelector_0(function(v17) --[[ Line: 24 ]]
        -- upvalues: l_getDeepValue_0 (ref), v13 (ref), v15 (copy), v12 (ref)
        return l_getDeepValue_0(v17, v13.RODUX_KEY .. ".Users." .. v15 .. ".components." .. v12.Components.Actions) or {};
    end);
    local v20 = l_useSelector_0(function(v19) --[[ Line: 31 ]]
        -- upvalues: v7 (ref), v15 (copy), l_NetworkStatus_0 (ref)
        return v7.GetPresencesFromUserIds.getStatus(v19, v15) == l_NetworkStatus_0.NotStarted;
    end);
    local v21 = v14(v12.ButtonSurface.Actions);
    local v22 = {};
    local l_primary_0 = v18.primary;
    local l_secondary_0 = v18.secondary;
    local l_l_useEffectOnce_0_0 = l_useEffectOnce_0;
    local function v26() --[[ Line: 41 ]]
        -- upvalues: v16 (copy), v7 (ref), v15 (copy)
        v16(v7.GetPresencesFromUserIds.API({
            v15
        }));
    end;
    local v27 = false;
    if l_primary_0 == v12.ProfileActions.JoinExperience then
        v27 = v20;
    end;
    l_l_useEffectOnce_0_0(v26, v27);
    if l_primary_0 then
        v22.primary = v21[l_primary_0];
    end;
    if l_secondary_0 then
        v22.secondary = v2.List.map(l_secondary_0, function(v28) --[[ Line: 50 ]]
            -- upvalues: v21 (copy)
            return v21[v28];
        end);
    end;
    return v22, v18.contextual and true or false;
end;