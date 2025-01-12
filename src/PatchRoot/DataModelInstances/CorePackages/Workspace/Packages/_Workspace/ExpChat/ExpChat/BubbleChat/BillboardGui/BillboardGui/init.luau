local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.ExpChatShared);
local v3 = require(l_Parent_0.Roact);
local v4 = require(l_Parent_0.RoactRodux);
local l_List_0 = require(l_Parent_0.llama).List;
local v6 = require(l_Parent_0.Otter);
local v7 = require(l_Parent_0.SharedFlags);
local l_Players_0 = game:GetService("Players");
local l_RunService_0 = game:GetService("RunService");
local l_StarterGui_0 = game:GetService("StarterGui");
local l_VRService_0 = game:GetService("VRService");
local v12 = v2.Logger:new("ExpChat/" .. script.Name);
local v13 = require(l_script_FirstAncestor_0.memoize);
local l_script_FirstAncestor_1 = script:FindFirstAncestor("BubbleChat");
local v15 = require(l_script_FirstAncestor_1.VoiceIndicator);
local v16 = require(l_script_FirstAncestor_1.BlankBubble);
local v17 = require(l_script_FirstAncestor_1.BubbleChatList);
local v18 = require(l_script_FirstAncestor_1.ChatBubbleDistant);
local v19 = require(l_script_FirstAncestor_1.LikelySpeakingBubble);
local v20 = require(l_script_FirstAncestor_0.GlobalFlags);
local l_Helpers_0 = l_script_FirstAncestor_1.Helpers;
local v22 = require(l_Helpers_0.getSettingsForMessage);
local v23 = game:DefineFastFlag("SelfViewNoApi", false);
local v24 = require(l_script_FirstAncestor_1.PlayerButtons);
local v25 = require(l_script_FirstAncestor_0.IXPServiceWrapper);
local v26 = game:DefineFastFlag("EasierUnmutingTCS5", false);
local v27 = game:DefineFastFlag("EasierUnmutingBasedOnCameraTCS", false);
local v28 = game:DefineFastFlag("EasierUnmutingHideIfMutedTCS", false);
local v29 = game:DefineFastInt("EasierUnmutingDisplayDistanceTCS", 20);
local v30 = game:DefineFastInt("LikelySpeakingBubbleDisplayDistance", 50);
local v31 = game:DefineFastString("EasierUnmutingIXPLayerNameTCS", "Voice.UserAgency");
local v32 = game:DefineFastString("EasierUnmutingIXPLayerValueTCS", "VoiceUserAgencyEnabled");
local v33 = game:DefineFastFlag("FixTimestampNowComparisonForChatMessages", false);
local v34 = require(l_script_FirstAncestor_0.Flags.getFFlagEnableExperienceChatOptimizations);
local v35 = game:DefineFastInt("ExperienceChatHeartbeatIncrement", 5);
local v36 = require(l_script_FirstAncestor_0.Flags.GetFFlagShowSpeakerIconWithChatBubblesTCS);
local v37 = require(l_script_FirstAncestor_0.Flags.getFFlagEnableBillboardUpdateFrequency);
local v38 = require(l_script_FirstAncestor_0.Flags.GetFFlagVoiceIconInChatBubbleFix);
local l_GetFFlagEnableShowVoiceUI_0 = v7.GetFFlagEnableShowVoiceUI;
local v40 = Vector2.new(28, 28);
local v41 = v3.PureComponent:extend("BubbleChatBillboard");
local v42 = {
    dampingRatio = 1, 
    frequency = 4
};
getEasierUnmutingDistance = function(v43, v44) --[[ Line: 68 ]] --[[ Name: getEasierUnmutingDistance ]]
    -- upvalues: v27 (copy)
    local v45 = workspace.CurrentCamera and workspace.CurrentCamera.CFrame.Position;
    if (v27 or not v44) and v43 and v45 then
        return (v43 - v45).Magnitude;
    elseif v43 and v44 then
        return (v43 - v44).Magnitude;
    else
        return nil;
    end;
