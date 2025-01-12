local v0 = {
    [Enum.DialogPurpose.Quest] = {
        "rbxasset://textures/ui/dialog_purpose_quest.png", 
        Vector2.new(10, 34)
    }, 
    [Enum.DialogPurpose.Help] = {
        "rbxasset://textures/ui/dialog_purpose_help.png", 
        Vector2.new(20, 35)
    }, 
    [Enum.DialogPurpose.Shop] = {
        "rbxasset://textures/ui/dialog_purpose_shop.png", 
        Vector2.new(22, 43)
    }
};
local v1 = 24;
local l_Size24_0 = Enum.FontSize.Size24;
local v3 = Vector2.new(80, 90);
local v4 = 350;
local l_Players_0 = game:GetService("Players");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_GuiService_0 = game:GetService("GuiService");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local v10 = false;
local v11 = false;
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
while l_LocalPlayer_0 == nil do
    l_Players_0.PlayerAdded:wait();
    l_LocalPlayer_0 = l_Players_0.LocalPlayer;
end;
local l_Character_0 = l_LocalPlayer_0.Character;
if not l_Character_0 or l_Character_0.Parent == nil then
    l_Character_0 = l_LocalPlayer_0.CharacterAdded:Wait();
end;
l_LocalPlayer_0.CharacterAdded:Connect(function(v14) --[[ Line: 48 ]]
    -- upvalues: l_Character_0 (ref)
    l_Character_0 = v14;
end);
setUsingGamepad = function(v15, _) --[[ Line: 52 ]] --[[ Name: setUsingGamepad ]]
    -- upvalues: v10 (ref)
    if v15.UserInputType == Enum.UserInputType.Gamepad1 or v15.UserInputType == Enum.UserInputType.Gamepad2 or v15.UserInputType == Enum.UserInputType.Gamepad3 or v15.UserInputType == Enum.UserInputType.Gamepad4 then
        v10 = true;
        return;
    else
        v10 = false;
        return;
    end;
end;
game:GetService("UserInputService").InputBegan:Connect(setUsingGamepad);
game:GetService("UserInputService").InputChanged:Connect(setUsingGamepad);
local l_status_0, l_result_0 = pcall(function() --[[ Line: 64 ]]
    return settings():GetFFlag("GoodbyeChoiceActiveProperty");
end);
local v19 = l_status_0 and l_result_0;
local v20 = nil;
local v21 = {};
local v22 = nil;
local v23 = {};
local v24 = nil;
local v25 = nil;
local v26 = {};
local v27 = nil;
local l_CoreGui_0 = game:GetService("CoreGui");
local _ = game:GetService("CorePackages");
local l_RobloxGui_0 = l_CoreGui_0.RobloxGui;
local v31 = game:GetService("RobloxReplicatedStorage"):WaitForChild("SetDialogInUse", 1e999);
local v32 = nil;
local v33 = nil;
local v34 = {};
local v35 = {};
local v36 = nil;
local v37 = nil;
local v38 = require(l_RobloxGui_0.Modules.TenFootInterface):IsEnabled();
local v39 = require(l_RobloxGui_0.Modules.Settings.Utility);
local v40 = require(l_RobloxGui_0.Modules.GameTranslator);
local v41 = v39:IsSmallTouchScreen();
if v38 then
    l_Size24_0 = Enum.FontSize.Size36;
    v1 = 36;
    v4 = 500;
elseif v41 then
    l_Size24_0 = Enum.FontSize.Size14;
    v1 = 14;
    v4 = 250;
end;
v37 = if l_RobloxGui_0:FindFirstChild("ControlFrame") then l_RobloxGui_0.ControlFrame else l_RobloxGui_0;
local l_TouchEnabled_0 = game:GetService("UserInputService").TouchEnabled;
local function _(v43) --[[ Line: 122 ]] --[[ Name: isDialogMultiplePlayers ]]
    local l_status_1, l_result_1 = pcall(function() --[[ Line: 123 ]]
        -- upvalues: v43 (copy)
        return v43.BehaviorType == Enum.DialogBehaviorType.MultiplePlayers;
    end);
    return l_status_1 and l_result_1 or false;
end;
currentTone = function() --[[ Line: 127 ]] --[[ Name: currentTone ]]
    -- upvalues: v24 (ref)
    if v24 then
        return v24.Tone;
    else
        return Enum.DialogTone.Neutral;
    end;
