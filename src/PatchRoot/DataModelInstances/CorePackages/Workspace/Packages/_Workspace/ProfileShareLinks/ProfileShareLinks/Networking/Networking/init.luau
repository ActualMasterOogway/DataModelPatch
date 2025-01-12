local l_Parent_0 = script:FindFirstAncestor("ProfileShareLinks").Parent;
local l_NetworkingShareLinks_0 = require(l_Parent_0.LuaSocialLibrariesDeps).NetworkingShareLinks;
local v2 = require(script.Parent.configuredRoduxNetworking);
return {
    NetworkingShareLinks = l_NetworkingShareLinks_0.config({
        roduxNetworking = v2
    })
};