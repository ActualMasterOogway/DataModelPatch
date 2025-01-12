local v0 = nil;
pcall(function() --[[ Line: 2 ]]
    -- upvalues: v0 (ref)
    v0 = game:GetService("AppLifecycleObserverService");
end);
local l_script_FirstAncestor_0 = script:FindFirstAncestor("TenFootUiShell");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_LoginStatus_0 = require(l_Parent_0.RobloxAppEnums).LoginStatus;
local _ = require(l_Parent_0.AppCommonLib);
local l_TenFootUiContext_0 = require(l_Parent_0.TenFootUiCommon).TenFootUiContext;
local v8 = require(l_script_FirstAncestor_0.Networking.networkRequests.platformSocialGraphSync);
local function _(v9, v10) --[[ Line: 24 ]] --[[ Name: registerPlatformSocialGraphSync ]]
    -- upvalues: v8 (copy), v0 (ref)
    local function v11() --[[ Line: 26 ]]
        -- upvalues: v8 (ref), v9 (copy), v10 (copy)
        v8(v9, v10);
    end;
    if v0 then
        v8(v9, v10);
        return v0.OnBecomeActive:Connect(v11);
    else
        return nil;
    end;
end;
return function() --[[ Line: 43 ]] --[[ Name: useRegisterPlatformSocialGraphSync ]]
    -- upvalues: v3 (copy), l_TenFootUiContext_0 (copy), l_useSelector_0 (copy), l_LoginStatus_0 (copy), v8 (copy), v0 (ref)
    local v13 = v3.useContext(l_TenFootUiContext_0);
    assert(v13, "TenFootUiContext must be configured before useRegisterPlatformSocialGraphSync");
    local v14 = v13.useRoactService(v13.RoactAnalytics);
    local v15 = v13.useRoactService(v13.RoactNetworking);
    local v17 = l_useSelector_0(function(v16) --[[ Line: 50 ]]
        return {
            authenticationStatus = v16.AuthenticationStatus.status
        };
    end).authenticationStatus == l_LoginStatus_0.LOGGED_IN;
    v3.useEffect(function() --[[ Line: 59 ]]
        -- upvalues: v17 (copy), v15 (copy), v14 (copy), v8 (ref), v0 (ref)
        local v18 = nil;
        if v17 then
            local l_v15_0 = v15;
            local l_v14_0 = v14;
            local function v21() --[[ Line: 26 ]]
                -- upvalues: v8 (ref), l_v15_0 (copy), l_v14_0 (copy)
                v8(l_v15_0, l_v14_0);
            end;
            if v0 then
                v8(l_v15_0, l_v14_0);
                v18 = v0.OnBecomeActive:Connect(v21);
            else
                v18 = nil;
            end;
        end;
        return function() --[[ Line: 66 ]]
            -- upvalues: v18 (ref)
            if v18 then
                v18:disconnect();
                v18 = nil;
            end;
        end;
    end, {
        v17, 
        v15, 
        v14
    });
end;