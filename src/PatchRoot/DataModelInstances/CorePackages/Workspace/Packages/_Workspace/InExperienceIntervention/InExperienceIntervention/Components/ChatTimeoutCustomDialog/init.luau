local l_script_FirstAncestor_0 = script:FindFirstAncestor("InExperienceIntervention");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Components.InterventionContestFeedbackFooter);
local v4 = require(l_Parent_0.UIBlox);
local v5 = require(l_Parent_0.Foundation);
local l_Text_0 = v5.Text;
local l_PartialPageModal_0 = v4.App.Dialog.Modal.PartialPageModal;
local l_useLayerCollector_0 = v4.Core.Layout.LayerCollector.useLayerCollector;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useStyle_0 = v4.Core.Style.useStyle;
local v11 = require(l_script_FirstAncestor_0.Utils.Constants);
local v12 = require(l_script_FirstAncestor_0.InExperienceInterventionAnalytics);
local l_View_0 = v5.View;
local l_Button_0 = v5.Button;
local l_ScrollView_0 = v5.ScrollView;
local l_ScrollBarVisibility_0 = v5.Enums.ScrollBarVisibility;
local l_ButtonVariant_0 = v5.Enums.ButtonVariant;
local l_FillBehavior_0 = v5.Enums.FillBehavior;
local l_useTokens_0 = v5.Hooks.useTokens;
local v20 = require(l_Parent_0.ReactFocusNavigation);
local v21 = require(l_Parent_0.FocusNavigationUtils);
local l_FocusNavigationCoreScriptsWrapper_0 = v21.FocusNavigationCoreScriptsWrapper;
local l_FocusNavigableSurfaceIdentifierEnum_0 = v21.FocusNavigableSurfaceIdentifierEnum;
local v24 = v20.FocusNavigationService.new(v20.EngineInterface.CoreGui);
ChatTimeoutCustomDialog = function(v25) --[[ Line: 39 ]] --[[ Name: ChatTimeoutCustomDialog ]]
    -- upvalues: l_useLayerCollector_0 (copy), v2 (copy), l_useTokens_0 (copy), l_useStyle_0 (copy), l_useLocalization_0 (copy), v11 (copy), v12 (copy), l_PartialPageModal_0 (copy), l_ScrollView_0 (copy), l_ScrollBarVisibility_0 (copy), v20 (copy), v24 (copy), l_FocusNavigationCoreScriptsWrapper_0 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy), l_View_0 (copy), l_Text_0 (copy), l_Button_0 (copy), l_ButtonVariant_0 (copy), l_FillBehavior_0 (copy), v3 (copy)
    local v26 = l_useLayerCollector_0();
    local v27 = v2.useRef(DateTime.now().UnixTimestampMillis);
    local v28 = v2.useRef(nil);
    local v29, v30 = v2.useState(0);
    local v31 = l_useTokens_0();
    local v32 = l_useStyle_0();
    local v33 = l_useLocalization_0(v11.localizationKeys);
    local v34 = math.ceil(v25.remainingSeconds / 60);
    local v35 = v2.useCallback(function() --[[ Line: 50 ]]
        -- upvalues: v12 (ref), v27 (copy), v25 (copy)
        v12.sendAnalyticsEvent(v12.Constants.EventTypes.CtaClicked, v12.Constants.InterventionTypes.Timeout, v27.current, v25.eventId, v25.violatingChatLine, v25.duration);
        v25.onDismiss();
    end, {
        v27
    });
    v2.useEffect(function() --[[ Line: 62 ]]
        -- upvalues: v12 (ref), v27 (copy), v25 (copy)
        v12.sendAnalyticsEvent(v12.Constants.EventTypes.ModalAppeared, v12.Constants.InterventionTypes.Timeout, v27.current, v25.eventId, v25.violatingChatLine, v25.duration);
    end, {
        v27
    });
    v2.useEffect(function() --[[ Line: 73 ]]
        -- upvalues: v28 (copy), v26 (copy), v11 (ref), v30 (copy)
        local v36 = if v28.current then v28.current.AbsoluteSize.Y else 0;
        local v37 = math.min(v26.absoluteSize.Y - v11.UNIBAR_HEIGHT - v11.DIALOG_HEADER_HEIGHT, v36);
        v30(v37);
    end, {
        v26.absoluteSize.Y, 
        v28.current
    });
    local v38 = nil;
    v38 = if v34 == 1 then v33.CannotSend1MinText else l_useLocalization_0({
        value = {
            v11.localizationKeys.CannotSendText; 
            number = v34
        }
    }).value;
    return v2.createElement(l_PartialPageModal_0, {
        title = v33.TextChatSuspensionText, 
        screenSize = v26.absoluteSize
    }, {
        ScrollView = v2.createElement(l_ScrollView_0, {
            Size = UDim2.new(1, 0, 0, v29), 
            scroll = {
                AutomaticCanvasSize = Enum.AutomaticSize.Y, 
                CanvasSize = UDim2.new(1, 0, 1, 0), 
                scrollBarVisibility = l_ScrollBarVisibility_0.Always, 
                ScrollingDirection = Enum.ScrollingDirection.Y
            }
        }, {
            FocusNavigationCoreScriptsProvider = v2.createElement(v20.FocusNavigationContext.Provider, {
                value = v24
            }, {
                FocusNavigationCoreScriptsWrapper = v2.createElement(l_FocusNavigationCoreScriptsWrapper_0, {
                    selectionGroupName = v11.ChatNudgeDialogSelectionGroup, 
                    focusNavigableSurfaceIdentifier = l_FocusNavigableSurfaceIdentifierEnum_0.PopUp, 
                    automaticSize = Enum.AutomaticSize.Y, 
                    size = UDim2.new(1, 0, 0, 0)
                }, {
                    InnerContent = v2.createElement(l_View_0, {
                        ref = v28, 
                        Size = UDim2.new(1, -v11.SCROLL_BAR_WIDTH, 0, 0), 
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        tag = "col gap-large align-x-center align-y-center padding-x-small padding-top-large"
                    }, {
                        ChatDisabledText = v2.createElement(l_Text_0, {
                            LayoutOrder = 1, 
                            Text = v38, 
                            textStyle = v32.Theme.TextEmphasis, 
                            fontStyle = v31.Typography.LabelLarge, 
                            Size = UDim2.new(1, 0, 0, 0), 
                            TextXAlignment = Enum.TextXAlignment.Center, 
                            TextYAlignment = Enum.TextYAlignment.Center, 
                            AutomaticSize = Enum.AutomaticSize.Y, 
                            TextWrapped = true
                        }), 
                        WarningTextLabel = v2.createElement(l_Text_0, {
                            LayoutOrder = 2, 
                            Text = v33.MayLoseAccessText, 
                            tag = "padding-small size-full-800 text-wrap", 
                            TextWrapped = true, 
                            AutomaticSize = Enum.AutomaticSize.Y
                        }), 
                        UnderstandButtonFrame = v2.createElement(l_View_0, {
                            Size = UDim2.new(1, 0, 0, 0), 
                            AutomaticSize = Enum.AutomaticSize.Y, 
                            LayoutOrder = 3
                        }, {
                            UnderstandButton = v2.createElement(l_Button_0, {
                                text = v33.IUnderstandText, 
                                variant = l_ButtonVariant_0.Standard, 
                                onActivated = v35, 
                                fillBehavior = l_FillBehavior_0.Fill, 
                                FillDirection = Enum.FillDirection.Horizontal
                            })
                        }), 
                        FeedbackFrame = v2.createElement(l_View_0, {
                            Size = UDim2.new(1, 0, 0, 0), 
                            AutomaticSize = Enum.AutomaticSize.Y, 
                            LayoutOrder = 4
                        }, {
                            FeedbackFooter = v2.createElement(v3, {
                                onDismiss = v25.onDismiss, 
                                renderTimestamp = v27.current, 
                                interventionType = v12.Constants.InterventionTypes.Timeout, 
                                eventId = v25.eventId, 
                                violatingChatLine = v25.violatingChatLine, 
                                duration = v25.duration
                            })
                        })
                    })
                })
            })
        })
    });
end;
return ChatTimeoutCustomDialog;