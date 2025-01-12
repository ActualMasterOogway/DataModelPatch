local l_UserInputService_0 = game:GetService("UserInputService");
local l_ProximityPromptService_0 = game:GetService("ProximityPromptService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_TweenService_0 = game:GetService("TweenService");
local l_RunService_0 = game:GetService("RunService");
local l_Players_0 = game:GetService("Players");
local l_RobloxGui_0 = l_CoreGui_0.RobloxGui;
local v8 = require(l_RobloxGui_0.Modules.CoreUtility);
local l_AppFonts_0 = require(l_CorePackages_0.Workspace.Packages.Style).AppFonts;
local v10 = require(l_RobloxGui_0.Modules.Flags.FFlagEnableAutomaticSizeVerticalOffsetWidthFix);
local v11 = require(l_RobloxGui_0.Modules.Flags.FFlagFixProximityPromptAncestry);
local v12 = game:DefineFastFlag("FixProximityPromptOffsetPop", false);
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
while l_LocalPlayer_0 == nil do
    l_Players_0.ChildAdded:wait();
    l_LocalPlayer_0 = l_Players_0.LocalPlayer;
end;
local v14 = v8.waitForChildOfClass(l_LocalPlayer_0, "PlayerGui");
local v15 = {
    [Enum.KeyCode.Backspace] = "rbxasset://textures/ui/Controls/backspace.png", 
    [Enum.KeyCode.Return] = "rbxasset://textures/ui/Controls/return.png", 
    [Enum.KeyCode.LeftShift] = "rbxasset://textures/ui/Controls/shift.png", 
    [Enum.KeyCode.RightShift] = "rbxasset://textures/ui/Controls/shift.png", 
    [Enum.KeyCode.Tab] = "rbxasset://textures/ui/Controls/tab.png"
};
if l_UserInputService_0:GetPlatform() == Enum.Platform.OSX then
    v15[Enum.KeyCode.LeftMeta] = "rbxasset://textures/ui/Controls/command.png";
    v15[Enum.KeyCode.RightMeta] = "rbxasset://textures/ui/Controls/command.png";
    v15[Enum.KeyCode.LeftAlt] = "rbxasset://textures/ui/Controls/option.png";
    v15[Enum.KeyCode.RightAlt] = "rbxasset://textures/ui/Controls/option.png";
end;
local v16 = {
    ["'"] = "rbxasset://textures/ui/Controls/apostrophe.png", 
    [","] = "rbxasset://textures/ui/Controls/comma.png", 
    ["`"] = "rbxasset://textures/ui/Controls/graveaccent.png", 
    ["."] = "rbxasset://textures/ui/Controls/period.png", 
    [" "] = "rbxasset://textures/ui/Controls/spacebar.png"
};
local v17 = {
    [Enum.KeyCode.LeftControl] = "Ctrl", 
    [Enum.KeyCode.RightControl] = "Ctrl", 
    [Enum.KeyCode.LeftAlt] = "Alt", 
    [Enum.KeyCode.RightAlt] = "Alt", 
    [Enum.KeyCode.F1] = "F1", 
    [Enum.KeyCode.F2] = "F2", 
    [Enum.KeyCode.F3] = "F3", 
    [Enum.KeyCode.F4] = "F4", 
    [Enum.KeyCode.F5] = "F5", 
    [Enum.KeyCode.F6] = "F6", 
    [Enum.KeyCode.F7] = "F7", 
    [Enum.KeyCode.F8] = "F8", 
    [Enum.KeyCode.F9] = "F9", 
    [Enum.KeyCode.F10] = "F10", 
    [Enum.KeyCode.F11] = "F11", 
    [Enum.KeyCode.F12] = "F12", 
    [Enum.KeyCode.PageUp] = "PgUp", 
    [Enum.KeyCode.PageDown] = "PgDn", 
    [Enum.KeyCode.Home] = "Home", 
    [Enum.KeyCode.End] = "End", 
    [Enum.KeyCode.Insert] = "Ins", 
    [Enum.KeyCode.Delete] = "Del"
};
local v18 = {
    [Enum.KeyCode.LeftControl] = 12, 
    [Enum.KeyCode.RightControl] = 12, 
    [Enum.KeyCode.LeftAlt] = 12, 
    [Enum.KeyCode.RightAlt] = 12, 
    [Enum.KeyCode.F10] = 12, 
    [Enum.KeyCode.F11] = 12, 
    [Enum.KeyCode.F12] = 12, 
    [Enum.KeyCode.PageUp] = 8, 
    [Enum.KeyCode.PageDown] = 8, 
    [Enum.KeyCode.Home] = 8, 
    [Enum.KeyCode.End] = 10, 
    [Enum.KeyCode.Insert] = 10, 
    [Enum.KeyCode.Delete] = 10
};
local function _() --[[ Line: 93 ]] --[[ Name: getScreenGui ]]
    -- upvalues: v14 (copy)
    local l_ProximityPrompts_0 = v14:FindFirstChild("ProximityPrompts");
    if l_ProximityPrompts_0 == nil then
        l_ProximityPrompts_0 = Instance.new("ScreenGui");
        l_ProximityPrompts_0.Name = "ProximityPrompts";
        l_ProximityPrompts_0.ResetOnSpawn = false;
        l_ProximityPrompts_0.Parent = v14;
        l_ProximityPrompts_0.IgnoreGuiInset = true;
    end;
    return l_ProximityPrompts_0;
end;
local function v29(v21, v22, v23, v24) --[[ Line: 105 ]] --[[ Name: createProgressBarGradient ]]
    -- upvalues: l_TweenService_0 (copy)
    local l_Frame_0 = Instance.new("Frame");
    l_Frame_0.Size = UDim2.fromScale(0.5, 1);
    l_Frame_0.Position = UDim2.fromScale(v22 and 0 or 0.5, 0);
    l_Frame_0.BackgroundTransparency = 1;
    l_Frame_0.ClipsDescendants = true;
    l_Frame_0.Parent = v21;
    local l_ImageLabel_0 = Instance.new("ImageLabel");
    l_ImageLabel_0.BackgroundTransparency = 1;
    l_ImageLabel_0.Size = UDim2.fromScale(2, 1);
    l_ImageLabel_0.Position = UDim2.fromScale(v22 and 0 or -1, 0);
    l_ImageLabel_0.Image = "rbxasset://textures/ui/Controls/RadialFill.png";
    l_ImageLabel_0.Parent = l_Frame_0;
    local l_UIGradient_0 = Instance.new("UIGradient");
    l_UIGradient_0.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0), 
        NumberSequenceKeypoint.new(0.4999, 0), 
        NumberSequenceKeypoint.new(0.5, 1), 
        NumberSequenceKeypoint.new(1, 1)
    });
    l_UIGradient_0.Rotation = v22 and 180 or 0;
    l_UIGradient_0.Parent = l_ImageLabel_0;
    local v28 = TweenInfo.new(0.06, Enum.EasingStyle.Linear, Enum.EasingDirection.Out);
    table.insert(v23, l_TweenService_0:Create(l_ImageLabel_0, v28, {
        ImageTransparency = 1
    }));
    table.insert(v24, l_TweenService_0:Create(l_ImageLabel_0, v28, {
        ImageTransparency = 0
    }));
    return l_UIGradient_0;
