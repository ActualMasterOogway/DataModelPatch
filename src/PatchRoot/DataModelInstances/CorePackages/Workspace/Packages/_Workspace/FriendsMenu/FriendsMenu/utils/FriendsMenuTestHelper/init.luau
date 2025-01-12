local l_Parent_0 = script:FindFirstAncestor("FriendsMenu").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Rodux);
local v3 = require(l_Parent_0.RoactRodux);
local l_RoactServices_0 = require(l_Parent_0.Dev.RoactServices).RoactServices;
local l_AppStyleProvider_0 = require(l_Parent_0.Style).AppStyleProvider;
local l_Constants_0 = require(l_Parent_0.Style).Constants;
local v7 = {
    themeName = l_Constants_0.ThemeName.Dark, 
    fontName = l_Constants_0.FontName.Gotham
};
local v8 = {
    ScreenSize = Vector2.new(500, 500), 
    SetAlias = {
        Aliases = {
            byUserId = {
                ["1"] = "foo"
            }
        }
    }
};
local function v13(v9, v10) --[[ Line: 34 ]]
    -- upvalues: v2 (copy)
    local v12 = v10 or function(v11) --[[ Line: 35 ]]
        return v11;
    end;
    return v2.Store.new(v12, v9 or {}, {
        v2.thunkMiddleware
    });
end;
return {
    mockServices = function(v14, v15) --[[ Line: 42 ]]
        -- upvalues: v13 (copy), v8 (copy), v1 (copy), v3 (copy), l_AppStyleProvider_0 (copy), v7 (copy), l_RoactServices_0 (copy)
        local v16 = {
            store = v15 or v13(v8)
        };
        local v17 = {
            storeProvider = v1.createElement(v3.StoreProvider, v16, {
                styleProvider = v1.createElement(l_AppStyleProvider_0, {
                    style = v7
                }, v14)
            })
        };
        return (v1.createElement(l_RoactServices_0.ServiceProvider, {}, v17));
    end, 
    mockStore = v13
};