local l_Parent_0 = script.Parent.Parent;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Rodux_0 = require(l_CorePackages_0.Workspace.Packages.PurchasePromptDeps).Rodux;
local v3 = require(l_Parent_0.Actions.ErrorOccurred);
local v4 = require(l_Parent_0.Actions.CompleteRequest);
return l_Rodux_0.createReducer({}, {
    [v3.name] = function(_, v6) --[[ Line: 12 ]]
        return v6.purchaseError;
    end, 
    [v4.name] = function(_, _) --[[ Line: 15 ]]
        return {};
    end
});