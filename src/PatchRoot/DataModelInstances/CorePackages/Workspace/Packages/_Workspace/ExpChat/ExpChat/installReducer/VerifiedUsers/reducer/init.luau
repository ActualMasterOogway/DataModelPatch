local l_Parent_0 = script:FindFirstAncestor("ExpChat").Parent;
local v1 = require(l_Parent_0.Rodux);
local l_Dictionary_0 = require(l_Parent_0.llama).Dictionary;
local l_Actions_0 = require(l_Parent_0.ExpChatShared).Actions;
local l_PlayerAdded_0 = l_Actions_0.PlayerAdded;
local l_PlayerRemoved_0 = l_Actions_0.PlayerRemoved;
return v1.createReducer({}, {
    [l_PlayerAdded_0.name] = function(v6, v7) --[[ Line: 16 ]]
        -- upvalues: l_Dictionary_0 (copy)
        return l_Dictionary_0.join(v6, {
            [v7.userId] = v7.hasVerifiedBadge
        });
    end, 
    [l_PlayerRemoved_0.name] = function(v8, v9) --[[ Line: 22 ]]
        -- upvalues: l_Dictionary_0 (copy)
        return l_Dictionary_0.removeKey(v8, v9.userId);
    end
});