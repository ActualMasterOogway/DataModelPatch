local l_script_FirstAncestor_0 = script:FindFirstAncestor("Squads");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_HttpService_0 = game:GetService("HttpService");
local l_RunService_0 = game:GetService("RunService");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v5 = require(l_Parent_0.Foundation);
local v6 = require(l_Parent_0.React);
local v7 = require(l_script_FirstAncestor_0.Common.Constants);
local v8 = require(l_script_FirstAncestor_0.dependencies);
local v9 = require(l_script_FirstAncestor_0.Enums.SquadPartySheetActionEnum);
local l_CrossExperienceVoice_0 = v8.CrossExperienceVoice;
local l_SharedFlags_0 = v8.SharedFlags;
local l_SquadsCore_0 = v8.SquadsCore;
local l_SquadState_0 = l_SquadsCore_0.Enums.SquadState;
local l_UIBlox_0 = v8.UIBlox;
local l_VoiceChat_0 = v8.VoiceChat;
local l_dependencyArray_0 = v8.Hooks.dependencyArray;
local l_leaveSquad_0 = v8.SquadsCore.Thunks.leaveSquad;
local l_useAppPolicy_0 = v8.Hooks.useAppPolicy;
local l_useCurrentSquadParentChannelId_0 = l_SquadsCore_0.Hooks.useCurrentSquadParentChannelId;
local l_useDispatch_0 = v8.Hooks.useDispatch;
local l_useLocalization_0 = v8.Hooks.useLocalization;
local l_useLocalUserId_0 = v8.Hooks.useLocalUserId;
local l_useTokens_0 = v5.Hooks.useTokens;
local l_EventNames_0 = l_SquadsCore_0.Analytics.EventNames;
local l_SquadExternalContractContext_0 = l_SquadsCore_0.SquadExternalContractProvider.SquadExternalContractContext;
local l_ControlState_0 = l_UIBlox_0.Core.Control.Enum.ControlState;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local l_ImageSetLabel_0 = l_UIBlox_0.Core.ImageSet.ImageSetLabel;
local l_withHoverTooltip_0 = l_UIBlox_0.App.Dialog.TooltipV2.withHoverTooltip;
local l_useParticipant_0 = l_CrossExperienceVoice_0.Hooks.useParticipant;
local l_useParticipants_0 = l_CrossExperienceVoice_0.Hooks.useParticipants;
local l_useIsVoiceConnected_0 = l_CrossExperienceVoice_0.Hooks.useIsVoiceConnected;
local l_useIsVoiceFocused_0 = l_CrossExperienceVoice_0.Hooks.useIsVoiceFocused;
local l_useBackgroundExperience_0 = l_CrossExperienceVoice_0.Hooks.useBackgroundExperience;
local l_useIsActiveParticipant_0 = l_CrossExperienceVoice_0.Hooks.useIsActiveParticipant;
local l_CrossExperienceVoiceManager_0 = l_CrossExperienceVoice_0.CrossExperienceVoiceManager;
local l_GetFFlagEnableCrossExpVoice_0 = l_SharedFlags_0.GetFFlagEnableCrossExpVoice;
local l_FFlagSquadsFoundationEnabled_0 = l_SharedFlags_0.FFlagSquadsFoundationEnabled;
local v39 = game:DefineFastFlag("EnableCrossExpVoiceDebug", false);
local l_game_EngineFeature_0 = game:GetEngineFeature("AudioFocusManagement");
local function v49(v41) --[[ Line: 100 ]]
    -- upvalues: v6 (copy), l_ControlState_0 (copy), l_useTokens_0 (copy), l_withHoverTooltip_0 (copy), l_CoreGui_0 (copy), v5 (copy), l_dependencyArray_0 (copy)
    local v42, v43 = v6.useBinding(l_ControlState_0.Initialize);
    local v44 = l_useTokens_0();
    return l_withHoverTooltip_0({
        headerText = v41.tooltipText
    }, {
        DisplayOrder = 6, 
        disabled = false, 
        guiTarget = l_CoreGui_0, 
        triggerPointName = v41.triggerPointName
    }, function(v45, v46) --[[ Line: 111 ]]
        -- upvalues: v6 (ref), v41 (copy), v5 (ref), v44 (copy), l_ControlState_0 (ref), v42 (copy), v43 (copy), l_dependencyArray_0 (ref)
        return v6.createElement("Frame", {
            AutomaticSize = v41.automaticSize, 
            LayoutOrder = v41.layoutOrder, 
            Size = UDim2.fromOffset(40, 40), 
            BackgroundTransparency = 1, 
            [v6.Change.AbsolutePosition] = v45, 
            [v6.Change.AbsoluteSize] = v45
        }, {
            v6.createElement(v5.View, {
                Size = UDim2.fromScale(1, 1), 
                backgroundStyle = v41.backgroundStyle, 
                cornerRadius = UDim.new(0, v44.Radius.Circle), 
                isDisabled = v41.isDisabled, 
                onActivated = v41.onActivated, 
                onStateChanged = v6.useCallback(function(v47) --[[ Line: 126 ]]
                    -- upvalues: l_ControlState_0 (ref), v46 (copy), v42 (ref), v43 (ref)
                    local v48 = l_ControlState_0.fromRawValue(v47);
                    v46(v42:getValue(), v48);
                    v43(v48);
                end, l_dependencyArray_0(v42, v43, v46))
            }, v41.children)
        });
    end);
