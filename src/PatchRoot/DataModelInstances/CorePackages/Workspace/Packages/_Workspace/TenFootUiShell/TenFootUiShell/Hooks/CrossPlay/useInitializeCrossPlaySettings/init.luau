local l_script_FirstAncestor_0 = script:FindFirstAncestor("TenFootUiShell");
local v1 = require(l_script_FirstAncestor_0.ServiceWrappers.PlatformServiceOrStub);
local v2 = require(l_script_FirstAncestor_0.ServiceWrappers.ThirdPartyUserServiceOrStub);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v4 = require(l_Parent_0.React);
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_LoginStatus_0 = require(l_Parent_0.RobloxAppEnums).LoginStatus;
local v8 = require(l_script_FirstAncestor_0.Hooks.CrossPlay.useCrossPlayApi);
local v9 = require(script.Parent.getFFlagCrossPlayRearrangement);
return function() --[[ Line: 12 ]] --[[ Name: useInitializeCrossPlaySettings ]]
    -- upvalues: v8 (copy), l_useDispatch_0 (copy), l_useSelector_0 (copy), v4 (copy), l_LoginStatus_0 (copy), v9 (copy), v2 (copy), v1 (copy)
    local v10 = v8();
    local v11 = l_useDispatch_0();
    local v13 = l_useSelector_0(function(v12) --[[ Line: 16 ]]
        return {
            authenticationStatus = v12.AuthenticationStatus.status, 
            preloading = v12.Startup.Preloading
        };
    end);
    local v14, v15 = v4.useState(false);
    local l_authenticationStatus_0 = v13.authenticationStatus;
    local l_preloading_0 = v13.preloading;
    local v18 = l_authenticationStatus_0 == l_LoginStatus_0.LOGGED_IN;
    v4.useEffect(function() --[[ Line: 29 ]]
        -- upvalues: v18 (copy), v14 (copy), l_preloading_0 (copy), v10 (copy), v15 (copy)
        if v18 == v14 then
            return;
        else
            if v18 and l_preloading_0 then
                v10.fetch();
            elseif not v18 then
                v10.reset();
            end;
            v15(v18);
            return;
        end;
    end, {
        v10, 
        v18, 
        v14, 
        l_preloading_0
    });
    local v19 = {
        v11
    };
    if v9() then
        v19 = {
            v11, 
            v10
        };
    end;
    v4.useEffect(function() --[[ Line: 48 ]]
        -- upvalues: v2 (ref), v10 (copy), v1 (ref)
        local v20 = v2.ActiveUserSignedOut:connect(function() --[[ Line: 49 ]]
            -- upvalues: v10 (ref)
            v10.reset();
        end);
        local v21 = v1.OnLeaveConstrained:connect(function() --[[ Line: 58 ]]
            -- upvalues: v10 (ref)
            v10.fetch();
        end);
        return function() --[[ Line: 62 ]]
            -- upvalues: v20 (copy), v21 (copy)
            v20:disconnect();
            v21:disconnect();
        end;
    end, v19);
end;