local l_Parent_0 = script:FindFirstAncestor("GraphQlShared").Parent;
local l_UrlBuilder_0 = require(l_Parent_0.UrlBuilder).UrlBuilder;
local l_Url_0 = require(l_Parent_0.Http).Url;
local l_HttpService_0 = game:GetService("HttpService");
local v4 = require(l_Parent_0.DiscoveryUtils);
local l_AddSystemInfoToArgs_0 = v4.AddSystemInfoToArgs;
local l_OmniRecommendationsPageType_0 = v4.OmniRecommendationsPageType;
local v7 = l_UrlBuilder_0.new({
    base = l_Url_0.APIS_URL, 
    path = "/discovery-api/omni-recommendation"
});
return function(v8, v9, v10, v11, v12, v13, v14) --[[ Line: 50 ]]
    -- upvalues: l_OmniRecommendationsPageType_0 (copy), l_AddSystemInfoToArgs_0 (copy), v7 (copy), l_HttpService_0 (copy)
    local v15 = {
        pageType = l_OmniRecommendationsPageType_0.fromAppPage(v9), 
        sessionId = v10, 
        pageToken = v11, 
        supportedTreatmentTypes = v12, 
        requestIntent = v13, 
        topicIds = v14
    };
    l_AddSystemInfoToArgs_0(v15);
    return v8(v7(), "POST", {
        postBody = l_HttpService_0:JSONEncode(v15)
    });
end;