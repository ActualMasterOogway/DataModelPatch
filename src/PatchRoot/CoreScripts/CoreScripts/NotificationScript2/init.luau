local l_BadgeService_0 = game:GetService("BadgeService");
local l_GuiService_0 = game:GetService("GuiService");
local l_Players_0 = game:GetService("Players");
local l_PointsService_0 = game:GetService("PointsService");
local l_MarketplaceService_0 = game:GetService("MarketplaceService");
local l_TextService_0 = game:GetService("TextService");
local l_HttpService_0 = game:GetService("HttpService");
local _ = game:GetService("UserInputService");
local l_StarterGui_0 = game:GetService("StarterGui");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_VRService_0 = game:GetService("VRService");
local l_GroupService_0 = game:GetService("GroupService");
local l_TeleportService_0 = game:GetService("TeleportService");
local l_RobloxGui_0 = l_CoreGui_0.RobloxGui;
local l_GameSettings_0 = UserSettings().GameSettings;
local v16 = require(l_RobloxGui_0.Modules.Flags.FFlagCoreScriptShowTeleportPrompt);
local v17 = game:DefineFastFlag("LogAcceptFriendshipEvent", false);
local l_game_EngineFeature_0 = game:GetEngineFeature("ClientToastNotificationsEnabled");
local v19 = require(l_RobloxGui_0.Modules.Flags.GetFFlagClientToastNotificationsRedirect);
local v20 = require(l_RobloxGui_0.Modules.shouldSaveScreenshotToAlbum);
local v21 = require(l_RobloxGui_0.Modules.RobloxTranslator);
local function _(v22, v23) --[[ Line: 45 ]] --[[ Name: LocalizedGetString ]]
    -- upvalues: v21 (copy)
    pcall(function() --[[ Line: 46 ]]
        -- upvalues: v23 (ref), v21 (ref), v22 (copy)
        v23 = v21:FormatByKey(v22);
    end);
    return v23;
end;
local v25 = nil;
while not l_Players_0.LocalPlayer do
    l_Players_0:GetPropertyChangedSignal("LocalPlayer"):Wait();
end;
v25 = l_Players_0.LocalPlayer;
local l_Parent_0 = script.Parent;
local v27 = {};
local v28 = {};
local v29 = {};
local v30 = {};
local l_Value_0 = l_GameSettings_0.SavedQualityLevel.Value;
local l_BindableEvent_0 = Instance.new("BindableEvent");
l_BindableEvent_0.Name = "SendNotificationInfo";
l_BindableEvent_0.Parent = l_RobloxGui_0;
local v33 = require(l_RobloxGui_0.Modules.TenFootInterface):IsEnabled();
local v34 = true;
local v35 = true;
local v36 = require(l_RobloxGui_0.Modules.SocialUtil);
local v37 = require(l_RobloxGui_0.Modules.GameTranslator);
local v38 = require(l_RobloxGui_0.Modules.Common.PolicyService);
local v39 = 0.6 * l_GameSettings_0.PreferredTransparency;
local v40 = v33 and 72 or 48;
local v41 = v33 and 145 or 64;
local v42 = v33 and 450 or 200;
local v43 = v40 / 6;
local v44 = v33 and 42 or 18;
local v45 = v33 and 84 or 36;
local v46 = -v44;
local v47 = v33 and Enum.FontSize.Size42 or Enum.FontSize.Size18;
local v48 = v33 and 72 or 28;
local v49 = v33 and 144 or 56;
local v50 = v33 and Enum.FontSize.Size36 or Enum.FontSize.Size14;
local v51 = v41 / 2;
local v52 = v43 / 2;
local v53 = v33 and Enum.FontSize.Size42 or Enum.FontSize.Size18;
local v54 = v33 and 42 or 18;
local v55 = v33 and 30 or 14;
local l_InOut_0 = Enum.EasingDirection.InOut;
local l_Sine_0 = Enum.EasingStyle.Sine;
local v58 = 5;
local l_status_0, l_result_0 = pcall(function() --[[ Line: 108 ]]
    return (tonumber(settings():GetFVariable("FriendRequestNotificationThrottle")));
end);
if l_status_0 and l_result_0 ~= nil then
    v58 = l_result_0;
end;
l_StarterGui_0:RegisterSetCore("PointsNotificationsActive", function(v61) --[[ Line: 115 ]]
    -- upvalues: v34 (ref)
    if type(v61) == "boolean" then
        v34 = v61;
    end;
end);
l_StarterGui_0:RegisterSetCore("BadgesNotificationsActive", function(v62) --[[ Line: 120 ]]
    -- upvalues: v35 (ref)
    if type(v62) == "boolean" then
        v35 = v62;
    end;
end);
l_StarterGui_0:RegisterGetCore("PointsNotificationsActive", function() --[[ Line: 126 ]]
    -- upvalues: v34 (ref)
    return v34;
end);
l_StarterGui_0:RegisterGetCore("BadgesNotificationsActive", function() --[[ Line: 129 ]]
    -- upvalues: v35 (ref)
    return v35;
end);
local function _(v63, v64, v65, v66) --[[ Line: 136 ]] --[[ Name: createFrame ]]
    local l_Frame_0 = Instance.new("Frame");
    l_Frame_0.Name = v63;
    l_Frame_0.Size = v64;
    l_Frame_0.Position = v65;
    l_Frame_0.BackgroundTransparency = v66;
    return l_Frame_0;
end;
local function v74(v69, v70) --[[ Line: 146 ]] --[[ Name: createTextButton ]]
    -- upvalues: v51 (copy), v39 (ref), v53 (copy), v52 (copy), v54 (copy), v55 (copy)
    local l_TextButton_0 = Instance.new("TextButton");
    l_TextButton_0.Name = v69;
    l_TextButton_0.Size = UDim2.new(0.5, -1, 0, v51);
    l_TextButton_0.Position = v70;
    l_TextButton_0.BackgroundTransparency = v39;
    l_TextButton_0.BackgroundColor3 = Color3.new(0, 0, 0);
    l_TextButton_0.BorderSizePixel = 0;
    l_TextButton_0.Font = Enum.Font.SourceSansBold;
    l_TextButton_0.FontSize = v53;
    l_TextButton_0.TextColor3 = Color3.new(1, 1, 1);
    l_TextButton_0.TextTruncate = Enum.TextTruncate.AtEnd;
    l_TextButton_0.TextScaled = true;
    local l_UIPadding_0 = Instance.new("UIPadding");
    l_UIPadding_0.PaddingTop = UDim.new(0, v52 / 2);
    l_UIPadding_0.PaddingBottom = UDim.new(0, v52 / 2);
    l_UIPadding_0.PaddingLeft = UDim.new(0, v52);
    l_UIPadding_0.PaddingRight = UDim.new(0, v52);
    l_UIPadding_0.Parent = l_TextButton_0;
    local l_UITextSizeConstraint_0 = Instance.new("UITextSizeConstraint");
    l_UITextSizeConstraint_0.MaxTextSize = v54;
    l_UITextSizeConstraint_0.MinTextSize = v55;
    l_UITextSizeConstraint_0.Parent = l_TextButton_0;
    return l_TextButton_0;
