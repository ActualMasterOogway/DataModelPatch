local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Cryo);
local v3 = require(l_Parent_1.Rodux);
local _ = require(l_Parent_0.Types);
local v5 = require(l_Parent_0.Actions.ComposerClosed);
local v6 = require(l_Parent_0.Actions.ComposerOpened);
local v7 = {
    Capture = nil, 
    IsOpen = false
};
return v3.createReducer(v7, {
    [v5.name] = function(v8, _) --[[ Line: 22 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v8, {
            IsOpen = false
        });
    end, 
    [v6.name] = function(v10, v11) --[[ Line: 28 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v10, {
            Capture = v11.capture, 
            IsOpen = true
        });
    end
});