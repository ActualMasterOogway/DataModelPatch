local l_HttpService_0 = game:GetService("HttpService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AffiliateLinks");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.Promise);
local l_Url_0 = require(l_Parent_0.Http).Url;
local _ = require(l_Parent_0.Http);
local l_default_0 = require(l_Parent_0.LoggingProtocol).default;
local v7 = require(l_script_FirstAncestor_0.TelemetryConfigs);
local l_GetFFlagEnableAffiliateLinksQualifiedSignUpTracking_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableAffiliateLinksQualifiedSignUpTracking;
local v19 = {
    resolveReferralCode = function(v9, v10) --[[ Line: 20 ]]
        -- upvalues: l_Url_0 (copy)
        local v11 = l_Url_0:makeQueryString({
            referralCode = v10
        });
        return v9(string.format("%saffiliate-links/v1/links/resolve?%s", l_Url_0.APIS_URL, v11), "GET");
    end, 
    attribute = function(v12, v13, v14, v15) --[[ Line: 28 ]]
        -- upvalues: l_GetFFlagEnableAffiliateLinksQualifiedSignUpTracking_0 (copy), v3 (copy), l_HttpService_0 (copy), l_Url_0 (copy)
        if not l_GetFFlagEnableAffiliateLinksQualifiedSignUpTracking_0() then
            return v3.resolve();
        else
            return v3.new(function(v16) --[[ Line: 38 ]]
                -- upvalues: l_HttpService_0 (ref), v13 (copy), v14 (copy), v15 (copy), l_Url_0 (ref), v12 (copy)
                local v17 = l_HttpService_0:JSONEncode({
                    linkId = v13, 
                    referralUrl = v14, 
                    linkType = v15
                });
                local v18 = string.format("%saffiliate-links/v1/events/qualified-signup", l_Url_0.APIS_URL);
                v12(v18, "POST", {
                    postBody = v17
                }):await();
                v16();
            end);
        end;
    end
};
v19.attributeJoinLink = function(v20, v21, v22) --[[ Line: 50 ]]
    -- upvalues: v3 (copy), v19 (copy), l_default_0 (copy), v7 (copy)
    return v3.new(function(v23) --[[ Line: 55 ]]
        -- upvalues: v19 (ref), v20 (copy), v22 (copy), v21 (copy), l_default_0 (ref), v7 (ref)
        local v24, v25 = v19.resolveReferralCode(v20, v22):await();
        if v24 then
            v19.attribute(v20, v25.responseBody.linkId, v21, v25.responseBody.linkType):await();
        else
            l_default_0:logRobloxTelemetryCounter(v7.AttributeJoinLinkFailureCounter);
        end;
        v23();
    end);
end;
return v19;