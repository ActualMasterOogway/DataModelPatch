local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Packages.Rodux);
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v4 = require(l_RobloxGui_0.Modules.RobloxTranslator);
local l_Actions_0 = script.Parent.Parent.Actions;
local v6 = require(l_Actions_0.GameNameFetched);
local v7 = v4:FormatByKey("CoreScripts.AvatarEditorPrompts.GameNamePlaceHolder");
return v2.createReducer(v7, {
    [v6.name] = function(_, v9) --[[ Line: 16 ]]
        return v9.gameName;
    end
});