local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local l_StyleProviderWithDefaultTheme_0 = require(l_CorePackages_0.Workspace.Packages.Style).StyleProviderWithDefaultTheme;
return function(v3, v4) --[[ Line: 7 ]]
    -- upvalues: v1 (copy), l_StyleProviderWithDefaultTheme_0 (copy)
    return v1.createElement(l_StyleProviderWithDefaultTheme_0, {
        withUiModeSupport = if v4 then v4.withUiModeSupport else false, 
        withDarkTheme = not v4 or v4.withDarkTheme
    }, v3);
end;