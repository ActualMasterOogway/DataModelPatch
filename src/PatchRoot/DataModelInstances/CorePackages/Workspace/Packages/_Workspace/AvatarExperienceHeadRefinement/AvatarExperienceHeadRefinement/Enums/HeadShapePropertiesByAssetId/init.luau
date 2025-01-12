local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceHeadRefinement").Parent;
local v1 = require(l_Parent_0.Dash);
local v2 = require(script.Parent.HeadShapeProperties);
return (v1.keyBy(v2, function(v3, _) --[[ Line: 11 ]]
    return (tostring(v3.assetId));
end));