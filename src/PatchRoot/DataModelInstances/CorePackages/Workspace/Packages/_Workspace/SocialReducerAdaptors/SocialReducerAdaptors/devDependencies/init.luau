local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Dev.JestGlobals);
local v2 = require(l_Parent_0.LuaSocialLibrariesDeps);
v1.expect.extend(v2.CollisionMatchers.Jest);
local v3 = require(l_Parent_0.FriendsRodux);
return {
    JestGlobals = v1, 
    RoduxUsers = v2.RoduxUsers.config({
        keyPath = "SharedTest.Users"
    }), 
    RoduxFriends = v3.config({
        keyPath = "SharedTest.Friends"
    }), 
    RoduxPresence = v2.RoduxPresence.config({
        keyPath = "SharedTest.Presence"
    })
};