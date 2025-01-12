local l_Parent_0 = script:FindFirstAncestor("FriendsLanding").Parent;
local v1 = require(l_Parent_0.LuaSocialLibrariesDeps);
local v2 = require(script.Parent.RODUX_KEY);
return v1.RoduxPresence.config({
    keyPath = ("%*.Presence"):format(v2)
});