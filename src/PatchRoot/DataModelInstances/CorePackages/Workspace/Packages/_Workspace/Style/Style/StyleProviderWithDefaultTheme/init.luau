local l_script_FirstAncestor_0 = script:FindFirstAncestor("Style");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.UIBlox);
local l_AppStyleProvider_0 = v4.App.Style.AppStyleProvider;
local l_Constants_0 = v4.App.Style.Constants;
local v7 = require(l_script_FirstAncestor_0.UiModeStyleProvider);
local v8 = require(l_Parent_0.Foundation);
local l_FoundationProvider_0 = v8.FoundationProvider;
local l_Theme_0 = v8.Enums.Theme;
local v11 = require(l_Parent_0.SharedFlags);
local v12 = {
    withUiModeSupport = true, 
    withDarkTheme = true
};
return function(v13) --[[ Line: 36 ]]
    -- upvalues: v3 (copy), v12 (copy), v2 (copy), v7 (copy), l_AppStyleProvider_0 (copy), l_Constants_0 (copy), v11 (copy), l_FoundationProvider_0 (copy), l_Theme_0 (copy)
    local v14 = v3.Dictionary.join(v12, v13);
    local v15 = v2.createElement(if v13.withUiModeSupport then v7 else l_AppStyleProvider_0, {
        style = {
            themeName = if v14.withDarkTheme then l_Constants_0.ThemeName.Dark else l_Constants_0.ThemeName.Light, 
            fontName = l_Constants_0.FontName.Gotham
        }
    }, v14.children);
    if v11.GetFFlagUIBloxFoundationProvider() and not v13.withUiModeSupport then
        return v2.createElement(l_FoundationProvider_0, {
            theme = if v14.withDarkTheme then l_Theme_0.Dark else l_Theme_0.Light
        }, v15);
    else
        return v15;
    end;
end;