end;
createChatNotificationGui = function() --[[ Line: 136 ]] --[[ Name: createChatNotificationGui ]]
    -- upvalues: v32 (ref), v3 (copy), l_UserInputService_0 (copy)
    v32 = Instance.new("BillboardGui");
    v32.Name = "ChatNotificationGui";
    v32.ExtentsOffset = Vector3.new(0, 1, 0, 0);
    v32.Size = UDim2.new(v3.X / 31.5, 0, v3.Y / 31.5, 0);
    v32.SizeOffset = Vector2.new(0, 0);
    v32.StudsOffset = Vector3.new(0, 3.700000047683716, 0, 0);
    v32.Enabled = true;
    v32.RobloxLocked = true;
    v32.Active = true;
    local l_ImageButton_0 = Instance.new("ImageButton");
    l_ImageButton_0.Name = "Background";
    l_ImageButton_0.Active = false;
    l_ImageButton_0.BackgroundTransparency = 1;
    l_ImageButton_0.Position = UDim2.new(0, 0, 0, 0);
    l_ImageButton_0.Size = UDim2.new(1, 0, 1, 0);
    l_ImageButton_0.Image = "";
    l_ImageButton_0.Parent = v32;
    local l_ImageLabel_0 = Instance.new("ImageLabel");
    l_ImageLabel_0.Name = "Icon";
    l_ImageLabel_0.Position = UDim2.new(0, 0, 0, 0);
    l_ImageLabel_0.Size = UDim2.new(1, 0, 1, 0);
    l_ImageLabel_0.Image = "";
    l_ImageLabel_0.BackgroundTransparency = 1;
    l_ImageLabel_0.Parent = l_ImageButton_0;
    local l_ImageLabel_1 = Instance.new("ImageLabel");
    l_ImageLabel_1.Name = "ActivationButton";
    l_ImageLabel_1.Position = UDim2.new(-0.3, 0, -0.4, 0);
    l_ImageLabel_1.Size = UDim2.new(0.8, 0, 0.8 * (v3.X / v3.Y), 0);
    l_ImageLabel_1.Image = l_UserInputService_0:GetImageForKeyCode(Enum.KeyCode.ButtonX);
    l_ImageLabel_1.BackgroundTransparency = 1;
    l_ImageLabel_1.Visible = false;
    l_ImageLabel_1.Parent = l_ImageButton_0;
end;
getChatColor = function(v50) --[[ Line: 174 ]] --[[ Name: getChatColor ]]
    if v50 == Enum.DialogTone.Neutral then
        return Enum.ChatColor.Blue;
    elseif v50 == Enum.DialogTone.Friendly then
        return Enum.ChatColor.Green;
    elseif v50 == Enum.DialogTone.Enemy then
        return Enum.ChatColor.Red;
    else
        return;
    end;
end;
styleChoices = function() --[[ Line: 184 ]] --[[ Name: styleChoices ]]
    -- upvalues: v21 (copy), v22 (ref)
    for _, v52 in pairs(v21) do
        v52.BackgroundTransparency = 1;
    end;
    v22.BackgroundTransparency = 1;
end;
styleMainFrame = function(v53) --[[ Line: 191 ]] --[[ Name: styleMainFrame ]]
    -- upvalues: v20 (ref)
    if v53 == Enum.DialogTone.Neutral then
        v20.Style = Enum.FrameStyle.ChatBlue;
    elseif v53 == Enum.DialogTone.Friendly then
        v20.Style = Enum.FrameStyle.ChatGreen;
    elseif v53 == Enum.DialogTone.Enemy then
        v20.Style = Enum.FrameStyle.ChatRed;
    end;
    styleChoices();
end;
setChatNotificationTone = function(v54, v55, v56) --[[ Line: 202 ]] --[[ Name: setChatNotificationTone ]]
    -- upvalues: v0 (copy), v3 (copy)
    if v56 == Enum.DialogTone.Neutral then
        v54.Background.Image = "rbxasset://textures/ui/chatBubble_blue_notify_bkg.png";
    elseif v56 == Enum.DialogTone.Friendly then
        v54.Background.Image = "rbxasset://textures/ui/chatBubble_green_notify_bkg.png";
    elseif v56 == Enum.DialogTone.Enemy then
        v54.Background.Image = "rbxasset://textures/ui/chatBubble_red_notify_bkg.png";
    end;
    local v57, v58 = unpack(v0[v55]);
    local v59 = v58 / v3;
    v54.Background.Icon.Size = UDim2.new(v59.X, 0, v59.Y, 0);
    v54.Background.Icon.Position = UDim2.new(0.5 - v59.X / 2, 0, 0.4 - v59.Y / 2, 0);
    v54.Background.Icon.Image = v57;