end;
local function v38(v30, v31) --[[ Line: 137 ]] --[[ Name: createCircularProgressBar ]]
    -- upvalues: v29 (copy)
    local l_Frame_1 = Instance.new("Frame");
    l_Frame_1.Name = "CircularProgressBar";
    l_Frame_1.Size = UDim2.fromOffset(58, 58);
    l_Frame_1.AnchorPoint = Vector2.new(0.5, 0.5);
    l_Frame_1.Position = UDim2.fromScale(0.5, 0.5);
    l_Frame_1.BackgroundTransparency = 1;
    local v33 = v29(l_Frame_1, true, v30, v31);
    local v34 = v29(l_Frame_1, false, v30, v31);
    local l_NumberValue_0 = Instance.new("NumberValue");
    l_NumberValue_0.Name = "Progress";
    l_NumberValue_0.Parent = l_Frame_1;
    l_NumberValue_0.Changed:Connect(function(v36) --[[ Line: 151 ]]
        -- upvalues: v33 (copy), v34 (copy)
        local v37 = math.clamp(v36 * 360, 0, 360);
        v33.Rotation = math.clamp(v37, 180, 360);
        v34.Rotation = math.clamp(v37, 0, 180);
    end);
    return l_Frame_1;
end;
local function v102(v39, v40, v41) --[[ Line: 160 ]] --[[ Name: createPrompt ]]
    -- upvalues: l_TweenService_0 (copy), l_AppFonts_0 (copy), l_UserInputService_0 (copy), v15 (copy), v16 (copy), v17 (copy), v18 (copy), v38 (copy), v10 (copy), v12 (copy), l_RunService_0 (copy), v11 (copy)
    local v42 = {};
    local v43 = {};
    local v44 = {};
    local v45 = {};
    local v46 = TweenInfo.new(v39.HoldDuration, Enum.EasingStyle.Linear, Enum.EasingDirection.Out);
    local v47 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
    local v48 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
    local v49 = TweenInfo.new(0.06, Enum.EasingStyle.Linear, Enum.EasingDirection.Out);
    local l_BillboardGui_0 = Instance.new("BillboardGui");
    l_BillboardGui_0.Name = "Prompt";
    l_BillboardGui_0.AlwaysOnTop = true;
    local l_Frame_2 = Instance.new("Frame");
    l_Frame_2.Size = UDim2.fromScale(0.5, 1);
    l_Frame_2.BackgroundTransparency = 1;
    l_Frame_2.BackgroundColor3 = Color3.new(0.07, 0.07, 0.07);
    l_Frame_2.AnchorPoint = Vector2.new(0.5, 0);
    l_Frame_2.Position = UDim2.fromScale(0.5, 0);
    l_Frame_2.Size = UDim2.fromScale(0, 1);
    l_Frame_2.AutomaticSize = Enum.AutomaticSize.X;
    l_Frame_2.Parent = l_BillboardGui_0;
    local l_UIPadding_0 = Instance.new("UIPadding");
    l_UIPadding_0.Parent = l_Frame_2;
    Instance.new("UICorner").Parent = l_Frame_2;
    local l_Frame_3 = Instance.new("Frame");
    l_Frame_3.Name = "InputFrame";
    l_Frame_3.Size = UDim2.fromScale(1, 1);
    l_Frame_3.BackgroundTransparency = 1;
    l_Frame_3.SizeConstraint = Enum.SizeConstraint.RelativeYY;
    l_Frame_3.Parent = l_Frame_2;
    local l_Frame_4 = Instance.new("Frame");
    l_Frame_4.Size = UDim2.fromScale(1, 1);
    l_Frame_4.Position = UDim2.fromScale(0.5, 0.5);
    l_Frame_4.AnchorPoint = Vector2.new(0.5, 0.5);
    l_Frame_4.BackgroundTransparency = 1;
    l_Frame_4.Parent = l_Frame_3;
    local l_UIScale_0 = Instance.new("UIScale");
    l_UIScale_0.Parent = l_Frame_4;
    local v56 = v40 == Enum.ProximityPromptInputType.Touch and 1.6 or 1.33;
    table.insert(v42, l_TweenService_0:Create(l_UIScale_0, v48, {
        Scale = v56
    }));
    table.insert(v43, l_TweenService_0:Create(l_UIScale_0, v48, {
        Scale = 1
    }));
    local l_TextLabel_0 = Instance.new("TextLabel");
    l_TextLabel_0.Name = "ActionText";
    l_TextLabel_0.Font = l_AppFonts_0.default:getMedium();
    l_TextLabel_0.TextSize = 19;
    l_TextLabel_0.BackgroundTransparency = 1;
    l_TextLabel_0.TextTransparency = 1;
    l_TextLabel_0.TextColor3 = Color3.new(1, 1, 1);
    l_TextLabel_0.TextXAlignment = Enum.TextXAlignment.Left;
    table.insert(v42, l_TweenService_0:Create(l_TextLabel_0, v48, {
        TextTransparency = 1
    }));
    table.insert(v43, l_TweenService_0:Create(l_TextLabel_0, v48, {
        TextTransparency = 0
    }));
    table.insert(v44, l_TweenService_0:Create(l_TextLabel_0, v48, {
        TextTransparency = 1
    }));
    table.insert(v45, l_TweenService_0:Create(l_TextLabel_0, v48, {
        TextTransparency = 0
    }));
    local l_TextLabel_1 = Instance.new("TextLabel");
    l_TextLabel_1.Name = "ObjectText";
    l_TextLabel_1.Font = l_AppFonts_0.default:getMedium();
    l_TextLabel_1.TextSize = 14;
    l_TextLabel_1.BackgroundTransparency = 1;
    l_TextLabel_1.TextTransparency = 1;
    l_TextLabel_1.TextColor3 = Color3.new(0.7, 0.7, 0.7);
    l_TextLabel_1.TextXAlignment = Enum.TextXAlignment.Left;
    local l_UIListLayout_0 = Instance.new("UIListLayout");
    l_UIListLayout_0.FillDirection = Enum.FillDirection.Horizontal;
    l_UIListLayout_0.Padding = UDim.new(-0.25, 0);
    l_UIListLayout_0.Parent = l_Frame_2;
    table.insert(v42, l_TweenService_0:Create(l_UIListLayout_0, v48, {
        Padding = UDim.new(-0.25, 0)
    }));
    table.insert(v43, l_TweenService_0:Create(l_UIListLayout_0, v48, {
        Padding = UDim.new(0, 0)
    }));
    table.insert(v44, l_TweenService_0:Create(l_UIListLayout_0, v48, {
        Padding = UDim.new(-0.25, 0)
    }));
    table.insert(v45, l_TweenService_0:Create(l_UIListLayout_0, v48, {
        Padding = UDim.new(0, 0)
    }));
    local l_Frame_5 = Instance.new("Frame");
    l_Frame_5.Name = "TextFrame";
    l_Frame_5.Size = UDim2.fromScale(0, 1);
    l_Frame_5.AutomaticSize = Enum.AutomaticSize.X;
    l_Frame_5.BackgroundTransparency = 1;
    l_Frame_5.Parent = l_Frame_2;
    l_TextLabel_0.Size = UDim2.fromScale(0, 1);
    l_TextLabel_0.AutomaticSize = Enum.AutomaticSize.X;
    l_TextLabel_0.Parent = l_Frame_5;
    l_TextLabel_1.Size = UDim2.fromScale(0, 1);
    l_TextLabel_1.AutomaticSize = Enum.AutomaticSize.X;
    l_TextLabel_1.Parent = l_Frame_5;
    table.insert(v42, l_TweenService_0:Create(l_TextLabel_1, v48, {
        TextTransparency = 1
    }));
    table.insert(v43, l_TweenService_0:Create(l_TextLabel_1, v48, {
        TextTransparency = 0
    }));
    table.insert(v44, l_TweenService_0:Create(l_TextLabel_1, v48, {
        TextTransparency = 1
    }));
    table.insert(v45, l_TweenService_0:Create(l_TextLabel_1, v48, {
        TextTransparency = 0
    }));
    table.insert(v42, l_TweenService_0:Create(l_Frame_2, v48, {
        BackgroundTransparency = 1
    }));
    table.insert(v43, l_TweenService_0:Create(l_Frame_2, v48, {
        BackgroundTransparency = 0.2
    }));
    table.insert(v44, l_TweenService_0:Create(l_Frame_2, v48, {
        BackgroundTransparency = 1
    }));
    table.insert(v45, l_TweenService_0:Create(l_Frame_2, v48, {
        BackgroundTransparency = 0.2
    }));
    local l_Frame_6 = Instance.new("Frame");
    l_Frame_6.Name = "RoundFrame";
    l_Frame_6.Size = UDim2.fromOffset(48, 48);
    l_Frame_6.AnchorPoint = Vector2.new(0.5, 0.5);
    l_Frame_6.Position = UDim2.fromScale(0.5, 0.5);
    l_Frame_6.BackgroundTransparency = 1;
    l_Frame_6.Parent = l_Frame_4;
    local l_UICorner_0 = Instance.new("UICorner");
    l_UICorner_0.CornerRadius = UDim.new(0.5, 0);
    l_UICorner_0.Parent = l_Frame_6;
    table.insert(v44, l_TweenService_0:Create(l_Frame_6, v49, {
        BackgroundTransparency = 1
    }));
    table.insert(v45, l_TweenService_0:Create(l_Frame_6, v49, {
        BackgroundTransparency = 0.5
    }));
    if v40 == Enum.ProximityPromptInputType.Gamepad then
        local l_l_UserInputService_0_ImageForKeyCode_0 = l_UserInputService_0:GetImageForKeyCode(v39.GamepadKeyCode);
        if l_l_UserInputService_0_ImageForKeyCode_0 then
            local l_ImageLabel_1 = Instance.new("ImageLabel");
            l_ImageLabel_1.Name = "ButtonImage";
            l_ImageLabel_1.AnchorPoint = Vector2.new(0.5, 0.5);
            l_ImageLabel_1.Size = UDim2.fromOffset(24, 24);
            l_ImageLabel_1.Position = UDim2.fromScale(0.5, 0.5);
            l_ImageLabel_1.BackgroundTransparency = 1;
            l_ImageLabel_1.ImageTransparency = 1;
            l_ImageLabel_1.Image = l_l_UserInputService_0_ImageForKeyCode_0;
            l_ImageLabel_1.Parent = l_Frame_4;
            table.insert(v44, l_TweenService_0:Create(l_ImageLabel_1, v49, {
                ImageTransparency = 1
            }));
            table.insert(v45, l_TweenService_0:Create(l_ImageLabel_1, v49, {
                ImageTransparency = 0
            }));
        end;
    elseif v40 == Enum.ProximityPromptInputType.Touch then
        local l_ImageLabel_2 = Instance.new("ImageLabel");
        l_ImageLabel_2.Name = "ButtonImage";
        l_ImageLabel_2.BackgroundTransparency = 1;
        l_ImageLabel_2.ImageTransparency = 1;
        l_ImageLabel_2.Size = UDim2.fromOffset(25, 31);
        l_ImageLabel_2.AnchorPoint = Vector2.new(0.5, 0.5);
        l_ImageLabel_2.Position = UDim2.fromScale(0.5, 0.5);
        l_ImageLabel_2.Image = "rbxasset://textures/ui/Controls/TouchTapIcon.png";
        l_ImageLabel_2.Parent = l_Frame_4;
        table.insert(v44, l_TweenService_0:Create(l_ImageLabel_2, v49, {
            ImageTransparency = 1
        }));
        table.insert(v45, l_TweenService_0:Create(l_ImageLabel_2, v49, {
            ImageTransparency = 0
        }));
    else
        local l_ImageLabel_3 = Instance.new("ImageLabel");
        l_ImageLabel_3.Name = "ButtonImage";
        l_ImageLabel_3.BackgroundTransparency = 1;
        l_ImageLabel_3.ImageTransparency = 1;
        l_ImageLabel_3.Size = UDim2.fromOffset(28, 30);
        l_ImageLabel_3.AnchorPoint = Vector2.new(0.5, 0.5);
        l_ImageLabel_3.Position = UDim2.fromScale(0.5, 0.5);
        l_ImageLabel_3.Image = "rbxasset://textures/ui/Controls/key_single.png";
        l_ImageLabel_3.Parent = l_Frame_4;
        table.insert(v44, l_TweenService_0:Create(l_ImageLabel_3, v49, {
            ImageTransparency = 1
        }));
        table.insert(v45, l_TweenService_0:Create(l_ImageLabel_3, v49, {
            ImageTransparency = 0
        }));
        local l_l_UserInputService_0_StringForKeyCode_0 = l_UserInputService_0:GetStringForKeyCode(v39.KeyboardKeyCode);
        local v68 = v15[v39.KeyboardKeyCode];
        if v68 == nil then
            v68 = v16[l_l_UserInputService_0_StringForKeyCode_0];
        end;
        if v68 == nil then
            local v69 = v17[v39.KeyboardKeyCode];
            if v69 then
                l_l_UserInputService_0_StringForKeyCode_0 = v69;
            end;
        end;
        if v68 then
            local l_ImageLabel_4 = Instance.new("ImageLabel");
            l_ImageLabel_4.Name = "ButtonImage";
            l_ImageLabel_4.AnchorPoint = Vector2.new(0.5, 0.5);
            l_ImageLabel_4.Size = UDim2.fromOffset(36, 36);
            l_ImageLabel_4.Position = UDim2.fromScale(0.5, 0.5);
            l_ImageLabel_4.BackgroundTransparency = 1;
            l_ImageLabel_4.ImageTransparency = 1;
            l_ImageLabel_4.Image = v68;
            l_ImageLabel_4.Parent = l_Frame_4;
            table.insert(v44, l_TweenService_0:Create(l_ImageLabel_4, v49, {
                ImageTransparency = 1
            }));
            table.insert(v45, l_TweenService_0:Create(l_ImageLabel_4, v49, {
                ImageTransparency = 0
            }));
        elseif l_l_UserInputService_0_StringForKeyCode_0 ~= nil and l_l_UserInputService_0_StringForKeyCode_0 ~= "" then
            local l_TextLabel_2 = Instance.new("TextLabel");
            l_TextLabel_2.Name = "ButtonText";
            l_TextLabel_2.AutoLocalize = false;
            l_TextLabel_2.Position = UDim2.fromOffset(0, -1);
            l_TextLabel_2.Size = UDim2.fromScale(1, 1);
            l_TextLabel_2.Font = l_AppFonts_0.default:getMedium();
            local v72 = v18[v39.KeyboardKeyCode];
            if v72 == nil then
                v72 = 14;
            end;
            l_TextLabel_2.TextSize = v72;
            l_TextLabel_2.BackgroundTransparency = 1;
            l_TextLabel_2.TextTransparency = 1;
            l_TextLabel_2.TextColor3 = Color3.new(1, 1, 1);
            l_TextLabel_2.TextXAlignment = Enum.TextXAlignment.Center;
            l_TextLabel_2.Text = l_l_UserInputService_0_StringForKeyCode_0;
            l_TextLabel_2.Parent = l_Frame_4;
            table.insert(v44, l_TweenService_0:Create(l_TextLabel_2, v49, {
                TextTransparency = 1
            }));
            table.insert(v45, l_TweenService_0:Create(l_TextLabel_2, v49, {
                TextTransparency = 0
            }));
        else
            error("ProximityPrompt '" .. v39.Name .. "' has an unsupported keycode for rendering UI: " .. tostring(v39.KeyboardKeyCode));
        end;
    end;
    if v40 == Enum.ProximityPromptInputType.Touch or v39.ClickablePrompt then
        local l_TextButton_0 = Instance.new("TextButton");
        l_TextButton_0.BackgroundTransparency = 1;
        l_TextButton_0.TextTransparency = 1;
        l_TextButton_0.Size = UDim2.fromScale(1, 1);
        l_TextButton_0.Parent = l_BillboardGui_0;
        l_TextButton_0.Selectable = false;
        local v74 = false;
        do
            local l_v74_0 = v74;
            l_TextButton_0.InputBegan:Connect(function(v76) --[[ Line: 393 ]]
                -- upvalues: v39 (copy), l_v74_0 (ref)
                if (v76.UserInputType == Enum.UserInputType.Touch or v76.UserInputType == Enum.UserInputType.MouseButton1) and v76.UserInputState ~= Enum.UserInputState.Change then
                    v39:InputHoldBegin();
                    l_v74_0 = true;
                end;
            end);
            l_TextButton_0.InputEnded:Connect(function(v77) --[[ Line: 400 ]]
                -- upvalues: l_v74_0 (ref), v39 (copy)
                if (v77.UserInputType == Enum.UserInputType.Touch or v77.UserInputType == Enum.UserInputType.MouseButton1) and l_v74_0 then
                    l_v74_0 = false;
                    v39:InputHoldEnd();
                end;
            end);
            l_BillboardGui_0.Active = true;
        end;
    end;
    if v39.HoldDuration > 0 then
        local v78 = v38(v44, v45);
        v78.Parent = l_Frame_4;
        table.insert(v42, l_TweenService_0:Create(v78.Progress, v46, {
            Value = 1
        }));
        table.insert(v43, l_TweenService_0:Create(v78.Progress, v47, {
            Value = 0
        }));
    end;
    local v79 = nil;
    local v80 = nil;
    local v81 = nil;
    local v82 = nil;
    if v39.HoldDuration > 0 then
        v79 = v39.PromptButtonHoldBegan:Connect(function() --[[ Line: 425 ]]
            -- upvalues: v42 (copy)
            for _, v84 in ipairs(v42) do
                v84:Play();
            end;
        end);
        v80 = v39.PromptButtonHoldEnded:Connect(function() --[[ Line: 431 ]]
            -- upvalues: v43 (copy)
            for _, v86 in ipairs(v43) do
                v86:Play();
            end;
        end);
    end;
    v81 = v39.Triggered:Connect(function() --[[ Line: 438 ]]
        -- upvalues: v44 (copy)
        for _, v88 in ipairs(v44) do
            v88:Play();
        end;
    end);
    v82 = v39.TriggerEnded:Connect(function() --[[ Line: 444 ]]
        -- upvalues: v45 (copy)
        for _, v90 in ipairs(v45) do
            v90:Play();
        end;
    end);
    local function v94() --[[ Line: 450 ]] --[[ Name: updateUIFromPrompt ]]
        -- upvalues: v39 (copy), l_TextLabel_0 (copy), l_TextLabel_1 (copy), v10 (ref), l_UIPadding_0 (copy), l_BillboardGui_0 (copy), v12 (ref), l_RunService_0 (ref), l_Frame_2 (copy)
        local v91 = 72;
        local v92 = 24;
        local v93 = 0;
        if v39.ObjectText ~= nil and v39.ObjectText ~= "" then
            v93 = 9;
        end;
        l_TextLabel_0.Text = v39.ActionText;
        l_TextLabel_1.Text = v39.ObjectText;
        l_TextLabel_0.AutoLocalize = v39.AutoLocalize;
        l_TextLabel_0.RootLocalizationTable = v39.RootLocalizationTable;
        l_TextLabel_1.AutoLocalize = v39.AutoLocalize;
        l_TextLabel_1.RootLocalizationTable = v39.RootLocalizationTable;
        if not v10 then
            v92 = v92 - v93;
        end;
        if v39.ActionText ~= nil and v39.ActionText ~= "" or v39.ObjectText ~= nil and v39.ObjectText ~= "" then
            l_UIPadding_0.PaddingRight = UDim.new(0, v92);
        else
            l_UIPadding_0.PaddingRight = UDim.new(0, 0);
        end;
        l_TextLabel_0.Position = UDim2.new(0, 0, 0, v93);
        l_TextLabel_1.Position = UDim2.new(0, 0, 0, -10);
        l_BillboardGui_0.Size = UDim2.fromOffset(v91, 72);
        if v12 then
            l_BillboardGui_0.SizeOffset = Vector2.new(v39.UIOffset.X / l_BillboardGui_0.Size.Width.Offset, v39.UIOffset.Y / l_BillboardGui_0.Size.Height.Offset);
        end;
        task.defer(function() --[[ Line: 492 ]]
            -- upvalues: l_RunService_0 (ref), v91 (ref), l_Frame_2 (ref), l_BillboardGui_0 (ref), v39 (ref)
            l_RunService_0.RenderStepped:Wait();
            l_RunService_0.RenderStepped:Wait();
            v91 = l_Frame_2.AbsoluteSize.X;
            l_BillboardGui_0.Size = UDim2.fromOffset(v91, 72);
            l_BillboardGui_0.SizeOffset = Vector2.new(v39.UIOffset.X / l_BillboardGui_0.Size.Width.Offset, v39.UIOffset.Y / l_BillboardGui_0.Size.Height.Offset);
        end);
    end;
    local v95 = v39.Changed:Connect(v94);
    v94();
    l_BillboardGui_0.Adornee = v39.Parent;
    l_BillboardGui_0.Parent = v41;
    local function v96() --[[ Line: 509 ]] --[[ Name: updateUIAncestry ]]
        -- upvalues: l_BillboardGui_0 (copy), v39 (copy)
        l_BillboardGui_0.Adornee = v39.Parent;
    end;
    local v97 = nil;
    if v11 then
        v97 = v39.AncestryChanged:Connect(v96);
    end;
    for _, v99 in ipairs(v45) do
        v99:Play();
    end;
    return function() --[[ Line: 521 ]] --[[ Name: cleanup ]]
        -- upvalues: v79 (ref), v80 (ref), v81 (ref), v82 (ref), v95 (copy), v11 (ref), v97 (ref), v44 (copy), l_BillboardGui_0 (copy)
        if v79 then
            v79:Disconnect();
        end;
        if v80 then
            v80:Disconnect();
        end;
        v81:Disconnect();
        v82:Disconnect();
        v95:Disconnect();
        if v11 then
            v97:Disconnect();
        end;
        for _, v101 in ipairs(v44) do
            v101:Play();
        end;
        wait(0.2);
        l_BillboardGui_0.Parent = nil;
    end;
