local l_LogService_0 = game:GetService("LogService");
local l_Parent_0 = script:FindFirstAncestor("ExperienceLoadingScript").Parent;
local v2 = require(l_Parent_0.Dev.JestGlobals);
local l_beforeAll_0 = v2.beforeAll;
local l_afterAll_0 = v2.afterAll;
local l_expect_0 = v2.expect;
local v6 = false;
l_beforeAll_0(function() --[[ Line: 13 ]]
    -- upvalues: l_LogService_0 (copy), v6 (ref)
    l_LogService_0.MessageOut:Connect(function(_, v8) --[[ Line: 14 ]]
        -- upvalues: v6 (ref)
        if v8 == Enum.MessageType.MessageError then
            v6 = true;
        end;
    end);
end);
l_afterAll_0(function() --[[ Line: 21 ]]
    -- upvalues: l_expect_0 (copy), v6 (ref)
    task.wait(0.2);
    l_expect_0(v6).toBe(false);
end);