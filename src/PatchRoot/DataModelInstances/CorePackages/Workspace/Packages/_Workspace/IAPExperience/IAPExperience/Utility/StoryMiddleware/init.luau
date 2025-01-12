local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Roact);
local v3 = require(l_Parent_1.UIBlox);
local v4 = require(l_Parent_0.Locale.LocaleProvider);
local l_status_0, l_result_0 = pcall(function() --[[ Line: 10 ]]
    -- upvalues: v3 (copy), l_Parent_1 (copy)
    v3.init(require(l_Parent_1.Dev.RobloxAppUIBloxConfig));
end);
if not l_status_0 then
    warn("Error initializing UIBlox", l_result_0);
end;
local l_SelectionCursorProvider_0 = v3.App.SelectionImage.SelectionCursorProvider;
local l_CursorProvider_0 = v3.App.SelectionCursor.CursorProvider;
local l_AppStyleProvider_0 = v3.App.Style.AppStyleProvider;
local l_Constants_0 = v3.App.Style.Constants;
local l_Light_0 = l_Constants_0.ThemeName.Light;
local l_Dark_0 = l_Constants_0.ThemeName.Dark;
local l_Gotham_0 = l_Constants_0.FontName.Gotham;
local v14 = {
    Light = {
        themeName = l_Light_0, 
        fontName = l_Gotham_0
    }, 
    Dark = {
        themeName = l_Dark_0, 
        fontName = l_Gotham_0
    }
};
return function(v15) --[[ Line: 36 ]] --[[ Name: StoryMiddleware ]]
    -- upvalues: v2 (copy), v4 (copy), l_AppStyleProvider_0 (copy), v14 (copy), l_SelectionCursorProvider_0 (copy), l_CursorProvider_0 (copy)
    return function(v16) --[[ Line: 38 ]]
        -- upvalues: v2 (ref), v4 (ref), l_AppStyleProvider_0 (ref), v14 (ref), l_SelectionCursorProvider_0 (ref), l_CursorProvider_0 (ref), v15 (copy)
        return v2.createElement(v4, {
            locale = "en-us"
        }, {
            AppStyleProvider = v2.createElement(l_AppStyleProvider_0, {
                style = v14[v16.theme]
            }, {
                CursorProvider = v2.createElement(l_SelectionCursorProvider_0, {}, {
                    NewCursorProvider = v2.createElement(l_CursorProvider_0, {}, {
                        Child = v2.createElement(v15, v16)
                    })
                })
            })
        });
    end;
end;