end;
local v75 = UDim2.new(0, v42, 0.42, 0);
local v76 = UDim2.new(1, -v42 - 4, 0.5, 0);
local l_Frame_1 = Instance.new("Frame");
l_Frame_1.Name = "NotificationFrame";
l_Frame_1.Size = v75;
l_Frame_1.Position = v76;
l_Frame_1.BackgroundTransparency = 1;
local l_l_Frame_1_0 = l_Frame_1;
if v16 then
    l_l_Frame_1_0.ZIndex = 3;
else
    l_l_Frame_1_0.ZIndex = 2;
end;
l_l_Frame_1_0.Parent = l_Parent_0;
v76 = (function() --[[ Line: 188 ]] --[[ Name: createDefaultNotification ]]
    -- upvalues: v41 (copy), v39 (ref)
    local v79 = UDim2.new(1, 0, 0, v41);
    local v80 = UDim2.new(0, 0, 0, 0);
    local l_v39_0 = v39;
    local l_Frame_2 = Instance.new("Frame");
    l_Frame_2.Name = "Notification";
    l_Frame_2.Size = v79;
    l_Frame_2.Position = v80;
    l_Frame_2.BackgroundTransparency = l_v39_0;
    local l_l_Frame_2_0 = l_Frame_2;
    l_l_Frame_2_0.BackgroundColor3 = Color3.new(0, 0, 0);
    l_l_Frame_2_0.BorderSizePixel = 0;
    return l_l_Frame_2_0;
end)();
l_Frame_1 = Instance.new("TextLabel");
l_Frame_1.Name = "NotificationTitle";
l_Frame_1.Size = UDim2.new(1, -v43 * 2, 0, v44);
l_Frame_1.Position = UDim2.new(0, v43, 0.5, v46);
l_Frame_1.BackgroundTransparency = 1;
l_Frame_1.Font = Enum.Font.SourceSansBold;
l_Frame_1.FontSize = v47;
l_Frame_1.TextColor3 = Color3.new(0.97, 0.97, 0.97);
local l_TextLabel_0 = Instance.new("TextLabel");
l_TextLabel_0.Name = "NotificationText";
l_TextLabel_0.Size = UDim2.new(1, -v43 * 2, 0, v48);
l_TextLabel_0.Position = UDim2.new(0, v43, 0.5, 1);
l_TextLabel_0.BackgroundTransparency = 1;
l_TextLabel_0.Font = Enum.Font.SourceSans;
l_TextLabel_0.FontSize = v50;
l_TextLabel_0.TextColor3 = Color3.new(0.92, 0.92, 0.92);
l_TextLabel_0.TextWrap = true;
l_TextLabel_0.TextYAlignment = Enum.TextYAlignment.Top;
local l_ImageLabel_0 = Instance.new("ImageLabel");
l_ImageLabel_0.Name = "NotificationImage";
l_ImageLabel_0.Size = UDim2.new(0, v40, 0, v40);
l_ImageLabel_0.Position = UDim2.new(0, v43, 0, 0.5 * (v41 - v40));
l_ImageLabel_0.BackgroundTransparency = 1;
l_ImageLabel_0.Image = "";
local v86 = UDim2.new(0, 360, 0, 160);
local v87 = UDim2.new(0.5, -180, 0.5, -50);
local l_Frame_3 = Instance.new("Frame");
l_Frame_3.Name = "PopupFrame";
l_Frame_3.Size = v86;
l_Frame_3.Position = v87;
l_Frame_3.BackgroundTransparency = 0;
local l_l_Frame_3_0 = l_Frame_3;
l_l_Frame_3_0.Style = Enum.FrameStyle.DropShadow;
l_l_Frame_3_0.ZIndex = 4;
l_l_Frame_3_0.Visible = false;
l_l_Frame_3_0.Parent = l_Parent_0;
v86 = Instance.new("TextButton");
v86.Name = "PopupAcceptButton";
v86.Size = UDim2.new(0, 100, 0, 50);
v86.Position = UDim2.new(0.5, -102, 1, -58);
v86.Style = Enum.ButtonStyle.RobloxRoundButton;
v86.Font = Enum.Font.SourceSansBold;
v86.FontSize = Enum.FontSize.Size24;
v86.TextColor3 = Color3.new(1, 1, 1);
v86.Text = "Accept";
v86.ZIndex = 5;
v86.Parent = l_l_Frame_3_0;
v87 = v86:Clone();
v87.Name = "PopupDeclineButton";
v87.Position = UDim2.new(0.5, 2, 1, -58);
v87.Text = "Decline";
v87.Parent = l_l_Frame_3_0;
l_Frame_3 = v86:Clone();
l_Frame_3.Name = "PopupOKButton";
l_Frame_3.Position = UDim2.new(0.5, -50, 1, -58);
l_Frame_3.Text = "OK";
l_Frame_3.Visible = false;
l_Frame_3.Parent = l_l_Frame_3_0;
local l_TextLabel_1 = Instance.new("TextLabel");
l_TextLabel_1.Name = "PopupText";
l_TextLabel_1.Size = UDim2.new(1, -16, 0.8, 0);
l_TextLabel_1.Position = UDim2.new(0, 8, 0, 8);
l_TextLabel_1.BackgroundTransparency = 1;
l_TextLabel_1.Font = Enum.Font.SourceSansBold;
l_TextLabel_1.FontSize = Enum.FontSize.Size36;
l_TextLabel_1.TextColor3 = Color3.new(0.97, 0.97, 0.97);
l_TextLabel_1.TextWrap = true;
l_TextLabel_1.ZIndex = 5;
l_TextLabel_1.TextYAlignment = Enum.TextYAlignment.Top;
l_TextLabel_1.Text = "This is a popup";
l_TextLabel_1.Parent = l_l_Frame_3_0;
local v91 = nil;
local v92 = nil;
local function _(v93) --[[ Line: 273 ]] --[[ Name: getFriendImage ]]
    -- upvalues: v36 (copy)
    return v36.GetPlayerImage(v93, Enum.ThumbnailSize.Size48x48, Enum.ThumbnailType.HeadShot, 5);
