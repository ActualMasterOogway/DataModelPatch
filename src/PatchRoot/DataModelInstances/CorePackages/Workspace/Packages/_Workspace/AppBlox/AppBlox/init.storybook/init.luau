local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppBlox");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Dev.ReactRoblox);
return {
    name = l_script_FirstAncestor_0.Name, 
    roact = v2, 
    reactRoblox = v3, 
    storyRoots = {
        l_script_FirstAncestor_0
    }
};