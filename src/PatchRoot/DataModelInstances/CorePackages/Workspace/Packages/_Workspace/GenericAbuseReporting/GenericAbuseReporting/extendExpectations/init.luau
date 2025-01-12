local l_Parent_0 = script:FindFirstAncestor("GenericAbuseReporting").Parent;
local v1 = require(l_Parent_0.Dev.JestGlobals);
local l_beforeAll_0 = v1.beforeAll;
local l_expect_0 = v1.expect;
local v4 = require(l_Parent_0.Dev.CollisionMatchers2D);
l_beforeAll_0(function() --[[ Line: 9 ]]
    -- upvalues: l_expect_0 (copy), v4 (copy)
    l_expect_0.extend(v4.Jest);
end);