end;
createMessageDialog = function() --[[ Line: 218 ]] --[[ Name: createMessageDialog ]]
    -- upvalues: v33 (ref)
    v33 = Instance.new("Frame");
    v33.Name = "DialogScriptMessage";
    v33.Style = Enum.FrameStyle.Custom;
    v33.BackgroundTransparency = 0.5;
    v33.BackgroundColor3 = Color3.new(0.12156862745098039, 0.12156862745098039, 0.12156862745098039);
    v33.Visible = false;
    v33.RobloxLocked = true;
    local l_TextLabel_0 = Instance.new("TextLabel");
    l_TextLabel_0.Name = "Text";
    l_TextLabel_0.Position = UDim2.new(0, 0, 0, -1);
    l_TextLabel_0.Size = UDim2.new(1, 0, 1, 0);
    l_TextLabel_0.FontSize = Enum.FontSize.Size14;
    l_TextLabel_0.BackgroundTransparency = 1;
    l_TextLabel_0.TextColor3 = Color3.new(1, 1, 1);
    l_TextLabel_0.Parent = v33;
end;
showMessage = function(v61, v62) --[[ Line: 237 ]] --[[ Name: showMessage ]]
    -- upvalues: v33 (ref)
    v33.Text.Text = v61;
    v33.Size = UDim2.new(0, v62, 0, 40);
    v33.Position = UDim2.new(0.5, -v62 / 2, 0.5, -40);
    v33.Visible = true;
    wait(2);
    v33.Visible = false;
end;
variableDelay = function(v63) --[[ Line: 246 ]] --[[ Name: variableDelay ]]
    local v64 = math.min(string.len(v63), 100);
    wait(0.75 + v64 / 75 * 1.5);
end;
resetColor = function(v65) --[[ Line: 251 ]] --[[ Name: resetColor ]]
    v65.BackgroundTransparency = 1;
end;
wanderDialog = function() --[[ Line: 255 ]] --[[ Name: wanderDialog ]]
    -- upvalues: v20 (ref)
    v20.Visible = false;
    endDialog();
    showMessage("Chat ended because you walked away", 350);
end;
timeoutDialog = function() --[[ Line: 261 ]] --[[ Name: timeoutDialog ]]
    -- upvalues: v20 (ref)
    v20.Visible = false;
    endDialog();
    showMessage("Chat ended because you didn't reply", 350);
end;
normalEndDialog = function() --[[ Line: 267 ]] --[[ Name: normalEndDialog ]]
    endDialog();
end;
endDialog = function() --[[ Line: 271 ]] --[[ Name: endDialog ]]
    -- upvalues: v27 (ref), v26 (copy), v24 (ref), v31 (copy), v34 (copy), l_ContextActionService_0 (copy), v25 (ref), v36 (ref), l_GuiService_0 (copy), v20 (ref)
    if v27 then
        v26[v27] = false;
        v27 = nil;
    end;
    local l_v24_0 = v24;
    v24 = nil;
    if l_v24_0 and l_v24_0.InUse then
        delay(5, function() --[[ Line: 281 ]]
            -- upvalues: v31 (ref), l_v24_0 (copy)
            v31:FireServer(l_v24_0, false);
            l_v24_0.InUse = false;
        end);
    end;
    for v67, v68 in pairs(v34) do
        if v67 and v68 then
            v68.Enabled = not v67.InUse;
        end;
    end;
    l_ContextActionService_0:UnbindCoreAction("Nothing");
    v25 = nil;
    if v36 then
        v36.Visible = true;
    end;
    if l_GuiService_0.SelectedCoreObject and l_GuiService_0.SelectedCoreObject.Parent == v20 then
        l_GuiService_0.SelectedCoreObject = nil;
    end;
end;
sanitizeMessage = function(v69) --[[ Line: 306 ]] --[[ Name: sanitizeMessage ]]
    if string.len(v69) == 0 then
        return "...";
    else
        return v69;
    end;