end;
v41.isShowingDueToEasierUnmuting = function(v46) --[[ Line: 82 ]] --[[ Name: isShowingDueToEasierUnmuting ]]
    -- upvalues: v26 (copy), v28 (copy)
    return v26 and v46.state.isInEasierUnmutingTreatment and v46.props.voiceState == "LOCAL_MUTED" and v46.state.isInsideEasierUnmutingDistance and not (v28 and v46.props.isMuted);
end;
v41.init = function(v47) --[[ Line: 90 ]] --[[ Name: init ]]
    -- upvalues: v20 (copy), v23 (copy), l_StarterGui_0 (copy), v26 (copy), v3 (copy), v6 (copy), v34 (copy), v37 (copy), l_Players_0 (copy), v15 (copy), v25 (copy), v31 (copy), v32 (copy)
    local v48 = nil;
    local v49 = nil;
    if v20.AvatarChatEnabled then
        v48 = v47.props.selfViewListenerChanged.getSelfViewVisibility();
        v49 = v23 or l_StarterGui_0:GetCoreGuiEnabled(Enum.CoreGuiType.All) or l_StarterGui_0:GetCoreGuiEnabled(Enum.CoreGuiType.SelfView);
    end;
    v47:setState({
        isInsideRenderDistance = false, 
        isInsideMaximizeDistance = false, 
        isInsideEasierUnmutingDistance = not v26 and nil, 
        savedChatSettings = v47.props.chatSettings, 
        selfViewOpen = v48, 
        selfViewEnabled = v49, 
        voiceTimedOut = false, 
        voiceStateCounter = 0, 
        lastVoiceState = nil, 
        isInEasierUnmutingTreatment = not v26 and nil, 
        haveLoggedUserExposure = not v26 and nil
    });
    v47.isMounted = false;
    local v50, v51 = v3.createBinding((Vector3.new()));
    v47.offset = v50;
    v47.updateOffset = v51;
    v47.offsetMotor = v6.createSingleMotor(0);
    v47.offsetMotor:onStep(function(v52) --[[ Line: 118 ]]
        -- upvalues: v47 (copy)
        v47.updateOffset((Vector3.new(0, v52, 0)));
    end);
    v47.offsetGoal = 0;
    if v34() then
        v47.heartbeatCount = 0;
    end;
    if v37() then
        v47.lastDistanceUpdate = 0;
    end;
    v47.onLastBubbleFadeOut = function() --[[ Line: 131 ]]
        -- upvalues: v47 (copy)
        if v47.props.onFadeOut and not v47.isFadingOut then
            v47.isFadingOut = true;
            v47.props.onFadeOut(v47.props.userId);
        end;
    end;
    v47.wrappedOnClickVoiceIndicator = function(v53, v54) --[[ Line: 139 ]]
        -- upvalues: v47 (copy)
        local v55 = v47:isShowingDueToEasierUnmuting() and "easierunmuting" or "bubblechat";
        return v47.props.onClickedVoiceIndicator(v53, v54, v55);
    end;
    v50 = l_Players_0.LocalPlayer;
    v51 = if v50 then v47.props.userId ~= tostring(v50.UserId) and "SpeakerDark" or "MicDark" else "SpeakerDark";
    v47.renderInsert = function() --[[ Line: 149 ]]
        -- upvalues: v3 (ref), v15 (ref), v47 (copy), v51 (copy)
        return v3.createElement(v15, {
            userId = v47.props.userId, 
            getIcon = v47.props.getIconVoiceIndicator, 
            onClicked = v47.wrappedOnClickVoiceIndicator, 
            iconStyle = v51
        });
    end;
    if v20.AvatarChatEnabled then
        local l_selfViewVisibilityUpdatedSignal_0 = v47.props.selfViewListenerChanged.selfViewVisibilityUpdatedSignal;
        local l_getSelfViewVisibility_0 = v47.props.selfViewListenerChanged.getSelfViewVisibility;
        local l_l_getSelfViewVisibility_0_0 = l_getSelfViewVisibility_0 --[[ copy: 6 -> 7 ]];
        v47.selfViewConnection = l_selfViewVisibilityUpdatedSignal_0:connect(function() --[[ Line: 162 ]] --[[ Name: callback ]]
            -- upvalues: v47 (copy), l_l_getSelfViewVisibility_0_0 (copy)
            v47:setState({
                selfViewOpen = l_l_getSelfViewVisibility_0_0()
            });
        end);
    end;
    if v26 then
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 171 ]]
            -- upvalues: v25 (ref), v31 (ref)
            return v25:GetLayerData(v31);
        end);
        if l_status_0 and l_result_0 and l_result_0[v32] then
            v47:setState({
                isInEasierUnmutingTreatment = true
            });
        end;
    end;