end;
local function _() --[[ Line: 549 ]] --[[ Name: onLoad ]]
    -- upvalues: l_ProximityPromptService_0 (copy), v14 (copy), v102 (copy)
    l_ProximityPromptService_0.PromptShown:Connect(function(v103, v104) --[[ Line: 550 ]]
        -- upvalues: v14 (ref), v102 (ref)
        if v103.Style == Enum.ProximityPromptStyle.Custom then
            return;
        else
            local l_ProximityPrompts_1 = v14:FindFirstChild("ProximityPrompts");
            if l_ProximityPrompts_1 == nil then
                l_ProximityPrompts_1 = Instance.new("ScreenGui");
                l_ProximityPrompts_1.Name = "ProximityPrompts";
                l_ProximityPrompts_1.ResetOnSpawn = false;
                l_ProximityPrompts_1.Parent = v14;
                l_ProximityPrompts_1.IgnoreGuiInset = true;
            end;
            l_ProximityPrompts_1 = v102(v103, v104, l_ProximityPrompts_1);
            local l_BindableEvent_0 = Instance.new("BindableEvent");
            local v107 = v103.PromptHidden:Connect(function() --[[ Line: 561 ]]
                -- upvalues: l_BindableEvent_0 (copy)
                l_BindableEvent_0:Fire();
            end);
            local v108 = v103.Destroying:Connect(function() --[[ Line: 564 ]]
                -- upvalues: l_BindableEvent_0 (copy)
                l_BindableEvent_0:Fire();
            end);
            l_BindableEvent_0.Event:Wait();
            v107:Disconnect();
            v108:Disconnect();
            l_ProximityPrompts_1();
            return;
        end;
    end);
