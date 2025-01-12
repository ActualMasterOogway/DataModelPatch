local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.ExpChatShared);
local v3 = require(l_Parent_0.React);
local l_List_0 = require(l_Parent_0.llama).List;
local v5 = require(l_Parent_0.Otter);
local v6 = require(l_Parent_0.SharedFlags);
local v7 = require(l_Parent_0.RoactRodux);
local v8 = v2.Logger:new("ExpChat/" .. script.Name .. "V3");
local l_Players_0 = game:GetService("Players");
local l_RunService_0 = game:GetService("RunService");
local l_VRService_0 = game:GetService("VRService");
local l_Workspace_0 = game:GetService("Workspace");
local l_script_FirstAncestor_1 = script:FindFirstAncestor("BubbleChat");
local v14 = require(l_script_FirstAncestor_1.VoiceIndicator);
local v15 = require(l_script_FirstAncestor_1.BlankBubble);
local v16 = require(l_script_FirstAncestor_1.BubbleChatList);
local v17 = require(l_script_FirstAncestor_1.ChatBubbleDistant);
local v18 = require(l_script_FirstAncestor_1.LikelySpeakingBubble);
local v19 = require(l_script_FirstAncestor_0.GlobalFlags);
local l_Helpers_0 = l_script_FirstAncestor_1.Helpers;
local v21 = require(l_Helpers_0.getSettingsForMessage);
local v22 = require(l_script_FirstAncestor_1.PlayerButtons);
local l_Actions_0 = l_script_FirstAncestor_0.Actions;
local _ = require(l_Actions_0.VoiceStateChanged);
local v25 = game:DefineFastFlag("EasierUnmutingBasedOnCameraTCS", false);
local v26 = game:DefineFastFlag("FixTimestampNowComparisonForChatMessages", false);
local v27 = game:DefineFastInt("ExperienceChatHeartbeatIncrement", 5);
local v28 = game:DefineFastInt("LikelySpeakingBubbleDisplayDistance", 50);
local v29 = require(l_script_FirstAncestor_0.Flags.getFFlagEnableBillboardUpdateFrequency);
local v30 = require(l_script_FirstAncestor_0.Flags.GetFFlagVoiceIconInChatBubbleFix);
local v31 = game:DefineFastFlag("InitializeHeartbeatConnOnce", false);
local l_GetFFlagEnableShowVoiceUI_0 = v6.GetFFlagEnableShowVoiceUI;
local v33 = Vector2.new(28, 28);
local v34 = {
    dampingRatio = 1, 
    frequency = 4
};
local l_CurrentCamera_0 = workspace.CurrentCamera;
workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function() --[[ Line: 91 ]]
    -- upvalues: l_CurrentCamera_0 (ref)
    l_CurrentCamera_0 = workspace.CurrentCamera;
end);
local function _(v36, v37) --[[ Line: 95 ]] --[[ Name: getEasierUnmutingDistance ]]
    -- upvalues: l_CurrentCamera_0 (ref), v25 (copy)
    local v38 = l_CurrentCamera_0 and l_CurrentCamera_0.CFrame.Position;
    if (v25 or not v37) and v36 and v38 then
        return (v36 - v38).Magnitude;
    elseif v36 and v37 then
        return (v36 - v37).Magnitude;
    else
        return nil;
    end;
end;
local function v43(v40, v41) --[[ Line: 111 ]] --[[ Name: getAdorneeInstance ]]
    if not v40 then
        return nil;
    else
        if v40:IsA("Model") then
            local v42 = v40:FindFirstChild(v41, true) or v40.PrimaryPart;
            if not v42 or v42:IsA("BasePart") or v42:IsA("Attachment") then
                return v42;
            end;
        elseif v40:IsA("BasePart") or v40:IsA("Attachment") then
            return v40;
        end;
        return nil;
    end;
