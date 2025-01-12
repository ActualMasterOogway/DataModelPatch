local l_script_FirstAncestor_0 = script:FindFirstAncestor("AbuseReportMenu");
local l_RobloxGui_0 = game:GetService("CoreGui").RobloxGui;
local v2 = require(l_script_FirstAncestor_0.Components.Constants);
local v3 = require(l_script_FirstAncestor_0.IXP.TnSIXPWrapper);
local l_default_0 = require(l_RobloxGui_0.Modules.VoiceChat.VoiceChatServiceManager).default;
local function _(v5) --[[ Line: 10 ]]
    -- upvalues: l_default_0 (copy)
    return l_default_0:getRecentUsersInteractionData()[tostring(v5.UserId)] ~= nil;
end;
handlePreselectedPlayer = function(v7, v8, v9, v10) --[[ Line: 15 ]] --[[ Name: handlePreselectedPlayer ]]
    -- upvalues: l_default_0 (copy), v2 (copy), v3 (copy)
    if v8 and l_default_0:getRecentUsersInteractionData()[tostring(v7.UserId)] ~= nil then
        v9({
            type = v2.PlayerMenuActions.UpdateMethodOfAbuse, 
            methodOfAbuse = v2.AbuseMethods.VoiceChat
        });
        v10({
            type = v2.AnalyticsActions.SetTypeOfAbuseSelection, 
            selection = v2.AbuseMethods.VoiceChat
        });
    elseif v3.getReportAnythingAvatarEnabled() then
        v9({
            type = v2.PlayerMenuActions.UpdateMethodOfAbuse, 
            methodOfAbuse = v2.AbuseMethods.TextChat
        });
        v10({
            type = v2.AnalyticsActions.SetTypeOfAbuseSelection, 
            selection = v2.AbuseMethods.TextChat
        });
    end;
    v9({
        type = v2.PlayerMenuActions.SetPreselectedPlayer, 
        player = v7
    });
end;
return handlePreselectedPlayer;