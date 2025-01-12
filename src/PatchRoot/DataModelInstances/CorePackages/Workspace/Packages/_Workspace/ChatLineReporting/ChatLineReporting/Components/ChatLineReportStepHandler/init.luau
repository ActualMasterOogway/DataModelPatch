local l_script_FirstAncestor_0 = script:FindFirstAncestor("ChatLineReporting");
local l_Players_0 = game:GetService("Players");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.Cryo);
local v5 = require(l_Parent_0.ReactOtter);
local l_GuiService_0 = game:GetService("GuiService");
local l_DefaultReportDialog_0 = require(l_Parent_0.GenericAbuseReporting).UXFlows.DefaultReportDialog;
local v8 = require(l_Parent_0.NotificationModalsManager);
local l_useTokens_0 = require(l_Parent_0.Foundation).Hooks.useTokens;
local l_Images_0 = require(l_Parent_0.UIBlox).App.ImageSet.Images;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v12 = require(l_script_FirstAncestor_0.Common.Constants);
local v13 = require(l_script_FirstAncestor_0.Common.AnalyticsReducer);
local v14 = require(l_script_FirstAncestor_0.Common.ChatLineReportAnalytics);
local v15 = require(l_script_FirstAncestor_0.Common.buildReport);
local v16 = require(l_script_FirstAncestor_0.Common.isSystemMessage);
local v17 = require(l_script_FirstAncestor_0.Components.ChatLineReportSelectionModal);
local v18 = require(l_script_FirstAncestor_0.Components.ChatLineReportVerbatim);
local v19 = require(l_script_FirstAncestor_0.Components.ChatLineReportCompleteModal);
local l_GetFFlagChatLineAbandonedReportAnalyticsFix_0 = require(l_Parent_0.SharedFlags).GetFFlagChatLineAbandonedReportAnalyticsFix;
local l_GetFFlagAddMuteErrorStates_0 = require(l_Parent_0.SharedFlags).GetFFlagAddMuteErrorStates;
local v22 = {
    stiffness = 400, 
    damping = 40, 
    mass = 1
};
return function(v23) --[[ Line: 42 ]] --[[ Name: ChatLineReportStepHandler ]]
    -- upvalues: v3 (copy), v12 (copy), v13 (copy), l_GuiService_0 (copy), l_useLocalization_0 (copy), l_useTokens_0 (copy), v16 (copy), v5 (copy), v8 (copy), l_Images_0 (copy), l_GetFFlagAddMuteErrorStates_0 (copy), v22 (copy), v14 (copy), v15 (copy), l_Players_0 (copy), v4 (copy), l_GetFFlagChatLineAbandonedReportAnalyticsFix_0 (copy), v17 (copy), l_DefaultReportDialog_0 (copy), v18 (copy), v19 (copy)
    local v24, v25 = v3.useState(v12.ReportSteps.SELECT);
    local v26, v27 = v3.useState(nil);
    local v28, v29 = v3.useReducer(v13, v12.AnalyticsInitialState);
    local v30, v31 = v3.useState(not l_GuiService_0.MenuIsOpen);
    local v32, v33 = v3.useState(l_GuiService_0.MenuIsOpen);
    local v34, v35 = v3.useState(false);
    local v36, v37 = v3.useState(nil);
    local v38, v39 = v3.useState("");
    local v40 = l_useLocalization_0(v12.ChatLineLocalizationKeys);
    local v41 = l_useLocalization_0({
        ChatToastTitleSuccess = {
            "Feature.ReportAbuse.Label.UserTextMuted"; 
            name = v38
        }, 
        ChatToastTitleError = {
            "Feature.ReportAbuse.Label.UserTextMutedError"; 
            name = v38
        }, 
        ChatToastDescriptionErrorDoesNotExist = {
            "Feature.ReportAbuse.Message.UserTextMutedErrorDoesNotExist"; 
            name = v38
        }
    });
    local v42 = l_useTokens_0();
    v3.useEffect(function() --[[ Line: 66 ]]
        -- upvalues: v29 (copy), v12 (ref), v23 (copy), v16 (ref), l_GuiService_0 (ref), v33 (copy), v31 (copy)
        v29({
            type = v12.AnalyticsActions.AccumulateForTimeSpent, 
            accumulated_time_ms = workspace:GetServerTimeNow() * 1000
        });
        v29({
            type = v12.AnalyticsActions.SetPlaceId, 
            place_id = game.PlaceId
        });
        local l_ViewportSize_0 = game.Workspace.CurrentCamera.ViewportSize;
        local l_v29_0 = v29;
        local v45 = {
            type = v12.AnalyticsActions.SetViewportInformation, 
            viewport_size_x = l_ViewportSize_0.X, 
            viewport_size_y = l_ViewportSize_0.Y
        };
        local v46 = false;
        if l_ViewportSize_0.X < l_ViewportSize_0.Y then
            v46 = l_ViewportSize_0.X < 800;
        end;
        v45.is_portrait_mode = v46;
        l_v29_0(v45);
        l_v29_0 = 0;
        v45 = 0;
        for _, v48 in ipairs(v23.messages) do
            if not v16(v48) then
                l_v29_0 = l_v29_0 + 1;
                if v48.textChannel.Name ~= v12.ChannelTypes.General then
                    v45 = v45 + 1;
                end;
            end;
        end;
        v29({
            type = v12.AnalyticsActions.SetChatHistoryInformation, 
            selectable_chat_history_size = l_v29_0, 
            total_chat_history_size = #v23.messages, 
            num_non_general_channel_chats = v45
        });
        v46 = l_GuiService_0.MenuOpened:Connect(function() --[[ Line: 105 ]]
            -- upvalues: v33 (ref), v31 (ref)
            v33(true);
            v31(false);
        end);
        local v49 = l_GuiService_0.MenuClosed:Connect(function() --[[ Line: 109 ]]
            -- upvalues: v33 (ref), v31 (ref)
            v33(false);
            v31(true);
        end);
        return function() --[[ Line: 113 ]]
            -- upvalues: v46 (copy), v49 (copy)
            v46:Disconnect();
            v49:Disconnect();
        end;
    end, {});
    local v50, v51 = v5.useAnimatedBinding(1, function() --[[ Line: 119 ]]
        -- upvalues: v30 (copy), v34 (copy), v36 (copy), v12 (ref), v8 (ref), l_Images_0 (ref), v41 (copy), v40 (copy), v42 (copy), l_GetFFlagAddMuteErrorStates_0 (ref), v23 (copy)
        if not v30 then
            if v34 then
                if v36 and v36.key == v12.SuccessfulMuteKey then
                    v8.SetUIBloxToast({
                        iconImage = l_Images_0[v12.ToastIconImageSuccess], 
                        toastTitle = v41.ChatToastTitleSuccess, 
                        toastSubtitle = v40.ChatToastDescriptionSuccess, 
                        sequenceNumber = DateTime.now().UnixTimestamp, 
                        iconColorStyle = {
                            Color = v42.Color.System.Success.Color3, 
                            Transparency = 0
                        }
                    });
                elseif v36 and l_GetFFlagAddMuteErrorStates_0() then
                    v8.SetUIBloxToast({
                        iconImage = l_Images_0[v12.ToastIconImageError], 
                        toastTitle = v41.ChatToastTitleError, 
                        toastSubtitle = if v36.key == v12.ErrorSelfMuteKey then v40.ChatToastDescriptionErrorSelf else v41.ChatToastDescriptionErrorDoesNotExist, 
                        sequenceNumber = DateTime.now().UnixTimestamp, 
                        iconColorStyle = {
                            Color = v42.Color.System.Warning.Color3, 
                            Transparency = 0
                        }
                    });
                end;
            end;
            v23.unmount();
        end;
    end);
    local v52 = v3.useMemo(function() --[[ Line: 155 ]]
        -- upvalues: v30 (copy)
        if v30 then
            return 0;
        else
            return 1;
        end;
    end, {
        v30
    });
    v3.useEffect(function() --[[ Line: 159 ]]
        -- upvalues: v51 (copy), v5 (ref), v52 (copy), v22 (ref)
        v51(v5.spring(v52, v22));
    end, {
        v52
    });
    local v53 = v3.useCallback(function() --[[ Line: 164 ]]
        -- upvalues: v26 (copy), v25 (copy), v12 (ref)
        if v26 ~= nil then
            v25(v12.ReportSteps.SUBMIT);
        end;
    end);
    local v54 = v3.useCallback(function() --[[ Line: 170 ]]
        -- upvalues: v14 (ref), v28 (copy), v31 (copy)
        v14(v28, 2, false);
        v31(false);
    end, {
        v28
    });
    local v57 = v3.useCallback(function(_, _) --[[ Line: 177 ]]
        -- upvalues: v14 (ref), v28 (copy), v31 (copy)
        v14(v28, 1, false);
        v31(false);
    end, {
        v28
    });
    local v58 = v3.useCallback(function() --[[ Line: 182 ]]
        -- upvalues: v25 (copy), v12 (ref), v27 (copy)
        v25(v12.ReportSteps.SELECT);
        v27(nil);
    end);
    local v65 = v3.useCallback(function(v59, v60) --[[ Line: 187 ]]
        -- upvalues: v15 (ref), l_Players_0 (ref), v26 (copy), v4 (ref), v23 (copy), v16 (ref), v29 (copy), v12 (ref), v25 (copy)
        local v61 = {};
        local v62 = v15(l_Players_0.LocalPlayer.UserId, v26.userId, v59, v60);
        v4.Dictionary.map(v23.messages, function(v63) --[[ Line: 192 ]]
            -- upvalues: v16 (ref), v61 (copy)
            if not v16(v63) then
                v61[#v61 + 1] = {
                    channel = v63.textChannel, 
                    messageId = v63.messageId
                };
            end;
        end);
        local v64 = {
            {
                channel = v26.textChannel, 
                messageId = v26.messageId
            }
        };
        v29({
            type = v12.AnalyticsActions.SetReasonSelection, 
            reason_selection = v59
        });
        v29({
            type = v12.AnalyticsActions.SetCommentAdded, 
            comment_added = #v60 > 0
        });
        l_Players_0:ReportChatAbuse(v61, v64, v62);
        v25(v12.ReportSteps.COMPLETE);
        return true;
    end, {
        v23.messages, 
        v26
    });
    local v67 = v3.useCallback(function(v66) --[[ Line: 224 ]]
        -- upvalues: v14 (ref), v28 (copy), v37 (copy), v39 (copy), v35 (copy), v31 (copy), l_GetFFlagChatLineAbandonedReportAnalyticsFix_0 (ref)
        if v66 then
            v14(v28, 1, true);
            v37(v66);
            v39(v66.args.RBX_NAME);
            v35(true);
            v31(false);
            return;
        else
            if l_GetFFlagChatLineAbandonedReportAnalyticsFix_0() then
                v14(v28, 1, false);
            else
                v14(v28, 2, false);
            end;
            v31(false);
            return;
        end;
    end, {
        v28
    });
    local v68 = v3.useCallback(function() --[[ Line: 242 ]]
        -- upvalues: v14 (ref), v28 (copy), v31 (copy)
        v14(v28, 1, false);
        v31(false);
    end, {
        v28
    });
    return v3.createElement("TextButton", {
        Active = v50:map(function(v69) --[[ Line: 248 ]]
            return v69 == 0;
        end), 
        AutoButtonColor = false, 
        BorderSizePixel = 0, 
        BackgroundTransparency = v50:map(function(v70) --[[ Line: 253 ]]
            return v70 + 0.3;
        end), 
        BackgroundColor3 = Color3.fromHex("#000000"), 
        Text = "", 
        Size = UDim2.new(1, 0, 1, 0), 
        Position = UDim2.fromScale(0.5, 0.5), 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        [v3.Event.Activated] = if l_GetFFlagChatLineAbandonedReportAnalyticsFix_0() then if v24 == v12.ReportSteps.COMPLETE then v68 else v54 else v54, 
        ZIndex = 10
    }, {
        Frame = v3.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1, 
            Position = v50:map(function(v71) --[[ Line: 271 ]]
                -- upvalues: v32 (copy)
                if v32 then
                    return UDim2.new(0, 0, -v71, 0);
                else
                    return UDim2.new(0, 0, v71, 0);
                end;
            end)
        }, {
            ChatLineReportStep = if v24 == v12.ReportSteps.SELECT then v3.createElement(v17, {
                onContinue = v53, 
                onBack = v54, 
                messages = v23.messages, 
                selectedMessage = v26, 
                setSelectedMessage = v27, 
                analyticsDispatch = v29
            }) else if v24 == v12.ReportSteps.SUBMIT then v3.createElement(l_DefaultReportDialog_0, {
                analyticsContext = "ReportViaChatLine", 
                topCustomComponent = v3.createElement(v18, {
                    selectedMessage = v26
                }), 
                implSubmit = v65, 
                onSubmitProps = {
                    hasNextSteps = true, 
                    onProceedToNextStep = v65
                }, 
                localizationKeys = v12.GenericAbuseReportingLocalizationKeys, 
                onComplete = v57, 
                onCloseProps = {
                    hasPreviousSteps = true, 
                    onBackToPreviousStep = v58
                }, 
                reportCategories = v12.ChatLineReportCategories, 
                onBeforeSubmitAnalytics = function(v72) --[[ Line: 305 ]] --[[ Name: onBeforeSubmitAnalytics ]]
                    return v72;
                end
            }) else if v24 == v12.ReportSteps.COMPLETE then v3.createElement(v19, {
                localizationKeys = v12.GenericAbuseReportingLocalizationKeys, 
                onDismiss = v67, 
                selectedMessage = v26
            }) else nil
        })
    });
end;