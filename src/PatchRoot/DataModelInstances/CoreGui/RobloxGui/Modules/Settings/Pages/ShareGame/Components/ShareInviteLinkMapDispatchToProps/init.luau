local l_CorePackages_0 = game:GetService("CorePackages");
local l_ReducerDependencies_0 = require(l_CorePackages_0.Workspace.Packages.NotificationsCommon).ReducerDependencies;
local l_NetworkingShareLinks_0 = l_ReducerDependencies_0.NetworkingShareLinks;
local l_RoduxShareLinks_0 = l_ReducerDependencies_0.RoduxShareLinks;
return function(v4) --[[ Line: 7 ]]
    -- upvalues: l_NetworkingShareLinks_0 (copy), l_RoduxShareLinks_0 (copy)
    return {
        fetchShareInviteLink = function() --[[ Line: 9 ]] --[[ Name: fetchShareInviteLink ]]
            -- upvalues: v4 (copy), l_NetworkingShareLinks_0 (ref), l_RoduxShareLinks_0 (ref)
            v4(l_NetworkingShareLinks_0.GenerateLink.API({
                linkType = l_RoduxShareLinks_0.Enums.LinkType.ExperienceInvite.rawValue()
            }));
        end
    };
end;