end;
local function v116(v95, v96, v97) --[[ Line: 284 ]] --[[ Name: createNotification ]]
    -- upvalues: v76 (copy), v41 (copy), l_Frame_1 (copy), l_TextLabel_0 (copy), l_TextService_0 (copy), v45 (copy), l_l_Frame_1_0 (copy), v49 (copy), v40 (copy), v43 (copy), l_ImageLabel_0 (copy), l_GuiService_0 (copy), l_HttpService_0 (copy)
    local v98 = v76:Clone();
    v98.Position = UDim2.new(1, 4, 1, -v41 - 4);
    local v99 = l_Frame_1:Clone();
    v99.Text = v95;
    v99.Parent = v98;
    local v100 = l_TextLabel_0:Clone();
    v100.Text = v96;
    v100.Parent = v98;
    local v101 = false;
    local function v103() --[[ Line: 297 ]] --[[ Name: updateNotificationForMultiLineTitle ]]
        -- upvalues: v101 (ref), v99 (copy), l_TextService_0 (ref), v45 (ref), v100 (copy), v98 (copy)
        v101 = true;
        v99.TextWrapped = true;
        v99.TextTruncate = Enum.TextTruncate.AtEnd;
        local v102 = math.min(l_TextService_0:GetTextSize(v99.Text, v99.TextSize, v99.Font, Vector2.new(v99.AbsoluteSize.X, 1000)).Y - v99.Size.Y.Offset, v45 - v99.Size.Y.Offset);
        v99.Size = v99.Size + UDim2.new(0, 0, 0, v102);
        v99.Position = v99.Position - UDim2.new(0, 0, 0, v102 / 2);
        v100.Position = v100.Position + UDim2.new(0, 0, 0, v102 / 2);
        v98.Size = v98.Size + UDim2.new(0, 0, 0, v102);
    end;
    v98.Parent = l_l_Frame_1_0;
    if v97 == nil or v97 == "" then
        if not v99.TextFits then
            v101 = true;
            v103();
        end;
        if not v100.TextFits then
            local v104 = math.min(l_TextService_0:GetTextSize(v100.Text, v100.TextSize, v100.Font, Vector2.new(v100.AbsoluteSize.X, 1000)).Y - v100.Size.Y.Offset, v49 - v100.Size.Y.Offset);
            v100.Size = v100.Size + UDim2.new(0, 0, 0, v104);
            v99.Position = v99.Position - UDim2.new(0, 0, 0, v104 / 2);
            v100.Position = v100.Position - UDim2.new(0, 0, 0, v104 / 2);
            v98.Size = v98.Size + UDim2.new(0, 0, 0, v104);
        end;
    else
        local v105 = v40 + v43 * 2;
        local l_v43_0 = v43;
        local v107 = l_ImageLabel_0:Clone();
        v107.Image = v97;
        v107.Parent = v98;
        v99.Size = UDim2.new(1, -v105 - l_v43_0, 0, v99.Size.Y.Offset);
        v99.Position = UDim2.new(0, v105, v99.Position.Y.Scale, v99.Position.Y.Offset);
        v99.TextXAlignment = Enum.TextXAlignment.Left;
        v100.Size = UDim2.new(1, -v105 - l_v43_0, 0, v100.Size.Y.Offset);
        v100.Position = UDim2.new(0, v105, v100.Position.Y.Scale, v100.Position.Y.Offset);
        v100.TextXAlignment = Enum.TextXAlignment.Left;
        if not v99.TextFits then
            v103();
            local l_TextSize_0 = v100.TextSize;
            v100.Size = v100.Size - UDim2.new(0, 0, 0, l_TextSize_0);
            v99.Position = v99.Position + UDim2.new(0, 0, 0, l_TextSize_0 / 2 - 2);
            v100.Position = v100.Position + UDim2.new(0, 0, 0, l_TextSize_0 / 2 - 2);
            v98.Size = v98.Size - UDim2.new(0, 0, 0, l_TextSize_0 + 4);
        end;
        if not v100.TextFits then
            local v109 = nil;
            local l_Text_0 = v100.Text;
            for v111 = string.len(l_Text_0) - 1, 2, -1 do
                if string.sub(l_Text_0, v111, v111) == " " then
                    v100.Text = string.sub(l_Text_0, 1, v111 - 1);
                    if v100.TextFits then
                        v109 = string.sub(l_Text_0, v111 + 1);
                        break;
                    end;
                end;
            end;
            if v109 then
                local v112 = l_TextLabel_0:Clone();
                v112.TextXAlignment = Enum.TextXAlignment.Left;
                v112.Text = v109;
                v112.Name = "ExtraText";
                v112.TextTruncate = Enum.TextTruncate.AtEnd;
                v112.Parent = v98;
                local v113 = math.min(l_TextService_0:GetTextSize(v109, v112.TextSize, v112.Font, Vector2.new(v112.AbsoluteSize.X, 1000)).Y, v49 - v100.Size.Y.Offset);
                v112.Size = UDim2.new(v112.Size.X.Scale, v112.Size.X.Offset, 0, v113);
                v99.Position = v99.Position - UDim2.new(0, 0, 0, v113 / 2);
                v100.Position = v100.Position - UDim2.new(0, 0, 0, v113 / 2);
                v98.Size = v98.Size + UDim2.new(0, 0, 0, v113);
                v112.AnchorPoint = Vector2.new(0.5, 0);
                v112.Position = UDim2.new(0.5, 0, v100.Position.Y.Scale, v100.Position.Y.Offset + v100.AbsoluteSize.Y);
            else
                v100.Text = l_Text_0;
            end;
        end;
    end;
    if v101 and v100.TextFits then
        local l_l_TextService_0_TextSize_0 = l_TextService_0:GetTextSize(v100.Text, v100.TextSize, v100.Font, Vector2.new(v100.AbsoluteSize.X, 1000));
        if l_l_TextService_0_TextSize_0.Y < v100.Size.Y.Offset then
            local v115 = v100.Size.Y.Offset - l_l_TextService_0_TextSize_0.Y;
            v100.Size = v100.Size - UDim2.new(0, 0, 0, v115);
            v99.Position = v99.Position + UDim2.new(0, 0, 0, v115 / 2);
            v100.Position = v100.Position + UDim2.new(0, 0, 0, v115 / 2);
            v98.Size = v98.Size - UDim2.new(0, 0, 0, v115);
        end;
    end;
    v98.Parent = nil;
    l_GuiService_0:AddSelectionParent(l_HttpService_0:GenerateGUID(false), v98);
    return v98;
