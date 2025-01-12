local l_Parent_0 = script:FindFirstAncestor("TestUtils").Parent;
local l_act_0 = require(l_Parent_0.ReactRoblox).act;
return function(v2, v3) --[[ Line: 10 ]] --[[ Name: waitUntil ]]
    -- upvalues: l_act_0 (copy)
    local v4 = v3 == nil and 1 or v3;
    local v5 = os.clock() + v4;
    local v6 = nil;
    while true do
        if os.clock() < v5 then
            local v7, v8, v9 = pcall(v2);
            if v7 and v8 then
                return v9;
            else
                if not v7 then
                    v6 = v8;
                end;
                l_act_0(function() --[[ Line: 27 ]]
                    task.wait();
                end);
            end;
        else
            local v10 = ("operation has timed out (maximum time allowed was %f seconds)"):format(v4);
            if v6 ~= nil then
                v10 = v10 .. ": " .. tostring(v6);
            end;
            error(v10);
            return;
        end;
    end;
end;