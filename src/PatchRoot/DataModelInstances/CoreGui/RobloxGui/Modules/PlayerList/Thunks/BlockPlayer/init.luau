local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local v1 = require(l_RobloxGui_0.Modules.BlockingUtility);
local l_Parent_0 = script.Parent.Parent;
local v3 = require(l_Parent_0.Actions.SetPlayerIsBlocked);
return function(v4) --[[ Line: 10 ]] --[[ Name: BlockPlayer ]]
    -- upvalues: v1 (copy), v3 (copy)
    return function(v5) --[[ Line: 11 ]]
        -- upvalues: v1 (ref), v4 (copy), v3 (ref)
        coroutine.wrap(function() --[[ Line: 12 ]]
            -- upvalues: v1 (ref), v4 (ref), v5 (copy), v3 (ref)
            if v1:BlockPlayerAsync(v4) then
                v5:dispatch(v3(v4, true));
            end;
        end)();
    end;
end;