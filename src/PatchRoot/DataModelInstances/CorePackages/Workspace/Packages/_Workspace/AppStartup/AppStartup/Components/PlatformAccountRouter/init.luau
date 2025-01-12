local l_Parent_0 = script:FindFirstAncestor("AppStartup").Parent;
local v1 = require(script.Parent.Parent.navigateWithPlatformAccount);
local v2 = require(l_Parent_0.React);
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local l_getAppFeaturePolicies_0 = require(l_Parent_0.UniversalAppPolicy).getAppFeaturePolicies;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_ThirdPartyUserService_0 = game:GetService("ThirdPartyUserService");
return function(_) --[[ Line: 13 ]]
    -- upvalues: l_useNavigation_0 (copy), v2 (copy), l_ThirdPartyUserService_0 (copy), l_AppPage_0 (copy), v1 (copy), l_getAppFeaturePolicies_0 (copy)
    local v8 = l_useNavigation_0();
    v2.useEffect(function() --[[ Line: 16 ]]
        -- upvalues: v8 (copy), l_ThirdPartyUserService_0 (ref), l_AppPage_0 (ref), v1 (ref), l_getAppFeaturePolicies_0 (ref)
        if v8 then
            if l_ThirdPartyUserService_0 and not l_ThirdPartyUserService_0:HaveActiveUser() then
                v8.replace(l_AppPage_0.EngagementScreenContainer);
                return;
            else
                v1(l_getAppFeaturePolicies_0().getUseSingleSignOn(), v8.replace);
            end;
        end;
    end, {
        v8
    });
    return nil;
end;