local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local l_act_0 = require(l_script_FirstAncestor_0.dependencies).Roact.act;
local l_RunService_0 = game:GetService("RunService");
return function(v3, v4) --[[ Line: 7 ]]
    -- upvalues: l_act_0 (copy), l_RunService_0 (copy)
    local v5 = v4 or 1;
    local v6 = 0;
    while v6 < v5 and not v3() do
        l_act_0(function() --[[ Line: 11 ]]
            -- upvalues: v6 (ref), l_RunService_0 (ref)
            v6 = v6 + l_RunService_0.Heartbeat:Wait();
        end);
    end;
end;