local l_GuiService_0 = game:GetService("GuiService");
local l_HttpService_0 = game:GetService("HttpService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Squads");
local v3 = require(l_script_FirstAncestor_0.dependencies);
local l_React_0 = v3.React;
local l_Foundation_0 = v3.Foundation;
local l_SharedFlags_0 = v3.SharedFlags;
local l_CrossExperienceVoice_0 = v3.CrossExperienceVoice;
local l_CrossExperience_0 = v3.CrossExperience;
local l_default_0 = l_CrossExperienceVoice_0.CrossExperienceVoiceManager.default;
local l_VoiceStatus_0 = l_CrossExperience_0.Utils.VoiceStatus;
local l_VoiceStatusChanged_0 = l_CrossExperience_0.Actions.VoiceStatusChanged;
local l_useVoiceStatus_0 = l_CrossExperienceVoice_0.Hooks.useVoiceStatus;
local l_useLocalization_0 = v3.Hooks.useLocalization;
local l_useDispatch_0 = v3.Hooks.useDispatch;
local l_dependencyArray_0 = v3.Hooks.dependencyArray;
local l_useTokens_0 = l_Foundation_0.Hooks.useTokens;
local l_useNavigation_0 = v3.useNavigation;
local l_useAppPolicy_0 = v3.Hooks.useAppPolicy;
local l_GetFFlagEnableCrossExpVoice_0 = l_SharedFlags_0.GetFFlagEnableCrossExpVoice;
local l_useCurrentSquadId_0 = v3.SquadsCore.Hooks.useCurrentSquadId;
local l_useCurrentSquadParentChannelId_0 = v3.SquadsCore.Hooks.useCurrentSquadParentChannelId;
local l_useStore_0 = v3.Hooks.useStore;
local l_SquadPromptType_0 = v3.SquadsCore.Enums.SquadPromptType;
local l_SquadExternalContractContext_0 = v3.SquadsCore.SquadExternalContractProvider.SquadExternalContractContext;
local l_getFFlagEnableCrossExpVoiceMemoryCheck_0 = l_SharedFlags_0.getFFlagEnableCrossExpVoiceMemoryCheck;
local v26 = require(l_script_FirstAncestor_0.Hooks.useIsAnyOtherUserPartyVoiceEligible);
local l_useIsLocalPlayerPartyVoiceEligible_0 = v3.SquadsCore.Hooks.useIsLocalPlayerPartyVoiceEligible;
local l_useIsCurrentSquadPartyVoiceEligible_0 = v3.SquadsCore.Hooks.useIsCurrentSquadPartyVoiceEligible;
local v29 = game:DefineFastString("PartyVoiceBannerErrorUserNotEligibleURL", "");
openWebview = function(v30, v31) --[[ Line: 49 ]] --[[ Name: openWebview ]]
    -- upvalues: l_HttpService_0 (copy), l_GuiService_0 (copy)
    local v32 = l_HttpService_0:JSONEncode({
        title = if game:GetEngineFeature("SetWebViewTitle") then v30 else nil, 
        presentationStyle = 0, 
        visible = true, 
        url = v31
    });
    l_GuiService_0:BroadcastNotification(v32, 20);
