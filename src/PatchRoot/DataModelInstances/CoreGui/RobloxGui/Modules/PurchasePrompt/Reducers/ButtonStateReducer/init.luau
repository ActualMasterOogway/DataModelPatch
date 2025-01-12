local l_Parent_0 = script.Parent.Parent;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Rodux_0 = require(l_CorePackages_0.Workspace.Packages.PurchasePromptDeps).Rodux;
local v3 = require(l_Parent_0.Actions.SetButtonState);
local v4 = require(l_Parent_0.Enums.ButtonState);
return l_Rodux_0.createReducer(v4.Enabled, {
    [v3.name] = function(_, v6) --[[ Line: 11 ]]
        return v6.state;
    end
});