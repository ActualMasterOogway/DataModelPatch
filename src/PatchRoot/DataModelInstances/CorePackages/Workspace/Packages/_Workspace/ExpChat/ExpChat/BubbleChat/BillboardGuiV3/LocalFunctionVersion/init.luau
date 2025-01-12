local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.ExpChatShared);
local v3 = require(l_Parent_0.React);
local l_List_0 = require(l_Parent_0.llama).List;
local v5 = require(l_Parent_0.Otter);
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local v7 = require(l_Parent_0.SharedFlags);
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
local l_GetFFlagEnableShowVoiceUI_0 = v7.GetFFlagEnableShowVoiceUI;
local v33 = Vector2.new(28, 28);
local v34 = {
    dampingRatio = 1, 
    frequency = 4
};
local l_CurrentCamera_0 = workspace.CurrentCamera;
workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function() --[[ Line: 84 ]]
    -- upvalues: l_CurrentCamera_0 (ref)
    l_CurrentCamera_0 = workspace.CurrentCamera;
end);
local function _(v36, v37) --[[ Line: 88 ]] --[[ Name: getEasierUnmutingDistance ]]
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
local function v43(v40, v41) --[[ Line: 104 ]] --[[ Name: getAdorneeInstance ]]
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
local function v52(v44, v45, v46) --[[ Line: 120 ]] --[[ Name: getRecentMessages ]]
    -- upvalues: v26 (copy), l_Workspace_0 (copy), l_List_0 (copy)
    local v47 = v26 and l_Workspace_0:GetServerTimeNow() * 1000 or DateTime.now().UnixTimestampMillis;
    local v48 = v44 or {};
    return l_List_0.filter(v48, function(v49, v50) --[[ Line: 125 ]]
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
local function _(v53) --[[ Line: 135 ]] --[[ Name: getInitialSelfViewOpenState ]]
    -- upvalues: v19 (copy)
    local v54 = nil;
    local v55 = v53 and v53.getSelfViewVisibility;
    if v19.AvatarChatEnabled and v55 then
        v54 = v55();
    end;
    return v54;
end;
local function v58(v57) --[[ Line: 144 ]] --[[ Name: selectClientSettings ]]
    return v57.ClientSettings;
end;
local function v60(v59) --[[ Line: 148 ]] --[[ Name: selectIsVoiceUIVisible ]]
    return v59.Voice.isVoiceUIVisible;
end;
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local v62 = l_LocalPlayer_0 and tostring(l_LocalPlayer_0.UserId);
local function v167(v63) --[[ Line: 155 ]] --[[ Name: BubbleChatBillboard ]]
    -- upvalues: l_useSelector_0 (copy), v3 (copy), v21 (copy), v58 (copy), v19 (copy), v60 (copy), l_LocalPlayer_0 (copy), v62 (copy), v43 (copy), l_GetFFlagEnableShowVoiceUI_0 (copy), l_VRService_0 (copy), v29 (copy), v27 (copy), l_CurrentCamera_0 (ref), v25 (copy), v28 (copy), v5 (copy), v34 (copy), v26 (copy), l_Workspace_0 (copy), v52 (copy), v14 (copy), v31 (copy), v8 (copy), l_RunService_0 (copy), v30 (copy), v33 (copy), v22 (copy), v18 (copy), v15 (copy), v16 (copy), v17 (copy)
    local v65 = l_useSelector_0(function(v64) --[[ Line: 157 ]]
        -- upvalues: v63 (copy)
        return v64.Messages.messagesBySenderId[v63.userId];
    end);
    local v66 = v3.useMemo(function() --[[ Line: 160 ]]
        -- upvalues: v65 (copy)
        if v65 ~= nil then
            return v65[#v65];
        else
            return nil;
        end;
    end, {
        v65
    });
    local v68 = l_useSelector_0(function(v67) --[[ Line: 164 ]]
        -- upvalues: v63 (copy), v21 (ref), v66 (copy)
        if v63.isTextChatServiceOn then
            return v67.BubbleChatSettings;
        else
            return v21(v67.LegacyBubbleChatSettings, v66);
        end;
    end);
    local v70 = l_useSelector_0(function(v69) --[[ Line: 171 ]]
        -- upvalues: v63 (copy)
        return v69.Adornees[v63.userId] or v63.partOrModel;
    end);
    local v71 = l_useSelector_0(v58);
    local v73 = l_useSelector_0(function(v72) --[[ Line: 176 ]]
        -- upvalues: v19 (ref), v63 (copy)
        if v19.ShowLikelySpeakingBubbles then
            return v72.Voice.likelySpeakingUsers[v63.userId];
        else
            return false;
        end;
    end);
    local v74 = l_useSelector_0(v60);
    local v75, v76 = v3.useState(false);
    local v77, v78 = v3.useState(false);
    local v79, v80 = v3.useState(v68);
    local l_useState_0 = v3.useState;
    local l_selfViewListenerChanged_0 = v63.selfViewListenerChanged;
    local v83 = nil;
    local v84 = l_selfViewListenerChanged_0 and l_selfViewListenerChanged_0.getSelfViewVisibility;
    if v19.AvatarChatEnabled and v84 then
        v83 = v84();
    end;
    local v85;
    l_useState_0, v85 = l_useState_0(v83);
    l_selfViewListenerChanged_0, v83 = v3.useState(false);
    local v86;
    v84, v86 = v3.useState(0);
    local v87, v88 = v3.useState({});
    local v89 = if l_LocalPlayer_0 then v63.userId == v62 else false;
    local v92 = l_useSelector_0(function(v90) --[[ Line: 193 ]]
        -- upvalues: v62 (ref)
        local v91 = v62 or "";
        return v90.Adornees[v91];
    end);
    local v93 = nil;
    local v94 = nil;
    if v19.ShowLikelySpeakingBubbles then
        local v95, v96 = v3.useState(false);
        v93 = v95;
        v94 = v96;
    end;
    local v97 = v3.useRef(false);
    local v98, v99 = v3.useBinding(Vector3.zero);
    local v100 = v3.useRef(nil);
    local v101 = v3.useRef(0);
    local v102 = v3.useRef(0);
    local v103 = v3.useRef(0);
    local v104 = v3.useRef(nil);
    local v105 = v3.useCallback(function() --[[ Line: 211 ]]
        -- upvalues: v63 (copy), v97 (copy)
        if v63.onFadeOut and not v97.current then
            v97.current = true;
            v63.onFadeOut(v63.userId);
        end;
    end, {
        v63.onFadeOut, 
        v63.userId, 
        v97.current
    });
    local v108 = v3.useCallback(function(v106, v107) --[[ Line: 219 ]]
        -- upvalues: v63 (copy)
        return v63.onClickedVoiceIndicator(v106, v107, "bubblechat");
    end, {
        v63.onClickedVoiceIndicator
    });
    local l_AdorneeName_0 = v79.AdorneeName;
    local v110 = v3.useMemo(function() --[[ Line: 225 ]]
        -- upvalues: v43 (ref), v70 (copy), l_AdorneeName_0 (copy)
        return (v43(v70, l_AdorneeName_0));
    end, {
        v70, 
        l_AdorneeName_0
    });
    local v111 = v3.useMemo(function() --[[ Line: 228 ]]
        -- upvalues: v43 (ref), v92 (copy), l_AdorneeName_0 (copy)
        return (v43(v92, l_AdorneeName_0));
    end, {
        v92, 
        l_AdorneeName_0
    });
    local v115 = v3.useMemo(function() --[[ Line: 231 ]]
        -- upvalues: v70 (copy), v110 (copy)
        if v70 and v70:IsA("Model") then
            local l_v70_BoundingBox_0, v113 = v70:GetBoundingBox();
            if not v110 then
                return v113.Y / 2;
            elseif v110:IsA("BasePart") then
                local v114 = l_v70_BoundingBox_0:PointToObjectSpace(v110.Position);
                return v113.Y / 2 - v114.Y;
            else
                return 0;
            end;
        elseif v70 and v70:IsA("BasePart") then
            return v70.Size.Y / 2;
        else
            return 0;
        end;
    end, {
        v70, 
        v110
    });
    local v116 = v3.useCallback(function() --[[ Line: 250 ]]
        -- upvalues: l_GetFFlagEnableShowVoiceUI_0 (ref), v63 (copy), v74 (copy), v89 (copy), l_VRService_0 (ref), v19 (ref), l_useState_0 (copy), l_selfViewListenerChanged_0 (copy)
        if l_GetFFlagEnableShowVoiceUI_0() then
            if not v63.voiceEnabled or not v74 then
                return false;
            end;
        elseif not v63.voiceEnabled then
            return false;
        end;
        if v89 then
            if l_VRService_0.VREnabled or v19.ChromeEnabled then
                return false;
            elseif not l_useState_0 then
                return true;
            else
                return false;
            end;
        else
            return v63.voiceEnabled and not l_selfViewListenerChanged_0;
        end;
    end, {
        v63.voiceEnabled, 
        v63.userId, 
        l_useState_0, 
        v87, 
        l_selfViewListenerChanged_0, 
        v63.isBubbleChatEnabled, 
        v79, 
        v68, 
        l_VRService_0.VREnabled, 
        v74
    });
    local v117 = v3.useCallback(function() --[[ Line: 292 ]]
        -- upvalues: v89 (copy), v63 (copy), v73 (copy)
        return not v89 and v63.isEligibleForLikelySpeakingBubbles and v73;
    end, {
        v89, 
        v63.isEligibleForLikelySpeakingBubbles, 
        v73
    });
    local v120 = v3.useCallback(function() --[[ Line: 300 ]]
        -- upvalues: v79 (copy), v19 (ref), v117 (copy), v116 (copy)
        local l_v79_0 = v79;
        local v119 = not v19.ShowLikelySpeakingBubbles or not v117();
        return l_v79_0.TailVisible and not v116() and v119;
    end, {
        v79, 
        v63.voiceEnabled, 
        v63.userId, 
        l_useState_0, 
        v87, 
        l_selfViewListenerChanged_0, 
        v63.isBubbleChatEnabled, 
        v68, 
        l_VRService_0.VREnabled, 
        v19.ShowLikelySpeakingBubbles, 
        v89, 
        v63.isEligibleForLikelySpeakingBubbles, 
        v73
    });
    local v122 = v3.useCallback(function() --[[ Line: 322 ]]
        -- upvalues: v89 (copy), v104 (copy), v84 (copy), v83 (copy)
        if not v89 and v104.current ~= "Talking" then
            local l_v84_0 = v84;
            task.delay(1, function() --[[ Line: 327 ]]
                -- upvalues: v84 (ref), l_v84_0 (copy), v83 (ref)
                if v84 == l_v84_0 then
                    v83(true);
                end;
            end);
        end;
    end, {
        v63.userId, 
        v104.current, 
        v84, 
        v89
    });
    local v141 = v3.useCallback(function(v123) --[[ Line: 336 ]]
        -- upvalues: v29 (ref), v63 (copy), v103 (copy), v102 (copy), v27 (ref), l_CurrentCamera_0 (ref), v110 (copy), v79 (copy), v19 (ref), v111 (copy), v25 (ref), v28 (ref), v77 (copy), v75 (copy), v93 (ref), v76 (copy), v78 (copy), v117 (copy), v94 (ref), v115 (copy), v101 (copy), v100 (copy), v5 (ref), v34 (ref), v26 (ref), l_Workspace_0 (ref), v87 (copy), v88 (copy), v52 (ref), v68 (copy)
        if v29() and v63.billboardUpdateFrequency > 0 then
            v103.current = v103.current + v123;
            if v103.current < v63.billboardUpdateFrequency then
                return;
            else
                v103.current = 0;
            end;
        elseif v102.current ~= nil then
            if v102.current < v27 then
                local l_v102_0 = v102;
                l_v102_0.current = l_v102_0.current + 1;
                return;
            else
                v102.current = 0;
            end;
        end;
        if l_CurrentCamera_0 and v110 then
            local v125 = if v110:IsA("Attachment") then v110.WorldPosition else v110.Position;
            local l_Magnitude_0 = (l_CurrentCamera_0.CFrame.Position - v125).Magnitude;
            local v127 = l_Magnitude_0 < v79.MaxDistance;
            local v128 = l_Magnitude_0 < v79.MinimizeDistance;
            local v129 = false;
            local l_ShowLikelySpeakingBubbles_0 = v19.ShowLikelySpeakingBubbles;
            if l_ShowLikelySpeakingBubbles_0 then
                local v131 = nil;
                if v111 then
                    v131 = if v111:IsA("Attachment") then v111.WorldPosition else v111.Position;
                end;
                local l_v131_0 = v131;
                local v133 = l_CurrentCamera_0 and l_CurrentCamera_0.CFrame.Position;
                local v134 = if not (not v25 and l_v131_0) and v125 and v133 then (v125 - v133).Magnitude else if v125 and l_v131_0 then (v125 - l_v131_0).Magnitude else nil;
                if v134 ~= nil and l_ShowLikelySpeakingBubbles_0 then
                    v129 = v134 < v28;
                end;
            end;
            if v128 ~= v77 or v127 ~= v75 or l_ShowLikelySpeakingBubbles_0 and v129 ~= v93 then
                v76(v127);
                v78(v128);
                if l_ShowLikelySpeakingBubbles_0 and v117() then
                    v94(v129);
                end;
            end;
        end;
        local l_v115_0 = v115;
        if math.abs(l_v115_0 - v101.current) > 0.5 then
            v101.current = l_v115_0;
            v100.current:setGoal(v5.spring(l_v115_0, v34));
        end;
        local v136 = v26 and l_Workspace_0:GetServerTimeNow() * 1000 or DateTime.now().UnixTimestampMillis;
        local v137 = v79.BubbleDuration * 1000;
        for _, v139 in ipairs(v87) do
            if v137 <= v136 - v139.timestamp.UnixTimestampMillis then
                v88(function(v140) --[[ Line: 407 ]]
                    -- upvalues: v52 (ref), v137 (copy), v68 (ref)
                    return v52(v140, v137, v68.MaxBubbles);
                end);
                return;
            end;
        end;
    end, {
        v87, 
        v70, 
        v79, 
        v92, 
        v68, 
        v75, 
        v77, 
        v63.billboardUpdateFrequency
    });
    local v142 = v3.useRef(v141);
    local v143 = if l_LocalPlayer_0 then v89 and "MicDark" or "SpeakerDark" else "SpeakerDark";
    local function v144() --[[ Line: 427 ]]
        -- upvalues: v3 (ref), v14 (ref), v63 (copy), v108 (copy), v143 (copy)
        return v3.createElement(v14, {
            userId = v63.userId, 
            getIcon = v63.getIconVoiceIndicator, 
            onClicked = v108, 
            iconStyle = v143
        });
    end;
    v3.useEffect(function() --[[ Line: 437 ]]
        -- upvalues: v104 (copy), v63 (copy), v86 (copy), v83 (copy)
        if v104.current ~= v63.voiceState then
            v86(function(v145) --[[ Line: 439 ]]
                return (v145 or 0) + 1;
            end);
            v83(false);
            v104.current = v63.voiceState;
        end;
    end, {
        v63.voiceState
    });
    v3.useEffect(function() --[[ Line: 449 ]]
        -- upvalues: v79 (copy), v52 (ref), v65 (copy), v66 (copy), v68 (copy), v80 (copy), v88 (copy)
        local v146 = v79.BubbleDuration * 1000;
        local v147 = v52(v65, v146, v79.MaxBubbles);
        if (v66 and v68) ~= nil then
            v80(v66 and v68);
        end;
        v88(v147);
    end, {
        v79, 
        v65, 
        v66, 
        v68
    });
    v3.useEffect(function() --[[ Line: 458 ]]
        -- upvalues: v5 (ref), v100 (copy), v99 (copy), v115 (copy), v101 (copy), v19 (ref), v63 (copy), v85 (copy)
        local v148 = v5.createSingleMotor(0);
        v100.current = v148;
        v148:onStep(function(v149) --[[ Line: 461 ]]
            -- upvalues: v99 (ref)
            v99((Vector3.new(0, v149, 0)));
        end);
        local l_v115_1 = v115;
        v101.current = l_v115_1;
        v100.current:setGoal(v5.instant(l_v115_1));
        local v151 = nil;
        if v19.AvatarChatEnabled and v63.selfViewListenerChanged then
            local l_selfViewVisibilityUpdatedSignal_0 = v63.selfViewListenerChanged.selfViewVisibilityUpdatedSignal;
            local l_getSelfViewVisibility_0 = v63.selfViewListenerChanged.getSelfViewVisibility;
            v151 = l_selfViewVisibilityUpdatedSignal_0:connect(function() --[[ Line: 474 ]] --[[ Name: callback ]]
                -- upvalues: v85 (ref), l_getSelfViewVisibility_0 (copy)
                v85(l_getSelfViewVisibility_0());
            end);
        end;
        return function() --[[ Line: 480 ]]
            -- upvalues: v151 (ref), v100 (ref)
            if v151 then
                v151:disconnect();
                v151 = nil;
            end;
            if v100.current then
                v100.current:destroy();
            end;
        end;
    end, {
        v63.selfViewListenerChanged, 
        v115
    });
    if v31 then
        v3.useEffect(function() --[[ Line: 492 ]]
            -- upvalues: v142 (copy), v141 (copy)
            v142.current = v141;
        end, {
            v141
        });
    end;
    v3.useEffect(function() --[[ Line: 499 ]]
        -- upvalues: v8 (ref), v63 (copy), l_RunService_0 (ref), v142 (copy), v122 (copy)
        v8:trace("Mounting billboards for {}", v63.userId);
        local v155 = l_RunService_0.PostSimulation:Connect(function(v154) --[[ Line: 503 ]]
            -- upvalues: v142 (ref)
            v142.current(v154);
        end);
        v122();
        return function() --[[ Line: 509 ]]
            -- upvalues: v8 (ref), v63 (ref), v155 (copy)
            v8:trace("Unmounting billboards for {}", v63.userId);
            if v155 and v155.Connected then
                v155:Disconnect();
            end;
        end;
    end, if v31 then {} else {
        v87, 
        v70, 
        v79, 
        v92, 
        v68, 
        v75, 
        v77, 
        v63.billboardUpdateFrequency
    });
    v3.useEffect(function() --[[ Line: 531 ]]
        -- upvalues: v87 (copy), v75 (copy), v105 (copy), v97 (copy)
        if (not v87 or #v87 == 0) and not v75 then
            v105();
        end;
        if v87 and #v87 > 0 then
            v97.current = false;
        end;
    end, {
        v87, 
        v75
    });
    v3.useEffect(function() --[[ Line: 543 ]]
        -- upvalues: v122 (copy)
        v122();
    end, {
        v84
    });
    if not v110 then
        v8:trace("No adornee for {}", v63.userId);
        return;
    elseif not v75 then
        return;
    else
        local v156 = {};
        local v157 = v87 and #v87 > 0;
        local v158 = v63.voiceEnabled and not l_selfViewListenerChanged_0;
        if v19.AvatarChatEnabled and v89 then
            v158 = v158 and not l_useState_0;
        end;
        if v19.ChromeEnabled and v89 then
            v158 = false;
        end;
        local v159 = v158 and not v19.AvatarChatEnabled;
        if v30() then
            v159 = v158 and not v19.AvatarChatEnabled and not v19.ChromeEnabled;
        end;
        local v160 = if v158 then v144 else nil;
        local l_v33_0 = v33;
        if v19.AvatarChatEnabled or v19.ChromeEnabled then
            if v116() then
                local v162 = {
                    chatSettings = v68, 
                    isInsideMaximizeDistance = v77, 
                    LayoutOrder = 2, 
                    isLocalPlayer = v89, 
                    userId = v63.userId, 
                    getIcon = v63.getIconVoiceIndicator, 
                    hasCameraPermissions = v63.hasCameraPermissions, 
                    hasMicPermissions = v63.hasMicPermissions, 
                    onClickedVoiceIndicator = v108, 
                    onClickedCameraIndicator = v63.onClickedCameraIndicator, 
                    voiceEnabled = v63.voiceEnabled, 
                    displayCameraDeniedToast = v63.displayCameraDeniedToast, 
                    isCamEnabledForUserAndPlace = v63.isCamEnabledForUserAndPlace, 
                    setCameraPermissionStateFromControl = v63.setCameraPermissionStateFromControl, 
                    getPermissions = v63.getPermissions, 
                    isCameraOnlyUser = v63.isCameraOnlyUser
                };
                v156.PlayerButtons = v3.createElement(v22, v162);
                v156.listLayout = v3.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    VerticalAlignment = Enum.VerticalAlignment.Bottom, 
                    Padding = UDim.new(0, 8)
                });
                v156.padding = v3.createElement("UIPadding", {
                    PaddingBottom = UDim.new(0, 8)
                });
            elseif v19.ShowLikelySpeakingBubbles and v117() and v93 then
                local v163 = {
                    chatSettings = v68, 
                    isInsideMaximizeDistance = v77, 
                    LayoutOrder = 2, 
                    onActivated = v63.onClickedLikelySpeakingBubble
                };
                v156.LikelySpeakingBubble = v3.createElement(v18, v163);
                v156.listLayout = v3.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    VerticalAlignment = Enum.VerticalAlignment.Bottom, 
                    Padding = UDim.new(0, 8)
                });
                v156.padding = v3.createElement("UIPadding", {
                    PaddingBottom = UDim.new(0, 8)
                });
            end;
        elseif v158 and v157 == false then
            v156.VoiceBubble = v3.createElement(v15, {
                chatSettings = v79, 
                userId = v63.userId, 
                renderInsert = v160, 
                insertSize = l_v33_0, 
                isDistant = not v77, 
                clientSettings = v71
            });
        end;
        local v164 = v120();
        if v77 then
            v156.BubbleChatList = v3.createElement(v16, {
                userId = v63.userId, 
                isVisible = v77, 
                onLastBubbleFadeOut = v105, 
                chatSettings = v79, 
                renderFirstInsert = if v159 then v160 else nil, 
                insertSize = l_v33_0, 
                messages = v87, 
                clientSettings = v71, 
                isTextChatServiceOn = v63.isTextChatServiceOn, 
                showCaret = v164
            });
        elseif v157 then
            v156.DistantBubble = v3.createElement(v17, {
                fadingOut = not v87 or #v87 == 0, 
                onFadeOut = v105, 
                chatSettings = v79, 
                renderInsert = if v159 then v160 else nil, 
                insertSize = l_v33_0, 
                clientSettings = v71, 
                showCaret = v164
            });
        end;
        local v165 = v89 and v79.LocalPlayerStudsOffset or Vector3.new(0, 1, 0.10000000149011612, 0);
        local v166 = v19.ShowLikelySpeakingBubbles and v117();
        return v3.createElement("BillboardGui", {
            Adornee = v110, 
            Active = if v19.AvatarChatEnabled then v116() or v166 else v158 or v166, 
            Size = UDim2.fromOffset(500, 200), 
            SizeOffset = Vector2.new(0, 0.5), 
            StudsOffset = v165 + Vector3.new(0, v79.VerticalStudsOffset, 0), 
            StudsOffsetWorldSpace = v98, 
            ResetOnSpawn = false
        }, v156);
    end;
end;
return v3.memo(v167);