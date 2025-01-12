local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_GuiService_0 = game:GetService("GuiService");
local l_TextService_0 = game:GetService("TextService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_GameSettings_0 = UserSettings().GameSettings;
local v6 = require(l_RobloxGui_0.Modules.Settings.Utility);
local v7 = require(l_RobloxGui_0.Modules.RobloxTranslator);
local v8 = require(l_RobloxGui_0.Modules.Common.PolicyService);
local v9 = require(l_RobloxGui_0.Modules.Settings.Theme);
local l_Create_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Create;
local v11 = nil;
l_RobloxGui_0:WaitForChild("Modules"):WaitForChild("TenFootInterface");
local v12 = require(l_RobloxGui_0.Modules.TenFootInterface):IsEnabled();
local l_status_0, l_result_0 = pcall(function() --[[ Line: 44 ]]
    return settings():GetFFlag("UseNotificationsLocalization");
end);
local v15 = l_status_0 and l_result_0;
local v16 = require(l_RobloxGui_0.Modules.Flags.GetFFlagOptimizeHelpMenuInputEvent);
local v17 = game:DefineFastFlag("ShowUpdatedScreenshotHotkey_v2", false);
local v18 = require(l_RobloxGui_0.Modules.Settings.Flags.GetFFlagFixIGMBottomBarVisibility);
v11 = (function() --[[ Line: 52 ]] --[[ Name: Initialize ]]
    -- upvalues: l_RobloxGui_0 (copy), l_UserInputService_0 (copy), l_Create_0 (copy), v9 (copy), v7 (copy), v8 (copy), v17 (copy), v12 (copy), v15 (copy), l_TextService_0 (copy), v6 (copy), l_GuiService_0 (copy), l_GameSettings_0 (copy), v16 (copy)
    local l_NewPage_0 = require(l_RobloxGui_0.Modules.Settings.SettingsPageFactory):CreateNewPage();
    l_NewPage_0.HelpPages = {};
    l_NewPage_0.HelpPageContents = {};
    l_NewPage_0.ActiveHelpScheme = nil;
    local v20 = nil;
    l_NewPage_0.GetCurrentInputType = function(_) --[[ Line: 61 ]] --[[ Name: GetCurrentInputType ]]
        -- upvalues: v20 (ref), l_UserInputService_0 (ref)
        if v20 == nil then
            local l_l_UserInputService_0_Platform_0 = l_UserInputService_0:GetPlatform();
            if l_l_UserInputService_0_Platform_0 == Enum.Platform.XBoxOne or l_l_UserInputService_0_Platform_0 == Enum.Platform.WiiU then
                return "Gamepad";
            elseif l_l_UserInputService_0_Platform_0 == Enum.Platform.Windows or l_l_UserInputService_0_Platform_0 == Enum.Platform.OSX then
                return "KeyboardMouse";
            else
                return "Touch";
            end;
        elseif v20 == Enum.UserInputType.Keyboard or v20 == Enum.UserInputType.MouseMovement or v20 == Enum.UserInputType.MouseButton1 or v20 == Enum.UserInputType.MouseButton2 or v20 == Enum.UserInputType.MouseButton3 or v20 == Enum.UserInputType.MouseWheel then
            return "KeyboardMouse";
        elseif v20 == Enum.UserInputType.Touch then
            return "Touch";
        elseif v20 == Enum.UserInputType.Gamepad1 or v20 == Enum.UserInputType.Gamepad2 or v20 == Enum.UserInputType.Gamepad3 or v20 == Enum.UserInputType.Gamepad4 then
            return "Gamepad";
        else
            return "KeyboardMouse";
        end;
    end;
    local function v48(v23) --[[ Line: 89 ]] --[[ Name: createPCHelp ]]
        -- upvalues: l_Create_0 (ref), v9 (ref), l_UserInputService_0 (ref), v7 (ref), v8 (ref), v17 (ref)
        local function v38(v24, v25) --[[ Line: 90 ]] --[[ Name: createPCGroup ]]
            -- upvalues: l_Create_0 (ref), v9 (ref)
            local v26 = l_Create_0("Frame")({
                Size = UDim2.new(0.3333333333333333, -4, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1, 
                Name = "PCGroupFrame" .. tostring(v24)
            });
            local _ = l_Create_0("UIListLayout")({
                FillDirection = Enum.FillDirection.Vertical, 
                Padding = UDim.new(0, 2), 
                Parent = v26, 
                SortOrder = Enum.SortOrder.LayoutOrder
            });
            local v28 = l_Create_0("TextLabel")({
                Position = UDim2.new(0, 9, 0, 0), 
                Size = UDim2.new(1, -9, 0, 30), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1, 
                Text = v24, 
                Font = v9.font(Enum.Font.SourceSansBold, "HelpTitle"), 
                FontSize = v9.fontSize(Enum.FontSize.Size18, "HelpTitle"), 
                TextColor3 = Color3.new(1, 1, 1), 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextWrapped = true, 
                Name = "PCGroupTitle" .. tostring(v24), 
                ZIndex = 2, 
                LayoutOrder = 1, 
                Parent = v26
            });
            local _ = l_Create_0("UIPadding")({
                PaddingLeft = UDim.new(0, 9), 
                Parent = v28
            });
            local v30 = 0;
            local l_Offset_0 = v28.Size.Y.Offset;
            for v32 = 1, #v25 do
                for v33, v34 in pairs(v25[v32]) do
                    local v35 = l_Create_0("Frame")({
                        Size = UDim2.new(1, 0, 0, 42), 
                        Position = UDim2.new(0, 0, 0, l_Offset_0 + 44 * v30), 
                        BackgroundTransparency = v9.transparency("InputActionBackground", 0.65), 
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        LayoutOrder = v32 + 1, 
                        BorderSizePixel = 0, 
                        ZIndex = 2, 
                        Name = "ActionInputBinding" .. tostring(v33), 
                        Parent = v26
                    });
                    if v9.UIBloxThemeEnabled then
                        v35.BackgroundColor3 = v9.color("InputActionBackground");
                        l_Create_0("UICorner")({
                            CornerRadius = UDim.new(0, 3), 
                            Parent = v35
                        });
                    end;
                    local v36 = l_Create_0("TextLabel")({
                        Size = UDim2.new(0.4, -9, 0, 42), 
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        Position = UDim2.new(0, 9, 0, 0), 
                        BackgroundTransparency = 1, 
                        Text = v33, 
                        Font = v9.font(Enum.Font.SourceSansBold, "HelpTitle"), 
                        FontSize = v9.fontSize(Enum.FontSize.Size18, "HelpTitle"), 
                        TextColor3 = Color3.new(1, 1, 1), 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        Name = v33 .. "Label", 
                        ZIndex = 2, 
                        Parent = v35, 
                        TextWrapped = true
                    });
                    Instance.new("UITextSizeConstraint", v36).MaxTextSize = v9.textSize(28);
                    local _ = l_Create_0("TextLabel")({
                        Size = UDim2.new(0.5, 0, 0, 42), 
                        Position = UDim2.new(0.5, -4, 0, 0), 
                        BackgroundTransparency = 1, 
                        Text = v34, 
                        Font = v9.font(Enum.Font.SourceSans, "HelpText"), 
                        FontSize = v9.fontSize(Enum.FontSize.Size18, "HelpText"), 
                        TextColor3 = Color3.new(1, 1, 1), 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        Name = v34 .. "Label", 
                        ZIndex = 2, 
                        Parent = v35, 
                        TextWrapped = true, 
                        TextScaled = false, 
                        AutomaticSize = Enum.AutomaticSize.Y
                    });
                    v30 = v30 + 1;
                end;
            end;
            v26.Size = UDim2.new(v26.Size.X.Scale, v26.Size.X.Offset, 0, l_Offset_0 + 44 * v30);
            return v26;
        end;
        local v39 = l_UserInputService_0:GetPlatform() == Enum.Platform.OSX;
        local v40 = v38("Character Movement", {
            [1] = {
                ["Move Forward"] = l_UserInputService_0:GetStringForKeyCode(Enum.KeyCode.W) .. "/" .. v7:FormatByKey("InGame.HelpMenu.UpArrow")
            }, 
            [2] = {
                ["Move Backward"] = l_UserInputService_0:GetStringForKeyCode(Enum.KeyCode.S) .. "/" .. v7:FormatByKey("InGame.HelpMenu.DownArrow")
            }, 
            [3] = {
                ["Move Left"] = l_UserInputService_0:GetStringForKeyCode(Enum.KeyCode.A) .. "/" .. v7:FormatByKey("InGame.HelpMenu.LeftArrow")
            }, 
            [4] = {
                ["Move Right"] = l_UserInputService_0:GetStringForKeyCode(Enum.KeyCode.D) .. "/" .. v7:FormatByKey("InGame.HelpMenu.RightArrow")
            }, 
            [5] = {
                Jump = "Space"
            }
        });
        v40.Parent = v23;
        v40.LayoutOrder = 1;
        local v41 = l_UserInputService_0:GetStringForKeyCode(Enum.KeyCode.One) .. "," .. l_UserInputService_0:GetStringForKeyCode(Enum.KeyCode.Two) .. "," .. l_UserInputService_0:GetStringForKeyCode(Enum.KeyCode.Three) .. "...";
        local v42 = v38("Accessories", {
            [1] = {
                ["Equip Tools"] = v41
            }, 
            [2] = {
                ["Unequip Tools"] = v41
            }, 
            [3] = {
                ["Drop Tool"] = "Backspace"
            }, 
            [4] = {
                ["Use Tool"] = "Left Mouse Button"
            }
        });
        v42.Position = UDim2.new(0.3333333333333333, 4, 0, 0);
        v42.Parent = v23;
        v42.LayoutOrder = 2;
        local v43 = {};
        table.insert(v43, {
            ["UI Selection Toggle"] = l_UserInputService_0:GetStringForKeyCode(Enum.KeyCode.BackSlash)
        });
        local v44 = not v8:IsSubjectToChinaPolicies();
        if v44 then
            if v17 then
                table.insert(v43, {
                    Screenshot = v39 and "Opt + 1" or "Alt + 1"
                });
            else
                table.insert(v43, {
                    Screenshot = v39 and "Cmd + Shift + 3" or "Print Screen"
                });
            end;
            if not v39 then
                table.insert(v43, {
                    ["Record Video"] = "F12"
                });
            end;
        end;
        if v44 then
            table.insert(v43, {
                ["Dev Console"] = v39 and "F9/fn + F9" or "F9"
            });
        end;
        table.insert(v43, {
            Mouselock = "Shift"
        });
        if v44 then
            table.insert(v43, {
                ["Graphics Level"] = v39 and "F10/fn + F10" or "F10"
            });
            table.insert(v43, {
                Fullscreen = v39 and "Ctrl + Cmd + F" or "F11"
            });
        end;
        if v44 then
            table.insert(v43, {
                ["Perf. Stats"] = v39 and "Fn+Opt+Cmd+F7" or "Ctrl + Shift + F7"
            });
        end;
        local v45 = v38("Misc", v43);
        v45.Position = UDim2.new(0.6666666666666666, 8, 0, 0);
        v45.Parent = v23;
        v45.LayoutOrder = 3;
        local v46 = v38("Camera Movement", {
            [1] = {
                Rotate = "Right Mouse Button"
            }, 
            [2] = {
                ["Zoom In/Out"] = "Mouse Wheel"
            }, 
            [3] = {
                ["Zoom In"] = l_UserInputService_0:GetStringForKeyCode(Enum.KeyCode.I)
            }, 
            [4] = {
                ["Zoom Out"] = l_UserInputService_0:GetStringForKeyCode(Enum.KeyCode.O)
            }
        });
        v46.Position = UDim2.new(0, 0, v40.Size.Y.Scale, v40.Size.Y.Offset + 50);
        v46.Parent = v23;
        v46.LayoutOrder = 4;
        local v47 = v38("Menu Items", {
            [1] = {
                ["Roblox Menu"] = "Esc"
            }, 
            [2] = {
                Backpack = l_UserInputService_0:GetStringForKeyCode(Enum.KeyCode.Backquote)
            }, 
            [3] = {
                Playerlist = "Tab"
            }, 
            [4] = {
                Chat = l_UserInputService_0:GetStringForKeyCode(Enum.KeyCode.Slash)
            }
        });
        v47.Position = UDim2.new(0.3333333333333333, 4, v40.Size.Y.Scale, v40.Size.Y.Offset + 50);
        v47.Parent = v23;
        v47.LayoutOrder = 5;
        v23.Size = UDim2.new(v23.Size.X.Scale, v23.Size.X.Offset, 0, v47.Size.Y.Offset + v47.Position.Y.Offset);
    end;
    local function v71(v49) --[[ Line: 301 ]] --[[ Name: createGamepadHelp ]]
        -- upvalues: l_NewPage_0 (copy), l_Create_0 (ref), v12 (ref), v9 (ref), v15 (ref), l_TextService_0 (ref)
        local v50 = math.max(l_NewPage_0.Page.AbsoluteSize.X * 0.58, 270);
        local v51 = UDim2.new(0, v50, 0, v50 * 0.64);
        local v52 = UDim2.new(0.5, -v51.X.Offset / 2 + 30, 0.5, -v51.Y.Offset / 2 + 7);
        local v53 = l_Create_0("ImageLabel")({
            Name = "GamepadImage", 
            Size = v51, 
            Position = v52, 
            Image = "rbxasset://textures/ui/Settings/Help/PlatformController.png", 
            BackgroundTransparency = 1, 
            ZIndex = 2, 
            Parent = v49
        });
        v49.Size = UDim2.new(v49.Size.X.Scale, v49.Size.X.Offset, 0, v53.Size.Y.Offset + 100);
        local v54 = v12 and v9.fontSize(Enum.FontSize.Size36) or v9.fontSize(Enum.FontSize.Size24);
        local v55 = v54 == v9.fontSize(Enum.FontSize.Size36) and v9.textSize(36) or v9.textSize(24);
        local function v67(v56, v57, v58, v59) --[[ Line: 321 ]] --[[ Name: createGamepadLabel ]]
            -- upvalues: v15 (ref), l_Create_0 (ref), v9 (ref), v54 (copy), v53 (copy), l_TextService_0 (ref), v55 (copy), v49 (copy)
            local v60 = nil;
            v60 = if v15 == true then l_Create_0("TextLabel")({
                Position = v57, 
                Size = v58, 
                BackgroundTransparency = 1, 
                Text = v56, 
                TextXAlignment = v59 and Enum.TextXAlignment.Right or Enum.TextXAlignment.Left, 
                AnchorPoint = v59 and Vector2.new(1, 0.5) or Vector2.new(0, 0.5), 
                Font = v9.font(Enum.Font.SourceSansBold, "HelpGamepad"), 
                FontSize = v54, 
                TextColor3 = Color3.new(1, 1, 1), 
                Name = v56 .. "Label", 
                ZIndex = 2, 
                Parent = v53, 
                TextScaled = true, 
                TextWrapped = true, 
                TextTruncate = Enum.TextTruncate.AtEnd
            }) else l_Create_0("TextLabel")({
                Position = v57, 
                Size = v58, 
                BackgroundTransparency = 1, 
                Text = v56, 
                TextXAlignment = v59 and Enum.TextXAlignment.Right or Enum.TextXAlignment.Left, 
                AnchorPoint = v59 and Vector2.new(1, 0.5) or Vector2.new(0, 0.5), 
                Font = v9.font(Enum.Font.SourceSansBold, "HelpGamepad"), 
                FontSize = v54, 
                TextColor3 = Color3.new(1, 1, 1), 
                Name = v56 .. "Label", 
                ZIndex = 2, 
                Parent = v53, 
                TextTruncate = Enum.TextTruncate.AtEnd
            });
            v60.TextWrapped = true;
            local l_X_0 = l_TextService_0:GetTextSize(v56, v55, v9.font(Enum.Font.SourceSansBold, "Bold"), Vector2.new(0, 0)).X;
            local v62 = math.abs(v57.X.Offset);
            local l_v49_0 = v49;
            local function v65() --[[ Line: 366 ]] --[[ Name: updateNameLabelSize ]]
                -- upvalues: v59 (copy), l_v49_0 (copy), v62 (copy), v60 (ref), v55 (ref), l_X_0 (copy), v54 (ref)
                local v64 = v59 and l_v49_0.AbsoluteSize.X / 2 + 30 - v62 or l_v49_0.AbsoluteSize.X / 2 - 30 - v62;
                v60.Size = UDim2.new(v60.Size.X.Scale, v64, v60.Size.Y.Scale, v55 * 2);
                v60.TextScaled = false;
                if v64 >= l_X_0 then
                    v60.FontSize = v54;
                end;
            end;
            local _ = l_v49_0:GetPropertyChangedSignal("AbsoluteSize"):connect(function() --[[ Line: 379 ]]
                -- upvalues: v65 (copy)
                v65();
            end);
            v65();
        end;
        local v68 = -v53.Size.X.Offset / 2 - 20;
        local v69 = v53.Size.X.Offset / 2 - 20;
        local v70 = v69 + 40;
        v67("Switch Tool", UDim2.new(0.5, v68, 0, 15), UDim2.new(0, 100, 0, v55), true);
        v67("Game Menu Toggle", UDim2.new(0.5, v68, 0.15, 10), UDim2.new(0, 164, 0, v55), true);
        v67("Move", UDim2.new(0.5, v68, 0.31, 5), UDim2.new(0, 46, 0, v55), true);
        v67("Menu Navigation", UDim2.new(0.5, v68, 0.46, 0), UDim2.new(0, 164, 0, v55), true);
        v67("Use Tool", UDim2.new(0.5, v69, 0, 15), UDim2.new(0, 73, 0, v55));
        v67("Roblox Menu", UDim2.new(0.5, v69, 0.15, 10), UDim2.new(0, 122, 0, v55));
        v67("Back", UDim2.new(0.5, v69, 0.31, 5), UDim2.new(0, 43, 0, v55));
        v67("Jump", UDim2.new(0.5, v69, 0.46, 0), UDim2.new(0, 49, 0, v55));
        v67("Rotate Camera", UDim2.new(0.5, v70, 0.62, -10), UDim2.new(0, 132, 0, v55));
        v67("Camera Zoom", UDim2.new(0.5, v70, 0.77, -10), UDim2.new(0, 122, 0, v55));
    end;
    local function v83(v72) --[[ Line: 406 ]] --[[ Name: updateTouchLayout ]]
        -- upvalues: l_NewPage_0 (copy), v6 (ref)
        l_NewPage_0.ActiveHelpScheme = v72;
        local v73 = v6:IsPortrait();
        if l_NewPage_0.HelpPages.Touch then
            local l_Touch_0 = l_NewPage_0.HelpPageContents.Touch;
            local function _(v75) --[[ Line: 414 ]] --[[ Name: hideUneeded ]]
                -- upvalues: l_Touch_0 (copy)
                if v75 then
                    for v76, v77 in pairs(l_Touch_0) do
                        v77.Visible = not v75[v76];
                    end;
                end;
            end;
            local v79 = nil;
            if v72 == Enum.TouchMovementMode.DynamicThumbstick or v72 == Enum.TouchMovementMode.Default then
                v79 = {
                    MoveImageCTM = true
                };
                l_Touch_0.MoveLabel.Position = v73 and UDim2.new(0.25, -l_Touch_0.MoveLabel.AbsoluteSize.x / 2, 0.75, -50) or UDim2.new(0.15, -l_Touch_0.MoveLabel.AbsoluteSize.x / 2, 0.85, -l_Touch_0.MoveLabel.AbsoluteSize.y);
                l_Touch_0.JumpLabel.Position = v73 and UDim2.new(0.75, -l_Touch_0.JumpLabel.AbsoluteSize.x / 2, 0.75, -50) or UDim2.new(0.85, -60, 0.85, -l_Touch_0.JumpLabel.AbsoluteSize.y);
                l_Touch_0.RotateLabel.Position = v73 and UDim2.new(1, -l_Touch_0.RotateLabel.AbsoluteSize.x - 20, 0.02, 0) or UDim2.new(0.85, -l_Touch_0.RotateLabel.AbsoluteSize.x / 2, 0.02, 0);
                l_Touch_0.UseToolLabel.Position = v73 and UDim2.new(0.5, -l_Touch_0.UseToolLabel.AbsoluteSize.x / 2, 0.5, -100) or UDim2.new(0.5, -l_Touch_0.UseToolLabel.AbsoluteSize.x / 2, 0.5, -60);
                l_Touch_0.EquipLabel.Position = v73 and UDim2.new(0.5, -60, 0.75, 50) or UDim2.new(0.5, -60, 0.64, 0);
                l_Touch_0.ZoomLabel.Position = v73 and UDim2.new(0, 20, 0.02, 0) or UDim2.new(0.15, -60, 0.02, 0);
            elseif v72 == Enum.TouchMovementMode.ClickToMove then
                v79 = {
                    MoveImageDTS = true, 
                    JumpLabel = true
                };
                l_Touch_0.MoveLabel.Position = v73 and UDim2.new(0.25, -l_Touch_0.MoveLabel.AbsoluteSize.x / 2, 0.5, 0) or UDim2.new(0.25, -l_Touch_0.MoveLabel.AbsoluteSize.x / 2, 0.5, 40);
                l_Touch_0.RotateLabel.Position = v73 and UDim2.new(1, -l_Touch_0.RotateLabel.AbsoluteSize.x - 20, 0.02, 0) or UDim2.new(0.5, -60, 0.02, 0);
                l_Touch_0.UseToolLabel.Position = v73 and UDim2.new(0.75, -l_Touch_0.UseToolLabel.AbsoluteSize.x / 2, 0.5, 0) or UDim2.new(0.85, -60, 0.02, 0);
                l_Touch_0.EquipLabel.Position = v73 and UDim2.new(0.5, -60, 0.75, 50) or UDim2.new(0.5, -60, 0.64, 0);
                l_Touch_0.ZoomLabel.Position = v73 and UDim2.new(0, 20, 0.02, 0) or UDim2.new(0.15, -60, 0.02, 0);
            else
                v79 = {
                    MoveImageDTS = true, 
                    MoveImageCTM = true, 
                    JumpImage = true
                };
                l_Touch_0.MoveLabel.Position = v73 and UDim2.new(0.06, 0, 1, -120) or UDim2.new(0.06, 0, 0.58, 0);
                l_Touch_0.JumpLabel.Position = v73 and UDim2.new(0.94, -l_Touch_0.JumpLabel.AbsoluteSize.x, 1, -120) or UDim2.new(0.8, 0, 0.58, 0);
                l_Touch_0.RotateLabel.Position = v73 and UDim2.new(1, -l_Touch_0.RotateLabel.AbsoluteSize.x - 20, 0.02, 0) or UDim2.new(0.5, -60, 0.02, 0);
                l_Touch_0.UseToolLabel.Position = v73 and UDim2.new(0.5, -l_Touch_0.UseToolLabel.AbsoluteSize.x / 2, 0.25, 50) or UDim2.new(0.85, -60, 0.02, 0);
                l_Touch_0.EquipLabel.Position = v73 and UDim2.new(0.5, -60, 0.75, 50) or UDim2.new(0.5, -60, 0.64, 0);
                l_Touch_0.ZoomLabel.Position = v73 and UDim2.new(0, 20, 0.02, 0) or UDim2.new(0.15, -60, 0.02, 0);
            end;
            local l_v79_0 = v79;
            if l_v79_0 then
                for v81, v82 in pairs(l_Touch_0) do
                    v82.Visible = not l_v79_0[v81];
                end;
            end;
        end;
    end;
    local function v106(v84) --[[ Line: 462 ]] --[[ Name: createTouchHelp ]]
        -- upvalues: v6 (ref), l_GuiService_0 (ref), l_Create_0 (ref), v9 (ref)
        local v85 = {};
        local v86 = v6:IsSmallTouchScreen();
        local v87 = l_GuiService_0:GetScreenResolution().y - 350;
        if v86 then
            v87 = l_GuiService_0:GetScreenResolution().y - 100;
        end;
        v84.Size = UDim2.new(1, 0, 0, v87);
        local function v95(v88, v89, v90, v91) --[[ Line: 471 ]] --[[ Name: createTouchLabel ]]
            -- upvalues: l_Create_0 (ref), v9 (ref), v86 (copy)
            local v92 = l_Create_0("TextLabel")({
                Position = v89, 
                Size = v90, 
                BackgroundTransparency = 1, 
                Name = v88 .. "Frame", 
                Parent = v91
            });
            local v93 = l_Create_0("TextLabel")({
                Position = UDim2.new(0, 0, 0, 0), 
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1, 
                Text = v88, 
                Font = v9.font(Enum.Font.SourceSansBold, "HelpTouch"), 
                FontSize = v9.fontSize(Enum.FontSize.Size14, "HelpTouch"), 
                TextColor3 = Color3.new(1, 1, 1), 
                Name = v88 .. "Label", 
                ZIndex = 3, 
                Parent = v92, 
                TextScaled = true, 
                TextWrapped = true
            });
            if not v86 then
                v93.FontSize = v9.fontSize(Enum.FontSize.Size18, "HelpTitle");
                v93.Size = UDim2.new(v93.Size.X.Scale, v93.Size.X.Offset, v93.Size.Y.Scale, v93.Size.Y.Offset + 4);
            end;
            local _ = l_Create_0("ImageLabel")({
                Name = v88 .. "BackgroundImage", 
                Size = UDim2.new(1.25, 0, 1.25, 0), 
                Position = UDim2.new(-0.125, 0, -0.065, 0), 
                BackgroundTransparency = 1, 
                Image = "rbxasset://textures/ui/Settings/Radial/RadialLabel.png", 
                ScaleType = Enum.ScaleType.Slice, 
                SliceCenter = Rect.new(12, 2, 65, 21), 
                ZIndex = 2, 
                Parent = v92
            });
            Instance.new("UITextSizeConstraint", v93).MaxTextSize = v9.textSize(18, "HelpText");
            return v92;
        end;
        local function _(v96, v97, v98, v99, v100) --[[ Line: 521 ]] --[[ Name: createTouchGestureImage ]]
            -- upvalues: l_Create_0 (ref)
            return (l_Create_0("ImageLabel")({
                Name = v96, 
                Size = v99, 
                Position = v98, 
                BackgroundTransparency = 1, 
                Image = v97, 
                ZIndex = 2, 
                Parent = v100
            }));
        end;
        local v102 = 30;
        if v86 then
            v102 = 0;
        end;
        v85.MoveLabel = v95("Move", UDim2.new(0.06, 0, 0.58, 0), UDim2.new(0, 77 + v102, 0, 25), v84);
        local v103 = UDim2.new(0.5, -32, 1, 3);
        local v104 = UDim2.new(0, 65, 0, 48);
        local l_MoveLabel_0 = v85.MoveLabel;
        v85.MoveImageDTS = l_Create_0("ImageLabel")({
            Name = "MoveImageDTS", 
            Size = v104, 
            Position = v103, 
            BackgroundTransparency = 1, 
            Image = "rbxasset://textures/ui/Settings/Help/RotateCameraGesture.png", 
            ZIndex = 2, 
            Parent = l_MoveLabel_0
        });
        v103 = UDim2.new(0.5, -19, 1, 3);
        v104 = UDim2.new(0, 38, 0, 52);
        l_MoveLabel_0 = v85.MoveLabel;
        v85.MoveImageCTM = l_Create_0("ImageLabel")({
            Name = "MoveImageCTM", 
            Size = v104, 
            Position = v103, 
            BackgroundTransparency = 1, 
            Image = "rbxasset://textures/ui/Settings/Help/UseToolGesture.png", 
            ZIndex = 2, 
            Parent = l_MoveLabel_0
        });
        v85.JumpLabel = v95("Jump", UDim2.new(0.8, 0, 0.58, 0), UDim2.new(0, 77 + v102, 0, 25), v84);
        v103 = UDim2.new(0.5, -19, 1, 3);
        v104 = UDim2.new(0, 38, 0, 52);
        l_MoveLabel_0 = v85.JumpLabel;
        v85.JumpImage = l_Create_0("ImageLabel")({
            Name = "JumpImage", 
            Size = v104, 
            Position = v103, 
            BackgroundTransparency = 1, 
            Image = "rbxasset://textures/ui/Settings/Help/UseToolGesture.png", 
            ZIndex = 2, 
            Parent = l_MoveLabel_0
        });
        v85.EquipLabel = v95("Equip/Unequip Tools", UDim2.new(0.5, -60, 0.64, 0), UDim2.new(0, 120 + v102, 0, 25), v84);
        v85.ZoomLabel = v95("Zoom In/Out", UDim2.new(0.15, -60, 0.02, 0), UDim2.new(0, 120, 0, 25), v84);
        v103 = UDim2.new(0.5, -26, 1, 3);
        v104 = UDim2.new(0, 53, 0, 59);
        l_MoveLabel_0 = v85.ZoomLabel;
        v85.ZoomImage = l_Create_0("ImageLabel")({
            Name = "ZoomImage", 
            Size = v104, 
            Position = v103, 
            BackgroundTransparency = 1, 
            Image = "rbxasset://textures/ui/Settings/Help/ZoomGesture.png", 
            ZIndex = 2, 
            Parent = l_MoveLabel_0
        });
        v85.RotateLabel = v95("Rotate Camera", UDim2.new(0.5, -60, 0.02, 0), UDim2.new(0, 120, 0, 25), v84);
        v103 = UDim2.new(0.5, -32, 1, 3);
        v104 = UDim2.new(0, 65, 0, 48);
        l_MoveLabel_0 = v85.RotateLabel;
        v85.RotateImage = l_Create_0("ImageLabel")({
            Name = "RotateImage", 
            Size = v104, 
            Position = v103, 
            BackgroundTransparency = 1, 
            Image = "rbxasset://textures/ui/Settings/Help/RotateCameraGesture.png", 
            ZIndex = 2, 
            Parent = l_MoveLabel_0
        });
        v85.UseToolLabel = v95("Use Tool", UDim2.new(0.85, -60, 0.02, 0), UDim2.new(0, 120, 0, 25), v84);
        v103 = UDim2.new(0.5, -19, 1, 3);
        v104 = UDim2.new(0, 38, 0, 52);
        l_MoveLabel_0 = v85.UseToolLabel;
        v85.ToolImage = l_Create_0("ImageLabel")({
            Name = "ToolImage", 
            Size = v104, 
            Position = v103, 
            BackgroundTransparency = 1, 
            Image = "rbxasset://textures/ui/Settings/Help/UseToolGesture.png", 
            ZIndex = 2, 
            Parent = l_MoveLabel_0
        });
        return v85;
    end;
    local function v111(v107) --[[ Line: 561 ]] --[[ Name: createHelpDisplay ]]
        -- upvalues: l_Create_0 (ref), v48 (copy), v71 (copy), v106 (copy)
        local v108 = nil;
        local v109 = l_Create_0("Frame")({
            Size = UDim2.new(1, 0, 1, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            Name = "HelpFrame" .. tostring(v107)
        });
        if v107 == "KeyboardMouse" then
            local _ = l_Create_0("UIListLayout")({
                FillDirection = Enum.FillDirection.Horizontal, 
                Wraps = true, 
                Parent = v109, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 4)
            });
        end;
        if v107 == "KeyboardMouse" then
            v48(v109);
        elseif v107 == "Gamepad" then
            v71(v109);
        elseif v107 == "Touch" then
            v108 = v106(v109);
        end;
        return v109, v108;
    end;
    local function v115(v112) --[[ Line: 593 ]] --[[ Name: displayHelp ]]
        -- upvalues: l_NewPage_0 (copy), v12 (ref), l_UserInputService_0 (ref)
        for _, v114 in pairs(l_NewPage_0.HelpPages) do
            if v114 == v112 then
                v114.Parent = l_NewPage_0.Page;
                l_NewPage_0.Page.Size = v114.Size;
                if v12 then
                    l_NewPage_0.Page.Size = UDim2.new(v114.Size.X.Scale, v114.Size.X.Offset, v114.Size.Y.Scale, 0);
                end;
            else
                v114.Parent = nil;
            end;
        end;
        if l_UserInputService_0:GetPlatform() == Enum.Platform.XBoxOne then
            l_NewPage_0.HubRef.PageViewClipper.ClipsDescendants = false;
            l_NewPage_0.HubRef.PageView.ClipsDescendants = false;
        end;
    end;
    local function v116(v117) --[[ Line: 611 ]] --[[ Name: switchToHelp ]]
        -- upvalues: l_NewPage_0 (copy), v115 (copy), l_GameSettings_0 (ref), v83 (copy), v111 (copy), v116 (copy)
        local v118 = l_NewPage_0.HelpPages[v117];
        if v118 then
            v115(v118);
            if v117 == "Touch" then
                local l_TouchMovementMode_0 = l_GameSettings_0.TouchMovementMode;
                if l_NewPage_0.ActiveHelpScheme ~= l_TouchMovementMode_0 then
                    v83(l_TouchMovementMode_0);
                    return;
                end;
            end;
        else
            local l_HelpPages_0 = l_NewPage_0.HelpPages;
            local l_HelpPageContents_0 = l_NewPage_0.HelpPageContents;
            local v122, v123 = v111(v117);
            l_HelpPages_0[v117] = v122;
            l_HelpPageContents_0[v117] = v123;
            v116(v117);
        end;
    end;
    local function _() --[[ Line: 628 ]] --[[ Name: showTypeOfHelp ]]
        -- upvalues: v116 (copy), l_NewPage_0 (copy)
        v116(l_NewPage_0:GetCurrentInputType());
    end;
    l_NewPage_0.PageDisplayed = function(_) --[[ Line: 632 ]] --[[ Name: PageDisplayed ]]
        -- upvalues: l_NewPage_0 (copy), l_UserInputService_0 (ref), v20 (ref), v116 (copy)
        if not l_NewPage_0.LastInputTypeChangedConnection then
            l_NewPage_0.LastInputTypeChangedConnection = l_UserInputService_0.LastInputTypeChanged:Connect(function(v126) --[[ Line: 634 ]]
                -- upvalues: v20 (ref), v116 (ref), l_NewPage_0 (ref)
                if v126 ~= Enum.UserInputType.Focus and v126 ~= Enum.UserInputType.None then
                    v20 = v126;
                    v116(l_NewPage_0:GetCurrentInputType());
                end;
            end);
        end;
        v20 = l_UserInputService_0:GetLastInputType();
        v116(l_NewPage_0:GetCurrentInputType());
    end;
    l_NewPage_0.PageHidden = function(_) --[[ Line: 645 ]] --[[ Name: PageHidden ]]
        -- upvalues: l_NewPage_0 (copy)
        if l_NewPage_0.LastInputTypeChangedConnection then
            l_NewPage_0.LastInputTypeChangedConnection:Disconnect();
            l_NewPage_0.LastInputTypeChangedConnection = nil;
        end;
    end;
    local function v133(v128) --[[ Line: 652 ]] --[[ Name: adjustForScreenLayout ]]
        -- upvalues: l_NewPage_0 (copy), l_GameSettings_0 (ref), v6 (ref), l_GuiService_0 (ref), v9 (ref), v83 (copy)
        if l_NewPage_0:GetCurrentInputType() == "Touch" then
            local l_TouchMovementMode_1 = l_GameSettings_0.TouchMovementMode;
            local v130 = v6:IsSmallTouchScreen();
            local v131 = v128 or l_GuiService_0:GetScreenResolution();
            local v132 = v131.y - 350;
            if v130 then
                v132 = if v9.UIBloxThemeEnabled then v131.y - 120 else v131.y - 100;
            end;
            l_NewPage_0.HelpPages.Touch.Size = UDim2.new(1, 0, 0, v132);
            v83(l_TouchMovementMode_1);
        end;
    end;
    l_NewPage_0.TabHeader.Name = "HelpTab";
    if v9.UIBloxThemeEnabled then
        l_NewPage_0.TabHeader.TabLabel.Icon.Image = "rbxasset://textures/ui/Settings/MenuBarIcons/HelpTab.png";
        local v134 = v9.Images["icons/menu/help"];
        l_NewPage_0.TabHeader.TabLabel.Icon.ImageRectOffset = v134.ImageRectOffset;
        l_NewPage_0.TabHeader.TabLabel.Icon.ImageRectSize = v134.ImageRectSize;
        l_NewPage_0.TabHeader.TabLabel.Icon.Image = v134.Image;
        l_NewPage_0.TabHeader.TabLabel.Title.Text = "Help";
    else
        l_NewPage_0.TabHeader.Icon.Image = "rbxasset://textures/ui/Settings/MenuBarIcons/HelpTab.png";
        if v15 then
            l_NewPage_0.TabHeader.Title.Text = "Help";
        else
            l_NewPage_0.TabHeader.Icon.Title.Text = "Help";
        end;
    end;
    l_NewPage_0.Page.Name = "Help";
    if not v16() then
        l_UserInputService_0.InputBegan:connect(function(v135) --[[ Line: 696 ]]
            -- upvalues: v20 (ref), v116 (copy), l_NewPage_0 (copy)
            local l_UserInputType_0 = v135.UserInputType;
            if l_UserInputType_0 ~= Enum.UserInputType.Focus and l_UserInputType_0 ~= Enum.UserInputType.None then
                v20 = v135.UserInputType;
                v116(l_NewPage_0:GetCurrentInputType());
            end;
        end);
    end;
    v6:OnResized(l_NewPage_0, function(v137, _) --[[ Line: 705 ]]
        -- upvalues: l_NewPage_0 (copy), v133 (copy)
        if l_NewPage_0.HelpPages.Touch then
            v133(v137);
        end;
    end);
    return l_NewPage_0;
end)();
v11.Displayed.Event:connect(function() --[[ Line: 719 ]]
    -- upvalues: v16 (copy), v11 (ref), v18 (copy), v6 (copy)
    if v16() then
        v11:PageDisplayed();
    end;
    if not v18() then
        local v139 = v6:IsPortrait();
        if v11:GetCurrentInputType() == "Touch" and v11.HubRef.BottomButtonFrame and not v6:IsSmallTouchScreen() and not v139 then
            v11.HubRef.BottomButtonFrame.Visible = false;
        end;
    end;
    if v11.HubRef.VersionContainer then
        v11.HubRef.VersionContainer.Visible = true;
    end;
end);
v11.Hidden.Event:connect(function() --[[ Line: 736 ]]
    -- upvalues: v16 (copy), v11 (ref), v18 (copy), v6 (copy)
    if v16() then
        v11:PageHidden();
    end;
    v11.HubRef.PageViewClipper.ClipsDescendants = true;
    v11.HubRef.PageView.ClipsDescendants = true;
    v11.HubRef:ShowShield();
    if not v18() then
        local v140 = v6:IsPortrait();
        if v11:GetCurrentInputType() == "Touch" and v11.HubRef.BottomButtonFrame and not v6:IsSmallTouchScreen() and not v140 then
            v11.HubRef.BottomButtonFrame.Visible = true;
        end;
    end;
    if v11.HubRef.VersionContainer then
        v11.HubRef.VersionContainer.Visible = false;
    end;
end);
return v11;