end;
local function v73(v70, ...) --[[ Line: 314 ]] --[[ Name: chatFunc ]]
    local l_status_2, l_result_2 = pcall(function() --[[ Line: 123 ]]
        -- upvalues: v70 (copy)
        return v70.BehaviorType == Enum.DialogBehaviorType.MultiplePlayers;
    end);
    if l_status_2 and l_result_2 or false then
        game:GetService("Chat"):ChatLocal(...);
        return;
    else
        game:GetService("Chat"):Chat(...);
        return;
    end;
end;
selectChoice = function(v74) --[[ Line: 322 ]] --[[ Name: selectChoice ]]
    -- upvalues: v24 (ref), l_Character_0 (ref), v20 (ref), v22 (ref), v73 (copy), v23 (ref), l_LocalPlayer_0 (ref), v25 (ref)
    if not v24 then
        return;
    else
        renewKillswitch(v24);
        if not l_Character_0:FindFirstAncestorOfClass("Workspace") then
            return;
        else
            v20.Visible = false;
            if v74 == v22 then
                v73(v24, l_Character_0, v22.UserPrompt.Text, getChatColor(currentTone()));
                normalEndDialog();
                return;
            else
                local v75 = v23[v74];
                v73(v24, l_Character_0, sanitizeMessage(v75.UserDialog), getChatColor(currentTone()));
                wait(1);
                if not v24 then
                    return;
                else
                    v24:SignalDialogChoiceSelected(l_LocalPlayer_0, v75);
                    v73(v24, v25, sanitizeMessage(v75.ResponseDialog), getChatColor(currentTone()));
                    variableDelay(v75.ResponseDialog);
                    presentDialogChoices(v25, v75:GetChildren(), v75);
                    return;
                end;
            end;
        end;
    end;
end;
newChoice = function() --[[ Line: 357 ]] --[[ Name: newChoice ]]
    -- upvalues: l_Size24_0 (ref), l_UserInputService_0 (copy)
    local l_Frame_0 = Instance.new("Frame");
    l_Frame_0.Visible = false;
    local l_TextButton_0 = Instance.new("TextButton");
    l_TextButton_0.BackgroundColor3 = Color3.new(0.8901960784313725, 0.8901960784313725, 0.8901960784313725);
    l_TextButton_0.BackgroundTransparency = 1;
    l_TextButton_0.AutoButtonColor = false;
    l_TextButton_0.BorderSizePixel = 0;
    l_TextButton_0.Text = "";
    l_TextButton_0.MouseEnter:connect(function() --[[ Line: 367 ]]
        -- upvalues: l_TextButton_0 (copy)
        l_TextButton_0.BackgroundTransparency = 0;
    end);
    l_TextButton_0.MouseLeave:connect(function() --[[ Line: 370 ]]
        -- upvalues: l_TextButton_0 (copy)
        l_TextButton_0.BackgroundTransparency = 1;
    end);
    l_TextButton_0.SelectionImageObject = l_Frame_0;
    l_TextButton_0.Activated:connect(function() --[[ Line: 374 ]]
        -- upvalues: l_TextButton_0 (copy)
        selectChoice(l_TextButton_0);
    end);
    l_TextButton_0.RobloxLocked = true;
    local l_TextLabel_1 = Instance.new("TextLabel");
    l_TextLabel_1.AutoLocalize = false;
    l_TextLabel_1.Name = "UserPrompt";
    l_TextLabel_1.BackgroundTransparency = 1;
    l_TextLabel_1.Font = Enum.Font.SourceSans;
    l_TextLabel_1.FontSize = l_Size24_0;
    l_TextLabel_1.Position = UDim2.new(0, 40, 0, 0);
    l_TextLabel_1.Size = UDim2.new(1, -72, 1, 0);
    l_TextLabel_1.TextXAlignment = Enum.TextXAlignment.Left;
    l_TextLabel_1.TextYAlignment = Enum.TextYAlignment.Center;
    l_TextLabel_1.TextWrap = true;
    l_TextLabel_1.Parent = l_TextButton_0;
    local l_ImageLabel_2 = Instance.new("ImageLabel");
    l_ImageLabel_2.Name = "RBXchatDialogSelectionButton";
    l_ImageLabel_2.Position = UDim2.new(0, 0, 0.5, -16.5);
    l_ImageLabel_2.Size = UDim2.new(0, 33, 0, 33);
    l_ImageLabel_2.Image = l_UserInputService_0:GetImageForKeyCode(Enum.KeyCode.ButtonA);
    l_ImageLabel_2.BackgroundTransparency = 1;
    l_ImageLabel_2.Visible = false;
    l_ImageLabel_2.Parent = l_TextButton_0;
    return l_TextButton_0;
