local l_Parent_0 = script.Parent.Parent;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Rodux_0 = require(l_CorePackages_0.Workspace.Packages.PurchasePromptDeps).Rodux;
local v3 = require(l_Parent_0.Actions.SetProduct);
local v4 = require(l_Parent_0.Actions.CompleteRequest);
return (l_Rodux_0.createReducer({}, {
    [v3.name] = function(_, v6) --[[ Line: 12 ]]
        return {
            id = v6.id, 
            infoType = v6.infoType, 
            equipIfPurchased = v6.equipIfPurchased
        };
    end, 
    [v4.name] = function(_, _) --[[ Line: 19 ]]
        return {};
    end
}));