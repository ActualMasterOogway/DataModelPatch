local l_Parent_0 = script.Parent.Parent.Parent;
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Roact_0 = require(l_CorePackages_0.Workspace.Packages.PurchasePromptDeps).Roact;
local v4 = require(l_Parent_0.Localization.getLocalizationContext);
local v5 = require(script.Parent.LocalizationContextProvider);
return function(v6) --[[ Line: 17 ]]
    -- upvalues: l_Roact_0 (copy), v5 (copy), v4 (copy), l_LocalizationService_0 (copy)
    return l_Roact_0.createElement(v5, {
        localizationContext = v4(l_LocalizationService_0.RobloxLocaleId)
    }, {
        PurchasePromptApp = v6()
    });
end;