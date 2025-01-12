local l_Parent_0 = script.Parent.Parent;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Rodux_0 = require(l_CorePackages_0.Workspace.Packages.PurchasePromptDeps).Rodux;
local v3 = require(l_Parent_0.Actions.AccountInfoReceived);
local v4 = require(l_Parent_0.Actions.BalanceInfoRecieved);
return (l_Rodux_0.createReducer({}, {
    [v3.name] = function(v5, v6) --[[ Line: 12 ]]
        local l_accountInfo_0 = v6.accountInfo;
        return {
            balance = v5.balance, 
            membershipType = l_accountInfo_0.isPremium and 4 or 0
        };
    end, 
    [v4.name] = function(v8, v9) --[[ Line: 21 ]]
        return {
            balance = v9.balanceInfo.robux, 
            membershipType = v8.membershipType
        };
    end
}));