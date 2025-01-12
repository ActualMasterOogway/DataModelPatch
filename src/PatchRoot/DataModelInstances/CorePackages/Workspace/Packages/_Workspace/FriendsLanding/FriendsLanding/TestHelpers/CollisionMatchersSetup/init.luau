local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local v1 = require(l_script_FirstAncestor_0.devDependencies);
v1.JestGlobals.expect.extend(v1.CollisionMatchers.Jest);