end;
initialize = function(v80) --[[ Line: 404 ]] --[[ Name: initialize ]]
    -- upvalues: v21 (copy), v22 (ref), v1 (ref), v20 (ref), v4 (ref)
    v21[1] = newChoice();
    v21[2] = newChoice();
    v21[3] = newChoice();
    v21[4] = newChoice();
    v22 = newChoice();
    v22.UserPrompt.Text = "Goodbye!";
    v22.Size = UDim2.new(1, 28, 0, v1 + 12);
    v20 = Instance.new("Frame");
    v20.Name = "UserDialogArea";
    v20.Size = UDim2.new(0, v4, 0, 200);
    v20.Style = Enum.FrameStyle.ChatBlue;
    v20.Visible = false;
    for _, v82 in pairs(v21) do
        v82.RobloxLocked = true;
        v82.Parent = v20;
    end;
    v22.RobloxLocked = true;
    v22.Parent = v20;
    v20.RobloxLocked = true;
    v20.Parent = v80;
end;
presentDialogChoices = function(v83, v84, v85) --[[ Line: 432 ]] --[[ Name: presentDialogChoices ]]
    -- upvalues: v24 (ref), v25 (ref), v23 (ref), v21 (copy), v1 (ref), v40 (copy), v22 (ref), v19 (copy), v20 (ref), v4 (ref), v41 (copy), l_LocalPlayer_0 (ref), v36 (ref), v10 (ref)
    if not v24 then
        return;
    else
        v25 = v83;
        local v86 = {};
        for _, v88 in pairs(v84) do
            if v88:IsA("DialogChoice") then
                table.insert(v86, v88);
            end;
        end;
        table.sort(v86, function(v89, v90) --[[ Line: 444 ]]
            return v89.Name < v90.Name;
        end);
        if #v86 == 0 then
            normalEndDialog();
            return;
        else
            local v91 = 1;
            local v92 = 0;
            v23 = {};
            for _, v94 in pairs(v21) do
                v94.Visible = false;
            end;
            for _, v96 in pairs(v86) do
                if v91 <= #v21 then
                    v21[v91].Size = UDim2.new(1, 28, 0, v1 * 3);
                    v40:TranslateAndRegister(v21[v91].UserPrompt, v96, v96.UserDialog);
                    local v97 = math.ceil(v21[v91].UserPrompt.TextBounds.Y / v1) * v1 + 12;
                    v21[v91].Position = UDim2.new(0, -11, 0, -8 + v92);
                    v21[v91].Size = UDim2.new(1, 28, 0, v97);
                    v21[v91].Visible = true;
                    v23[v21[v91]] = v96;
                    v92 = v92 + v97 + 1;
                    v91 = v91 + 1;
                end;
            end;
            v22.Size = UDim2.new(1, 28, 0, v1 * 3);
            v22.UserPrompt.Text = v85.GoodbyeDialog == "" and "Goodbye!" or v85.GoodbyeDialog;
            local v98 = math.ceil(v22.UserPrompt.TextBounds.Y / v1) * v1 + 12;
            v22.Size = UDim2.new(1, 28, 0, v98);
            v22.Position = UDim2.new(0, -11, 0, -8 + v92);
            v22.Visible = true;
            if v19 and not v85.GoodbyeChoiceActive then
                v22.Visible = false;
                v20.Size = UDim2.new(0, v4, 0, v92 + 34 + -16);
            else
                v20.Size = UDim2.new(0, v4, 0, v92 + v22.AbsoluteSize.Y + 34 + -16);
            end;
            v20.Position = UDim2.new(0, 20, 1, -v20.Size.Y.Offset - 20);
            if v41 then
                local l_TouchGui_0 = l_LocalPlayer_0.PlayerGui:FindFirstChild("TouchGui");
                if l_TouchGui_0 then
                    v36 = l_TouchGui_0:FindFirstChild("TouchControlFrame");
                    if v36 then
                        v36.Visible = false;
                    end;
                end;
                v20.Position = UDim2.new(0, 10, 1, -v20.Size.Y.Offset);
            end;
            styleMainFrame(currentTone());
            v20.Visible = true;
            if v10 then
                game:GetService("GuiService").SelectedCoreObject = v21[1];
            end;
            return;
        end;
    end;