end;
l_ProximityPromptService_0.PromptShown:Connect(function(v110, v111) --[[ Line: 550 ]]
    -- upvalues: v14 (copy), v102 (copy)
    if v110.Style == Enum.ProximityPromptStyle.Custom then
        return;
    else
        local l_ProximityPrompts_2 = v14:FindFirstChild("ProximityPrompts");
        if l_ProximityPrompts_2 == nil then
            l_ProximityPrompts_2 = Instance.new("ScreenGui");
            l_ProximityPrompts_2.Name = "ProximityPrompts";
            l_ProximityPrompts_2.ResetOnSpawn = false;
            l_ProximityPrompts_2.Parent = v14;
            l_ProximityPrompts_2.IgnoreGuiInset = true;
        end;
        l_ProximityPrompts_2 = v102(v110, v111, l_ProximityPrompts_2);
        local l_BindableEvent_1 = Instance.new("BindableEvent");
        local v114 = v110.PromptHidden:Connect(function() --[[ Line: 561 ]]
            -- upvalues: l_BindableEvent_1 (copy)
            l_BindableEvent_1:Fire();
        end);
        local v115 = v110.Destroying:Connect(function() --[[ Line: 564 ]]
            -- upvalues: l_BindableEvent_1 (copy)
            l_BindableEvent_1:Fire();
        end);
        l_BindableEvent_1.Event:Wait();
        v114:Disconnect();
        v115:Disconnect();
        l_ProximityPrompts_2();
        return;
    end;
end);