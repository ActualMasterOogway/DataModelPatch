local l_script_FirstAncestor_0 = script:FindFirstAncestor("VerifiedBadges");
local v1 = require(l_script_FirstAncestor_0.Parent.Dev.RoactCompat);
return {
    name = script.Parent.Name, 
    storyRoots = {
        script.Parent.Components
    }, 
    roact = v1
};