local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.React);
local v4 = require(l_script_FirstAncestor_0.LuaAppNavigationContext);
local l_StatusCodes_0 = require(l_Parent_0.Http).StatusCodes;
local v6 = require(l_script_FirstAncestor_0.Utils.getDeepValue2);
local l_memo_0 = v3.memo;
local v8 = require(l_script_FirstAncestor_0.Analytics.useAnalytics);
local l_useCallback_0 = v3.useCallback;
local v10 = require(l_script_FirstAncestor_0.Hooks.useChatIsVisible);
local l_useContext_0 = v3.useContext;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useEffect_0 = v3.useEffect;
local l_useEffectOnMount_0 = require(l_Parent_0.RoactUtils).Hooks.useEffectOnMount;
local v15 = require(l_script_FirstAncestor_0.Hooks.useIsInExperience);
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useState_0 = v3.useState;
local l_useRef_0 = v3.useRef;
local l_Enum_0 = require(l_Parent_0.UIBlox).App.Button.Enum;
local l_AccessResponseEnum_0 = require(l_Parent_0.AmpUpsell).AmpEnums.AccessResponseEnum;
local v22 = require(l_Parent_0.AppChatNetworking);
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_NavigateBack_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateBack;
local l_NavigateDown_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateDown;
local v26 = require(l_script_FirstAncestor_0.Conversations.Thunks.refreshAllUnfilteredThreadsDetails);
local v27 = require(l_script_FirstAncestor_0.Components.UnfilteredThreadsAMPFeatureName);
local v28 = require(script.Parent.ChatLandingModal);
local v29 = {
    fully_eligible_ftux = true, 
    party_only_ftux = true, 
    phone_verify = true
};
local v30 = {
    fully_eligible_ftux = "ChatLandingUnfilteredThreadsFtux", 
    phone_verify = "ChatLandingPvUpsell"
};
return l_memo_0(function(_) --[[ Line: 49 ]] --[[ Name: ChatLandingModalContainer ]]
    -- upvalues: l_useDispatch_0 (copy), v8 (copy), l_useContext_0 (copy), v4 (copy), l_useNavigation_0 (copy), l_useState_0 (copy), v15 (copy), l_useSelector_0 (copy), v6 (copy), v30 (copy), v29 (copy), l_useEffectOnMount_0 (copy), v10 (copy), l_useRef_0 (copy), l_useEffect_0 (copy), v22 (copy), l_StatusCodes_0 (copy), l_useCallback_0 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy), v27 (copy), l_NavigateBack_0 (copy), l_AccessResponseEnum_0 (copy), v26 (copy), v2 (copy), v3 (copy), v28 (copy), l_Enum_0 (copy)
    local v32 = l_useDispatch_0();
    local v33 = v8();
    local v34 = l_useContext_0(v4);
    local v35 = l_useNavigation_0();
    local v36, v37 = l_useState_0({});
    local v38 = v15();
    local v40 = l_useSelector_0(function(v39) --[[ Line: 58 ]]
        -- upvalues: v6 (ref)
        return v6(v39, "ChatAppReducer.Modals.chatLandingModal") or {};
    end);
    local l_modal_variant_0 = v40.modal_variant;
    local v42 = v6(v40, "modal_layout.id");
    local v43 = v6(v40, "modal_layout.seen_record_action");
    local v44 = v6(v40, "modal_layout.dismiss_record_action");
    local v45 = v6(v40, "modal_layout.buttons");
    local v46 = v45 and v45[1];
    local v47 = v30[l_modal_variant_0];
    local v48 = v29[l_modal_variant_0] and not v36[l_modal_variant_0];
    l_useEffectOnMount_0(function() --[[ Line: 71 ]]
        -- upvalues: v33 (copy), v47 (copy), v48 (copy)
        if v33 and v47 and v48 then
            v33.fireAnalyticsEvent((("%*Rendered"):format(v47)));
        end;
    end);
    local v49 = v10();
    local v50 = l_useRef_0(false);
    local v51 = not v50.current and v49 and v48;
    l_useEffect_0(function() --[[ Line: 81 ]]
        -- upvalues: v51 (copy), v32 (copy), v22 (ref), v43 (copy), v42 (copy), l_StatusCodes_0 (ref), v50 (copy)
        if not v51 then
            return;
        else
            v32(v22.rodux.RecordModalSequenceResponse.API(v43, "chat_landing_modal", v42)):andThen(function(v52) --[[ Line: 93 ]]
                -- upvalues: l_StatusCodes_0 (ref), v50 (ref)
                if v52 and v52.responseCode == l_StatusCodes_0.OK then
                    v50.current = true;
                end;
            end):catch(function(v53) --[[ Line: 98 ]]
                warn("Error in ChatLandingModalContainer -> RecordModalSequenceResponse seen: " .. tostring(v53));
            end);
            return;
        end;
    end, {
        v32, 
        v50, 
        v43, 
        v42, 
        v51
    });
    local v56 = l_useCallback_0(function() --[[ Line: 111 ]]
        -- upvalues: v33 (copy), v47 (copy), v32 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref), v27 (ref), l_NavigateBack_0 (ref), l_AccessResponseEnum_0 (ref), v26 (ref), v38 (copy)
        if v33 and v47 then
            v33.fireAnalyticsEvent((("%*ContinueClicked"):format(v47)));
        end;
        v32(l_NavigateDown_0({
            name = l_AppPage_0.AmpWizardContainer, 
            extraProps = {
                featureName = v27, 
                completionCallback = function(v54, _) --[[ Line: 119 ]] --[[ Name: completionCallback ]]
                    -- upvalues: v32 (ref), l_NavigateBack_0 (ref), l_AccessResponseEnum_0 (ref), v33 (ref), v47 (ref), v26 (ref), v38 (ref)
                    v32(l_NavigateBack_0(true));
                    if v54 == l_AccessResponseEnum_0.Granted then
                        if v33 and v47 then
                            v33.fireAnalyticsEvent((("%*Succeeded"):format(v47)));
                        end;
                        v32(v26(nil, v38));
                        return;
                    else
                        if v33 and v47 then
                            v33.fireAnalyticsEvent((("%*Failed"):format(v47)));
                        end;
                        return;
                    end;
                end
            }
        }));
    end, {
        v32, 
        v33, 
        v47
    });
    local v58 = l_useCallback_0(function() --[[ Line: 137 ]]
        -- upvalues: v33 (copy), v47 (copy), v35 (copy), v34 (copy)
        if v33 and v47 then
            v33.fireAnalyticsEvent((("%*LearnMoreClicked"):format(v47)));
        end;
        local v57 = if v35 then v35.navigate else nil;
        v34.navigateToUnfilteredThreadsLearnMore(v57);
    end, {
        v34, 
        v33, 
        v35, 
        v47
    });
    local v60 = l_useCallback_0(function() --[[ Line: 152 ]]
        -- upvalues: v33 (copy), v47 (copy), v32 (copy), v22 (ref), v44 (copy), v42 (copy), v37 (copy), v2 (ref), v36 (copy), l_modal_variant_0 (copy)
        if v33 and v47 then
            v33.fireAnalyticsEvent((("%*Dismissed"):format(v47)));
        end;
        v32(v22.rodux.RecordModalSequenceResponse.API(v44, "chat_landing_modal", v42)):catch(function(v59) --[[ Line: 162 ]]
            warn("Error in ChatLandingModalContainer -> RecordModalSequenceResponse dismissed: " .. tostring(v59));
        end);
        v37(v2.Dictionary.join(v36, {
            [l_modal_variant_0] = true
        }));
    end, {
        v36, 
        v37, 
        v32, 
        v33, 
        v47, 
        v44, 
        l_modal_variant_0, 
        v42
    });
    local v61 = ({
        phone_verify = v56, 
        fully_eligible_ftux = v58
    })[l_modal_variant_0];
    if v48 then
        return v3.createElement(v28, {
            titleLabelText = v6(v40, "modal_layout.label.text"), 
            titleText = v6(v40, "modal_layout.header.text"), 
            bodyText = v6(v40, "modal_layout.body.text"), 
            actionText = v46 and v46.text, 
            buttonType = if l_modal_variant_0 == "fully_eligible_ftux" then l_Enum_0.ButtonType.Secondary else l_Enum_0.ButtonType.PrimarySystem, 
            onActivated = v61, 
            onDismissed = v60, 
            hideActionButton = not v46 or not v61
        });
    else
        if l_modal_variant_0 ~= "none" and l_modal_variant_0 ~= nil and not v29[l_modal_variant_0] then
            warn("Unsupported ChatLandingModal variant: " .. l_modal_variant_0);
        end;
        return nil;
    end;
end);