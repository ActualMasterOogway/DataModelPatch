local l_Players_0 = game:GetService("Players");
local l_VoiceChatService_0 = game:GetService("VoiceChatService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v4 = require(l_script_FirstAncestor_0.IXPServiceWrapper);
local v5 = require(l_Parent_0.ExpChatShared);
local v6 = require(l_Parent_0.Roact);
local v7 = require(l_Parent_0.RoactRodux);
local l_Dictionary_0 = require(l_Parent_0.llama).Dictionary;
local l_None_0 = require(l_Parent_0.llama).None;
local v10 = v5.Logger:new("ExpChat/" .. script.Name);
local l_script_FirstAncestor_1 = script:FindFirstAncestor("BubbleChat");
local v12 = require(l_script_FirstAncestor_1.BillboardGui);
local l_Permissions_0 = require(l_script_FirstAncestor_0.Config).Permissions;
local v14 = require(l_script_FirstAncestor_0.GlobalFlags);
local v15 = require(l_script_FirstAncestor_0.Flags.getFFlagEnableExpChatVoiceUIImprovements);
local v16 = (if v15() then v6.PureComponent else v6.Component):extend("BubbleChatApp");
local v17 = require(l_script_FirstAncestor_0.Flags.getFFlagEnableExperienceChatOptimizations);
local v18 = require(l_script_FirstAncestor_0.Flags.GetFStringVoicePerformanceIXPLayerName);
local v19 = require(l_script_FirstAncestor_0.Flags.getFFlagEnableBillboardUpdateFrequency);
local v20 = game:DefineFastString("BillboardUpdateFrequencyIXPLayerValue", "BillboardUpdateFrequency");
local v21 = game:DefineFastFlag("UseBubbleChatBillboardV3", false);
local v22 = if game:DefineFastFlag("UseBubbleChatBillboardV4", false) then require(l_script_FirstAncestor_1.BillboardGuiV4) else if v21 then require(l_script_FirstAncestor_1.BillboardGuiV3) else require(l_script_FirstAncestor_1.BillboardGuiV2);
v16.getDerivedStateFromProps = function(v23, v24) --[[ Line: 41 ]] --[[ Name: getDerivedStateFromProps ]]
    -- upvalues: l_Dictionary_0 (copy)
    return {
        userMessages = l_Dictionary_0.join(v24.userMessages or {}, v23.userMessages)
    };
end;
v16.init = function(v25) --[[ Line: 50 ]] --[[ Name: init ]]
    -- upvalues: v10 (copy), l_Dictionary_0 (copy), l_None_0 (copy), v14 (copy), v19 (copy), v4 (copy), v18 (copy), v20 (copy)
    v10:debug("Initializing");
    v25:setState({
        userMessages = {}, 
        localPlayerVoiceEnabled = false, 
        billboardUpdateFrequency = -1
    });
    v25.onBillboardFadeOut = function(v26) --[[ Line: 58 ]]
        -- upvalues: v25 (copy), l_Dictionary_0 (ref), l_None_0 (ref)
        v25:setState({
            userMessages = l_Dictionary_0.join(v25.state.userMessages, {
                [v26] = l_None_0
            })
        });
    end;
    v25.setCameraPermissionStateFromControl = function(v27) --[[ Line: 64 ]]
        -- upvalues: v14 (ref), v25 (copy)
        if v14.DoNotPromptCameraPermissionsOnMount then
            v25:setState({
                hasCameraPermissions = v27
            });
        end;
    end;
    if v19() then
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 73 ]]
            -- upvalues: v4 (ref), v18 (ref)
            return v4:GetLayerData(v18());
        end);
        if l_status_0 and l_result_0 and l_result_0[v20] then
            v25:setState({
                billboardUpdateFrequency = l_result_0[v20]
            });
        end;
    end;