end;
local function v36(v33) --[[ Line: 62 ]]
    -- upvalues: l_useTokens_0 (copy), l_React_0 (copy), l_Foundation_0 (copy)
    local v34 = l_useTokens_0();
    local l_isButtonInline_0 = v33.isButtonInline;
    return l_React_0.createElement("Frame", {
        AutomaticSize = Enum.AutomaticSize.Y, 
        Size = UDim2.fromScale(1, 0), 
        BackgroundColor3 = v34.Color.Surface.Surface_200.Color3, 
        BackgroundTransparency = v34.Color.Surface.Surface_200.Transparency, 
        LayoutOrder = v33.LayoutOrder
    }, {
        UICorner = l_React_0.createElement("UICorner", {
            CornerRadius = UDim.new(0, v34.Radius.Small)
        }), 
        UIPadding = l_React_0.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, v34.Gap.XLarge), 
            PaddingRight = UDim.new(0, v34.Gap.XLarge), 
            PaddingTop = UDim.new(0, v34.Gap.Medium), 
            PaddingBottom = UDim.new(0, v34.Gap.Medium)
        }), 
        UIListLayout = l_React_0.createElement("UIListLayout", {
            FillDirection = if l_isButtonInline_0 then Enum.FillDirection.Horizontal else Enum.FillDirection.Vertical, 
            Padding = if l_isButtonInline_0 then UDim.new(0, v34.Gap.XSmall) else UDim.new(0, v34.Gap.Medium), 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            Wraps = not l_isButtonInline_0, 
            HorizontalFlex = if l_isButtonInline_0 then Enum.UIFlexAlignment.SpaceBetween else Enum.UIFlexAlignment.Fill, 
            VerticalFlex = if l_isButtonInline_0 then Enum.UIFlexAlignment.Fill else Enum.UIFlexAlignment.None
        }), 
        TextLabel = l_React_0.createElement(l_Foundation_0.Text, {
            AutomaticSize = Enum.AutomaticSize.XY, 
            backgroundStyle = v34.Color.None, 
            colorstyle = v34.Color.Content.Emphasis, 
            fontStyle = v34.Typography.BodySmall, 
            LayoutOrder = 1, 
            Text = v33.label, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            TextTruncate = Enum.TextTruncate.None, 
            TextWrapped = true
        }, {
            UIFlexItem = l_React_0.createElement("UIFlexItem", {
                FlexMode = Enum.UIFlexMode.Shrink
            })
        }), 
        InlineButton = if v33.onActivated and l_isButtonInline_0 then l_React_0.createElement(l_Foundation_0.Button, {
            LayoutOrder = 2, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            text = v33.buttonLabel, 
            variant = l_Foundation_0.Enums.ButtonVariant.Link, 
            onActivated = v33.onActivated
        }) else nil, 
        BottomButton = if not v33.onActivated or l_isButtonInline_0 then nil else l_React_0.createElement(l_Foundation_0.Button, {
            LayoutOrder = 2, 
            text = v33.buttonLabel, 
            variant = l_Foundation_0.Enums.ButtonVariant.Standard, 
            size = l_Foundation_0.Enums.ButtonSize.Small, 
            onActivated = v33.onActivated, 
            fillBehavior = l_Foundation_0.Enums.FillBehavior.Fill
        })
    });