end;
doDialog = function(v100) --[[ Line: 511 ]] --[[ Name: doDialog ]]
    -- upvalues: v24 (ref), l_ContextActionService_0 (copy), v31 (copy), v73 (copy)
    if v100.InitialPrompt == "" then
        warn("Can't start a dialog with an empty InitialPrompt");
        return;
    else
        local l_status_3, l_result_3 = pcall(function() --[[ Line: 123 ]]
            -- upvalues: v100 (copy)
            return v100.BehaviorType == Enum.DialogBehaviorType.MultiplePlayers;
        end);
        local v103 = l_status_3 and l_result_3 or false;
        if v100.InUse and not v103 then
            return;
        else
            v24 = v100;
            v100.InUse = true;
            l_ContextActionService_0:BindCoreAction("Nothing", function() --[[ Line: 525 ]]

            end, false, Enum.UserInputType.Gamepad1, Enum.UserInputType.Gamepad2, Enum.UserInputType.Gamepad3, Enum.UserInputType.Gamepad4);
            v31:FireServer(v100, true);
            v73(v100, v100.Parent, v100.InitialPrompt, getChatColor(v100.Tone));
            variableDelay(v100.InitialPrompt);
            presentDialogChoices(v100.Parent, v100:GetChildren(), v100);
            return;
        end;
    end;
end;
renewKillswitch = function(v104) --[[ Line: 536 ]] --[[ Name: renewKillswitch ]]
    -- upvalues: v27 (ref), v26 (copy), v31 (copy)
    if v27 then
        v26[v27] = false;
        v27 = nil;
    end;
    v27 = coroutine.create(function(v105) --[[ Line: 542 ]]
        -- upvalues: v26 (ref), v31 (ref), v104 (copy)
        wait(15);
        if v105 ~= nil then
            if v26[v105] == nil then
                v31:FireServer(v104, false);
                v104.InUse = false;
            end;
            v26[v105] = nil;
        end;
    end);
    coroutine.resume(v27, v27);
end;
checkForLeaveArea = function() --[[ Line: 555 ]] --[[ Name: checkForLeaveArea ]]
    -- upvalues: v24 (ref), l_LocalPlayer_0 (ref)
    while v24 do
        if v24.Parent and l_LocalPlayer_0:DistanceFromCharacter(v24.Parent.Position) >= v24.ConversationDistance then
            wanderDialog();
        end;
        wait(1);
    end;
end;
startDialog = function(v106) --[[ Line: 564 ]] --[[ Name: startDialog ]]
    -- upvalues: l_RbxAnalyticsService_0 (copy), l_LocalPlayer_0 (ref), v34 (copy)
    if v106.Parent and v106.Parent:IsA("BasePart") then
        l_RbxAnalyticsService_0:TrackEvent("Dialogue", "Old Dialogue", "Conversation Initiated");
        if l_LocalPlayer_0:DistanceFromCharacter(v106.Parent.Position) >= v106.ConversationDistance then
            showMessage("You are too far away to chat!", 300);
            return;
        else
            for v107, v108 in pairs(v34) do
                if v107 and v108 then
                    v108.Enabled = false;
                end;
            end;
            renewKillswitch(v106);
            delay(1, checkForLeaveArea);
            doDialog(v106);
        end;
    end;
end;
removeDialog = function(v109) --[[ Line: 586 ]] --[[ Name: removeDialog ]]
    -- upvalues: v34 (copy), v35 (copy)
    if v34[v109] then
        v34[v109]:Destroy();
        v34[v109] = nil;
    end;
    if v35[v109] then
        v35[v109]:disconnect();
        v35[v109] = nil;
    end;
