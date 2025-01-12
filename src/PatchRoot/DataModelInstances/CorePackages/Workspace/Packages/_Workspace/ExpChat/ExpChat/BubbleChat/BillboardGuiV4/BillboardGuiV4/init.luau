local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.ExpChatShared);
local v3 = require(l_Parent_0.Roact);
local v4 = require(l_Parent_0.RoactRodux);
local l_List_0 = require(l_Parent_0.llama).List;
local v6 = require(l_Parent_0.Otter);
local v7 = require(l_Parent_0.tutils);
local v8 = require(l_Parent_0.SharedFlags);
local l_Players_0 = game:GetService("Players");
local l_RunService_0 = game:GetService("RunService");
local l_StarterGui_0 = game:GetService("StarterGui");
local l_VRService_0 = game:GetService("VRService");
local v13 = v2.Logger:new("ExpChat/" .. script.Name);
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
local v25 = game:DefineFastFlag("EasierUnmutingTCS5", false);
local v26 = game:DefineFastFlag("EasierUnmutingBasedOnCameraTCS", false);
local v27 = game:DefineFastInt("LikelySpeakingBubbleDisplayDistance", 50);
local v28 = game:DefineFastFlag("FixTimestampNowComparisonForChatMessages", false);
local v29 = require(l_script_FirstAncestor_0.Flags.getFFlagEnableExperienceChatOptimizations);
local v30 = game:DefineFastInt("ExperienceChatHeartbeatIncrement", 5);
local v31 = require(l_script_FirstAncestor_0.Flags.GetFFlagShowSpeakerIconWithChatBubblesTCS);
local v32 = require(l_script_FirstAncestor_0.Flags.getFFlagEnableBillboardUpdateFrequency);
local v33 = require(l_script_FirstAncestor_0.Flags.GetFFlagVoiceIconInChatBubbleFix);
local l_GetFFlagEnableShowVoiceUI_0 = v8.GetFFlagEnableShowVoiceUI;
local v35 = Vector2.new(28, 28);
local v36 = v3.PureComponent:extend("BubbleChatBillboard");
local v37 = {
    dampingRatio = 1, 
    frequency = 4
};
local l_CurrentCamera_0 = workspace.CurrentCamera;
workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function() --[[ Line: 62 ]]
    -- upvalues: l_CurrentCamera_0 (ref)
    l_CurrentCamera_0 = workspace.CurrentCamera;
end);
getEasierUnmutingDistance = function(v39, v40) --[[ Line: 66 ]] --[[ Name: getEasierUnmutingDistance ]]
    -- upvalues: l_CurrentCamera_0 (ref), v26 (copy)
    local v41 = l_CurrentCamera_0 and l_CurrentCamera_0.CFrame.Position;
    if (v26 or not v40) and v39 and v41 then
        return (v39 - v41).Magnitude;
    elseif v39 and v40 then
        return (v39 - v40).Magnitude;
    else
        return nil;
    end;