end;
v41.checkCounterForTimeout = function(v61, v62) --[[ Line: 183 ]] --[[ Name: checkCounterForTimeout ]]
    -- upvalues: l_Players_0 (copy)
    if l_Players_0.LocalPlayer and v61.props.userId ~= tostring(l_Players_0.LocalPlayer.UserId) and v61.state.lastVoiceState ~= "Talking" and v61.state.voiceStateCounter ~= v62 then
        local l_voiceStateCounter_0 = v61.state.voiceStateCounter;
        delay(1, function() --[[ Line: 193 ]]
            -- upvalues: v61 (copy), l_voiceStateCounter_0 (copy)
            if v61.state.voiceStateCounter == l_voiceStateCounter_0 and v61.isMounted then
                v61:setState({
                    voiceTimedOut = true
                });
            end;
        end);
    end;
end;
v41.checkCounterForTimeoutWithEasierUnmuting = function(v64, v65) --[[ Line: 204 ]] --[[ Name: checkCounterForTimeoutWithEasierUnmuting ]]
    -- upvalues: v26 (copy), l_Players_0 (copy)
    local v66 = if v65 then v65.voiceStateCounter else nil;
    if not v26 or not v64.state.isInEasierUnmutingTreatment then
        return v64:checkCounterForTimeout(v66);
    else
        local v67 = if l_Players_0.LocalPlayer then v64.props.userId ~= tostring(l_Players_0.LocalPlayer.UserId) else false;
        local v68 = v64.state.voiceStateCounter ~= v66;
        local v69 = false;
        if v64.state.lastVoiceState ~= "Talking" then
            v69 = v64.state.lastVoiceState ~= "LOCAL_MUTED";
        end;
        if v67 and v68 and v69 then
            local l_voiceStateCounter_1 = v64.state.voiceStateCounter;
            delay(1, function() --[[ Line: 223 ]]
                -- upvalues: v64 (copy), l_voiceStateCounter_1 (copy)
                if v64.state.voiceStateCounter == l_voiceStateCounter_1 and v64.isMounted then
                    v64:setState({
                        voiceTimedOut = true
                    });
                end;
            end);
        end;
        return;
    end;
end;
v41.getVerticalOffset = function(v71) --[[ Line: 238 ]] --[[ Name: getVerticalOffset ]]
    local l_adornee_0 = v71.props.adornee;
    if l_adornee_0 and l_adornee_0:IsA("Model") then
        local l_l_adornee_0_BoundingBox_0, v74 = l_adornee_0:GetBoundingBox();
        local v75 = getAdorneeInstance(v71.props.adornee, v71.state.savedChatSettings.AdorneeName);
        if not v75 then
            return v74.Y / 2;
        elseif v75:IsA("BasePart") then
            local v76 = l_l_adornee_0_BoundingBox_0:PointToObjectSpace(v75.Position);
            return v74.Y / 2 - v76.Y;
        else
            return 0;
        end;
    elseif l_adornee_0 and l_adornee_0:IsA("BasePart") then
        return l_adornee_0.Size.Y / 2;
    else
        return 0;
    end;
