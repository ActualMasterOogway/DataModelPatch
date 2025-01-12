local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialTab");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local v2 = require(l_script_FirstAncestor_0.User);
local l_SocialLibraries_0 = v1.SocialLibraries;
local l_SelfViewProfileDiscoverabilityUpsellIXP_0 = v1.SelfViewProfileDiscoverabilityUpsellIXP;
local l_getDeepValue_0 = l_SocialLibraries_0.Dictionary.getDeepValue;
return function(v6, v7) --[[ Line: 8 ]]
    -- upvalues: l_SelfViewProfileDiscoverabilityUpsellIXP_0 (copy), l_getDeepValue_0 (copy), v2 (copy)
    local v8 = if l_SelfViewProfileDiscoverabilityUpsellIXP_0.SetupEnabled() then l_getDeepValue_0(v6, "SocialTab.ShowContactImporterParams") or {} else nil;
    return {
        unreadConversationCount = v6.SocialTab.UnreadConversationCount or 0, 
        numberOfNotifications = v6.NotificationBadgeCounts.TopBarNotificationIcon, 
        localUser = v2.mapToUsers(v6, v7)(v6.LocalUserId), 
        localUserId = v6.LocalUserId or nil, 
        isPhoneVerified = if l_SelfViewProfileDiscoverabilityUpsellIXP_0.SetupEnabled() then v8.isPhoneVerified else nil, 
        isDiscoverabilityUnset = if l_SelfViewProfileDiscoverabilityUpsellIXP_0.SetupEnabled() then v8.isDiscoverabilityUnset else nil
    };
end;