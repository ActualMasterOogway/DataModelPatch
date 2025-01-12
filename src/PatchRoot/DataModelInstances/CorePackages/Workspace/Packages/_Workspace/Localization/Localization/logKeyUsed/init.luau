local l_Parent_0 = script:FindFirstAncestor("Localization").Parent;
local v1 = require(l_Parent_0.LoggingProtocol);
local v2 = {
    eventName = "localizationKeyUsedEvent", 
    backends = {
        v1.TelemetryBackends.EventIngest
    }, 
    throttlingPercentage = game:DefineFastInt("LocalizationKeyUsedEventThrottleHundredthsPercent", 10000), 
    lastUpdated = {
        24, 
        10, 
        21
    }, 
    description = "Tracks when a key is used in localization packages", 
    links = "https://roblox.atlassian.net/wiki/spaces/AF/pages/3041427724/DACI+Isolate+translation+strings"
};
return function(v3, v4) --[[ Line: 16 ]] --[[ Name: logKeyUsed ]]
    -- upvalues: v1 (copy), v2 (copy)
    v1.default:logRobloxTelemetryEvent(v2, {}, {
        sourcePackage = v3, 
        usedKey = v4
    });
end;