local l_StarterGui_0 = game:GetService("StarterGui");
local l_Parent_0 = script.Parent;
local v2 = require(l_Parent_0.Actions.SetTopBarEnabled);
return function(v3) --[[ Line: 7 ]] --[[ Name: registerSetCores ]]
    -- upvalues: l_StarterGui_0 (copy), v2 (copy)
    l_StarterGui_0:RegisterSetCore("TopbarEnabled", function(v4) --[[ Line: 8 ]]
        -- upvalues: v3 (copy), v2 (ref)
        if type(v4) == "boolean" then
            v3:dispatch(v2(v4));
            return;
        else
            error("SetCore TopbarEnabled argument must be a boolean", 2);
            return;
        end;
    end);
    l_StarterGui_0:RegisterGetCore("TopbarEnabled", function() --[[ Line: 16 ]]
        -- upvalues: v3 (copy)
        return v3:getState().displayOptions.topbarEnabled;
    end);
end;