end;
local function _(v117) --[[ Line: 453 ]] --[[ Name: findNotification ]]
    -- upvalues: v27 (copy)
    for v118 = 1, #v27 do
        if v27[v118] == v117 then
            return v118;
        end;
    end;
end;
local function v126() --[[ Line: 462 ]] --[[ Name: updateNotifications ]]
    -- upvalues: v27 (copy), v41 (copy), l_InOut_0 (copy), l_Sine_0 (copy)
    local v120 = 1;
    local v121 = 0;
    for v122 = #v27, 1, -1 do
        local v123 = v27[v122];
        if v123 then
            local l_Frame_4 = v123.Frame;
            if l_Frame_4 and l_Frame_4.Parent then
                if not v123.IsFriend or not ((v41 + 2) * 1.5) then
                    local _ = v41;
                end;
                v121 = v121 + (v123.IsFriend and l_Frame_4.Size.Y.Offset + (v41 + 2) * 0.5 or l_Frame_4.Size.Y.Offset);
                l_Frame_4:TweenPosition(UDim2.new(0, 0, 1, -v121 - v120 * 4), l_InOut_0, l_Sine_0, 0.35, true, function() --[[ Line: 481 ]]
                    -- upvalues: v123 (copy)
                    if v123.TweenOutCallback then
                        v123.TweenOutCallback();
                    end;
                end);
                v120 = v120 + 1;
            end;
        end;
    end;