end;
v36.init = function(v42) --[[ Line: 80 ]] --[[ Name: init ]]
    -- upvalues: v20 (copy), v23 (copy), l_StarterGui_0 (copy), v3 (copy), v6 (copy), v29 (copy), v32 (copy), l_Players_0 (copy), v15 (copy)
    local v43 = nil;
    local v44 = nil;
    if v20.AvatarChatEnabled then
        v43 = v42.props.selfViewListenerChanged.getSelfViewVisibility();
        v44 = v23 or l_StarterGui_0:GetCoreGuiEnabled(Enum.CoreGuiType.All) or l_StarterGui_0:GetCoreGuiEnabled(Enum.CoreGuiType.SelfView);
    end;
    v42:setState({
        isInsideRenderDistance = false, 
        isInsideMaximizeDistance = false, 
        savedChatSettings = v42.props.chatSettings, 
        selfViewOpen = v43, 
        selfViewEnabled = v44, 
        voiceTimedOut = false, 
        voiceStateCounter = 0, 
        lastVoiceState = nil
    });
    v42.isMounted = false;
    local v45, v46 = v3.createBinding((Vector3.new()));
    v42.offset = v45;
    v42.updateOffset = v46;
    v42.offsetMotor = v6.createSingleMotor(0);
    v42.offsetMotor:onStep(function(v47) --[[ Line: 105 ]]
        -- upvalues: v42 (copy)
        v42.updateOffset((Vector3.new(0, v47, 0)));
    end);
    v42.offsetGoal = 0;
    if v29() then
        v42.heartbeatCount = 0;
    end;
    if v32() then
        v42.lastDistanceUpdate = 0;
    end;
    v42.onLastBubbleFadeOut = function() --[[ Line: 118 ]]
        -- upvalues: v42 (copy)
        if v42.props.onFadeOut and not v42.isFadingOut then
            v42.isFadingOut = true;
            v42.props.onFadeOut(v42.props.userId);
        end;
    end;
    v42.wrappedOnClickVoiceIndicator = function(v48, v49) --[[ Line: 126 ]]
        -- upvalues: v42 (copy)
        return v42.props.onClickedVoiceIndicator(v48, v49, "bubblechat");
    end;
    v45 = l_Players_0.LocalPlayer;
    v46 = if v45 then v42.props.userId ~= tostring(v45.UserId) and "SpeakerDark" or "MicDark" else "SpeakerDark";
    v42.renderInsert = function() --[[ Line: 134 ]]
        -- upvalues: v3 (ref), v15 (ref), v42 (copy), v46 (copy)
        return v3.createElement(v15, {
            userId = v42.props.userId, 
            getIcon = v42.props.getIconVoiceIndicator, 
            onClicked = v42.wrappedOnClickVoiceIndicator, 
            iconStyle = v46
        });
    end;
    if v20.AvatarChatEnabled then
        local l_selfViewVisibilityUpdatedSignal_0 = v42.props.selfViewListenerChanged.selfViewVisibilityUpdatedSignal;
        local l_getSelfViewVisibility_0 = v42.props.selfViewListenerChanged.getSelfViewVisibility;
        v42.selfViewConnection = l_selfViewVisibilityUpdatedSignal_0:connect(function() --[[ Line: 147 ]] --[[ Name: callback ]]
            -- upvalues: v42 (copy), l_getSelfViewVisibility_0 (copy)
            v42:setState({
                selfViewOpen = l_getSelfViewVisibility_0()
            });
        end);
    end;
end;
v36.checkCounterForTimeout = function(v52, v53) --[[ Line: 156 ]] --[[ Name: checkCounterForTimeout ]]
    -- upvalues: l_Players_0 (copy)
    if l_Players_0.LocalPlayer and v52.props.userId ~= tostring(l_Players_0.LocalPlayer.UserId) and v52.state.lastVoiceState ~= "Talking" and v52.state.voiceStateCounter ~= v53 then
        local l_voiceStateCounter_0 = v52.state.voiceStateCounter;
        delay(1, function() --[[ Line: 166 ]]
            -- upvalues: v52 (copy), l_voiceStateCounter_0 (copy)
            if v52.state.voiceStateCounter == l_voiceStateCounter_0 and v52.isMounted then
                v52:setState({
                    voiceTimedOut = true
                });
            end;
        end);
    end;
end;
v36.getVerticalOffset = function(v55) --[[ Line: 179 ]] --[[ Name: getVerticalOffset ]]
    local l_adornee_0 = v55.props.adornee;
    if l_adornee_0 and l_adornee_0:IsA("Model") then
        local l_l_adornee_0_BoundingBox_0, v58 = l_adornee_0:GetBoundingBox();
        local v59 = getAdorneeInstance(v55.props.adornee, v55.state.savedChatSettings.AdorneeName);
        if not v59 then
            return v58.Y / 2;
        elseif v59:IsA("BasePart") then
            local v60 = l_l_adornee_0_BoundingBox_0:PointToObjectSpace(v59.Position);
            return v58.Y / 2 - v60.Y;
        else
            return 0;
        end;
    elseif l_adornee_0 and l_adornee_0:IsA("BasePart") then
        return l_adornee_0.Size.Y / 2;
    else
        return 0;
    end;
