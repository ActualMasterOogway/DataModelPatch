local l_Parent_0 = script.Parent.Parent;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Rodux_0 = require(l_CorePackages_0.Workspace.Packages.PurchasePromptDeps).Rodux;
local v3 = require(l_Parent_0.Actions.SetPurchaseFlow);
local v4 = require(l_Parent_0.Actions.CompleteRequest);
local v5 = require(l_Parent_0.Enums.PurchaseFlow);
return l_Rodux_0.createReducer(false, {
    [v4.name] = function(_, _) --[[ Line: 13 ]]
        -- upvalues: v5 (copy)
        return v5.None;
    end, 
    [v3.name] = function(_, v9) --[[ Line: 16 ]]
        return v9.purchaseFlow;
    end
});