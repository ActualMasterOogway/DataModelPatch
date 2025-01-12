local l_Parent_0 = script.Parent.Parent;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Rodux_0 = require(l_CorePackages_0.Workspace.Packages.PurchasePromptDeps).Rodux;
local v3 = require(l_Parent_0.Actions.CompleteRequest);
local v4 = require(l_Parent_0.Actions.SubscriptionPurchaseInfoReceived);
local v5 = require(l_Parent_0.getPreviewImageUrl);
return (l_Rodux_0.createReducer({}, {
    [v4.name] = function(_, v7) --[[ Line: 12 ]]
        -- upvalues: v5 (copy)
        v7.subscriptionPurchaseInfo.ImageUrl = v5(v7.subscriptionPurchaseInfo);
        return v7.subscriptionPurchaseInfo;
    end, 
    [v3.name] = function(_, _) --[[ Line: 16 ]]
        return {};
    end
}));