local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialTestHelpers");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_Localization_0 = v1.RobloxAppLocales.Localization;
local l_LocalizationProvider_0 = v1.LocalizationProvider;
local l_Roact_0 = v1.Roact;
local v5 = l_Localization_0.new("en-us");
return function(v6, v7) --[[ Line: 9 ]]
    -- upvalues: v5 (copy), l_Roact_0 (copy), l_LocalizationProvider_0 (copy)
    if v7 and v7.controls and v7.controls.langauge then
        v5:SetLocale(v7.controls.language);
    end;
    return l_Roact_0.createElement(l_LocalizationProvider_0, {
        localization = v5
    }, {
        TestElement1 = l_Roact_0.createElement(v6, v7)
    });
end;