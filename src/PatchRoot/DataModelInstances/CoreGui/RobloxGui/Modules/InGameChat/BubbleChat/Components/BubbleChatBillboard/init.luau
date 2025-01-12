local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Players_0 = game:GetService("Players");
local l_RunService_0 = game:GetService("RunService");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_StarterGui_0 = game:GetService("StarterGui");
local l_VRService_0 = game:GetService("VRService");
local v7 = require(script.Parent.Parent.Logger)(script.Name);
local v8 = require(l_CorePackages_0.Packages.Roact);
local v9 = require(l_CorePackages_0.Packages.RoactRodux);
local v10 = require(l_CorePackages_0.Packages.t);
local v11 = require(l_CorePackages_0.Packages.Otter);
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.PermissionsProtocol).PermissionsProtocol.default;
local v13 = require(l_RobloxGui_0.Modules.Settings.getCamMicPermissions);
local v14 = require(script.Parent.BubbleChatList);
local v15 = require(script.Parent.ChatBubbleDistant);
local v16 = require(script.Parent.VoiceBubble);
local v17 = require(script.Parent.ControlsBubble);
local v18 = require(l_RobloxGui_0.Modules.VoiceChat.Components.VoiceIndicator);
local v19 = require(script.Parent.Parent.Types);
local v20 = require(script.Parent.Parent.Constants);
local v21 = require(script.Parent.Parent.Helpers.getSettingsForMessage);
local v22 = require(l_RobloxGui_0.Modules.SelfView.selfViewVisibilityUpdatedSignal);
local v23 = require(l_RobloxGui_0.Modules.Chrome.Enabled);
local v24 = require(l_RobloxGui_0.Modules.VoiceChat.Constants);
local l_default_1 = require(l_RobloxGui_0.Modules.VoiceChat.VoiceChatServiceManager).default;
local v26 = require(l_RobloxGui_0.Modules.Flags.GetFFlagEnableVoiceChatSpeakerIcons);
local v27 = require(l_RobloxGui_0.Modules.Flags.GetFFlagMicConnectingToast);
local v28 = require(l_RobloxGui_0.Modules.Flags.GetFFlagEnableVoiceChatManualReconnect);
local v29 = require(l_RobloxGui_0.Modules.Flags.GetFFlagBubbleChatInexistantAdorneeFix);
local v30 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagAvatarChatCoreScriptSupport();
local v31 = require(l_RobloxGui_0.Modules.Flags.FFlagEnableAvatarChatToggleUIUpgradeForLegacyChatService);
local v32 = require(l_RobloxGui_0.Modules.Flags.GetFFlagShowSpeakerIconWithChatBubbles);
local v33 = require(l_RobloxGui_0.Modules.SelfView.publicApi);
local v34 = game:DefineFastInt("BubbleVoiceTimeoutMillis", 1000);
local v35 = game:DefineFastFlag("DebugAllowControlButtonsNoVoiceChat", false);
local v36 = require(l_RobloxGui_0.Modules.Flags.FFlagVRMoveVoiceIndicatorToBottomBar);
local v37 = require(l_RobloxGui_0.Modules.Common.IXPServiceWrapper);
local v38 = game:DefineFastFlag("EasierUnmuting3", false);
local v39 = game:DefineFastFlag("EasierUnmutingBasedOnCamera", false);
local v40 = game:DefineFastFlag("EasierUnmutingHideIfMuted", false);
local v41 = game:DefineFastInt("EasierUnmutingDisplayDistance", 20);
local v42 = game:DefineFastString("EasierUnmutingIXPLayerName", "Voice.UserAgency");
local v43 = game:DefineFastString("EasierUnmutingIXPLayerValue", "VoiceUserAgencyEnabled");
local v44 = game:DefineFastFlag("EasierUnmutingFixNonexistentCharacter", false);
local v45 = require(l_RobloxGui_0.Modules.Flags.getFFlagDoNotPromptCameraPermissionsOnMount);
local v46 = v8.PureComponent:extend("BubbleChatBillboard");
local v47 = {
    dampingRatio = 1, 
    frequency = 4
};
local v48 = nil;
if v31 then
    v48 = require(script.Parent.ControlsBubbleV2);
