local l_Parent_0 = script:FindFirstAncestor("SocialCommon").Parent;
local v1 = require(l_Parent_0.LuaSocialLibrariesDeps);
local v2 = require(l_Parent_0.Dev.JestGlobals);
local l_CollisionMatchers_0 = v1.CollisionMatchers;
v2.expect.extend(l_CollisionMatchers_0.Jest);