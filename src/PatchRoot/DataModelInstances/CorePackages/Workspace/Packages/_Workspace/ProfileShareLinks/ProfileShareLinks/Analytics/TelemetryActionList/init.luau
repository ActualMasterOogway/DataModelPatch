local l_Parent_0 = script:FindFirstAncestor("ProfileShareLinks").Parent;
local v1 = require(l_Parent_0.Dash);
local l_SupportedTelemetryBackends_0 = require(l_Parent_0.SocialLuaAnalytics).Analytics.Enums.SupportedTelemetryBackends;
local v3 = require(script.Parent.EventNames);
return {
    defaults = {
        throttlingThousandths = game:DefineFastInt("ProfileShareLinksAnalyticsThrottlingThousandths", 1000), 
        links = ""
    }, 
    [v3.ProfileShareLinkActivated] = {
        description = "Profile share link button activated", 
        lastUpdated = {
            24, 
            6, 
            11
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter, 
                dynamicCustomFields = {
                    context = v1.identity, 
                    shareType = v1.identity
                }
            }
        }
    }
};