end;
getAdorneeInstance = function(v61, v62) --[[ Line: 202 ]] --[[ Name: getAdorneeInstance ]]
    if not v61 then
        return nil;
    else
        if v61:IsA("Model") then
            local v63 = v61:FindFirstChild(v62, true) or v61.PrimaryPart;
            if not v63 or v63:IsA("BasePart") or v63:IsA("Attachment") then
                return v63;
            end;
        elseif v61:IsA("BasePart") or v61:IsA("Attachment") then
            return v61;
        end;
        return nil;
    end;
end;
v36.shouldRenderCaret = function(v64) --[[ Line: 218 ]] --[[ Name: shouldRenderCaret ]]
    -- upvalues: v20 (copy)
    local l_savedChatSettings_0 = v64.state.savedChatSettings;
    local v66 = not v20.ShowLikelySpeakingBubbles or not v64:shouldRenderLikelySpeakingBubble();
    return l_savedChatSettings_0.TailVisible and not v64:shouldRenderPlayerButtons() and v66;
end;
v36.shouldRenderPlayerButtons = function(v67) --[[ Line: 226 ]] --[[ Name: shouldRenderPlayerButtons ]]
    -- upvalues: l_GetFFlagEnableShowVoiceUI_0 (copy), l_Players_0 (copy), l_VRService_0 (copy), v20 (copy), v31 (copy)
    if l_GetFFlagEnableShowVoiceUI_0() then
        if not v67.props.voiceEnabled or not v67.props.isVoiceUIVisible then
            return false;
        end;
    elseif not v67.props.voiceEnabled then
        return false;
    end;
    if if l_Players_0.LocalPlayer then v67.props.userId == tostring(l_Players_0.LocalPlayer.UserId) else false then
        if l_VRService_0.VREnabled or v20.ChromeEnabled then
            return false;
        elseif not v67.state.selfViewOpen then
            return true;
        else
            return false;
        end;
    else
        local v68 = not v67.state.filteredMessages or #v67.state.filteredMessages == 0;
        local v69 = v67.props.voiceEnabled and not v67.state.voiceTimedOut;
        if v31() then
            return v69;
        elseif v69 and (not v67.props.isBubbleChatEnabled or v68) then
            return true;
        else
            return false;
        end;
    end;
end;
v36.shouldRenderLikelySpeakingBubble = function(v70) --[[ Line: 270 ]] --[[ Name: shouldRenderLikelySpeakingBubble ]]
    -- upvalues: l_Players_0 (copy)
    return not (if l_Players_0.LocalPlayer then v70.props.userId == tostring(l_Players_0.LocalPlayer.UserId) else false) and v70.props.isEligibleForLikelySpeakingBubbles and v70.props.isLikelySpeakingUser;
end;
local function _(v71, v72) --[[ Line: 278 ]] --[[ Name: messagesHaveChanged ]]
    local v73 = #v71;
    local v74 = #v72;
    if v73 == 0 and v74 == 0 then
        return false;
    elseif v73 ~= v74 then
        return true;
    else
        for v75, v76 in v71 do
            if v76.messageId ~= v72[v75].messageId then
                return true;
            end;
        end;
        return false;
    end;
