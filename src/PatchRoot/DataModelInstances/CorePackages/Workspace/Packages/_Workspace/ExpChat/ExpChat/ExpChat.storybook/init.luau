local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Roact);
local v3 = require(script.storyMiddleware);
return {
    roact = v2, 
    mapStory = v3, 
    storyRoots = {
        l_script_FirstAncestor_0
    }
};