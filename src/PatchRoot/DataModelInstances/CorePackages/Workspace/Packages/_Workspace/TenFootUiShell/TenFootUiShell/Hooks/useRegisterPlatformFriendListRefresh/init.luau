local v0 = nil;
local v1 = nil;
local v2 = nil;
pcall(function() --[[ Line: 2 ]]
    -- upvalues: v0 (ref)
    v0 = game:GetService("PlatformService");
end);
pcall(function() --[[ Line: 6 ]]
    -- upvalues: v1 (ref)
    v1 = game:GetService("AppLifecycleService");
end);
pcall(function() --[[ Line: 10 ]]
    -- upvalues: v2 (ref)
    v2 = game:GetService("AppLifecycleObserverService");
end);
local l_script_FirstAncestor_0 = script:FindFirstAncestor("TenFootUiShell");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v5 = require(l_Parent_0.React);
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_LoginStatus_0 = require(l_Parent_0.RobloxAppEnums).LoginStatus;
local _ = require(l_Parent_0.AppCommonLib);
local l_TenFootUiContext_0 = require(l_Parent_0.TenFootUiCommon).TenFootUiContext;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local v11 = require(l_script_FirstAncestor_0.Networking.networkRequests.platformFriendListRefresh);
local v12 = require(script.Parent.getFFlagEnableLifeCycleManagerLua);
local function _(v13, v14, v15) --[[ Line: 29 ]] --[[ Name: createPlatformFriendListRefresh ]]
    -- upvalues: v11 (copy)
    return function() --[[ Line: 30 ]]
        -- upvalues: v11 (ref), v13 (copy), v14 (copy), v15 (copy)
        v11(v13, v14, v15);
    end;
end;
return function() --[[ Line: 41 ]] --[[ Name: useRegisterPlatformFriendListRefresh ]]
    -- upvalues: v5 (copy), l_TenFootUiContext_0 (copy), l_useDispatch_0 (copy), l_useSelector_0 (copy), l_LoginStatus_0 (copy), v11 (copy), v12 (copy), v2 (ref), v0 (ref), v1 (ref)
    local v17 = v5.useContext(l_TenFootUiContext_0);
    assert(v17, "TenFootUiContext must be configured before useRegisterPlatformFriendListRefresh");
    local v18 = v17.useRoactService(v17.RoactAnalytics);
    local v19 = v17.useRoactService(v17.RoactNetworking);
    local v20 = l_useDispatch_0();
    local v22 = l_useSelector_0(function(v21) --[[ Line: 49 ]]
        return {
            authenticationStatus = v21.AuthenticationStatus.status
        };
    end).authenticationStatus == l_LoginStatus_0.LOGGED_IN;
    local v23, v24 = v5.useState(false);
    v5.useEffect(function() --[[ Line: 59 ]]
        -- upvalues: v22 (copy), v23 (copy), v20 (copy), v19 (copy), v18 (copy), v11 (ref), v12 (ref), v2 (ref), v0 (ref), v1 (ref), v24 (copy)
        if v22 == v23 then
            return;
        else
            if v22 then
                local l_v20_0 = v20;
                local l_v19_0 = v19;
                local l_v18_0 = v18;
                local function v28() --[[ Line: 30 ]]
                    -- upvalues: v11 (ref), l_v20_0 (copy), l_v19_0 (copy), l_v18_0 (copy)
                    v11(l_v20_0, l_v19_0, l_v18_0);
                end;
                if v12() then
                    if v2 then
                        v28();
                        v2.OnBecomeActive:Connect(v28);
                    end;
                elseif v0 then
                    v0.OnLeaveConstrained:connect(v28);
                elseif v1 then
                    v1:RegisterCallback(Enum.AppLifecycleState.Active, v28, true, false);
                end;
            end;
            v24(v22);
            return;
        end;
    end, {
        v22, 
        v23
    });
end;