end;
local function v49(v37) --[[ Line: 133 ]]
    -- upvalues: l_useDispatch_0 (copy), l_useStore_0 (copy), l_React_0 (copy), l_SquadExternalContractContext_0 (copy), l_useCurrentSquadId_0 (copy), l_useVoiceStatus_0 (copy), l_CrossExperience_0 (copy), l_VoiceStatus_0 (copy), l_useLocalization_0 (copy), l_VoiceStatusChanged_0 (copy), l_default_0 (copy), l_getFFlagEnableCrossExpVoiceMemoryCheck_0 (copy), l_SquadPromptType_0 (copy), l_dependencyArray_0 (copy), v36 (copy)
    local v38 = l_useDispatch_0();
    local v39 = l_useStore_0();
    local v40 = l_React_0.useContext(l_SquadExternalContractContext_0);
    local v41 = l_useCurrentSquadId_0() or "";
    local v42 = l_useVoiceStatus_0();
    local v43 = v42 == l_CrossExperience_0.Constants.VOICE_STATUS.ERROR_JOIN_FEASIBILITY_CHECK_FAILED;
    local v44 = l_VoiceStatus_0.isVoiceRetriableErrorByGameJoin(v42) or l_VoiceStatus_0.isVoiceRetriableErrorByVoiceJoin(v42);
    local v45 = l_useLocalization_0({
        errorText = "Feature.Squads.Label.VoiceErrorGeneral", 
        errorButton = "Feature.Squads.Action.VoiceErrorGeneral"
    });
    local v48 = l_React_0.useCallback(function() --[[ Line: 148 ]]
        -- upvalues: v38 (copy), l_VoiceStatusChanged_0 (ref), l_CrossExperience_0 (ref), l_default_0 (ref), v41 (copy), l_getFFlagEnableCrossExpVoiceMemoryCheck_0 (ref), v43 (copy), v40 (copy), v39 (copy), l_SquadPromptType_0 (ref), l_VoiceStatus_0 (ref), v42 (copy)
        local function v47(v46) --[[ Line: 149 ]]
            -- upvalues: v38 (ref), l_VoiceStatusChanged_0 (ref), l_CrossExperience_0 (ref), l_default_0 (ref), v41 (ref)
            v38(l_VoiceStatusChanged_0({
                status = l_CrossExperience_0.Constants.VOICE_STATUS.RCC_CONNECTING
            }));
            l_default_0:join({
                partyId = v41, 
                force = true, 
                shouldIgnoreMemoryWarning = v46
            });
        end;
        if l_getFFlagEnableCrossExpVoiceMemoryCheck_0() and v43 then
            if l_default_0:performJoinFeasibilityCheck() then
                v47();
                return;
            else
                v40.setSquadPrompt(v39, {
                    hideCancelButton = false, 
                    promptType = l_SquadPromptType_0.ConnectVoiceWithLowMemory, 
                    onConfirm = function() --[[ Line: 170 ]] --[[ Name: onConfirm ]]

                    end, 
                    onCancel = function() --[[ Line: 171 ]] --[[ Name: onCancel ]]
                        -- upvalues: v47 (copy)
                        v47(true);
                    end
                });
                return;
            end;
        elseif l_VoiceStatus_0.isVoiceRetriableErrorByGameJoin(v42) then
            if l_getFFlagEnableCrossExpVoiceMemoryCheck_0() then
                v47();
                return;
            else
                v38(l_VoiceStatusChanged_0({
                    status = l_CrossExperience_0.Constants.VOICE_STATUS.RCC_CONNECTING
                }));
                l_default_0:join({
                    partyId = v41, 
                    force = true
                });
                return;
            end;
        else
            if l_VoiceStatus_0.isVoiceRetriableErrorByVoiceJoin(v42) then
                l_default_0:rejoinVoice();
            end;
            return;
        end;
    end, l_dependencyArray_0(v42, v41, v43));
    if l_getFFlagEnableCrossExpVoiceMemoryCheck_0() and v43 or v44 then
        return (l_React_0.createElement(v36, {
            LayoutOrder = v37.LayoutOrder, 
            label = v45.errorText, 
            buttonLabel = v45.errorButton, 
            isButtonInline = true, 
            onActivated = if v41 ~= "" then v48 else nil
        }));
    else
        return nil;
    end;
end;
local function v57(v50) --[[ Line: 211 ]]
    -- upvalues: l_useIsCurrentSquadPartyVoiceEligible_0 (copy), l_useIsLocalPlayerPartyVoiceEligible_0 (copy), v26 (copy), l_useLocalization_0 (copy), l_useAppPolicy_0 (copy), l_React_0 (copy), v36 (copy), v29 (copy)
    local v51 = l_useIsCurrentSquadPartyVoiceEligible_0();
    local v52 = l_useIsLocalPlayerPartyVoiceEligible_0();
    local v53 = v26();
    local v54 = l_useLocalization_0({
        errorText = "Feature.Squads.Label.VoiceErrorUserIneligible", 
        errorButton = "Feature.Squads.Action.VoiceErrorUserIneligible"
    });
    local v56 = l_useAppPolicy_0(function(v55) --[[ Line: 219 ]]
        return v55.getWebViewSupport();
    end);
    if not (v51 and not v52 and v53) then
        return nil;
    else
        return l_React_0.createElement(v36, {
            LayoutOrder = v50.LayoutOrder, 
            label = v54.errorText, 
            buttonLabel = v54.errorButton, 
            isButtonInline = false, 
            onActivated = v56 and function() --[[ Line: 237 ]]
                -- upvalues: v29 (ref), v54 (copy)
                if v29 ~= "" then
                    openWebview(v54.errorButton, v29);
                end;
            end or nil
        });
    end;