end;
v46.validateProps = v10.strictInterface({
    userId = v10.string, 
    onFadeOut = v10.optional(v10.callback), 
    voiceEnabled = v10.optional(v10.boolean), 
    bubbleChatEnabled = v10.optional(v10.boolean), 
    chatSettings = v19.IChatSettings, 
    messageIds = v10.optional(v10.array(v10.string)), 
    lastMessage = v10.optional(v19.IMessage), 
    voiceState = v10.optional(v10.string)
});
getEasierUnmutingDistance = function(v49) --[[ Line: 90 ]] --[[ Name: getEasierUnmutingDistance ]]
    -- upvalues: v44 (copy), l_Players_0 (copy), v39 (copy)
    if not v49 then
        return nil;
    elseif v44 then
        local v50 = l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.Character and l_Players_0.LocalPlayer.Character:FindFirstChild("HumanoidRootPart");
        local v51 = v50 and v50.CFrame and v50.CFrame.Position;
        local v52 = workspace.CurrentCamera and workspace.CurrentCamera.CFrame.Position;
        if v39 or not v51 then
            if not v52 then
                return nil;
            else
                return (v49 - v52).Magnitude;
            end;
        else
            return (v49 - v51).Magnitude;
        end;
    else
        local l_HumanoidRootPart_0 = l_Players_0.LocalPlayer.Character:FindFirstChild("HumanoidRootPart");
        local v54 = workspace.CurrentCamera and workspace.CurrentCamera.CFrame.Position;
        if v39 or not l_HumanoidRootPart_0 then
            if not v54 then
                return nil;
            else
                return (v49 - v54).Magnitude;
            end;
        else
            return (v49 - l_HumanoidRootPart_0.CFrame.Position).Magnitude;
        end;
    end;