end;
v16.getPermissions = function(v30) --[[ Line: 88 ]] --[[ Name: getPermissions ]]
    local function v33(v31, v32) --[[ Line: 89 ]]
        -- upvalues: v30 (copy)
        v30:setState({
            hasCameraPermissions = v31, 
            hasMicPermissions = v32
        });
    end;
    if v30.props.getPermissions then
        v30.props.getPermissions(v33);
    end;
end;
v16.getMicPermission = function(v34) --[[ Line: 104 ]] --[[ Name: getMicPermission ]]
    -- upvalues: l_Permissions_0 (copy)
    local function v37(_, v36) --[[ Line: 105 ]]
        -- upvalues: v34 (copy)
        v34:setState({
            hasMicPermissions = v36
        });
    end;
    if v34.props.getPermissions then
        v34.props.getPermissions(v37, l_Permissions_0.MICROPHONE_ACCESS);
    end;
end;
v16.getCameraPermissionWithoutRequest = function(v38) --[[ Line: 119 ]] --[[ Name: getCameraPermissionWithoutRequest ]]
    -- upvalues: l_Permissions_0 (copy)
    local function v41(v39, _) --[[ Line: 120 ]]
        -- upvalues: v38 (copy)
        v38:setState({
            hasCameraPermissions = v39
        });
    end;
    if v38.props.getPermissions then
        v38.props.getPermissions(v41, l_Permissions_0.CAMERA_ACCESS, true);
    end;
end;
v16.didMount = function(v42) --[[ Line: 132 ]] --[[ Name: didMount ]]
    -- upvalues: v14 (copy), v10 (copy), v19 (copy), l_Players_0 (copy), l_VoiceChatService_0 (copy), v4 (copy), v18 (copy)
    if v14.AvatarChatEnabled or v14.ChromeEnabled then
        if v14.DoNotPromptCameraPermissionsOnMount then
            if v42.props.isVoiceServiceInitialized and v14.RenderVoiceBubbleAfterAsyncInit then
                v42.props.isVoiceServiceInitialized():andThen(function() --[[ Line: 140 ]]
                    -- upvalues: v42 (copy)
                    v42:getMicPermission();
                end):catch(function() --[[ Line: 143 ]]
                    -- upvalues: v10 (ref)
                    v10:debug("VoiceChatServiceManager failed to initialize inside TextChatService bubblechat");
                end);
            else
                v42:getMicPermission();
            end;
            v42:getCameraPermissionWithoutRequest();
        else
            v42:getPermissions();
        end;
    end;
    if v19() then
        task.spawn(function() --[[ Line: 156 ]]
            -- upvalues: l_Players_0 (ref), l_VoiceChatService_0 (ref), v10 (ref), v42 (copy), v19 (ref), v4 (ref), v18 (ref)
            local l_status_1, l_result_1 = pcall(function() --[[ Line: 157 ]]
                -- upvalues: l_Players_0 (ref), l_VoiceChatService_0 (ref)
                if l_Players_0.LocalPlayer then
                    return l_VoiceChatService_0:IsVoiceEnabledForUserIdAsync(l_Players_0.LocalPlayer.UserId);
                else
                    return false;
                end;
            end);
            if not l_status_1 then
                v10:debug("Unable to get voice enabled status: ", l_result_1);
                return;
            else
                if l_result_1 then
                    v42:setState({
                        localPlayerVoiceEnabled = true
                    });
                    if v19() then
                        v4:LogUserLayerExposure(v18());
                    end;
                end;
                return;
            end;
        end);
    end;
