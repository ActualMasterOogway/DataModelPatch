local l_script_0 = script;
local l_Parent_0 = l_script_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.RoduxNetworking);
local v4 = require(l_Parent_0.UserBlockingNetworking);
local v5 = require(l_script_0.Reducers.UserBlockingReducer);
return {
    config = function(v6) --[[ Line: 10 ]] --[[ Name: config ]]
        -- upvalues: v2 (copy), v4 (copy), v3 (copy), v5 (copy)
        v6 = v2.Dictionary.join(v6, {
            userBlockingNetworking = v4.config({
                roduxNetworking = v3.mock()
            })
        });
        return {
            installReducer = function() --[[ Line: 18 ]] --[[ Name: installReducer ]]
                -- upvalues: v5 (ref), v6 (ref)
                return v5(v6);
            end
        };
    end
};