local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Roact);
local v3 = require(l_Parent_0.Utility.StoryMiddleware);
return {
    group = "/IAPExperience", 
    roact = v2, 
    mapStory = v3
};