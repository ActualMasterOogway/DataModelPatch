local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Dash);
local v3 = require(l_Parent_1.Rodux);
local v4 = require(l_Parent_0.Constants);
local v5 = require(l_Parent_0.installReducer);
local v6 = require(l_Parent_0.App.Networking);
local v7 = require(l_Parent_0.installReducer.ScreenSize);
local v8 = require(l_Parent_0.installReducer.ServerType);
local v9 = {};
return function(v10) --[[ Line: 15 ]] --[[ Name: createStore ]]
    -- upvalues: v2 (copy), v9 (copy), v3 (copy), v4 (copy), v5 (copy), v6 (copy), v7 (copy), v8 (copy)
    local v11 = v2.joinDeep(v9, v10 or {});
    local v12 = v3.combineReducers({
        [v4.RoduxKey] = v5(), 
        NetworkStatus = v6.RoduxNetworking.installReducer(), 
        ScreenSize = v7, 
        ServerType = v8
    });
    return v3.Store.new(v12, v11, {
        v3.thunkMiddleware
    });
end;