end;
v46.init = function(v55) --[[ Line: 132 ]] --[[ Name: init ]]
    -- upvalues: v33 (copy), v30 (copy), l_StarterGui_0 (copy), v38 (copy), v40 (copy), v8 (copy), v11 (copy), l_Players_0 (copy), v28 (copy), v20 (copy), l_default_1 (copy), v27 (copy), v24 (copy), v26 (copy), v18 (copy), v22 (copy), v37 (copy), v42 (copy), v43 (copy)
    local v56 = v33.getSelfViewIsOpenAndVisible();
    local v57 = if v30 then l_StarterGui_0:GetCoreGuiEnabled(Enum.CoreGuiType.All) or l_StarterGui_0:GetCoreGuiEnabled(Enum.CoreGuiType.SelfView) else nil;
    v55:setState({
        adornee = nil, 
        isInsideRenderDistance = false, 
        isInsideMaximizeDistance = false, 
        savedChatSettings = v55.props.chatSettings, 
        voiceTimedOut = false, 
        voiceStateCounter = 0, 
        lastVoiceState = nil, 
        selfViewOpen = v56, 
        selfViewEnabled = v57, 
        isInsideEasierUnmutingDistance = not v38 and nil, 
        isMuted = (not v38 or not v40) and nil, 
        isInEasierUnmutingTreatment = not v38 and nil, 
        haveLoggedUserExposure = not v38 and nil
    });
    v55.isMounted = false;
    local v58, v59 = v8.createBinding((Vector3.new()));
    v55.offset = v58;
    v55.updateOffset = v59;
    v55.offsetMotor = v11.createSingleMotor(0);
    v55.offsetMotor:onStep(function(v60) --[[ Line: 159 ]]
        -- upvalues: v55 (copy)
        v55.updateOffset((Vector3.new(0, v60, 0)));
    end);
    v55.offsetGoal = 0;
    v55.onSelfViewVisibilityUpdated = function() --[[ Line: 164 ]]
        -- upvalues: v55 (copy), v33 (ref)
        v55:setState({
            selfViewOpen = v33.getSelfViewIsOpenAndVisible()
        });
    end;
    v55.onLastBubbleFadeOut = function() --[[ Line: 170 ]]
        -- upvalues: v55 (copy)
        if v55.props.onFadeOut and not v55.isFadingOut then
            v55.isFadingOut = true;
            v55.props.onFadeOut(v55.props.userId);
        end;
        if v55.state.hasMessage and v55.isMounted then
            v55:setState({
                hasMessage = false
            });
        end;
    end;
    if v55.props.voiceEnabled then
        v58 = nil;
        v58 = v55.props.userId == tostring(l_Players_0.LocalPlayer.UserId) and function() --[[ Line: 186 ]]
            -- upvalues: v28 (ref), v55 (copy), v20 (ref), l_default_1 (ref), v27 (ref)
            if v28() and v55.props.voiceState == v20.VOICE_STATE.ERROR then
                l_default_1:RejoinPreviousChannel();
                return;
            elseif v27() and v55.props.voiceState == v20.VOICE_STATE.CONNECTING then
                l_default_1:ShowVoiceChatLoadingMessage();
                return;
            else
                l_default_1:ToggleMic("LegacyBubbleChat");
                return;
            end;
        end or function() --[[ Line: 199 ]]
            -- upvalues: l_default_1 (ref), v55 (copy), v24 (ref)
            l_default_1:ToggleMutePlayer(tonumber(v55.props.userId), if v55:isShowingDueToEasierUnmuting() then v24.VOICE_CONTEXT_TYPE.EASIER_UNMUTING else v24.VOICE_CONTEXT_TYPE.BUBBLE_CHAT);
        end;
        v59 = v55.props.userId;
        local v61 = "MicDark";
        if v26() then
            v61 = v59 ~= tostring(l_Players_0.LocalPlayer.UserId) and "SpeakerDark" or "MicDark";
        end;
        local l_v59_0 = v59 --[[ copy: 4 -> 6 ]];
        do
            local l_v58_0, l_v61_0 = v58, v61;
            v55.renderInsert = function() --[[ Line: 217 ]]
                -- upvalues: v8 (ref), v18 (ref), l_v58_0 (ref), l_v59_0 (copy), l_v61_0 (ref)
                return v8.createElement(v18, {
                    onClicked = l_v58_0, 
                    userId = l_v59_0, 
                    iconStyle = l_v61_0
                });
            end;
            v55.insertSize = Vector2.new(28, 28);
        end;
    end;
    v55.onCoreGuiChanged = function() --[[ Line: 228 ]]
        -- upvalues: l_StarterGui_0 (ref), v55 (copy)
        local l_l_StarterGui_0_CoreGuiEnabled_0 = l_StarterGui_0:GetCoreGuiEnabled(Enum.CoreGuiType.SelfView);
        if v55.state.selfViewOpen ~= l_l_StarterGui_0_CoreGuiEnabled_0 then
            v55:setState({
                selfViewOpen = l_l_StarterGui_0_CoreGuiEnabled_0
            });
        end;
    end;
    v55.selfViewVisibilityUpdatedSignal = v22:connect(function() --[[ Line: 237 ]]
        -- upvalues: v55 (copy), v33 (ref)
        v55:setState({
            selfViewOpen = v33.getSelfViewIsOpenAndVisible()
        });
    end);
    if v38 then
        v58, v59 = pcall(function() --[[ Line: 244 ]]
            -- upvalues: v37 (ref), v42 (ref)
            return v37:GetLayerData(v42);
        end);
        if v58 and v59 and v59[v43] then
            v55:setState({
                isInEasierUnmutingTreatment = true
            });
        end;
    end;
    if v38 and v55.state.isInEasierUnmutingTreatment and v40 then
        v55.participantsUpdateConnection = l_default_1.participantsUpdate.Event:Connect(function(v66) --[[ Line: 261 ]]
            -- upvalues: v55 (copy)
            local v67 = v66[v55.props.userId];
            if not v67 then
                return;
            else
                if v67.isMuted ~= v55.state.isMuted then
                    v55:setState({
                        isMuted = v67.isMuted
                    });
                end;
                return;
            end;
        end);
    end;
end;
v46.isShowingDueToEasierUnmuting = function(v68) --[[ Line: 278 ]] --[[ Name: isShowingDueToEasierUnmuting ]]
    -- upvalues: v38 (copy), v20 (copy), v40 (copy)
    return v38 and v68.state.isInEasierUnmutingTreatment and v68.props.voiceState == v20.VOICE_STATE.LOCAL_MUTED and v68.state.isInsideEasierUnmutingDistance and not (v40 and v68.state.isMuted);
end;
v46.checkCounterForTimeout = function(v69, v70) --[[ Line: 286 ]] --[[ Name: checkCounterForTimeout ]]
    -- upvalues: l_Players_0 (copy), v20 (copy), v34 (copy)
    if v69.props.userId ~= tostring(l_Players_0.LocalPlayer.UserId) and v69.state.lastVoiceState ~= v20.VOICE_STATE.TALKING and v69.state.voiceStateCounter ~= v70 then
        local l_voiceStateCounter_0 = v69.state.voiceStateCounter;
        delay(v34 / 1000, function() --[[ Line: 295 ]]
            -- upvalues: v69 (copy), l_voiceStateCounter_0 (copy)
            if v69.state.voiceStateCounter == l_voiceStateCounter_0 and v69.isMounted then
                v69:setState({
                    voiceTimedOut = true
                });
            end;
        end);
    end;
