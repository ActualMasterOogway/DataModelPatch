local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_script_FirstAncestor_0.types);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.React);
local l_memo_0 = v4.memo;
local v6 = require(l_script_FirstAncestor_0.Analytics.useAnalytics);
local l_useCallback_0 = v4.useCallback;
local l_useEffect_0 = v4.useEffect;
local l_useEffectOnMount_0 = require(l_Parent_0.RoactUtils).Hooks.useEffectOnMount;
local v10 = require(l_script_FirstAncestor_0.Hooks.useGetConversationFromId);
local l_useIsLocalPlayerPartyVoiceEligible_0 = require(l_Parent_0.SquadsCore).Hooks.useIsLocalPlayerPartyVoiceEligible;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useScreenSize_0 = require(l_Parent_0.RobloxAppHooks).useScreenSize;
local v14 = require(l_script_FirstAncestor_0.Models.ConversationChannels);
local v15 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local l_useStyle_0 = require(l_Parent_0.UIBlox).Core.Style.useStyle;
local v17 = require(script.Parent.PartialModal);
local v18 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatRelaxedFiltersPartialModalUpdates);
local v19 = {
    conversationId = "", 
    onDismissed = function() --[[ Line: 38 ]] --[[ Name: onDismissed ]]

    end, 
    titleKey = "Feature.Chat.Heading.WhatAreExpressiveChatFeatures", 
    bodyKey = "Feature.Chat.Description.LearnMoreDialog", 
    bodyKeyWithVoice = "Feature.Chat.Description.LearnMoreDialogWithVoice"
};
return l_memo_0(function(v20) --[[ Line: 45 ]] --[[ Name: LearnMorePartialModalContainer ]]
    -- upvalues: v3 (copy), v19 (copy), l_useStyle_0 (copy), l_useScreenSize_0 (copy), v10 (copy), v6 (copy), v18 (copy), l_useIsLocalPlayerPartyVoiceEligible_0 (copy), l_useEffectOnMount_0 (copy), v15 (copy), l_useEffect_0 (copy), v14 (copy), l_useCallback_0 (copy), l_useLocalization_0 (copy), v4 (copy), v17 (copy)
    local v21 = v3.Dictionary.union(v19, v20);
    local v22 = l_useStyle_0();
    local v23 = l_useScreenSize_0();
    local v24 = v10(v21.conversationId);
    local v25 = v6();
    local v26 = if v18() then l_useIsLocalPlayerPartyVoiceEligible_0() else nil;
    l_useEffectOnMount_0(function() --[[ Line: 55 ]]
        -- upvalues: v25 (copy), v15 (ref), v21 (copy)
        if v25 then
            v25.fireAnalyticsEvent(v15.ConversationLearnMoreDialogRendered, {
                conversationId = v21.conversationId
            });
        end;
    end);
    if not v18() then
        l_useEffect_0(function() --[[ Line: 64 ]]
            -- upvalues: v24 (copy), v14 (ref), v21 (copy)
            if v24 and v24.moderationType == v14.ModerationType.TrustedComms then
                v21.onDismissed();
            end;
        end, {
            v24, 
            v21.onDismissed
        });
    end;
    local v27 = l_useCallback_0(function() --[[ Line: 71 ]]
        -- upvalues: v25 (copy), v15 (ref), v21 (copy)
        if v25 then
            v25.fireAnalyticsEvent(v15.ConversationLearnMoreDialogDismissed, {
                conversationId = v21.conversationId
            });
        end;
        v21.onDismissed();
    end, {
        v25, 
        v21.conversationId, 
        v21.onDismissed
    });
    local v28 = l_useLocalization_0({
        titleText = v21.titleKey, 
        bodyText = v21.bodyKey, 
        bodyTextWithVoice = if v18() then v21.bodyKeyWithVoice else nil
    });
    return v4.createElement(v17, {
        titleText = v28.titleText, 
        bodyText = if v18() and v26 then v28.bodyTextWithVoice else v28.bodyText, 
        screenSize = v23, 
        onDismissed = v27, 
        style = v22
    });
end);