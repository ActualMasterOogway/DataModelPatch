local l_Parent_0 = script:FindFirstAncestor("AuthCommon").Parent;
local l_UrlBuilder_0 = require(l_Parent_0.UrlBuilder).UrlBuilder;
local l_getAppFeaturePolicies_0 = require(l_Parent_0.UniversalAppPolicy).getAppFeaturePolicies;
return function(v3) --[[ Line: 25 ]] --[[ Name: getSingleSignOnUrls ]]
    -- upvalues: l_getAppFeaturePolicies_0 (copy), l_UrlBuilder_0 (copy)
    local v4 = (v3 or l_getAppFeaturePolicies_0()).getUrlAuthRoutes();
    local v5 = {};
    if v4.account then
        v5.account = l_UrlBuilder_0.fromString("auth" .. ":" .. v4.account);
    end;
    if v4.connect then
        v5.connect = l_UrlBuilder_0.fromString("auth" .. ":" .. v4.connect);
    end;
    if v4.disconnect then
        v5.disconnect = l_UrlBuilder_0.fromString("auth" .. ":" .. v4.disconnect);
    end;
    if v4.login then
        v5.login = l_UrlBuilder_0.fromString("auth" .. ":" .. v4.login);
    end;
    if v4.signup then
        v5.signup = l_UrlBuilder_0.fromString("auth" .. ":" .. v4.signup);
    end;
    return v5;
end;