end;
local function v65(v58) --[[ Line: 250 ]]
    -- upvalues: l_useNavigation_0 (copy), l_useCurrentSquadParentChannelId_0 (copy), l_useIsCurrentSquadPartyVoiceEligible_0 (copy), l_useIsLocalPlayerPartyVoiceEligible_0 (copy), l_useLocalization_0 (copy), l_React_0 (copy), v36 (copy)
    local v59 = l_useNavigation_0();
    local v60 = l_useCurrentSquadParentChannelId_0() or "";
    local v61 = l_useIsCurrentSquadPartyVoiceEligible_0();
    local v62 = l_useIsLocalPlayerPartyVoiceEligible_0();
    local v63 = false;
    if v61 == false then
        v63 = v62;
    end;
    local v64 = l_useLocalization_0({
        errorText = "Feature.Squads.Label.VoiceErrorPartyNotVoiceEligible", 
        errorButton = "Feature.Squads.Action.VoiceErrorPartyNotVoiceEligible"
    });
    if not v63 then
        return nil;
    else
        return l_React_0.createElement(v36, {
            LayoutOrder = v58.LayoutOrder, 
            label = v64.errorText, 
            buttonLabel = v64.errorButton, 
            isButtonInline = false, 
            onActivated = function() --[[ Line: 270 ]] --[[ Name: onActivated ]]
                -- upvalues: v60 (copy), v59 (copy)
                if v60 ~= "" then
                    pcall(function() --[[ Line: 272 ]]
                        -- upvalues: v59 (ref), v60 (ref)
                        v59.navigate("CreateUnfilteredChatPartialModal", {
                            conversationId = v60
                        });
                    end);
                end;
            end
        });
    end;
end;
return function(v66) --[[ Line: 286 ]]
    -- upvalues: l_useTokens_0 (copy), l_React_0 (copy), l_GetFFlagEnableCrossExpVoice_0 (copy), v49 (copy), v65 (copy), v57 (copy)
    local v67 = l_useTokens_0();
    local v69 = l_React_0.useCallback(function(v68) --[[ Line: 288 ]]
        -- upvalues: v66 (copy)
        if v68 then
            v66.onAbsoluteSizeChanged(v68.AbsoluteSize);
        end;
    end, {
        v66.onAbsoluteSizeChanged
    });
    return l_React_0.createElement("Frame", {
        AutomaticSize = Enum.AutomaticSize.Y, 
        Size = UDim2.fromScale(1, 0), 
        BackgroundTransparency = 1, 
        [l_React_0.Change.AbsoluteSize] = v69
    }, {
        UIPadding = l_React_0.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, v67.Padding.XLarge), 
            PaddingRight = UDim.new(0, v67.Padding.XLarge)
        }), 
        UIListLayout = l_React_0.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            Padding = UDim.new(0, v67.Gap.Medium)
        }), 
        VoiceErrorBanner = if l_GetFFlagEnableCrossExpVoice_0() then l_React_0.createElement(v49, {
            LayoutOrder = 1
        }) else nil, 
        PartyVoiceEligibilityBanner = if l_GetFFlagEnableCrossExpVoice_0() then l_React_0.createElement(v65, {
            LayoutOrder = 2
        }) else nil, 
        PartyVoiceUserEligibilityBanner = if l_GetFFlagEnableCrossExpVoice_0() then l_React_0.createElement(v57, {
            LayoutOrder = 3
        }) else nil
    });
end;