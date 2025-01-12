local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.ExpChatShared);
local v3 = require(l_Parent_0.React);
local l_List_0 = require(l_Parent_0.llama).List;
local v5 = require(l_Parent_0.Otter);
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local v7 = require(l_Parent_0.SharedFlags);
local v8 = v2.Logger:new("ExpChat/" .. script.Name .. "V2");
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
local v25 = require(l_script_FirstAncestor_0.IXPServiceWrapper);
local v26 = game:DefineFastFlag("EasierUnmutingTCS6", false);
local v27 = game:DefineFastFlag("EasierUnmutingBasedOnCameraTCS", false);
local v28 = game:DefineFastFlag("EasierUnmutingHideIfMutedTCS", false);
local v29 = game:DefineFastInt("EasierUnmutingDisplayDistanceTCS", 20);
local v30 = game:DefineFastString("EasierUnmutingIXPLayerNameTCS", "Voice.UserAgency");
local v31 = game:DefineFastString("EasierUnmutingIXPLayerValueTCS", "VoiceUserAgencyEnabled");
local v32 = game:DefineFastFlag("FixTimestampNowComparisonForChatMessages", false);
local v33 = game:DefineFastInt("ExperienceChatHeartbeatIncrement", 5);
local v34 = require(l_script_FirstAncestor_0.Flags.GetFFlagShowSpeakerIconWithChatBubblesTCS);
local v35 = game:DefineFastInt("LikelySpeakingBubbleDisplayDistance", 50);
local v36 = require(l_script_FirstAncestor_0.Flags.getFFlagEnableBillboardUpdateFrequency);
local v37 = game:DefineFastFlag("InitializeHeartbeatConnOnce", false);
local l_GetFFlagEnableShowVoiceUI_0 = v7.GetFFlagEnableShowVoiceUI;
local v39 = require(l_script_FirstAncestor_0.Flags.getFFlagEnableExpChatVoiceUIImprovements);
local v40 = Vector2.new(28, 28);
local v41 = {
    dampingRatio = 1, 
    frequency = 4
};
getEasierUnmutingDistance = function(v42, v43) --[[ Line: 92 ]] --[[ Name: getEasierUnmutingDistance ]]
    -- upvalues: l_Workspace_0 (copy), v27 (copy)
    local v44 = l_Workspace_0.CurrentCamera and l_Workspace_0.CurrentCamera.CFrame.Position;
    if (v27 or not v43) and v42 and v44 then
        return (v42 - v44).Magnitude;
    elseif v42 and v43 then
        return (v42 - v43).Magnitude;
    else
        return nil;
    end;
end;
getAdorneeInstance = function(v45, v46) --[[ Line: 108 ]] --[[ Name: getAdorneeInstance ]]
    if not v45 then
        return nil;
    else
        if v45:IsA("Model") then
            local v47 = v45:FindFirstChild(v46, true) or v45.PrimaryPart;
            if not v47 or v47:IsA("BasePart") or v47:IsA("Attachment") then
                return v47;
            end;
        elseif v45:IsA("BasePart") or v45:IsA("Attachment") then
            return v45;
        end;
        return nil;
    end;
end;
local function v56(v48, v49, v50) --[[ Line: 124 ]] --[[ Name: getRecentMessages ]]
    -- upvalues: v32 (copy), l_Workspace_0 (copy), l_List_0 (copy)
    local v51 = v32 and l_Workspace_0:GetServerTimeNow() * 1000 or DateTime.now().UnixTimestampMillis;
    local v52 = v48 or {};
    return l_List_0.filter(v52, function(v53, v54) --[[ Line: 129 ]]
        -- upvalues: v48 (copy), v50 (copy), v51 (copy), v49 (copy)
        if v53.isVisibleInBubbleChat then
            local v55 = false;
            if #v48 - v50 < v54 then
                v55 = v51 - v53.timestamp.UnixTimestampMillis < v49;
            end;
            return v55;
        else
            return false;
        end;
    end);
end;
local function _(v57) --[[ Line: 139 ]] --[[ Name: getInitialSelfViewOpenState ]]
    -- upvalues: v19 (copy)
    local v58 = nil;
    local v59 = v57 and v57.getSelfViewVisibility;
    if v19.AvatarChatEnabled and v59 then
        v58 = v59();
    end;
    return v58;
