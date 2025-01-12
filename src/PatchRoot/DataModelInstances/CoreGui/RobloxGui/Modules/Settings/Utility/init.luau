local v0 = require(script.Parent.Theme);
local l_Parent_0 = script.Parent;
local v2 = v0.color("SELECTED_COLOR", Color3.fromRGB(0, 162, 255));
local v3 = v0.color("NON_SELECTED_COLOR", Color3.fromRGB(78, 84, 96));
local v4 = v0.color("ARROW_COLOR", Color3.fromRGB(204, 204, 204));
local v5 = v0.color("ARROW_COLOR_HOVER", Color3.fromRGB(255, 255, 255));
local v6 = v0.color("ARROW_COLOR_INACTIVE", Color3.fromRGB(150, 150, 150));
local v7 = UDim.new(0, 14);
local l_HttpService_0 = game:GetService("HttpService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_GuiService_0 = game:GetService("GuiService");
local l_RunService_0 = game:GetService("RunService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_RobloxGui_0 = l_CoreGui_0:FindFirstChild("RobloxGui");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_VRService_0 = game:GetService("VRService");
local l_Workspace_0 = game:GetService("Workspace");
local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local v18 = require(l_Parent_0.Flags.GetFFlagSettingsHubButtonCanBeDisabled);
local v19 = game:DefineFastFlag("UseNonDeferredSliderSignal", false);
local v20 = game:DefineFastFlag("UnbindRenderSteps", false);
local l_status_0, _ = pcall(function() --[[ Line: 61 ]]
    -- upvalues: l_GuiService_0 (copy)
    return l_GuiService_0.PreferredTextSize;
end);
local l_RobloxTranslator_0 = require(l_CoreGui_0.RobloxGui.Modules:WaitForChild("RobloxTranslator"));
local l_CorePackages_0 = game:GetService("CorePackages");
local v25 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib);
local l_Signal_0 = v25.Signal;
local l_Create_0 = v25.Create;
local v28 = require(l_RobloxGui_0.Modules:WaitForChild("TenFootInterface")):IsEnabled();
local v29 = {};
setmetatable(v29, {
    __mode = "k"
});
local v30 = l_Create_0("ImageLabel")({
    Image = "", 
    BackgroundTransparency = 1
});
clamp = function(v31, v32, v33) --[[ Line: 87 ]] --[[ Name: clamp ]]
    return (math.max(v31, (math.min(v32, v33))));
end;
local function v38(v34, v35, v36, v37) --[[ Line: 92 ]] --[[ Name: Linear ]]
    if v37 <= v34 then
        return v35 + v36;
    else
        return v36 * v34 / v37 + v35;
    end;
end;
local function v43(v39, v40, v41, v42) --[[ Line: 100 ]] --[[ Name: EaseOutQuad ]]
    if v42 <= v39 then
        return v40 + v41;
    else
        v39 = v39 / v42;
        return v40 - v41 * v39 * (v39 - 2);
    end;
end;
local function v48(v44, v45, v46, v47) --[[ Line: 109 ]] --[[ Name: EaseInOutQuad ]]
    if v47 <= v44 then
        return v45 + v46;
    else
        v44 = v44 / v47;
        if v44 < 0.5 then
            return 2 * v46 * v44 * v44 + v45;
        else
            return v45 + v46 * (2 * (2 - v44) * v44 - 1);
        end;
    end;
end;
PropertyTweener = function(v49, v50, v51, v52, v53, v54, v55) --[[ Line: 121 ]] --[[ Name: PropertyTweener ]]
    -- upvalues: l_RunService_0 (copy)
    local v56 = {
        StartTime = tick()
    };
    v56.EndTime = v56.StartTime + v53;
    v56.Cancelled = false;
    local v57 = false;
    local v58 = 0;
    local function _() --[[ Line: 130 ]] --[[ Name: finalize ]]
        -- upvalues: v49 (copy), v50 (copy), v54 (copy), v51 (copy), v52 (copy), v57 (ref), v58 (ref), v55 (copy)
        if v49 then
            v49[v50] = v54(1, v51, v52 - v51, 1);
        end;
        v57 = true;
        v58 = 1;
        if v55 then
            v55();
        end;
    end;
    v49[v50] = v54(0, v51, v52 - v51, v53);
    coroutine.wrap(function() --[[ Line: 143 ]]
        -- upvalues: v56 (copy), v49 (copy), v50 (copy), v54 (copy), v51 (copy), v52 (copy), v53 (copy), v58 (ref), l_RunService_0 (ref), v57 (ref), v55 (copy)
        local v60 = tick();
        while true do
            if v60 < v56.EndTime and v49 then
                if v56.Cancelled then
                    return;
                else
                    v49[v50] = v54(v60 - v56.StartTime, v51, v52 - v51, v53);
                    v58 = clamp(0, 1, (v60 - v56.StartTime) / v53);
                    l_RunService_0.RenderStepped:Wait();
                    v60 = tick();
                end;
            else
                if v56.Cancelled == false and v49 then
                    if v49 then
                        v49[v50] = v54(1, v51, v52 - v51, 1);
                    end;
                    v57 = true;
                    v58 = 1;
                    if v55 then
                        v55();
                    end;
                end;
                return;
            end;
        end;
    end)();
    v56.GetFinal = function(_) --[[ Line: 159 ]] --[[ Name: GetFinal ]]
        -- upvalues: v52 (copy)
        return v52;
    end;
    v56.GetPercentComplete = function(_) --[[ Line: 163 ]] --[[ Name: GetPercentComplete ]]
        -- upvalues: v58 (ref)
        return v58;
    end;
    v56.IsFinished = function(_) --[[ Line: 167 ]] --[[ Name: IsFinished ]]
        -- upvalues: v57 (ref)
        return v57;
    end;
    v56.Finish = function(v64) --[[ Line: 171 ]] --[[ Name: Finish ]]
        -- upvalues: v57 (ref), v49 (copy), v50 (copy), v54 (copy), v51 (copy), v52 (copy), v58 (ref), v55 (copy)
        if not v57 then
            v64:Cancel();
            if v49 then
                v49[v50] = v54(1, v51, v52 - v51, 1);
            end;
            v57 = true;
            v58 = 1;
            if v55 then
                v55();
            end;
        end;
    end;
    v56.Cancel = function(_) --[[ Line: 178 ]] --[[ Name: Cancel ]]
        -- upvalues: v56 (copy)
        v56.Cancelled = true;
    end;
    return v56;
end;
local function v74() --[[ Line: 187 ]] --[[ Name: CreateSignal ]]
    local v66 = {};
    local l_BindableEvent_0 = Instance.new("BindableEvent");
    local v68 = nil;
    local v69 = nil;
    v66.fire = function(_, ...) --[[ Line: 195 ]] --[[ Name: fire ]]
        -- upvalues: v68 (ref), v69 (ref), l_BindableEvent_0 (copy)
        v68 = {
            ...
        };
        v69 = select("#", ...);
        l_BindableEvent_0:Fire();
    end;
    v66.connect = function(_, v72) --[[ Line: 201 ]] --[[ Name: connect ]]
        -- upvalues: l_BindableEvent_0 (copy), v68 (ref), v69 (ref)
        if not v72 then
            error("connect(nil)", 2);
        end;
        return l_BindableEvent_0.Event:Connect(function() --[[ Line: 205 ]]
            -- upvalues: v72 (copy), v68 (ref), v69 (ref)
            v72(unpack(v68, 1, v69));
        end);
    end;
    v66.wait = function(_) --[[ Line: 210 ]] --[[ Name: wait ]]
        -- upvalues: l_BindableEvent_0 (copy), v68 (ref), v69 (ref)
        l_BindableEvent_0.Event:wait();
        if not v68 then
            error("Missing arg data, likely due to :TweenSize/Position corrupting threadrefs.");
        end;
        return unpack(v68, 1, v69);
    end;
    return v66;
end;
local function _() --[[ Line: 221 ]] --[[ Name: getViewportSize ]]
    -- upvalues: l_GuiService_0 (copy)
    if _G.__TESTEZ_RUNNING_TEST__ then
        return Vector2.new(1024, 1024);
    else
        return l_GuiService_0:GetHardwareSafeViewport();
    end;
end;
local function _() --[[ Line: 230 ]] --[[ Name: isSmallTouchScreen ]]
    -- upvalues: l_GuiService_0 (copy), l_UserInputService_0 (copy)
    local v76 = if _G.__TESTEZ_RUNNING_TEST__ then Vector2.new(1024, 1024) else l_GuiService_0:GetHardwareSafeViewport();
    return l_UserInputService_0.TouchEnabled and (v76.Y < 500 or v76.X < 700);
end;
local function _() --[[ Line: 235 ]] --[[ Name: isPortrait ]]
    -- upvalues: l_GuiService_0 (copy)
    local v78 = if _G.__TESTEZ_RUNNING_TEST__ then Vector2.new(1024, 1024) else l_GuiService_0:GetHardwareSafeViewport();
    return v78.Y > v78.X;
end;
local function _() --[[ Line: 240 ]] --[[ Name: isTenFootInterface ]]
    -- upvalues: v28 (copy)
    return v28;
end;
local function _() --[[ Line: 244 ]] --[[ Name: usesSelectedObject ]]
    -- upvalues: l_VRService_0 (copy), l_UserInputService_0 (copy)
    if l_VRService_0.VREnabled then
        return false;
    elseif l_UserInputService_0.TouchEnabled and not l_UserInputService_0.GamepadEnabled then
        return false;
    else
        return true;
    end;
end;
local function v88(v82, v83, v84, v85) --[[ Line: 257 ]] --[[ Name: addHoverState ]]
    local function v86() --[[ Line: 258 ]] --[[ Name: onNormalButtonStateCallback ]]
        -- upvalues: v82 (copy), v84 (copy), v83 (copy)
        if v82.Active then
            v84(v83);
        end;
    end;
    local function v87() --[[ Line: 263 ]] --[[ Name: onHoverButtonStateCallback ]]
        -- upvalues: v82 (copy), v85 (copy), v83 (copy)
        if v82.Active then
            v85(v83);
        end;
    end;
    v82.MouseEnter:Connect(v87);
    v82.SelectionGained:Connect(v87);
    v82.MouseLeave:Connect(v86);
    v82.SelectionLost:Connect(v86);
    v84(v83);
end;
local function v94(v89, v90) --[[ Line: 277 ]] --[[ Name: addOnResizedCallback ]]
    -- upvalues: v29 (copy), l_GuiService_0 (copy)
    v29[v89] = v90;
    local l_v90_0 = v90;
    local v92 = if _G.__TESTEZ_RUNNING_TEST__ then Vector2.new(1024, 1024) else l_GuiService_0:GetHardwareSafeViewport();
    local v93 = if _G.__TESTEZ_RUNNING_TEST__ then Vector2.new(1024, 1024) else l_GuiService_0:GetHardwareSafeViewport();
    l_v90_0(v92, v93.Y > v93.X);
end;
local v95 = {
    [Enum.UserInputType.Gamepad1] = true, 
    [Enum.UserInputType.Gamepad2] = true, 
    [Enum.UserInputType.Gamepad3] = true, 
    [Enum.UserInputType.Gamepad4] = true, 
    [Enum.UserInputType.Gamepad5] = true, 
    [Enum.UserInputType.Gamepad6] = true, 
    [Enum.UserInputType.Gamepad7] = true, 
    [Enum.UserInputType.Gamepad8] = true
};
local function v124(v96, v97, v98, v99, v100, v101) --[[ Line: 293 ]] --[[ Name: MakeDefaultButton ]]
    -- upvalues: l_Create_0 (copy), v0 (copy), v95 (copy), l_UserInputService_0 (copy), v18 (copy), l_GuiService_0 (copy), l_VRService_0 (copy)
    local v102 = l_Create_0("ImageLabel")({
        Image = "", 
        BackgroundTransparency = 1
    });
    local v103 = nil;
    local v104 = nil;
    local v105 = "DefaultButtonStroke";
    local v106 = "DefaultButton";
    if v0.UIBloxThemeEnabled then
        if v96 == "DropDownFrame" then
            v105 = "ControlInputStroke";
            v106 = "ControlInputBackground";
        end;
        if v101 == "ImageButton" then
            v106 = "ImageButton";
        end;
        v103 = l_Create_0("ImageButton")({
            Name = v96 .. "Button", 
            AutoButtonColor = false, 
            BackgroundColor3 = v0.color(v106), 
            BackgroundTransparency = v0.transparency(v106), 
            Size = v97, 
            ZIndex = 2, 
            SelectionImageObject = v102
        });
        l_Create_0("UICorner")({
            CornerRadius = v0.DefaultCornerRadius, 
            Parent = v103
        });
        v104 = l_Create_0("UIStroke")({
            Name = "Border", 
            Color = v0.color(v105), 
            Transparency = v0.transparency(v105), 
            Thickness = v0.DefaultStokeThickness, 
            Parent = v103
        });
    else
        v103 = l_Create_0("ImageButton")({
            Name = v96 .. "Button", 
            Image = "rbxasset://textures/ui/Settings/MenuBarAssets/MenuButton.png", 
            ScaleType = Enum.ScaleType.Slice, 
            SliceCenter = Rect.new(8, 6, 46, 44), 
            AutoButtonColor = false, 
            BackgroundTransparency = 1, 
            Size = v97, 
            ZIndex = 2, 
            SelectionImageObject = v102
        });
    end;
    local _ = l_Create_0("BoolValue")({
        Name = "Enabled", 
        Parent = v103, 
        Value = true
    });
    if v98 then
        v103.MouseButton1Click:Connect(function() --[[ Line: 354 ]]
            -- upvalues: v98 (copy), v95 (ref), l_UserInputService_0 (ref)
            v98(v95[l_UserInputService_0:GetLastInputType()] or false);
        end);
    elseif v18() then
        if v0.UIBloxThemeEnabled then
            if v104 then
                v104.Enabled = false;
            end;
        else
            v103.ImageTransparency = 1;
        end;
        v103.Selectable = false;
    end;
    local function _(v108) --[[ Line: 370 ]] --[[ Name: isPointerInput ]]
        local v109 = true;
        if v108.UserInputType ~= Enum.UserInputType.MouseMovement then
            v109 = v108.UserInputType == Enum.UserInputType.Touch;
        end;
        return v109;
    end;
    local v111 = nil;
    local function v113(v112) --[[ Line: 376 ]] --[[ Name: setRowRef ]]
        -- upvalues: v111 (ref)
        v111 = v112;
    end;
    local function v116() --[[ Line: 380 ]] --[[ Name: selectButton ]]
        -- upvalues: v100 (copy), v99 (copy), v0 (ref), v103 (ref), v111 (ref)
        local l_v100_0 = v100;
        if l_v100_0 == nil and v99 then
            l_v100_0 = v99.HubRef;
        end;
        if l_v100_0 and l_v100_0.Active or l_v100_0 == nil then
            if v0.UIBloxThemeEnabled then
                v103.BackgroundColor3 = v0.color("DefaultButtonHover");
                v103.BackgroundTransparency = v0.transparency("DefaultButtonHover");
            else
                v103.Image = "rbxasset://textures/ui/Settings/MenuBarAssets/MenuButtonSelected.png";
            end;
            local l_v103_0 = v103;
            if v111 then
                l_v103_0 = v111;
            end;
            if l_v100_0 then
                l_v100_0:ScrollToFrame(l_v103_0);
            end;
        end;
    end;
    local function _() --[[ Line: 406 ]] --[[ Name: deselectButton ]]
        -- upvalues: v0 (ref), v103 (ref), v106 (ref)
        if v0.UIBloxThemeEnabled then
            v103.BackgroundColor3 = v0.color(v106);
            v103.BackgroundTransparency = v0.transparency(v106);
            return;
        else
            v103.Image = "rbxasset://textures/ui/Settings/MenuBarAssets/MenuButton.png";
            return;
        end;
    end;
    v103.InputBegan:Connect(function(v118) --[[ Line: 415 ]]
        -- upvalues: v103 (ref), v116 (copy)
        if v103.Selectable then
            local v119 = true;
            if v118.UserInputType ~= Enum.UserInputType.MouseMovement then
                v119 = v118.UserInputType == Enum.UserInputType.Touch;
            end;
            if v119 then
                v116();
            end;
        end;
    end);
    v103.InputEnded:Connect(function(v120) --[[ Line: 420 ]]
        -- upvalues: v103 (ref), l_GuiService_0 (ref), v0 (ref), v106 (ref)
        if v103.Selectable and l_GuiService_0.SelectedCoreObject ~= v103 then
            local v121 = true;
            if v120.UserInputType ~= Enum.UserInputType.MouseMovement then
                v121 = v120.UserInputType == Enum.UserInputType.Touch;
            end;
            if v121 then
                if v0.UIBloxThemeEnabled then
                    v103.BackgroundColor3 = v0.color(v106);
                    v103.BackgroundTransparency = v0.transparency(v106);
                    return;
                else
                    v103.Image = "rbxasset://textures/ui/Settings/MenuBarAssets/MenuButton.png";
                end;
            end;
        end;
    end);
    v103.SelectionGained:Connect(function() --[[ Line: 426 ]]
        -- upvalues: v116 (copy)
        v116();
    end);
    v103.SelectionLost:Connect(function() --[[ Line: 429 ]]
        -- upvalues: v0 (ref), v103 (ref), v106 (ref)
        if v0.UIBloxThemeEnabled then
            v103.BackgroundColor3 = v0.color(v106);
            v103.BackgroundTransparency = v0.transparency(v106);
            return;
        else
            v103.Image = "rbxasset://textures/ui/Settings/MenuBarAssets/MenuButton.png";
            return;
        end;
    end);
    local _ = l_GuiService_0.Changed:Connect(function(v122) --[[ Line: 433 ]]
        -- upvalues: l_VRService_0 (ref), l_UserInputService_0 (ref), l_GuiService_0 (ref), v103 (ref), v0 (ref), v106 (ref), v116 (copy)
        if v122 ~= "SelectedCoreObject" then
            return;
        elseif not (not l_VRService_0.VREnabled and (not l_UserInputService_0.TouchEnabled or l_UserInputService_0.GamepadEnabled and true or false)) then
            return;
        elseif l_GuiService_0.SelectedCoreObject == nil or l_GuiService_0.SelectedCoreObject ~= v103 then
            if v0.UIBloxThemeEnabled then
                v103.BackgroundColor3 = v0.color(v106);
                v103.BackgroundTransparency = v0.transparency(v106);
                return;
            else
                v103.Image = "rbxasset://textures/ui/Settings/MenuBarAssets/MenuButton.png";
                return;
            end;
        else
            if v103.Selectable then
                v116();
            end;
            return;
        end;
    end);
    return v103, v113;
end;
local function v151(v125, v126, v127, v128, v129, v130, v131) --[[ Line: 454 ]] --[[ Name: MakeIconButton ]]
    -- upvalues: l_Create_0 (copy), v0 (copy), l_UserInputService_0 (copy), v88 (copy), v95 (copy), l_GuiService_0 (copy), l_VRService_0 (copy)
    local v132 = l_Create_0("ImageLabel")({
        Image = "", 
        BackgroundTransparency = 1
    });
    local l_Medium_0 = v0.IconSize.Medium;
    local function v136(v134) --[[ Line: 462 ]]
        -- upvalues: v128 (copy), v0 (ref), l_Medium_0 (copy)
        if v128 then
            return v128;
        else
            local v135 = v134 + 4 * ({
                [v0.IconSize.Small] = 1, 
                [v0.IconSize.Medium] = 2, 
                [v0.IconSize.Large] = 3, 
                [v0.IconSize.XLarge] = 4, 
                [v0.IconSize.XXLarge] = 5
            })[l_Medium_0];
            return UDim2.fromOffset(v135, v135);
        end;
    end;
    local v137 = v0.getIconSize(l_Medium_0);
    local v138 = v136(v137);
    local v139 = v138 + UDim2.new(0, 0, 0, 18);
    local v140 = l_Create_0("Frame")({
        Name = v125 .. "IconButton", 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        Size = v139
    });
    l_Create_0("UIListLayout")({
        Name = "MenuListLayout", 
        Padding = UDim.new(0, 2), 
        FillDirection = Enum.FillDirection.Vertical, 
        SortOrder = Enum.SortOrder.LayoutOrder, 
        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
        Parent = v140
    });
    l_Create_0("TextLabel")({
        Name = v125 .. "TextLabel", 
        AutomaticSize = Enum.AutomaticSize.Y, 
        AnchorPoint = Vector2.new(0.5, 1), 
        Position = UDim2.new(0.5, 0, 1, 0), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        TextColor3 = Color3.fromRGB(255, 255, 255), 
        TextYAlignment = Enum.TextYAlignment.Center, 
        TextWrapped = true, 
        Size = UDim2.new(1.5, 0, 0, 0), 
        Font = v0.font(Enum.Font.SourceSansBold, "Bold_Font"), 
        TextSize = v0.textSize(14), 
        LineHeight = 0.8, 
        Text = v127, 
        Parent = v140, 
        LayoutOrder = 2
    });
    local v141 = l_Create_0("ImageButton")({
        Name = "Button", 
        Size = v138, 
        BackgroundTransparency = 1, 
        AutoButtonColor = false, 
        SelectionImageObject = v132, 
        Parent = v140
    });
    local v142 = l_Create_0("ImageLabel")({
        Name = "Background", 
        BackgroundTransparency = v0.transparency("IconButton"), 
        BorderSizePixel = 0, 
        Size = UDim2.fromScale(1, 1), 
        BackgroundColor3 = v0.color("IconButton"), 
        Parent = v141
    });
    l_Create_0("UICorner")({
        CornerRadius = UDim.new(0, 8), 
        Parent = v142
    });
    v126 = v126 or {
        Image = "", 
        ImageRectOffset = Vector2.new(), 
        ImageRectSize = Vector2.new()
    };
    local v143 = l_Create_0("ImageLabel")({
        Name = v125 .. "Icon", 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Position = UDim2.fromScale(0.5, 0.5), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        Size = UDim2.fromOffset(v137, v137), 
        Image = v126.Image, 
        ImageRectOffset = v126.ImageRectOffset, 
        ImageRectSize = v126.ImageRectSize, 
        ImageColor3 = Color3.new(1, 1, 1), 
        Parent = v141
    });
    local function v144() --[[ Line: 561 ]]
        -- upvalues: v142 (copy), v0 (ref), v143 (copy)
        v142.BackgroundColor3 = v0.color("IconButton");
        v143.ImageColor3 = Color3.new(1, 1, 1);
    end;
    local function v146() --[[ Line: 566 ]]
        -- upvalues: v131 (copy), v130 (copy), v142 (copy), v0 (ref), v143 (copy)
        local l_v131_0 = v131;
        if l_v131_0 == nil and v130 then
            l_v131_0 = v130.HubRef;
        end;
        if l_v131_0 and l_v131_0.Active or l_v131_0 == nil then
            v142.BackgroundColor3 = v0.color("IconButtonHover");
            v143.ImageColor3 = Color3.new(0, 0, 0);
        end;
    end;
    if not l_UserInputService_0.TouchEnabled then
        v88(v141, v142, v144, v146);
    end;
    v141.SelectionGained:Connect(function() --[[ Line: 584 ]]
        -- upvalues: v131 (copy), v130 (copy), v142 (copy), v0 (ref), v143 (copy)
        local l_v131_1 = v131;
        if l_v131_1 == nil and v130 then
            l_v131_1 = v130.HubRef;
        end;
        if l_v131_1 and l_v131_1.Active or l_v131_1 == nil then
            v142.BackgroundColor3 = v0.color("IconButtonHover");
            v143.ImageColor3 = Color3.new(0, 0, 0);
        end;
    end);
    v141.SelectionLost:Connect(function() --[[ Line: 587 ]]
        -- upvalues: v142 (copy), v0 (ref), v143 (copy)
        v142.BackgroundColor3 = v0.color("IconButton");
        v143.ImageColor3 = Color3.new(1, 1, 1);
    end);
    if v129 then
        v141.MouseButton1Click:Connect(function() --[[ Line: 592 ]]
            -- upvalues: v129 (copy), v95 (ref), l_UserInputService_0 (ref)
            v129(v95[l_UserInputService_0:GetLastInputType()] or false);
        end);
    end;
    local _ = l_GuiService_0.Changed:Connect(function(v148) --[[ Line: 597 ]]
        -- upvalues: l_VRService_0 (ref), l_UserInputService_0 (ref), l_GuiService_0 (ref), v141 (copy), v142 (copy), v0 (ref), v143 (copy), v131 (copy), v130 (copy)
        if v148 ~= "SelectedCoreObject" then
            return;
        elseif not (not l_VRService_0.VREnabled and (not l_UserInputService_0.TouchEnabled or l_UserInputService_0.GamepadEnabled and true or false)) then
            return;
        elseif l_GuiService_0.SelectedCoreObject == nil or l_GuiService_0.SelectedCoreObject ~= v141 then
            v142.BackgroundColor3 = v0.color("IconButton");
            v143.ImageColor3 = Color3.new(1, 1, 1);
            return;
        else
            if v141.Selectable then
                local l_v131_2 = v131;
                if l_v131_2 == nil and v130 then
                    l_v131_2 = v130.HubRef;
                end;
                if l_v131_2 and l_v131_2.Active or l_v131_2 == nil then
                    v142.BackgroundColor3 = v0.color("IconButtonHover");
                    v143.ImageColor3 = Color3.new(0, 0, 0);
                end;
            end;
            return;
        end;
    end);
    return v140;
end;
local function v166(v152, v153, v154, v155, v156, v157) --[[ Line: 618 ]] --[[ Name: MakeButton ]]
    -- upvalues: v124 (copy), l_Create_0 (copy), v0 (copy), l_GuiService_0 (copy), l_UserInputService_0 (copy), v28 (copy), l_status_0 (copy)
    local v158, v159 = v124(v152, v154, v155, v156, v157);
    local v160 = l_Create_0("TextLabel")({
        Name = v152 .. "TextLabel", 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        Size = v0.UIBloxThemeEnabled and UDim2.new(1, 0, 1, 0) or UDim2.new(1, 0, 1, -8), 
        Position = UDim2.new(0, 0, 0, 0), 
        TextColor3 = v0.color("WhiteButtonText", Color3.fromRGB(255, 255, 255)), 
        TextTransparency = v0.transparency("WhiteButtonText", 0), 
        TextYAlignment = Enum.TextYAlignment.Center, 
        Font = v0.font(Enum.Font.SourceSansBold, "Button"), 
        TextSize = v0.textSize(24, "Button"), 
        Text = v153, 
        TextScaled = false, 
        TextWrapped = true, 
        ZIndex = 2, 
        Parent = v158
    });
    local v161 = Instance.new("UITextSizeConstraint", v160);
    local v162 = if _G.__TESTEZ_RUNNING_TEST__ then Vector2.new(1024, 1024) else l_GuiService_0:GetHardwareSafeViewport();
    if l_UserInputService_0.TouchEnabled and (v162.Y < 500 or v162.X < 700) then
        if v0.UIBloxThemeEnabled and v0.UseBiggerText and (v152 == "ResumeButton" or v152 == "ResetButton" or v152 == "LeaveButton") then
            v160.TextSize = v0.textSize(20);
        else
            v160.TextSize = v0.textSize(18);
        end;
    elseif v28 then
        local v163 = true;
        if v152 ~= "FriendStatus" then
            v163 = v152 == "BlockButton";
        end;
        if not v0.UIBloxThemeEnabled or not v163 then
            v160.TextSize = v0.textSize(36);
        end;
    end;
    if not l_status_0 then
        v161.MaxTextSize = v160.TextSize;
    else
        local v164 = (l_GuiService_0.PreferredTextSize.Value - 1) * 3;
        v161.MaxTextSize = v160.TextSize + v164;
        v162 = v160.TextSize;
        do
            local l_v164_0 = v164;
            l_GuiService_0:GetPropertyChangedSignal("PreferredTextSize"):Connect(function() --[[ Line: 659 ]]
                -- upvalues: l_v164_0 (ref), l_GuiService_0 (ref), v161 (copy), v162 (copy)
                l_v164_0 = (l_GuiService_0.PreferredTextSize.Value - 1) * 3;
                v161.MaxTextSize = v162 + l_v164_0;
            end);
        end;
    end;
    return v158, v160, v159;
end;
local function v180(v167, v168, v169, v170, v171, v172, v173, v174) --[[ Line: 668 ]] --[[ Name: MakeImageButton ]]
    -- upvalues: v124 (copy), l_Create_0 (copy), v0 (copy)
    if not v174 then
        v174 = "ImageButton";
    end;
    local v175, v176 = v124(v167, v169, v171, v172, v173, v174);
    local v177 = nil;
    local v178 = nil;
    if typeof(v168) == "table" then
        v177 = v168.ImageRectOffset;
        v178 = v168.ImageRectSize;
        v168 = v168.Image;
    end;
    local v179 = l_Create_0("ImageLabel")({
        Name = v167 .. "ImageLabel", 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        Size = v170, 
        Position = UDim2.new(0.5, 0, 0.5, 0), 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Image = v168, 
        ImageRectOffset = v177, 
        ImageRectSize = v178, 
        ZIndex = 2, 
        Parent = v175
    });
    if v0.UIBloxThemeEnabled and v174 == "ImageButton" then
        v175.Border.Thickness = 0;
        v175.Border.Transparency = 1;
    end;
    return v175, v179, v176;
end;
local function v191(v181, v182, v183, v184, v185, v186) --[[ Line: 703 ]] --[[ Name: AddButtonRow ]]
    -- upvalues: v166 (copy), l_Create_0 (copy)
    local v187, v188, v189 = v166(v182, v183, v184, v185, v181, v186);
    local v190 = l_Create_0("Frame")({
        Name = v182 .. "Row", 
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, v184.Y.Scale, v184.Y.Offset), 
        Parent = v181.Page
    });
    v187.Parent = v190;
    v187.AnchorPoint = Vector2.new(1, 0);
    v187.Position = UDim2.new(1, -20, 0, 0);
    return v190, v187, v188, v189;