end;
local function v52(v44, v45, v46) --[[ Line: 127 ]] --[[ Name: getRecentMessages ]]
    -- upvalues: v26 (copy), l_Workspace_0 (copy), l_List_0 (copy)
    local v47 = v26 and l_Workspace_0:GetServerTimeNow() * 1000 or DateTime.now().UnixTimestampMillis;
    local v48 = v44 or {};
    return l_List_0.filter(v48, function(v49, v50) --[[ Line: 132 ]]
        -- upvalues: v44 (copy), v46 (copy), v47 (copy), v45 (copy)
        if v49.isVisibleInBubbleChat then
            local v51 = false;
            if #v44 - v46 < v50 then
                v51 = v47 - v49.timestamp.UnixTimestampMillis < v45;
            end;
            return v51;
        else
            return false;
        end;
    end);
end;
local function _(v53) --[[ Line: 142 ]] --[[ Name: getInitialSelfViewOpenState ]]
    -- upvalues: v19 (copy)
    local v54 = nil;
    local v55 = v53 and v53.getSelfViewVisibility;
    if v19.AvatarChatEnabled and v55 then
        v54 = v55();
    end;
    return v54;
end;
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local v58 = l_LocalPlayer_0 and tostring(l_LocalPlayer_0.UserId);
local function v157(v59) --[[ Line: 154 ]] --[[ Name: BubbleChatBillboard ]]
    -- upvalues: v3 (copy), v19 (copy), v58 (copy), v43 (copy), l_GetFFlagEnableShowVoiceUI_0 (copy), l_VRService_0 (copy), v29 (copy), v27 (copy), l_CurrentCamera_0 (ref), v25 (copy), v28 (copy), v5 (copy), v34 (copy), v26 (copy), l_Workspace_0 (copy), v52 (copy), l_LocalPlayer_0 (copy), v14 (copy), v31 (copy), v8 (copy), l_RunService_0 (copy), v30 (copy), v33 (copy), v22 (copy), v18 (copy), v15 (copy), v16 (copy), v17 (copy)
    local l_messages_0 = v59.messages;
    local v61 = v3.useMemo(function() --[[ Line: 157 ]]
        -- upvalues: l_messages_0 (copy)
        if l_messages_0 ~= nil then
            return l_messages_0[#l_messages_0];
        else
            return nil;
        end;
    end, {
        l_messages_0
    });
    local l_chatSettings_0 = v59.chatSettings;
    local l_adornee_0 = v59.adornee;
    local l_clientSettings_0 = v59.clientSettings;
    local l_isLikelySpeakingUser_0 = v59.isLikelySpeakingUser;
    local l_isVoiceUIVisible_0 = v59.isVoiceUIVisible;
    local v67, v68 = v3.useState(false);
    local v69, v70 = v3.useState(false);
    local v71, v72 = v3.useState(l_chatSettings_0);
    local l_useState_0 = v3.useState;
    local l_selfViewListenerChanged_0 = v59.selfViewListenerChanged;
    local v75 = nil;
    local v76 = l_selfViewListenerChanged_0 and l_selfViewListenerChanged_0.getSelfViewVisibility;
    if v19.AvatarChatEnabled and v76 then
        v75 = v76();
    end;
    local v77;
    l_useState_0, v77 = l_useState_0(v75);
    l_selfViewListenerChanged_0, v75 = v3.useState(false);
    local v78;
    v76, v78 = v3.useState(0);
    local v79, v80 = v3.useState({});
    local v81 = v59.userId == v58;
    local l_localAdornee_0 = v59.localAdornee;
    local v83 = nil;
    local v84 = nil;
    if v19.ShowLikelySpeakingBubbles then
        local v85, v86 = v3.useState(false);
        v83 = v85;
        v84 = v86;
    end;
    local v87 = v3.useRef(false);
    local v88, v89 = v3.useBinding(Vector3.zero);
    local v90 = v3.useRef(nil);
    local v91 = v3.useRef(0);
    local v92 = v3.useRef(0);
    local v93 = v3.useRef(0);
    local v94 = v3.useRef(nil);
    local v95 = v3.useCallback(function() --[[ Line: 195 ]]
        -- upvalues: v59 (copy), v87 (copy)
        if v59.onFadeOut and not v87.current then
            v87.current = true;
            v59.onFadeOut(v59.userId);
        end;
    end, {
        v59.onFadeOut, 
        v59.userId, 
        v87.current
    });
    local v98 = v3.useCallback(function(v96, v97) --[[ Line: 203 ]]
        -- upvalues: v59 (copy)
        return v59.onClickedVoiceIndicator(v96, v97, "bubblechat");
    end, {
        v59.onClickedVoiceIndicator
    });
    local l_AdorneeName_0 = v71.AdorneeName;
    local v100 = v3.useMemo(function() --[[ Line: 209 ]]
        -- upvalues: v43 (ref), l_adornee_0 (copy), l_AdorneeName_0 (copy)
        return (v43(l_adornee_0, l_AdorneeName_0));
    end, {
        l_adornee_0, 
        l_AdorneeName_0
    });
    local v101 = v3.useMemo(function() --[[ Line: 212 ]]
        -- upvalues: v43 (ref), l_localAdornee_0 (copy), l_AdorneeName_0 (copy)
        return (v43(l_localAdornee_0, l_AdorneeName_0));
    end, {
        l_localAdornee_0, 
        l_AdorneeName_0
    });
    local v105 = v3.useMemo(function() --[[ Line: 215 ]]
        -- upvalues: l_adornee_0 (copy), v100 (copy)
        if l_adornee_0 and l_adornee_0:IsA("Model") then
            local l_l_adornee_0_BoundingBox_0, v103 = l_adornee_0:GetBoundingBox();
            if not v100 then
                return v103.Y / 2;
            elseif v100:IsA("BasePart") then
                local v104 = l_l_adornee_0_BoundingBox_0:PointToObjectSpace(v100.Position);
                return v103.Y / 2 - v104.Y;
            else
                return 0;
            end;
        elseif l_adornee_0 and l_adornee_0:IsA("BasePart") then
            return l_adornee_0.Size.Y / 2;
        else
            return 0;
        end;
    end, {
        l_adornee_0, 
        v100
    });
    local v106 = v3.useCallback(function() --[[ Line: 234 ]]
        -- upvalues: l_GetFFlagEnableShowVoiceUI_0 (ref), v59 (copy), l_isVoiceUIVisible_0 (copy), v81 (copy), l_VRService_0 (ref), v19 (ref), l_useState_0 (copy), l_selfViewListenerChanged_0 (copy)
        if l_GetFFlagEnableShowVoiceUI_0() then
            if not v59.voiceEnabled or not l_isVoiceUIVisible_0 then
                return false;
            end;
        elseif not v59.voiceEnabled then
            return false;
        end;
        if v81 then
            if l_VRService_0.VREnabled or v19.ChromeEnabled then
                return false;
            elseif not l_useState_0 then
                return true;
            else
                return false;
            end;
        else
            return v59.voiceEnabled and not l_selfViewListenerChanged_0;
        end;
    end, {
        v59.voiceEnabled, 
        v59.userId, 
        l_useState_0, 
        v79, 
        l_selfViewListenerChanged_0, 
        v59.isBubbleChatEnabled, 
        v71, 
        l_chatSettings_0, 
        l_VRService_0.VREnabled, 
        l_isVoiceUIVisible_0
    });
    local v107 = v3.useCallback(function() --[[ Line: 276 ]]
        -- upvalues: v81 (copy), v59 (copy), l_isLikelySpeakingUser_0 (copy)
        return not v81 and v59.isEligibleForLikelySpeakingBubbles and l_isLikelySpeakingUser_0;
    end, {
        v81, 
        v59.isEligibleForLikelySpeakingBubbles, 
        l_isLikelySpeakingUser_0
    });
    local v110 = v3.useCallback(function() --[[ Line: 284 ]]
        -- upvalues: v71 (copy), v19 (ref), v107 (copy), v106 (copy)
        local l_v71_0 = v71;
        local v109 = not v19.ShowLikelySpeakingBubbles or not v107();
        return l_v71_0.TailVisible and not v106() and v109;
    end, {
        v71, 
        v59.voiceEnabled, 
        v59.userId, 
        l_useState_0, 
        v79, 
        l_selfViewListenerChanged_0, 
        v59.isBubbleChatEnabled, 
        l_chatSettings_0, 
        l_VRService_0.VREnabled, 
        v19.ShowLikelySpeakingBubbles, 
        v81, 
        v59.isEligibleForLikelySpeakingBubbles, 
        l_isLikelySpeakingUser_0
    });
    local v112 = v3.useCallback(function() --[[ Line: 306 ]]
        -- upvalues: v81 (copy), v94 (copy), v76 (copy), v75 (copy)
        if not v81 and v94.current ~= "Talking" then
            local l_v76_0 = v76;
            task.delay(1, function() --[[ Line: 311 ]]
                -- upvalues: v76 (ref), l_v76_0 (copy), v75 (ref)
                if v76 == l_v76_0 then
                    v75(true);
                end;
            end);
        end;
    end, {
        v59.userId, 
        v94.current, 
        v76, 
        v81
    });
    local v131 = v3.useCallback(function(v113) --[[ Line: 320 ]]
        -- upvalues: v29 (ref), v59 (copy), v93 (copy), v92 (copy), v27 (ref), l_CurrentCamera_0 (ref), v100 (copy), v71 (copy), v19 (ref), v101 (copy), v25 (ref), v28 (ref), v69 (copy), v67 (copy), v83 (ref), v68 (copy), v70 (copy), v107 (copy), v84 (ref), v105 (copy), v91 (copy), v90 (copy), v5 (ref), v34 (ref), v26 (ref), l_Workspace_0 (ref), v79 (copy), v80 (copy), v52 (ref), l_chatSettings_0 (copy)
        if v29() and v59.billboardUpdateFrequency > 0 then
            v93.current = v93.current + v113;
            if v93.current < v59.billboardUpdateFrequency then
                return;
            else
                v93.current = 0;
            end;
        elseif v92.current ~= nil then
            if v92.current < v27 then
                local l_v92_0 = v92;
                l_v92_0.current = l_v92_0.current + 1;
                return;
            else
                v92.current = 0;
            end;
        end;
        if l_CurrentCamera_0 and v100 then
            local v115 = if v100:IsA("Attachment") then v100.WorldPosition else v100.Position;
            local l_Magnitude_0 = (l_CurrentCamera_0.CFrame.Position - v115).Magnitude;
            local v117 = l_Magnitude_0 < v71.MaxDistance;
            local v118 = l_Magnitude_0 < v71.MinimizeDistance;
            local v119 = false;
            local l_ShowLikelySpeakingBubbles_0 = v19.ShowLikelySpeakingBubbles;
            if l_ShowLikelySpeakingBubbles_0 then
                local v121 = nil;
                if v101 then
                    v121 = if v101:IsA("Attachment") then v101.WorldPosition else v101.Position;
                end;
                local l_v121_0 = v121;
                local v123 = l_CurrentCamera_0 and l_CurrentCamera_0.CFrame.Position;
                local v124 = if not (not v25 and l_v121_0) and v115 and v123 then (v115 - v123).Magnitude else if v115 and l_v121_0 then (v115 - l_v121_0).Magnitude else nil;
                if v124 ~= nil and l_ShowLikelySpeakingBubbles_0 then
                    v119 = v124 < v28;
                end;
            end;
            if v118 ~= v69 or v117 ~= v67 or l_ShowLikelySpeakingBubbles_0 and v119 ~= v83 then
                v68(v117);
                v70(v118);
                if l_ShowLikelySpeakingBubbles_0 and v107() then
                    v84(v119);
                end;
            end;
        end;
        local l_v105_0 = v105;
        if math.abs(l_v105_0 - v91.current) > 0.5 then
            v91.current = l_v105_0;
            v90.current:setGoal(v5.spring(l_v105_0, v34));
        end;
        local v126 = v26 and l_Workspace_0:GetServerTimeNow() * 1000 or DateTime.now().UnixTimestampMillis;
        local v127 = v71.BubbleDuration * 1000;
        for _, v129 in ipairs(v79) do
            if v127 <= v126 - v129.timestamp.UnixTimestampMillis then
                v80(function(v130) --[[ Line: 391 ]]
                    -- upvalues: v52 (ref), v127 (copy), l_chatSettings_0 (ref)
                    return v52(v130, v127, l_chatSettings_0.MaxBubbles);
                end);
                return;
            end;
        end;
    end, {
        v79, 
        l_adornee_0, 
        v71, 
        l_localAdornee_0, 
        l_chatSettings_0, 
        v67, 
        v69, 
        v59.billboardUpdateFrequency
    });
    local v132 = v3.useRef(v131);
    local v133 = if l_LocalPlayer_0 then v81 and "MicDark" or "SpeakerDark" else "SpeakerDark";
    local function v134() --[[ Line: 411 ]]
        -- upvalues: v3 (ref), v14 (ref), v59 (copy), v98 (copy), v133 (copy)
        return v3.createElement(v14, {
            userId = v59.userId, 
            getIcon = v59.getIconVoiceIndicator, 
            onClicked = v98, 
            iconStyle = v133
        });
    end;
    v3.useEffect(function() --[[ Line: 421 ]]
        -- upvalues: v94 (copy), v59 (copy), v78 (copy), v75 (copy)
        if v94.current ~= v59.voiceState then
            v78(function(v135) --[[ Line: 423 ]]
                return (v135 or 0) + 1;
            end);
            v75(false);
            v94.current = v59.voiceState;
        end;
    end, {
        v59.voiceState
    });
    v3.useEffect(function() --[[ Line: 433 ]]
        -- upvalues: v71 (copy), v52 (ref), l_messages_0 (copy), v61 (copy), l_chatSettings_0 (copy), v72 (copy), v80 (copy)
        local v136 = v71.BubbleDuration * 1000;
        local v137 = v52(l_messages_0, v136, v71.MaxBubbles);
        if (v61 and l_chatSettings_0) ~= nil then
            v72(v61 and l_chatSettings_0);
        end;
        v80(v137);
    end, {
        v71, 
        l_messages_0, 
        v61, 
        l_chatSettings_0
    });
    v3.useEffect(function() --[[ Line: 442 ]]
        -- upvalues: v5 (ref), v90 (copy), v89 (copy), v105 (copy), v91 (copy), v19 (ref), v59 (copy), v77 (copy)
        local v138 = v5.createSingleMotor(0);
        v90.current = v138;
        v138:onStep(function(v139) --[[ Line: 445 ]]
            -- upvalues: v89 (ref)
            v89((Vector3.new(0, v139, 0)));
        end);
        local l_v105_1 = v105;
        v91.current = l_v105_1;
        v90.current:setGoal(v5.instant(l_v105_1));
        local v141 = nil;
        if v19.AvatarChatEnabled and v59.selfViewListenerChanged then
            local l_selfViewVisibilityUpdatedSignal_0 = v59.selfViewListenerChanged.selfViewVisibilityUpdatedSignal;
            local l_getSelfViewVisibility_0 = v59.selfViewListenerChanged.getSelfViewVisibility;
            v141 = l_selfViewVisibilityUpdatedSignal_0:connect(function() --[[ Line: 458 ]] --[[ Name: callback ]]
                -- upvalues: v77 (ref), l_getSelfViewVisibility_0 (copy)
                v77(l_getSelfViewVisibility_0());
            end);
        end;
        return function() --[[ Line: 464 ]]
            -- upvalues: v141 (ref), v90 (ref)
            if v141 then
                v141:disconnect();
                v141 = nil;
            end;
            if v90.current then
                v90.current:destroy();
            end;
        end;
    end, {
        v59.selfViewListenerChanged, 
        v105
    });
    if v31 then
        v3.useEffect(function() --[[ Line: 476 ]]
            -- upvalues: v132 (copy), v131 (copy)
            v132.current = v131;
        end, {
            v131
        });
    end;
    v3.useEffect(function() --[[ Line: 483 ]]
        -- upvalues: v8 (ref), v59 (copy), l_RunService_0 (ref), v132 (copy), v112 (copy)
        v8:trace("Mounting billboards for {}", v59.userId);
        local v145 = l_RunService_0.PostSimulation:Connect(function(v144) --[[ Line: 487 ]]
            -- upvalues: v132 (ref)
            v132.current(v144);
        end);
        v112();
        return function() --[[ Line: 493 ]]
            -- upvalues: v8 (ref), v59 (ref), v145 (copy)
            v8:trace("Unmounting billboards for {}", v59.userId);
            if v145 and v145.Connected then
                v145:Disconnect();
            end;
        end;
    end, if v31 then {} else {
        v79, 
        l_adornee_0, 
        v71, 
        l_localAdornee_0, 
        l_chatSettings_0, 
        v67, 
        v69, 
        v59.billboardUpdateFrequency
    });
    v3.useEffect(function() --[[ Line: 515 ]]
        -- upvalues: v79 (copy), v67 (copy), v95 (copy), v87 (copy)
        if (not v79 or #v79 == 0) and not v67 then
            v95();
        end;
        if v79 and #v79 > 0 then
            v87.current = false;
        end;
    end, {
        v79, 
        v67
    });
    v3.useEffect(function() --[[ Line: 527 ]]
        -- upvalues: v112 (copy)
        v112();
    end, {
        v76
    });
    if not v100 then
        v8:trace("No adornee for {}", v59.userId);
        return;
    elseif not v67 then
        return;
    else
        local v146 = {};
        local v147 = v79 and #v79 > 0;
        local v148 = v59.voiceEnabled and not l_selfViewListenerChanged_0;
        if v19.AvatarChatEnabled and v81 then
            v148 = v148 and not l_useState_0;
        end;
        if v19.ChromeEnabled and v81 then
            v148 = false;
        end;
        local v149 = v148 and not v19.AvatarChatEnabled;
        if v30() then
            v149 = v148 and not v19.AvatarChatEnabled and not v19.ChromeEnabled;
        end;
        local v150 = if v148 then v134 else nil;
        local l_v33_0 = v33;
        if v19.AvatarChatEnabled or v19.ChromeEnabled then
            if v106() then
                local v152 = {
                    chatSettings = l_chatSettings_0, 
                    isInsideMaximizeDistance = v69, 
                    LayoutOrder = 2, 
                    isLocalPlayer = v81, 
                    userId = v59.userId, 
                    getIcon = v59.getIconVoiceIndicator, 
                    hasCameraPermissions = v59.hasCameraPermissions, 
                    hasMicPermissions = v59.hasMicPermissions, 
                    onClickedVoiceIndicator = v98, 
                    onClickedCameraIndicator = v59.onClickedCameraIndicator, 
                    voiceEnabled = v59.voiceEnabled, 
                    displayCameraDeniedToast = v59.displayCameraDeniedToast, 
                    isCamEnabledForUserAndPlace = v59.isCamEnabledForUserAndPlace, 
                    setCameraPermissionStateFromControl = v59.setCameraPermissionStateFromControl, 
                    getPermissions = v59.getPermissions, 
                    isCameraOnlyUser = v59.isCameraOnlyUser
                };
                v146.PlayerButtons = v3.createElement(v22, v152);
                v146.listLayout = v3.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    VerticalAlignment = Enum.VerticalAlignment.Bottom, 
                    Padding = UDim.new(0, 8)
                });
                v146.padding = v3.createElement("UIPadding", {
                    PaddingBottom = UDim.new(0, 8)
                });
            elseif v19.ShowLikelySpeakingBubbles and v107() and v83 then
                local v153 = {
                    chatSettings = l_chatSettings_0, 
                    isInsideMaximizeDistance = v69, 
                    LayoutOrder = 2, 
                    onActivated = v59.onClickedLikelySpeakingBubble
                };
                v146.LikelySpeakingBubble = v3.createElement(v18, v153);
                v146.listLayout = v3.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    VerticalAlignment = Enum.VerticalAlignment.Bottom, 
                    Padding = UDim.new(0, 8)
                });
                v146.padding = v3.createElement("UIPadding", {
                    PaddingBottom = UDim.new(0, 8)
                });
            end;
        elseif v148 and v147 == false then
            v146.VoiceBubble = v3.createElement(v15, {
                chatSettings = v71, 
                userId = v59.userId, 
                renderInsert = v150, 
                insertSize = l_v33_0, 
                isDistant = not v69, 
                clientSettings = l_clientSettings_0
            });
        end;
        local v154 = v110();
        if v69 then
            v146.BubbleChatList = v3.createElement(v16, {
                userId = v59.userId, 
                isVisible = v69, 
                onLastBubbleFadeOut = v95, 
                chatSettings = v71, 
                renderFirstInsert = if v149 then v150 else nil, 
                insertSize = l_v33_0, 
                messages = v79, 
                clientSettings = l_clientSettings_0, 
                isTextChatServiceOn = v59.isTextChatServiceOn, 
                showCaret = v154
            });
        elseif v147 then
            v146.DistantBubble = v3.createElement(v17, {
                fadingOut = not v79 or #v79 == 0, 
                onFadeOut = v95, 
                chatSettings = v71, 
                renderInsert = if v149 then v150 else nil, 
                insertSize = l_v33_0, 
                clientSettings = l_clientSettings_0, 
                showCaret = v154
            });
        end;
        local v155 = v81 and v71.LocalPlayerStudsOffset or Vector3.new(0, 1, 0.10000000149011612, 0);
        local v156 = v19.ShowLikelySpeakingBubbles and v107();
        return v3.createElement("BillboardGui", {
            Adornee = v100, 
            Active = if v19.AvatarChatEnabled then v106() or v156 else v148 or v156, 
            Size = UDim2.fromOffset(500, 200), 
            SizeOffset = Vector2.new(0, 0.5), 
            StudsOffset = v155 + Vector3.new(0, v71.VerticalStudsOffset, 0), 
            StudsOffsetWorldSpace = v88, 
            ResetOnSpawn = false
        }, v146);
    end;
end;
return v7.connect(function(v158, v159) --[[ Line: 686 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: v58 (copy), v21 (copy), v19 (copy)
    local v160 = v158.Messages.messagesBySenderId[v159.userId];
    local v161 = if v160 ~= nil then v160[#v160] else nil;
    local v162 = v58 or "";
    local v163 = nil;
    v163 = if v159.isTextChatServiceOn then v158.BubbleChatSettings else v21(v158.LegacyBubbleChatSettings, v161);
    local v164 = if v19.ShowLikelySpeakingBubbles then v158.Voice.likelySpeakingUsers[v159.userId] else false;
    return {
        messages = v160, 
        chatSettings = v163, 
        adornee = v158.Adornees[v159.userId] or v159.partOrModel, 
        clientSettings = v158.ClientSettings, 
        localAdornee = v158.Adornees[v162], 
        isLikelySpeakingUser = v164, 
        isVoiceUIVisible = v158.Voice.isVoiceUIVisible
    };
end)(v3.memo(v157));