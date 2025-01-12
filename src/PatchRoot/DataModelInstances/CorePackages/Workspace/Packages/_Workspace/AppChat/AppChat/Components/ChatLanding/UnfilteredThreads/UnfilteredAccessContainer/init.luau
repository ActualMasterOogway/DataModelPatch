local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_script_FirstAncestor_0.types);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.React);
local v5 = require(l_script_FirstAncestor_0.LuaAppNavigationContext);
local l_StatusCodes_0 = require(l_Parent_0.Http).StatusCodes;
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local l_memo_0 = v4.memo;
local v9 = require(l_script_FirstAncestor_0.Analytics.useAnalytics);
local l_useCallback_0 = v4.useCallback;
local v11 = require(l_script_FirstAncestor_0.Hooks.useChatIsVisible);
local l_useContext_0 = v4.useContext;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useEffect_0 = v4.useEffect;
local l_useEffectOnMount_0 = require(l_Parent_0.RoactUtils).Hooks.useEffectOnMount;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useRef_0 = v4.useRef;
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local l_Enum_0 = require(l_Parent_0.UIBlox).App.Button.Enum;
local v20 = require(l_Parent_0.AppChatNetworking);
local v21 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local v22 = require(l_script_FirstAncestor_0.Flags.unfilteredThreadsModalActionConfig);
local v23 = require(script.Parent.UnfilteredThreadsFtux);
local v24 = {
    dismissUpsell = function() --[[ Line: 44 ]] --[[ Name: dismissUpsell ]]

    end, 
    labelKey = "Feature.Chat.Label.New", 
    titleKey = "Feature.Chat.Heading.ChatWithoutHashtags", 
    bodyKey = "Feature.Chat.Description.UnfilteredAccessFtux", 
    actionKey = "Feature.Chat.Action.LearnMore"
};
return l_memo_0(function(v25) --[[ Line: 53 ]] --[[ Name: PhoneVerificationUpsellContainer ]]
    -- upvalues: v3 (copy), v24 (copy), l_useContext_0 (copy), v5 (copy), l_useDispatch_0 (copy), v9 (copy), l_useEffectOnMount_0 (copy), v21 (copy), l_useNavigation_0 (copy), v11 (copy), l_useRef_0 (copy), l_useEffect_0 (copy), v20 (copy), v22 (copy), l_StatusCodes_0 (copy), l_dependencyArray_0 (copy), l_useCallback_0 (copy), l_useLocalization_0 (copy), v4 (copy), v23 (copy), l_Enum_0 (copy)
    local v26 = v3.Dictionary.join(v24, v25);
    local v27 = l_useContext_0(v5);
    local v28 = l_useDispatch_0();
    local v29 = v9();
    l_useEffectOnMount_0(function() --[[ Line: 59 ]]
        -- upvalues: v29 (copy), v21 (ref)
        if v29 then
            v29.fireAnalyticsEvent(v21.ChatLandingUnfilteredThreadsFtuxRendered);
        end;
    end);
    local v30 = l_useNavigation_0();
    local v31 = v11();
    local v32 = l_useRef_0(false);
    l_useEffect_0(function() --[[ Line: 68 ]]
        -- upvalues: v32 (copy), v31 (copy), v28 (copy), v20 (ref), v22 (ref), l_StatusCodes_0 (ref)
        if v32.current or not v31 then
            return;
        else
            v28(v20.rodux.RecordUnfilteredThreadsModalAction.API(v22.ChatLandingFtuxSeenAction, "fully_eligible_ftux")):andThen(function(v33) --[[ Line: 79 ]]
                -- upvalues: l_StatusCodes_0 (ref), v32 (ref)
                if v33 and v33.responseCode == l_StatusCodes_0.OK then
                    v32.current = true;
                end;
            end):catch(function(v34) --[[ Line: 84 ]]
                warn("Error in UnfilteredAccessContainer -> RecordUnfilteredThreadsModalAction seen: " .. tostring(v34));
            end);
            return;
        end;
    end, l_dependencyArray_0(v28, v31, v32.current));
    local v35 = l_useCallback_0(function() --[[ Line: 91 ]]
        -- upvalues: v29 (copy), v21 (ref), v30 (copy), v27 (copy)
        if v29 then
            v29.fireAnalyticsEvent(v21.ChatLandingUnfilteredThreadsFtuxLearnMoreClicked);
        end;
        if v30 then
            v27.navigateToUnfilteredThreadsLearnMore(v30.navigate);
            return;
        else
            v27.navigateToUnfilteredThreadsLearnMore();
            return;
        end;
    end, l_dependencyArray_0(v27, v29, v30));
    local v37 = l_useCallback_0(function() --[[ Line: 101 ]]
        -- upvalues: v29 (copy), v21 (ref), v28 (copy), v20 (ref), v22 (ref), v26 (copy)
        if v29 then
            v29.fireAnalyticsEvent(v21.ChatLandingUnfilteredThreadsFtuxDismissed);
        end;
        v28(v20.rodux.RecordUnfilteredThreadsModalAction.API(v22.ChatLandingFtuxDismissAction, "fully_eligible_ftux")):catch(function(v36) --[[ Line: 110 ]]
            warn("Error in UnfilteredAccessContainer -> RecordUnfilteredThreadsModalAction dismissed: " .. tostring(v36));
        end);
        v26.dismissUpsell();
    end, l_dependencyArray_0(v26.dismissUpsell, v28, v29));
    local v38 = l_useLocalization_0({
        labelText = v26.labelKey, 
        titleText = v26.titleKey, 
        bodyText = v26.bodyKey, 
        actionText = v26.actionKey
    });
    return v4.createElement(v23, {
        titleLabelText = v38.labelText, 
        titleText = v38.titleText, 
        bodyText = v38.bodyText, 
        actionText = v38.actionText, 
        buttonType = l_Enum_0.ButtonType.Secondary, 
        onActivated = v35, 
        onDismissed = v37
    });
end);