end;
v46.checkCounterForTimeoutWithEasierUnmuting = function(v72, v73) --[[ Line: 306 ]] --[[ Name: checkCounterForTimeoutWithEasierUnmuting ]]
    -- upvalues: v38 (copy), l_Players_0 (copy), v20 (copy), v34 (copy)
    local v74 = if v73 then v73.voiceStateCounter else nil;
    if not v38 or not v72.state.isInEasierUnmutingTreatment then
        return v72:checkCounterForTimeout(v74);
    else
        local v75 = v72.props.userId ~= tostring(l_Players_0.LocalPlayer.UserId);
        local v76 = v72.state.voiceStateCounter ~= v74;
        local v77 = false;
        if v72.state.lastVoiceState ~= v20.VOICE_STATE.TALKING then
            v77 = v72.state.lastVoiceState ~= v20.VOICE_STATE.LOCAL_MUTED;
        end;
        if v75 and v76 and v77 then
            local l_voiceStateCounter_1 = v72.state.voiceStateCounter;
            delay(v34 / 1000, function() --[[ Line: 324 ]]
                -- upvalues: v72 (copy), l_voiceStateCounter_1 (copy)
                if v72.state.voiceStateCounter == l_voiceStateCounter_1 and v72.isMounted then
                    v72:setState({
                        voiceTimedOut = true
                    });
                end;
            end);
        end;
        return;
    end;
end;
v46.didMount = function(v79) --[[ Line: 337 ]] --[[ Name: didMount ]]
    -- upvalues: v11 (copy), v30 (copy), v45 (copy), l_Players_0 (copy), l_RunService_0 (copy), v38 (copy), v41 (copy), v20 (copy), v47 (copy)
    v79.isMounted = true;
    local v80 = v79.props.lastMessage and v79.props.lastMessage.adornee;
    v79:setState({
        adornee = v80
    });
    local v81 = v79:getVerticalOffset(v80);
    v79.offsetGoal = v81;
    v79.offsetMotor:setGoal(v11.instant(v81));
    if v30 then
        if v45() then
            v79:getMicPermission();
            v79:getCameraPermissionWithoutRequest();
        else
            v79:getPermissions();
        end;
    end;
    local v82 = nil;
    if v80 then
        v82 = l_Players_0:GetPlayerFromCharacter(v80);
    elseif tonumber(v79.props.userId) then
        v82 = l_Players_0:GetPlayerByUserId(v79.props.userId);
    end;
    if v82 then
        if v82.Character then
            coroutine.wrap(function() --[[ Line: 367 ]]
                -- upvalues: v79 (copy), v82 (ref)
                v79:onCharacterAdded(v82, v82.Character);
            end)();
        end;
        v79.characterConn = v82.CharacterAdded:Connect(function(v83) --[[ Line: 371 ]]
            -- upvalues: v79 (copy), v82 (ref)
            v79:onCharacterAdded(v82, v83);
        end);
    end;
    v79.heartbeatConn = l_RunService_0.Heartbeat:Connect(function() --[[ Line: 377 ]]
        -- upvalues: v79 (copy), v38 (ref), v41 (ref), v20 (ref), v11 (ref), v47 (ref)
        local v84 = v79:getAdorneeInstance(v79.state.adornee);
        if workspace.CurrentCamera and v84 then
            local v85 = v84:IsA("Attachment") and v84.WorldPosition or v84.Position;
            local l_Magnitude_0 = (workspace.CurrentCamera.CFrame.Position - v85).Magnitude;
            local v87 = l_Magnitude_0 < v79.state.savedChatSettings.MaxDistance;
            local v88 = l_Magnitude_0 < v79.state.savedChatSettings.MinimizeDistance;
            local v89 = false;
            if v38 and v79.state.isInEasierUnmutingTreatment then
                local v90 = getEasierUnmutingDistance(v85);
                if v90 ~= nil then
                    v89 = v90 < v41;
                end;
            end;
            if v88 ~= v79.state.isInsideMaximizeDistance or v87 ~= v79.state.isInsideRenderDistance or v38 and v79.state.isInEasierUnmutingTreatment and v89 ~= v79.state.isInsideEasierUnmutingDistance then
                v79:setState({
                    isInsideRenderDistance = v87, 
                    isInsideMaximizeDistance = v88, 
                    isInsideEasierUnmutingDistance = v89
                });
            end;
        end;
        local v91 = v79:getVerticalOffset(v79.state.adornee);
        if math.abs(v91 - v79.offsetGoal) > v20.BILLBOARD_OFFSET_EPSILON then
            v79.offsetGoal = v91;
            v79.offsetMotor:setGoal(v11.spring(v91, v47));
        end;
    end);
    if v38 and v79.state.isInEasierUnmutingTreatment then
        v79:checkCounterForTimeoutWithEasierUnmuting(nil);
    else
        v79:checkCounterForTimeout(nil);
    end;