end;
local function v53(v50, v51, v52) --[[ Line: 136 ]] --[[ Name: renderStandardImage_DEPRECATED ]]
    -- upvalues: v6 (copy), l_ImageSetLabel_0 (copy)
    return v6.createElement(l_ImageSetLabel_0, {
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Position = UDim2.fromScale(0.5, 0.5), 
        Size = UDim2.fromOffset(v52, v52), 
        BackgroundTransparency = 1, 
        Image = v51, 
        ImageColor3 = v50.Color3, 
        ImageTransparency = v50.Transparency
    });
end;
local function v57(v54, v55, v56) --[[ Line: 149 ]] --[[ Name: renderStandardImage ]]
    -- upvalues: v6 (copy), v5 (copy)
    return v6.createElement(v5.Image, {
        Image = v55, 
        tag = {
            ["content-emphasis"] = not v54, 
            ["content-muted"] = v54, 
            ["anchor-center-center position-center-center " .. v56] = true
        }
    });
end;
local function v64(v58, v59, v60, v61, v62) --[[ Line: 160 ]] --[[ Name: getLoadingIndicatorIcon ]]
    -- upvalues: l_VoiceChat_0 (copy)
    local v63 = v58.Config.ColorMode.IsLight == "true" and "MicDark" or "MicLight";
    if not v60 or not v59 or v59.isMuted then
        return l_VoiceChat_0.Utils.GetIcon("Muted", v63);
    elseif v61 then
        return l_VoiceChat_0.Utils.GetIcon("Unmuted", v63, v62);
    else
        return l_VoiceChat_0.Utils.GetIcon("Unmuted0", v63);
    end;
