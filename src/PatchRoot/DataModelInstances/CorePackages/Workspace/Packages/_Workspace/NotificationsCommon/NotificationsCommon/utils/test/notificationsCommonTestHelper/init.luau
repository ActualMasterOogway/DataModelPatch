local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Rodux);
local v3 = require(l_Parent_0.RoactRodux);
local l_RoactServices_0 = require(l_Parent_0.RoactServices).RoactServices;
local l_createStyleProvider_0 = require(l_Parent_0.Dev.UnitTestHelpers).createStyleProvider;
local v6 = {
    ScreenSize = Vector2.new(500, 500), 
    SetAlias = {
        Aliases = {
            byUserId = {
                ["1"] = "foo"
            }
        }
    }
};
local function v11(v7, v8) --[[ Line: 24 ]]
    -- upvalues: v2 (copy)
    local v10 = v8 or function(v9) --[[ Line: 25 ]]
        return v9;
    end;
    return v2.Store.new(v10, v7 or {}, {
        v2.thunkMiddleware
    });
end;
return {
    mockServices = function(v12) --[[ Line: 32 ]]
        -- upvalues: v1 (copy), v3 (copy), v11 (copy), v6 (copy), l_createStyleProvider_0 (copy), l_RoactServices_0 (copy)
        local v13 = {
            storeProvider = v1.createElement(v3.StoreProvider, {
                store = v11(v6)
            }, {
                styleProvider = l_createStyleProvider_0(v12)
            })
        };
        return (v1.createElement(l_RoactServices_0.ServiceProvider, {}, v13));
    end
};