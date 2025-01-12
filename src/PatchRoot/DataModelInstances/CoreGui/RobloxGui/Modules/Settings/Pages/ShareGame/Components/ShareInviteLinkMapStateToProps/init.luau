local l_CorePackages_0 = game:GetService("CorePackages");
local l_ReducerDependencies_0 = require(l_CorePackages_0.Workspace.Packages.NotificationsCommon).ReducerDependencies;
local l_NetworkingShareLinks_0 = l_ReducerDependencies_0.NetworkingShareLinks;
local l_RoduxShareLinks_0 = l_ReducerDependencies_0.RoduxShareLinks;
return function(v4) --[[ Line: 6 ]]
    -- upvalues: l_NetworkingShareLinks_0 (copy), l_RoduxShareLinks_0 (copy)
    return {
        shareInviteLink = v4.ShareLinks.Invites.ShareInviteLink, 
        fetchShareInviteLinkNetworkStatus = l_NetworkingShareLinks_0.GenerateLink.getStatus(v4, {
            linkType = l_RoduxShareLinks_0.Enums.LinkType.ExperienceInvite.rawValue()
        })
    };
end;