end;
addDialog = function(v110) --[[ Line: 597 ]] --[[ Name: addDialog ]]
    -- upvalues: v11 (ref), l_RbxAnalyticsService_0 (copy), v32 (ref), l_CoreGui_0 (copy), v34 (copy), v35 (copy), v24 (ref)
    if v110.Parent then
        if v110.Parent:IsA("BasePart") and v110:IsDescendantOf(game.Workspace) then
            v11 = true;
            l_RbxAnalyticsService_0:TrackEvent("Dialogue", "Old Dialogue", "Used In Place", nil, game.PlaceId);
            local v111 = v32:clone();
            v111.Adornee = v110.Parent;
            v111.RobloxLocked = true;
            local v112 = not v110.InUse;
            if not v112 then
                local l_status_4, l_result_4 = pcall(function() --[[ Line: 123 ]]
                    -- upvalues: v110 (copy)
                    return v110.BehaviorType == Enum.DialogBehaviorType.MultiplePlayers;
                end);
                v112 = l_status_4 and l_result_4 or false;
            end;
            v111.Enabled = v112;
            v111.Parent = l_CoreGui_0;
            v111.Background.MouseButton1Click:connect(function() --[[ Line: 609 ]]
                -- upvalues: v110 (copy)
                startDialog(v110);
            end);
            setChatNotificationTone(v111, v110.Purpose, v110.Tone);
            v34[v110] = v111;
            v35[v110] = v110.Changed:connect(function(v115) --[[ Line: 616 ]]
                -- upvalues: v110 (copy), v111 (copy), v24 (ref)
                if v115 == "Parent" and v110.Parent then
                    removeDialog(v110);
                    addDialog(v110);
                    return;
                else
                    if v115 == "InUse" then
                        local l_v110_0 = v110;
                        local l_l_v110_0_0 = l_v110_0 --[[ copy: 2 -> 5 ]];
                        local l_status_5, l_result_5 = pcall(function() --[[ Line: 123 ]]
                            -- upvalues: l_l_v110_0_0 (copy)
                            return l_l_v110_0_0.BehaviorType == Enum.DialogBehaviorType.MultiplePlayers;
                        end);
                        if not (l_status_5 and l_result_5 or false) then
                            local l_v111_0 = v111;
                            l_v110_0 = false;
                            if v24 == nil then
                                l_v110_0 = not v110.InUse;
                            end;
                            l_v111_0.Enabled = l_v110_0;
                        else
                            v111.Enabled = v24 ~= v110;
                        end;
                        if not v110.InUse then
                            l_v110_0 = v110;
                            l_status_5, l_result_5 = pcall(function() --[[ Line: 123 ]]
                                -- upvalues: l_v110_0 (copy)
                                return l_v110_0.BehaviorType == Enum.DialogBehaviorType.MultiplePlayers;
                            end);
                            if not (l_status_5 and l_result_5 or false) and v110 == v24 then
                                timeoutDialog();
                                return;
                            end;
                        end;
                    elseif v115 == "Tone" or v115 == "Purpose" then
                        setChatNotificationTone(v111, v110.Purpose, v110.Tone);
                    end;
                    return;
                end;
            end);
            return;
        else
            v35[v110] = v110.Changed:connect(function(v121) --[[ Line: 636 ]]
                -- upvalues: v110 (copy)
                if v121 == "Parent" and v110.Parent then
                    removeDialog(v110);
                    addDialog(v110);
                end;
            end);
        end;
    end;
end;
onLoad = function() --[[ Line: 647 ]] --[[ Name: onLoad ]]
    -- upvalues: v33 (ref), v37 (ref), l_TouchEnabled_0 (copy), v41 (copy)
    createChatNotificationGui();
    createMessageDialog();
    v33.RobloxLocked = true;
    v33.Parent = v37;
    v37:WaitForChild("BottomLeftControl");
    local l_Frame_1 = Instance.new("Frame");
    l_Frame_1.Name = "DialogFrame";
    l_Frame_1.Position = UDim2.new(0, 0, 0, 0);
    l_Frame_1.Size = UDim2.new(0, 0, 0, 0);
    l_Frame_1.BackgroundTransparency = 1;
    l_Frame_1.RobloxLocked = true;
    game:GetService("GuiService"):AddSelectionParent("RBXDialogGroup", l_Frame_1);
    if l_TouchEnabled_0 and not v41 then
        l_Frame_1.Position = UDim2.new(0, 20, 0.5, 0);
        l_Frame_1.Size = UDim2.new(0.25, 0, 0.1, 0);
        l_Frame_1.Parent = v37;
    elseif v41 then
        l_Frame_1.Position = UDim2.new(0, 0, 0.9, -10);
        l_Frame_1.Size = UDim2.new(0.25, 0, 0.1, 0);
        l_Frame_1.Parent = v37;
    else
        l_Frame_1.Parent = v37.BottomLeftControl;
    end;
    initialize(l_Frame_1);
    game:GetService("CollectionService").ItemAdded:Connect(function(v123) --[[ Line: 678 ]]
        if v123:IsA("Dialog") then
            addDialog(v123);
        end;
    end);
    game:GetService("CollectionService").ItemRemoved:Connect(function(v124) --[[ Line: 683 ]]
        if v124:IsA("Dialog") then
            removeDialog(v124);
        end;
    end);
    for _, v126 in pairs(game:GetService("CollectionService"):GetCollection("Dialog")) do
        if v126:IsA("Dialog") then
            addDialog(v126);
        end;
    end;
