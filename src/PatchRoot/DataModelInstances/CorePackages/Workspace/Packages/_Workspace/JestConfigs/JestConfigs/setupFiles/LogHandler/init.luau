local l_LogService_0 = game:GetService("LogService");
local l_Parent_0 = script:FindFirstAncestor("JestConfigs").Parent;
local v2 = require(l_Parent_0.JestGlobals);
local l_jest_0 = v2.jest;
local l_beforeAll_0 = v2.beforeAll;
local l_afterAll_0 = v2.afterAll;
local l_expect_0 = v2.expect;
local v7 = false;
local v8 = nil;
l_beforeAll_0(function() --[[ Line: 15 ]]
    -- upvalues: l_expect_0 (copy), l_LogService_0 (copy), v7 (ref), v8 (ref)
    l_expect_0.extend({
        toHaveNoOutput = function(_, v10, v11) --[[ Line: 17 ]] --[[ Name: toHaveNoOutput ]]
            if v10 then
                return {
                    pass = false, 
                    message = function() --[[ Line: 21 ]] --[[ Name: message ]]
                        -- upvalues: v11 (copy)
                        return (("Has hit an error or warning message: %*"):format(v11));
                    end
                };
            else
                return {
                    pass = true, 
                    message = function() --[[ Line: 28 ]] --[[ Name: message ]]
                        return "Expected an error or warning message";
                    end
                };
            end;
        end
    });
    l_LogService_0.MessageOut:Connect(function(v12, v13) --[[ Line: 36 ]]
        -- upvalues: v7 (ref), v8 (ref)
        if v13 == Enum.MessageType.MessageError or v13 == Enum.MessageType.MessageWarning then
            v7 = true;
            v8 = v12;
        end;
    end);
end);
l_afterAll_0(function() --[[ Line: 44 ]]
    -- upvalues: l_jest_0 (copy), l_expect_0 (copy), v7 (ref), v8 (ref)
    l_jest_0.useRealTimers();
    task.wait(0.2);
    l_expect_0(v7).toHaveNoOutput(v8);
end);