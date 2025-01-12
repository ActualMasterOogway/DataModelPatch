local l_Parent_0 = script.Parent.Parent;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Rodux_0 = require(l_CorePackages_0.Workspace.Packages.PurchasePromptDeps).Rodux;
local v3 = require(l_Parent_0.Actions.PromptNativeUpsell);
return (l_Rodux_0.createReducer({}, {
    [v3.name] = function(_, v5) --[[ Line: 10 ]]
        return {
            robuxProductId = v5.robuxProductId, 
            productId = v5.productId, 
            robuxPurchaseAmount = v5.robuxPurchaseAmount
        };
    end
}));