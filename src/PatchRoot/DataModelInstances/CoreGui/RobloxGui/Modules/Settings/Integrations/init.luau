local l_Integrations_0 = script:FindFirstAncestor("Settings").Integrations;
local v1 = require(l_Integrations_0.Settings);
local v2 = require(l_Integrations_0.Constants);
local v3 = require(l_Integrations_0.Utils);
return {
    Settings = v1, 
    Constants = v2, 
    Utils = v3
};