end;
v16.render = function(v45) --[[ Line: 180 ]] --[[ Name: render ]]
    -- upvalues: v17 (copy), v14 (copy), l_Players_0 (copy), v6 (copy), l_Dictionary_0 (copy), v10 (copy), v15 (copy), v22 (copy), v12 (copy)
    local v46 = {};
    if v45.props.characters then
        for v47, v48 in pairs(v45.props.characters) do
            if v17() then
                if v48 and v48:IsDescendantOf(workspace) then
                    v46[v47] = false;
                end;
            else
                v46[v47] = false;
            end;
        end;
    end;
    if v45.props.mockUserIdToPartOrModel then
        for v49, v50 in pairs(v45.props.mockUserIdToPartOrModel) do
            if v17() then
                if v50 and v50:IsDescendantOf(workspace) then
                    v46[v49] = false;
                end;
            else
                v46[v49] = false;
            end;
        end;
    end;
    if v45.props.voiceParticipants then
        for v51, v52 in pairs(v45.props.voiceParticipants) do
            if v52 ~= "Hidden" then
                v46[v51] = true;
            end;
        end;
    end;
    if v14.AvatarChatEnabled and v45.state.hasCameraPermissions and l_Players_0.LocalPlayer then
        v46[tostring(l_Players_0.LocalPlayer.UserId)] = true;
    end;
    return v6.createElement("ScreenGui", {
        ResetOnSpawn = false
    }, l_Dictionary_0.map(v46, function(v53, v54) --[[ Line: 232 ]]
        -- upvalues: v17 (ref), v10 (ref), v15 (ref), v6 (ref), v22 (ref), v12 (ref), v45 (copy)
        if not v17() then
            v10:trace("Rendering billboard for ...{}", (string.sub(tostring(v54), -4)));
        end;
        local v55 = v15();
        return v6.createElement(v55 and v22 or v12, {
            userId = v54, 
            onFadeOut = v45.onBillboardFadeOut, 
            voiceEnabled = v45.props.voiceEnabled and v53, 
            getIconVoiceIndicator = v45.props.getIconVoiceIndicator, 
            onClickedVoiceIndicator = v45.props.onClickedVoiceIndicator, 
            onClickedCameraIndicator = v45.props.onClickedCameraIndicator, 
            selfViewListenerChanged = v45.props.selfViewListenerChanged, 
            hasCameraPermissions = v45.state.hasCameraPermissions, 
            hasMicPermissions = v45.state.hasMicPermissions, 
            displayCameraDeniedToast = v45.props.displayCameraDeniedToast, 
            isCamEnabledForUserAndPlace = v45.props.isCamEnabledForUserAndPlace, 
            isCameraOnlyUser = v45.props.isCameraOnlyUser, 
            setCameraPermissionStateFromControl = v45.setCameraPermissionStateFromControl, 
            getPermissions = v45.props.getPermissions, 
            isBubbleChatEnabled = v45.props.isBubbleChatEnabled, 
            voiceState = v45.props.voiceParticipants[v54], 
            partOrModel = v45.props.mockUserIdToPartOrModel[v54], 
            isTextChatServiceOn = v45.props.isTextChatServiceOn, 
            billboardUpdateFrequency = v45.state.billboardUpdateFrequency, 
            isEligibleForLikelySpeakingBubbles = v45.props.showLikelySpeakingBubbles, 
            onClickedLikelySpeakingBubble = v45.props.onClickedLikelySpeakingBubble
        }), "BubbleChat_" .. v54;
    end));
end;
return v7.connect(function(v56, v57) --[[ Line: 266 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: v15 (copy)
    local _ = nil;
    return {
        isBubbleChatEnabled = if v57.isTextChatServiceOn then v56.BubbleChatSettings.Enabled else v56.LegacyBubbleChatSettings.Enabled, 
        userMessages = if v15() then v56.Messages.messagesBySenderId else v56.Messages.bubbleMessagesInOrderBySenderId, 
        voiceEnabled = v56.Voice.isEnabled, 
        characters = v56.Players.charactersByUserId, 
        voiceParticipants = v56.Voice.participants, 
        mockUserIdToPartOrModel = v56.Messages.mockUserIdToPartOrModel, 
        showLikelySpeakingBubbles = v56.Voice.showLikelySpeakingBubbles
    };
end)(v16);