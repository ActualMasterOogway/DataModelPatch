local l_CorePackages_0 = game:GetService("CorePackages");
local l_ShareGame_0 = game:GetService("CoreGui").RobloxGui.Modules.Settings.Pages.ShareGame;
local l_Immutable_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Immutable;
local v3 = require(l_ShareGame_0.Actions.ReceivedUserInviteStatus);
local v4 = require(l_ShareGame_0.Actions.StoppedToastTimer);
local l_InviteStatus_0 = require(l_ShareGame_0.Constants).InviteStatus;
return function(v6, v7) --[[ Line: 13 ]]
    -- upvalues: v3 (copy), l_InviteStatus_0 (copy), l_Immutable_0 (copy), v4 (copy)
    v6 = v6 or {
        failedInvites = {}
    };
    if v7.type == v3.name then
        local l_inviteStatus_0 = v7.inviteStatus;
        if l_inviteStatus_0 == l_InviteStatus_0.Moderated or l_inviteStatus_0 == l_InviteStatus_0.Failed then
            local v9 = {
                timeStamp = tick(), 
                userId = v7.userId, 
                status = l_inviteStatus_0
            };
            return (l_Immutable_0.JoinDictionaries(v6, {
                failedInvites = l_Immutable_0.JoinDictionaries(v6.failedInvites, l_Immutable_0.Append(v6.failedInvites, v9))
            }));
        end;
    elseif v7.type == v4.name then
        v6 = l_Immutable_0.JoinDictionaries(v6, {
            failedInvites = {}
        });
    end;
    return v6;
end;