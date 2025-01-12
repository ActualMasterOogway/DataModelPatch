local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_script_FirstAncestor_0.types);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.React);
local l_memo_0 = v4.memo;
local v6 = require(l_script_FirstAncestor_0.Analytics.useAnalytics);
local l_useCallback_0 = v4.useCallback;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useEffect_0 = v4.useEffect;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v11 = require(l_script_FirstAncestor_0.Hooks.useUnfilteredThreadsConversationBanner);
local l_useStyle_0 = require(l_Parent_0.UIBlox).Core.Style.useStyle;
local v13 = require(l_Parent_0.AppChatNetworking);
local l_UnfilteredThreadsConversationBanner_0 = v13.Constants.UnfilteredThreadsConversationBanner;
local v15 = require(l_script_FirstAncestor_0.Models.ConversationChannels);
local v16 = require(l_script_FirstAncestor_0.EnumScreens);
local v17 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local v18 = require(script.Parent.ConversationBanner);
local v19 = game:DefineFastFlag("EnforceHideBannerForTrustedComms", true);
local v20 = require(l_script_FirstAncestor_0.Flags.unfilteredThreadsModalActionConfig);
local v23 = {
    conversation = {}, 
    navigateToScreen = function(_) --[[ Line: 44 ]] --[[ Name: navigateToScreen ]]

    end, 
    setBannerHeight = function(_) --[[ Line: 45 ]] --[[ Name: setBannerHeight ]]

    end, 
    bodyKey = "Feature.Chat.Label.ConversationIsFiltered", 
    learnMoreKey = "Feature.Chat.Action.LearnMore", 
    removeFiltersKey = "Feature.Chat.Action.RemoveFilters"
};
local l_PhoneVerificationPartialModal_0 = v16.PhoneVerificationPartialModal;
local l_CreateUnfilteredChatPartialModal_0 = v16.CreateUnfilteredChatPartialModal;
local l_LearnMorePartialModal_0 = v16.LearnMorePartialModal;
local v27 = {
    [l_UnfilteredThreadsConversationBanner_0.DUPLICATE_UPGRADE] = l_CreateUnfilteredChatPartialModal_0, 
    [l_UnfilteredThreadsConversationBanner_0.PHONE_VERIFICATION_GROUP] = l_PhoneVerificationPartialModal_0, 
    [l_UnfilteredThreadsConversationBanner_0.PHONE_VERIFICATION_ONE_TO_ONE] = l_PhoneVerificationPartialModal_0, 
    [l_UnfilteredThreadsConversationBanner_0.LEARN_MORE] = l_LearnMorePartialModal_0
};
local v28 = {
    [l_PhoneVerificationPartialModal_0] = "ConversationPvBanner", 
    [l_CreateUnfilteredChatPartialModal_0] = "ConversationUpgradeBanner", 
    [l_LearnMorePartialModal_0] = "ConversationLearnMoreBanner"
};
return l_memo_0(function(v29) --[[ Line: 71 ]] --[[ Name: UnfilteredThreadsBannerContainer ]]
    -- upvalues: v3 (copy), v23 (copy), l_useStyle_0 (copy), v6 (copy), l_useDispatch_0 (copy), v11 (copy), v19 (copy), v15 (copy), v27 (copy), l_useCallback_0 (copy), v28 (copy), v17 (copy), l_useEffect_0 (copy), v13 (copy), v20 (copy), l_useLocalization_0 (copy), v4 (copy), v18 (copy), l_LearnMorePartialModal_0 (copy)
    local v30 = v3.Dictionary.union(v23, v29);
    local v31 = l_useStyle_0();
    local v32 = v6();
    local l_Size_500_0 = v31.Tokens.Global.Size_500;
    local v34 = true;
    local v35 = l_useDispatch_0();
    local v36 = v11(v30.conversation.id);
    if v19 and v30.conversation.moderationType == v15.ModerationType.TrustedComms then
        v34 = false;
    end;
    local v37 = v36 and v27[v36];
    if not v37 then
        v34 = false;
    end;
    local v39 = l_useCallback_0(function() --[[ Line: 93 ]]
        -- upvalues: v32 (copy), v37 (copy), v28 (ref), v17 (ref), v30 (copy)
        if v32 and v37 then
            local v38 = v28[v37];
            v32.fireAnalyticsEvent(v17[("%*ActionClicked"):format(v38)], {
                conversationId = v30.conversation.id
            });
        end;
        v30.navigateToScreen(v37);
    end, {
        v30.navigateToScreen, 
        v37, 
        v30.conversation.id, 
        v32
    });
    l_useEffect_0(function() --[[ Line: 103 ]]
        -- upvalues: v34 (ref), v36 (copy), v35 (copy), v13 (ref), v20 (ref)
        if v34 and v36 then
            v35(v13.rodux.RecordUnfilteredThreadsConversationBannerAction.API(v20.UnfilteredThreadsConversationBannerSeenAction, v36)):catch(function(v40) --[[ Line: 110 ]]
                warn("RecordUnfilteredThreadsConversationBannerAction error in UnfilteredThreadsBannerContainer " .. tostring(v40));
            end);
        end;
    end, {
        v34, 
        v36, 
        v30.conversation.id
    });
    l_useEffect_0(function() --[[ Line: 119 ]]
        -- upvalues: v34 (ref), v32 (copy), v37 (copy), v28 (ref), v17 (ref), v30 (copy)
        if v34 and v32 and v37 then
            local v41 = v28[v37];
            v32.fireAnalyticsEvent(v17[("%*Rendered"):format(v41)], {
                conversationId = v30.conversation.id
            });
        end;
    end, {
        v34, 
        v37, 
        v30.conversation.id
    });
    l_useEffect_0(function() --[[ Line: 128 ]]
        -- upvalues: v34 (ref), v30 (copy), l_Size_500_0 (copy)
        if v34 then
            v30.setBannerHeight(l_Size_500_0);
            return;
        else
            v30.setBannerHeight(0);
            return;
        end;
    end, {
        v34, 
        l_Size_500_0, 
        v30.setBannerHeight
    });
    local v42 = l_useLocalization_0({
        bodyText = v30.bodyKey, 
        learnMoreText = v30.learnMoreKey, 
        removeFiltersText = v30.removeFiltersKey
    });
    if v34 then
        return v4.createElement(v18, {
            actionText = if v37 == l_LearnMorePartialModal_0 then v42.learnMoreText else v42.removeFiltersText, 
            bodyText = v42.bodyText, 
            onActivated = v39, 
            height = l_Size_500_0, 
            layoutOrder = v30.layoutOrder, 
            style = v31
        });
    else
        return nil;
    end;
end);