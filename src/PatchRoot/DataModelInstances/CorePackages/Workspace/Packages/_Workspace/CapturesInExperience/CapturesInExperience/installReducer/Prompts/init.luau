local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Cryo);
local v3 = require(l_Parent_1.Rodux);
local v4 = require(l_Parent_0.Actions.PromptDismissed);
local v5 = require(l_Parent_0.Actions.PromptTriggered);
local _ = require(l_Parent_0.Types);
return v3.createReducer({}, {
    [v4.name] = function(v7, v8) --[[ Line: 16 ]]
        -- upvalues: v2 (copy)
        return v2.List.filter(v7, function(v9) --[[ Line: 17 ]]
            -- upvalues: v8 (copy)
            return v9.PromptId ~= v8.promptId;
        end);
    end, 
    [v5.name] = function(v10, v11) --[[ Line: 22 ]]
        -- upvalues: v2 (copy)
        local v12 = {
            PromptData = v11.promptData, 
            PromptType = v11.promptType, 
            PromptId = v11.promptId
        };
        return v2.List.join(v10, {
            v12
        });
    end
});