end;
getAdorneeInstance = function(v77, v78) --[[ Line: 261 ]] --[[ Name: getAdorneeInstance ]]
    if not v77 then
        return nil;
    else
        if v77:IsA("Model") then
            local v79 = v77:FindFirstChild(v78, true) or v77.PrimaryPart;
            if not v79 or v79:IsA("BasePart") or v79:IsA("Attachment") then
                return v79;
            end;
        elseif v77:IsA("BasePart") or v77:IsA("Attachment") then
            return v77;
        end;
        return nil;
    end;
end;
v41.shouldRenderCaret = function(v80) --[[ Line: 277 ]] --[[ Name: shouldRenderCaret ]]
    -- upvalues: v20 (copy)
    local l_savedChatSettings_0 = v80.state.savedChatSettings;
    local v82 = not v20.ShowLikelySpeakingBubbles or not v80:shouldRenderLikelySpeakingBubble();
    return l_savedChatSettings_0.TailVisible and not v80:shouldRenderPlayerButtons() and v82;
end;
v41.shouldRenderPlayerButtons = function(v83) --[[ Line: 285 ]] --[[ Name: shouldRenderPlayerButtons ]]
    -- upvalues: l_GetFFlagEnableShowVoiceUI_0 (copy), l_Players_0 (copy), l_VRService_0 (copy), v20 (copy), v36 (copy)
    if l_GetFFlagEnableShowVoiceUI_0() then
        if not v83.props.voiceEnabled or not v83.props.isVoiceUIVisible then
            return false;
        end;
    elseif not v83.props.voiceEnabled then
        return false;
    end;
    if if l_Players_0.LocalPlayer then v83.props.userId == tostring(l_Players_0.LocalPlayer.UserId) else false then
        if l_VRService_0.VREnabled or v20.ChromeEnabled then
            return false;
        elseif not v83.state.selfViewOpen then
            return true;
        else
            return false;
        end;
    else
        local v84 = not v83.state.filteredMessages or #v83.state.filteredMessages == 0;
        local v85 = v83.props.voiceEnabled and not v83.state.voiceTimedOut;
        if v36() then
            return v85;
        elseif v85 and (not v83.props.isBubbleChatEnabled or v84) then
            return true;
        else
            return false;
        end;
    end;
end;
v41.shouldRenderLikelySpeakingBubble = function(v86) --[[ Line: 329 ]] --[[ Name: shouldRenderLikelySpeakingBubble ]]
    -- upvalues: l_Players_0 (copy)
    return not (if l_Players_0.LocalPlayer then v86.props.userId == tostring(l_Players_0.LocalPlayer.UserId) else false) and v86.props.isEligibleForLikelySpeakingBubbles and v86.props.isLikelySpeakingUser;