end;
local v78 = {
    filteredMessages = true
};
v36.shouldComponentUpdate = function(v79, v80, v81) --[[ Line: 297 ]] --[[ Name: shouldComponentUpdate ]]
    -- upvalues: v7 (copy), v78 (copy)
    local v82 = false;
    if v79.state.isInsideRenderDistance ~= v81.isInsideRenderDistance and not v81.isInsideRenderDistance then
        return false;
    else
        local l_filteredMessages_0 = v79.state.filteredMessages;
        local l_filteredMessages_1 = v81.filteredMessages;
        local v85 = #l_filteredMessages_0;
        local v86 = #l_filteredMessages_1;
        local v87;
        if v85 == 0 and v86 == 0 then
            v87 = false;
        elseif v85 ~= v86 then
            v87 = true;
        else
            for v88, v89 in l_filteredMessages_0 do
                if v89.messageId ~= l_filteredMessages_1[v88].messageId then
                    v87 = true;
                    v82 = true;
                end;
                if v82 then
                    break;
                end;
            end;
            if not v82 then
                v87 = false;
            end;
        end;
        v82 = false;
        if v87 then
            return true;
        else
            return not v7.shallowEqual(v80, v79.props, v78) or not v7.shallowEqual(v81, v79.state, v78);
        end;
    end;
