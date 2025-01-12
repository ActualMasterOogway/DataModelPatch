local l_Parent_0 = script.Parent.Parent;
local l_Workspace_0 = game:GetService("Workspace");
local v2 = require(l_Parent_0.Actions.SetPromptState);
local v3 = require(l_Parent_0.Actions.PurchaseCompleteRecieved);
local v4 = require(l_Parent_0.Enums.PromptState);
local v5 = require(l_Parent_0.Thunk);
return function() --[[ Line: 16 ]] --[[ Name: completePurchase ]]
    -- upvalues: v5 (copy), l_Workspace_0 (copy), v3 (copy), v2 (copy), v4 (copy)
    return v5.new(script.Name, {}, function(v6, _) --[[ Line: 17 ]]
        -- upvalues: l_Workspace_0 (ref), v3 (ref), v2 (ref), v4 (ref)
        local l_purchasingStartTime_0 = v6:getState().purchasingStartTime;
        local v9 = l_Workspace_0.DistributedGameTime - l_purchasingStartTime_0;
        v6:dispatch(v3());
        if v9 >= 1 then
            return v6:dispatch(v2(v4.PurchaseComplete));
        else
            delay(1 - v9, function() --[[ Line: 26 ]]
                -- upvalues: v6 (copy), v2 (ref), v4 (ref)
                return v6:dispatch(v2(v4.PurchaseComplete));
            end);
            return;
        end;
    end);
end;