end;
v41.render = function(v87) --[[ Line: 337 ]] --[[ Name: render ]]
    -- upvalues: l_Players_0 (copy), v12 (copy), v26 (copy), v28 (copy), v20 (copy), v38 (copy), v40 (copy), v3 (copy), v24 (copy), v19 (copy), v16 (copy), v17 (copy), v18 (copy)
    local v88 = getAdorneeInstance(v87.props.adornee, v87.state.savedChatSettings.AdorneeName);
    local v89 = if l_Players_0.LocalPlayer then v87.props.userId == tostring(l_Players_0.LocalPlayer.UserId) else false;
    local l_savedChatSettings_1 = v87.state.savedChatSettings;
    if not v88 then
        v12:trace("No adornee for {}", v87.state.shortId);
        return;
    elseif not v87.state.isInsideRenderDistance then
        return;
    elseif v26 and v87.state.isInEasierUnmutingTreatment and v87.props.voiceState == "LOCAL_MUTED" and (not v87.state.isInsideEasierUnmutingDistance or v28 and v87.props.isMuted) then
        v12:trace("Unmute toggle not applicable for {}", v87.state.shortId);
        return;
    else
        local v91 = {};
        local v92 = v87.state.filteredMessages and #v87.state.filteredMessages > 0;
        local v93 = v87.props.voiceEnabled and not v87.state.voiceTimedOut;
        if v20.AvatarChatEnabled and v89 then
            v93 = v93 and not v87.state.selfViewOpen;
        end;
        if v20.ChromeEnabled and v89 then
            v93 = false;
        end;
        local v94 = v93 and not v20.AvatarChatEnabled;
        if v38() then
            v94 = v93 and not v20.AvatarChatEnabled and not v20.ChromeEnabled;
        end;
        local v95 = if v93 then v87.renderInsert else nil;
        local l_v40_0 = v40;
        local l_clientSettings_0 = v87.props.clientSettings;
        if v20.AvatarChatEnabled or v20.ChromeEnabled then
            if v87:shouldRenderPlayerButtons() then
                local v98 = {
                    chatSettings = v87.props.chatSettings, 
                    isInsideMaximizeDistance = v87.state.isInsideMaximizeDistance, 
                    LayoutOrder = 2, 
                    isLocalPlayer = v89, 
                    userId = v87.props.userId, 
                    getIcon = v87.props.getIconVoiceIndicator, 
                    hasCameraPermissions = v87.props.hasCameraPermissions, 
                    hasMicPermissions = v87.props.hasMicPermissions, 
                    onClickedVoiceIndicator = v87.wrappedOnClickVoiceIndicator, 
                    onClickedCameraIndicator = v87.props.onClickedCameraIndicator, 
                    voiceEnabled = v87.props.voiceEnabled, 
                    displayCameraDeniedToast = v87.props.displayCameraDeniedToast, 
                    isCamEnabledForUserAndPlace = v87.props.isCamEnabledForUserAndPlace, 
                    setCameraPermissionStateFromControl = v87.props.setCameraPermissionStateFromControl, 
                    getPermissions = v87.props.getPermissions, 
                    isCameraOnlyUser = v87.props.isCameraOnlyUser, 
                    isVoiceServiceInitialized = v87.props.isVoiceServiceInitialized
                };
                v91.PlayerButtons = v3.createElement(v24, v98);
                v91.listLayout = v3.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    VerticalAlignment = Enum.VerticalAlignment.Bottom, 
                    Padding = UDim.new(0, 8)
                });
                v91.padding = v3.createElement("UIPadding", {
                    PaddingBottom = UDim.new(0, 8)
                });
            elseif v20.ShowLikelySpeakingBubbles and v87:shouldRenderLikelySpeakingBubble() and v87.state.isInsideLikelySpeakingDistance then
                local v99 = {
                    chatSettings = v87.props.chatSettings, 
                    isInsideMaximizeDistance = v87.state.isInsideMaximizeDistance, 
                    LayoutOrder = 2, 
                    onActivated = v87.props.onClickedLikelySpeakingBubble
                };
                v91.LikelySpeakingBubble = v3.createElement(v19, v99);
                v91.listLayout = v3.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    VerticalAlignment = Enum.VerticalAlignment.Bottom, 
                    Padding = UDim.new(0, 8)
                });
                v91.padding = v3.createElement("UIPadding", {
                    PaddingBottom = UDim.new(0, 8)
                });
            end;
        elseif v93 and v92 == false then
            v91.VoiceBubble = v3.createElement(v16, {
                chatSettings = l_savedChatSettings_1, 
                userId = v87.props.userId, 
                renderInsert = v95, 
                insertSize = l_v40_0, 
                isDistant = not v87.state.isInsideMaximizeDistance, 
                clientSettings = l_clientSettings_0
            });
        end;
        local v100 = v87:shouldRenderCaret();
        if v87.state.isInsideMaximizeDistance then
            v91.BubbleChatList = v3.createElement(v17, {
                userId = v87.props.userId, 
                isVisible = v87.state.isInsideMaximizeDistance, 
                onLastBubbleFadeOut = v87.onLastBubbleFadeOut, 
                chatSettings = l_savedChatSettings_1, 
                renderFirstInsert = if v94 then v95 else nil, 
                insertSize = l_v40_0, 
                messages = v87.state.filteredMessages, 
                clientSettings = l_clientSettings_0, 
                isTextChatServiceOn = v87.props.isTextChatServiceOn, 
                showCaret = v100
            });
        elseif v92 then
            v91.DistantBubble = v3.createElement(v18, {
                fadingOut = not v87.state.filteredMessages or #v87.state.filteredMessages == 0, 
                onFadeOut = v87.onLastBubbleFadeOut, 
                chatSettings = l_savedChatSettings_1, 
                renderInsert = if v94 then v95 else nil, 
                insertSize = l_v40_0, 
                clientSettings = l_clientSettings_0, 
                showCaret = v100
            });
        end;
        local v101 = v89 and l_savedChatSettings_1.LocalPlayerStudsOffset or Vector3.new(0, 1, 0.10000000149011612, 0);
        local v102 = v20.ShowLikelySpeakingBubbles and v87:shouldRenderLikelySpeakingBubble();
        return v3.createElement("BillboardGui", {
            Adornee = v88, 
            Active = if v20.AvatarChatEnabled then v87:shouldRenderPlayerButtons() or v102 else v93 or v102, 
            Size = UDim2.fromOffset(500, 200), 
            SizeOffset = Vector2.new(0, 0.5), 
            StudsOffset = v101 + Vector3.new(0, l_savedChatSettings_1.VerticalStudsOffset, 0), 
            StudsOffsetWorldSpace = v87.offset, 
            ResetOnSpawn = false
        }, v91);
    end;
