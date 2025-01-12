local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialLuaAnalytics");
local _ = require(l_script_FirstAncestor_0.Analytics.Types);
local v2 = require(l_script_FirstAncestor_0.Analytics.Enums.SupportedTelemetryBackends);
return {
    defaults = {
        throttlingThousandths = game:DefineFastInt("ExampleSLATelemetryThrottlingThousandths", 800), 
        links = ""
    }, 
    PageLoad = {
        description = "QR code page load", 
        lastUpdated = {
            24, 
            5, 
            9
        }, 
        backendsList = {
            {
                type = v2.RobloxTelemetryCounter
            }
        }
    }, 
    PageLoadWithCustomIncrement = {
        description = "QR code page load", 
        lastUpdated = {
            24, 
            5, 
            9
        }, 
        backendsList = {
            {
                type = v2.RobloxTelemetryCounter, 
                incrementValue = 2, 
                dynamicCustomFields = {
                    successStatus = function(v3) --[[ Line: 27 ]] --[[ Name: successStatus ]]
                        return v3;
                    end
                }, 
                staticCustomFields = {
                    ctx = "coolPage"
                }
            }
        }
    }, 
    PageLoadWithDynamicName = {
        description = "Test for dynamic name", 
        lastUpdated = {
            24, 
            5, 
            9
        }, 
        backendsList = {
            {
                type = v2.RobloxTelemetryCounter, 
                overrideName = function(v4) --[[ Line: 43 ]] --[[ Name: overrideName ]]
                    return "PageLoadWithDynamicName" .. v4.successStatus;
                end
            }
        }
    }, 
    SimplePageLoadTimer = {
        description = "QR code page load timer", 
        lastUpdated = {
            24, 
            5, 
            9
        }, 
        backendsList = {
            {
                type = v2.RobloxTelemetryStat
            }
        }
    }, 
    ComplexPageLoadTimer = {
        description = "QR code page load timer", 
        lastUpdated = {
            24, 
            5, 
            9
        }, 
        backendsList = {
            {
                type = v2.RobloxTelemetryStat, 
                dynamicCustomFields = {
                    successStatus = function(v5) --[[ Line: 65 ]] --[[ Name: successStatus ]]
                        return v5;
                    end
                }, 
                staticCustomFields = {
                    ctx = "coolPage"
                }
            }
        }
    }
};