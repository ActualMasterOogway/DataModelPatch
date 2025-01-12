local l_Parent_0 = script.Parent.Parent;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Rodux_0 = require(l_CorePackages_0.Workspace.Packages.PurchasePromptDeps).Rodux;
local v3 = require(l_Parent_0.Actions.PurchaseCompleteRecieved);
local v4 = require(l_Parent_0.Actions.CompleteRequest);
return l_Rodux_0.createReducer(false, {
    [v3.name] = function(_, _) --[[ Line: 11 ]]
        return true;
    end, 
    [v4.name] = function(_, _) --[[ Line: 14 ]]
        return false;
    end
});