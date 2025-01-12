local l_Parent_0 = script:FindFirstAncestor("TenFootUiEngagementScreen").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.TenFootUiCommon);
local v3 = require(l_Parent_0.AppStartup);
local l_TenFootUiContext_0 = v2.TenFootUiContext;
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local l_navigateWithPlatformAccount_0 = v3.navigateWithPlatformAccount;
local l_AppLogging_0 = require(l_Parent_0.RoactServiceTags).AppLogging;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_ThirdPartyUserService_0 = game:GetService("ThirdPartyUserService");
return function(v10) --[[ Line: 18 ]] --[[ Name: useEngagementScreenProps ]]
    -- upvalues: l_useNavigation_0 (copy), v1 (copy), l_TenFootUiContext_0 (copy), l_useRoactService_0 (copy), l_AppLogging_0 (copy), l_ThirdPartyUserService_0 (copy), l_navigateWithPlatformAccount_0 (copy)
    local l_useSingleSignOn_0 = v10.useSingleSignOn;
    local l_allowPlatformAccountSwitching_0 = v10.allowPlatformAccountSwitching;
    local v13 = l_useNavigation_0();
    local v14 = v1.useContext(l_TenFootUiContext_0);
    local v15 = l_useRoactService_0(l_AppLogging_0);
    local v16, v17 = v1.useState(false);
    local v18 = nil;
    if l_allowPlatformAccountSwitching_0 then
        v18 = function() --[[ Line: 28 ]]
            -- upvalues: l_ThirdPartyUserService_0 (ref)
            if l_ThirdPartyUserService_0 then
                l_ThirdPartyUserService_0:ShowAccountPicker();
            end;
        end;
    end;
    local v19 = v14 and function() --[[ Line: 36 ]]
        -- upvalues: v17 (copy)
        v17(true);
    end or function() --[[ Line: 39 ]]

    end;
    v1.useEffect(function() --[[ Line: 41 ]]
        -- upvalues: v16 (copy), v15 (copy), l_ThirdPartyUserService_0 (ref), l_navigateWithPlatformAccount_0 (ref), l_useSingleSignOn_0 (copy), v13 (copy), v17 (copy)
        if v16 then
            v15:logEventOnce("engagement_screen_did_continue");
            if l_ThirdPartyUserService_0 then
                l_ThirdPartyUserService_0:RegisterActiveUser(Enum.UserInputType.Gamepad1);
            end;
            l_navigateWithPlatformAccount_0(l_useSingleSignOn_0, v13.replace);
            v17(false);
        end;
    end, {
        v16, 
        v15, 
        l_useSingleSignOn_0, 
        v13.replace
    });
    return {
        onContinue = v19, 
        onSwitchAccounts = v18
    };
end;