end;
local function v70(v65, v66, v67) --[[ Line: 178 ]] --[[ Name: renderToggleAudioFocusButton ]]
    -- upvalues: v6 (copy), v49 (copy), l_FFlagSquadsFoundationEnabled_0 (copy), v5 (copy), l_ImageSetLabel_0 (copy), l_Images_0 (copy)
    local l_Color3_0 = v65.Color.Content.Emphasis.Color3;
    local l_Transparency_0 = v65.Color.Content.Emphasis.Transparency;
    return v6.createElement(v49, {
        automaticSize = Enum.AutomaticSize.X, 
        isDisabled = false, 
        layoutOrder = 0, 
        onActivated = v67, 
        tooltipText = v66, 
        triggerPointName = "ToggleAudioFocusButton"
    }, {
        UIListLayout = v6.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Center
        }), 
        UIPadding = v6.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, v65.Padding.Small), 
            PaddingRight = UDim.new(0, v65.Padding.Small)
        }), 
        ToggleFocusButtonIcon = if l_FFlagSquadsFoundationEnabled_0 then v6.createElement(v5.Image, {
            Image = "icons/controls/headphone", 
            tag = "anchor-center-center position-center-center size-900 content-emphasis"
        }) else v6.createElement(l_ImageSetLabel_0, {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.fromScale(0.5, 0.5), 
            Size = UDim2.fromOffset(36, 36), 
            BackgroundTransparency = 1, 
            Image = l_Images_0["icons/controls/headphone"], 
            ImageColor3 = l_Color3_0, 
            ImageTransparency = l_Transparency_0
        }), 
        CaretIcon = if l_FFlagSquadsFoundationEnabled_0 then v6.createElement(v5.Image, {
            Image = "icons/actions/truncationCollapse_small", 
            tag = "anchor-center-center position-center-center size-300-300 content-emphasis"
        }) else v6.createElement(l_ImageSetLabel_0, {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.fromScale(0.5, 0.5), 
            Size = UDim2.fromOffset(12, 12), 
            BackgroundTransparency = 1, 
            Image = l_Images_0["icons/actions/truncationCollapse_small"], 
            ImageColor3 = l_Color3_0, 
            ImageTransparency = l_Transparency_0
        })
    });