end;
v46.willUnmount = function(v92) --[[ Line: 422 ]] --[[ Name: willUnmount ]]
    -- upvalues: v7 (copy), v38 (copy), v40 (copy)
    v7:trace("Unmounting billboards for {}", v92.state.shortId);
    v92.isMounted = false;
    if v92.characterConn then
        v92.characterConn:Disconnect();
        v92.characterConn = nil;
    end;
    if v92.heartbeatConn then
        v92.heartbeatConn:Disconnect();
        v92.heartbeatConn = nil;
    end;
    if v92.humanoidDiedConn then
        v92.humanoidDiedConn:Disconnect();
        v92.humanoidDiedConn = nil;
    end;
    v92.offsetMotor:destroy();
    if v92.selfViewVisibilityUpdatedSignal then
        v92.selfViewVisibilityUpdatedSignal:disconnect();
        v92.selfViewVisibilityUpdatedSignal = nil;
    end;
    if v38 and v92.state.isInEasierUnmutingTreatment and v40 and v92.participantsUpdateConnection then
        v92.participantsUpdateConnection:Disconnect();
        v92.participantsUpdateConnection = nil;
    end;
end;
local function v98(...) --[[ Line: 450 ]] --[[ Name: waitForFirst ]]
    local l_BindableEvent_0 = Instance.new("BindableEvent");
    local v94 = {
        ...
    };
    local function v96(...) --[[ Line: 454 ]] --[[ Name: fire ]]
        -- upvalues: v94 (copy), l_BindableEvent_0 (copy)
        for v95 = 1, #v94 do
            v94[v95]:Disconnect();
        end;
        return l_BindableEvent_0:Fire(...);
    end;
    for v97 = 1, #v94 do
        v94[v97] = v94[v97]:Connect(v96);
    end;
    return l_BindableEvent_0.Event:Wait();
end;
local function v104(v99, v100, v101) --[[ Line: 469 ]] --[[ Name: findFirstChildByNameAndClass ]]
    for _, v103 in ipairs(v99:GetChildren()) do
        if v103.Name == v100 and v103:IsA(v101) then
            return v103;
        end;
    end;
end;
v46.onCharacterAdded = function(v105, v106, v107) --[[ Line: 478 ]] --[[ Name: onCharacterAdded ]]
    -- upvalues: v98 (copy), v7 (copy), v29 (copy), v104 (copy)
    if not v107.Parent then
        v98(v107.AncestryChanged, v106.CharacterAdded);
    end;
    if v106.Character ~= v107 or not v107.Parent then
        v7:debug("Mismatched or unparented character in onCharacterAdded for {}", v105.state.shortId);
        return;
    else
        local l_Humanoid_0 = v107:FindFirstChildOfClass("Humanoid");
        while v107:IsDescendantOf(game) and not l_Humanoid_0 do
            v98(v107.ChildAdded, v107.AncestryChanged, v106.CharacterAdded);
            l_Humanoid_0 = v107:FindFirstChildOfClass("Humanoid");
        end;
        if v106.Character ~= v107 or not v107:IsDescendantOf(game) then
            v7:debug("Mismatched or unparented character in onCharacterAdded for {}", v105.state.shortId);
            return;
        else
            local v109 = nil;
            v109 = if v29() then v107.PrimaryPart else v107:FindFirstChild("HumanoidRootPart");
            while v107:IsDescendantOf(game) and not v109 do
                v98(v107.ChildAdded, v107.AncestryChanged, v106.CharacterAdded);
                if v29() then
                    v109 = v107.PrimaryPart;
                else
                    v109 = v107:FindFirstChild("HumanoidRootPart");
                end;
            end;
            if v109 and v107:IsDescendantOf(game) and v106.Character == v107 and v105.isMounted then
                local v110 = v104(v107, "Head", "BasePart");
                v105:setState({
                    adornee = l_Humanoid_0.Health == 0 and v110 or v107
                });
                if v105.humanoidDiedConn then
                    v105.humanoidDiedConn:Disconnect();
                    v105.humanoidDiedConn = nil;
                end;
                v105.humanoidDiedConn = l_Humanoid_0.Died:Connect(function() --[[ Line: 528 ]]
                    -- upvalues: v105 (copy), v104 (ref), v107 (copy)
                    v105:setState({
                        adornee = v104(v107, "Head", "BasePart") or v107
                    });
                end);
            end;
            return;
        end;
    end;
