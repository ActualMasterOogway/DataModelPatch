local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Foundation);
local _ = require(l_script_FirstAncestor_0.types);
local v4 = require(l_Parent_0.Cryo);
local v5 = require(l_Parent_0.React);
local v6 = require(l_script_FirstAncestor_0.Utils.getDeepValue2);
local l_memo_0 = v5.memo;
local v8 = require(l_script_FirstAncestor_0.Analytics.useAnalytics);
local l_useCallback_0 = v5.useCallback;
local v10 = require(l_script_FirstAncestor_0.Hooks.useConversationTopModal);
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useEffect_0 = v5.useEffect;
local l_useRef_0 = v5.useRef;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useStyle_0 = require(l_Parent_0.UIBlox).Core.Style.useStyle;
local l_AccessResponseEnum_0 = require(l_Parent_0.AmpUpsell).AmpEnums.AccessResponseEnum;
local v17 = require(l_Parent_0.AppChatNetworking);
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local _ = require(l_script_FirstAncestor_0.Models.ConversationChannels);
local v20 = require(l_script_FirstAncestor_0.Conversations.Actions.DismissedConversationTopModal);
local v21 = require(l_script_FirstAncestor_0.EnumScreens);
local v22 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local l_NavigateBack_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateBack;
local l_NavigateDown_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateDown;
local v25 = require(l_script_FirstAncestor_0.Conversations.Thunks.refreshAllUnfilteredThreadsDetails);
local v26 = require(l_script_FirstAncestor_0.Components.UnfilteredThreadsAMPFeatureName);
local v27 = require(script.Parent.ConversationModal.ConversationModal);
local v28 = require(script.Parent.ConversationBanner.ConversationBanner);
local v31 = {
    conversation = {}, 
    navigateToScreen = function(_) --[[ Line: 46 ]] --[[ Name: navigateToScreen ]]

    end, 
    setModalHeight = function(_) --[[ Line: 47 ]] --[[ Name: setModalHeight ]]

    end
};
local v32 = {
    conversation_banner_group_phone_verification = true, 
    conversation_banner_group_duplicate_upgrade = true, 
    conversation_banner_learn_more = true, 
    conversation_banner_one_to_one_phone_verification = true
};
local l_CreateUnfilteredChatPartialModal_0 = v21.CreateUnfilteredChatPartialModal;
local l_LearnMorePartialModal_0 = v21.LearnMorePartialModal;
local v35 = {
    conversation_banner_group_phone_verification = "ConversationPvBanner", 
    conversation_banner_one_to_one_phone_verification = "ConversationPvBanner", 
    conversation_banner_group_duplicate_upgrade = "ConversationUpgradeBanner", 
    conversation_banner_learn_more = "ConversationLearnMoreBanner"
};
return l_memo_0(function(v36) --[[ Line: 67 ]] --[[ Name: ConversationTopModalContainer ]]
    -- upvalues: v4 (copy), v31 (copy), l_useStyle_0 (copy), v8 (copy), l_useDispatch_0 (copy), l_useRef_0 (copy), l_useEffect_0 (copy), l_useSelector_0 (copy), v6 (copy), v10 (copy), v35 (copy), v32 (copy), l_useCallback_0 (copy), v22 (copy), v17 (copy), v20 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy), v26 (copy), l_NavigateBack_0 (copy), l_AccessResponseEnum_0 (copy), v25 (copy), l_CreateUnfilteredChatPartialModal_0 (copy), l_LearnMorePartialModal_0 (copy), v5 (copy), v28 (copy), v27 (copy), v2 (copy)
    local v37 = v4.Dictionary.union(v31, v36);
    local v38 = l_useStyle_0();
    local v39 = v8();
    local v40 = l_useDispatch_0();
    local l_Size_500_0 = v38.Tokens.Global.Size_500;
    local v42 = l_useRef_0(v37.setModalHeight);
    l_useEffect_0(function() --[[ Line: 76 ]]
        -- upvalues: v42 (copy), v37 (copy)
        v42.current = v37.setModalHeight;
    end, {
        v37.setModalHeight
    });
    l_useEffect_0(function() --[[ Line: 79 ]]
        -- upvalues: v42 (copy)
        return function() --[[ Line: 80 ]]
            -- upvalues: v42 (ref)
            if v42.current then
                v42.current(0);
            end;
        end;
    end, {});
    local v44 = l_useSelector_0(function(v43) --[[ Line: 87 ]]
        -- upvalues: v6 (ref), v37 (copy)
        return v6(v43, (("ChatAppReducer.Modals.conversationTopModalsDismissed.%*"):format(v37.conversation.id))) or {};
    end);
    local v45 = v10(v37.conversation.id) or {};
    local l_modal_variant_0 = v45.modal_variant;
    local v47 = v6(v45, "modal_layout.id");
    local v48 = v6(v45, "modal_layout.seen_record_action");
    local v49 = v6(v45, "modal_layout.dismiss_record_action");
    local v50 = v35[l_modal_variant_0];
    local v51 = v32[l_modal_variant_0] and not v44[l_modal_variant_0];
    local v52 = v6(v45, "modal_layout.buttons");
    local v53 = v52 and v52[1];
    local v54 = v52 and v52[2];
    local v55 = l_useCallback_0(function() --[[ Line: 103 ]]
        -- upvalues: v39 (copy), v50 (copy), v22 (ref), v37 (copy)
        if v39 and v50 then
            v39.fireAnalyticsEvent(v22[("%*ActionClicked"):format(v50)], {
                conversationId = v37.conversation.id
            });
        end;
    end, {
        v39, 
        v50, 
        v37.conversation.id
    });
    local v57 = l_useCallback_0(function() --[[ Line: 111 ]]
        -- upvalues: v40 (copy), v17 (ref), v49 (copy), v47 (copy), v20 (ref), v37 (copy), l_modal_variant_0 (copy)
        v40(v17.rodux.RecordModalSequenceResponse.API(v49, "conversation_top_modal", v47)):catch(function(v56) --[[ Line: 118 ]]
            warn("Error in ConversationTopModalContainer -> RecordModalSequenceResponse dismissed: " .. tostring(v56));
        end);
        v40(v20(v37.conversation.id, l_modal_variant_0));
    end, {
        v40, 
        v49, 
        l_modal_variant_0, 
        v47, 
        v37.conversation.id
    });
    local v60 = l_useCallback_0(function() --[[ Line: 123 ]]
        -- upvalues: v55 (copy), v40 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref), v26 (ref), l_NavigateBack_0 (ref), l_AccessResponseEnum_0 (ref), v25 (ref), v37 (copy)
        v55();
        v40(l_NavigateDown_0({
            name = l_AppPage_0.AmpWizardContainer, 
            extraProps = {
                featureName = v26, 
                completionCallback = function(v58, _) --[[ Line: 129 ]] --[[ Name: completionCallback ]]
                    -- upvalues: v40 (ref), l_NavigateBack_0 (ref), l_AccessResponseEnum_0 (ref), v25 (ref), v37 (ref)
                    v40(l_NavigateBack_0(true));
                    if v58 == l_AccessResponseEnum_0.Granted then
                        v40(v25(v37.conversation.id));
                    end;
                end
            }
        }));
    end, {
        v55, 
        v40, 
        v37.conversation.id
    });
    local v61 = l_useCallback_0(function() --[[ Line: 140 ]]
        -- upvalues: v55 (copy), v37 (copy), l_CreateUnfilteredChatPartialModal_0 (ref)
        v55();
        v37.navigateToScreen(l_CreateUnfilteredChatPartialModal_0);
    end, {
        v37.navigateToScreen, 
        v55
    });
    local v62 = l_useCallback_0(function() --[[ Line: 144 ]]
        -- upvalues: v55 (copy), v37 (copy), l_LearnMorePartialModal_0 (ref)
        v55();
        v37.navigateToScreen(l_LearnMorePartialModal_0);
    end, {
        v37.navigateToScreen, 
        v55
    });
    l_useEffect_0(function() --[[ Line: 150 ]]
        -- upvalues: v51 (copy), v40 (copy), v17 (ref), v48 (copy), v47 (copy)
        if v51 then
            v40(v17.rodux.RecordModalSequenceResponse.API(v48, "conversation_top_modal", v47)):catch(function(v63) --[[ Line: 158 ]]
                warn("Error in ConversationTopModalContainer -> RecordModalSequenceResponse seen: " .. tostring(v63));
            end);
        end;
    end, {
        v40, 
        v51, 
        v48, 
        v47, 
        v37.conversation.id
    });
    l_useEffect_0(function() --[[ Line: 175 ]]
        -- upvalues: v51 (copy), v39 (copy), v50 (copy), v22 (ref), v37 (copy)
        if v51 and v39 and v50 then
            v39.fireAnalyticsEvent(v22[("%*Rendered"):format(v50)], {
                conversationId = v37.conversation.id
            });
        end;
    end, {
        v51, 
        v39, 
        v50, 
        v37.conversation.id
    });
    local v64 = ({
        conversation_banner_group_phone_verification = v60, 
        conversation_banner_one_to_one_phone_verification = v60, 
        conversation_banner_group_duplicate_upgrade = v61
    })[l_modal_variant_0];
    local v65 = nil;
    if v51 then
        v65 = if l_modal_variant_0 == "conversation_banner_learn_more" then v5.createElement(v28, {
            actionText = if v53 then v53.text else nil, 
            bodyText = v6(v45, "modal_layout.body.text"), 
            height = l_Size_500_0, 
            onActivated = v62, 
            style = v38
        }) else v5.createElement(v27, {
            bodyText = v6(v45, "modal_layout.body.text"), 
            denyText = if v53 then v53.text else nil, 
            acceptText = if v54 and v64 then v54.text else nil, 
            paddingTop = v38.Tokens.Global.Space_150, 
            paddingBottom = v38.Tokens.Global.Space_150, 
            verticalSpacing = v38.Tokens.Global.Space_150, 
            onAccepted = v64, 
            onDenied = v57, 
            style = v38
        });
    elseif l_modal_variant_0 ~= "none" and l_modal_variant_0 ~= nil and not v32[l_modal_variant_0] then
        warn("Unsupported ConversationTopModal variant: " .. l_modal_variant_0);
    end;
    return v5.createElement(v2.View, {
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 0, 0), 
        LayoutOrder = v37.layoutOrder, 
        onAbsoluteSizeChanged = function(v66) --[[ Line: 229 ]] --[[ Name: onAbsoluteSizeChanged ]]
            -- upvalues: v37 (copy)
            v37.setModalHeight(v66.AbsoluteSize.Y);
        end
    }, {
        conversationTopModal = v65
    });
end);