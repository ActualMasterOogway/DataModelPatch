local l_Parent_0 = script:FindFirstAncestor("AppStartup").Parent;
local v1 = game:DefineFastFlag("DebugTenFootForceShowAuthScreen", false);
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_FFlagLuaAppUnifyLandingPages_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppUnifyLandingPages;
return function(v4, v5) --[[ Line: 10 ]] --[[ Name: navigateWithPlatformAccount ]]
    -- upvalues: l_AppPage_0 (copy), v1 (copy), l_FFlagLuaAppUnifyLandingPages_0 (copy)
    if v4 then
        v5(l_AppPage_0.SingleSignOnContainer);
        return;
    elseif v1 then
        v5(if l_FFlagLuaAppUnifyLandingPages_0 then l_AppPage_0.Landing else l_AppPage_0.Authentication);
        return;
    else
        v5(l_AppPage_0.Startup);
        return;
    end;
end;