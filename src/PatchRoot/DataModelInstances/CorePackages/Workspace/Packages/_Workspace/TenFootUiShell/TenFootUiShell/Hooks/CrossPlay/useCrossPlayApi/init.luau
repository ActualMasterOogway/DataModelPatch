local l_script_FirstAncestor_0 = script:FindFirstAncestor("TenFootUiShell");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_LinkingProtocol_0 = require(l_Parent_0.LinkingProtocol).LinkingProtocol;
local v6 = require(l_script_FirstAncestor_0.Hooks.useAppPolicy);
local l_GetUserSettingsPlatform_0 = require(l_script_FirstAncestor_0.Networking).thunks.GetUserSettingsPlatform;
local l_UpdateUserSettingsPlatform_0 = require(l_script_FirstAncestor_0.Networking).thunks.UpdateUserSettingsPlatform;
local v9 = require(l_script_FirstAncestor_0.Actions.CrossPlayFetchFailed);
local v10 = require(l_script_FirstAncestor_0.Actions.CrossPlaySettingsReset);
local v11 = require(l_script_FirstAncestor_0.Actions.CrossPlayUpdateFailed);
local v12 = require(l_script_FirstAncestor_0.Actions.CrossPlaySetValue);
local v13 = require(l_script_FirstAncestor_0.Actions.CrossPlaySetPrivileges);
local v14 = require(l_script_FirstAncestor_0.Actions.CrossPlayGetPrivilegesFailed);
local v15 = require(l_script_FirstAncestor_0.Actions.CrossPlayStubSystemPrivileges);
local v16 = require(l_script_FirstAncestor_0.Actions.CrossPlayResetPrivileges);
local v17 = require(script.Parent.getPlatformPrivilegeSettings);
local v18 = require(script.Parent.getFFlagCrossPlayRearrangement);
return function() --[[ Line: 21 ]] --[[ Name: useCrossPlayApi ]]
    -- upvalues: v6 (copy), l_useDispatch_0 (copy), l_useSelector_0 (copy), v2 (copy), l_GetUserSettingsPlatform_0 (copy), l_UpdateUserSettingsPlatform_0 (copy), v18 (copy), v16 (copy), v17 (copy), v13 (copy), v11 (copy), v14 (copy), v12 (copy), v15 (copy), v9 (copy), l_LinkingProtocol_0 (copy), v10 (copy)
    local v20 = v6(function(v19) --[[ Line: 22 ]]
        return v19.useLegacyCrossPlayApi();
    end);
    local v22 = v6(function(v21) --[[ Line: 25 ]]
        return v21.useCrossPlaySystemUi();
    end);
    local v24 = v6(function(v23) --[[ Line: 28 ]]
        return v23.getCrossPlayUri();
    end);
    local v26 = v6(function(v25) --[[ Line: 31 ]]
        return v25.getCrossPlayCapabilities();
    end);
    local v28 = v6(function(v27) --[[ Line: 34 ]]
        return v27.getCrossPlaySettingsKey();
    end);
    local v30 = v6(function(v29) --[[ Line: 37 ]]
        return v29.getCrossPlayQueryParam();
    end);
    local v31 = l_useDispatch_0();
    local v33 = l_useSelector_0(function(v32) --[[ Line: 42 ]]
        return v32.CrossPlaySettings.Status.isEnabled or false;
    end);
    local v34 = v2.useCallback(function() --[[ Line: 46 ]]
        -- upvalues: v31 (copy), l_GetUserSettingsPlatform_0 (ref), v30 (copy), v28 (copy), v20 (copy)
        return v31(l_GetUserSettingsPlatform_0.API(v30, v28, v20));
    end, {
        v31, 
        v30, 
        v28, 
        v20
    });
    local v36 = v2.useCallback(function(v35) --[[ Line: 55 ]]
        -- upvalues: v31 (copy), l_UpdateUserSettingsPlatform_0 (ref), v30 (copy), v28 (copy), v20 (copy)
        return v31(l_UpdateUserSettingsPlatform_0.API(v30, v28, v35, v20));
    end, {
        v31, 
        v30, 
        v28, 
        v20
    });
    local v44 = if v18() then v2.useCallback(function(v37) --[[ Line: 73 ]]
        -- upvalues: v31 (copy), v16 (ref), v17 (ref), v26 (copy), v13 (ref), v36 (copy), v11 (ref), v14 (ref)
        v31(v16());
        return v17(v26):andThen(function(v38) --[[ Line: 77 ]]
            -- upvalues: v31 (ref), v13 (ref), v37 (copy), v36 (ref), v11 (ref)
            v31(v13(v38));
            if v38.CrossPlatform.CanJoinGame ~= v37 then
                return v36(v38.CrossPlatform.CanJoinGame):catch(function(v39) --[[ Line: 82 ]]
                    -- upvalues: v31 (ref), v11 (ref)
                    v31(v11(v39));
                end);
            else
                return;
            end;
        end):catch(function(v40) --[[ Line: 87 ]]
            -- upvalues: v31 (ref), v14 (ref)
            v31(v14(v40));
        end);
    end, {
        v31, 
        v26, 
        v36
    }) else v2.useCallback(function() --[[ Line: 91 ]]
        -- upvalues: v31 (copy), v16 (ref), v17 (ref), v26 (copy), v13 (ref), v33 (copy), v36 (copy), v12 (ref), v11 (ref), v14 (ref)
        v31(v16());
        return v17(v26):andThen(function(v41) --[[ Line: 95 ]]
            -- upvalues: v31 (ref), v13 (ref), v33 (ref), v36 (ref), v12 (ref), v11 (ref)
            v31(v13(v41));
            if v41.CrossPlatform.CanJoinGame ~= v33 then
                return v36(v41.CrossPlatform.CanJoinGame):andThen(function() --[[ Line: 101 ]]
                    -- upvalues: v31 (ref), v12 (ref), v41 (copy)
                    v31(v12(v41.CrossPlatform.CanJoinGame));
                end):catch(function(v42) --[[ Line: 104 ]]
                    -- upvalues: v31 (ref), v11 (ref)
                    v31(v11(v42));
                end);
            else
                return;
            end;
        end):catch(function(v43) --[[ Line: 109 ]]
            -- upvalues: v31 (ref), v14 (ref)
            v31(v14(v43));
        end);
    end, {
        v31, 
        v26, 
        v36, 
        v33
    });
    local v50 = if v18() then v2.useCallback(function() --[[ Line: 116 ]]
        -- upvalues: v34 (copy), v22 (copy), v44 (copy), v28 (copy), v17 (ref), v26 (copy), v31 (copy), v15 (ref), v9 (ref)
        return v34():andThen(function(v45) --[[ Line: 119 ]]
            -- upvalues: v22 (ref), v44 (ref), v28 (ref), v17 (ref), v26 (ref), v31 (ref), v15 (ref)
            if v22 then
                return v44(v45.responseBody[v28].isEnabled);
            else
                v17(v26):andThen(function(v46) --[[ Line: 123 ]]
                    -- upvalues: v31 (ref), v15 (ref)
                    v31(v15(v46));
                end);
                return;
            end;
        end):catch(function(v47) --[[ Line: 128 ]]
            -- upvalues: v31 (ref), v9 (ref)
            v31(v9(v47));
        end);
    end, {
        v31, 
        v28, 
        v44, 
        v34, 
        v22
    }) else v2.useCallback(function() --[[ Line: 140 ]]
        -- upvalues: v22 (copy), v44 (copy), v17 (ref), v26 (copy), v31 (copy), v15 (ref), v34 (copy), v9 (ref)
        if v22 then
            return v44();
        else
            v17(v26):andThen(function(v48) --[[ Line: 144 ]]
                -- upvalues: v31 (ref), v15 (ref)
                v31(v15(v48));
            end);
            return v34():catch(function(v49) --[[ Line: 150 ]]
                -- upvalues: v31 (ref), v9 (ref)
                v31(v9(v49));
            end);
        end;
    end, {
        v31, 
        v34, 
        v22
    });
    local v51 = v2.useCallback(function() --[[ Line: 155 ]]
        -- upvalues: v22 (copy), v24 (copy), l_LinkingProtocol_0 (ref)
        if v22 and v24 then
            l_LinkingProtocol_0.default:openURL(v24);
        end;
    end, {
        v22, 
        v24
    });
    local v54 = v2.useCallback(function(v52) --[[ Line: 162 ]]
        -- upvalues: v22 (copy), v51 (copy), v31 (copy), v12 (ref), v36 (copy), v50 (copy), v11 (ref)
        if v22 then
            v51();
            return;
        else
            v31(v12(v52));
            return v36(v52):andThen(function() --[[ Line: 171 ]]
                -- upvalues: v50 (ref)
                v50();
            end):catch(function(v53) --[[ Line: 174 ]]
                -- upvalues: v31 (ref), v11 (ref)
                v31(v11(v53));
            end);
        end;
    end, {
        v31, 
        v36, 
        v50, 
        v51
    });
    local v55 = v2.useCallback(function() --[[ Line: 187 ]]
        -- upvalues: v31 (copy), v10 (ref)
        v31(v10());
    end, {
        v31
    });
    return (v2.useMemo(function() --[[ Line: 192 ]]
        -- upvalues: v50 (copy), v55 (copy), v54 (copy), v51 (copy)
        return {
            fetch = v50, 
            reset = v55, 
            update = v54, 
            invokeSystemUi = v51
        };
    end, {
        v50, 
        v55, 
        v54, 
        v51
    }));
end;