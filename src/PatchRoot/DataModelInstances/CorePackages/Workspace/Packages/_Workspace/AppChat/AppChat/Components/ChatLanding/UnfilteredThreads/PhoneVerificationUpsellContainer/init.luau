local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_script_FirstAncestor_0.types);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.React);
local l_StatusCodes_0 = require(l_Parent_0.Http).StatusCodes;
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local l_memo_0 = v4.memo;
local v8 = require(l_script_FirstAncestor_0.Analytics.useAnalytics);
local l_useCallback_0 = v4.useCallback;
local v10 = require(l_script_FirstAncestor_0.Hooks.useChatIsVisible);
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useEffect_0 = v4.useEffect;
local l_useEffectOnMount_0 = require(l_Parent_0.RoactUtils).Hooks.useEffectOnMount;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useRef_0 = v4.useRef;
local l_Enum_0 = require(l_Parent_0.UIBlox).App.Button.Enum;
local l_AccessResponseEnum_0 = require(l_Parent_0.AmpUpsell).AmpEnums.AccessResponseEnum;
local v18 = require(l_Parent_0.AppChatNetworking);
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local v20 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local l_NavigateBack_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateBack;
local l_NavigateDown_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateDown;
local v23 = require(l_script_FirstAncestor_0.Conversations.Thunks.refreshAllUnfilteredThreadsDetails);
local v24 = require(l_script_FirstAncestor_0.Components.UnfilteredThreadsAMPFeatureName);
local v25 = require(l_script_FirstAncestor_0.Flags.unfilteredThreadsModalActionConfig);
local v26 = require(script.Parent.UnfilteredThreadsFtux);
local v27 = {
    dismissUpsell = function() --[[ Line: 47 ]] --[[ Name: dismissUpsell ]]

    end, 
    labelKey = "Feature.Chat.Label.New", 
    titleKey = "Feature.Chat.Heading.ChatWithoutHashtags", 
    bodyKey = "Feature.Chat.Description.PhoneVerificationUpsell", 
    actionKey = "Feature.Chat.Action.AddPhoneNumber"
};
return l_memo_0(function(v28) --[[ Line: 56 ]] --[[ Name: PhoneVerificationUpsellContainer ]]
    -- upvalues: v3 (copy), v27 (copy), l_useDispatch_0 (copy), v8 (copy), l_useEffectOnMount_0 (copy), v20 (copy), v10 (copy), l_useRef_0 (copy), l_useEffect_0 (copy), v18 (copy), v25 (copy), l_StatusCodes_0 (copy), l_dependencyArray_0 (copy), l_useCallback_0 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy), v24 (copy), l_NavigateBack_0 (copy), l_AccessResponseEnum_0 (copy), v23 (copy), l_useLocalization_0 (copy), v4 (copy), v26 (copy), l_Enum_0 (copy)
    local v29 = v3.Dictionary.join(v27, v28);
    local v30 = l_useDispatch_0();
    local v31 = v8();
    l_useEffectOnMount_0(function() --[[ Line: 61 ]]
        -- upvalues: v31 (copy), v20 (ref)
        if v31 then
            v31.fireAnalyticsEvent(v20.ChatLandingPvUpsellRendered);
        end;
    end);
    local v32 = v10();
    local v33 = l_useRef_0(false);
    l_useEffect_0(function() --[[ Line: 69 ]]
        -- upvalues: v33 (copy), v32 (copy), v30 (copy), v18 (ref), v25 (ref), l_StatusCodes_0 (ref)
        if v33.current or not v32 then
            return;
        else
            v30(v18.rodux.RecordUnfilteredThreadsModalAction.API(v25.ChatLandingPvUpsellSeenAction, "phone_verify")):andThen(function(v34) --[[ Line: 80 ]]
                -- upvalues: l_StatusCodes_0 (ref), v33 (ref)
                if v34 and v34.responseCode == l_StatusCodes_0.OK then
                    v33.current = true;
                end;
            end):catch(function(v35) --[[ Line: 85 ]]
                warn("Error in PhoneVerificationUpsellContainer -> RecordUnfilteredThreadsModalAction seen: " .. tostring(v35));
            end);
            return;
        end;
    end, l_dependencyArray_0(v30, v32, v33.current));
    local v38 = l_useCallback_0(function() --[[ Line: 93 ]]
        -- upvalues: v31 (copy), v20 (ref), v30 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref), v24 (ref), l_NavigateBack_0 (ref), l_AccessResponseEnum_0 (ref), v23 (ref)
        if v31 then
            v31.fireAnalyticsEvent(v20.ChatLandingPvUpsellContinueClicked);
        end;
        v30(l_NavigateDown_0({
            name = l_AppPage_0.AmpWizardContainer, 
            extraProps = {
                featureName = v24, 
                completionCallback = function(v36, _) --[[ Line: 101 ]] --[[ Name: completionCallback ]]
                    -- upvalues: v30 (ref), l_NavigateBack_0 (ref), l_AccessResponseEnum_0 (ref), v31 (ref), v20 (ref), v23 (ref)
                    v30(l_NavigateBack_0(true));
                    if v36 == l_AccessResponseEnum_0.Granted then
                        if v31 then
                            v31.fireAnalyticsEvent(v20.ChatLandingPvUpsellSucceeded);
                        end;
                        v30(v23());
                        return;
                    else
                        if v31 then
                            v31.fireAnalyticsEvent(v20.ChatLandingPvUpsellFailed);
                        end;
                        return;
                    end;
                end
            }
        }));
    end, l_dependencyArray_0(v30, v31));
    local v40 = l_useCallback_0(function() --[[ Line: 120 ]]
        -- upvalues: v31 (copy), v20 (ref), v30 (copy), v18 (ref), v25 (ref), v29 (copy)
        if v31 then
            v31.fireAnalyticsEvent(v20.ChatLandingPvUpsellDismissed);
        end;
        v30(v18.rodux.RecordUnfilteredThreadsModalAction.API(v25.ChatLandingPvUpsellDismissAction, "phone_verify")):catch(function(v39) --[[ Line: 129 ]]
            warn("Error in PhoneVerificationUpsellContainer -> RecordUnfilteredThreadsModalAction dismissed: " .. tostring(v39));
        end);
        v29.dismissUpsell();
    end, l_dependencyArray_0(v29.dismissUpsell, v30, v31));
    local v41 = l_useLocalization_0({
        labelText = v29.labelKey, 
        titleText = v29.titleKey, 
        bodyText = v29.bodyKey, 
        actionText = v29.actionKey
    });
    return v4.createElement(v26, {
        titleLabelText = v41.labelText, 
        titleText = v41.titleText, 
        bodyText = v41.bodyText, 
        actionText = v41.actionText, 
        buttonType = l_Enum_0.ButtonType.PrimarySystem, 
        onActivated = v38, 
        onDismissed = v40
    });
end);