end;
return function(v71) --[[ Line: 230 ]]
    -- upvalues: l_useDispatch_0 (copy), l_useLocalization_0 (copy), l_useTokens_0 (copy), l_useCurrentSquadParentChannelId_0 (copy), v6 (copy), l_useAppPolicy_0 (copy), l_HttpService_0 (copy), l_SquadExternalContractContext_0 (copy), l_EventNames_0 (copy), v9 (copy), l_leaveSquad_0 (copy), l_dependencyArray_0 (copy), l_SquadState_0 (copy), v49 (copy), l_FFlagSquadsFoundationEnabled_0 (copy), v57 (copy), v53 (copy), l_Images_0 (copy), l_GetFFlagEnableCrossExpVoice_0 (copy), l_useLocalUserId_0 (copy), l_useBackgroundExperience_0 (copy), l_useParticipant_0 (copy), l_useIsVoiceConnected_0 (copy), l_useIsVoiceFocused_0 (copy), l_useParticipants_0 (copy), l_useIsActiveParticipant_0 (copy), l_game_EngineFeature_0 (copy), l_CrossExperienceVoiceManager_0 (copy), l_RunService_0 (copy), v70 (copy), v39 (copy), v64 (copy), v5 (copy), v7 (copy)
    local v72 = l_useDispatch_0();
    local v73 = l_useLocalization_0({
        audioText = "Feature.Squads.Label.Audio", 
        findExperiencesText = "Feature.Squads.Label.FindExperiences", 
        leavePartyText = "Feature.Squads.Label.LeaveParty", 
        muteMicText = "Feature.Squads.Label.MuteMic", 
        unmuteMicText = "Feature.Squads.Label.UnmuteMic", 
        viewChatText = "Feature.Squads.Label.ViewChat"
    });
    local v74 = l_useTokens_0();
    local v75 = l_useCurrentSquadParentChannelId_0();
    local v77 = v6.useCallback(function(v76) --[[ Line: 244 ]]
        return v76.getCanUsePlatformChat();
    end, {});
    local v78 = l_useAppPolicy_0(v77);
    local v79 = v6.useMemo(function() --[[ Line: 249 ]]
        -- upvalues: l_HttpService_0 (ref)
        return l_HttpService_0:GenerateGUID();
    end, {});
    local v80 = v6.useContext(l_SquadExternalContractContext_0);
    local v81 = v6.useCallback(function() --[[ Line: 255 ]]
        -- upvalues: v80 (copy), l_EventNames_0 (ref), v75 (copy), v9 (ref), v71 (copy)
        v80.fireSquadAnalytics(l_EventNames_0.PartySheetAction, {
            parentChannelId = v75, 
            actionType = v9.ChatButtonClicked
        });
        v71.navigateAwayFromSquad();
    end, {
        v71.navigateAwayFromSquad, 
        v75, 
        v80.fireSquadAnalytics
    });
    local v82 = v6.useCallback(function() --[[ Line: 264 ]]
        -- upvalues: v80 (copy), l_EventNames_0 (ref), v75 (copy), v9 (ref), v71 (copy)
        v80.fireSquadAnalytics(l_EventNames_0.PartySheetAction, {
            parentChannelId = v75, 
            actionType = v9.PickExperienceButtonClicked
        });
        v71.navigateToHomePage();
    end, {
        v75, 
        v71.navigateToHomePage, 
        v80.fireSquadAnalytics
    });
    local v83 = v6.useCallback(function() --[[ Line: 273 ]]
        -- upvalues: v80 (copy), l_EventNames_0 (ref), v75 (copy), v9 (ref), v72 (copy), l_leaveSquad_0 (ref), v71 (copy)
        v80.fireSquadAnalytics(l_EventNames_0.PartySheetAction, {
            parentChannelId = v75, 
            actionType = v9.EndCallButtonClicked
        });
        v72(l_leaveSquad_0(nil, v80.setSquadPrompt, function() --[[ Line: 279 ]]
            -- upvalues: v71 (ref)
            v71.navigateAwayFromSquad();
        end));
    end, l_dependencyArray_0(v72, v71.navigateAwayFromSquad, v75, v80.fireSquadAnalytics, v80.setSquadPrompt));
    local v84 = v71.squadState ~= l_SquadState_0.Active;
    local v86 = v6.useMemo(function() --[[ Line: 294 ]]
        -- upvalues: v84 (copy), v74 (copy), v6 (ref), v49 (ref), v81 (copy), v73 (copy), l_FFlagSquadsFoundationEnabled_0 (ref), v57 (ref), v53 (ref), l_Images_0 (ref)
        local v85 = if v84 then v74.Color.Content.Muted else v74.Color.Content.Emphasis;
        return v6.createElement(v49, {
            isDisabled = v84, 
            layoutOrder = 2, 
            onActivated = v81, 
            tooltipText = v73.viewChatText, 
            triggerPointName = "ChatButton"
        }, if l_FFlagSquadsFoundationEnabled_0 then v57(v84, "icons/menu/platformChatOff", "size-900-900") else v53(v85, l_Images_0["icons/menu/chat_off"], 36));
    end, l_dependencyArray_0(v74, v84, v73.viewChatText, v81));
    local v88 = v6.useMemo(function() --[[ Line: 317 ]]
        -- upvalues: v84 (copy), v74 (copy), v71 (copy), v6 (ref), v49 (ref), v82 (copy), v73 (copy), l_FFlagSquadsFoundationEnabled_0 (ref), v57 (ref), v53 (ref), l_Images_0 (ref)
        local v87 = if v84 then v74.Color.Content.Muted else v74.Color.Content.Emphasis;
        if v71.isInExperience then
            return nil;
        else
            return (v6.createElement(v49, {
                isDisabled = v84, 
                layoutOrder = 3, 
                onActivated = v82, 
                tooltipText = v73.findExperiencesText, 
                triggerPointName = "PickExperienceButton"
            }, if l_FFlagSquadsFoundationEnabled_0 then v57(v84, "icons/common/play", "size-600-600") else v53(v87, l_Images_0["icons/common/play"], 24)));
        end;
    end, l_dependencyArray_0(v74, v84, v73.findExperiencesText, v71.isInExperience, v71.navigateToHomePage));
    local v91 = v6.useMemo(function() --[[ Line: 348 ]]
        -- upvalues: v84 (copy), v74 (copy), v6 (ref), v49 (ref), v83 (copy), v73 (copy), l_FFlagSquadsFoundationEnabled_0 (ref), v57 (ref), v53 (ref), l_Images_0 (ref)
        local v89 = if v84 then v74.Color.ActionStandard.Background else v74.Color.System.Alert;
        local v90 = if v84 then v74.Color.Content.Muted else v74.DarkMode.Content.Emphasis;
        return v6.createElement(v49, {
            backgroundStyle = v89, 
            isDisabled = v84, 
            layoutOrder = 4, 
            onActivated = v83, 
            tooltipText = v73.leavePartyText, 
            triggerPointName = "EndCallButton"
        }, if l_FFlagSquadsFoundationEnabled_0 then v57(v84, "icons/navigation/close", "size-600-600") else v53(v90, l_Images_0["icons/navigation/close"], 24));
    end, l_dependencyArray_0(v74, v84, v73.leavePartyText, v83));
    local v92 = nil;
    local v93 = nil;
    local v94 = nil;
    if l_GetFFlagEnableCrossExpVoice_0() then
        local v95 = tonumber(l_useLocalUserId_0()) or -1;
        local v96 = v6.useRef(0);
        local v97 = l_useBackgroundExperience_0();
        local v98 = l_useParticipant_0(v95);
        local v99 = l_useIsVoiceConnected_0();
        local v100 = l_useIsVoiceFocused_0() or v71.forceIsVoiceFocused;
        local v101 = l_useParticipants_0();
        local v102 = l_useIsActiveParticipant_0(v95);
        local v103, v104 = v6.useState(0);
        local l_l_game_EngineFeature_0_0 = l_game_EngineFeature_0;
        local v106 = v6.useCallback(function() --[[ Line: 386 ]]
            -- upvalues: l_HttpService_0 (ref), v97 (copy), v98 (copy), v101 (copy), l_CrossExperienceVoiceManager_0 (ref)
            print("----------- CEV FOREGROUND -----------");
            print("Experience info", l_HttpService_0:JSONEncode(v97));
            print("Current Voice Participant", l_HttpService_0:JSONEncode(v98));
            print("Squads Store Participants", l_HttpService_0:JSONEncode(v101 or {}));
            print("--------------------------------------");
            l_CrossExperienceVoiceManager_0.default:dumpDebugData();
        end, l_dependencyArray_0(v101, v98));
        local v107 = v6.useCallback(function() --[[ Line: 395 ]]
            -- upvalues: v98 (copy), l_CrossExperienceVoiceManager_0 (ref)
            if v98 then
                if v98.isMuted then
                    l_CrossExperienceVoiceManager_0.default:unmuteVoiceParticipant(v98.userId);
                    return;
                else
                    l_CrossExperienceVoiceManager_0.default:muteVoiceParticipant(v98.userId);
                end;
            end;
        end, {
            v98
        });
        v6.useEffect(function() --[[ Line: 405 ]]
            -- upvalues: l_RunService_0 (ref), v79 (copy), v96 (copy), v104 (copy)
            l_RunService_0:BindToRenderStep(v79, 1, function() --[[ Line: 406 ]]
                -- upvalues: v96 (ref), v104 (ref)
                if v96.current > 3 then
                    v104(math.random());
                    v96.current = 0;
                    return;
                else
                    v96.current = v96.current + 1;
                    return;
                end;
            end);
            return function() --[[ Line: 415 ]]
                -- upvalues: l_RunService_0 (ref), v79 (ref)
                l_RunService_0:UnbindFromRenderStep(v79);
            end;
        end, {});
        v92 = v6.useMemo(function() --[[ Line: 421 ]]
            -- upvalues: v84 (copy), l_l_game_EngineFeature_0_0 (copy), v99 (copy), v70 (ref), v74 (copy), v73 (copy), v71 (copy)
            if not v84 and l_l_game_EngineFeature_0_0 and v99 then
                return v70(v74, v73.audioText, v71.toggleVoiceChatMenu);
            else
                return nil;
            end;
        end, l_dependencyArray_0(v74, l_l_game_EngineFeature_0_0, v84, v99, v73.audioText, v71.toggleVoiceChatMenu));
        if v39 then
            v93 = v6.useMemo(function() --[[ Line: 438 ]]
                -- upvalues: v84 (copy), v74 (copy), v6 (ref), v49 (ref), v106 (copy), l_FFlagSquadsFoundationEnabled_0 (ref), v57 (ref), v53 (ref), l_Images_0 (ref)
                local v108 = if v84 then v74.Color.Content.Muted else v74.Color.Content.Emphasis;
                return v6.createElement(v49, {
                    isDisabled = v84, 
                    layoutOrder = 5, 
                    onActivated = v106, 
                    tooltipText = "Debug voice", 
                    triggerPointName = "DebugVoiceButton"
                }, if l_FFlagSquadsFoundationEnabled_0 then v57(v84, "icons/status/player/developer", "size-600-600") else v53(v108, l_Images_0["icons/status/player/developer"], 24));
            end, l_dependencyArray_0(v74, v84, v106));
        end;
        local v109 = v6.useMemo(function() --[[ Line: 460 ]]
            -- upvalues: v64 (ref), v74 (copy), v98 (copy), v99 (copy), v84 (copy), v102 (copy), v103 (copy)
            return v64(v74, v98, v99, not v84 and v102, v103);
        end, l_dependencyArray_0(v102, v84, v99, v103, v98, v74));
        v94 = v6.useMemo(function() --[[ Line: 471 ]]
            -- upvalues: v84 (copy), l_game_EngineFeature_0 (ref), v100 (copy), v74 (copy), v99 (copy), v98 (copy), v6 (ref), v49 (ref), v107 (copy), v73 (copy), l_FFlagSquadsFoundationEnabled_0 (ref), v57 (ref), v109 (copy), v53 (ref)
            if v84 or not l_game_EngineFeature_0 or v100 then
                local v110 = {
                    Color3 = nil, 
                    Transparency = v74.Color.Content.Emphasis.Transparency
                };
                local v111 = not v99 or v98 == nil or v84;
                if v111 then
                    v110 = v74.Color.Content.Muted;
                end;
                local v112 = not v99 or not v98 or v98.isMuted;
                return v6.createElement(v49, {
                    isDisabled = v111, 
                    layoutOrder = 1, 
                    onActivated = v107, 
                    tooltipText = if v112 then v73.unmuteMicText else v73.muteMicText, 
                    triggerPointName = "ToggleMicButton"
                }, if l_FFlagSquadsFoundationEnabled_0 then v57(v111, v109, "size-800-800") else v53(v110, v109, 30));
            else
                return nil;
            end;
        end, l_dependencyArray_0(v74, v109, v84, v100, v99, v73.muteMicText, v73.unmuteMicText, v107, v98));
    end;
    return v6.createElement(v5.View, {
        AutomaticSize = Enum.AutomaticSize.X, 
        AnchorPoint = v71.anchorPoint, 
        Position = v71.position, 
        Size = UDim2.fromOffset(0, v7.SQUAD_LOBBY_ACTION_BAR_HEIGHT), 
        backgroundStyle = v74.Color.OverMedia.OverMedia_0, 
        cornerRadius = UDim.new(0, v74.Radius.Circle), 
        layout = {
            FillDirection = Enum.FillDirection.Horizontal, 
            Padding = UDim.new(0, v74.Gap.Large), 
            SortOrder = Enum.SortOrder.LayoutOrder
        }, 
        padding = v74.Padding.Small
    }, {
        ToggleAudioFocusButton = v92, 
        ToggleMicButton = v94, 
        ChatButton = if v78 then v86 else nil, 
        PickExperienceButton = v88, 
        EndCallButton = v91, 
        DebugVoiceButton = v93
    });
end;