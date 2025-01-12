local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuaSocialLibrariesDeps);
local v2 = require(l_Parent_0.HttpRequest);
local v3 = v2.config({
    requestFunction = v2.requestFunctions.HttpRbxApi
});
local l_sortFriendsByCorrectedPresenceAndRank_0 = v1.SocialLibraries.config({}).User.sortFriendsByCorrectedPresenceAndRank;
return {
    networkImpl = v3, 
    sortFriendsByCorrectedPresenceAndRank = l_sortFriendsByCorrectedPresenceAndRank_0
};