local l_Parent_0 = script.Parent.Parent;
local l_UserInputService_0 = game:GetService("UserInputService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Rodux_0 = require(l_CorePackages_0.Workspace.Packages.PurchasePromptDeps).Rodux;
local v4 = require(l_Parent_0.Actions.SetGamepadEnabled);
local v5 = l_UserInputService_0:GetPlatform() == Enum.Platform.XBoxOne;
return (l_Rodux_0.createReducer(v5, {
    [v4.name] = function(_, v7) --[[ Line: 13 ]]
        return v7.enabled;
    end
}));