end;
v36.render = function(v90) --[[ Line: 311 ]] --[[ Name: render ]]
    -- upvalues: l_Players_0 (copy), v13 (copy), v20 (copy), v33 (copy), v35 (copy), v3 (copy), v24 (copy), v19 (copy), v16 (copy), v17 (copy), v18 (copy)
    local v91 = getAdorneeInstance(v90.props.adornee, v90.state.savedChatSettings.AdorneeName);
    local v92 = if l_Players_0.LocalPlayer then v90.props.userId == tostring(l_Players_0.LocalPlayer.UserId) else false;
    local l_savedChatSettings_1 = v90.state.savedChatSettings;
    if not v91 then
        v13:trace("No adornee for {}", v90.state.shortId);
        return;
    elseif not v90.state.isInsideRenderDistance then
        return;
    else
        local v94 = {};
        local v95 = v90.state.filteredMessages and #v90.state.filteredMessages > 0;
        local v96 = v90.props.voiceEnabled and not v90.state.voiceTimedOut;
        if v20.AvatarChatEnabled and v92 then
            v96 = v96 and not v90.state.selfViewOpen;
        end;
        if v20.ChromeEnabled and v92 then
            v96 = false;
        end;
        local v97 = v96 and not v20.AvatarChatEnabled;
        if v33() then
            v97 = v96 and not v20.AvatarChatEnabled and not v20.ChromeEnabled;
        end;
        local v98 = if v96 then v90.renderInsert else nil;
        local l_v35_0 = v35;
        local l_clientSettings_0 = v90.props.clientSettings;
        if v20.AvatarChatEnabled or v20.ChromeEnabled then
            if v90:shouldRenderPlayerButtons() then
                local v101 = {
                    chatSettings = v90.props.chatSettings, 
                    isInsideMaximizeDistance = v90.state.isInsideMaximizeDistance, 
                    LayoutOrder = 2, 
                    isLocalPlayer = v92, 
                    userId = v90.props.userId, 
                    getIcon = v90.props.getIconVoiceIndicator, 
                    hasCameraPermissions = v90.props.hasCameraPermissions, 
                    hasMicPermissions = v90.props.hasMicPermissions, 
                    onClickedVoiceIndicator = v90.wrappedOnClickVoiceIndicator, 
                    onClickedCameraIndicator = v90.props.onClickedCameraIndicator, 
                    voiceEnabled = v90.props.voiceEnabled, 
                    displayCameraDeniedToast = v90.props.displayCameraDeniedToast, 
                    isCamEnabledForUserAndPlace = v90.props.isCamEnabledForUserAndPlace, 
                    setCameraPermissionStateFromControl = v90.props.setCameraPermissionStateFromControl, 
                    getPermissions = v90.props.getPermissions, 
                    isCameraOnlyUser = v90.props.isCameraOnlyUser, 
                    isVoiceServiceInitialized = v90.props.isVoiceServiceInitialized
                };
                v94.PlayerButtons = v3.createElement(v24, v101);
                v94.listLayout = v3.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    VerticalAlignment = Enum.VerticalAlignment.Bottom, 
                    Padding = UDim.new(0, 8)
                });
                v94.padding = v3.createElement("UIPadding", {
                    PaddingBottom = UDim.new(0, 8)
                });
            elseif v20.ShowLikelySpeakingBubbles and v90:shouldRenderLikelySpeakingBubble() and v90.state.isInsideLikelySpeakingDistance then
                local v102 = {
                    chatSettings = v90.props.chatSettings, 
                    isInsideMaximizeDistance = v90.state.isInsideMaximizeDistance, 
                    LayoutOrder = 2, 
                    onActivated = v90.props.onClickedLikelySpeakingBubble
                };
                v94.LikelySpeakingBubble = v3.createElement(v19, v102);
                v94.listLayout = v3.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    VerticalAlignment = Enum.VerticalAlignment.Bottom, 
                    Padding = UDim.new(0, 8)
                });
                v94.padding = v3.createElement("UIPadding", {
                    PaddingBottom = UDim.new(0, 8)
                });
            end;
        elseif v96 and v95 == false then
            v94.VoiceBubble = v3.createElement(v16, {
                chatSettings = l_savedChatSettings_1, 
                userId = v90.props.userId, 
                renderInsert = v98, 
                insertSize = l_v35_0, 
                isDistant = not v90.state.isInsideMaximizeDistance, 
                clientSettings = l_clientSettings_0
            });
        end;
        local v103 = v90:shouldRenderCaret();
        if v90.state.isInsideMaximizeDistance then
            v94.BubbleChatList = v3.createElement(v17, {
                userId = v90.props.userId, 
                isVisible = v90.state.isInsideMaximizeDistance, 
                onLastBubbleFadeOut = v90.onLastBubbleFadeOut, 
                chatSettings = l_savedChatSettings_1, 
                renderFirstInsert = if v97 then v98 else nil, 
                insertSize = l_v35_0, 
                messages = v90.state.filteredMessages, 
                clientSettings = l_clientSettings_0, 
                isTextChatServiceOn = v90.props.isTextChatServiceOn, 
                showCaret = v103
            });
        elseif v95 then
            v94.DistantBubble = v3.createElement(v18, {
                fadingOut = not v90.state.filteredMessages or #v90.state.filteredMessages == 0, 
                onFadeOut = v90.onLastBubbleFadeOut, 
                chatSettings = l_savedChatSettings_1, 
                renderInsert = if v97 then v98 else nil, 
                insertSize = l_v35_0, 
                clientSettings = l_clientSettings_0, 
                showCaret = v103
            });
        end;
        local v104 = v92 and l_savedChatSettings_1.LocalPlayerStudsOffset or Vector3.new(0, 1, 0.10000000149011612, 0);
        local v105 = v20.ShowLikelySpeakingBubbles and v90:shouldRenderLikelySpeakingBubble();
        return v3.createElement("BillboardGui", {
            Adornee = v91, 
            Active = if v20.AvatarChatEnabled then v90:shouldRenderPlayerButtons() or v105 else v96 or v105, 
            Size = UDim2.fromOffset(500, 200), 
            SizeOffset = Vector2.new(0, 0.5), 
            StudsOffset = v104 + Vector3.new(0, l_savedChatSettings_1.VerticalStudsOffset, 0), 
            StudsOffsetWorldSpace = v90.offset, 
            ResetOnSpawn = false
        }, v94);
    end;
