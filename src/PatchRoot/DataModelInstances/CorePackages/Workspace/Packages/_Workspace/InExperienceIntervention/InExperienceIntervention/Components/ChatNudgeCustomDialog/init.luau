local l_script_FirstAncestor_0 = script:FindFirstAncestor("InExperienceIntervention");
local l_Players_0 = game:GetService("Players");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_script_FirstAncestor_0.Utils.Constants);
local v4 = require(l_Parent_0.React);
local v5 = require(l_script_FirstAncestor_0.Components.InterventionContestFeedbackFooter);
local v6 = require(l_Parent_0.UIBlox);
local v7 = require(l_Parent_0.Foundation);
local l_PartialPageModal_0 = v6.App.Dialog.Modal.PartialPageModal;
local l_Text_0 = v7.Text;
local l_View_0 = v7.View;
local l_Button_0 = v7.Button;
local l_useTokens_0 = v7.Hooks.useTokens;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useStyle_0 = v6.Core.Style.useStyle;
local l_useLayerCollector_0 = v6.Core.Layout.LayerCollector.useLayerCollector;
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local v17 = require(l_script_FirstAncestor_0.InExperienceInterventionAnalytics);
local l_ScrollView_0 = v7.ScrollView;
local l_ScrollBarVisibility_0 = v7.Enums.ScrollBarVisibility;
local l_ButtonVariant_0 = v7.Enums.ButtonVariant;
local l_FillBehavior_0 = v7.Enums.FillBehavior;
local v22 = require(l_Parent_0.ReactFocusNavigation);
local v23 = require(l_Parent_0.FocusNavigationUtils);
local l_FocusNavigationCoreScriptsWrapper_0 = v23.FocusNavigationCoreScriptsWrapper;
local l_FocusNavigableSurfaceIdentifierEnum_0 = v23.FocusNavigableSurfaceIdentifierEnum;
local v26 = v22.FocusNavigationService.new(v22.EngineInterface.CoreGui);
ChatNudgeCustomDialog = function(v27) --[[ Line: 40 ]] --[[ Name: ChatNudgeCustomDialog ]]
    -- upvalues: v4 (copy), v17 (copy), l_useLocalization_0 (copy), v3 (copy), l_useStyle_0 (copy), l_useLayerCollector_0 (copy), l_useTokens_0 (copy), l_LocalPlayer_0 (copy), l_View_0 (copy), l_Text_0 (copy), l_PartialPageModal_0 (copy), l_ScrollView_0 (copy), l_ScrollBarVisibility_0 (copy), v22 (copy), v26 (copy), l_FocusNavigationCoreScriptsWrapper_0 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy), l_Button_0 (copy), l_ButtonVariant_0 (copy), l_FillBehavior_0 (copy), v5 (copy)
    local v28 = v4.useRef(DateTime.now().UnixTimestampMillis);
    local v29 = v4.useRef(nil);
    local v30, v31 = v4.useState(0);
    v4.useEffect(function() --[[ Line: 44 ]]
        -- upvalues: v17 (ref), v28 (copy), v27 (copy)
        v17.sendAnalyticsEvent(v17.Constants.EventTypes.ModalAppeared, v17.Constants.InterventionTypes.Nudge, v28.current, v27.eventId, v27.violatingChatLine, nil);
    end, {
        v28
    });
    local v32 = l_useLocalization_0(v3.localizationKeys);
    local v33 = l_useStyle_0();
    local v34 = l_useLayerCollector_0();
    local v35 = l_useTokens_0();
    v4.useEffect(function() --[[ Line: 59 ]]
        -- upvalues: v29 (copy), v34 (copy), v3 (ref), v31 (copy)
        local v36 = if v29.current then v29.current.AbsoluteSize.Y else 0;
        local v37 = math.min(v34.absoluteSize.Y - v3.UNIBAR_HEIGHT - v3.DIALOG_HEADER_HEIGHT, v36);
        v31(v37);
    end, {
        v34.absoluteSize.Y, 
        v29.current
    });
    local v38 = if l_LocalPlayer_0 then ("%*: %*"):format(l_LocalPlayer_0.DisplayName, v27.violatingChatLine) else v27.violatingChatLine;
    local v39 = v4.useCallback(function() --[[ Line: 76 ]]
        -- upvalues: v17 (ref), v28 (copy), v27 (copy)
        v17.sendAnalyticsEvent(v17.Constants.EventTypes.CtaClicked, v17.Constants.InterventionTypes.Nudge, v28.current, v27.eventId, v27.violatingChatLine, nil);
        v27.onDismiss();
    end, {
        v28
    });
    local v40 = if v27.violatingChatLine then v4.createElement(l_View_0, {
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        LayoutOrder = 1
    }, {
        Layout = v4.createElement("UIListLayout", {
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, v3.STANDARD_PADDING / 2)
        }), 
        ChatIncludesTextFrame = v4.createElement(l_View_0, {
            Size = UDim2.new(1, 0, 0, 0), 
            LayoutOrder = 1, 
            AutomaticSize = Enum.AutomaticSize.Y
        }, {
            ChatIncludesText = v4.createElement(l_Text_0, {
                Text = v32.ChatIncludesText, 
                fontStyle = v35.Typography.BodySmall, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                AnchorPoint = Vector2.new(0, 0), 
                AutomaticSize = Enum.AutomaticSize.XY
            })
        }), 
        ViolatingTextFrame = v4.createElement(l_View_0, {
            Size = UDim2.new(1, 0, 0, v3.VIOLATION_HEIGHT), 
            LayoutOrder = 2, 
            BackgroundTransparency = 0, 
            BackgroundColor3 = v33.Theme.BackgroundUIDefault.Color, 
            tag = "col gap-small align-x-center align-y-center padding-x-large radius-medium stroke-default"
        }, {
            ViolationText = v4.createElement(l_Text_0, {
                LayoutOrder = 2, 
                Text = v38, 
                textStyle = v33.Theme.TextMuted, 
                fontStyle = v33.Font.Body, 
                Size = UDim2.new(1, 0, 0, 0), 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                TextWrapped = true, 
                TextTruncate = Enum.TextTruncate.AtEnd
            })
        })
    }) else nil;
    return v4.createElement(l_PartialPageModal_0, {
        title = v32.ChatBreaksRulesText, 
        screenSize = v34.absoluteSize
    }, {
        ScrollView = v4.createElement(l_ScrollView_0, {
            Size = UDim2.new(1, 0, 0, v30), 
            scroll = {
                AutomaticCanvasSize = Enum.AutomaticSize.Y, 
                CanvasSize = UDim2.new(1, 0, 1, 0), 
                scrollBarVisibility = l_ScrollBarVisibility_0.Always, 
                ScrollingDirection = Enum.ScrollingDirection.Y
            }
        }, {
            FocusNavigationCoreScriptsProvider = v4.createElement(v22.FocusNavigationContext.Provider, {
                value = v26
            }, {
                FocusNavigationCoreScriptsWrapper = v4.createElement(l_FocusNavigationCoreScriptsWrapper_0, {
                    selectionGroupName = v3.ChatNudgeDialogSelectionGroup, 
                    focusNavigableSurfaceIdentifier = l_FocusNavigableSurfaceIdentifierEnum_0.PopUp, 
                    automaticSize = Enum.AutomaticSize.Y, 
                    size = UDim2.new(1, 0, 0, 0)
                }, {
                    InnerContent = v4.createElement(l_View_0, {
                        ref = v29, 
                        Size = UDim2.new(1, -v3.SCROLL_BAR_WIDTH, 0, 0), 
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        tag = "col gap-large align-x-center align-y-center padding-x-small padding-top-large"
                    }, {
                        MiddleContent = v40, 
                        WarningText = v4.createElement(l_Text_0, {
                            LayoutOrder = 3, 
                            Text = v32.TextChatMayBeSuspendedText, 
                            textStyle = v33.Theme.TextEmphasis, 
                            fontStyle = v33.Font.Body, 
                            Size = UDim2.new(1, 0, 0, 0), 
                            TextXAlignment = Enum.TextXAlignment.Center, 
                            TextYAlignment = Enum.TextYAlignment.Center, 
                            AutomaticSize = Enum.AutomaticSize.Y, 
                            TextWrapped = true
                        }), 
                        UnderstandButtonFrame = v4.createElement(l_View_0, {
                            Size = UDim2.new(1, 0, 0, 0), 
                            AutomaticSize = Enum.AutomaticSize.Y, 
                            LayoutOrder = 4
                        }, {
                            UnderstandButton = v4.createElement(l_Button_0, {
                                text = v32.IUnderstandText, 
                                variant = l_ButtonVariant_0.Standard, 
                                onActivated = v39, 
                                fillBehavior = l_FillBehavior_0.Fill, 
                                FillDirection = Enum.FillDirection.Horizontal
                            })
                        }), 
                        FeedbackFrame = v4.createElement(l_View_0, {
                            Size = UDim2.new(1, 0, 0, 0), 
                            AutomaticSize = Enum.AutomaticSize.Y, 
                            LayoutOrder = 5
                        }, {
                            FeedbackFooter = v4.createElement(v5, {
                                onDismiss = v27.onDismiss, 
                                renderTimestamp = v28.current, 
                                interventionType = v17.Constants.InterventionTypes.Nudge, 
                                eventId = v27.eventId, 
                                violatingChatLine = v27.violatingChatLine, 
                                duration = nil
                            })
                        })
                    })
                })
            })
        })
    });
end;
return ChatNudgeCustomDialog;