end;
getLocalHumanoidRootPart = function() --[[ Line: 695 ]] --[[ Name: getLocalHumanoidRootPart ]]
    -- upvalues: l_LocalPlayer_0 (ref)
    if l_LocalPlayer_0.Character then
        return l_LocalPlayer_0.Character:FindFirstChild("HumanoidRootPart");
    else
        return;
    end;
end;
dialogIsValid = function(v127) --[[ Line: 701 ]] --[[ Name: dialogIsValid ]]
    return v127 and v127.Parent and v127.Parent:IsA("BasePart");
end;
local v128 = nil;
local l_GetClosestDialogToPosition_0 = l_GuiService_0.GetClosestDialogToPosition;
game:GetService("RunService").Heartbeat:Connect(function() --[[ Line: 708 ]]
    -- upvalues: l_GetClosestDialogToPosition_0 (copy), l_GuiService_0 (copy), v24 (ref), l_LocalPlayer_0 (ref), v10 (ref), v128 (ref), v34 (copy), l_ContextActionService_0 (copy)
    local v130 = nil;
    local v131 = getLocalHumanoidRootPart();
    if v131 then
        local l_Position_0 = v131.Position;
        v130 = l_GetClosestDialogToPosition_0(l_GuiService_0, l_Position_0);
    end;
    if getLocalHumanoidRootPart() and dialogIsValid(v130) and v24 == nil then
        local l_TriggerDistance_0 = v130.TriggerDistance;
        local l_TriggerOffset_0 = v130.TriggerOffset;
        local v135 = l_LocalPlayer_0:DistanceFromCharacter(v130.Parent.Position + l_TriggerOffset_0);
        if l_TriggerDistance_0 ~= 0 and v135 < v130.ConversationDistance and v135 < l_TriggerDistance_0 then
            startDialog(v130);
        end;
    end;
    if v10 == true and v130 ~= v128 then
        if v34[v128] then
            v34[v128].Background.ActivationButton.Visible = false;
        end;
        v128 = v130;
        l_ContextActionService_0:UnbindCoreAction("StartDialogAction");
        if v130 ~= nil then
            l_ContextActionService_0:BindCoreAction("StartDialogAction", function(_, v137, _) --[[ Line: 743 ]]
                -- upvalues: v130 (ref)
                if v137 == Enum.UserInputState.Begin and v130 and v130.Parent then
                    startDialog(v130);
                end;
            end, false, Enum.KeyCode.ButtonX);
            if v34[v130] then
                v34[v130].Background.ActivationButton.Visible = true;
            end;
        end;
    end;
end);
local v139 = nil;
l_GuiService_0.Changed:connect(function(v140) --[[ Line: 760 ]]
    -- upvalues: v139 (ref), l_GuiService_0 (copy)
    if v140 == "SelectedCoreObject" then
        if v139 and v139:FindFirstChild("RBXchatDialogSelectionButton") then
            v139:FindFirstChild("RBXchatDialogSelectionButton").Visible = false;
            v139.BackgroundTransparency = 1;
        end;
        v139 = l_GuiService_0.SelectedCoreObject;
        if v139 and v139:FindFirstChild("RBXchatDialogSelectionButton") then
            v139:FindFirstChild("RBXchatDialogSelectionButton").Visible = true;
            v139.BackgroundTransparency = 0;
        end;
    end;
end);
onLoad();