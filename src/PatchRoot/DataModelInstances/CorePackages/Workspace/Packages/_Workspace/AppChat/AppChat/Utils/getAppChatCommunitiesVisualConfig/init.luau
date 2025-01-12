local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.SharedFlags);
local v2 = game:DefineFastFlag("AppChatCommunitiesGlobeIcon", false);
local l_GetFFlagUseCommunitiesTranslation_0 = v1.GetFFlagUseCommunitiesTranslation;
return function() --[[ Line: 14 ]]
    -- upvalues: l_GetFFlagUseCommunitiesTranslation_0 (copy), v2 (copy)
    local v4 = "CommonUI.Features.Label.sGroups";
    local v5 = "icons/menu/groups";
    local v6 = "icons/menu/groups_large";
    if l_GetFFlagUseCommunitiesTranslation_0() then
        v4 = "Feature.SocialTab.Label.Groups";
    end;
    if v2 then
        v5 = "icons/menu/community_medium";
        v6 = "icons/menu/community_medium";
    end;
    return {
        label = v4, 
        icon = v5, 
        iconLarge = v6
    };
end;