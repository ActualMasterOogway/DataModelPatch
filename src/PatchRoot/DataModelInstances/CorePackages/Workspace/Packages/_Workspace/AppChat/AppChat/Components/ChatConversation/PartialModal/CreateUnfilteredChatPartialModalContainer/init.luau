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
local l_useEffectOnMount_0 = require(l_Parent_0.RoactUtils).Hooks.useEffectOnMount;
local v11 = require(l_script_FirstAncestor_0.Hooks.useGetConversationFromId);
local l_useIsLocalPlayerPartyVoiceEligible_0 = require(l_Parent_0.SquadsCore).Hooks.useIsLocalPlayerPartyVoiceEligible;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useScreenSize_0 = require(l_Parent_0.RobloxAppHooks).useScreenSize;
local l_useState_0 = v4.useState;
local v16 = require(l_Parent_0.AppChatNetworking);
local v17 = require(l_script_FirstAncestor_0.Models.ConversationChannels);
local v18 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local l_useStyle_0 = require(l_Parent_0.UIBlox).Core.Style.useStyle;
local v20 = require(script.Parent.PartialModal);
local v21 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatRelaxedFiltersPartialModalUpdates);
local v24 = {
    conversationId = "", 
    onDismissed = function() --[[ Line: 46 ]] --[[ Name: onDismissed ]]

    end, 
    navigateToConversation = function(_) --[[ Line: 47 ]] --[[ Name: navigateToConversation ]]

    end, 
    navigateToToast = function(_) --[[ Line: 48 ]] --[[ Name: navigateToToast ]]

    end, 
    titleKey = "Feature.Chat.Heading.CreateUnfilteredChatDialog", 
    bodyKey = "Feature.Chat.Description.CreateUnfilteredChatDialog", 
    bodyKeyWithVoice = "Feature.Chat.Description.CreateUnfilteredChatWithVoice", 
    networkErrorTextKey = "Feature.Toast.NetworkingError.SomethingIsWrong", 
    actionKey = "Feature.Chat.Action.Create"
};
return l_memo_0(function(v25) --[[ Line: 57 ]] --[[ Name: CreateUnfilteredChatPartialModalContainer ]]
    -- upvalues: v3 (copy), v24 (copy), l_useStyle_0 (copy), l_useScreenSize_0 (copy), l_useState_0 (copy), l_useDispatch_0 (copy), v11 (copy), v6 (copy), v21 (copy), l_useIsLocalPlayerPartyVoiceEligible_0 (copy), l_useEffectOnMount_0 (copy), v18 (copy), l_useLocalization_0 (copy), l_useCallback_0 (copy), v16 (copy), l_useEffect_0 (copy), v17 (copy), v4 (copy), v20 (copy)
    local v26 = v3.Dictionary.union(v24, v25);
    local v27 = l_useStyle_0();
    local v28 = l_useScreenSize_0();
    local v29, v30 = l_useState_0(false);
    local v31 = l_useDispatch_0();
    local v32 = v11(v26.conversationId);
    local v33 = v6();
    local v34 = if v21() then l_useIsLocalPlayerPartyVoiceEligible_0() else nil;
    l_useEffectOnMount_0(function() --[[ Line: 69 ]]
        -- upvalues: v33 (copy), v18 (ref), v26 (copy)
        if v33 then
            v33.fireAnalyticsEvent(v18.ConversationUpgradeDialogRendered, {
                conversationId = v26.conversationId
            });
        end;
    end);
    local v35 = l_useLocalization_0({
        networkErrorText = v26.networkErrorTextKey, 
        titleText = v26.titleKey, 
        bodyText = v26.bodyKey, 
        bodyTextWithVoice = if v21() then v26.bodyKeyWithVoice else nil, 
        actionText = v26.actionKey
    });
    local v36 = l_useCallback_0(function() --[[ Line: 85 ]]
        -- upvalues: v26 (copy), v35 (copy)
        v26.navigateToToast(v35.networkErrorText);
    end, {
        v26.navigateToToast, 
        v35.networkErrorText
    });
    local v40 = l_useCallback_0(function() --[[ Line: 90 ]]
        -- upvalues: v33 (copy), v18 (ref), v26 (copy), v30 (copy), v31 (copy), v16 (ref), v36 (copy)
        if v33 then
            v33.fireAnalyticsEvent(v18.ConversationUpgradeDialogActionClicked, {
                conversationId = v26.conversationId
            });
        end;
        v30(true);
        v31(v16.rodux.DuplicateConversation.API(v26.conversationId, "trusted_comms")):andThen(function(v37) --[[ Line: 98 ]]
            -- upvalues: v26 (ref), v36 (ref)
            local l_responseBody_0 = v37.responseBody;
            local v39 = l_responseBody_0 and l_responseBody_0.conversations and l_responseBody_0.conversations[1] and l_responseBody_0.conversations[1].id;
            if v39 then
                v26.navigateToConversation(v39);
                return;
            else
                v36();
                return;
            end;
        end):catch(function() --[[ Line: 110 ]]
            -- upvalues: v36 (ref)
            v36();
        end):finally(function() --[[ Line: 113 ]]
            -- upvalues: v30 (ref)
            v30(false);
        end);
    end, {
        v31, 
        v30, 
        v36, 
        v26.navigateToConversation, 
        v26.conversationId, 
        v33
    });
    if not v21() then
        l_useEffect_0(function() --[[ Line: 121 ]]
            -- upvalues: v32 (copy), v17 (ref), v26 (copy)
            if v32 and v32.moderationType == v17.ModerationType.TrustedComms then
                v26.onDismissed();
            end;
        end, {
            v32, 
            v26.onDismissed
        });
    end;
    local v41 = l_useCallback_0(function() --[[ Line: 128 ]]
        -- upvalues: v33 (copy), v18 (ref), v26 (copy)
        if v33 then
            v33.fireAnalyticsEvent(v18.ConversationUpgradeDialogDismissed, {
                conversationId = v26.conversationId
            });
        end;
        v26.onDismissed();
    end, {
        v26.onDismissed, 
        v33, 
        v26.conversationId
    });
    return v4.createElement(v20, {
        titleText = v35.titleText, 
        bodyText = if v21() and v34 then v35.bodyTextWithVoice else v35.bodyText, 
        actionText = v35.actionText, 
        isButtonDisabled = v29, 
        screenSize = v28, 
        onActivated = v40, 
        onDismissed = v41, 
        style = v27
    });
end);