end;
v46.getVerticalOffset = function(v111, v112) --[[ Line: 538 ]] --[[ Name: getVerticalOffset ]]
    if v112 and v112:IsA("Model") then
        local l_v112_BoundingBox_0, v114 = v112:GetBoundingBox();
        local v115 = v111:getAdorneeInstance(v112);
        if not v115 then
            return v114.Y / 2;
        elseif v115:IsA("BasePart") then
            local v116 = l_v112_BoundingBox_0:PointToObjectSpace(v115.Position);
            return v114.Y / 2 - v116.Y;
        else
            return 0;
        end;
    elseif v112 and v112:IsA("BasePart") then
        return v112.Size.Y / 2;
    else
        return 0;
    end;
end;
v46.getAdorneeInstance = function(v117, v118) --[[ Line: 560 ]] --[[ Name: getAdorneeInstance ]]
    -- upvalues: v29 (copy)
    if not v118 then
        return;
    else
        if v118:IsA("Model") then
            local l_v118_FirstChild_0 = v118:FindFirstChild(v117.state.savedChatSettings.AdorneeName, true);
            if v29() then
                l_v118_FirstChild_0 = l_v118_FirstChild_0 or v118.PrimaryPart;
            end;
            if not l_v118_FirstChild_0 or l_v118_FirstChild_0:IsA("BasePart") or l_v118_FirstChild_0:IsA("Attachment") then
                return l_v118_FirstChild_0;
            end;
        elseif v118:IsA("BasePart") or v118:IsA("Attachment") then
            return v118;
        end;
        return;
    end;
end;
v46.getPermissions = function(v120) --[[ Line: 579 ]] --[[ Name: getPermissions ]]
    -- upvalues: v13 (copy)
    return v13(function(v121) --[[ Line: 580 ]]
        -- upvalues: v120 (copy)
        v120:setState({
            hasCameraPermissions = v121.hasCameraPermissions, 
            hasMicPermissions = v121.hasMicPermissions
        });
    end, nil, nil, "BubbleChatBillboard.getPermissions");
end;
v46.getMicPermission = function(v122) --[[ Line: 592 ]] --[[ Name: getMicPermission ]]
    -- upvalues: v13 (copy), l_default_0 (copy)
    v13(function(v123) --[[ Line: 593 ]]
        -- upvalues: v122 (copy)
        v122:setState({
            hasMicPermissions = v123.hasMicPermissions
        });
    end, {
        l_default_0.Permissions.MICROPHONE_ACCESS
    }, nil, "BubbleChatBillboard.getMicPermission");
end;
v46.getCameraPermissionWithoutRequest = function(v124) --[[ Line: 604 ]] --[[ Name: getCameraPermissionWithoutRequest ]]
    -- upvalues: v13 (copy), l_default_0 (copy)
    v13(function(v125) --[[ Line: 605 ]]
        -- upvalues: v124 (copy)
        v124:setState({
            hasCameraPermissions = v125.hasCameraPermissions
        });
    end, {
        l_default_0.Permissions.CAMERA_ACCESS
    }, true);
end;
v46.setCameraPermissionStateFromControl = function(v126, v127) --[[ Line: 613 ]] --[[ Name: setCameraPermissionStateFromControl ]]
    v126:setState({
        hasCameraPermissions = v127
    });