end;
local v127 = 0;
v91 = function(v128) --[[ Line: 494 ]]
    -- upvalues: v27 (copy), v28 (copy), l_l_Frame_1_0 (copy), v92 (ref), v127 (ref), v126 (copy)
    spawn(function() --[[ Line: 495 ]]
        -- upvalues: v128 (copy), v27 (ref), v28 (ref), l_l_Frame_1_0 (ref), v92 (ref), v127 (ref), v126 (ref)
        v128.IsActive = true;
        local v129 = #v27;
        if v129 == 3 then
            v27[1].Duration = 0;
            v28[#v28 + 1] = v128;
            return;
        else
            v27[v129 + 1] = v128;
            v128.Frame.Parent = l_l_Frame_1_0;
            spawn(function() --[[ Line: 510 ]]
                -- upvalues: v128 (ref), v92 (ref)
                wait(0.7);
                while v128.Duration > 0 do
                    wait(0.2);
                    v128.Duration = v128.Duration - 0.2;
                end;
                v92(v128);
            end);
            while tick() - v127 < 0.35 do
                wait();
            end;
            v127 = tick();
            v126();
            return;
        end;
    end);
end;
v92 = function(v130) --[[ Line: 533 ]]
    -- upvalues: v27 (copy), l_InOut_0 (copy), l_Sine_0 (copy), v28 (copy), v91 (ref), v126 (copy)
    local v131 = false;
    if not v130 then
        return;
    else
        local l_v130_0 = v130;
        local v133;
        for v134 = 1, #v27 do
            if v27[v134] == l_v130_0 then
                v133 = v134;
                v131 = true;
            end;
            if v131 then
                break;
            end;
        end;
        if not v131 then
            v133 = nil;
        end;
        v131 = false;
        table.remove(v27, v133);
        l_v130_0 = v130.Frame;
        if l_v130_0 and l_v130_0.Parent then
            v130.IsActive = false;
            spawn(function() --[[ Line: 543 ]]
                -- upvalues: l_v130_0 (copy), l_InOut_0 (ref), l_Sine_0 (ref), v130 (ref)
                local function v135() --[[ Line: 549 ]] --[[ Name: doTweenOut ]]
                    -- upvalues: l_v130_0 (ref), l_InOut_0 (ref), l_Sine_0 (ref), v130 (ref)
                    if l_v130_0:IsDescendantOf(game) then
                        return l_v130_0:TweenPosition(UDim2.new(1, 0, 1, l_v130_0.Position.Y.Offset), l_InOut_0, l_Sine_0, 0.35, false, function() --[[ Line: 557 ]]
                            -- upvalues: l_v130_0 (ref), v130 (ref)
                            l_v130_0:Destroy();
                            v130 = nil;
                        end);
                    else
                        return false;
                    end;
                end;
                if not v135() then
                    v130.TweenOutCallback = v135;
                end;
            end);
        end;
        if #v28 > 0 then
            local v136 = v28[1];
            table.remove(v28, 1);
            v91(v136);
            if #v28 > 0 and v27[1] then
                v27[1].Duration = 0;
            end;
        else
            v126();
        end;
        return;
    end;
end;
local function _(v137) --[[ Line: 586 ]] --[[ Name: sendNotificationInfo ]]
    -- upvalues: l_BindableEvent_0 (copy)
    v137.Duration = v137.Duration or 5;
    l_BindableEvent_0:Fire(v137);
end;
local function _(v139, v140, v141) --[[ Line: 591 ]] --[[ Name: createNotificationButtonDetails ]]
    return {
        Text = v139, 
        ButtonType = v140, 
        OnActivated = function() --[[ Line: 595 ]] --[[ Name: OnActivated ]]
            -- upvalues: v141 (copy), v139 (copy)
            if v141 and type(v141) ~= "function" then
                pcall(function() --[[ Line: 597 ]]
                    -- upvalues: v141 (ref), v139 (ref)
                    v141:Invoke(v139);
                end);
                return;
            else
                if type(v141) == "function" then
                    v141(v139);
                end;
                return;
            end;
        end
    };
end;
local function v159(v143) --[[ Line: 607 ]] --[[ Name: onSendNotificationInfo ]]
    -- upvalues: l_VRService_0 (copy), l_game_EngineFeature_0 (copy), v19 (copy), v37 (copy), l_CoreGui_0 (copy), l_GuiService_0 (copy), v116 (copy), v74 (copy), v92 (ref), v51 (copy), v91 (ref)
    if l_VRService_0.VREnabled then
        return;
    else
        local l_Callback_0 = v143.Callback;
        local l_Button1Text_0 = v143.Button1Text;
        local l_Button2Text_0 = v143.Button2Text;
        if l_game_EngineFeature_0 and v19() then
            local v147 = {};
            if l_Button1Text_0 and l_Button1Text_0 ~= "" then
                local l_Secondary_0 = Enum.NotificationButtonType.Secondary;
                table.insert(v147, {
                    Text = l_Button1Text_0, 
                    ButtonType = l_Secondary_0, 
                    OnActivated = function() --[[ Line: 595 ]] --[[ Name: OnActivated ]]
                        -- upvalues: l_Callback_0 (copy), l_Button1Text_0 (copy)
                        if l_Callback_0 and type(l_Callback_0) ~= "function" then
                            pcall(function() --[[ Line: 597 ]]
                                -- upvalues: l_Callback_0 (ref), l_Button1Text_0 (ref)
                                l_Callback_0:Invoke(l_Button1Text_0);
                            end);
                            return;
                        else
                            if type(l_Callback_0) == "function" then
                                l_Callback_0(l_Button1Text_0);
                            end;
                            return;
                        end;
                    end
                });
            end;
            if l_Button2Text_0 and l_Button2Text_0 ~= "" then
                local l_Primary_0 = Enum.NotificationButtonType.Primary;
                table.insert(v147, {
                    Text = l_Button2Text_0, 
                    ButtonType = l_Primary_0, 
                    OnActivated = function() --[[ Line: 595 ]] --[[ Name: OnActivated ]]
                        -- upvalues: l_Callback_0 (copy), l_Button2Text_0 (copy)
                        if l_Callback_0 and type(l_Callback_0) ~= "function" then
                            pcall(function() --[[ Line: 597 ]]
                                -- upvalues: l_Callback_0 (ref), l_Button2Text_0 (ref)
                                l_Callback_0:Invoke(l_Button2Text_0);
                            end);
                            return;
                        else
                            if type(l_Callback_0) == "function" then
                                l_Callback_0(l_Button2Text_0);
                            end;
                            return;
                        end;
                    end
                });
            end;
            local v150 = {
                Title = if v143.Autolocalize then v37:TranslateGameText(l_CoreGui_0, v143.Title) else v143.Title, 
                Text = if v143.AutoLocalize then v37:TranslateGameText(l_CoreGui_0, v143.Text) else v143.Text, 
                Icon = v143.Image, 
                Buttons = v147
            };
            l_GuiService_0:SendNotification(v150);
            return;
        else
            local v151 = {};
            local v152 = nil;
            v152 = if v143.AutoLocalize then v116(v37:TranslateGameText(l_CoreGui_0, v143.Title), v37:TranslateGameText(l_CoreGui_0, v143.Text), v143.Image) else v116(v143.Title, v143.Text, v143.Image);
            local v153 = nil;
            if l_Button1Text_0 and l_Button1Text_0 ~= "" then
                v151.IsFriend = true;
                v153 = v74("Button1", UDim2.new(0, 0, 1, 2));
                if v143.AutoLocalize then
                    v37:TranslateAndRegister(v153, l_CoreGui_0, l_Button1Text_0);
                else
                    v153.Text = l_Button1Text_0;
                end;
                v153.Parent = v152;
                local v154 = nil;
                do
                    local l_v154_0 = v154;
                    l_v154_0 = v153.MouseButton1Click:connect(function() --[[ Line: 674 ]]
                        -- upvalues: l_v154_0 (ref), v92 (ref), v151 (copy), l_Callback_0 (copy), l_Button1Text_0 (copy)
                        if l_v154_0 then
                            l_v154_0:disconnect();
                            l_v154_0 = nil;
                            v92(v151);
                            if l_Callback_0 and type(l_Callback_0) ~= "function" then
                                pcall(function() --[[ Line: 680 ]]
                                    -- upvalues: l_Callback_0 (ref), l_Button1Text_0 (ref)
                                    l_Callback_0:Invoke(l_Button1Text_0);
                                end);
                                return;
                            elseif type(l_Callback_0) == "function" then
                                l_Callback_0(l_Button1Text_0);
                            end;
                        end;
                    end);
                end;
            end;
            local v156 = nil;
            if l_Button2Text_0 and l_Button2Text_0 ~= "" then
                v151.IsFriend = true;
                v156 = v74("Button2", UDim2.new(0.5, 1, 1, 2));
                if v143.AutoLocalize then
                    v37:TranslateAndRegister(v156, l_CoreGui_0, l_Button2Text_0);
                else
                    v156.Text = l_Button2Text_0;
                end;
                v156.Parent = v152;
                local v157 = nil;
                do
                    local l_v157_0 = v157;
                    l_v157_0 = v156.MouseButton1Click:connect(function() --[[ Line: 704 ]]
                        -- upvalues: l_v157_0 (ref), v92 (ref), v151 (copy), l_Callback_0 (copy), l_Button2Text_0 (copy), v143 (copy)
                        if l_v157_0 then
                            l_v157_0:disconnect();
                            l_v157_0 = nil;
                            v92(v151);
                            if l_Callback_0 and type(l_Callback_0) ~= "function" then
                                pcall(function() --[[ Line: 710 ]]
                                    -- upvalues: l_Callback_0 (ref), l_Button2Text_0 (ref)
                                    l_Callback_0:Invoke(l_Button2Text_0);
                                end);
                                return;
                            elseif type(l_Callback_0) == "function" then
                                l_Callback_0(v143.Button2Text);
                            end;
                        end;
                    end);
                end;
            elseif v153 then
                v153.Size = UDim2.new(1, 0, 0, v51);
            end;
            v151.Frame = v152;
            v151.Duration = v143.Duration;
            v91(v151);
            return;
        end;
    end;
end;
l_BindableEvent_0.Event:connect(v159);
l_StarterGui_0:RegisterSetCore("SendNotification", function(v160) --[[ Line: 731 ]] --[[ Name: createDeveloperNotification ]]
    -- upvalues: l_game_EngineFeature_0 (copy), v19 (copy), l_BindableEvent_0 (copy)
    if type(v160) == "table" and type(v160.Title) == "string" and type(v160.Text) == "string" then
        local v161 = type(v160.Icon) == "string" and v160.Icon or "";
        local v162 = type(v160.Duration) == "number" and v160.Duration or 5;
        local v163 = typeof(v160.Callback) == "Instance" and v160.Callback:IsA("BindableFunction") and v160.Callback or nil;
        local v164 = nil;
        local v165 = nil;
        if l_game_EngineFeature_0 and v19() then
            v164 = type(v160.Button1) == "string" and v160.Button1 or nil;
            v165 = type(v160.Button2) == "string" and v160.Button2 or nil;
        else
            v164 = type(v160.Button1) == "string" and v160.Button1 or "";
            v165 = type(v160.Button2) == "string" and v160.Button2 or "";
        end;
        local v166 = true;
        if v160.AutoLocalize ~= nil then
            v166 = v160.AutoLocalize == true;
        end;
        local l_Title_0 = v160.Title;
        local l_Text_1 = v160.Text;
        local v169 = {
            GroupName = "Developer", 
            Title = l_Title_0, 
            Text = l_Text_1, 
            Image = v161, 
            Duration = v162, 
            Callback = v163, 
            Button1Text = v164, 
            Button2Text = v165, 
            AutoLocalize = v166
        };
        v169.Duration = v169.Duration or 5;
        l_BindableEvent_0:Fire(v169);
    end;
end);
local v170 = nil;
local v171 = {};
local l_v171_0 = v171 --[[ copy: 85 -> 94 ]];
v170 = function(v173) --[[ Line: 782 ]]
    -- upvalues: l_v171_0 (copy), v58 (ref)
    local v174 = l_v171_0[v173];
    if v174 and tick() < v174 then
        return true;
    else
        l_v171_0[v173] = tick() + v58;
        return false;
    end;
end;
v171 = function(v175) --[[ Line: 796 ]] --[[ Name: sendFriendNotification ]]
    -- upvalues: v170 (ref), v36 (copy), l_RbxAnalyticsService_0 (copy), v17 (copy), v25 (ref), v29 (copy), l_BindableEvent_0 (copy)
    if v170(v175) then
        return;
    else
        local v176 = {
            GroupName = "Friends", 
            Title = v175.DisplayName, 
            Text = "Sent you a friend request!", 
            DetailText = v175.DisplayName
        };
        local l_UserId_0 = v175.UserId;
        v176.Image = v36.GetPlayerImage(l_UserId_0, Enum.ThumbnailSize.Size48x48, Enum.ThumbnailType.HeadShot, 5);
        v176.Duration = 8;
        v176.Callback = function(v178) --[[ Line: 810 ]] --[[ Name: Callback ]]
            -- upvalues: l_RbxAnalyticsService_0 (ref), v17 (ref), v25 (ref), v175 (copy), v29 (ref)
            if v178 == "Accept" then
                l_RbxAnalyticsService_0:ReportCounter("NotificationScript-RequestFriendship");
                l_RbxAnalyticsService_0:TrackEvent("Game", "RequestFriendship", "NotificationScript");
                if v17 then
                    l_RbxAnalyticsService_0:ReportCounter("NotificationScript-AcceptFriendship");
                    l_RbxAnalyticsService_0:TrackEvent("Game", "AcceptFriendship", "NotificationScript");
                end;
                v25:RequestFriendship(v175);
                return;
            else
                l_RbxAnalyticsService_0:ReportCounter("NotificationScript-RevokeFriendship");
                l_RbxAnalyticsService_0:TrackEvent("Game", "RevokeFriendship", "NotificationScript");
                v25:RevokeFriendship(v175);
                v29[v175] = true;
                return;
            end;
        end;
        v176.Button1Text = "Accept";
        v176.Button2Text = "Decline";
        v176.Duration = v176.Duration or 5;
        l_BindableEvent_0:Fire(v176);
        return;
    end;
end;
local function v188(v179, v180, v181) --[[ Line: 834 ]] --[[ Name: onFriendRequestEvent ]]
    -- upvalues: v25 (ref), v21 (copy), v36 (copy), l_BindableEvent_0 (copy), v29 (copy), v171 (copy)
    if v179 ~= v25 and v180 ~= v25 then
        return;
    else
        if v179 == v25 then
            if v181 == Enum.FriendRequestEvent.Accept then
                local v182 = v21:FormatByKey("NotificationScript2.FriendRequestEvent.Accept", {
                    RBX_NAME = v180.Name
                });
                local v183 = {
                    GroupName = "Friends", 
                    Title = "New Friend", 
                    Text = v180.Name, 
                    DetailText = v182
                };
                local l_UserId_1 = v180.UserId;
                v183.Image = v36.GetPlayerImage(l_UserId_1, Enum.ThumbnailSize.Size48x48, Enum.ThumbnailType.HeadShot, 5);
                v183.Duration = 5;
                v183.Duration = v183.Duration or 5;
                l_BindableEvent_0:Fire(v183);
                return;
            end;
        elseif v180 == v25 then
            if v181 == Enum.FriendRequestEvent.Issue then
                if v29[v179] then
                    return;
                else
                    v171(v179);
                    return;
                end;
            elseif v181 == Enum.FriendRequestEvent.Accept then
                local v185 = v21:FormatByKey("NotificationScript2.FriendRequestEvent.Accept", {
                    RBX_NAME = v179.Name
                });
                local v186 = {
                    GroupName = "Friends", 
                    Title = "New Friend", 
                    Text = v179.Name, 
                    DetailText = v185
                };
                local l_UserId_2 = v179.UserId;
                v186.Image = v36.GetPlayerImage(l_UserId_2, Enum.ThumbnailSize.Size48x48, Enum.ThumbnailType.HeadShot, 5);
                v186.Duration = 5;
                v186.Duration = v186.Duration or 5;
                l_BindableEvent_0:Fire(v186);
            end;
        end;
        return;
    end;
end;
local function v197(v189, v190, _, _) --[[ Line: 881 ]] --[[ Name: onPointsAwarded ]]
    -- upvalues: v34 (ref), v25 (ref), v21 (copy), l_BindableEvent_0 (copy)
    if v34 and v189 == v25.UserId then
        local v193 = nil;
        local v194 = nil;
        local _ = nil;
        if v190 == 1 then
            v193 = "Point Awarded";
            v194 = v21:FormatByKey("NotificationScript2.onPointsAwarded.single", {
                RBX_NUMBER = tostring(v190)
            });
        elseif v190 > 0 then
            v193 = "Points Awarded";
            v194 = v21:FormatByKey("NotificationScript2.onPointsAwarded.multiple", {
                RBX_NUMBER = tostring(v190)
            });
        elseif v190 < 0 then
            v193 = "Points Lost";
            v194 = v21:FormatByKey("NotificationScript2.onPointsAwarded.negative", {
                RBX_NUMBER = tostring(v190)
            });
        else
            return;
        end;
        local v196 = {
            GroupName = "PlayerPoints", 
            Title = v193, 
            Text = v194, 
            DetailText = v194, 
            Image = "https://www.roblox.com/asset?id=206410433", 
            Duration = 5
        };
        v196.Duration = v196.Duration or 5;
        l_BindableEvent_0:Fire(v196);
    end;
end;
local function v215(v198, v199, v200) --[[ Line: 919 ]] --[[ Name: onBadgeAwarded ]]
    -- upvalues: v30 (copy), v35 (ref), v25 (ref), l_GroupService_0 (copy), l_Players_0 (copy), l_BadgeService_0 (copy), v21 (copy), l_BindableEvent_0 (copy)
    if not v30[v200] and v35 and v198 == v25.UserId then
        v30[v200] = true;
        local v201 = "";
        if game.CreatorType == Enum.CreatorType.Group then
            local l_status_1, l_result_1 = pcall(function() --[[ Line: 924 ]]
                -- upvalues: l_GroupService_0 (ref), v199 (copy)
                return l_GroupService_0:GetGroupInfoAsync(v199);
            end);
            if not l_status_1 then
                v201 = "";
            end;
            if l_result_1 then
                v201 = l_result_1.Name;
            end;
        elseif game.CreatorType == Enum.CreatorType.User then
            local v204 = nil;
            local l_status_2, l_result_2 = pcall(function() --[[ Line: 936 ]]
                -- upvalues: l_Players_0 (ref), v199 (copy)
                return l_Players_0:GetNameFromUserIdAsync(v199);
            end);
            v204 = l_status_2;
            v201 = l_result_2;
            if not v204 then
                v201 = "";
            end;
        end;
        local l_status_3, l_result_3 = pcall(function() --[[ Line: 944 ]]
            -- upvalues: l_BadgeService_0 (ref), v200 (copy)
            return l_BadgeService_0:GetBadgeInfoAsync(v200);
        end);
        if not l_status_3 then
            return;
        else
            local v209 = v21:FormatByKey("NotificationScript2.onBadgeAwardedDetail", {
                RBX_NAME = v25.Name, 
                CREATOR_NAME = v201, 
                BADGE_NAME = l_result_3.DisplayName
            });
            local v210 = nil;
            local l_pcall_0 = pcall;
            local v212 = "NotificationScript2.onBadgeAwardedTitle";
            local v213;
            do
                local l_v210_0 = v210;
                l_pcall_0(function() --[[ Line: 46 ]]
                    -- upvalues: l_v210_0 (ref), v21 (ref), v212 (copy)
                    l_v210_0 = v21:FormatByKey(v212);
                end);
                v213 = l_v210_0;
            end;
            v210 = {
                GroupName = "BadgeAwards", 
                Title = v213, 
                Text = v209, 
                DetailText = v209, 
                Image = "https://www.roblox.com/asset?id=206410289", 
                Duration = 5
            };
            v210.Duration = v210.Duration or 5;
            l_BindableEvent_0:Fire(v210);
        end;
    end;
end;
onGameSettingsChanged = function(v216, v217) --[[ Line: 968 ]] --[[ Name: onGameSettingsChanged ]]
    -- upvalues: l_GameSettings_0 (copy), l_Value_0 (ref), v21 (copy), l_BindableEvent_0 (copy)
    if v216 == "SavedQualityLevel" then
        local v218 = l_GameSettings_0.SavedQualityLevel.Value + v217;
        if v218 > 10 then
            v218 = 10;
        elseif v218 < 1 then
            v218 = 1;
        end;
        if v218 > 0 and v218 ~= l_Value_0 and l_GameSettings_0.SavedQualityLevel ~= Enum.SavedQualitySetting.Automatic then
            local v219 = ("%s to (%d)"):format(l_Value_0 < v218 and "Increased" or "Decreased", v218);
            v219 = if l_Value_0 < v218 then v21:FormatByKey("NotificationScrip2.onCurrentGraphicsQualityLevelChanged.Increased", {
                RBX_NUMBER = tostring(v218)
            }) else v21:FormatByKey("NotificationScrip2.onCurrentGraphicsQualityLevelChanged.Decreased", {
                RBX_NUMBER = tostring(v218)
            });
            local v220 = {
                GroupName = "Graphics", 
                Title = "Graphics Quality", 
                Text = v219, 
                DetailText = v219, 
                Image = "", 
                Duration = 2
            };
            v220.Duration = v220.Duration or 5;
            l_BindableEvent_0:Fire(v220);
            l_Value_0 = v218;
        end;
    end;
end;
if not v38:IsSubjectToChinaPolicies() then
    l_BadgeService_0.OnBadgeAwarded:connect(v215);
end;
if not v33 then
    l_Players_0.FriendRequestEvent:connect(v188);
    l_PointsService_0.PointsAwarded:connect(v197);
    game.GraphicsQualityChangeRequest:Connect(function(v221) --[[ Line: 1019 ]]
        onGameSettingsChanged("SavedQualityLevel", v221 == true and 1 or -1);
    end);
end;
if not v38:IsSubjectToChinaPolicies() then
    if not v20() then
        game.ScreenshotReady:Connect(function(_) --[[ Line: 1029 ]]
            -- upvalues: v21 (copy), l_BindableEvent_0 (copy)
            local v223 = v21:FormatByKey("NotificationScript2.Screenshot.Title");
            local v224 = v21:FormatByKey("NotificationScript2.Screenshot.Description");
            local v225 = v21:FormatByKey("NotificationScript2.Screenshot.ButtonText");
            local v227 = {
                Title = v223, 
                Text = v224, 
                Duration = 3, 
                Button1Text = v225, 
                Callback = function(v226) --[[ Line: 1039 ]] --[[ Name: Callback ]]
                    -- upvalues: v225 (copy)
                    if v226 == v225 then
                        game:OpenScreenshotsFolder();
                    end;
                end
            };
            v227.Duration = v227.Duration or 5;
            l_BindableEvent_0:Fire(v227);
        end);
    end;
    settings():GetService("GameSettings").VideoRecordingChangeRequest:Connect(function(v228) --[[ Line: 1049 ]]
        -- upvalues: v21 (copy), l_BindableEvent_0 (copy)
        if not v228 then
            local v229 = v21:FormatByKey("NotificationScript2.Video.Title");
            local v230 = v21:FormatByKey("NotificationScript2.Video.Description");
            local v231 = v21:FormatByKey("NotificationScript2.Video.ButtonText");
            local v233 = {
                Title = v229, 
                Text = v230, 
                Duration = 3, 
                Button1Text = v231, 
                Callback = function(v232) --[[ Line: 1060 ]] --[[ Name: Callback ]]
                    -- upvalues: v231 (copy)
                    if v232 == v231 then
                        game:OpenVideosFolder();
                    end;
                end
            };
            v233.Duration = v233.Duration or 5;
            l_BindableEvent_0:Fire(v233);
        end;
    end);
end;
l_GuiService_0.SendCoreUiNotification = function(v234, v235) --[[ Line: 1070 ]]
    -- upvalues: v116 (copy), l_Parent_0 (copy), l_InOut_0 (copy), l_Sine_0 (copy)
    local v236 = v116(v234, v235, "");
    v236.BackgroundTransparency = 0.5;
    v236.Size = UDim2.new(0.5, 0, 0.1, 0);
    v236.Position = UDim2.new(0.25, 0, -0.1, 0);
    v236.NotificationTitle.FontSize = Enum.FontSize.Size36;
    v236.NotificationText.FontSize = Enum.FontSize.Size24;
    v236.Parent = l_Parent_0;
    v236:TweenPosition(UDim2.new(0.25, 0, 0, 0), l_InOut_0, l_Sine_0, 0.35, true);
    wait(5);
    if v236 then
        v236:Destroy();
    end;
end;
l_MarketplaceService_0.ClientLuaDialogRequested:connect(function(v237, v238, v239) --[[ Line: 1086 ]] --[[ Name: onClientLuaDialogRequested ]]
    -- upvalues: l_TextLabel_1 (copy), l_GuiService_0 (copy), l_l_Frame_3_0 (copy), v86 (copy), l_MarketplaceService_0 (copy), v87 (copy), l_Frame_3 (copy)
    l_TextLabel_1.Text = v237;
    local v240 = nil;
    local v241 = nil;
    local function _() --[[ Line: 1090 ]] --[[ Name: disconnectCns ]]
        -- upvalues: v240 (ref), v241 (ref), l_GuiService_0 (ref), l_l_Frame_3_0 (ref)
        if v240 then
            v240:disconnect();
        end;
        if v241 then
            v241:disconnect();
        end;
        l_GuiService_0:RemoveCenterDialog(l_l_Frame_3_0);
        l_l_Frame_3_0.Visible = false;
    end;
    v240 = v86.MouseButton1Click:connect(function() --[[ Line: 1102 ]]
        -- upvalues: v240 (ref), v241 (ref), l_GuiService_0 (ref), l_l_Frame_3_0 (ref), l_MarketplaceService_0 (ref)
        if v240 then
            v240:disconnect();
        end;
        if v241 then
            v241:disconnect();
        end;
        l_GuiService_0:RemoveCenterDialog(l_l_Frame_3_0);
        l_l_Frame_3_0.Visible = false;
        l_MarketplaceService_0:SignalServerLuaDialogClosed(true);
    end);
    v241 = v87.MouseButton1Click:connect(function() --[[ Line: 1106 ]]
        -- upvalues: v240 (ref), v241 (ref), l_GuiService_0 (ref), l_l_Frame_3_0 (ref), l_MarketplaceService_0 (ref)
        if v240 then
            v240:disconnect();
        end;
        if v241 then
            v241:disconnect();
        end;
        l_GuiService_0:RemoveCenterDialog(l_l_Frame_3_0);
        l_l_Frame_3_0.Visible = false;
        l_MarketplaceService_0:SignalServerLuaDialogClosed(false);
    end);
    if not pcall(function() --[[ Line: 1111 ]]
        -- upvalues: l_GuiService_0 (ref), l_l_Frame_3_0 (ref), l_Frame_3 (ref), v86 (ref), v87 (ref), v238 (copy), v239 (copy)
        l_GuiService_0:AddCenterDialog(l_l_Frame_3_0, Enum.CenterDialogType.QuitDialog, function() --[[ Line: 1112 ]]
            -- upvalues: l_Frame_3 (ref), v86 (ref), v87 (ref), v238 (ref), v239 (ref), l_l_Frame_3_0 (ref)
            l_Frame_3.Visible = false;
            v86.Visible = true;
            v87.Visible = true;
            v86.Text = v238;
            v87.Text = v239;
            l_l_Frame_3_0.Visible = true;
        end, function() --[[ Line: 1119 ]]
            -- upvalues: l_l_Frame_3_0 (ref)
            l_l_Frame_3_0.Visible = false;
        end);
    end) then
        l_l_Frame_3_0.Visible = true;
        v86.Text = v238;
        v87.Text = v239;
    end;
    return true;
end);
local function v244() --[[ Line: 1134 ]] --[[ Name: onPreferredTransparencyChanged ]]
    -- upvalues: v39 (ref), l_GameSettings_0 (copy), v76 (copy), v27 (copy)
    v39 = 0.6 * l_GameSettings_0.PreferredTransparency;
    v76.BackgroundTransparency = v39;
    for v243 = 1, #v27 do
        v27[v243].Frame.BackgroundTransparency = v39;
    end;
end;
l_GameSettings_0:GetPropertyChangedSignal("PreferredTransparency"):connect(v244);
if v16 then
    local function v253() --[[ Line: 1145 ]] --[[ Name: onMenuTeleportAttemptNotification ]]
        -- upvalues: v21 (copy), v46 (copy), l_BindableEvent_0 (copy)
        local v245 = "Teleporting Paused";
        local l_pcall_1 = pcall;
        local v247 = "Feature.SettingsHub.Prompt.TeleportBlock.Title";
        local v248;
        do
            local l_v245_0 = v245;
            l_pcall_1(function() --[[ Line: 46 ]]
                -- upvalues: l_v245_0 (ref), v21 (ref), v247 (copy)
                l_v245_0 = v21:FormatByKey(v247);
            end);
            v248 = l_v245_0;
        end;
        l_pcall_1 = "Teleporting will resume upon menu close.";
        local l_pcall_2 = pcall;
        local v251 = "Feature.SettingsHub.Prompt.TeleportBlock.Subtitle";
        do
            local l_l_pcall_1_0 = l_pcall_1;
            l_pcall_2(function() --[[ Line: 46 ]]
                -- upvalues: l_l_pcall_1_0 (ref), v21 (ref), v251 (copy)
                l_l_pcall_1_0 = v21:FormatByKey(v251);
            end);
            v245 = l_l_pcall_1_0;
        end;
        l_pcall_1 = {
            GroupName = "Teleport", 
            Title = v248, 
            Text = v245, 
            Image = "http://www.roblox.com/asset/?id=10961494062", 
            Duration = 5, 
            BottomPadding = v46
        };
        l_pcall_1.Duration = l_pcall_1.Duration or 5;
        l_BindableEvent_0:Fire(l_pcall_1);
    end;
    local function _() --[[ Line: 1162 ]] --[[ Name: connectMenuTeleportAttemptEvent ]]
        -- upvalues: l_TeleportService_0 (copy), v253 (copy)
        l_TeleportService_0.MenuTeleportAttempt:Connect(function() --[[ Line: 1163 ]]
            -- upvalues: v253 (ref)
            v253();
        end);
    end;
    l_TeleportService_0.MenuTeleportAttempt:Connect(function() --[[ Line: 1163 ]]
        -- upvalues: v253 (copy)
        v253();
    end);
end;