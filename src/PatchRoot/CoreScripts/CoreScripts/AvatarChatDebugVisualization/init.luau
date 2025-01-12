local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = l_CoreGui_0.RobloxGui;
local l_game_Service_0 = game:FindService("FaceAnimatorService");
local l_RunService_0 = game:GetService("RunService");
local l_Players_0 = game:GetService("Players");
local v6 = if require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagAvatarChatServiceEnabled() then game:GetService("AvatarChatService") else nil;
local l_game_EngineFeature_0 = game:GetEngineFeature("AvatarChatProtocolDebugV1");
local v8 = game:DefineFastFlag("DebugAvatarChatProtocolStats", false);
local v9 = require(l_CorePackages_0.Workspace.Packages.CoreScriptsInitializer).CoreLogger:new(script.Name);
local v10 = true;
local v11 = true;
v9:trace("AvatarChatDebugVisualization 3_3_2023__2");
local v12 = 0;
local v13 = "";
local v14 = Color3.new(0.00491341, 1, 0.0105745);
local v15 = Color3.new(0.96199, 0.736614, 0.0616617);
local v16 = Color3.new(0.96199, 0.0360113, 0);
local v17 = false;
local v18 = nil;
local v19 = {};
local v20 = {};
local v21 = {
    CharacterAdded = "CharacterAdded", 
    CharacterRemoving = "CharacterRemoving"
};
clearConnection = function(v22, v23) --[[ Line: 43 ]] --[[ Name: clearConnection ]]
    -- upvalues: v20 (copy)
    if v20[v22.UserId] and v20[v22.UserId][v23] then
        v20[v22.UserId][v23]:Disconnect();
        v20[v22.UserId][v23] = nil;
    end;
end;
clearAllConnections = function(v24) --[[ Line: 50 ]] --[[ Name: clearAllConnections ]]
    -- upvalues: v21 (copy), v20 (copy)
    for _, v26 in ipairs(v21) do
        clearConnection(v24, v26);
    end;
    v20[v24.UserId] = {};
end;
getFaceControls = function(v27) --[[ Line: 59 ]] --[[ Name: getFaceControls ]]
    return v27:FindFirstChildWhichIsA("FaceControls", true);
end;
findObjectOfNameAndTypeName = function(v28, v29, v30) --[[ Line: 63 ]] --[[ Name: findObjectOfNameAndTypeName ]]
    for _, v32 in (v30:GetDescendants()) do
        if v32.Name == v28 and v32:IsA(v29) then
            return v32;
        end;
    end;
end;
getHumanoidRootPart = function(v33) --[[ Line: 72 ]] --[[ Name: getHumanoidRootPart ]]
    if not v33 then
        return nil;
    else
        return (v33:WaitForChild("HumanoidRootPart", 2));
    end;
end;
getHead = function(v34, v35) --[[ Line: 81 ]] --[[ Name: getHead ]]
    -- upvalues: v9 (copy)
    if not v34 then
        return nil;
    else
        local v36 = nil;
        if v35 then
            v36 = v34:WaitForChild("Head", 5);
        end;
        local v37 = getFaceControls(v34);
        if v37 ~= nil then
            v36 = v37.Parent;
        end;
        if not v36 then
            v36 = findObjectOfNameAndTypeName("Head", "MeshPart", v34);
            if not v36 then
                v36 = v34:FindFirstChild("Head", true);
                if v36 and v36:IsA("Pose") then
                    v36 = nil;
                end;
            end;
        end;
        v9:trace("Self View: fn getHead(), head: " .. tostring(v36));
        return v36;
    end;
end;
if not l_game_Service_0 then
    v9:trace("[FaceAnimatorUI] FaceAnimatorService is nil. UI disabled.");
    return;
