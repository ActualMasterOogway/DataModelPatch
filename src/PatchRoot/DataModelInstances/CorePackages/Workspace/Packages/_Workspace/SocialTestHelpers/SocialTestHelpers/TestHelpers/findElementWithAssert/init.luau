local l_Parent_0 = script:FindFirstAncestor("SocialTestHelpers").Parent;
local l_expect_0 = require(l_Parent_0.JestGlobals).expect;
local v2 = require(l_Parent_0.RhodiumHelpers);
return function(v3) --[[ Line: 9 ]]
    -- upvalues: v2 (copy), l_expect_0 (copy)
    return function(v4, v5) --[[ Line: 10 ]]
        -- upvalues: v2 (ref), v3 (copy), l_expect_0 (ref)
        local v6 = v2.findFirstElement(v4, v3);
        if v5.assertElementExists then
            l_expect_0(v6).never.toBeNil();
            return v6;
        else
            l_expect_0(v6).toBeNil();
            return nil;
        end;
    end;
end;