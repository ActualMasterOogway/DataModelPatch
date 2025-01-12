local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Rodux);
local v3 = require(l_Parent_0.RoactRodux);
local l_RoactServices_0 = require(l_Parent_0.RoactServices).RoactServices;
local v5 = require(l_Parent_0.Foundation);
local l_FoundationProvider_0 = v5.FoundationProvider;
local l_AppStyleProvider_0 = require(l_Parent_0.Style).AppStyleProvider;
local l_Constants_0 = require(l_Parent_0.Style).Constants;
local v9 = {
    themeName = l_Constants_0.ThemeName.Dark, 
    fontName = l_Constants_0.FontName.Gotham
};
local v10 = {
    ScreenSize = Vector2.new(500, 500), 
    SetAlias = {
        Aliases = {
            byUserId = {
                ["1"] = "foo"
            }
        }
    }
};
local function v15(v11, v12) --[[ Line: 31 ]]
    -- upvalues: v2 (copy)
    local v14 = v12 or function(v13) --[[ Line: 32 ]]
        return v13;
    end;
    return v2.Store.new(v14, v11 or {}, {
        v2.thunkMiddleware
    });
end;
return {
    mockServices = function(v16) --[[ Line: 39 ]]
        -- upvalues: v1 (copy), v3 (copy), v15 (copy), v10 (copy), l_FoundationProvider_0 (copy), v5 (copy), l_AppStyleProvider_0 (copy), v9 (copy), l_RoactServices_0 (copy)
        local v17 = {
            storeProvider = v1.createElement(v3.StoreProvider, {
                store = v15(v10)
            }, {
                foundationProvider = v1.createElement(l_FoundationProvider_0, {
                    theme = v5.Enums.Theme.Dark
                }, {
                    styleProvider = v1.createElement(l_AppStyleProvider_0, {
                        style = v9
                    }, v16)
                })
            })
        };
        return (v1.createElement(l_RoactServices_0.ServiceProvider, {}, v17));
    end
};