end;
v36.didUpdate = function(v106, _, v108) --[[ Line: 472 ]] --[[ Name: didUpdate ]]
    if (not v106.state.filteredMessages or #v106.state.filteredMessages == 0) and not v106.state.isInsideRenderDistance then
        v106.onLastBubbleFadeOut();
    end;
    if v106.state.filteredMessages and #v106.state.filteredMessages > 0 then
        v106.isFadingOut = false;
    end;
    v106:checkCounterForTimeout(v108.voiceStateCounter);
end;
local function v117(v109, v110, v111) --[[ Line: 488 ]] --[[ Name: getRecentMessages ]]
    -- upvalues: v28 (copy), l_List_0 (copy)
    local v112 = v28 and workspace:GetServerTimeNow() * 1000 or DateTime.now().UnixTimestampMillis;
    local v113 = v109 or {};
    return l_List_0.filter(v113, function(v114, v115) --[[ Line: 493 ]]
        -- upvalues: v109 (copy), v111 (copy), v112 (copy), v110 (copy)
        if v114.isVisibleInBubbleChat then
            local v116 = false;
            if #v109 - v111 < v115 then
                v116 = v112 - v114.timestamp.UnixTimestampMillis < v110;
            end;
            return v116;
        else
            return false;
        end;
    end);
end;
v36.didMount = function(v118) --[[ Line: 503 ]] --[[ Name: didMount ]]
    -- upvalues: v6 (copy), l_RunService_0 (copy), v32 (copy), v29 (copy), v30 (copy), l_CurrentCamera_0 (ref), v20 (copy), v27 (copy), v37 (copy), v28 (copy), v117 (copy)
    v118.isMounted = true;
    local v119 = v118:getVerticalOffset();
    v118.offsetGoal = v119;
    v118.offsetMotor:setGoal(v6.instant(v119));
    v118.heartbeatConn = l_RunService_0.Heartbeat:Connect(function(v120) --[[ Line: 511 ]]
        -- upvalues: v32 (ref), v118 (copy), v29 (ref), v30 (ref), l_CurrentCamera_0 (ref), v20 (ref), v27 (ref), v6 (ref), v37 (ref), v28 (ref), v117 (ref)
        if v32() and v118.props.billboardUpdateFrequency > 0 then
            v118.lastDistanceUpdate = v118.lastDistanceUpdate + v120;
            if v118.lastDistanceUpdate < v118.props.billboardUpdateFrequency then
                return;
            else
                v118.lastDistanceUpdate = 0;
            end;
        elseif v29() and not v118.props.tests_skipHeartbeatCheck then
            if v118.heartbeatCount < v30 then
                local l_v118_0 = v118;
                l_v118_0.heartbeatCount = l_v118_0.heartbeatCount + 1;
                return;
            else
                v118.heartbeatCount = 0;
            end;
        end;
        local v122 = getAdorneeInstance(v118.props.adornee, v118.state.savedChatSettings.AdorneeName);
        if l_CurrentCamera_0 and v122 then
            local v123 = if v122:IsA("Attachment") then v122.WorldPosition else v122.Position;
            local l_Magnitude_0 = (l_CurrentCamera_0.CFrame.Position - v123).Magnitude;
            local v125 = l_Magnitude_0 < v118.state.savedChatSettings.MaxDistance;
            local v126 = l_Magnitude_0 < v118.state.savedChatSettings.MinimizeDistance;
            local v127 = false;
            local l_ShowLikelySpeakingBubbles_0 = v20.ShowLikelySpeakingBubbles;
            if l_ShowLikelySpeakingBubbles_0 and v118.props.isEligibleForLikelySpeakingBubbles then
                local v129 = nil;
                local v130 = getAdorneeInstance(v118.props.localAdornee, v118.state.savedChatSettings.AdorneeName);
                if v130 then
                    v129 = if v130:IsA("Attachment") then v130.WorldPosition else v130.Position;
                end;
                local v131 = getEasierUnmutingDistance(v123, v129);
                if v131 ~= nil and l_ShowLikelySpeakingBubbles_0 then
                    v127 = v131 < v27;
                end;
            end;
            if v126 ~= v118.state.isInsideMaximizeDistance or v125 ~= v118.state.isInsideRenderDistance or l_ShowLikelySpeakingBubbles_0 and v118.props.isEligibleForLikelySpeakingBubbles and v127 ~= v118.state.isInsideLikelySpeakingDistance then
                v118:setState({
                    isInsideRenderDistance = v125, 
                    isInsideMaximizeDistance = v126, 
                    isInsideLikelySpeakingDistance = v127
                });
            end;
        end;
        local v132 = v118:getVerticalOffset();
        if math.abs(v132 - v118.offsetGoal) > 0.5 then
            v118.offsetGoal = v132;
            v118.offsetMotor:setGoal(v6.spring(v132, v37));
        end;
        local v133 = v28 and workspace:GetServerTimeNow() * 1000 or DateTime.now().UnixTimestampMillis;
        local v134 = v118.state.savedChatSettings.BubbleDuration * 1000;
        for _, v136 in v118.state.filteredMessages do
            if v134 <= v133 - v136.timestamp.UnixTimestampMillis then
                v118:setState(function(v137) --[[ Line: 588 ]]
                    -- upvalues: v117 (ref), v134 (copy), v118 (ref)
                    return {
                        filteredMessages = v117(v137.filteredMessages, v134, v118.props.chatSettings.MaxBubbles)
                    };
                end);
                return;
            end;
        end;
    end);
    v118:checkCounterForTimeout(nil);
end;
v36.willUnmount = function(v138) --[[ Line: 606 ]] --[[ Name: willUnmount ]]
    -- upvalues: v13 (copy)
    v13:trace("Unmounting billboards for {}", v138.state.shortId);
    v138.isMounted = false;
    if v138.characterConn then
        v138.characterConn:Disconnect();
        v138.characterConn = nil;
    end;
    if v138.heartbeatConn then
        v138.heartbeatConn:Disconnect();
        v138.heartbeatConn = nil;
    end;
    if v138.humanoidDiedConn then
        v138.humanoidDiedConn:Disconnect();
        v138.humanoidDiedConn = nil;
    end;
    if v138.selfViewConnection then
        v138.selfViewConnection:disconnect();
        v138.selfViewConnection = nil;
    end;
    v138.offsetMotor:destroy();
end;
v36.getDerivedStateFromProps = function(v139, v140) --[[ Line: 628 ]] --[[ Name: getDerivedStateFromProps ]]
    -- upvalues: v117 (copy)
    local v141 = "..." .. string.sub(tostring(v139.userId), -4);
    local v142 = nil;
    local v143 = nil;
    local v144 = nil;
    if v140.lastVoiceState ~= v139.voiceState then
        v143 = (v140.voiceStateCounter or 0) + 1;
        v144 = false;
        v142 = v139.voiceState;
    end;
    local v145 = v140.savedChatSettings.BubbleDuration * 1000;
    local v146 = v117(v139.messages, v145, v140.savedChatSettings.MaxBubbles);
    return {
        savedChatSettings = v139.lastMessage and v139.chatSettings, 
        shortId = v141, 
        filteredMessages = v146, 
        voiceStateCounter = v143, 
        voiceTimedOut = v144, 
        lastVoiceState = v142
    };
end;
return v4.connect(function(v147, v148) --[[ Line: 659 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: l_Players_0 (copy), v22 (copy), v25 (copy)
    local v149 = v147.Messages.messagesBySenderId[v148.userId];
    local v150 = if v149 ~= nil then v149[#v149] else nil;
    local v151 = if l_Players_0.LocalPlayer then tostring(l_Players_0.LocalPlayer.UserId) else "";
    local v152 = nil;
    v152 = if v148.isTextChatServiceOn then v147.BubbleChatSettings else v22(v147.LegacyBubbleChatSettings, v150);
    return {
        messages = v149, 
        lastMessage = v150, 
        chatSettings = v152, 
        adornee = v147.Adornees[v148.userId] or v148.partOrModel, 
        clientSettings = v147.ClientSettings, 
        localAdornee = if v25 then v147.Adornees[v151] else nil, 
        isVoiceUIVisible = v147.Voice.isVoiceUIVisible
    };
end)(v36);