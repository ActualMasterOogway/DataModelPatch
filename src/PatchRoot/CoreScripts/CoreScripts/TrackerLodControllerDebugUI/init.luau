local l_CoreGui_0 = game:GetService("CoreGui");
local _ = game:GetService("GuiService");
local _ = game:GetService("CorePackages");
local l_RobloxGui_0 = l_CoreGui_0.RobloxGui;
local l_game_Service_0 = game:FindService("FaceAnimatorService");
local v5 = Color3.fromRGB(0, 196, 221);
local v6 = Color3.fromRGB(18, 217, 40);
local v7 = Color3.fromRGB(150, 150, 150);
local v8 = Color3.fromRGB(128, 196, 128);
local v9 = Color3.fromRGB(255, 196, 128);
if not l_game_Service_0 then
    print("[FaceAnimatorUI] FaceAnimatorService is nil. UI disabled.");
    return;
else
    local l_l_game_Service_0_TrackerLodController_0 = l_game_Service_0:GetTrackerLodController();
    if not l_l_game_Service_0_TrackerLodController_0 then
        print("[FaceAnimatorUI] TrackerLodController is nil. UI disabled.");
        return;
    else
        local v11 = Instance.new("Frame", l_RobloxGui_0);
        v11.Name = "LodFrame";
        v11.Position = UDim2.new(1, -190, 0, 10);
        v11.Size = UDim2.fromOffset(180, 250);
        v11.BackgroundColor3 = Color3.fromRGB(0, 86, 158);
        v11.BorderColor3 = Color3.fromRGB(27, 42, 53);
        local v12 = Instance.new("Frame", v11);
        v12.Name = "ContentFrame";
        v12.Position = UDim2.fromOffset(10, 10);
        v12.Size = UDim2.fromOffset(160, 230);
        v12.BackgroundColor3 = v11.BackgroundColor3;
        v12.BorderColor3 = v11.BorderColor3;
        v12.BorderSizePixel = 0;
        local v13 = Instance.new("UIListLayout", v12);
        v13.Padding = UDim.new(0, 10);
        v13.SortOrder = Enum.SortOrder.LayoutOrder;
        local function v18(v14, v15, v16) --[[ Line: 48 ]] --[[ Name: createLodTextButton ]]
            -- upvalues: v12 (copy), v7 (copy)
            local v17 = Instance.new("TextButton", v12);
            v17.Name = v15;
            v17.Font = Enum.Font.SourceSans;
            v17.Text = v16;
            v17.TextSize = 18;
            v17.Size = UDim2.fromOffset(160, 20);
            v17.BackgroundColor3 = v7;
            v17.BorderColor3 = Color3.fromRGB(27, 42, 53);
            v17.LayoutOrder = v14;
            return v17;
        end;
        local v19 = v18(1, "AutoButton", "Auto");
        local v20 = v18(2, "VideoAudioAccurateButton", "Video Audio Accurate");
        local v21 = v18(3, "VideoAudioFastButton", "Video Audio Fast");
        local v22 = v18(4, "VideoAccurateButton", "Video Accurate");
        local v23 = v18(5, "VideoFastButton", "Video Fast");
        local v24 = v18(6, "AudioButton", "Audio");
        local v25 = v18(7, "OffButton", "Off");
        local v26 = v18(8, "ExtrapolationButton", "Extrapolation");
        local v27 = {
            v23, 
            v22, 
            v21, 
            v20, 
            v24
        };
        l_l_game_Service_0_TrackerLodController_0.UpdateState:connect(function() --[[ Line: 78 ]] --[[ Name: updateButtonsState ]]
            -- upvalues: l_game_Service_0 (copy), v25 (copy), v5 (copy), l_l_game_Service_0_TrackerLodController_0 (copy), v19 (copy), v7 (copy), v6 (copy), v26 (copy), v8 (copy), v9 (copy), v27 (copy)
            if not l_game_Service_0:IsStarted() then
                v25.BackgroundColor3 = v5;
                print("[FaceAnimatorUI] FaceAnimatorService not started or LodController not enabled. UI not active.");
                return;
            else
                local v28 = l_l_game_Service_0_TrackerLodController_0.AudioMode == Enum.TrackerLodFlagMode.Auto;
                local v29 = l_l_game_Service_0_TrackerLodController_0.VideoMode == Enum.TrackerLodFlagMode.Auto;
                local v30 = l_l_game_Service_0_TrackerLodController_0.VideoLodMode == Enum.TrackerLodValueMode.Auto;
                local v31 = l_l_game_Service_0_TrackerLodController_0:getExtrapolation();
                local v32 = l_l_game_Service_0_TrackerLodController_0:isAudioEnabled();
                local v33 = l_l_game_Service_0_TrackerLodController_0:isVideoEnabled();
                local v34 = l_l_game_Service_0_TrackerLodController_0:getVideoLod();
                if not v32 and not v33 then
                    v25.BackgroundColor3 = v5;
                    v19.BackgroundColor3 = v7;
                else
                    v25.BackgroundColor3 = v7;
                    if v28 or v29 or v30 then
                        v19.BackgroundColor3 = v6;
                    else
                        v19.BackgroundColor3 = v7;
                    end;
                end;
                if v31 == 1 then
                    v26.BackgroundColor3 = v8;
                elseif v31 == 2 then
                    v26.BackgroundColor3 = v9;
                else
                    v26.BackgroundColor3 = v7;
                end;
                local v35 = nil;
                if v33 then
                    v35 = v27[1 + ({
                        [true] = 1, 
                        [false] = 0
                    })[v32] * 2 + v34];
                elseif v32 then
                    v35 = v27[5];
                end;
                for _, v37 in ipairs(v27) do
                    if v37 == v35 then
                        v37.BackgroundColor3 = v5;
                    else
                        v37.BackgroundColor3 = v7;
                    end;
                end;
                return;
            end;
        end);
        local function v38() --[[ Line: 131 ]] --[[ Name: onAutoButtonActivated ]]
            -- upvalues: l_l_game_Service_0_TrackerLodController_0 (copy)
            l_l_game_Service_0_TrackerLodController_0.VideoMode = Enum.TrackerLodFlagMode.Auto;
            l_l_game_Service_0_TrackerLodController_0.AudioMode = Enum.TrackerLodFlagMode.Auto;
            l_l_game_Service_0_TrackerLodController_0.VideoLodMode = Enum.TrackerLodValueMode.Auto;
            l_l_game_Service_0_TrackerLodController_0.VideoExtrapolationMode = Enum.TrackerExtrapolationFlagMode.Auto;
        end;
        local function v39() --[[ Line: 138 ]] --[[ Name: onOffButtonActivated ]]
            -- upvalues: l_l_game_Service_0_TrackerLodController_0 (copy)
            l_l_game_Service_0_TrackerLodController_0.VideoMode = Enum.TrackerLodFlagMode.ForceFalse;
            l_l_game_Service_0_TrackerLodController_0.AudioMode = Enum.TrackerLodFlagMode.ForceFalse;
            l_l_game_Service_0_TrackerLodController_0.VideoLodMode = Enum.TrackerLodValueMode.Auto;
            l_l_game_Service_0_TrackerLodController_0.VideoExtrapolationMode = Enum.TrackerExtrapolationFlagMode.Auto;
        end;
        local function v45(v40, v41, v42) --[[ Line: 145 ]] --[[ Name: makeOnButtonActivated ]]
            -- upvalues: l_l_game_Service_0_TrackerLodController_0 (copy)
            local v43 = {
                [true] = Enum.TrackerLodFlagMode.ForceTrue, 
                [false] = Enum.TrackerLodFlagMode.ForceFalse
            };
            local v44 = {
                [0] = Enum.TrackerLodValueMode.Force0, 
                [1] = Enum.TrackerLodValueMode.Force1
            };
            return function() --[[ Line: 149 ]]
                -- upvalues: l_l_game_Service_0_TrackerLodController_0 (ref), v43 (copy), v40 (copy), v41 (copy), v44 (copy), v42 (copy)
                l_l_game_Service_0_TrackerLodController_0.VideoMode = v43[v40];
                l_l_game_Service_0_TrackerLodController_0.AudioMode = v43[v41];
                l_l_game_Service_0_TrackerLodController_0.VideoLodMode = v44[v42];
            end;
        end;
        local function v47() --[[ Line: 155 ]] --[[ Name: onExtrapolationButtonActivated ]]
            -- upvalues: l_l_game_Service_0_TrackerLodController_0 (copy)
            local l_VideoExtrapolationMode_0 = l_l_game_Service_0_TrackerLodController_0.VideoExtrapolationMode;
            if l_VideoExtrapolationMode_0 == Enum.TrackerExtrapolationFlagMode.ForceDisabled then
                l_l_game_Service_0_TrackerLodController_0.VideoExtrapolationMode = Enum.TrackerExtrapolationFlagMode.ExtrapolateFacsAndPose;
                return;
            elseif l_VideoExtrapolationMode_0 == Enum.TrackerExtrapolationFlagMode.ExtrapolateFacsAndPose then
                l_l_game_Service_0_TrackerLodController_0.VideoExtrapolationMode = Enum.TrackerExtrapolationFlagMode.ExtrapolateFacsOnly;
                return;
            else
                l_l_game_Service_0_TrackerLodController_0.VideoExtrapolationMode = Enum.TrackerExtrapolationFlagMode.ForceDisabled;
                return;
            end;
        end;
        v19.Activated:Connect(v38);
        v25.Activated:Connect(v39);
        v26.Activated:Connect(v47);
        v23.Activated:Connect((v45(true, false, 0)));
        v22.Activated:Connect((v45(true, false, 1)));
        v21.Activated:Connect((v45(true, true, 0)));
        v20.Activated:Connect((v45(true, true, 1)));
        v24.Activated:Connect((v45(false, true, 1)));
        return;
    end;
end;