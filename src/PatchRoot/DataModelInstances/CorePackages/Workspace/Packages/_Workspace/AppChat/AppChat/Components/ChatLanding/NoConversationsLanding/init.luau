local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.React);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v3 = require(l_Parent_0.Foundation);
local l_default_0 = require(l_Parent_0.SocialCommon).Experiments.NewChatTabExperimentation.default;
local l_GetFFlagAppChatRebrandStringUpdates_0 = require(l_Parent_0.SharedFlags).GetFFlagAppChatRebrandStringUpdates;
local v6 = {
    friends = {
        icon = "rbxasset://textures/ui/LuaChat/icons/ic-friends.png", 
        copy = l_GetFFlagAppChatRebrandStringUpdates_0() and "Feature.Chat.Message.MakeFriendsToParty" or "Feature.Chat.Message.MakeFriendsToChat", 
        cta = "Feature.SettingsHub.Label.NoFriendsScreen"
    }, 
    regional = {
        icon = "icons/status/oof_xlarge", 
        copy = l_GetFFlagAppChatRebrandStringUpdates_0() and "Feature.Chat.Message.PartyUnavailableRegion" or "Feature.Chat.Message.ChatUnavailableRegion", 
        cta = nil
    }, 
    privacy = {
        icon = "rbxasset://textures/ui/LuaChat/icons/ic-friends.png", 
        copy = l_GetFFlagAppChatRebrandStringUpdates_0() and "Feature.Chat.Message.TurnOnParty" or "Feature.Chat.Message.TurnOnChat", 
        cta = "Feature.Chat.Label.PrivacySettings"
    }, 
    fallback = {
        icon = "icons/status/oof_xlarge", 
        copy = "CommonUI.Messages.Response.PageError", 
        cta = nil
    }
};
local function _(v7) --[[ Line: 58 ]] --[[ Name: getEmptyStateFromProps ]]
    if v7.chatEnabled then
        return "friends";
    elseif not v7.globalRulesEnabled then
        return "regional";
    elseif not v7.privacySettingsEnabled then
        return "privacy";
    else
        return "fallback";
    end;
end;
return function(v9) --[[ Line: 70 ]] --[[ Name: NoConversationsLanding ]]
    -- upvalues: v6 (copy), l_useLocalization_0 (copy), v1 (copy), l_default_0 (copy), v3 (copy)
    local v10 = v9.chatEnabled and "friends" or if v9.globalRulesEnabled then v9.privacySettingsEnabled and "fallback" or "privacy" else "regional";
    local v11 = v6[v10];
    local v12 = v11.cta ~= nil;
    if v10 == "friends" and not v9.canNavigateToAddFriends then
        v12 = false;
    elseif v10 == "privacy" and not v9.canNavigateToPrivacySettings then
        v12 = false;
    end;
    local v13 = l_useLocalization_0({
        callToAction = v11.cta or "Feature.Chat.Label.PrivacySettings", 
        copy = v11.copy
    });
    v1.useEffect(function() --[[ Line: 85 ]]
        -- upvalues: l_default_0 (ref), v9 (copy), v10 (copy)
        if l_default_0.isEnabled() and v9.fireRenderEvent then
            v9.fireRenderEvent(v10);
        end;
    end, {
        v9.fireRenderEvent, 
        v10
    });
    return v1.createElement(v3.Empty, {
        icon = {
            name = v11.icon, 
            size = "XLarge"
        }, 
        text = v13.copy, 
        button = if v12 then {
            text = v13.callToAction, 
            icon = "icons/navigation/externallink_medium", 
            onActivated = function() --[[ Line: 101 ]] --[[ Name: onActivated ]]
                -- upvalues: v9 (copy), v10 (copy)
                v9.onCallToAction(v10);
            end
        } else nil
    });
end;