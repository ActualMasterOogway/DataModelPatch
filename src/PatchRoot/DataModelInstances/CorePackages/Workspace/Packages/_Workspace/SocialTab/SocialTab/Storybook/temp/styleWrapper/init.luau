local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialTab");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_Roact_0 = v1.Roact;
local l_AppStyleProvider_0 = v1.UIBlox.App.Style.AppStyleProvider;
local v4 = {
    Default = {
        themeName = "Light", 
        fontName = "Gotham"
    }, 
    Light = {
        themeName = "Light", 
        fontName = "Gotham"
    }, 
    Dark = {
        themeName = "Dark", 
        fontName = "Gotham"
    }
};
return function(v5, v6) --[[ Line: 22 ]]
    -- upvalues: l_Roact_0 (copy), l_AppStyleProvider_0 (copy), v4 (copy)
    return l_Roact_0.createElement(l_AppStyleProvider_0, {
        style = v6 and v4[v6.theme] or v4.Default
    }, {
        Child = l_Roact_0.createElement(v5, v6)
    });
end;