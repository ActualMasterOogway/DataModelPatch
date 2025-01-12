local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.Dev.JestGlobals);
local l_afterAll_0 = v1.afterAll;
local l_beforeAll_0 = v1.beforeAll;
return function(v4, v5) --[[ Line: 7 ]]
    -- upvalues: l_beforeAll_0 (copy), l_afterAll_0 (copy)
    local v6 = nil;
    l_beforeAll_0(function() --[[ Line: 9 ]]
        -- upvalues: v6 (ref), v4 (copy), v5 (copy)
        v6 = game:SetFastFlagForTesting(v4, v5);
    end);
    l_afterAll_0(function() --[[ Line: 12 ]]
        -- upvalues: v4 (copy), v6 (ref)
        game:SetFastFlagForTesting(v4, v6);
    end);
end;