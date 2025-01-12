local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Rodux);
local l_Actions_0 = script.Parent.Parent.Actions;
local v3 = require(l_Actions_0.SetRespawnBehaviour);
return v1.createReducer({
    enabled = true, 
    customCallback = nil
}, {
    [v3.name] = function(_, v5) --[[ Line: 13 ]]
        return {
            enabled = v5.respawnEnabled, 
            customCallback = v5.customCallback
        };
    end
});