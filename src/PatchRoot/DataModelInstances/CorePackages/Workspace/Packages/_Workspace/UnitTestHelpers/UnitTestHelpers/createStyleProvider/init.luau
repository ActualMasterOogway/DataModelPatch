local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Roact);
local l_StyleProviderWithDefaultTheme_0 = require(l_Parent_0.Style).StyleProviderWithDefaultTheme;
return function(v3, v4) --[[ Line: 8 ]]
    -- upvalues: v1 (copy), l_StyleProviderWithDefaultTheme_0 (copy)
    return v1.createElement(l_StyleProviderWithDefaultTheme_0, {
        withUiModeSupport = if v4 then v4.withUiModeSupport else false, 
        withDarkTheme = if v4 then v4.withDarkTheme else nil
    }, v3);
end;