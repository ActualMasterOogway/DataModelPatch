local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Types_0 = l_Parent_0.Types;
local v3 = require(l_Parent_1.Rodux);
local _ = require(l_Types_0.ReducerTypes);
local _ = require(l_Types_0.ActionTypes);
local l_RequestSent_0 = require(l_Parent_0.Actions).RequestSent;
local v7 = require(l_Parent_1.Dash);
local v8 = {};
return function(_) --[[ Line: 13 ]]
    -- upvalues: v3 (copy), v8 (copy), l_RequestSent_0 (copy), v7 (copy)
    return v3.createReducer(v8, {
        [l_RequestSent_0.name] = function(v10, v11) --[[ Line: 15 ]]
            -- upvalues: v7 (ref)
            return v7.join(v10, {
                [v11.payload.id] = true
            });
        end
    });
end;