else
    local l_l_game_Service_0_TrackerLodController_0 = l_game_Service_0:GetTrackerLodController();
    if not l_l_game_Service_0_TrackerLodController_0 then
        v9:trace("[FaceAnimatorUI] TrackerLodController is nil. UI disabled.");
    end;
    local v39 = Instance.new("Frame", l_RobloxGui_0);
    v39.Name = "AvatarChatDebugVisualizationFrame";
    v39.Position = UDim2.new(0, 0, 0, 0);
    v39.Size = UDim2.new(1, 0, 1, 0);
    v39.BackgroundTransparency = 1;
    local function v48() --[[ Line: 133 ]] --[[ Name: displayTrackerLoDState ]]
        -- upvalues: l_game_Service_0 (copy), l_l_game_Service_0_TrackerLodController_0 (copy), v9 (copy), v18 (ref), v13 (ref)
        if not l_game_Service_0:IsStarted() or not l_l_game_Service_0_TrackerLodController_0 then
            v9:trace("[FaceAnimatorUI] FaceAnimatorService not started or LodController not enabled. Tracker LoD UI not active.");
            return;
        else
            local v40 = l_l_game_Service_0_TrackerLodController_0:getExtrapolation();
            local v41 = l_l_game_Service_0_TrackerLodController_0:isAudioEnabled();
            local v42 = l_l_game_Service_0_TrackerLodController_0:isVideoEnabled();
            local v43 = l_l_game_Service_0_TrackerLodController_0:getVideoLod();
            if v18 then
                local l_ForceDisabled_0 = Enum.TrackerExtrapolationFlagMode.ForceDisabled;
                if v40 == 1 then
                    l_ForceDisabled_0 = Enum.TrackerExtrapolationFlagMode.ExtrapolateFacsAndPose;
                end;
                if v40 == 2 then
                    l_ForceDisabled_0 = Enum.TrackerExtrapolationFlagMode.ExtrapolateFacsOnly;
                end;
                local v45 = 0;
                if v42 then
                    v45 = v45 + 1;
                end;
                if v41 then
                    v45 = v45 + 1;
                end;
                v13 = "Tracker: \nLoD: ";
                if v42 and l_ForceDisabled_0 == Enum.TrackerExtrapolationFlagMode.ForceDisabled and v43 == 0 then
                    v45 = v45 + 2;
                end;
                if v42 and l_ForceDisabled_0 == Enum.TrackerExtrapolationFlagMode.ExtrapolateFacsOnly and v43 == 0 then
                    v45 = v45 + 1;
                end;
                if v42 and l_ForceDisabled_0 == Enum.TrackerExtrapolationFlagMode.ForceDisabled and v43 == 1 then
                    v45 = v45 + 3;
                end;
                if v42 and l_ForceDisabled_0 == Enum.TrackerExtrapolationFlagMode.ExtrapolateFacsOnly and v43 == 1 then
                    v45 = v45 + 2;
                end;
                if v42 and l_ForceDisabled_0 == Enum.TrackerExtrapolationFlagMode.ExtrapolateFacsAndPose and v43 == 1 then
                    v45 = v45 + 1;
                end;
                v13 = v13 .. tostring(v45);
                local _ = "" .. tostring(l_l_game_Service_0_TrackerLodController_0.VideoExtrapolationMode);
                v9:trace("lodController.VideoExtrapolationMode:" .. tostring(l_l_game_Service_0_TrackerLodController_0.VideoExtrapolationMode) .. ", extrapolation:" .. tostring(Enum.TrackerExtrapolationFlagMode:GetEnumItems()[v40 + 1]) .. ", (Enum::any).TrackerExtrapolationFlagMode.ForceDisabled: " .. tostring(Enum.TrackerExtrapolationFlagMode.ForceDisabled));
                local v47 = l_game_Service_0.IsStarted and l_game_Service_0.VideoAnimationEnabled;
                v13 = v13 .. "\ntracker mode:";
                if v41 and v42 then
                    v13 = v13 .. "av2c";
                end;
                if v41 and not v42 then
                    v13 = v13 .. "a2c";
                end;
                if not v41 and v42 then
                    v13 = v13 .. "v2c";
                end;
                if not v41 and not v42 then
                    v13 = v13 .. "off";
                end;
                v13 = v13 .. "\nvideoLoD: " .. tostring(v43) .. "\nUser camera: ";
                if v47 then
                    v13 = v13 .. "on";
                else
                    v13 = v13 .. "off";
                end;
                v18.Text = v13;
            end;
            return;
        end;
    end;
    if l_l_game_Service_0_TrackerLodController_0 then
        l_l_game_Service_0_TrackerLodController_0.UpdateState:connect(v48);
        v17 = true;
    end;
    destroyDebugUIOfPlayer = function(v49) --[[ Line: 282 ]] --[[ Name: destroyDebugUIOfPlayer ]]
        -- upvalues: v19 (copy)
        local v50 = 0;
        for _, v52 in pairs(v19) do
            v50 = v50 + 1;
            if v52.player == v49 then
                if v52.debugLabel then
                    v52.debugLabel:Destroy();
                end;
                if v52.billboardGUI then
                    v52.billboardGUI:Destroy();
                end;
                if v52.markerCircle then
                    v52.markerCircle:Destroy();
                end;
                table.remove(v19, v50);
                v52.player = nil;
                v52 = nil;
            end;
        end;
    end;
    getBillboardAdornee = function(v53) --[[ Line: 303 ]] --[[ Name: getBillboardAdornee ]]
        -- upvalues: v9 (copy)
        if not v53 then
            return nil;
        else
            local _ = nil;
            local v55 = v53.Character or v53.CharacterAdded:Wait();
            v9:trace("character:" .. tostring(v55));
            local v56 = getHumanoidRootPart(v55);
            local _ = v55:WaitForChild("UpperTorso", 2);
            if v56 then
                return v56;
            else
                return (getHead(v55, true));
            end;
        end;
    end;
    prepDeltaTimesList = function(v58) --[[ Line: 324 ]] --[[ Name: prepDeltaTimesList ]]
        for _ = 1, 61 do
            table.insert(v58, 1);
        end;
    end;
    createDebugUIOfPlayer = function(v60) --[[ Line: 330 ]] --[[ Name: createDebugUIOfPlayer ]]
        -- upvalues: l_Players_0 (copy), v9 (copy), v39 (copy), v16 (copy), v18 (ref), v17 (ref), v48 (copy), v19 (copy)
        local v61 = {};
        local v62 = v60.UserId == l_Players_0.LocalPlayer.UserId;
        v9:trace("createDebugUIOfPlayer(), isLocalPlayer:" .. tostring(v62) .. ",player.UserId: " .. tostring(v60.UserId) .. ",Players.LocalPlayer.UserId:" .. tostring(l_Players_0.LocalPlayer.UserId));
        local v63 = Instance.new("BillboardGui", v39);
        local v64 = getBillboardAdornee(v60);
        v63.Adornee = v64;
        v63.StudsOffsetWorldSpace = Vector3.new(0, 6.5, 0, 0);
        v63.Name = "AboveAvatarBillboardGui_" .. tostring(v60.UserId);
        v63.Size = UDim2.new(0, 200, 0, 150);
        local v65 = nil;
        if not v62 then
            v65 = Instance.new("CylinderHandleAdornment", workspace);
            v65.Name = "markerCircle_" .. tostring(v60.UserId);
            v65.Color3 = v16;
            v65.Transparency = 0.25;
            v65.Adornee = v64;
            v65.Angle = 360;
            v65.CFrame = CFrame.new(0, -3, 0) * CFrame.Angles(1.5707963267948966, 0, 0);
            v65.Height = 0.1;
            v65.InnerRadius = 2.9;
            v65.Radius = 3;
        end;
        local l_TextLabel_0 = Instance.new("TextLabel");
        l_TextLabel_0.BackgroundColor3 = Color3.new(0, 0, 0);
        l_TextLabel_0.BackgroundTransparency = 0.4;
        l_TextLabel_0.Text = "";
        l_TextLabel_0.TextColor3 = Color3.new(1, 1, 1);
        l_TextLabel_0.TextStrokeColor3 = Color3.new(0.35935, 0.35761, 0.361074);
        l_TextLabel_0.TextStrokeTransparency = 0.2;
        l_TextLabel_0.Font = Enum.Font.Code;
        l_TextLabel_0.TextSize = 14;
        l_TextLabel_0.Position = UDim2.new(0, 20, 0, 20);
        l_TextLabel_0.Size = UDim2.new(0, 120, 0, 80);
        if v62 then
            l_TextLabel_0.Parent = v39;
        else
            l_TextLabel_0.Parent = v63;
        end;
        if v62 then
            v18 = l_TextLabel_0;
            if v17 then
                v48();
            end;
        end;
        v61.isLocalPlayer = v62;
        v61.player = v60;
        v61.debugLabel = l_TextLabel_0;
        v61.billboardGUI = v63;
        v61.markerCircle = v65;
        v61.previousFacsRecv = 0;
        v61.timeLastReceived = 0;
        v61.facsFPS = 0;
        v61.deltaTimesList = {};
        prepDeltaTimesList(v61.deltaTimesList);
        v61.lastFrameIndex = 0;
        table.insert(v19, v61);
    end;
    calculateAverageFPS = function(v67) --[[ Line: 408 ]] --[[ Name: calculateAverageFPS ]]
        local v68 = 0;
        for _, v70 in ipairs(v67.deltaTimesList) do
            v68 = v68 + v70;
        end;
        return #v67.deltaTimesList / v68;
    end;
    updateDebugUIsOfPlayers = function() --[[ Line: 417 ]] --[[ Name: updateDebugUIsOfPlayers ]]
        -- upvalues: v19 (copy), v18 (ref), v13 (ref), v10 (ref), v6 (copy), l_game_EngineFeature_0 (copy), v8 (copy), v12 (ref), v14 (copy), v15 (copy), v16 (copy), v11 (ref)
        for _, v72 in pairs(v19) do
            if v72 ~= nil then
                local l_player_0 = v72.player;
                if v72.isLocalPlayer then
                    v18.Text = v13;
                    if v10 then
                        v18.Visible = true;
                    else
                        v18.Visible = false;
                    end;
                elseif v6 and l_game_EngineFeature_0 and v8 then
                    local v74 = v6:DebugCounterGet("facs/lost", l_player_0.UserId);
                    local v75 = v6:DebugCounterGet("facs/recv", l_player_0.UserId);
                    local v76 = "" .. "recv: " .. v75 .. "\nlost: " .. v74;
                    if v74 > 0 then
                        v76 = v76 .. "\nloss: " .. tostring((math.floor(100 * (v74 / v75)))) .. "%";
                    end;
                    local v77 = v12 - v72.timeLastReceived;
                    local l_v76_0 = v76;
                    if v75 ~= v72.previousFacsRecv then
                        local v79 = math.floor(1 / v77);
                        v72.deltaTimesList[v72.lastFrameIndex + 1] = v77;
                        v72.lastFrameIndex = (v72.lastFrameIndex + 2) % #v72.deltaTimesList;
                        local v80 = math.floor((calculateAverageFPS(v72)));
                        v72.facsFPS = tostring(v79) .. "\naverage: " .. tostring(v80);
                        if v77 < 0.1 then
                            v72.markerCircle.Color3 = v14;
                        else
                            v72.markerCircle.Color3 = v15;
                        end;
                        v72.timeLastReceived = v12;
                    end;
                    l_v76_0 = l_v76_0 .. "\nFACS FPS: " .. v72.facsFPS;
                    if v75 == v72.previousFacsRecv and v77 > 0.17 and v77 <= 5 then
                        v72.markerCircle.Color3 = v15;
                    end;
                    if v75 == v72.previousFacsRecv and v77 > 5 then
                        v72.markerCircle.Color3 = v16;
                        v72.facsFPS = 0;
                    end;
                    v72.previousFacsRecv = v75;
                    v72.debugLabel.Text = l_v76_0;
                    v72.debugLabel.Visible = v11;
                end;
            end;
        end;
    end;
    renderStepped = function() --[[ Line: 500 ]] --[[ Name: renderStepped ]]
        -- upvalues: v12 (ref)
        v12 = time();
        updateDebugUIsOfPlayers();
    end;
    local _ = function(v81, _) --[[ Line: 506 ]] --[[ Name: onCharacterAdded ]]
        createDebugUIOfPlayer(v81);
    end;
    local _ = function(v84, _) --[[ Line: 510 ]] --[[ Name: onCharacterRemoving ]]
        -- upvalues: v9 (copy)
        v9:trace("onCharacterRemoving: player: " .. tostring(v84));
        destroyDebugUIOfPlayer(v84);
        clearAllConnections(v84);
    end;
    onPlayerAdded = function(v87) --[[ Line: 516 ]] --[[ Name: onPlayerAdded ]]
        -- upvalues: v20 (copy), v21 (copy), v9 (copy)
        if v87.Character then
            local _ = v87.Character;
            createDebugUIOfPlayer(v87);
        end;
        v20[v87.UserId] = {};
        v20[v87.UserId][v21.CharacterAdded] = v87.CharacterAdded:Connect(function(_) --[[ Line: 523 ]]
            -- upvalues: v87 (copy)
            createDebugUIOfPlayer(v87);
        end);
        v20[v87.UserId][v21.CharacterRemoving] = v87.CharacterRemoving:Connect(function(_) --[[ Line: 528 ]]
            -- upvalues: v87 (copy), v9 (ref)
            local l_v87_0 = v87;
            v9:trace("onCharacterRemoving: player: " .. tostring(l_v87_0));
            destroyDebugUIOfPlayer(l_v87_0);
            clearAllConnections(l_v87_0);
        end);
    end;
    onPlayerRemoved = function(v92) --[[ Line: 534 ]] --[[ Name: onPlayerRemoved ]]
        destroyDebugUIOfPlayer(v92);
        clearAllConnections(v92);
    end;
    for _, v94 in pairs(l_Players_0:GetPlayers()) do
        onPlayerAdded(v94);
    end;
    l_Players_0.PlayerAdded:Connect(onPlayerAdded);
    l_Players_0.PlayerRemoving:Connect(onPlayerRemoved);
    l_RunService_0.RenderStepped:Connect(renderStepped);
    if v17 then
        v48();
    end;
    game:GetService("UserInputService").InputBegan:Connect(function(v95, v96) --[[ Line: 554 ]]
        -- upvalues: v10 (ref), v11 (ref)
        if not v96 then
            if v95.KeyCode == Enum.KeyCode.T then
                v10 = not v10;
                print("T pressed, showInfoOfLocalPlayer: " .. tostring(v10));
            end;
            if v95.KeyCode == Enum.KeyCode.F then
                v11 = not v11;
                print("F pressed, showInfoOfRemotePlayers: " .. tostring(v11));
            end;
        end;
    end);
    return;
end;