end;
return v3.memo(function(v61) --[[ Line: 148 ]] --[[ Name: BubbleChatBillboard ]]
    -- upvalues: v39 (copy), l_useSelector_0 (copy), v3 (copy), l_List_0 (copy), v21 (copy), v19 (copy), l_Players_0 (copy), v26 (copy), v28 (copy), l_GetFFlagEnableShowVoiceUI_0 (copy), l_VRService_0 (copy), v34 (copy), v36 (copy), v33 (copy), l_Workspace_0 (copy), v29 (copy), v35 (copy), v5 (copy), v41 (copy), v32 (copy), v56 (copy), v14 (copy), v25 (copy), v30 (copy), v31 (copy), v37 (copy), v8 (copy), l_RunService_0 (copy), v40 (copy), v22 (copy), v18 (copy), v15 (copy), v16 (copy), v17 (copy)
    local v62 = nil;
    if not v39() then
        v62 = l_useSelector_0(function(v63) --[[ Line: 152 ]]
            return v63.Messages;
        end);
    end;
    local v66 = if v39() then l_useSelector_0(function(v64) --[[ Line: 159 ]]
        -- upvalues: v61 (copy)
        return v64.Messages.messagesBySenderId[v61.userId];
    end) else v3.useMemo(function() --[[ Line: 162 ]]
        -- upvalues: l_List_0 (ref), v62 (ref), v61 (copy)
        return l_List_0.map(v62.bubbleMessagesInOrderBySenderId[v61.userId] or {}, function(v65) --[[ Line: 163 ]]
            -- upvalues: v62 (ref)
            return v62.byMessageId[v65];
        end);
    end, {
        v62, 
        v61.userId
    });
    local v67 = v3.useMemo(function() --[[ Line: 167 ]]
        -- upvalues: v66 (copy)
        if v66 ~= nil then
            return v66[#v66];
        else
            return nil;
        end;
    end, {
        v66
    });
    local v69 = l_useSelector_0(function(v68) --[[ Line: 171 ]]
        -- upvalues: v61 (copy), v21 (ref), v67 (copy)
        if v61.isTextChatServiceOn then
            return v68.BubbleChatSettings;
        else
            return v21(v68.LegacyBubbleChatSettings, v67);
        end;
    end);
    local v71 = l_useSelector_0(function(v70) --[[ Line: 178 ]]
        -- upvalues: v61 (copy)
        return v70.Adornees[v61.userId] or v61.partOrModel;
    end);
    local v73 = l_useSelector_0(function(v72) --[[ Line: 181 ]]
        return v72.ClientSettings;
    end);
    local v75 = l_useSelector_0(function(v74) --[[ Line: 184 ]]
        -- upvalues: v61 (copy)
        return v74.Voice.participantsMuted[v61.userId] or false;
    end);
    local v77 = l_useSelector_0(function(v76) --[[ Line: 187 ]]
        -- upvalues: v19 (ref), v61 (copy)
        if v19.ShowLikelySpeakingBubbles then
            return v76.Voice.likelySpeakingUsers[v61.userId];
        else
            return false;
        end;
    end);
    local v79 = l_useSelector_0(function(v78) --[[ Line: 190 ]]
        return v78.Voice.isVoiceUIVisible;
    end);
    local v80, v81 = v3.useState(false);
    local v82, v83 = v3.useState(false);
    local v84, v85 = v3.useState(v69);
    local l_useState_0 = v3.useState;
    local l_selfViewListenerChanged_0 = v61.selfViewListenerChanged;
    local v88 = nil;
    local v89 = l_selfViewListenerChanged_0 and l_selfViewListenerChanged_0.getSelfViewVisibility;
    if v19.AvatarChatEnabled and v89 then
        v88 = v89();
    end;
    local v90;
    l_useState_0, v90 = l_useState_0(v88);
    l_selfViewListenerChanged_0, v88 = v3.useState(false);
    local v91;
    v89, v91 = v3.useState(0);
    local v92, v93 = v3.useState(nil);
    local v94, v95 = v3.useState({});
    local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    local v97 = if l_LocalPlayer_0 then v61.userId == tostring(l_LocalPlayer_0.UserId) else false;
    local v98 = nil;
    local v99 = nil;
    local v100 = nil;
    local v101 = nil;
    local v102 = nil;
    local v103 = nil;
    if v26 then
        local v104, v105 = v3.useState(false);
        v98 = v104;
        v99 = v105;
        v104, v105 = v3.useState(false);
        v100 = v104;
        v101 = v105;
        v104, v105 = v3.useState(false);
        v102 = v104;
        v103 = v105;
    end;
    local v106 = v3.useCallback(function() --[[ Line: 217 ]]
        -- upvalues: v26 (ref), v100 (ref), v61 (copy), v98 (ref), v28 (ref), v75 (copy)
        return v26 and v100 and v61.voiceState == "LOCAL_MUTED" and v98 and not (v28 and v75);
    end, {
        v100, 
        v61.voiceState, 
        v98, 
        v75
    });
    local v109 = l_useSelector_0(function(v107) --[[ Line: 224 ]]
        -- upvalues: v26 (ref), l_LocalPlayer_0 (copy)
        if v26 then
            local v108 = if l_LocalPlayer_0 then tostring(l_LocalPlayer_0.UserId) else "";
            return v107.Adornees[v108];
        else
            return nil;
        end;
    end);
    local v110 = nil;
    local v111 = nil;
    if v19.ShowLikelySpeakingBubbles then
        local v112, v113 = v3.useState(false);
        v110 = v112;
        v111 = v113;
    end;
    local v114 = v3.useRef(false);
    local v115, v116 = v3.useBinding(Vector3.zero);
    local v117 = v3.useRef(nil);
    local v118 = v3.useRef(0);
    local v119 = v3.useRef(0);
    local v120 = v3.useRef(0);
    local v121 = v3.useCallback(function() --[[ Line: 245 ]]
        -- upvalues: v61 (copy), v114 (copy)
        if v61.onFadeOut and not v114.current then
            v114.current = true;
            v61.onFadeOut(v61.userId);
        end;
    end, {
        v61.onFadeOut, 
        v61.userId, 
        v114.current
    });
    local v125 = v3.useCallback(function(v122, v123) --[[ Line: 253 ]]
        -- upvalues: v106 (copy), v61 (copy)
        local v124 = v106() and "easierunmuting" or "bubblechat";
        return v61.onClickedVoiceIndicator(v122, v123, v124);
    end, {
        v61.onClickedVoiceIndicator
    });
    local v130 = v3.useCallback(function() --[[ Line: 260 ]]
        -- upvalues: v71 (copy), v84 (copy)
        if v71 and v71:IsA("Model") then
            local l_v71_BoundingBox_0, v127 = v71:GetBoundingBox();
            local v128 = getAdorneeInstance(v71, v84.AdorneeName);
            if not v128 then
                return v127.Y / 2;
            elseif v128:IsA("BasePart") then
                local v129 = l_v71_BoundingBox_0:PointToObjectSpace(v128.Position);
                return v127.Y / 2 - v129.Y;
            else
                return 0;
            end;
        elseif v71 and v71:IsA("BasePart") then
            return v71.Size.Y / 2;
        else
            return 0;
        end;
    end, {
        v71, 
        v84
    });
    local v133 = v3.useCallback(function() --[[ Line: 280 ]]
        -- upvalues: l_GetFFlagEnableShowVoiceUI_0 (ref), v61 (copy), v79 (copy), v97 (copy), l_VRService_0 (ref), v19 (ref), l_useState_0 (copy), v94 (copy), l_selfViewListenerChanged_0 (copy), v34 (ref)
        if l_GetFFlagEnableShowVoiceUI_0() then
            if not v61.voiceEnabled or not v79 then
                return false;
            end;
        elseif not v61.voiceEnabled then
            return false;
        end;
        if v97 then
            if l_VRService_0.VREnabled or v19.ChromeEnabled then
                return false;
            elseif not l_useState_0 then
                return true;
            else
                return false;
            end;
        else
            local v131 = not v94 or #v94 == 0;
            local v132 = v61.voiceEnabled and not l_selfViewListenerChanged_0;
            if v34() then
                return v132;
            elseif v132 and (not v61.isBubbleChatEnabled or v131) then
                return true;
            else
                return false;
            end;
        end;
    end, {
        v61.voiceEnabled, 
        v61.userId, 
        l_useState_0, 
        v94, 
        l_selfViewListenerChanged_0, 
        v61.isBubbleChatEnabled, 
        v84, 
        v69, 
        l_VRService_0.VREnabled, 
        v79
    });
    local v134 = v3.useCallback(function() --[[ Line: 331 ]]
        -- upvalues: v97 (copy), v61 (copy), v77 (copy)
        return not v97 and v61.isEligibleForLikelySpeakingBubbles and v77;
    end, {
        v97, 
        v61.isEligibleForLikelySpeakingBubbles, 
        v77
    });
    local v137 = v3.useCallback(function() --[[ Line: 339 ]]
        -- upvalues: v84 (copy), v19 (ref), v134 (copy), v133 (copy)
        local l_v84_0 = v84;
        local v136 = not v19.ShowLikelySpeakingBubbles or not v134();
        return l_v84_0.TailVisible and not v133() and v136;
    end, {
        v84, 
        v61.voiceEnabled, 
        v61.userId, 
        l_useState_0, 
        v94, 
        l_selfViewListenerChanged_0, 
        v61.isBubbleChatEnabled, 
        v69, 
        l_VRService_0.VREnabled, 
        v19.ShowLikelySpeakingBubbles, 
        v97, 
        v61.isEligibleForLikelySpeakingBubbles, 
        v77
    });
    local v139 = v3.useCallback(function() --[[ Line: 361 ]]
        -- upvalues: v97 (copy), v92 (copy), v89 (copy), v88 (copy)
        if not v97 and v92 ~= "Talking" then
            local l_v89_0 = v89;
            delay(1, function() --[[ Line: 366 ]]
                -- upvalues: v89 (ref), l_v89_0 (copy), v88 (ref)
                if v89 == l_v89_0 then
                    v88(true);
                end;
            end);
        end;
    end, {
        v61.userId, 
        v92, 
        v89, 
        v97
    });
    local v142 = v3.useCallback(function() --[[ Line: 375 ]]
        -- upvalues: v26 (ref), v100 (ref), v139 (copy), v92 (copy), v97 (copy), v89 (copy), v88 (copy)
        if not v26 or not v100 then
            return v139();
        else
            local v140 = false;
            if v92 ~= "Talking" then
                v140 = v92 ~= "LOCAL_MUTED";
            end;
            if not v97 and v140 then
                local l_v89_1 = v89;
                delay(1, function() --[[ Line: 388 ]]
                    -- upvalues: v89 (ref), l_v89_1 (copy), v88 (ref)
                    if v89 == l_v89_1 then
                        v88(true);
                    end;
                end);
            end;
            return;
        end;
    end, {
        v100, 
        v61.userId, 
        v92, 
        v89, 
        v97
    });
    local v162 = v3.useCallback(function(v143) --[[ Line: 399 ]]
        -- upvalues: v36 (ref), v61 (copy), v120 (copy), v119 (copy), v33 (ref), v71 (copy), v84 (copy), l_Workspace_0 (ref), v19 (ref), v26 (ref), v100 (ref), v109 (copy), v29 (ref), v35 (ref), v82 (copy), v80 (copy), v98 (ref), v110 (ref), v81 (copy), v83 (copy), v99 (ref), v111 (ref), v130 (copy), v118 (copy), v117 (copy), v5 (ref), v41 (ref), v32 (ref), v94 (copy), v95 (copy), v56 (ref), v69 (copy)
        if v36() and v61.billboardUpdateFrequency > 0 then
            v120.current = v120.current + v143;
            if v120.current < v61.billboardUpdateFrequency then
                return;
            else
                v120.current = 0;
            end;
        elseif v119.current ~= nil then
            if v119.current < v33 then
                local l_v119_0 = v119;
                l_v119_0.current = l_v119_0.current + 1;
                return;
            else
                v119.current = 0;
            end;
        end;
        local v145 = getAdorneeInstance(v71, v84.AdorneeName);
        if l_Workspace_0.CurrentCamera and v145 then
            local v146 = if v145:IsA("Attachment") then v145.WorldPosition else v145.Position;
            local l_Magnitude_0 = (l_Workspace_0.CurrentCamera.CFrame.Position - v146).Magnitude;
            local v148 = l_Magnitude_0 < v84.MaxDistance;
            local v149 = l_Magnitude_0 < v84.MinimizeDistance;
            local v150 = false;
            local v151 = false;
            local l_ShowLikelySpeakingBubbles_0 = v19.ShowLikelySpeakingBubbles;
            if v26 and v100 or l_ShowLikelySpeakingBubbles_0 then
                local v153 = nil;
                local v154 = getAdorneeInstance(v109, v84.AdorneeName);
                if v154 then
                    v153 = if v154:IsA("Attachment") then v154.WorldPosition else v154.Position;
                end;
                local v155 = getEasierUnmutingDistance(v146, v153);
                if v155 ~= nil then
                    if v26 and v100 then
                        v150 = v155 < v29;
                    end;
                    if l_ShowLikelySpeakingBubbles_0 then
                        v151 = v155 < v35;
                    end;
                end;
            end;
            if v149 ~= v82 or v148 ~= v80 or v26 and v100 and v150 ~= v98 or l_ShowLikelySpeakingBubbles_0 and v151 ~= v110 then
                v81(v148);
                v83(v149);
                if v26 and v100 then
                    v99(v150);
                end;
                if l_ShowLikelySpeakingBubbles_0 then
                    v111(v151);
                end;
            end;
        end;
        local v156 = v130();
        if math.abs(v156 - v118.current) > 0.5 then
            v118.current = v156;
            v117.current:setGoal(v5.spring(v156, v41));
        end;
        local v157 = v32 and l_Workspace_0:GetServerTimeNow() * 1000 or DateTime.now().UnixTimestampMillis;
        local v158 = v84.BubbleDuration * 1000;
        for _, v160 in ipairs(v94) do
            if v158 <= v157 - v160.timestamp.UnixTimestampMillis then
                v95(function(v161) --[[ Line: 480 ]]
                    -- upvalues: v56 (ref), v158 (copy), v69 (ref)
                    return v56(v161, v158, v69.MaxBubbles);
                end);
                return;
            end;
        end;
    end, {
        v94, 
        v71, 
        v84, 
        v100, 
        v109, 
        v69, 
        v80, 
        v82, 
        v98, 
        v61.billboardUpdateFrequency
    });
    local v163 = v3.useRef(v162);
    local v164 = if l_LocalPlayer_0 then v61.userId ~= tostring(l_LocalPlayer_0.UserId) and "SpeakerDark" or "MicDark" else "SpeakerDark";
    local function v165() --[[ Line: 504 ]]
        -- upvalues: v3 (ref), v14 (ref), v61 (copy), v125 (copy), v164 (copy)
        return v3.createElement(v14, {
            userId = v61.userId, 
            getIcon = v61.getIconVoiceIndicator, 
            onClicked = v125, 
            iconStyle = v164
        });
    end;
    v3.useEffect(function() --[[ Line: 514 ]]
        -- upvalues: v92 (copy), v61 (copy), v91 (copy), v89 (copy), v88 (copy), v93 (copy)
        if v92 ~= v61.voiceState then
            v91((v89 or 0) + 1);
            v88(false);
            v93(v61.voiceState);
        end;
    end, {
        v61.voiceState, 
        v92
    });
    v3.useEffect(function() --[[ Line: 524 ]]
        -- upvalues: v84 (copy), v56 (ref), v66 (copy), v67 (copy), v69 (copy), v85 (copy), v95 (copy)
        local v166 = v84.BubbleDuration * 1000;
        local v167 = v56(v66, v166, v84.MaxBubbles);
        if (v67 and v69) ~= nil then
            v85(v67 and v69);
        end;
        v95(v167);
    end, {
        v84, 
        v66, 
        v67, 
        v69
    });
    v3.useEffect(function() --[[ Line: 533 ]]
        -- upvalues: v5 (ref), v117 (copy), v116 (copy), v130 (copy), v118 (copy), v19 (ref), v61 (copy), v90 (copy), v26 (ref), v25 (ref), v30 (ref), v31 (ref), v101 (ref)
        local v168 = v5.createSingleMotor(0);
        v117.current = v168;
        v168:onStep(function(v169) --[[ Line: 536 ]]
            -- upvalues: v116 (ref)
            v116((Vector3.new(0, v169, 0)));
        end);
        local v170 = v130();
        v118.current = v170;
        v117.current:setGoal(v5.instant(v170));
        local v171 = nil;
        if v19.AvatarChatEnabled and v61.selfViewListenerChanged then
            local l_selfViewVisibilityUpdatedSignal_0 = v61.selfViewListenerChanged.selfViewVisibilityUpdatedSignal;
            local l_getSelfViewVisibility_0 = v61.selfViewListenerChanged.getSelfViewVisibility;
            local l_l_getSelfViewVisibility_0_0 = l_getSelfViewVisibility_0 --[[ copy: 4 -> 5 ]];
            v171 = l_selfViewVisibilityUpdatedSignal_0:connect(function() --[[ Line: 549 ]] --[[ Name: callback ]]
                -- upvalues: v90 (ref), l_l_getSelfViewVisibility_0_0 (copy)
                v90(l_l_getSelfViewVisibility_0_0());
            end);
        end;
        if v26 then
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 556 ]]
                -- upvalues: v25 (ref), v30 (ref)
                return v25:GetLayerData(v30);
            end);
            if l_status_0 and l_result_0 and l_result_0[v31] then
                v101(true);
            end;
        end;
        return function() --[[ Line: 565 ]]
            -- upvalues: v171 (ref), v117 (ref)
            if v171 then
                v171:disconnect();
                v171 = nil;
            end;
            if v117.current then
                v117.current:destroy();
            end;
        end;
    end, {
        v61.selfViewListenerChanged
    });
    if v37 then
        v3.useEffect(function() --[[ Line: 577 ]]
            -- upvalues: v163 (copy), v162 (copy)
            v163.current = v162;
        end, {
            v162
        });
    end;
    v3.useEffect(function() --[[ Line: 584 ]]
        -- upvalues: v8 (ref), v61 (copy), l_RunService_0 (ref), v37 (ref), v163 (copy), v36 (ref), v120 (copy), v119 (copy), v33 (ref), v71 (copy), v84 (copy), l_Workspace_0 (ref), v19 (ref), v26 (ref), v100 (ref), v109 (copy), v29 (ref), v35 (ref), v82 (copy), v80 (copy), v98 (ref), v110 (ref), v81 (copy), v83 (copy), v99 (ref), v111 (ref), v130 (copy), v118 (copy), v117 (copy), v5 (ref), v41 (ref), v32 (ref), v94 (copy), v95 (copy), v56 (ref), v69 (copy), v142 (copy), v139 (copy)
        v8:trace("Mounting billboards for {}", v61.userId);
        local v197 = l_RunService_0.PostSimulation:Connect(v37 and function(v177) --[[ Line: 589 ]]
            -- upvalues: v163 (ref)
            v163.current(v177);
        end or function(v178) --[[ Line: 592 ]]
            -- upvalues: v36 (ref), v61 (ref), v120 (ref), v119 (ref), v33 (ref), v71 (ref), v84 (ref), l_Workspace_0 (ref), v19 (ref), v26 (ref), v100 (ref), v109 (ref), v29 (ref), v35 (ref), v82 (ref), v80 (ref), v98 (ref), v110 (ref), v81 (ref), v83 (ref), v99 (ref), v111 (ref), v130 (ref), v118 (ref), v117 (ref), v5 (ref), v41 (ref), v32 (ref), v94 (ref), v95 (ref), v56 (ref), v69 (ref)
            if v36() and v61.billboardUpdateFrequency > 0 then
                v120.current = v120.current + v178;
                if v120.current < v61.billboardUpdateFrequency then
                    return;
                else
                    v120.current = 0;
                end;
            elseif v119.current ~= nil then
                if v119.current < v33 then
                    local l_v119_1 = v119;
                    l_v119_1.current = l_v119_1.current + 1;
                    return;
                else
                    v119.current = 0;
                end;
            end;
            local v180 = getAdorneeInstance(v71, v84.AdorneeName);
            if l_Workspace_0.CurrentCamera and v180 then
                local v181 = if v180:IsA("Attachment") then v180.WorldPosition else v180.Position;
                local l_Magnitude_1 = (l_Workspace_0.CurrentCamera.CFrame.Position - v181).Magnitude;
                local v183 = l_Magnitude_1 < v84.MaxDistance;
                local v184 = l_Magnitude_1 < v84.MinimizeDistance;
                local v185 = false;
                local v186 = false;
                local l_ShowLikelySpeakingBubbles_1 = v19.ShowLikelySpeakingBubbles;
                if v26 and v100 or l_ShowLikelySpeakingBubbles_1 then
                    local v188 = nil;
                    local v189 = getAdorneeInstance(v109, v84.AdorneeName);
                    if v189 then
                        v188 = if v189:IsA("Attachment") then v189.WorldPosition else v189.Position;
                    end;
                    local v190 = getEasierUnmutingDistance(v181, v188);
                    if v190 ~= nil then
                        if v26 and v100 then
                            v185 = v190 < v29;
                        end;
                        if l_ShowLikelySpeakingBubbles_1 then
                            v186 = v190 < v35;
                        end;
                    end;
                end;
                if v184 ~= v82 or v183 ~= v80 or v26 and v100 and v185 ~= v98 or l_ShowLikelySpeakingBubbles_1 and v186 ~= v110 then
                    v81(v183);
                    v83(v184);
                    if v26 and v100 then
                        v99(v185);
                    end;
                    if l_ShowLikelySpeakingBubbles_1 then
                        v111(v186);
                    end;
                end;
            end;
            local v191 = v130();
            if math.abs(v191 - v118.current) > 0.5 then
                v118.current = v191;
                v117.current:setGoal(v5.spring(v191, v41));
            end;
            local v192 = v32 and l_Workspace_0:GetServerTimeNow() * 1000 or DateTime.now().UnixTimestampMillis;
            local v193 = v84.BubbleDuration * 1000;
            for _, v195 in ipairs(v94) do
                if v193 <= v192 - v195.timestamp.UnixTimestampMillis then
                    v95(function(v196) --[[ Line: 675 ]]
                        -- upvalues: v56 (ref), v193 (copy), v69 (ref)
                        return v56(v196, v193, v69.MaxBubbles);
                    end);
                    return;
                end;
            end;
        end);
        if v26 and v100 then
            v142();
        else
            v139();
        end;
        return function() --[[ Line: 689 ]]
            -- upvalues: v8 (ref), v61 (ref), v197 (copy)
            v8:trace("Unmounting billboards for {}", v61.userId);
            if v197 and v197.Connected then
                v197:Disconnect();
            end;
        end;
    end, if v37 then {} else {
        v94, 
        v71, 
        v84, 
        v100, 
        v109, 
        v69, 
        v80, 
        v82, 
        v98, 
        v61.billboardUpdateFrequency
    });
    v3.useEffect(function() --[[ Line: 713 ]]
        -- upvalues: v94 (copy), v80 (copy), v121 (copy), v114 (copy), v26 (ref), v97 (copy), v102 (ref), v61 (copy), v25 (ref), v30 (ref), v103 (ref)
        if (not v94 or #v94 == 0) and not v80 then
            v121();
        end;
        if v94 and #v94 > 0 then
            v114.current = false;
        end;
        if v26 and v97 and not v102 and (v61.voiceState == "Inactive" or v61.voiceState == "Talking" or v61.voiceState == "Muted") then
            v25:LogUserLayerExposure(v30);
            v103(true);
        end;
    end, {
        v94, 
        v80, 
        v61.userId, 
        v61.voiceState, 
        v102
    });
    v3.useEffect(function() --[[ Line: 736 ]]
        -- upvalues: v26 (ref), v100 (ref), v142 (copy), v139 (copy)
        if v26 and v100 then
            v142();
            return;
        else
            v139();
            return;
        end;
    end, {
        v89, 
        v100
    });
    local v198 = getAdorneeInstance(v71, v84.AdorneeName);
    if not v198 then
        v8:trace("No adornee for {}", v61.userId);
        return;
    elseif not v80 then
        return;
    elseif v26 and v100 and v61.voiceState == "LOCAL_MUTED" and (not v98 or v28 and v75) then
        v8:trace("Unmute toggle not applicable for {}", v61.userId);
        return;
    else
        local v199 = {};
        local v200 = v94 and #v94 > 0;
        local v201 = v61.voiceEnabled and not l_selfViewListenerChanged_0;
        if v19.AvatarChatEnabled and v97 then
            v201 = v201 and not l_useState_0;
        end;
        if v19.ChromeEnabled and v97 then
            v201 = false;
        end;
        local v202 = v201 and not v19.AvatarChatEnabled;
        local v203 = if v201 then v165 else nil;
        local l_v40_0 = v40;
        if v19.AvatarChatEnabled or v19.ChromeEnabled then
            if v133() then
                local v205 = {
                    chatSettings = v69, 
                    isInsideMaximizeDistance = v82, 
                    LayoutOrder = 2, 
                    isLocalPlayer = v97, 
                    userId = v61.userId, 
                    getIcon = v61.getIconVoiceIndicator, 
                    hasCameraPermissions = v61.hasCameraPermissions, 
                    hasMicPermissions = v61.hasMicPermissions, 
                    onClickedVoiceIndicator = v125, 
                    onClickedCameraIndicator = v61.onClickedCameraIndicator, 
                    voiceEnabled = v61.voiceEnabled, 
                    displayCameraDeniedToast = v61.displayCameraDeniedToast, 
                    isCamEnabledForUserAndPlace = v61.isCamEnabledForUserAndPlace, 
                    setCameraPermissionStateFromControl = v61.setCameraPermissionStateFromControl, 
                    getPermissions = v61.getPermissions, 
                    isCameraOnlyUser = v61.isCameraOnlyUser
                };
                v199.PlayerButtons = v3.createElement(v22, v205);
                v199.listLayout = v3.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    VerticalAlignment = Enum.VerticalAlignment.Bottom, 
                    Padding = UDim.new(0, 8)
                });
                v199.padding = v3.createElement("UIPadding", {
                    PaddingBottom = UDim.new(0, 8)
                });
            elseif v19.ShowLikelySpeakingBubbles and v134() and v110 then
                local v206 = {
                    chatSettings = v69, 
                    isInsideMaximizeDistance = v82, 
                    LayoutOrder = 2, 
                    onActivated = v61.onClickedLikelySpeakingBubble
                };
                v199.LikelySpeakingBubble = v3.createElement(v18, v206);
                v199.listLayout = v3.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    VerticalAlignment = Enum.VerticalAlignment.Bottom, 
                    Padding = UDim.new(0, 8)
                });
                v199.padding = v3.createElement("UIPadding", {
                    PaddingBottom = UDim.new(0, 8)
                });
            end;
        elseif v201 and v200 == false then
            v199.VoiceBubble = v3.createElement(v15, {
                chatSettings = v84, 
                userId = v61.userId, 
                renderInsert = v203, 
                insertSize = l_v40_0, 
                isDistant = not v82, 
                clientSettings = v73
            });
        end;
        local v207 = v137();
        if v82 then
            v199.BubbleChatList = v3.createElement(v16, {
                userId = v61.userId, 
                isVisible = v82, 
                onLastBubbleFadeOut = v121, 
                chatSettings = v84, 
                renderFirstInsert = if v202 then v203 else nil, 
                insertSize = l_v40_0, 
                messages = v94, 
                clientSettings = v73, 
                isTextChatServiceOn = v61.isTextChatServiceOn, 
                showCaret = v207
            });
        elseif v200 then
            v199.DistantBubble = v3.createElement(v17, {
                fadingOut = not v94 or #v94 == 0, 
                onFadeOut = v121, 
                chatSettings = v84, 
                renderInsert = if v202 then v203 else nil, 
                insertSize = l_v40_0, 
                clientSettings = v73, 
                showCaret = v207
            });
        end;
        local v208 = v97 and v84.LocalPlayerStudsOffset or Vector3.new(0, 1, 0.10000000149011612, 0);
        local v209 = v19.ShowLikelySpeakingBubbles and v134();
        return v3.createElement("BillboardGui", {
            Adornee = v198, 
            Active = if v19.AvatarChatEnabled then v133() or v209 else v201 or v209, 
            Size = UDim2.fromOffset(500, 200), 
            SizeOffset = Vector2.new(0, 0.5), 
            StudsOffset = v208 + Vector3.new(0, v84.VerticalStudsOffset, 0), 
            StudsOffsetWorldSpace = v115, 
            ResetOnSpawn = false
        }, v199);
    end;
end);