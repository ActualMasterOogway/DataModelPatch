local l_Parent_0 = script:FindFirstAncestor("AppChatNetworking").Parent;
local l_SupportedTelemetryBackends_0 = require(l_Parent_0.SocialLuaAnalytics).Analytics.Enums.SupportedTelemetryBackends;
return {
    defaults = {
        throttlingThousandths = game:DefineFastInt("AppChatNetworkingTelemetryThrottlingThousandths", 800), 
        links = ""
    }, 
    NetworkResponse = {
        description = "Event when a response is received from AppChat's networking layer", 
        lastUpdated = {
            24, 
            8, 
            13
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter, 
                overrideName = function() --[[ Line: 17 ]] --[[ Name: overrideName ]]
                    return "AppChat.NetworkResponse";
                end, 
                dynamicCustomFields = {
                    endpoint = function(v2) --[[ Line: 21 ]] --[[ Name: endpoint ]]
                        local v3 = string.match(v2, ".%w+/(.*)");
                        if not v3 then
                            return v2;
                        else
                            return (string.match(v3, "([^?#]+)"));
                        end;
                    end, 
                    statusCode = function(v4) --[[ Line: 33 ]] --[[ Name: statusCode ]]
                        return (tostring(v4));
                    end, 
                    isOK = function(v5) --[[ Line: 36 ]] --[[ Name: isOK ]]
                        return v5;
                    end
                }
            }
        }
    }
};