end;
v46.getRenderVoiceAndCameraBubble = function(v128) --[[ Line: 619 ]] --[[ Name: getRenderVoiceAndCameraBubble ]]
    -- upvalues: v35 (copy), v30 (copy), l_Players_0 (copy), v36 (copy), l_VRService_0 (copy), v23 (copy), v32 (copy)
    if not v128.props.voiceEnabled and not v35 and not v30 then
        return false;
    elseif v128.props.userId == tostring(l_Players_0.LocalPlayer.UserId) then
        if v36 and l_VRService_0.VREnabled or v23() then
            return false;
        elseif not v128.state.selfViewOpen then
            return true;
        else
            return false;
        end;
    else
        local v129 = v128.props.voiceEnabled and not v128.state.voiceTimedOut;
        if v32() then
            return v129;
        elseif v129 and (not v128.props.bubbleChatEnabled or not v128.props.messageIds or #v128.props.messageIds == 0) then
            return true;
        else
            return false;
        end;
    end;
end;
v46.shouldRenderCarat = function(v130) --[[ Line: 661 ]] --[[ Name: shouldRenderCarat ]]
    return v130.props.chatSettings.TailVisible and not v130:getRenderVoiceAndCameraBubble();
end;
v46.render = function(v131) --[[ Line: 665 ]] --[[ Name: render ]]
    -- upvalues: l_Players_0 (copy), v7 (copy), v38 (copy), v20 (copy), v40 (copy), v30 (copy), v36 (copy), l_VRService_0 (copy), v23 (copy), v45 (copy), v31 (copy), v8 (copy), v48 (ref), v17 (copy), v16 (copy), v14 (copy), v15 (copy)
    local v132 = v131:getAdorneeInstance(v131.state.adornee);
    local v133 = v131.props.userId == tostring(l_Players_0.LocalPlayer.UserId);
    local l_savedChatSettings_0 = v131.state.savedChatSettings;
    if not v132 then
        v7:trace("No adornee for {}", v131.state.shortId);
        return;
    elseif not v131.state.isInsideRenderDistance then
        v7:trace("Not in range for {}", v131.state.shortId);
        return;
    elseif v38 and v131.state.isInEasierUnmutingTreatment and v131.props.voiceState == v20.VOICE_STATE.LOCAL_MUTED and (not v131.state.isInsideEasierUnmutingDistance or v40 and v131.state.isMuted) then
        v7:trace("Unmute toggle not applicable for {}", v131.state.shortId);
        return;
    else
        local v135 = {};
        local v136 = nil;
        local v137 = v131.props.voiceEnabled and not v131.state.voiceTimedOut;
        if v30 and v133 then
            v137 = v137 and not v131.state.selfViewOpen;
        end;
        if (v36 and l_VRService_0.VREnabled or v23()) and v133 then
            v137 = false;
        end;
        if v30 then
            if v131:getRenderVoiceAndCameraBubble() then
                local v139 = {
                    chatSettings = l_savedChatSettings_0, 
                    isInsideMaximizeDistance = v131.state.isInsideMaximizeDistance, 
                    LayoutOrder = 2, 
                    isLocalPlayer = v133, 
                    hasCameraPermissions = v131.state.hasCameraPermissions, 
                    hasMicPermissions = v131.state.hasMicPermissions, 
                    userId = v131.props.userId, 
                    voiceEnabled = v131.props.voiceEnabled, 
                    setCameraPermissionStateFromControl = function(v138) --[[ Line: 721 ]] --[[ Name: setCameraPermissionStateFromControl ]]
                        -- upvalues: v45 (ref), v131 (copy)
                        if v45() then
                            v131:setCameraPermissionStateFromControl(v138);
                        end;
                    end, 
                    isShowingDueToEasierUnmuting = v131:isShowingDueToEasierUnmuting()
                };
                v135.VoiceAndCameraBubble = v31 and v8.createElement(v48, v139) or v8.createElement(v17, v139);
                v135.listLayout = v8.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    VerticalAlignment = Enum.VerticalAlignment.Bottom, 
                    Padding = UDim.new(0, 8)
                });
                v135.padding = v8.createElement("UIPadding", {
                    PaddingBottom = UDim.new(0, 8)
                });
            end;
        elseif v137 and (not v131.props.bubbleChatEnabled or not v131.props.messageIds or #v131.props.messageIds == 0) then
            v135.VoiceBubble = v8.createElement(v16, {
                chatSettings = l_savedChatSettings_0, 
                renderInsert = v131.renderInsert, 
                insertSize = v131.insertSize, 
                isDistant = not v131.state.isInsideMaximizeDistance
            });
        end;
        if v131.state.hasMessage then
            if v131.state.isInsideMaximizeDistance then
                v135.BubbleChatList = v8.createElement(v14, {
                    userId = v131.props.userId, 
                    isVisible = v131.state.isInsideMaximizeDistance, 
                    onLastBubbleFadeOut = v131.onLastBubbleFadeOut, 
                    chatSettings = l_savedChatSettings_0, 
                    renderFirstInsert = if not v30 and v137 then v131.renderInsert else nil, 
                    insertSize = v131.insertSize, 
                    showCarat = v131:shouldRenderCarat()
                });
            else
                v135.DistantBubble = v8.createElement(v15, {
                    fadingOut = not v131.props.messageIds or #v131.props.messageIds == 0, 
                    onFadeOut = v131.onLastBubbleFadeOut, 
                    chatSettings = l_savedChatSettings_0, 
                    renderInsert = v137 and v131.renderInsert, 
                    insertSize = v131.insertSize
                });
            end;
        end;
        v136 = v137;
        if v30 then
            v136 = v131:getRenderVoiceAndCameraBubble();
        end;
        local v140 = v133 and l_savedChatSettings_0.LocalPlayerStudsOffset or Vector3.new(0, 1, 0.10000000149011612, 0);
        return v8.createElement("BillboardGui", {
            Adornee = v132, 
            Active = v136, 
            Size = UDim2.fromOffset(500, 200), 
            SizeOffset = Vector2.new(0, 0.5), 
            StudsOffset = v140 + Vector3.new(0, l_savedChatSettings_0.VerticalStudsOffset, 0), 
            StudsOffsetWorldSpace = v131.offset, 
            ResetOnSpawn = false
        }, v135);
    end;
end;
v46.didUpdate = function(v141, _, v143) --[[ Line: 805 ]] --[[ Name: didUpdate ]]
    -- upvalues: v38 (copy), l_Players_0 (copy), v20 (copy), v37 (copy), v42 (copy)
    if (not v141.props.messageIds or #v141.props.messageIds == 0) and not v141.state.isInsideRenderDistance then
        v141.onLastBubbleFadeOut();
    end;
    if v141.props.messageIds and #v141.props.messageIds > 0 then
        v141.isFadingOut = false;
    end;
    if v38 and v141.state.isInEasierUnmutingTreatment then
        v141:checkCounterForTimeoutWithEasierUnmuting(v143);
    else
        v141:checkCounterForTimeout(v143.voiceStateCounter);
    end;
    local v144 = v141.props.userId == tostring(l_Players_0.LocalPlayer.UserId);
    if v38 and v144 and not v141.state.haveLoggedUserExposure and (v141.props.voiceState == v20.VOICE_STATE.INACTIVE or v141.props.voiceState == v20.VOICE_STATE.TALKING or v141.props.voiceState == v20.VOICE_STATE.MUTED) then
        v37:LogUserLayerExposure(v42);
        v141:setState({
            haveLoggedUserExposure = true
        });
    end;
end;
v46.getDerivedStateFromProps = function(v145, v146) --[[ Line: 842 ]] --[[ Name: getDerivedStateFromProps ]]
    local v147 = "..." .. string.sub(tostring(v145.userId), -4);
    local v148 = not v146.hasMessage and v145.messageIds and #v145.messageIds > 0;
    local v149 = nil;
    local v150 = nil;
    local v151 = nil;
    if v146.lastVoiceState ~= v145.voiceState then
        v150 = (v146.voiceStateCounter or 0) + 1;
        v151 = false;
        v149 = v145.voiceState;
    end;
    return {
        hasMessage = v148 or nil, 
        savedChatSettings = v145.lastMessage and v145.chatSettings, 
        shortId = v147, 
        voiceStateCounter = v150, 
        voiceTimedOut = v151, 
        lastVoiceState = v149
    };
end;
return v9.connect(function(v152, v153) --[[ Line: 872 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: v21 (copy)
    local v154 = v152.userMessages[v153.userId];
    local v155 = v154 and #v154 >= 1 and v154[#v154];
    local v156 = v155 and v152.messages[v155];
    local v157 = v152.voiceState[v153.userId];
    return {
        chatSettings = v21(v152.chatSettings, v156), 
        messageIds = v154, 
        lastMessage = v156, 
        voiceState = v157
    };
end)(v46);