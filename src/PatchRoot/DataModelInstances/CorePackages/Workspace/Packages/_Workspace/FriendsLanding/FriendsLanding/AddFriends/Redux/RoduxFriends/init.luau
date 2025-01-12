local l_Parent_0 = script:FindFirstAncestor("FriendsLanding").Parent;
local v1 = require(l_Parent_0.FriendsRodux);
local v2 = require(script.Parent.RODUX_KEY);
return v1.config({
    keyPath = ("%*.Friends"):format(v2)
});