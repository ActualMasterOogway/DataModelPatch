local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Roact);
local v3 = require(l_Parent_1.UIBlox);
local l_AppStyleProvider_0 = v3.App.Style.AppStyleProvider;
local l_Constants_0 = v3.App.Style.Constants;
local l_Dark_0 = l_Constants_0.ThemeName.Dark;
local l_Gotham_0 = l_Constants_0.FontName.Gotham;
local v8 = require(l_Parent_0.Locale.LocaleProvider);
return function(v9) --[[ Line: 15 ]]
    -- upvalues: v2 (copy), v8 (copy), l_AppStyleProvider_0 (copy), l_Dark_0 (copy), l_Gotham_0 (copy)
    return v2.createElement(v8, {
        locale = "en-us", 
        render = function() --[[ Line: 18 ]] --[[ Name: render ]]
            -- upvalues: v2 (ref), l_AppStyleProvider_0 (ref), l_Dark_0 (ref), l_Gotham_0 (ref), v9 (copy)
            return v2.createElement(l_AppStyleProvider_0, {
                style = {
                    themeName = l_Dark_0, 
                    fontName = l_Gotham_0
                }
            }, {
                v2.createElement("Frame", {
                    Size = UDim2.new(1, 0, 1, 0)
                }, v9)
            });
        end
    });
end;