end;
local function v207(v192, v193) --[[ Line: 719 ]] --[[ Name: MakeRoundedRectFocusState ]]
    -- upvalues: v0 (copy), l_Create_0 (copy), v7 (copy), v20 (copy), l_RunService_0 (copy), l_UserGameSettings_0 (copy)
    if not v0.UIBloxThemeEnabled then
        return;
    else
        local v194 = l_Create_0("Frame")({
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 12, 1, 12), 
            Position = UDim2.fromOffset(-6, -6)
        });
        l_Create_0("UICorner")({
            CornerRadius = v7, 
            Parent = v194
        });
        local v195 = l_Create_0("UIStroke")({
            Color = v0.selectionCursor.AnimatedColor, 
            Transparency = 0, 
            Thickness = 3, 
            Parent = v194
        });
        local v196 = l_Create_0("UIGradient")({
            Rotation = 0, 
            Color = v0.selectionCursor.GradientColorSequence, 
            Transparency = v0.selectionCursor.GradientTransparencySequence, 
            Parent = v195
        });
        if v20 then
            l_RunService_0:UnbindFromRenderStep(v193);
        end;
        l_RunService_0:BindToRenderStep(v193, Enum.RenderPriority.Last.Value, function() --[[ Line: 754 ]]
            -- upvalues: v196 (copy), v0 (ref), l_UserGameSettings_0 (ref)
            local v197 = v196.Rotation + 2;
            local l_GradientColorSequence_0 = v0.selectionCursor.GradientColorSequence;
            local l_GradientTransparencySequence_0 = v0.selectionCursor.GradientTransparencySequence;
            if l_UserGameSettings_0.ReducedMotion then
                local v200 = (math.sin((math.rad(v197))) + 1) / 2;
                local l_Value_0 = l_GradientColorSequence_0.Keypoints[1].Value;
                local l_Value_1 = l_GradientColorSequence_0.Keypoints[#l_GradientColorSequence_0.Keypoints].Value;
                l_GradientColorSequence_0 = ColorSequence.new(l_Value_0:lerp(l_Value_1, v200));
                local l_Value_2 = l_GradientTransparencySequence_0.Keypoints[1].Value;
                local l_Value_3 = l_GradientTransparencySequence_0.Keypoints[#l_GradientTransparencySequence_0.Keypoints].Value;
                l_GradientTransparencySequence_0 = NumberSequence.new(l_Value_2 + (l_Value_3 - l_Value_2) * v200);
            end;
            v196.Rotation = v197;
            v196.Color = l_GradientColorSequence_0;
            v196.Transparency = l_GradientTransparencySequence_0;
        end);
        v192.AncestryChanged:Connect(function(_, v206) --[[ Line: 778 ]]
            -- upvalues: l_RunService_0 (ref), v193 (copy)
            if not v206 then
                l_RunService_0:UnbindFromRenderStep(v193);
            end;
        end);
        v192.SelectionImageObject = v194;
        return;
    end;
end;
local function v287(v208, v209, v210) --[[ Line: 787 ]] --[[ Name: CreateDropDown ]]
    -- upvalues: v0 (copy), l_HttpService_0 (copy), l_Create_0 (copy), l_CoreGui_0 (copy), l_VRService_0 (copy), l_CorePackages_0 (copy), l_UserInputService_0 (copy), l_GuiService_0 (copy), l_ContextActionService_0 (copy), l_RobloxTranslator_0 (copy), v166 (copy)
    local v211 = v0.color("SELECTION_TEXT_COLOR_NORMAL", Color3.fromRGB(178, 178, 178));
    local v212 = Color3.fromRGB(229, 229, 229);
    local v213 = v0.color("SELECTION_TEXT_COLOR_HIGHLIGHTED", Color3.fromRGB(255, 255, 255));
    local v214 = nil;
    local v215 = {
        CurrentIndex = nil, 
        UpdateDropDownList = nil, 
        DropDownFrame = nil, 
        Selections = nil
    };
    Instance.new("BindableEvent").Name = "IndexChanged";
    if type(v208) ~= "table" then
        error("CreateDropDown dropDownStringTable (first arg) is not a table", 2);
        return v215;
    else
        local l_BindableEvent_1 = Instance.new("BindableEvent");
        l_BindableEvent_1.Name = "IndexChanged";
        local v217 = true;
        local v218 = l_HttpService_0:GenerateGUID(false);
        local v219 = nil;
        local l_v208_0 = v208;
        local v221 = l_Create_0("ImageButton")({
            Name = "DropDownFullscreenFrame", 
            BackgroundTransparency = 0.2, 
            BorderSizePixel = 0, 
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundColor3 = Color3.fromRGB(0, 0, 0), 
            ZIndex = 10, 
            Active = true, 
            Visible = false, 
            Selectable = false, 
            AutoButtonColor = false, 
            Parent = l_CoreGui_0.RobloxGui
        });
        local function v223(v222) --[[ Line: 837 ]] --[[ Name: onVREnabled ]]
            -- upvalues: l_VRService_0 (ref), l_CorePackages_0 (ref), v221 (copy), l_CoreGui_0 (ref), v215 (copy), l_v208_0 (ref)
            if v222 ~= "VREnabled" then
                return;
            else
                if l_VRService_0.VREnabled then
                    v221.Parent = require(l_CorePackages_0.Workspace.Packages.VrCommon).Panel3D.Get("SettingsMenu"):GetGUI();
                    v221.BackgroundTransparency = 1;
                else
                    v221.Parent = l_CoreGui_0.RobloxGui;
                    v221.BackgroundTransparency = 0.2;
                end;
                if v215.UpdateDropDownList then
                    v215:UpdateDropDownList(l_v208_0);
                end;
                return;
            end;
        end;
        l_VRService_0.Changed:Connect(v223);
        v223("VREnabled");
        local v224 = l_Create_0("ImageLabel")({
            Name = "DropDownSelectionFrame", 
            Image = v0.UIBloxThemeEnabled and "" or "rbxasset://textures/ui/Settings/MenuBarAssets/MenuButton.png", 
            ScaleType = if v0.UIBloxThemeEnabled then Enum.ScaleType.Stretch else Enum.ScaleType.Slice, 
            SliceCenter = Rect.new(8, 6, 46, 44), 
            BackgroundTransparency = v0.transparency("DropdownListBg", 1), 
            BackgroundColor3 = v0.color("DropdownListBg"), 
            Size = UDim2.new(0.6, 0, 0.9, 0), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            ZIndex = 10, 
            Parent = v221
        });
        if v0.UIBloxThemeEnabled then
            l_Create_0("UICorner")({
                CornerRadius = v0.DefaultCornerRadius, 
                Parent = v224
            });
        end;
        local v225 = l_Create_0("ScrollingFrame")({
            Name = "DropDownScrollingFrame", 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Size = UDim2.new(1, -20, 1, -25), 
            Position = UDim2.new(0, 10, 0, 10), 
            ZIndex = 10, 
            ScrollBarThickness = v0.DefaultScrollBarThickness, 
            ScrollingDirection = if v0.UIBloxThemeEnabled then Enum.ScrollingDirection.Y else Enum.ScrollingDirection.XY, 
            Parent = v224
        });
        local v226 = nil;
        local v227 = false;
        local function v230(v228, v229) --[[ Line: 893 ]]
            -- upvalues: v215 (copy), v217 (ref), v210 (copy), v221 (copy), l_VRService_0 (ref), l_UserInputService_0 (ref), l_GuiService_0 (ref), v214 (ref), v226 (ref), l_ContextActionService_0 (ref), v218 (copy), v219 (ref), v227 (ref), l_CorePackages_0 (ref)
            if v228 ~= nil and v229 ~= Enum.UserInputState.Begin then
                return;
            else
                v215.DropDownFrame.Selectable = v217;
                v210:SetActive(true);
                if v221.Visible and not l_VRService_0.VREnabled and (not l_UserInputService_0.TouchEnabled or l_UserInputService_0.GamepadEnabled and true or false) then
                    l_GuiService_0.SelectedCoreObject = v214;
                end;
                v221.Visible = false;
                if v226 then
                    v226:Disconnect();
                end;
                l_ContextActionService_0:UnbindCoreAction(v218 .. "Action");
                l_ContextActionService_0:UnbindCoreAction(v218 .. "FreezeAction");
                v219.Value = v217;
                v227 = false;
                if l_VRService_0.VREnabled then
                    require(l_CorePackages_0.Workspace.Packages.VrCommon).Panel3D.Get("SettingsMenu"):SetSubpanelDepth(v221, 0);
                end;
                return;
            end;
        end;
        local function v231() --[[ Line: 921 ]]

        end;
        local function v233() --[[ Line: 923 ]]
            -- upvalues: v217 (ref), v215 (copy), v227 (ref), v221 (copy), l_VRService_0 (ref), l_CorePackages_0 (ref), v214 (ref), l_GuiService_0 (ref), v226 (ref), v213 (copy), v212 (copy), v211 (copy), l_ContextActionService_0 (ref), v218 (copy), v231 (copy), v230 (copy), v210 (copy), v219 (ref)
            if not v217 then
                return;
            else
                v215.DropDownFrame.Selectable = false;
                v227 = true;
                v221.Visible = true;
                if l_VRService_0.VREnabled then
                    require(l_CorePackages_0.Workspace.Packages.VrCommon).Panel3D.Get("SettingsMenu"):SetSubpanelDepth(v221, 0.5);
                end;
                v214 = v215.DropDownFrame;
                if v215.CurrentIndex and v215.CurrentIndex > 0 then
                    l_GuiService_0.SelectedCoreObject = v215.Selections[v215.CurrentIndex];
                elseif #v215.Selections > 0 then
                    l_GuiService_0.SelectedCoreObject = v215.Selections[1];
                end;
                v226 = l_GuiService_0:GetPropertyChangedSignal("SelectedCoreObject"):Connect(function() --[[ Line: 944 ]]
                    -- upvalues: v215 (ref), l_GuiService_0 (ref), v213 (ref), l_VRService_0 (ref), v212 (ref), v211 (ref)
                    for v232 = 1, #v215.Selections do
                        if l_GuiService_0.SelectedCoreObject == v215.Selections[v232] then
                            v215.Selections[v232].TextColor3 = v213;
                        else
                            v215.Selections[v232].TextColor3 = l_VRService_0.VREnabled and v212 or v211;
                        end;
                    end;
                end);
                l_ContextActionService_0:BindCoreAction(v218 .. "FreezeAction", v231, false, Enum.UserInputType.Keyboard, Enum.UserInputType.Gamepad1);
                l_ContextActionService_0:BindCoreAction(v218 .. "Action", v230, false, Enum.KeyCode.ButtonB, Enum.KeyCode.Escape);
                v210:SetActive(false);
                v219.Value = false;
                return;
            end;
        end;
        local v234 = l_RobloxTranslator_0:FormatByKey("Feature.SettingsHub.Label.ChooseOne");
        local v235 = UDim2.new(0.6, 0, 0, 50);
        if v0.UIBloxThemeEnabled then
            v235 = UDim2.new(0.6, 0, 0, 40);
        end;
        v215.DropDownFrame = v166("DropDownFrame", v234, v235, v233, nil, v210);
        v215.DropDownFrame.Position = UDim2.new(1, 0, 0.5, 0);
        v215.DropDownFrame.AnchorPoint = Vector2.new(1, 0.5);
        v219 = v215.DropDownFrame.Enabled;
        local l_DropDownFrameTextLabel_0 = v215.DropDownFrame.DropDownFrameTextLabel;
        l_DropDownFrameTextLabel_0.Position = UDim2.new(0, 15, 0, 0);
        if v0.UIBloxThemeEnabled then
            l_DropDownFrameTextLabel_0.Size = UDim2.new(1, -50, 1, 0);
        else
            l_DropDownFrameTextLabel_0.Size = UDim2.new(1, -50, 1, -8);
        end;
        l_DropDownFrameTextLabel_0.ClipsDescendants = true;
        l_DropDownFrameTextLabel_0.TextXAlignment = Enum.TextXAlignment.Left;
        local v237 = l_Create_0("ImageLabel")({
            Name = "DropDownImage", 
            Image = "rbxasset://textures/ui/Settings/DropDown/DropDown.png", 
            BackgroundTransparency = 1, 
            AnchorPoint = Vector2.new(1, 0.5), 
            Size = UDim2.new(0, 15, 0, 10), 
            Position = UDim2.new(1, -12, 0.5, 0), 
            ZIndex = 2, 
            Parent = v215.DropDownFrame
        });
        v215.DropDownImage = v237;
        local function v242(v238) --[[ Line: 1009 ]] --[[ Name: setSelection ]]
            -- upvalues: v215 (copy), l_DropDownFrameTextLabel_0 (copy), l_BindableEvent_1 (copy)
            local v239 = false;
            for v240, v241 in pairs(v215.Selections) do
                if v240 == v238 then
                    l_DropDownFrameTextLabel_0.Text = v241.Text;
                    v215.CurrentIndex = v240;
                    v239 = true;
                end;
            end;
            if v239 then
                l_BindableEvent_1:Fire(v238);
            end;
        end;
        local function v247(v243) --[[ Line: 1025 ]] --[[ Name: setSelectionByValue ]]
            -- upvalues: v215 (copy), l_DropDownFrameTextLabel_0 (copy), l_BindableEvent_1 (copy)
            local v244 = false;
            for v245, v246 in pairs(v215.Selections) do
                if v246.Text == v243 then
                    l_DropDownFrameTextLabel_0.Text = v246.Text;
                    v215.CurrentIndex = v245;
                    v244 = true;
                end;
            end;
            if v244 then
                l_BindableEvent_1:Fire(v215.CurrentIndex);
            end;
            return v244;
        end;
        local function _(v248) --[[ Line: 1042 ]] --[[ Name: setIsFaded ]]
            -- upvalues: v215 (copy)
            if v248 then
                v215.DropDownFrame.DropDownFrameTextLabel.TextTransparency = 0.5;
                v215.DropDownFrame.ImageTransparency = 0.5;
                v215.DropDownImage.ImageTransparency = 0.5;
                return;
            else
                v215.DropDownFrame.DropDownFrameTextLabel.TextTransparency = 0;
                v215.DropDownFrame.ImageTransparency = 0;
                v215.DropDownImage.ImageTransparency = 0;
                return;
            end;
        end;
        v215.IndexChanged = l_BindableEvent_1.Event;
        v215.SetSelectionIndex = function(_, v251) --[[ Line: 1057 ]] --[[ Name: SetSelectionIndex ]]
            -- upvalues: v242 (copy)
            v242(v251);
        end;
        v215.SetSelectionByValue = function(_, v253) --[[ Line: 1061 ]] --[[ Name: SetSelectionByValue ]]
            -- upvalues: v247 (copy)
            return (v247(v253));
        end;
        v215.ResetSelectionIndex = function(_) --[[ Line: 1065 ]] --[[ Name: ResetSelectionIndex ]]
            -- upvalues: v215 (copy), l_DropDownFrameTextLabel_0 (copy), v234 (copy), v230 (copy)
            v215.CurrentIndex = nil;
            l_DropDownFrameTextLabel_0.Text = v234;
            v230();
        end;
        v215.GetSelectedIndex = function(_) --[[ Line: 1071 ]] --[[ Name: GetSelectedIndex ]]
            -- upvalues: v215 (copy)
            return v215.CurrentIndex;
        end;
        v215.SetZIndex = function(_, v257) --[[ Line: 1075 ]] --[[ Name: SetZIndex ]]
            -- upvalues: v215 (copy), v237 (copy), l_DropDownFrameTextLabel_0 (copy)
            v215.DropDownFrame.ZIndex = v257;
            v237.ZIndex = v257;
            l_DropDownFrameTextLabel_0.ZIndex = v257;
        end;
        v215.SetInteractable = function(_, v259) --[[ Line: 1081 ]] --[[ Name: SetInteractable ]]
            -- upvalues: v217 (ref), v215 (copy), v230 (copy), l_VRService_0 (ref), v219 (ref), v227 (ref)
            v217 = v259;
            v215.DropDownFrame.Selectable = v217;
            if not v217 then
                v230();
                if l_VRService_0.VREnabled then
                    v215.DropDownFrame.DropDownFrameTextLabel.TextTransparency = 0.5;
                    v215.DropDownFrame.ImageTransparency = 0.5;
                    v215.DropDownImage.ImageTransparency = 0.5;
                else
                    v215.DropDownFrame.DropDownFrameTextLabel.TextTransparency = 0;
                    v215.DropDownFrame.ImageTransparency = 0;
                    v215.DropDownImage.ImageTransparency = 0;
                end;
                if not l_VRService_0.VREnabled then
                    v215:SetZIndex(1);
                end;
            else
                v215.DropDownFrame.DropDownFrameTextLabel.TextTransparency = 0;
                v215.DropDownFrame.ImageTransparency = 0;
                v215.DropDownImage.ImageTransparency = 0;
                if not l_VRService_0.VREnabled then
                    v215:SetZIndex(2);
                end;
            end;
            v219.Value = v259 and not v227;
            v215.DropDownImage.Visible = v259;
            if v259 then
                v215.DropDownFrame.ImageTransparency = 0;
                return;
            else
                v215.DropDownFrame.ImageTransparency = 0.5;
                return;
            end;
        end;
        v215.SetAutoLocalize = function(_, v261) --[[ Line: 1108 ]] --[[ Name: SetAutoLocalize ]]
            -- upvalues: v221 (copy)
            v221.AutoLocalize = v261;
        end;
        v215.UpdateDropDownList = function(_, v263) --[[ Line: 1112 ]] --[[ Name: UpdateDropDownList ]]
            -- upvalues: l_v208_0 (ref), v215 (copy), l_VRService_0 (ref), v0 (ref), l_Create_0 (ref), v212 (copy), v211 (copy), v225 (copy), v209 (copy), l_DropDownFrameTextLabel_0 (copy), v213 (copy), v230 (copy), l_BindableEvent_1 (copy), l_UserInputService_0 (ref), l_GuiService_0 (ref), v218 (copy), v221 (copy), v224 (copy)
            l_v208_0 = v263;
            if v215.Selections then
                for v264 = 1, #v215.Selections do
                    v215.Selections[v264]:Destroy();
                end;
            end;
            v215.Selections = {};
            v215.SelectionInfo = {};
            local l_VREnabled_0 = l_VRService_0.VREnabled;
            local v266 = l_VREnabled_0 and v0.font(Enum.Font.SourceSansBold, "Bold") or v0.font(Enum.Font.SourceSans, "UtilityText");
            local v267 = l_VREnabled_0 and v0.textSize(36) or v0.textSize(24, "UtilityText");
            local v268 = l_VREnabled_0 and 70 or 50;
            local v269 = v268 + 1;
            local v270 = l_VREnabled_0 and 600 or 400;
            local v271 = 0;
            for v272, v273 in pairs(v263) do
                local v274 = l_Create_0("Frame")({
                    BackgroundTransparency = 0.7, 
                    BorderSizePixel = 0, 
                    Size = UDim2.new(1, 0, 1, 0)
                });
                if v0.UIBloxThemeEnabled then
                    l_Create_0("UICorner")({
                        CornerRadius = v0.DefaultCornerRadius, 
                        Parent = v274
                    });
                end;
                local l_v273_0 = v273;
                local v276 = "";
                local v277 = typeof(v273) == "table";
                if v277 then
                    l_v273_0 = v273.title;
                    v276 = v273.subtitle;
                    v271 = v271 + 10;
                end;
                local v278 = nil;
                if v277 then
                    v278 = l_Create_0("TextButton")({
                        Name = "Selection" .. tostring(v272), 
                        BackgroundTransparency = 1, 
                        BorderSizePixel = 0, 
                        AutoButtonColor = false, 
                        TextYAlignment = Enum.TextYAlignment.Top, 
                        Size = UDim2.new(1, -28, 0, v268 + 10), 
                        Position = UDim2.new(0, 14, 0, (v272 - 1) * (v269 + 10)), 
                        TextColor3 = l_VRService_0.VREnabled and v212 or v211, 
                        Font = v266, 
                        TextSize = v267, 
                        Text = l_v273_0, 
                        ZIndex = 10, 
                        SelectionImageObject = v274, 
                        Parent = v225
                    });
                    local _ = l_Create_0("TextLabel")({
                        Name = "Subtitle" .. tostring(v272), 
                        BackgroundTransparency = 1, 
                        BorderSizePixel = 0, 
                        Size = UDim2.new(1, -28, 0, v268 * 0.8), 
                        Position = UDim2.new(0, 14, 0, 15), 
                        TextColor3 = l_VRService_0.VREnabled and v212 or v211, 
                        Font = v266, 
                        TextSize = v267 * 0.8, 
                        Text = v276, 
                        ZIndex = 10, 
                        Parent = v278
                    });
                else
                    v278 = l_Create_0("TextButton")({
                        Name = "Selection" .. tostring(v272), 
                        BackgroundTransparency = 1, 
                        BorderSizePixel = 0, 
                        AutoButtonColor = false, 
                        Size = UDim2.new(1, -28, 0, v268), 
                        Position = UDim2.new(0, 14, 0, (v272 - 1) * v269), 
                        TextColor3 = l_VRService_0.VREnabled and v212 or v211, 
                        Font = v266, 
                        TextSize = v267, 
                        Text = v273, 
                        ZIndex = 10, 
                        SelectionImageObject = v274, 
                        Parent = v225
                    });
                end;
                if v272 == v209 then
                    v215.CurrentIndex = v272;
                    l_DropDownFrameTextLabel_0.Text = l_v273_0;
                    v278.TextColor3 = v213;
                elseif not v209 and v272 == 1 then
                    v278.TextColor3 = v213;
                end;
                do
                    local l_v278_0 = v278;
                    local function v281() --[[ Line: 1218 ]]
                        -- upvalues: l_DropDownFrameTextLabel_0 (ref), l_v278_0 (ref), v230 (ref), v215 (ref), v272 (copy), l_BindableEvent_1 (ref)
                        l_DropDownFrameTextLabel_0.Text = l_v278_0.Text;
                        v230();
                        v215.CurrentIndex = v272;
                        l_BindableEvent_1:Fire(v272);
                    end;
                    l_v278_0.MouseButton1Click:Connect(v281);
                    l_v278_0.MouseEnter:Connect(function() --[[ Line: 1227 ]]
                        -- upvalues: l_VRService_0 (ref), l_UserInputService_0 (ref), l_GuiService_0 (ref), l_v278_0 (ref)
                        if not l_VRService_0.VREnabled and (not l_UserInputService_0.TouchEnabled or l_UserInputService_0.GamepadEnabled and true or false) then
                            l_GuiService_0.SelectedCoreObject = l_v278_0;
                        end;
                    end);
                    v215.Selections[v272] = l_v278_0;
                    local l_SelectionInfo_0 = v215.SelectionInfo;
                    local v283 = {
                        Clicked = v281
                    };
                    l_SelectionInfo_0[l_v278_0] = v283;
                end;
            end;
            l_GuiService_0:RemoveSelectionGroup(v218);
            l_GuiService_0:AddSelectionTuple(v218, unpack(v215.Selections));
            v225.CanvasSize = UDim2.new(1, -20, 0, #v263 * v269 + v271);
            local function v284() --[[ Line: 1243 ]] --[[ Name: updateDropDownSize ]]
                -- upvalues: v225 (ref), v221 (ref), v224 (ref), v270 (copy)
                if v225.CanvasSize.Y.Offset < v221.AbsoluteSize.Y - 10 then
                    v224.Size = UDim2.new(0, v270, 0, v225.CanvasSize.Y.Offset + 25);
                    return;
                else
                    v224.Size = UDim2.new(0, v270, 0.9, 0);
                    return;
                end;
            end;
            v221.Changed:Connect(function(v285) --[[ Line: 1256 ]]
                -- upvalues: v284 (copy)
                if v285 ~= "AbsoluteSize" then
                    return;
                else
                    v284();
                    return;
                end;
            end);
            v284();
        end;
        v215:UpdateDropDownList(v208);
        v221.MouseButton1Click:Connect(v230);
        v210.PoppedMenu:Connect(function(v286) --[[ Line: 1271 ]]
            -- upvalues: v221 (copy), v230 (copy)
            if v286 == v221 then
                v230();
            end;
        end);
        return v215;
    end;
end;
local function v361(v288, v289) --[[ Line: 1280 ]] --[[ Name: CreateSelector ]]
    -- upvalues: l_Create_0 (copy), v30 (copy), v0 (copy), v4 (copy), l_UserInputService_0 (copy), v5 (copy), v88 (copy), l_VRService_0 (copy), l_GuiService_0 (copy), v43 (copy), v6 (copy), v28 (copy), v29 (copy)
    local v290 = 0;
    local v291 = {
        HubRef = nil, 
        SetSelectionIndex = nil
    };
    if type(v288) ~= "table" then
        error("CreateSelector selectionStringTable (first arg) is not a table", 2);
        return v291;
    else
        local l_BindableEvent_2 = Instance.new("BindableEvent");
        l_BindableEvent_2.Name = "IndexChanged";
        local v293 = true;
        v291.CurrentIndex = 0;
        v291.SelectorFrame = l_Create_0("ImageButton")({
            Name = "Selector", 
            Image = "", 
            AutoButtonColor = false, 
            NextSelectionLeft = v291.SelectorFrame, 
            NextSelectionRight = v291.SelectorFrame, 
            BackgroundTransparency = 1, 
            Size = UDim2.new(0.6, 0, 0, 50), 
            Position = UDim2.new(1, 0, 0.5, 0), 
            AnchorPoint = Vector2.new(1, 0.5), 
            ZIndex = 2, 
            SelectionImageObject = v30
        });
        local v294 = l_Create_0("ImageButton")({
            Name = "LeftButton", 
            BackgroundTransparency = 1, 
            AnchorPoint = Vector2.new(0, 0.5), 
            Position = UDim2.new(0, 0, 0.5, 0), 
            Size = UDim2.new(0, v0.SelectorArrowButtonWidth, 0, 50), 
            Image = "", 
            ZIndex = 3, 
            Selectable = false, 
            SelectionImageObject = v30, 
            Parent = v291.SelectorFrame
        });
        local v295 = l_Create_0("ImageButton")({
            Name = "RightButton", 
            BackgroundTransparency = 1, 
            AnchorPoint = Vector2.new(1, 0.5), 
            Position = UDim2.new(1, 0, 0.5, 0), 
            Size = UDim2.new(0, v0.SelectorArrowButtonWidth, 0, 50), 
            Image = "", 
            ZIndex = 3, 
            Selectable = false, 
            SelectionImageObject = v30, 
            Parent = v291.SelectorFrame
        });
        local v296 = l_Create_0("ImageLabel")({
            Name = "LeftButton", 
            BackgroundTransparency = 1, 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            Size = UDim2.new(0, 18, 0, 30), 
            Image = "rbxasset://textures/ui/Settings/Slider/Left.png", 
            ImageColor3 = v4, 
            ZIndex = 4, 
            Parent = v294
        });
        local v297 = l_Create_0("ImageLabel")({
            Name = "RightButton", 
            BackgroundTransparency = 1, 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            Size = UDim2.new(0, 18, 0, 30), 
            Image = "rbxasset://textures/ui/Settings/Slider/Right.png", 
            ImageColor3 = v4, 
            ZIndex = 4, 
            Parent = v295
        });
        if not l_UserInputService_0.TouchEnabled then
            local function v299(v298) --[[ Line: 1366 ]]
                -- upvalues: v4 (ref)
                v298.ImageColor3 = v4;
            end;
            local function v301(v300) --[[ Line: 1368 ]]
                -- upvalues: v5 (ref)
                v300.ImageColor3 = v5;
            end;
            v88(v294, v296, v299, v301);
            v88(v295, v297, v299, v301);
        end;
        v291.Selections = {};
        local v302 = {};
        local v303 = {};
        local v304 = l_Create_0("ImageButton")({
            Name = "AutoSelectButton", 
            BackgroundTransparency = 1, 
            Image = "", 
            Position = UDim2.new(0, v294.Size.X.Offset, 0, 0), 
            Size = UDim2.new(1, v294.Size.X.Offset * -2, 1, 0), 
            Parent = v291.SelectorFrame, 
            ZIndex = 2, 
            SelectionImageObject = v30
        });
        v304.MouseButton1Click:Connect(function() --[[ Line: 1389 ]]
            -- upvalues: v293 (ref), v291 (copy), l_VRService_0 (ref), l_UserInputService_0 (ref), l_GuiService_0 (ref)
            if not v293 then
                return;
            elseif #v291.Selections <= 1 then
                return;
            else
                local v305 = v291.CurrentIndex + 1;
                if #v291.Selections < v305 then
                    v305 = 1;
                end;
                v291:SetSelectionIndex(v305);
                if not l_VRService_0.VREnabled and (not l_UserInputService_0.TouchEnabled or l_UserInputService_0.GamepadEnabled and true or false) then
                    l_GuiService_0.SelectedCoreObject = v291.SelectorFrame;
                end;
                return;
            end;
        end);
        v303[v304] = true;
        local function v313(v306, v307) --[[ Line: 1408 ]] --[[ Name: setSelection ]]
            -- upvalues: v291 (copy), v294 (copy), v302 (ref), v43 (ref), l_BindableEvent_2 (copy)
            for v308, v309 in pairs(v291.Selections) do
                local v310 = v308 == v306;
                local v311 = UDim2.new(0, v294.Size.X.Offset, 0, 0);
                local v312 = UDim2.new(0, v294.Size.X.Offset * v307 * 3, 0, 0);
                if v302[v309] then
                    v312 = UDim2.new(0, v294.Size.X.Offset * -v307 * 3, 0, 0);
                end;
                if v312.X.Offset < 0 then
                    v312 = UDim2.new(0, v312.X.Offset + v309.AbsoluteSize.X / 4, 0, 0);
                end;
                if v310 then
                    v302[v309] = true;
                    v309.Position = v312;
                    v309.Visible = true;
                    PropertyTweener(v309, "TextTransparency", 1, 0, 0.165, v43);
                    if v309:IsDescendantOf(game) then
                        v309:TweenPosition(v311, Enum.EasingDirection.In, Enum.EasingStyle.Quad, 0.15, true);
                    else
                        v309.Position = v311;
                    end;
                    v291.CurrentIndex = v308;
                    l_BindableEvent_2:Fire(v306);
                elseif v302[v309] then
                    v302[v309] = false;
                    PropertyTweener(v309, "TextTransparency", 0, 1, 0.165, v43);
                    if v309:IsDescendantOf(game) then
                        v309:TweenPosition(v312, Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.135, true);
                    else
                        v309.Position = v312;
                    end;
                end;
            end;
        end;
        local function v318(v314, v315) --[[ Line: 1459 ]] --[[ Name: stepFunc ]]
            -- upvalues: v293 (ref), l_VRService_0 (ref), l_UserInputService_0 (ref), l_GuiService_0 (ref), v291 (copy), v313 (copy)
            if not v293 then
                return;
            elseif v314 ~= nil and v314.UserInputType ~= Enum.UserInputType.MouseButton1 and v314.UserInputType ~= Enum.UserInputType.Gamepad1 and v314.UserInputType ~= Enum.UserInputType.Gamepad2 and v314.UserInputType ~= Enum.UserInputType.Gamepad3 and v314.UserInputType ~= Enum.UserInputType.Gamepad4 and v314.UserInputType ~= Enum.UserInputType.Keyboard then
                return;
            else
                if not l_VRService_0.VREnabled and (not l_UserInputService_0.TouchEnabled or l_UserInputService_0.GamepadEnabled and true or false) then
                    l_GuiService_0.SelectedCoreObject = v291.SelectorFrame;
                end;
                local v316 = v315 + v291.CurrentIndex;
                local v317 = 0;
                v317 = v291.CurrentIndex < v316 and 1 or -1;
                if #v291.Selections < v316 then
                    v316 = 1;
                elseif v316 < 1 then
                    v316 = #v291.Selections;
                end;
                v313(v316, v317);
                return;
            end;
        end;
        local v319 = nil;
        local function _() --[[ Line: 1499 ]] --[[ Name: connectToGuiService ]]
            -- upvalues: v319 (ref), l_GuiService_0 (ref), v291 (copy), v303 (copy), l_VRService_0 (ref)
            v319 = l_GuiService_0:GetPropertyChangedSignal("SelectedCoreObject"):Connect(function() --[[ Line: 1500 ]]
                -- upvalues: v291 (ref), l_GuiService_0 (ref), v303 (ref), l_VRService_0 (ref)
                if #v291.Selections <= 0 then
                    return;
                elseif l_GuiService_0.SelectedCoreObject == v291.SelectorFrame then
                    v291.Selections[v291.CurrentIndex].TextTransparency = 0;
                    return;
                elseif l_GuiService_0.SelectedCoreObject ~= nil and v303[l_GuiService_0.SelectedCoreObject] then
                    if l_VRService_0.VREnabled then
                        v291.Selections[v291.CurrentIndex].TextTransparency = 0;
                        return;
                    else
                        l_GuiService_0.SelectedCoreObject = v291.SelectorFrame;
                        return;
                    end;
                else
                    v291.Selections[v291.CurrentIndex].TextTransparency = 0.5;
                    return;
                end;
            end);
        end;
        v291.IndexChanged = l_BindableEvent_2.Event;
        v291.SetSelectionIndex = function(_, v322) --[[ Line: 1524 ]] --[[ Name: SetSelectionIndex ]]
            -- upvalues: v313 (copy)
            v313(v322, 1);
        end;
        v291.GetSelectedIndex = function(_) --[[ Line: 1528 ]] --[[ Name: GetSelectedIndex ]]
            -- upvalues: v291 (copy)
            return v291.CurrentIndex;
        end;
        v291.SetZIndex = function(_, v325) --[[ Line: 1532 ]] --[[ Name: SetZIndex ]]
            -- upvalues: v294 (copy), v295 (copy), v296 (copy), v297 (copy), v291 (copy)
            v294.ZIndex = v325;
            v295.ZIndex = v325;
            v296.ZIndex = v325;
            v297.ZIndex = v325;
            for v326 = 1, #v291.Selections do
                v291.Selections[v326].ZIndex = v325;
            end;
        end;
        v291.SetInteractable = function(_, v328) --[[ Line: 1543 ]] --[[ Name: SetInteractable ]]
            -- upvalues: v293 (ref), v291 (copy), v294 (copy), v295 (copy), v0 (ref), v296 (copy), v6 (ref), v297 (copy), v4 (ref)
            v293 = v328;
            v291.SelectorFrame.Selectable = v293;
            v294.Active = v293;
            v295.Active = v293;
            v294.Visible = v293;
            v295.Visible = v293;
            if not v293 then
                for _, v330 in pairs(v291.Selections) do
                    v330.TextColor3 = v0.color("NotInteractableSelection", Color3.fromRGB(255, 255, 255));
                end;
                v296.ImageColor3 = v6;
                v297.ImageColor3 = v6;
                return;
            else
                for _, v332 in pairs(v291.Selections) do
                    v332.TextColor3 = Color3.fromRGB(255, 255, 255);
                end;
                v296.ImageColor3 = v4;
                v297.ImageColor3 = v4;
                return;
            end;
        end;
        v291.UpdateOptions = function(_, v334) --[[ Line: 1568 ]] --[[ Name: UpdateOptions ]]
            -- upvalues: v291 (copy), v302 (ref), l_Create_0 (ref), v294 (copy), v0 (ref), v28 (ref), v289 (copy), v295 (copy)
            for _, v336 in pairs(v291.Selections) do
                v336:Destroy();
            end;
            v302 = {};
            v291.Selections = {};
            for v337, v338 in pairs(v334) do
                local v339 = l_Create_0("TextLabel")({
                    Name = "Selection" .. tostring(v337), 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    Size = UDim2.new(1, v294.Size.X.Offset * -2, 1, 0), 
                    Position = UDim2.new(1, 0, 0, 0), 
                    TextColor3 = Color3.fromRGB(255, 255, 255), 
                    TextYAlignment = Enum.TextYAlignment.Center, 
                    TextTransparency = 0.5, 
                    Font = v0.font(Enum.Font.SourceSans, "UtilityText"), 
                    TextSize = v0.textSize(24, "UtilityText"), 
                    TextWrapped = v0.UIBloxThemeEnabled, 
                    Text = v338, 
                    ZIndex = 2, 
                    Visible = false, 
                    Parent = v291.SelectorFrame
                });
                if v28 then
                    v339.TextSize = v0.textSize(36);
                end;
                if v337 == v289 then
                    v291.CurrentIndex = v337;
                    v339.Position = UDim2.new(0, v294.Size.X.Offset, 0, 0);
                    v339.Visible = true;
                    v302[v339] = true;
                else
                    v302[v339] = false;
                end;
                v291.Selections[v337] = v339;
            end;
            local v340 = #v291.Selections > 1;
            v294.Visible = v340;
            v295.Visible = v340;
        end;
        local function v343(v341) --[[ Line: 1617 ]] --[[ Name: onVREnabled ]]
            -- upvalues: l_VRService_0 (ref), v294 (copy), v295 (copy), v304 (copy)
            if v341 ~= "VREnabled" then
                return;
            else
                local l_VREnabled_1 = l_VRService_0.VREnabled;
                v294.Selectable = l_VREnabled_1;
                v295.Selectable = l_VREnabled_1;
                v304.Selectable = l_VREnabled_1;
                return;
            end;
        end;
        l_VRService_0.Changed:Connect(v343);
        local l_VREnabled_2 = l_VRService_0.VREnabled;
        v294.Selectable = l_VREnabled_2;
        v295.Selectable = l_VREnabled_2;
        v304.Selectable = l_VREnabled_2;
        v294.InputBegan:Connect(function(v345) --[[ Line: 1629 ]]
            -- upvalues: v318 (copy)
            if v345.UserInputType == Enum.UserInputType.Touch then
                v318(nil, -1);
            end;
        end);
        v294.MouseButton1Click:Connect(function() --[[ Line: 1634 ]]
            -- upvalues: l_UserInputService_0 (ref), v318 (copy)
            if not l_UserInputService_0.TouchEnabled then
                v318(nil, -1);
            end;
        end);
        v295.InputBegan:Connect(function(v346) --[[ Line: 1639 ]]
            -- upvalues: v318 (copy)
            if v346.UserInputType == Enum.UserInputType.Touch then
                v318(nil, 1);
            end;
        end);
        v295.MouseButton1Click:Connect(function() --[[ Line: 1644 ]]
            -- upvalues: l_UserInputService_0 (ref), v318 (copy)
            if not l_UserInputService_0.TouchEnabled then
                v318(nil, 1);
            end;
        end);
        l_VREnabled_2 = true;
        v291:UpdateOptions(v288);
        l_UserInputService_0.InputBegan:Connect(function(v347) --[[ Line: 1653 ]]
            -- upvalues: v293 (ref), l_VREnabled_2 (ref), l_GuiService_0 (ref), v291 (copy), v318 (copy)
            if not v293 then
                return;
            elseif not l_VREnabled_2 then
                return;
            elseif v347.UserInputType ~= Enum.UserInputType.Gamepad1 and v347.UserInputType ~= Enum.UserInputType.Keyboard then
                return;
            elseif l_GuiService_0.SelectedCoreObject ~= v291.SelectorFrame then
                return;
            elseif v347.KeyCode == Enum.KeyCode.DPadLeft or v347.KeyCode == Enum.KeyCode.Left or v347.KeyCode == Enum.KeyCode.A then
                v318(v347, -1);
                return;
            else
                if v347.KeyCode == Enum.KeyCode.DPadRight or v347.KeyCode == Enum.KeyCode.Right or v347.KeyCode == Enum.KeyCode.D then
                    v318(v347, 1);
                end;
                return;
            end;
        end);
        l_UserInputService_0.InputChanged:Connect(function(v348) --[[ Line: 1686 ]]
            -- upvalues: v293 (ref), l_VREnabled_2 (ref), v290 (ref), l_GuiService_0 (ref), v291 (copy), v318 (copy)
            if not v293 then
                return;
            elseif not l_VREnabled_2 then
                v290 = 0;
                return;
            elseif v348.UserInputType ~= Enum.UserInputType.Gamepad1 then
                return;
            else
                local l_SelectedCoreObject_0 = l_GuiService_0.SelectedCoreObject;
                if not l_SelectedCoreObject_0 or not l_SelectedCoreObject_0:IsDescendantOf(v291.SelectorFrame.Parent) then
                    return;
                elseif v348.KeyCode ~= Enum.KeyCode.Thumbstick1 then
                    return;
                elseif v348.Position.X > 0.8 and v348.Delta.X > 0 and v290 ~= 1 then
                    v290 = 1;
                    v318(v348, v290);
                    return;
                elseif v348.Position.X < -0.8 and v348.Delta.X < 0 and v290 ~= -1 then
                    v290 = -1;
                    v318(v348, v290);
                    return;
                else
                    if math.abs(v348.Position.X) < 0.8 then
                        v290 = 0;
                    end;
                    return;
                end;
            end;
        end);
        v291.SelectorFrame.AncestryChanged:Connect(function(_, v351) --[[ Line: 1727 ]]
            -- upvalues: l_VREnabled_2 (ref), v319 (ref), l_GuiService_0 (ref), v291 (copy), v303 (copy), l_VRService_0 (ref)
            l_VREnabled_2 = v351;
            if not l_VREnabled_2 then
                if v319 then
                    v319:Disconnect();
                    return;
                end;
            else
                v319 = l_GuiService_0:GetPropertyChangedSignal("SelectedCoreObject"):Connect(function() --[[ Line: 1500 ]]
                    -- upvalues: v291 (ref), l_GuiService_0 (ref), v303 (ref), l_VRService_0 (ref)
                    if #v291.Selections <= 0 then
                        return;
                    elseif l_GuiService_0.SelectedCoreObject == v291.SelectorFrame then
                        v291.Selections[v291.CurrentIndex].TextTransparency = 0;
                        return;
                    elseif l_GuiService_0.SelectedCoreObject ~= nil and v303[l_GuiService_0.SelectedCoreObject] then
                        if l_VRService_0.VREnabled then
                            v291.Selections[v291.CurrentIndex].TextTransparency = 0;
                            return;
                        else
                            l_GuiService_0.SelectedCoreObject = v291.SelectorFrame;
                            return;
                        end;
                    else
                        v291.Selections[v291.CurrentIndex].TextTransparency = 0.5;
                        return;
                    end;
                end);
            end;
        end);
        local function v357(_, v353) --[[ Line: 1738 ]] --[[ Name: onResized ]]
            -- upvalues: v0 (ref), v28 (ref), v291 (copy)
            local v354 = 0;
            v354 = if v353 then v0.textSize(16) else v28 and v0.textSize(36) or v0.textSize(24, "UtilityText");
            for _, v356 in pairs(v291.Selections) do
                v356.TextSize = v354;
            end;
        end;
        v29[v291.SelectorFrame] = v357;
        local l_v357_0 = v357;
        local v359 = if _G.__TESTEZ_RUNNING_TEST__ then Vector2.new(1024, 1024) else l_GuiService_0:GetHardwareSafeViewport();
        local v360 = if _G.__TESTEZ_RUNNING_TEST__ then Vector2.new(1024, 1024) else l_GuiService_0:GetHardwareSafeViewport();
        l_v357_0(v359, v360.Y > v360.X);
        v319 = l_GuiService_0:GetPropertyChangedSignal("SelectedCoreObject"):Connect(function() --[[ Line: 1500 ]]
            -- upvalues: v291 (copy), l_GuiService_0 (ref), v303 (copy), l_VRService_0 (ref)
            if #v291.Selections <= 0 then
                return;
            elseif l_GuiService_0.SelectedCoreObject == v291.SelectorFrame then
                v291.Selections[v291.CurrentIndex].TextTransparency = 0;
                return;
            elseif l_GuiService_0.SelectedCoreObject ~= nil and v303[l_GuiService_0.SelectedCoreObject] then
                if l_VRService_0.VREnabled then
                    v291.Selections[v291.CurrentIndex].TextTransparency = 0;
                    return;
                else
                    l_GuiService_0.SelectedCoreObject = v291.SelectorFrame;
                    return;
                end;
            else
                v291.Selections[v291.CurrentIndex].TextTransparency = 0.5;
                return;
            end;
        end);
        return v291;
    end;
end;
local function v384(v362, v363, v364, v365, v366) --[[ Line: 1757 ]] --[[ Name: ShowAlert ]]
    -- upvalues: l_CoreGui_0 (copy), l_VRService_0 (copy), l_CorePackages_0 (copy), l_Create_0 (copy), v0 (copy), l_HttpService_0 (copy), l_ContextActionService_0 (copy), l_GuiService_0 (copy), v166 (copy), l_UserInputService_0 (copy)
    local l_RobloxGui_1 = l_CoreGui_0.RobloxGui;
    if l_RobloxGui_1:FindFirstChild("AlertViewFullScreen") then
        return;
    else
        local v368 = nil;
        local function v372(v369) --[[ Line: 1768 ]] --[[ Name: onVREnabled ]]
            -- upvalues: l_VRService_0 (ref), l_CorePackages_0 (ref), l_RobloxGui_1 (ref), l_CoreGui_0 (ref), v368 (ref)
            if v369 ~= "VREnabled" then
                return;
            else
                local _ = nil;
                local v371 = nil;
                if l_VRService_0.VREnabled then
                    v371 = require(l_CorePackages_0.Workspace.Packages.VrCommon).Panel3D.Get("SettingsMenu");
                    l_RobloxGui_1 = v371:GetGUI();
                else
                    l_RobloxGui_1 = l_CoreGui_0.RobloxGui;
                end;
                if v368 and v368.Parent ~= nil then
                    v368.Parent = l_RobloxGui_1;
                    if l_VRService_0.VREnabled then
                        v371:SetSubpanelDepth(v368, 0.5);
                    end;
                end;
                return;
            end;
        end;
        local v373 = l_VRService_0.Changed:Connect(v372);
        v368 = l_Create_0("ImageLabel")({
            Name = "AlertViewBacking", 
            Image = "rbxasset://textures/ui/Settings/MenuBarAssets/MenuButton.png", 
            ScaleType = Enum.ScaleType.Slice, 
            SliceCenter = Rect.new(8, 6, 46, 44), 
            BackgroundTransparency = 1, 
            ImageTransparency = 1, 
            Size = UDim2.new(0, 400, 0, 350), 
            Position = UDim2.new(0.5, -200, 0.5, -175), 
            ZIndex = 9, 
            Parent = l_RobloxGui_1
        });
        v372("VREnabled");
        if v366 or l_VRService_0.VREnabled then
            v368.ImageTransparency = 0;
        else
            v368.Size = UDim2.new(0.8, 0, 0, 350);
            v368.Position = UDim2.new(0.1, 0, 0.1, 0);
        end;
        if l_CoreGui_0.RobloxGui.AbsoluteSize.Y <= v368.Size.Y.Offset then
            v368.Size = UDim2.new(v368.Size.X.Scale, v368.Size.X.Offset, v368.Size.Y.Scale, l_CoreGui_0.RobloxGui.AbsoluteSize.Y);
            v368.Position = UDim2.new(v368.Position.X.Scale, -v368.Size.X.Offset / 2, 0.5, -v368.Size.Y.Offset / 2);
        end;
        if v0.UIBloxThemeEnabled and not v366 then
            l_Create_0("UICorner")({
                CornerRadius = v0.DefaultCornerRadius, 
                Parent = v368
            });
            v368.BackgroundColor3 = v0.color("MenuContainer");
            v368.BackgroundTransparency = v0.transparency("MenuContainer");
        end;
        local _ = l_Create_0("TextLabel")({
            Name = "AlertViewText", 
            BackgroundTransparency = 1, 
            Size = UDim2.new(0.95, 0, 0.6, 0), 
            Position = UDim2.new(0.025, 0, 0.05, 0), 
            Font = v0.font(Enum.Font.SourceSansBold, "Bold"), 
            TextSize = v0.textSize(36), 
            Text = v362, 
            TextWrapped = true, 
            TextColor3 = Color3.fromRGB(255, 255, 255), 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            ZIndex = 10, 
            Parent = v368
        });
        local _ = l_Create_0("ImageLabel")({
            Image = "", 
            BackgroundTransparency = 1
        });
        local v376 = l_HttpService_0:GenerateGUID(false);
        local function v379(_, v378) --[[ Line: 1857 ]]
            -- upvalues: l_VRService_0 (ref), v368 (ref), l_CorePackages_0 (ref), v365 (copy), l_ContextActionService_0 (ref), v376 (copy), l_GuiService_0 (ref), v364 (copy), v373 (copy)
            if l_VRService_0.VREnabled and (v378 == Enum.UserInputState.Begin or v378 == Enum.UserInputState.Cancel) then
                return;
            elseif not v368 then
                return;
            else
                if l_VRService_0.VREnabled then
                    require(l_CorePackages_0.Workspace.Packages.VrCommon).Panel3D.Get("SettingsMenu"):SetSubpanelDepth(v368, 0);
                end;
                v368:Destroy();
                v368 = nil;
                if v365 then
                    v365();
                end;
                l_ContextActionService_0:UnbindCoreAction(v376);
                l_GuiService_0.SelectedCoreObject = nil;
                if v364 then
                    v364:ShowBar();
                end;
                if v373 then
                    v373:Disconnect();
                end;
                return;
            end;
        end;
        local v380 = UDim2.new(1, -20, 0, 60);
        local v381 = UDim2.new(0, 10, 0.65, 0);
        if not v366 then
            v380 = UDim2.new(0, 200, 0, 50);
            v381 = UDim2.new(0.5, -100, 0.65, 0);
        end;
        local v382, v383 = v166("AlertViewButton", v363, v380, v379);
        v382.Position = v381;
        v382.NextSelectionLeft = v382;
        v382.NextSelectionRight = v382;
        v382.NextSelectionUp = v382;
        v382.NextSelectionDown = v382;
        v382.ZIndex = 9;
        v383.ZIndex = v382.ZIndex;
        v382.Parent = v368;
        if not l_VRService_0.VREnabled and (not l_UserInputService_0.TouchEnabled or l_UserInputService_0.GamepadEnabled and true or false) then
            l_GuiService_0.SelectedCoreObject = v382;
        end;
        l_GuiService_0.SelectedCoreObject = v382;
        l_ContextActionService_0:BindCoreAction(v376, v379, false, Enum.KeyCode.Escape, Enum.KeyCode.ButtonB, Enum.KeyCode.ButtonA);
        if v364 and not l_VRService_0.VREnabled then
            v364:HideBar();
            v364.Pages.CurrentPage:Hide(1, 1);
        end;
        return;
    end;
end;
local function v481(v385, v386, v387, v388, v389) --[[ Line: 1925 ]] --[[ Name: CreateNewSlider ]]
    -- upvalues: l_HttpService_0 (copy), v19 (copy), l_Signal_0 (copy), l_Create_0 (copy), v30 (copy), l_RobloxGui_0 (copy), v0 (copy), l_UserInputService_0 (copy), v5 (copy), v4 (copy), v5 (copy), v88 (copy), v2 (copy), v3 (copy), l_VRService_0 (copy), l_GuiService_0 (copy), l_RunService_0 (copy)
    local v390 = {};
    local v391 = tonumber(v385);
    local l_v386_0 = v386;
    local v393 = 0;
    local v394 = nil;
    local v395 = true;
    local v396 = l_HttpService_0:GenerateGUID(false);
    v385 = "";
    v386 = "";
    if v391 <= 0 then
        error("CreateNewSlider failed because numOfSteps (first arg) is 0 or negative, please supply a positive integer", 2);
        return;
    else
        local v397 = v388 or v389;
        local l_BindableEvent_3 = Instance.new("BindableEvent");
        l_BindableEvent_3.Name = "ValueChanged";
        local v399 = nil;
        if v19 then
            v399 = l_Signal_0.new();
        end;
        v390.SliderFrame = l_Create_0("ImageButton")({
            Name = "Slider", 
            Image = "", 
            AutoButtonColor = false, 
            NextSelectionLeft = v390.SliderFrame, 
            NextSelectionRight = v390.SliderFrame, 
            BackgroundTransparency = 1, 
            Size = UDim2.new(0.6, 0, 0, 50), 
            AutomaticSize = if v397 then Enum.AutomaticSize.Y else nil, 
            Position = UDim2.new(1, 0, 0.5, 0), 
            AnchorPoint = Vector2.new(1, 0.5), 
            SelectionImageObject = v30, 
            ZIndex = 2
        });
        local v400 = nil;
        if v397 then
            v400 = l_Create_0("Frame")({
                Name = "StepsAndButtonsContainer", 
                Size = UDim2.new(1, 0, 0, 50), 
                BackgroundTransparency = 1, 
                LayoutOrder = 1, 
                Parent = v390.SliderFrame
            });
            l_Create_0("UIListLayout")({
                Name = "UIListLayout", 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Parent = v390.SliderFrame
            });
            local v401 = l_Create_0("Frame")({
                Name = "SliderLabels", 
                Size = UDim2.new(1, 0, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1, 
                Parent = v390.SliderFrame, 
                LayoutOrder = 2
            });
            l_Create_0("UIPadding")({
                Name = "UIPadding", 
                PaddingRight = UDim.new(0, 50), 
                PaddingLeft = UDim.new(0, 50), 
                Parent = v401
            });
            local function _() --[[ Line: 2010 ]] --[[ Name: isWideEnough ]]
                -- upvalues: l_RobloxGui_0 (ref)
                return l_RobloxGui_0.AbsoluteSize.X > 460;
            end;
            if v388 then
                v390.LeftLabel = l_Create_0("TextLabel")({
                    Name = "LeftLabel", 
                    Text = v388, 
                    Font = v0.font(Enum.Font.SourceSans, "UtilityRow"), 
                    TextSize = v0.textSize(18, "UtilityRow"), 
                    TextColor3 = Color3.fromRGB(255, 255, 255), 
                    TextTransparency = 0.25, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextWrapped = true, 
                    BackgroundTransparency = 1, 
                    Size = UDim2.fromScale(1, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    Parent = v401, 
                    Visible = l_RobloxGui_0.AbsoluteSize.X > 460
                });
            end;
            if v389 then
                v390.RightLabel = l_Create_0("TextLabel")({
                    Name = "RightLabel", 
                    Text = v389, 
                    Font = v0.font(Enum.Font.SourceSans, "UtilityRow"), 
                    TextSize = v0.textSize(18, "UtilityRow"), 
                    TextColor3 = Color3.fromRGB(255, 255, 255), 
                    TextTransparency = 0.25, 
                    TextXAlignment = Enum.TextXAlignment.Right, 
                    TextWrapped = true, 
                    BackgroundTransparency = 1, 
                    Size = UDim2.fromScale(1, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    Parent = v401, 
                    Visible = l_RobloxGui_0.AbsoluteSize.X > 460
                });
            end;
            l_RobloxGui_0:GetPropertyChangedSignal("AbsoluteSize"):connect(function() --[[ Line: 2049 ]]
                -- upvalues: v390 (copy), l_RobloxGui_0 (ref)
                if v390.LeftLabel then
                    v390.LeftLabel.Visible = l_RobloxGui_0.AbsoluteSize.X > 460;
                end;
                if v390.RightLabel then
                    v390.RightLabel.Visible = l_RobloxGui_0.AbsoluteSize.X > 460;
                end;
            end);
        end;
        v390.StepsContainer = l_Create_0("Frame")({
            Name = "StepsContainer", 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            Size = UDim2.new(1, -100, 1, 0), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundTransparency = 1, 
            Parent = if v397 then v400 else v390.SliderFrame
        });
        local v403 = l_Create_0("ImageButton")({
            Name = "LeftButton", 
            BackgroundTransparency = 1, 
            AnchorPoint = Vector2.new(0, 0.5), 
            Position = UDim2.new(0, 0, 0.5, 0), 
            Size = UDim2.new(0, v0.SelectorArrowButtonWidth, 0, 50), 
            Image = "", 
            ZIndex = 3, 
            Selectable = false, 
            SelectionImageObject = v30, 
            Active = true, 
            Parent = if v397 then v400 else v390.SliderFrame
        });
        local v404 = l_Create_0("ImageButton")({
            Name = "RightButton", 
            BackgroundTransparency = 1, 
            AnchorPoint = Vector2.new(1, 0.5), 
            Position = UDim2.new(1, 0, 0.5, 0), 
            Size = UDim2.new(0, v0.SelectorArrowButtonWidth, 0, 50), 
            Image = "", 
            ZIndex = 3, 
            Selectable = false, 
            SelectionImageObject = v30, 
            Active = true, 
            Parent = if v397 then v400 else v390.SliderFrame
        });
        local v405 = l_Create_0("ImageLabel")({
            Name = "LeftButton", 
            BackgroundTransparency = 1, 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            Size = UDim2.new(0, 30, 0, 30), 
            Image = "rbxasset://textures/ui/Settings/Slider/Less.png", 
            ZIndex = 4, 
            Parent = v403, 
            ImageColor3 = l_UserInputService_0.TouchEnabled and v5 or v4
        });
        local v406 = l_Create_0("ImageLabel")({
            Name = "RightButton", 
            BackgroundTransparency = 1, 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            Size = UDim2.new(0, 30, 0, 30), 
            Image = "rbxasset://textures/ui/Settings/Slider/More.png", 
            ZIndex = 4, 
            Parent = v404, 
            ImageColor3 = l_UserInputService_0.TouchEnabled and v5 or v4
        });
        if not l_UserInputService_0.TouchEnabled then
            local function v408(v407) --[[ Line: 2120 ]]
                -- upvalues: v4 (ref)
                v407.ImageColor3 = v4;
            end;
            local function v410(v409) --[[ Line: 2122 ]]
                -- upvalues: v5 (ref)
                v409.ImageColor3 = v5;
            end;
            v88(v403, v405, v408, v410);
            v88(v404, v406, v408, v410);
        end;
        v390.Steps = {};
        local v411 = 1 / v391;
        for v412 = 1, v391 do
            local v413 = l_Create_0("ImageButton")({
                Name = "Step" .. tostring(v412), 
                BackgroundColor3 = v2, 
                BackgroundTransparency = v0.UIBloxThemeEnabled and 0 or 0.36, 
                BorderSizePixel = 0, 
                AutoButtonColor = false, 
                Active = false, 
                AnchorPoint = Vector2.new(0, 0.5), 
                Position = UDim2.new((v412 - 1) * v411, 2, 0.5, 0), 
                Size = if v0.UIBloxThemeEnabled then UDim2.new(v411, -4, 0, 24) else UDim2.new(v411, -4, 0.48, 0), 
                Image = "", 
                ZIndex = 3, 
                Selectable = false, 
                ImageTransparency = 0.36, 
                Parent = v390.StepsContainer, 
                SelectionImageObject = v30
            });
            if l_v386_0 < v412 then
                v413.BackgroundColor3 = v3;
            end;
            if v412 == 1 or v412 == v391 then
                if v0.UIBloxThemeEnabled then
                    l_Create_0("UICorner")({
                        CornerRadius = v0.DefaultCornerRadius, 
                        Parent = v413
                    });
                    l_Create_0("Frame")({
                        Name = "Filler", 
                        BackgroundColor3 = v413.BackgroundColor3, 
                        Parent = v413, 
                        Size = UDim2.new(0.25, 0, 1, 0), 
                        BorderSizePixel = 0, 
                        Position = if v412 == 1 then UDim2.new(0.75, 0, 0, 0) else UDim2.new(0, 0, 0, 0)
                    });
                else
                    v413.BackgroundTransparency = 1;
                    v413.ScaleType = Enum.ScaleType.Slice;
                    v413.SliceCenter = Rect.new(3, 3, 32, 21);
                    if v412 <= l_v386_0 then
                        if v412 == 1 then
                            v413.Image = "rbxasset://textures/ui/Settings/Slider/SelectedBarLeft.png";
                        else
                            v413.Image = "rbxasset://textures/ui/Settings/Slider/SelectedBarRight.png";
                        end;
                    elseif v412 == 1 then
                        v413.Image = "rbxasset://textures/ui/Settings/Slider/BarLeft.png";
                    else
                        v413.Image = "rbxasset://textures/ui/Settings/Slider/BarRight.png";
                    end;
                end;
            end;
            v390.Steps[#v390.Steps + 1] = v413;
        end;
        local function v415() --[[ Line: 2198 ]] --[[ Name: hideSelection ]]
            -- upvalues: v391 (copy), v390 (copy), v3 (ref), v0 (ref)
            for v414 = 1, v391 do
                v390.Steps[v414].BackgroundColor3 = v3;
                if v0.UIBloxThemeEnabled then
                    if v414 == 1 or v414 == v391 then
                        v390.Steps[v414].Filler.BackgroundColor3 = v3;
                    end;
                elseif v414 == 1 then
                    v390.Steps[v414].Image = "rbxasset://textures/ui/Settings/Slider/BarLeft.png";
                elseif v414 == v391 then
                    v390.Steps[v414].Image = "rbxasset://textures/ui/Settings/Slider/BarRight.png";
                end;
            end;
        end;
        local function v417() --[[ Line: 2214 ]] --[[ Name: showSelection ]]
            -- upvalues: v391 (copy), l_v386_0 (ref), v390 (copy), v2 (ref), v0 (ref)
            for v416 = 1, v391 do
                if l_v386_0 >= v416 then
                    v390.Steps[v416].BackgroundColor3 = v2;
                    if v0.UIBloxThemeEnabled then
                        if v416 == 1 or v416 == v391 then
                            v390.Steps[v416].Filler.BackgroundColor3 = v2;
                        end;
                    elseif v416 == 1 then
                        v390.Steps[v416].Image = "rbxasset://textures/ui/Settings/Slider/SelectedBarLeft.png";
                    elseif v416 == v391 then
                        v390.Steps[v416].Image = "rbxasset://textures/ui/Settings/Slider/SelectedBarRight.png";
                    end;
                else
                    break;
                end;
            end;
        end;
        local function v420(v418) --[[ Line: 2234 ]] --[[ Name: modifySelection ]]
            -- upvalues: v0 (ref), v391 (copy), v390 (copy)
            if not v0.UIBloxThemeEnabled then
                for v419 = 1, v391 do
                    if v419 == 1 or v419 == v391 then
                        v390.Steps[v419].ImageTransparency = v418;
                    else
                        v390.Steps[v419].BackgroundTransparency = v418;
                    end;
                end;
            end;
        end;
        local function v422(v421) --[[ Line: 2246 ]] --[[ Name: setCurrentStep ]]
            -- upvalues: v387 (ref), v403 (copy), v404 (copy), v391 (copy), l_v386_0 (ref), v415 (copy), v417 (copy), v394 (ref), v399 (ref), l_BindableEvent_3 (copy)
            if not v387 then
                v387 = 0;
            end;
            v403.Visible = true;
            v404.Visible = true;
            if v421 <= v387 then
                v421 = v387;
                v403.Visible = false;
            end;
            if v391 <= v421 then
                v421 = v391;
                v404.Visible = false;
            end;
            if l_v386_0 == v421 then
                return;
            else
                l_v386_0 = v421;
                v415();
                v417();
                v394 = tick();
                if v399 then
                    v399:fire(l_v386_0);
                    return;
                else
                    l_BindableEvent_3:Fire(l_v386_0);
                    return;
                end;
            end;
        end;
        local function _(v423) --[[ Line: 2280 ]] --[[ Name: isActivateEvent ]]
            if not v423 then
                return false;
            else
                local v424 = true;
                if v423.UserInputType ~= Enum.UserInputType.MouseButton1 then
                    v424 = true;
                    if v423.UserInputType ~= Enum.UserInputType.Touch then
                        v424 = false;
                        if v423.UserInputType == Enum.UserInputType.Gamepad1 then
                            v424 = v423.KeyCode == Enum.KeyCode.ButtonA;
                        end;
                    end;
                end;
                return v424;
            end;
        end;
        local function v439(v426, v427, v428) --[[ Line: 2291 ]] --[[ Name: mouseDownFunc ]]
            -- upvalues: v395 (ref), l_VRService_0 (ref), l_UserInputService_0 (ref), l_GuiService_0 (ref), v390 (copy), v393 (ref), l_v386_0 (ref), v391 (copy), v422 (copy)
            if not v395 then
                return;
            elseif v426 == nil then
                return;
            elseif not (not not v426 and (v426.UserInputType == Enum.UserInputType.MouseButton1 or v426.UserInputType == Enum.UserInputType.Touch or v426.UserInputType == Enum.UserInputType.Gamepad1 and v426.KeyCode == Enum.KeyCode.ButtonA)) then
                return;
            else
                if not l_VRService_0.VREnabled and (not l_UserInputService_0.TouchEnabled or l_UserInputService_0.GamepadEnabled and true or false) and not l_VRService_0.VREnabled then
                    l_GuiService_0.SelectedCoreObject = v390.SliderFrame;
                end;
                if not l_VRService_0.VREnabled then
                    if v428 then
                        v393 = v427 - l_v386_0;
                    else
                        v393 = 0;
                        local v429 = nil;
                        local v430 = nil;
                        v429 = l_UserInputService_0.InputChanged:Connect(function(v431) --[[ Line: 2317 ]]
                            -- upvalues: v391 (ref), v390 (ref), v422 (ref)
                            if v431.UserInputType ~= Enum.UserInputType.MouseMovement then
                                return;
                            else
                                local l_X_0 = v431.Position.X;
                                for v433 = 1, v391 do
                                    local l_X_1 = v390.Steps[v433].AbsolutePosition.X;
                                    local l_X_2 = v390.Steps[v433].AbsoluteSize.X;
                                    if l_X_1 <= l_X_0 and l_X_0 <= l_X_1 + l_X_2 then
                                        v422(v433);
                                        return;
                                    elseif v433 == 1 and l_X_0 < l_X_1 then
                                        v422(0);
                                        return;
                                    elseif v433 == v391 and l_X_1 <= l_X_0 then
                                        v422(v433);
                                        return;
                                    end;
                                end;
                                return;
                            end;
                        end);
                        do
                            local l_v429_0, l_v430_0 = v429, v430;
                            l_v430_0 = l_UserInputService_0.InputEnded:Connect(function(v438) --[[ Line: 2338 ]]
                                -- upvalues: v393 (ref), l_v430_0 (ref), l_v429_0 (ref)
                                if not (not not v438 and (v438.UserInputType == Enum.UserInputType.MouseButton1 or v438.UserInputType == Enum.UserInputType.Touch or v438.UserInputType == Enum.UserInputType.Gamepad1 and v438.KeyCode == Enum.KeyCode.ButtonA)) then
                                    return;
                                else
                                    v393 = 0;
                                    l_v430_0:Disconnect();
                                    l_v429_0:Disconnect();
                                    return;
                                end;
                            end);
                        end;
                    end;
                else
                    v393 = 0;
                end;
                v422(v427);
                return;
            end;
        end;
        local function _(v440) --[[ Line: 2355 ]] --[[ Name: mouseUpFunc ]]
            -- upvalues: v395 (ref), v393 (ref)
            if not v395 then
                return;
            elseif not (not not v440 and (v440.UserInputType == Enum.UserInputType.MouseButton1 or v440.UserInputType == Enum.UserInputType.Touch or v440.UserInputType == Enum.UserInputType.Gamepad1 and v440.KeyCode == Enum.KeyCode.ButtonA)) then
                return;
            else
                v393 = 0;
                return;
            end;
        end;
        v390.ValueChanged = l_BindableEvent_3.Event;
        if v399 then
            v390.ValueChanged = v399;
        end;
        v390.SetValue = function(_, v443) --[[ Line: 2372 ]] --[[ Name: SetValue ]]
            -- upvalues: v422 (copy)
            v422(v443);
        end;
        v390.GetValue = function(_) --[[ Line: 2376 ]] --[[ Name: GetValue ]]
            -- upvalues: l_v386_0 (ref)
            return l_v386_0;
        end;
        v390.SetInteractable = function(_, v446) --[[ Line: 2380 ]] --[[ Name: SetInteractable ]]
            -- upvalues: v393 (ref), v395 (ref), v390 (copy), v415 (copy), v417 (copy)
            v393 = 0;
            v395 = v446;
            v390.SliderFrame.Selectable = v446;
            if not v395 then
                v415();
                return;
            else
                v417();
                return;
            end;
        end;
        v390.SetZIndex = function(_, v448) --[[ Line: 2391 ]] --[[ Name: SetZIndex ]]
            -- upvalues: v403 (copy), v404 (copy), v405 (copy), v406 (copy), v390 (copy)
            v403.ZIndex = v448;
            v404.ZIndex = v448;
            v405.ZIndex = v448;
            v406.ZIndex = v448;
            for v449 = 1, #v390.Steps do
                v390.Steps[v449].ZIndex = v448;
            end;
        end;
        v390.SetMinStep = function(_, v451) --[[ Line: 2402 ]] --[[ Name: SetMinStep ]]
            -- upvalues: v391 (copy), v387 (ref), l_v386_0 (ref), v403 (copy), v404 (copy)
            if v451 >= 0 and v451 <= v391 then
                v387 = v451;
            end;
            if l_v386_0 <= v387 then
                l_v386_0 = v387;
                v403.Visible = false;
            end;
            if v391 <= l_v386_0 then
                l_v386_0 = v391;
                v404.Visible = false;
            end;
        end;
        v403.InputBegan:Connect(function(v452) --[[ Line: 2419 ]]
            -- upvalues: v439 (copy), l_v386_0 (ref)
            v439(v452, l_v386_0 - 1, true);
        end);
        v403.InputEnded:Connect(function(v453) --[[ Line: 2422 ]]
            -- upvalues: v395 (ref), v393 (ref)
            if not v395 then
                return;
            elseif not (not not v453 and (v453.UserInputType == Enum.UserInputType.MouseButton1 or v453.UserInputType == Enum.UserInputType.Touch or v453.UserInputType == Enum.UserInputType.Gamepad1 and v453.KeyCode == Enum.KeyCode.ButtonA)) then
                return;
            else
                v393 = 0;
                return;
            end;
        end);
        v404.InputBegan:Connect(function(v454) --[[ Line: 2425 ]]
            -- upvalues: v439 (copy), l_v386_0 (ref)
            v439(v454, l_v386_0 + 1, true);
        end);
        v404.InputEnded:Connect(function(v455) --[[ Line: 2428 ]]
            -- upvalues: v395 (ref), v393 (ref)
            if not v395 then
                return;
            elseif not (not not v455 and (v455.UserInputType == Enum.UserInputType.MouseButton1 or v455.UserInputType == Enum.UserInputType.Touch or v455.UserInputType == Enum.UserInputType.Gamepad1 and v455.KeyCode == Enum.KeyCode.ButtonA)) then
                return;
            else
                v393 = 0;
                return;
            end;
        end);
        local function v459(v456) --[[ Line: 2432 ]] --[[ Name: onVREnabled ]]
            -- upvalues: l_VRService_0 (ref), v403 (copy), v395 (ref), v404 (copy), v390 (copy), v391 (copy)
            if v456 ~= "VREnabled" then
                return;
            elseif l_VRService_0.VREnabled then
                v403.Selectable = v395;
                v404.Selectable = v395;
                v390.SliderFrame.Selectable = v395;
                for v457 = 1, v391 do
                    v390.Steps[v457].Selectable = v395;
                    v390.Steps[v457].Active = v395;
                end;
                return;
            else
                v403.Selectable = false;
                v404.Selectable = false;
                v390.SliderFrame.Selectable = v395;
                for v458 = 1, v391 do
                    v390.Steps[v458].Selectable = false;
                    v390.Steps[v458].Active = false;
                end;
                return;
            end;
        end;
        l_VRService_0.Changed:Connect(v459);
        v459("VREnabled");
        for v460 = 1, v391 do
            v390.Steps[v460].InputBegan:Connect(function(v461) --[[ Line: 2459 ]]
                -- upvalues: v439 (copy), v460 (copy)
                v439(v461, v460);
            end);
            v390.Steps[v460].InputEnded:Connect(function(v462) --[[ Line: 2462 ]]
                -- upvalues: v395 (ref), v393 (ref)
                if not v395 then
                    return;
                elseif not (not not v462 and (v462.UserInputType == Enum.UserInputType.MouseButton1 or v462.UserInputType == Enum.UserInputType.Touch or v462.UserInputType == Enum.UserInputType.Gamepad1 and v462.KeyCode == Enum.KeyCode.ButtonA)) then
                    return;
                else
                    v393 = 0;
                    return;
                end;
            end);
        end;
        v390.SliderFrame.InputBegan:Connect(function(v463) --[[ Line: 2467 ]]
            -- upvalues: l_VRService_0 (ref), l_GuiService_0 (ref), v390 (copy), v439 (copy), l_v386_0 (ref)
            if l_VRService_0.VREnabled then
                local l_SelectedCoreObject_1 = l_GuiService_0.SelectedCoreObject;
                if not l_SelectedCoreObject_1 or not l_SelectedCoreObject_1:IsDescendantOf(v390.SliderFrame.Parent) then
                    return;
                end;
            end;
            v439(v463, l_v386_0);
        end);
        v390.SliderFrame.InputEnded:Connect(function(v465) --[[ Line: 2476 ]]
            -- upvalues: l_VRService_0 (ref), l_GuiService_0 (ref), v390 (copy), v395 (ref), v393 (ref)
            if l_VRService_0.VREnabled then
                local l_SelectedCoreObject_2 = l_GuiService_0.SelectedCoreObject;
                if not l_SelectedCoreObject_2 or not l_SelectedCoreObject_2:IsDescendantOf(v390.SliderFrame.Parent) then
                    return;
                end;
            end;
            if not v395 then
                return;
            elseif not (not not v465 and (v465.UserInputType == Enum.UserInputType.MouseButton1 or v465.UserInputType == Enum.UserInputType.Touch or v465.UserInputType == Enum.UserInputType.Gamepad1 and v465.KeyCode == Enum.KeyCode.ButtonA)) then
                return;
            else
                v393 = 0;
                return;
            end;
        end);
        local function v467() --[[ Line: 2486 ]]
            -- upvalues: v394 (ref), v422 (copy), l_v386_0 (ref), v393 (ref)
            if v394 == nil then
                return;
            else
                if tick() - v394 >= 0.2 then
                    v422(l_v386_0 + v393);
                end;
                return;
            end;
        end;
        local v468 = true;
        local v469 = {
            [Enum.KeyCode.Thumbstick1] = true, 
            [Enum.KeyCode.DPadLeft] = -1, 
            [Enum.KeyCode.DPadRight] = 1, 
            [Enum.KeyCode.Left] = -1, 
            [Enum.KeyCode.Right] = 1, 
            [Enum.KeyCode.A] = -1, 
            [Enum.KeyCode.D] = 1, 
            [Enum.KeyCode.ButtonA] = true
        };
        l_UserInputService_0.InputBegan:Connect(function(v470) --[[ Line: 2512 ]]
            -- upvalues: v395 (ref), v468 (ref), l_GuiService_0 (ref), v390 (copy), v469 (copy), v393 (ref), v422 (copy), l_v386_0 (ref)
            if not v395 then
                return;
            elseif not v468 then
                return;
            elseif v470.UserInputType ~= Enum.UserInputType.Gamepad1 and v470.UserInputType ~= Enum.UserInputType.Keyboard then
                return;
            else
                local l_SelectedCoreObject_3 = l_GuiService_0.SelectedCoreObject;
                if not l_SelectedCoreObject_3 or not l_SelectedCoreObject_3:IsDescendantOf(v390.SliderFrame.Parent) then
                    return;
                elseif v469[v470.KeyCode] == -1 then
                    v393 = -1;
                    v422(l_v386_0 - 1);
                    return;
                else
                    if v469[v470.KeyCode] == 1 then
                        v393 = 1;
                        v422(l_v386_0 + 1);
                    end;
                    return;
                end;
            end;
        end);
        l_UserInputService_0.InputEnded:Connect(function(v472) --[[ Line: 2540 ]]
            -- upvalues: v395 (ref), l_GuiService_0 (ref), v390 (copy), v469 (copy), v393 (ref)
            if not v395 then
                return;
            elseif v472.UserInputType ~= Enum.UserInputType.Gamepad1 and v472.UserInputType ~= Enum.UserInputType.Keyboard then
                return;
            else
                local l_SelectedCoreObject_4 = l_GuiService_0.SelectedCoreObject;
                if not l_SelectedCoreObject_4 or not l_SelectedCoreObject_4:IsDescendantOf(v390.SliderFrame.Parent) then
                    return;
                else
                    if v469[v472.KeyCode] then
                        v393 = 0;
                    end;
                    return;
                end;
            end;
        end);
        l_UserInputService_0.InputChanged:Connect(function(v474) --[[ Line: 2561 ]]
            -- upvalues: v395 (ref), v393 (ref), v468 (ref), l_GuiService_0 (ref), v390 (copy), v422 (copy), l_v386_0 (ref)
            if not v395 then
                v393 = 0;
                return;
            elseif not v468 then
                v393 = 0;
                return;
            elseif v474.UserInputType ~= Enum.UserInputType.Gamepad1 then
                return;
            else
                local l_SelectedCoreObject_5 = l_GuiService_0.SelectedCoreObject;
                if not l_SelectedCoreObject_5 or not l_SelectedCoreObject_5:IsDescendantOf(v390.SliderFrame.Parent) then
                    return;
                elseif v474.KeyCode ~= Enum.KeyCode.Thumbstick1 then
                    return;
                elseif v474.Position.X > 0.8 and v474.Delta.X > 0 and v393 ~= 1 then
                    v393 = 1;
                    v422(l_v386_0 + 1);
                    return;
                elseif v474.Position.X < -0.8 and v474.Delta.X < 0 and v393 ~= -1 then
                    v393 = -1;
                    v422(l_v386_0 - 1);
                    return;
                else
                    if math.abs(v474.Position.X) < 0.8 then
                        v393 = 0;
                    end;
                    return;
                end;
            end;
        end);
        local v476 = false;
        l_GuiService_0.Changed:Connect(function(v477) --[[ Line: 2602 ]]
            -- upvalues: l_GuiService_0 (ref), v390 (copy), v420 (copy), v476 (ref), v394 (ref), l_RunService_0 (ref), v396 (copy), v467 (copy)
            if v477 ~= "SelectedCoreObject" then
                return;
            else
                local l_SelectedCoreObject_6 = l_GuiService_0.SelectedCoreObject;
                if l_SelectedCoreObject_6 and l_SelectedCoreObject_6:IsDescendantOf(v390.SliderFrame.Parent) then
                    v420(0);
                    if not v476 then
                        v476 = true;
                        v394 = tick();
                        l_RunService_0:BindToRenderStep(v396, Enum.RenderPriority.Input.Value + 1, v467);
                        return;
                    end;
                else
                    v420(0.36);
                    if v476 then
                        v476 = false;
                        l_RunService_0:UnbindFromRenderStep(v396);
                    end;
                end;
                return;
            end;
        end);
        v390.SliderFrame.AncestryChanged:Connect(function(_, v480) --[[ Line: 2625 ]]
            -- upvalues: v468 (ref)
            v468 = v480;
        end);
        v422(l_v386_0);
        return v390;
    end;
end;
local v482 = 50;
if v28 then
    v482 = 90;
end;
local v483 = {};
local function v536(v484, v485, v486, v487, v488, v489, v490, v491, v492) --[[ Line: 2640 ]] --[[ Name: AddNewRow ]]
    -- upvalues: v483 (copy), l_Create_0 (copy), v482 (ref), v30 (copy), v0 (copy), v28 (copy), l_GuiService_0 (copy), v29 (copy), v481 (copy), v361 (copy), v287 (copy), l_VRService_0 (copy), l_UserInputService_0 (copy), l_CoreGui_0 (copy)
    local v493 = 0;
    local v494 = v486 ~= "TextBox";
    if v483[v484] then
        v493 = v483[v484];
    end;
    local v495 = nil;
    v495 = l_Create_0("ImageButton")({
        Name = v485 .. "Frame", 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        Image = "rbxasset://textures/ui/VR/rectBackgroundWhite.png", 
        ScaleType = Enum.ScaleType.Slice, 
        SliceCenter = Rect.new(2, 2, 18, 18), 
        ImageTransparency = 1, 
        Active = false, 
        AutoButtonColor = false, 
        Size = UDim2.new(1, 0, 0, v482), 
        AutomaticSize = if not not v490 or v491 or v492 then Enum.AutomaticSize.Y else nil, 
        Position = UDim2.new(0, 0, 0, v493), 
        ZIndex = 2, 
        Selectable = false, 
        SelectionImageObject = v30, 
        Parent = v484.Page
    });
    if v0.UIBloxThemeEnabled then
        v495.BackgroundColor3 = v0.color("RowFrameBackground");
        l_Create_0("UICorner")({
            CornerRadius = v0.DefaultCornerRadius, 
            Parent = v495
        });
    end;
    v495.ImageColor3 = v495.BackgroundColor3;
    if v495 and v489 then
        v495.Position = UDim2.new(v495.Position.X.Scale, v495.Position.X.Offset, v495.Position.Y.Scale, v495.Position.Y.Offset + v489);
    end;
    local v496 = nil;
    local v497 = nil;
    if v490 then
        v496 = l_Create_0("Frame")({
            Name = v485 .. "RowLabelAndDescriptionFrame", 
            BackgroundTransparency = 1, 
            Position = UDim2.new(0, 10, 0, 0), 
            Size = UDim2.new(0.4, -20, 0, 50), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Parent = v495
        });
        v497 = l_Create_0("TextLabel")({
            Name = v485 .. "Label", 
            Text = v485, 
            Font = v0.font(Enum.Font.SourceSansBold, "UtilityRow"), 
            TextSize = v0.textSize(16, "UtilityRow"), 
            TextColor3 = Color3.fromRGB(255, 255, 255), 
            TextXAlignment = Enum.TextXAlignment.Left, 
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(1, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            TextWrapped = true, 
            ZIndex = 2, 
            Parent = v496, 
            LayoutOrder = 1
        });
        l_Create_0("TextLabel")({
            Name = v485 .. "Description", 
            Text = v490, 
            Font = v0.font(Enum.Font.SourceSans, "UtilityRow"), 
            TextSize = v0.textSize(18, "UtilityRow"), 
            TextColor3 = Color3.fromRGB(255, 255, 255), 
            TextTransparency = 0.25, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextWrapped = true, 
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(1, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            ZIndex = 2, 
            Parent = v496, 
            LayoutOrder = 2
        });
        l_Create_0("UIListLayout")({
            Name = v485 .. "UIListLayout", 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 8), 
            Parent = v496
        });
        l_Create_0("UIPadding")({
            Name = v485 .. "UIListLayout", 
            PaddingBottom = UDim.new(0, 10), 
            PaddingTop = UDim.new(0, 10), 
            Parent = v496
        });
    else
        v497 = l_Create_0("TextLabel")({
            Name = v485 .. "Label", 
            Text = v485, 
            Font = v0.font(Enum.Font.SourceSansBold, "UtilityRow"), 
            TextSize = v0.textSize(16, "UtilityRow"), 
            TextColor3 = Color3.fromRGB(255, 255, 255), 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextWrapped = true, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            Size = UDim2.new(0.4, -20, 1, 0), 
            Position = UDim2.new(0, 10, 0, 0), 
            ZIndex = 2, 
            Parent = v495
        });
        l_Create_0("UIPadding")({
            Name = v485 .. "UIPadding", 
            PaddingBottom = UDim.new(0, 10), 
            PaddingTop = UDim.new(0, 10), 
            Parent = v497
        });
    end;
    if not v494 then
        v497.Text = "";
    end;
    local function v500(_, v499) --[[ Line: 2775 ]] --[[ Name: onResized ]]
        -- upvalues: v497 (ref), v0 (ref), v28 (ref)
        if v499 then
            v497.TextSize = v0.textSize(16, "UtilityRow");
            return;
        else
            v497.TextSize = v28 and v0.textSize(36) or v0.textSize(24, "UtilityText");
            return;
        end;
    end;
    local v501 = if _G.__TESTEZ_RUNNING_TEST__ then Vector2.new(1024, 1024) else l_GuiService_0:GetHardwareSafeViewport();
    local v502 = if _G.__TESTEZ_RUNNING_TEST__ then Vector2.new(1024, 1024) else l_GuiService_0:GetHardwareSafeViewport();
    if v502.Y > v502.X then
        v502 = v0.textSize(16, "UtilityRow");
        v497.TextSize = v502;
    else
        v502 = v28 and v0.textSize(36) or v0.textSize(24, "UtilityText");
        v497.TextSize = v502;
    end;
    v29[v495] = v500;
    local l_v500_0 = v500;
    v502 = if _G.__TESTEZ_RUNNING_TEST__ then Vector2.new(1024, 1024) else l_GuiService_0:GetHardwareSafeViewport();
    local v504 = if _G.__TESTEZ_RUNNING_TEST__ then Vector2.new(1024, 1024) else l_GuiService_0:GetHardwareSafeViewport();
    l_v500_0(v502, v504.Y > v504.X);
    v501 = nil;
    l_v500_0 = nil;
    if v486 == "Slider" then
        l_v500_0 = v481(v487, v488, nil, v491, v492);
        l_v500_0.SliderFrame.Parent = v495;
        v501 = l_v500_0.SliderFrame;
    elseif v486 == "Selector" then
        l_v500_0 = v361(v487, v488);
        l_v500_0.SelectorFrame.Parent = v495;
        v501 = l_v500_0.SelectorFrame;
    elseif v486 == "DropDown" then
        l_v500_0 = v287(v487, v488, v484.HubRef);
        l_v500_0.DropDownFrame.Parent = v495;
        v501 = l_v500_0.DropDownFrame;
    elseif v486 == "TextBox" then
        v502 = l_Create_0("ImageLabel")({
            Image = "", 
            BackgroundTransparency = 1
        });
        l_v500_0 = {
            HubRef = nil
        };
        local v505 = l_Create_0("TextBox")({
            AnchorPoint = Vector2.new(1, 0.5), 
            Size = UDim2.new(0.6, 0, 1, 0), 
            Position = UDim2.new(1, 0, 0.5, 0), 
            Text = v485, 
            TextColor3 = Color3.fromRGB(49, 49, 49), 
            BackgroundTransparency = v0.transparency("ControlInputBackground", 0.5), 
            BorderSizePixel = 0, 
            TextYAlignment = Enum.TextYAlignment.Top, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextWrapped = true, 
            Font = v0.font(Enum.Font.SourceSans, "UtilityText"), 
            TextSize = v0.textSize(24, "UtilityText"), 
            ZIndex = 2, 
            SelectionImageObject = v502, 
            ClearTextOnFocus = false, 
            Parent = v495
        });
        v501 = v505;
        local l_v505_0 = v505 --[[ copy: 18 -> 24 ]];
        v505.Focused:Connect(function() --[[ Line: 2828 ]]
            -- upvalues: l_VRService_0 (ref), l_UserInputService_0 (ref), l_GuiService_0 (ref), l_v505_0 (copy), v485 (copy)
            if not l_VRService_0.VREnabled and (not l_UserInputService_0.TouchEnabled or l_UserInputService_0.GamepadEnabled and true or false) then
                l_GuiService_0.SelectedCoreObject = l_v505_0;
            end;
            if l_v505_0.Text == v485 then
                l_v505_0.Text = "";
            end;
        end);
        if v489 then
            v505.Position = UDim2.new(v505.Position.X.Scale, v505.Position.X.Offset, v505.Position.Y.Scale, v505.Position.Y.Offset + v489);
        end;
        local l_v505_1 = v505 --[[ copy: 18 -> 25 ]];
        v501.SelectionGained:Connect(function() --[[ Line: 2846 ]]
            -- upvalues: l_VRService_0 (ref), l_UserInputService_0 (ref), l_v505_1 (copy), v0 (ref), l_v500_0 (ref), v501 (ref)
            if not l_VRService_0.VREnabled and (not l_UserInputService_0.TouchEnabled or l_UserInputService_0.GamepadEnabled and true or false) then
                l_v505_1.BackgroundTransparency = v0.transparency("ControlInputBackground", 0.1);
                if l_v500_0.HubRef then
                    l_v500_0.HubRef:ScrollToFrame(v501);
                end;
            end;
        end);
        v501.SelectionLost:Connect(function() --[[ Line: 2855 ]]
            -- upvalues: l_VRService_0 (ref), l_UserInputService_0 (ref), l_v505_1 (copy), v0 (ref)
            if not l_VRService_0.VREnabled and (not l_UserInputService_0.TouchEnabled or l_UserInputService_0.GamepadEnabled and true or false) then
                l_v505_1.BackgroundTransparency = v0.transparency("ControlInputBackground", 0.5);
            end;
        end);
        v504 = function() --[[ Line: 2861 ]]
            -- upvalues: l_CoreGui_0 (ref), v501 (ref), l_VRService_0 (ref), l_UserInputService_0 (ref), v484 (copy), l_GuiService_0 (ref)
            local l_DropDownFullscreenFrame_0 = l_CoreGui_0.RobloxGui:FindFirstChild("DropDownFullscreenFrame");
            if l_DropDownFullscreenFrame_0 and l_DropDownFullscreenFrame_0.Visible then
                return;
            else
                local l_v501_0 = v501;
                if l_v501_0 and l_v501_0.Visible and l_v501_0.ZIndex > 1 and not l_VRService_0.VREnabled and (not l_UserInputService_0.TouchEnabled or l_UserInputService_0.GamepadEnabled and true or false) and v484.Active then
                    l_GuiService_0.SelectedCoreObject = l_v501_0;
                end;
                return;
            end;
        end;
        local function v511(v510) --[[ Line: 2879 ]] --[[ Name: processInput ]]
            -- upvalues: l_GuiService_0 (ref), v501 (ref), l_v505_1 (copy)
            if v510.UserInputState == Enum.UserInputState.Begin and v510.KeyCode == Enum.KeyCode.Return and l_GuiService_0.SelectedCoreObject == v501 then
                l_v505_1:CaptureFocus();
            end;
        end;
        v505.MouseEnter:Connect(v504);
        l_UserInputService_0.InputBegan:Connect(v511);
    elseif v486 == "TextEntry" then
        v502 = l_Create_0("ImageLabel")({
            Image = "", 
            BackgroundTransparency = 1
        });
        l_v500_0 = {
            HubRef = nil
        };
        local v512 = l_Create_0("TextBox")({
            AnchorPoint = Vector2.new(1, 0.5), 
            Size = UDim2.new(0.4, -10, 0, 40), 
            Position = UDim2.new(1, 0, 0.5, 0), 
            Text = v485, 
            TextColor3 = Color3.fromRGB(178, 178, 178), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextWrapped = false, 
            Font = v0.font(Enum.Font.SourceSans, "UtilityText"), 
            TextSize = v0.textSize(24, "UtilityText"), 
            ZIndex = 2, 
            SelectionImageObject = v502, 
            ClearTextOnFocus = false, 
            Parent = v495
        });
        v501 = v512;
        local l_v512_0 = v512 --[[ copy: 18 -> 22 ]];
        v512.Focused:Connect(function() --[[ Line: 2920 ]]
            -- upvalues: l_VRService_0 (ref), l_UserInputService_0 (ref), l_GuiService_0 (ref), l_v512_0 (copy), v485 (copy)
            if not l_VRService_0.VREnabled and (not l_UserInputService_0.TouchEnabled or l_UserInputService_0.GamepadEnabled and true or false) then
                l_GuiService_0.SelectedCoreObject = l_v512_0;
            end;
            if l_v512_0.Text == v485 then
                l_v512_0.Text = "";
            end;
        end);
        if v489 then
            v512.Position = UDim2.new(v512.Position.X.Scale, v512.Position.X.Offset, v512.Position.Y.Scale, v512.Position.Y.Offset + v489);
        end;
        local l_v512_1 = v512 --[[ copy: 18 -> 23 ]];
        v501.SelectionGained:Connect(function() --[[ Line: 2938 ]]
            -- upvalues: l_VRService_0 (ref), l_UserInputService_0 (ref), l_v512_1 (copy), l_v500_0 (ref), v501 (ref)
            if not l_VRService_0.VREnabled and (not l_UserInputService_0.TouchEnabled or l_UserInputService_0.GamepadEnabled and true or false) then
                l_v512_1.BackgroundTransparency = 0.8;
                if l_v500_0.HubRef then
                    l_v500_0.HubRef:ScrollToFrame(v501);
                end;
            end;
        end);
        v501.SelectionLost:Connect(function() --[[ Line: 2947 ]]
            -- upvalues: l_VRService_0 (ref), l_UserInputService_0 (ref), l_v512_1 (copy)
            if not l_VRService_0.VREnabled and (not l_UserInputService_0.TouchEnabled or l_UserInputService_0.GamepadEnabled and true or false) then
                l_v512_1.BackgroundTransparency = 1;
            end;
        end);
        v504 = function() --[[ Line: 2953 ]]
            -- upvalues: l_CoreGui_0 (ref), v501 (ref), l_VRService_0 (ref), l_UserInputService_0 (ref), v484 (copy), l_GuiService_0 (ref)
            local l_DropDownFullscreenFrame_1 = l_CoreGui_0.RobloxGui:FindFirstChild("DropDownFullscreenFrame");
            if l_DropDownFullscreenFrame_1 and l_DropDownFullscreenFrame_1.Visible then
                return;
            else
                local l_v501_1 = v501;
                if l_v501_1 and l_v501_1.Visible and l_v501_1.ZIndex > 1 and not l_VRService_0.VREnabled and (not l_UserInputService_0.TouchEnabled or l_UserInputService_0.GamepadEnabled and true or false) and v484.Active then
                    l_GuiService_0.SelectedCoreObject = l_v501_1;
                end;
                return;
            end;
        end;
        local function v518(v517) --[[ Line: 2971 ]] --[[ Name: processInput ]]
            -- upvalues: l_GuiService_0 (ref), v501 (ref), l_v512_1 (copy)
            if v517.UserInputState == Enum.UserInputState.Begin and v517.KeyCode == Enum.KeyCode.Return and l_GuiService_0.SelectedCoreObject == v501 then
                l_v512_1:CaptureFocus();
            end;
        end;
        v495.MouseEnter:Connect(v504);
        l_v500_0.SetZIndex = function(_, v520) --[[ Line: 2982 ]] --[[ Name: SetZIndex ]]
            -- upvalues: l_v512_1 (copy)
            l_v512_1.ZIndex = v520;
        end;
        l_v500_0.SetInteractable = function(_, v522) --[[ Line: 2986 ]] --[[ Name: SetInteractable ]]
            -- upvalues: l_v512_1 (copy)
            l_v512_1.Selectable = v522;
            if not v522 then
                l_v512_1.TextColor3 = Color3.fromRGB(49, 49, 49);
                l_v512_1.ZIndex = 1;
                return;
            else
                l_v512_1.TextColor3 = Color3.fromRGB(178, 178, 178);
                l_v512_1.ZIndex = 2;
                return;
            end;
        end;
        l_v500_0.SetValue = function(_, v524) --[[ Line: 2997 ]] --[[ Name: SetValue ]]
            -- upvalues: l_v512_1 (copy)
            l_v512_1.Text = v524;
        end;
        local l_BindableEvent_4 = Instance.new("BindableEvent");
        l_BindableEvent_4.Name = "ValueChanged";
        v512.FocusLost:Connect(function() --[[ Line: 3004 ]]
            -- upvalues: l_BindableEvent_4 (copy), l_v512_1 (copy)
            l_BindableEvent_4:Fire(l_v512_1.Text);
        end);
        l_v500_0.ValueChanged = l_BindableEvent_4.Event;
        l_UserInputService_0.InputBegan:Connect(v518);
    end;
    v502 = v485 .. "ValueChanger";
    l_v500_0.Name = v502;
    v502 = l_v500_0.SetAutoLocalize;
    l_v500_0.SetAutoLocalize = function(v526, v527) --[[ Line: 3016 ]]
        -- upvalues: v495 (ref), v502 (copy)
        v495.AutoLocalize = v527;
        if v502 then
            v502(v526, v527);
        end;
    end;
    v493 = v493 + v482;
    if v489 then
        v493 = v493 + v489;
    end;
    v483[v484] = v493;
    if v494 then
        local function v530() --[[ Line: 3031 ]]
            -- upvalues: l_CoreGui_0 (ref), l_v500_0 (ref), l_VRService_0 (ref), l_UserInputService_0 (ref), v484 (copy), l_GuiService_0 (ref)
            local l_DropDownFullscreenFrame_2 = l_CoreGui_0.RobloxGui:FindFirstChild("DropDownFullscreenFrame");
            if l_DropDownFullscreenFrame_2 and l_DropDownFullscreenFrame_2.Visible then
                return;
            else
                local v529 = l_v500_0.SliderFrame or l_v500_0.SliderFrame or l_v500_0.DropDownFrame or l_v500_0.SelectorFrame;
                if v529 and v529.Visible and v529.ZIndex > 1 and not l_VRService_0.VREnabled and (not l_UserInputService_0.TouchEnabled or l_UserInputService_0.GamepadEnabled and true or false) and v484.Active then
                    l_GuiService_0.SelectedCoreObject = v529;
                end;
                return;
            end;
        end;
        v495.MouseEnter:Connect(v530);
        v504 = function(v531) --[[ Line: 3061 ]] --[[ Name: onVREnabled ]]
            -- upvalues: l_VRService_0 (ref), v495 (ref), v501 (ref), l_GuiService_0 (ref), v0 (ref)
            if v531 == "VREnabled" then
                if l_VRService_0.VREnabled then
                    v495.Selectable = true;
                    v495.Active = true;
                    v501.Active = true;
                    l_GuiService_0.Changed:Connect(function(v532) --[[ Line: 3067 ]]
                        -- upvalues: l_GuiService_0 (ref), v495 (ref), v0 (ref)
                        if v532 == "SelectedCoreObject" then
                            local l_SelectedCoreObject_7 = l_GuiService_0.SelectedCoreObject;
                            if l_SelectedCoreObject_7 and (l_SelectedCoreObject_7 == v495 or l_SelectedCoreObject_7:IsDescendantOf(v495)) then
                                v495.ImageTransparency = v0.transparency("RowFrameBackground", 0.5);
                                v495.BackgroundTransparency = 1;
                                return;
                            else
                                v495.ImageTransparency = 1;
                                v495.BackgroundTransparency = 1;
                            end;
                        end;
                    end);
                    return;
                else
                    v495.Selectable = false;
                    v495.Active = false;
                end;
            end;
        end;
        l_VRService_0.Changed:Connect(v504);
        if l_VRService_0.VREnabled then
            v495.Selectable = true;
            v495.Active = true;
            v501.Active = true;
            l_GuiService_0.Changed:Connect(function(v534) --[[ Line: 3067 ]]
                -- upvalues: l_GuiService_0 (ref), v495 (ref), v0 (ref)
                if v534 == "SelectedCoreObject" then
                    local l_SelectedCoreObject_8 = l_GuiService_0.SelectedCoreObject;
                    if l_SelectedCoreObject_8 and (l_SelectedCoreObject_8 == v495 or l_SelectedCoreObject_8:IsDescendantOf(v495)) then
                        v495.ImageTransparency = v0.transparency("RowFrameBackground", 0.5);
                        v495.BackgroundTransparency = 1;
                        return;
                    else
                        v495.ImageTransparency = 1;
                        v495.BackgroundTransparency = 1;
                    end;
                end;
            end);
        else
            v495.Selectable = false;
            v495.Active = false;
        end;
        v501.SelectionGained:Connect(function() --[[ Line: 3088 ]]
            -- upvalues: l_VRService_0 (ref), l_UserInputService_0 (ref), v495 (ref), v0 (ref), l_v500_0 (ref)
            if not l_VRService_0.VREnabled and (not l_UserInputService_0.TouchEnabled or l_UserInputService_0.GamepadEnabled and true or false) then
                if l_VRService_0.VREnabled then
                    v495.ImageTransparency = 0.5;
                    v495.BackgroundTransparency = 1;
                else
                    v495.ImageTransparency = 1;
                    v495.BackgroundTransparency = v0.transparency("RowFrameBackground", 0.5);
                end;
                if l_v500_0.HubRef then
                    l_v500_0.HubRef:ScrollToFrame(v495);
                end;
            end;
        end);
        v501.SelectionLost:Connect(function() --[[ Line: 3103 ]]
            -- upvalues: l_VRService_0 (ref), l_UserInputService_0 (ref), v495 (ref)
            if not l_VRService_0.VREnabled and (not l_UserInputService_0.TouchEnabled or l_UserInputService_0.GamepadEnabled and true or false) then
                v495.ImageTransparency = 1;
                v495.BackgroundTransparency = 1;
            end;
        end);
    end;
    v484:AddRow(v495, v497, l_v500_0, v489, false);
    l_v500_0.Selection = v501;
    return v495, v497, l_v500_0;
end;
local function v551(v537, v538, v539, v540, v541) --[[ Line: 3118 ]] --[[ Name: AddNewRowObject ]]
    -- upvalues: v483 (copy), l_Create_0 (copy), v482 (ref), v30 (copy), v0 (copy), v28 (copy), v29 (copy), l_GuiService_0 (copy), l_VRService_0 (copy)
    local v542 = 0;
    if v483[v537] then
        v542 = v483[v537];
    end;
    local v543 = l_Create_0("ImageButton")({
        Name = v538 .. "Frame", 
        BackgroundTransparency = 1, 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BorderSizePixel = 0, 
        Image = "rbxasset://textures/ui/VR/rectBackgroundWhite.png", 
        ScaleType = Enum.ScaleType.Slice, 
        SliceCenter = Rect.new(10, 10, 10, 10), 
        ImageTransparency = 1, 
        Active = false, 
        AutoButtonColor = false, 
        Size = UDim2.new(1, 0, 0, v482), 
        Position = UDim2.new(0, 0, 0, v542), 
        ZIndex = 2, 
        Selectable = false, 
        SelectionImageObject = v30, 
        Parent = v537.Page
    });
    if v0.UIBloxThemeEnabled then
        v543.BackgroundColor3 = v0.color("RowFrameBackground");
        l_Create_0("UICorner")({
            CornerRadius = v0.DefaultCornerRadius, 
            Parent = v543
        });
    end;
    v543.ImageColor3 = v543.BackgroundColor3;
    v543.SelectionGained:Connect(function() --[[ Line: 3153 ]]
        -- upvalues: v543 (copy), v0 (ref)
        v543.BackgroundTransparency = v0.transparency("RowFrameBackground", 0.5);
    end);
    v543.SelectionLost:Connect(function() --[[ Line: 3156 ]]
        -- upvalues: v543 (copy)
        v543.BackgroundTransparency = 1;
    end);
    local v544 = l_Create_0("TextLabel")({
        Name = v538 .. "Label", 
        Text = v538, 
        Font = v0.font(Enum.Font.SourceSansBold, "UtilityRow"), 
        TextSize = v0.textSize(16, "UtilityRow"), 
        TextColor3 = Color3.fromRGB(255, 255, 255), 
        TextXAlignment = Enum.TextXAlignment.Left, 
        TextWrapped = true, 
        BackgroundTransparency = 1, 
        AutomaticSize = Enum.AutomaticSize.Y, 
        Size = UDim2.new(0.4, -20, 1, 0), 
        Position = UDim2.new(0, 10, 0, 0), 
        ZIndex = 2, 
        Parent = v543
    });
    l_Create_0("UIPadding")({
        Name = v538 .. "UIPadding", 
        PaddingBottom = UDim.new(0, 10), 
        PaddingTop = UDim.new(0, 10), 
        Parent = v544
    });
    local function v547(_, v546) --[[ Line: 3183 ]] --[[ Name: onResized ]]
        -- upvalues: v541 (copy), v544 (copy), v0 (ref), v28 (ref)
        if v541 then
            UDim2.new(0, 200, 1, 0);
        end;
        if v546 then
            v544.TextSize = v0.textSize(16, "UtilityRow");
            return;
        else
            v544.TextSize = v28 and v0.textSize(36) or v0.textSize(24, "UtilityText");
            return;
        end;
    end;
    v29[v543] = v547;
    local l_v547_0 = v547;
    local v549 = if _G.__TESTEZ_RUNNING_TEST__ then Vector2.new(1024, 1024) else l_GuiService_0:GetHardwareSafeViewport();
    local v550 = if _G.__TESTEZ_RUNNING_TEST__ then Vector2.new(1024, 1024) else l_GuiService_0:GetHardwareSafeViewport();
    l_v547_0(v549, v550.Y > v550.X);
    if v540 then
        v543.Position = UDim2.new(v543.Position.X.Scale, v543.Position.X.Offset, v543.Position.Y.Scale, v543.Position.Y.Offset + v540);
    end;
    v542 = v542 + v482;
    if v540 then
        v542 = v542 + v540;
    end;
    v483[v537] = v542;
    l_v547_0 = function() --[[ Line: 3211 ]]
        -- upvalues: v543 (copy), l_GuiService_0 (ref)
        if v543.Visible then
            l_GuiService_0.SelectedCoreObject = v543;
        end;
    end;
    v543.MouseEnter:Connect(l_v547_0);
    v539.SelectionImageObject = v30;
    v539.SelectionGained:Connect(function() --[[ Line: 3220 ]]
        -- upvalues: l_VRService_0 (ref), v543 (copy), v0 (ref)
        if l_VRService_0.VREnabled then
            v543.ImageTransparency = v0.transparency("RowFrameBackground", 0.5);
            v543.BackgroundTransparency = 1;
            return;
        else
            v543.ImageTransparency = 1;
            v543.BackgroundTransparency = v0.transparency("RowFrameBackground", 0.5);
            return;
        end;
    end);
    v539.SelectionLost:Connect(function() --[[ Line: 3229 ]]
        -- upvalues: v543 (copy)
        v543.ImageTransparency = 1;
        v543.BackgroundTransparency = 1;
    end);
    v539.Parent = v543;
    v537:AddRow(v543, v544, v539, v540, true);
    return v543;
end;
local v640 = {
    GetEaseLinear = function(_) --[[ Line: 3243 ]] --[[ Name: GetEaseLinear ]]
        -- upvalues: v38 (copy)
        return v38;
    end, 
    GetEaseOutQuad = function(_) --[[ Line: 3246 ]] --[[ Name: GetEaseOutQuad ]]
        -- upvalues: v43 (copy)
        return v43;
    end, 
    GetEaseInOutQuad = function(_) --[[ Line: 3249 ]] --[[ Name: GetEaseInOutQuad ]]
        -- upvalues: v48 (copy)
        return v48;
    end, 
    CreateNewSlider = function(_, v556, v557, v558, v559, v560) --[[ Line: 3253 ]] --[[ Name: CreateNewSlider ]]
        -- upvalues: v481 (copy)
        return v481(v556, v557, v558, v559, v560);
    end, 
    CreateNewSelector = function(_, v562, v563) --[[ Line: 3257 ]] --[[ Name: CreateNewSelector ]]
        -- upvalues: v361 (copy)
        return (v361(v562, v563));
    end, 
    CreateNewDropDown = function(_, v565, v566) --[[ Line: 3261 ]] --[[ Name: CreateNewDropDown ]]
        -- upvalues: v287 (copy)
        return (v287(v565, v566, nil));
    end, 
    AddNewRow = function(_, v568, v569, v570, v571, v572, v573, v574, v575, v576) --[[ Line: 3265 ]] --[[ Name: AddNewRow ]]
        -- upvalues: v536 (copy)
        return v536(v568, v569, v570, v571, v572, v573, v574, v575, v576);
    end, 
    AddNewRowObject = function(_, v578, v579, v580, v581, v582) --[[ Line: 3269 ]] --[[ Name: AddNewRowObject ]]
        -- upvalues: v551 (copy)
        return (v551(v578, v579, v580, v581, v582));
    end, 
    ShowAlert = function(_, v584, v585, v586, v587, v588) --[[ Line: 3273 ]] --[[ Name: ShowAlert ]]
        -- upvalues: v384 (copy)
        v384(v584, v585, v586, v587, v588);
    end, 
    IsSmallTouchScreen = function(_) --[[ Line: 3277 ]] --[[ Name: IsSmallTouchScreen ]]
        -- upvalues: l_GuiService_0 (copy), l_UserInputService_0 (copy)
        local v590 = if _G.__TESTEZ_RUNNING_TEST__ then Vector2.new(1024, 1024) else l_GuiService_0:GetHardwareSafeViewport();
        return l_UserInputService_0.TouchEnabled and (v590.Y < 500 or v590.X < 700);
    end, 
    IsPortrait = function(_) --[[ Line: 3281 ]] --[[ Name: IsPortrait ]]
        -- upvalues: l_GuiService_0 (copy)
        local v592 = if _G.__TESTEZ_RUNNING_TEST__ then Vector2.new(1024, 1024) else l_GuiService_0:GetHardwareSafeViewport();
        return v592.Y > v592.X;
    end, 
    MakeIconButton = function(_, v594, v595, v596, v597, v598, v599, v600) --[[ Line: 3285 ]] --[[ Name: MakeIconButton ]]
        -- upvalues: v151 (copy)
        return (v151(v594, v595, v596, v597, v598, v599, v600));
    end, 
    MakeStyledButton = function(_, v602, v603, v604, v605, v606, v607) --[[ Line: 3289 ]] --[[ Name: MakeStyledButton ]]
        -- upvalues: v166 (copy)
        return v166(v602, v603, v604, v605, v606, v607);
    end, 
    MakeStyledImageButton = function(_, v609, v610, v611, v612, v613, v614, v615, v616) --[[ Line: 3293 ]] --[[ Name: MakeStyledImageButton ]]
        -- upvalues: v180 (copy)
        return v180(v609, v610, v611, v612, v613, v614, v615, v616);
    end, 
    AddButtonRow = function(_, v618, v619, v620, v621, v622, v623) --[[ Line: 3297 ]] --[[ Name: AddButtonRow ]]
        -- upvalues: v191 (copy)
        return v191(v618, v619, v620, v621, v622, v623);
    end, 
    MakeFocusState = function(_, v625, v626) --[[ Line: 3301 ]] --[[ Name: MakeFocusState ]]
        -- upvalues: v207 (copy)
        return v207(v625, v626);
    end, 
    CreateSignal = function(_) --[[ Line: 3305 ]] --[[ Name: CreateSignal ]]
        -- upvalues: v74 (copy)
        return (v74());
    end, 
    UsesSelectedObject = function(_) --[[ Line: 3309 ]] --[[ Name: UsesSelectedObject ]]
        -- upvalues: l_VRService_0 (copy), l_UserInputService_0 (copy)
        if l_VRService_0.VREnabled then
            return false;
        elseif l_UserInputService_0.TouchEnabled and not l_UserInputService_0.GamepadEnabled then
            return false;
        else
            return true;
        end;
    end, 
    TweenProperty = function(_, v630, v631, v632, v633, v634, v635, v636) --[[ Line: 3313 ]] --[[ Name: TweenProperty ]]
        return PropertyTweener(v630, v631, v632, v633, v634, v635, v636);
    end, 
    OnResized = function(_, v638, v639) --[[ Line: 3317 ]] --[[ Name: OnResized ]]
        -- upvalues: v94 (copy)
        return v94(v638, v639);
    end
};
v640.FireOnResized = function(_) --[[ Line: 3321 ]] --[[ Name: FireOnResized ]]
    -- upvalues: l_GuiService_0 (copy), v640 (copy), v29 (copy)
    local v642 = if _G.__TESTEZ_RUNNING_TEST__ then Vector2.new(1024, 1024) else l_GuiService_0:GetHardwareSafeViewport();
    local v643 = v640:IsPortrait();
    for _, v645 in pairs(v29) do
        v645(v642, v643);
    end;
end;
v640.Lerp = function(_, v647, v648, v649) --[[ Line: 3332 ]] --[[ Name: Lerp ]]
    return (1 - v647) * v648 + v647 * v649;
end;
v640.Round = function(_, v651) --[[ Line: 3337 ]] --[[ Name: Round ]]
    return v651 % 1 >= 0.5 and math.ceil(v651) or math.floor(v651);
end;
v640.IsExperienceOlderThanOneWeek = function(_, v653) --[[ Line: 3341 ]] --[[ Name: IsExperienceOlderThanOneWeek ]]
    -- upvalues: l_Workspace_0 (copy)
    if v653 ~= nil and v653.Created ~= nil then
        local l_UnixTimestampMillis_0 = DateTime.fromIsoDate(v653.Created).UnixTimestampMillis;
        if l_Workspace_0:GetServerTimeNow() * 1000 - l_UnixTimestampMillis_0 > 604800000 then
            return true;
        end;
    end;
    return false;
end;
return v640;