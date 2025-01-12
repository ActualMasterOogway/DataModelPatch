local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Roact);
local v2 = require(l_Parent_0.Rodux);
local v3 = require(l_Parent_0.RoactRodux);
local v4 = require(script.Parent.mockPolicyProvider);
local v5 = require(script.Parent.mockStyle);
local v6 = require(script.Parent.mockLocale);
local v7 = require(script.Parent.mockNavigation);
local v8 = require(script.Parent.mockDesignTokens);
local v9 = v2.Store.new(function() --[[ Line: 14 ]]
    return {};
end, {}, {
    v2.thunkMiddleware
});
return function(v10, v11) --[[ Line: 18 ]]
    -- upvalues: v9 (copy), v7 (copy), v5 (copy), v8 (copy), v6 (copy), v1 (copy), v3 (copy), v4 (copy)
    v11 = v11 or {};
    local v12 = v11.store or v9;
    local l_appPolicy_0 = v11.appPolicy;
    local v14 = v11.mockNavigation or v7;
    local v15 = v11.tokenMappers or {};
    local v16 = v5(v8(v6(v14(v10)), v15));
    return v1.createElement(v3.StoreProvider, {
        store = v12
    }, {
        children = v4(v16, l_appPolicy_0)
    });
end;