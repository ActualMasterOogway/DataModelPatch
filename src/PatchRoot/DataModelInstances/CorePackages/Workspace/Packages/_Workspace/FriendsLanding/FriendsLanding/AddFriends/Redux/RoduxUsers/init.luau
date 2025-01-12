local l_Parent_0 = script:FindFirstAncestor("FriendsLanding").Parent;
local v1 = require(l_Parent_0.RoduxUsers);
local v2 = require(script.Parent.RODUX_KEY);
return v1.config({
    keyPath = ("%*.Users"):format(v2)
});