end;
v41.didUpdate = function(v103, _, v105) --[[ Line: 512 ]] --[[ Name: didUpdate ]]
    -- upvalues: v26 (copy), l_Players_0 (copy), v25 (copy), v31 (copy)
    if (not v103.state.filteredMessages or #v103.state.filteredMessages == 0) and not v103.state.isInsideRenderDistance then
        v103.onLastBubbleFadeOut();
    end;
    if v103.state.filteredMessages and #v103.state.filteredMessages > 0 then
        v103.isFadingOut = false;
    end;
    if v26 and v103.state.isInEasierUnmutingTreatment then
        v103:checkCounterForTimeoutWithEasierUnmuting(v105);
    else
        v103:checkCounterForTimeout(v105.voiceStateCounter);
    end;
    local v106 = v103.props.userId == tostring(if l_Players_0.LocalPlayer then l_Players_0.LocalPlayer.UserId else 0);
    if v26 and v106 and not v103.state.haveLoggedUserExposure and (v103.props.voiceState == "Inactive" or v103.props.voiceState == "Talking" or v103.props.voiceState == "Muted") then
        v25:LogUserLayerExposure(v31);
        v103:setState({
            haveLoggedUserExposure = true
        });
    end;
end;
local function v114(v107, v108, v109) --[[ Line: 552 ]] --[[ Name: getRecentMessages ]]
    -- upvalues: v33 (copy), l_List_0 (copy)
    local v110 = v33 and workspace:GetServerTimeNow() * 1000 or DateTime.now().UnixTimestampMillis;
    return l_List_0.filter(v107, function(v111, v112) --[[ Line: 556 ]]
        -- upvalues: v107 (copy), v109 (copy), v110 (copy), v108 (copy)
        if v111.isVisibleInBubbleChat then
            local v113 = false;
            if #v107 - v109 < v112 then
                v113 = v110 - v111.timestamp.UnixTimestampMillis < v108;
            end;
            return v113;
        else
            return false;
        end;
    end);
end;
v41.didMount = function(v115) --[[ Line: 566 ]] --[[ Name: didMount ]]
    -- upvalues: v6 (copy), l_RunService_0 (copy), v37 (copy), v34 (copy), v35 (copy), v20 (copy), v26 (copy), v29 (copy), v30 (copy), v42 (copy), v33 (copy), v114 (copy)
    v115.isMounted = true;
    local v116 = v115:getVerticalOffset();
    v115.offsetGoal = v116;
    v115.offsetMotor:setGoal(v6.instant(v116));
    v115.heartbeatConn = l_RunService_0.Heartbeat:Connect(function(v117) --[[ Line: 574 ]]
        -- upvalues: v37 (ref), v115 (copy), v34 (ref), v35 (ref), v20 (ref), v26 (ref), v29 (ref), v30 (ref), v6 (ref), v42 (ref), v33 (ref), v114 (ref)
        if v37() and v115.props.billboardUpdateFrequency > 0 then
            v115.lastDistanceUpdate = v115.lastDistanceUpdate + v117;
            if v115.lastDistanceUpdate < v115.props.billboardUpdateFrequency then
                return;
            else
                v115.lastDistanceUpdate = 0;
            end;
        elseif v34() and not v115.props.tests_skipHeartbeatCheck then
            if v115.heartbeatCount < v35 then
                local l_v115_0 = v115;
                l_v115_0.heartbeatCount = l_v115_0.heartbeatCount + 1;
                return;
            else
                v115.heartbeatCount = 0;
            end;
        end;
        local v119 = getAdorneeInstance(v115.props.adornee, v115.state.savedChatSettings.AdorneeName);
        if workspace.CurrentCamera and v119 then
            local v120 = if v119:IsA("Attachment") then v119.WorldPosition else v119.Position;
            local l_Magnitude_0 = (workspace.CurrentCamera.CFrame.Position - v120).Magnitude;
            local v122 = l_Magnitude_0 < v115.state.savedChatSettings.MaxDistance;
            local v123 = l_Magnitude_0 < v115.state.savedChatSettings.MinimizeDistance;
            local v124 = false;
            local v125 = false;
            local l_ShowLikelySpeakingBubbles_0 = v20.ShowLikelySpeakingBubbles;
            if v26 and v115.state.isInEasierUnmutingTreatment or l_ShowLikelySpeakingBubbles_0 then
                local v127 = nil;
                local v128 = getAdorneeInstance(v115.props.localAdornee, v115.state.savedChatSettings.AdorneeName);
                if v128 then
                    v127 = if v128:IsA("Attachment") then v128.WorldPosition else v128.Position;
                end;
                local v129 = getEasierUnmutingDistance(v120, v127);
                if v129 ~= nil then
                    if v26 and v115.state.isInEasierUnmutingTreatment then
                        v124 = v129 < v29;
                    end;
                    if l_ShowLikelySpeakingBubbles_0 then
                        v125 = v129 < v30;
                    end;
                end;
            end;
            if v123 ~= v115.state.isInsideMaximizeDistance or v122 ~= v115.state.isInsideRenderDistance or v26 and v115.state.isInEasierUnmutingTreatment and v124 ~= v115.state.isInsideEasierUnmutingDistance or l_ShowLikelySpeakingBubbles_0 and v125 ~= v115.state.isInsideLikelySpeakingDistance then
                v115:setState({
                    isInsideRenderDistance = v122, 
                    isInsideMaximizeDistance = v123, 
                    isInsideEasierUnmutingDistance = v124, 
                    isInsideLikelySpeakingDistance = v125
                });
            end;
        end;
        local v130 = v115:getVerticalOffset();
        if math.abs(v130 - v115.offsetGoal) > 0.5 then
            v115.offsetGoal = v130;
            v115.offsetMotor:setGoal(v6.spring(v130, v42));
        end;
        local v131 = v33 and workspace:GetServerTimeNow() * 1000 or DateTime.now().UnixTimestampMillis;
        local v132 = v115.state.savedChatSettings.BubbleDuration * 1000;
        for _, v134 in ipairs(v115.state.filteredMessages) do
            if v132 <= v131 - v134.timestamp.UnixTimestampMillis then
                v115:setState(function(v135) --[[ Line: 656 ]]
                    -- upvalues: v114 (ref), v132 (copy), v115 (ref)
                    return {
                        filteredMessages = v114(v135.filteredMessages, v132, v115.props.chatSettings.MaxBubbles)
                    };
                end);
                return;
            end;
        end;
    end);
    if v26 and v115.state.isInEasierUnmutingTreatment then
        v115:checkCounterForTimeoutWithEasierUnmuting(nil);
        return;
    else
        v115:checkCounterForTimeout(nil);
        return;
    end;
end;
v41.willUnmount = function(v136) --[[ Line: 678 ]] --[[ Name: willUnmount ]]
    -- upvalues: v12 (copy)
    v12:trace("Unmounting billboards for {}", v136.state.shortId);
    v136.isMounted = false;
    if v136.characterConn then
        v136.characterConn:Disconnect();
        v136.characterConn = nil;
    end;
    if v136.heartbeatConn then
        v136.heartbeatConn:Disconnect();
        v136.heartbeatConn = nil;
    end;
    if v136.humanoidDiedConn then
        v136.humanoidDiedConn:Disconnect();
        v136.humanoidDiedConn = nil;
    end;
    if v136.selfViewConnection then
        v136.selfViewConnection:disconnect();
        v136.selfViewConnection = nil;
    end;
    v136.offsetMotor:destroy();
end;
v41.getDerivedStateFromProps = function(v137, v138) --[[ Line: 700 ]] --[[ Name: getDerivedStateFromProps ]]
    -- upvalues: v114 (copy)
    local v139 = "..." .. string.sub(tostring(v137.userId), -4);
    local v140 = nil;
    local v141 = nil;
    local v142 = nil;
    if v138.lastVoiceState ~= v137.voiceState then
        v141 = (v138.voiceStateCounter or 0) + 1;
        v142 = false;
        v140 = v137.voiceState;
    end;
    local v143 = v138.savedChatSettings.BubbleDuration * 1000;
    local v144 = v114(v137.messages, v143, v138.savedChatSettings.MaxBubbles);
    return {
        savedChatSettings = v137.lastMessage and v137.chatSettings, 
        shortId = v139, 
        filteredMessages = v144, 
        voiceStateCounter = v141, 
        voiceTimedOut = v142, 
        lastVoiceState = v140
    };
end;
local v148 = v13(function(v145, v146) --[[ Line: 731 ]]
    -- upvalues: l_List_0 (copy)
    return l_List_0.map(v145.bubbleMessagesInOrderBySenderId[v146] or {}, function(v147) --[[ Line: 732 ]]
        -- upvalues: v145 (copy)
        return v145.byMessageId[v147];
    end);
end);
return v4.connect(function(v149, v150) --[[ Line: 737 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: v148 (copy), l_Players_0 (copy), v22 (copy), v20 (copy), v26 (copy)
    local v151 = v148(v149.Messages, v150.userId);
    local v152 = v151[#v151];
    local v153 = if l_Players_0.LocalPlayer then tostring(l_Players_0.LocalPlayer.UserId) else "";
    local v154 = nil;
    v154 = if v150.isTextChatServiceOn then v149.BubbleChatSettings else v22(v149.LegacyBubbleChatSettings, v152);
    local v155 = if v20.ShowLikelySpeakingBubbles then v149.Voice.likelySpeakingUsers[v150.userId] else false;
    return {
        messages = v151, 
        lastMessage = v152, 
        chatSettings = v154, 
        adornee = v149.Adornees[v150.userId] or v150.partOrModel, 
        clientSettings = v149.ClientSettings, 
        isMuted = v149.Voice.participantsMuted[v150.userId] or false, 
        localAdornee = if v26 then v149.Adornees[v153] else nil, 
        isLikelySpeakingUser = v155, 
        isVoiceUIVisible = v149.Voice.isVoiceUIVisible
    };
end)(v41);