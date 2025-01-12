local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.App.Style.AppStyleProvider);
local l_FoundationProvider_0 = require(l_Parent_0.Parent.Foundation).FoundationProvider;
local v4 = require(l_Parent_0.UIBloxConfig);
local _ = require(l_Parent_0.App.Style.StyleTypes);
return function(v6, v7) --[[ Line: 12 ]]
    -- upvalues: v4 (copy), v1 (copy), l_FoundationProvider_0 (copy), v2 (copy)
    if v4.useFoundationProvider then
        return v1.createElement(l_FoundationProvider_0, {
            theme = "Dark", 
            preferences = if v7 then {
                reducedMotion = v7.reducedMotion, 
                preferredTransparency = v7.preferredTransparency
            } else nil
        }, v1.createElement(v2, {
            style = {
                themeName = "Dark", 
                fontName = "Gotham", 
                settings = v7
            }
        }, {
            Content = v1.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0)
            }, v6)
        }));
    else
        return v1.createElement(v2, {
            style = {
                themeName = "Dark", 
                fontName = "Gotham", 
                settings = v7
            }
        }, {
            Content = v1.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0)
            }, v6)
        });
    end;
end;