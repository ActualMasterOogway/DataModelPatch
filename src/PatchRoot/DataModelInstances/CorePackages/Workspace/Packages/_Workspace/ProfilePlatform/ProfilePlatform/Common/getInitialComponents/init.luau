local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Common.Enums);
local v3 = require(l_Parent_0.SocialCommon);
local l_FFlagCapturesPostEnabledForAll_0 = require(l_Parent_0.SharedFlags).FFlagCapturesPostEnabledForAll;
local l_FFlagEnableOnPlatformSharingExperiment_0 = require(l_Parent_0.SharedFlags).FFlagEnableOnPlatformSharingExperiment;
local v6 = require(l_script_FirstAncestor_0.Flags.FFlagProfilePlatformEnableQuickLinks);
local l_FFlagContactInvitesInProfilePlatform_0 = require(l_Parent_0.SharedFlags).FFlagContactInvitesInProfilePlatform;
local _ = require(l_script_FirstAncestor_0.Types.Component);
return function(v9) --[[ Line: 19 ]]
    -- upvalues: v2 (copy), v3 (copy), l_FFlagContactInvitesInProfilePlatform_0 (copy), l_FFlagEnableOnPlatformSharingExperiment_0 (copy), l_FFlagCapturesPostEnabledForAll_0 (copy), v6 (copy)
    local v10 = {
        {
            component = v2.Components.UserProfileHeader, 
            context = if v9 == v3.Enums.ContextualInfoTypes.MutualFriends then v2.ContextualTypes.MutualFriends else nil
        }, 
        {
            component = v2.Components.SocialLinks
        }, 
        {
            component = v2.Components.About
        }, 
        {
            component = v2.Components.CurrentlyWearing
        }, 
        {
            component = v2.Components.ViewFullProfile
        }, 
        {
            component = v2.Components.Actions, 
            context = if l_FFlagContactInvitesInProfilePlatform_0 and v9 == v3.Enums.ContextualInfoTypes.OffNetworkFriendRequest then v2.ContextualTypes.OffNetworkFriendRequest else nil
        }
    };
    if l_FFlagEnableOnPlatformSharingExperiment_0 or l_FFlagCapturesPostEnabledForAll_0 then
        table.insert(v10, {
            component = v2.Components.ContentPosts
        });
    end;
    if v6 then
        table.insert(v10, {
            component = v2.Components.QuickLinks
        });
    end;
    return v10;
end;