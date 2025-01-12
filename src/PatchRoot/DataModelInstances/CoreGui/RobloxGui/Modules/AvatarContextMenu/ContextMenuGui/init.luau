local l_CoreGui_0 = game:GetService("CoreGui");
local l_GuiService_0 = game:GetService("GuiService");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_Modules_0 = l_RobloxGui_0:WaitForChild("Modules");
local l_Settings_0 = l_Modules_0:WaitForChild("Settings");
local l_AvatarContextMenu_0 = l_Modules_0:WaitForChild("AvatarContextMenu");
local v6 = nil;
local l_BindableEvent_0 = Instance.new("BindableEvent");
local _ = require(l_AvatarContextMenu_0:WaitForChild("ContextMenuUtil"));
local _ = require(l_Settings_0:WaitForChild("Utility"));
local v10 = {};
v10.__index = v10;
v10.CreateContextMenuHolder = function(_, _) --[[ Line: 33 ]] --[[ Name: CreateContextMenuHolder ]]
    -- upvalues: l_RobloxGui_0 (copy)
    local l_Frame_0 = Instance.new("Frame");
    l_Frame_0.Name = "AvatarContextMenu";
    l_Frame_0.Position = UDim2.new(0, 0, 0, 0);
    l_Frame_0.Size = UDim2.new(1, 0, 1, 0);
    l_Frame_0.BackgroundTransparency = 1;
    l_Frame_0.Parent = l_RobloxGui_0;
    l_Frame_0.AutoLocalize = false;
    return l_Frame_0;
end;
v10.CreateLeaveMenuButton = function(v14, v15, v16) --[[ Line: 44 ]] --[[ Name: CreateLeaveMenuButton ]]
    local function v17() --[[ Line: 45 ]] --[[ Name: closeMenu ]]
        -- upvalues: v14 (copy)
        v14.CloseMenuFunc();
    end;
    local l_ImageButton_0 = Instance.new("ImageButton");
    l_ImageButton_0.Name = "CloseMenuButton";
    l_ImageButton_0.BackgroundTransparency = 1;
    l_ImageButton_0.AnchorPoint = Vector2.new(1, 0);
    l_ImageButton_0.Position = UDim2.new(1, -10, 0, 10);
    l_ImageButton_0.Size = UDim2.new(0.05, 0, 0.1, 0);
    l_ImageButton_0.Image = v16.LeaveMenuImage;
    l_ImageButton_0.Selectable = false;
    l_ImageButton_0.Activated:Connect(v17);
    local l_UIAspectRatioConstraint_0 = Instance.new("UIAspectRatioConstraint");
    l_UIAspectRatioConstraint_0.AspectType = Enum.AspectType.FitWithinMaxSize;
    l_UIAspectRatioConstraint_0.DominantAxis = Enum.DominantAxis.Height;
    l_UIAspectRatioConstraint_0.AspectRatio = 1;
    l_UIAspectRatioConstraint_0.Parent = l_ImageButton_0;
    l_ImageButton_0.Parent = v15;
    return l_ImageButton_0;
end;
local function _(v20) --[[ Line: 71 ]] --[[ Name: listenToViewportChange ]]
    if v20 == nil then
        return;
    else
        local v21 = nil;
        local function v23() --[[ Line: 76 ]] --[[ Name: updateCamera ]]
            -- upvalues: v21 (ref), v20 (copy)
            local l_CurrentCamera_0 = workspace.CurrentCamera;
            if v21 then
                v21:Disconnect();
            end;
            v21 = l_CurrentCamera_0:GetPropertyChangedSignal("ViewportSize"):Connect(v20);
            v20();
        end;
        workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(v23);
        local l_CurrentCamera_1 = workspace.CurrentCamera;
        if v21 then
            v21:Disconnect();
        end;
        v21 = l_CurrentCamera_1:GetPropertyChangedSignal("ViewportSize"):Connect(v20);
        v20();
        return;
    end;
end;
v10.CreateMenuFrame = function(v26, v27) --[[ Line: 89 ]] --[[ Name: CreateMenuFrame ]]
    -- upvalues: l_GuiService_0 (copy)
    local l_v26_ContextMenuHolder_0 = v26:CreateContextMenuHolder();
    local l_ImageButton_1 = Instance.new("ImageButton");
    l_ImageButton_1.Name = "Menu";
    l_ImageButton_1.AnchorPoint = v27.AnchorPoint;
    l_ImageButton_1.Size = v27.Size;
    l_ImageButton_1.Position = v27.OnScreenPosition;
    l_ImageButton_1.BackgroundTransparency = v27.BackgroundTransparency;
    l_ImageButton_1.BackgroundColor3 = v27.BackgroundColor;
    l_ImageButton_1.Image = v27.BackgroundImage;
    l_ImageButton_1.ScaleType = v27.BackgroundImageScaleType;
    l_ImageButton_1.SliceCenter = v27.BackgroundImageSliceCenter;
    l_ImageButton_1.AutoButtonColor = false;
    l_ImageButton_1.BorderSizePixel = 0;
    l_ImageButton_1.Selectable = false;
    l_ImageButton_1.Visible = false;
    l_ImageButton_1.Active = true;
    l_ImageButton_1.ClipsDescendants = true;
    l_ImageButton_1.Modal = true;
    l_GuiService_0:AddSelectionParent("AvatarContextMenuGroup", l_ImageButton_1);
    local l_UIAspectRatioConstraint_1 = Instance.new("UIAspectRatioConstraint");
    l_UIAspectRatioConstraint_1.AspectType = Enum.AspectType.ScaleWithParentSize;
    l_UIAspectRatioConstraint_1.DominantAxis = Enum.DominantAxis.Height;
    l_UIAspectRatioConstraint_1.Name = "MenuAspectRatio";
    l_UIAspectRatioConstraint_1.AspectRatio = v27.AspectRatio;
    l_UIAspectRatioConstraint_1.Parent = l_ImageButton_1;
    local function v32() --[[ Line: 120 ]] --[[ Name: updateAspectRatioForViewport ]]
        -- upvalues: l_UIAspectRatioConstraint_1 (copy)
        local l_ViewportSize_0 = workspace.CurrentCamera.ViewportSize;
        if l_ViewportSize_0.x < l_ViewportSize_0.y then
            l_UIAspectRatioConstraint_1.DominantAxis = Enum.DominantAxis.Width;
            return;
        else
            l_UIAspectRatioConstraint_1.DominantAxis = Enum.DominantAxis.Height;
            return;
        end;
    end;
    if v32 ~= nil then
        local v33 = nil;
        do
            local l_v33_0 = v33;
            local function v36() --[[ Line: 76 ]] --[[ Name: updateCamera ]]
                -- upvalues: l_v33_0 (ref), v32 (copy)
                local l_CurrentCamera_2 = workspace.CurrentCamera;
                if l_v33_0 then
                    l_v33_0:Disconnect();
                end;
                l_v33_0 = l_CurrentCamera_2:GetPropertyChangedSignal("ViewportSize"):Connect(v32);
                v32();
            end;
            workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(v36);
            local l_CurrentCamera_3 = workspace.CurrentCamera;
            if l_v33_0 then
                l_v33_0:Disconnect();
            end;
            l_v33_0 = l_CurrentCamera_3:GetPropertyChangedSignal("ViewportSize"):Connect(v32);
            v32();
        end;
    end;
    local l_UISizeConstraint_0 = Instance.new("UISizeConstraint");
    l_UISizeConstraint_0.Name = "MenuSizeConstraint";
    l_UISizeConstraint_0.MaxSize = v27.MaxSize;
    l_UISizeConstraint_0.MinSize = v27.MinSize;
    l_UISizeConstraint_0.Parent = l_ImageButton_1;
    local l_Frame_1 = Instance.new("Frame");
    l_Frame_1.Name = "Content";
    l_Frame_1.Size = UDim2.new(1, 0, 1, 0);
    l_Frame_1.BackgroundTransparency = 1;
    l_Frame_1.Parent = l_ImageButton_1;
    local l_UIListLayout_0 = Instance.new("UIListLayout");
    l_UIListLayout_0.HorizontalAlignment = Enum.HorizontalAlignment.Center;
    l_UIListLayout_0.VerticalAlignment = Enum.VerticalAlignment.Top;
    l_UIListLayout_0.SortOrder = Enum.SortOrder.LayoutOrder;
    l_UIListLayout_0.Parent = l_Frame_1;
    local l_ScrollingFrame_0 = Instance.new("ScrollingFrame");
    l_ScrollingFrame_0.Name = "ContextActionList";
    l_ScrollingFrame_0.AnchorPoint = Vector2.new(0.5, 1);
    l_ScrollingFrame_0.BackgroundColor3 = v27.ButtonFrameColor;
    l_ScrollingFrame_0.BackgroundTransparency = v27.ButtonFrameTransparency;
    l_ScrollingFrame_0.BorderSizePixel = 0;
    l_ScrollingFrame_0.LayoutOrder = 2;
    l_ScrollingFrame_0.Size = UDim2.new(1, -12, 0.54, 0);
    l_ScrollingFrame_0.CanvasSize = UDim2.new(0, 0, 0, 208);
    l_ScrollingFrame_0.ScrollBarThickness = 4;
    l_ScrollingFrame_0.Selectable = false;
    l_ScrollingFrame_0.Parent = l_Frame_1;
    local l_UIListLayout_1 = Instance.new("UIListLayout");
    l_UIListLayout_1.HorizontalAlignment = Enum.HorizontalAlignment.Center;
    l_UIListLayout_1.SortOrder = Enum.SortOrder.LayoutOrder;
    l_UIListLayout_1.VerticalAlignment = Enum.VerticalAlignment.Top;
    l_UIListLayout_1:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function() --[[ Line: 166 ]]
        -- upvalues: l_ScrollingFrame_0 (copy), l_UIListLayout_1 (copy)
        l_ScrollingFrame_0.CanvasSize = UDim2.new(0, 0, 0, l_UIListLayout_1.AbsoluteContentSize.Y);
    end);
    l_UIListLayout_1.Parent = l_ScrollingFrame_0;
    local l_TextButton_0 = Instance.new("TextButton");
    l_TextButton_0.Name = "NameTag";
    l_TextButton_0.AnchorPoint = Vector2.new(0.5, 1);
    l_TextButton_0.BackgroundColor3 = v27.NameTagColor;
    l_TextButton_0.AutoButtonColor = false;
    l_TextButton_0.BorderSizePixel = 0;
    l_TextButton_0.LayoutOrder = 1;
    l_TextButton_0.Size = UDim2.new(1, -12, 0.16, 0);
    l_TextButton_0.Font = v27.Font;
    l_TextButton_0.TextColor3 = v27.TextColor;
    l_TextButton_0.TextSize = 24 * v27.TextScale;
    l_TextButton_0.Text = "";
    l_TextButton_0.TextXAlignment = Enum.TextXAlignment.Center;
    l_TextButton_0.TextYAlignment = Enum.TextYAlignment.Center;
    l_TextButton_0.Selectable = false;
    l_TextButton_0.Parent = l_Frame_1;
    local l_Frame_2 = Instance.new("Frame");
    l_Frame_2.Name = "Underline";
    l_Frame_2.BackgroundColor3 = v27.NameUnderlineColor;
    l_Frame_2.AnchorPoint = Vector2.new(0, 1);
    l_Frame_2.BorderSizePixel = 0;
    l_Frame_2.Position = UDim2.new(0, 0, 1, 0);
    l_Frame_2.Size = UDim2.new(1, 0, 0, 2);
    l_Frame_2.Parent = l_TextButton_0;
    v26:CreateLeaveMenuButton(l_ImageButton_1, v27);
    l_ImageButton_1.Parent = l_v26_ContextMenuHolder_0;
    v26.ContextMenuFrame = l_ImageButton_1;
    return l_ImageButton_1;
end;
v10.UpdateGuiTheme = function(v45, v46) --[[ Line: 206 ]] --[[ Name: UpdateGuiTheme ]]
    -- upvalues: v6 (ref)
    v45.ContextMenuFrame.Size = v46.Size;
    v45.ContextMenuFrame.AnchorPoint = v46.AnchorPoint;
    v45.ContextMenuFrame.BackgroundTransparency = v46.BackgroundTransparency;
    v45.ContextMenuFrame.BackgroundColor3 = v46.BackgroundColor;
    v45.ContextMenuFrame.Image = v46.BackgroundImage;
    v45.ContextMenuFrame.ScaleType = v46.BackgroundImageScaleType;
    v45.ContextMenuFrame.SliceCenter = v46.BackgroundImageSliceCenter;
    v45.ContextMenuFrame.CloseMenuButton.Image = v46.LeaveMenuImage;
    v45.ContextMenuFrame.MenuSizeConstraint.MaxSize = v46.MaxSize;
    v45.ContextMenuFrame.MenuSizeConstraint.MinSize = v46.MinSize;
    v45.ContextMenuFrame.MenuAspectRatio.AspectRatio = v46.AspectRatio;
    local l_Content_0 = v45.ContextMenuFrame.Content;
    l_Content_0.ContextActionList.BackgroundColor3 = v46.ButtonFrameColor;
    l_Content_0.ContextActionList.BackgroundTransparency = v46.ButtonFrameTransparency;
    l_Content_0.NameTag.BackgroundColor3 = v46.NameTagColor;
    l_Content_0.NameTag.Font = v46.Font;
    l_Content_0.NameTag.TextColor3 = v46.TextColor;
    l_Content_0.NameTag.TextSize = 24 * v46.TextScale;
    l_Content_0.NameTag.Underline.BackgroundColor3 = v46.NameUnderlineColor;
    if v6 then
        v6:UpdateGuiTheme(v46);
    end;
end;
v10.BuildPlayerCarousel = function(v48, v49, v50) --[[ Line: 239 ]] --[[ Name: BuildPlayerCarousel ]]
    -- upvalues: v6 (ref), l_AvatarContextMenu_0 (copy), l_BindableEvent_0 (copy)
    if not v6 then
        v6 = require(l_AvatarContextMenu_0.PlayerCarousel).new(v50);
        v6.rbxGui.Parent = v48.ContextMenuFrame.Content;
    end;
    v6:ClearPlayerEntries();
    if v48.PlayerChangedConnection then
        v48.PlayerChangedConnection:Disconnect();
    end;
    v48.PlayerChangedConnection = v6.PlayerChanged:Connect(function(v51) --[[ Line: 251 ]]
        -- upvalues: v48 (copy), l_BindableEvent_0 (ref)
        if v51 then
            v48.ContextMenuFrame.Content.NameTag.Text = v51.Name;
        else
            v48.ContextMenuFrame.Content.NameTag.Text = "";
        end;
        l_BindableEvent_0:Fire(v51);
    end);
    for v52 = 1, #v49 do
        v6:CreatePlayerEntry(v49[v52][1], v49[v52][2]);
    end;
    v6:FadeTowardsEdges();
    v6:AddCarouselDivider();
end;
v10.RemovePlayerEntry = function(_, v54) --[[ Line: 267 ]] --[[ Name: RemovePlayerEntry ]]
    -- upvalues: v6 (ref)
    if not v6 then
        return;
    else
        v6:RemovePlayerEntry(v54);
        return;
    end;
end;
v10.GetBottomScreenPaddingConstant = function(_) --[[ Line: 273 ]] --[[ Name: GetBottomScreenPaddingConstant ]]
    return 0.02;
end;
v10.SetCloseMenuFunc = function(v56, v57) --[[ Line: 277 ]] --[[ Name: SetCloseMenuFunc ]]
    v56.CloseMenuFunc = v57;
end;
v10.SwitchToPlayerEntry = function(_, v59, v60) --[[ Line: 281 ]] --[[ Name: SwitchToPlayerEntry ]]
    -- upvalues: v6 (ref)
    if not v6 then
        return;
    else
        v6:SwitchToPlayerEntry(v59, v60);
        return;
    end;
end;
v10.OffsetPlayerEntry = function(_, v62) --[[ Line: 286 ]] --[[ Name: OffsetPlayerEntry ]]
    -- upvalues: v6 (ref)
    if not v6 then
        return;
    else
        v6:OffsetPlayerEntry(v62);
        return;
    end;
end;
v10.GetSelectedPlayer = function(_) --[[ Line: 291 ]] --[[ Name: GetSelectedPlayer ]]
    -- upvalues: v6 (ref)
    if not v6 then
        return nil;
    else
        return v6:GetSelectedPlayer();
    end;
end;
v10.new = function() --[[ Line: 296 ]] --[[ Name: new ]]
    -- upvalues: v10 (copy), l_BindableEvent_0 (copy)
    local v64 = setmetatable({}, v10);
    v64.CloseMenuFunc = nil;
    v64.ContextMenuFrame = nil;
    v64.LastSetPlayerIcon = nil;
    v64.PlayerChangedConnection = nil;
    v64.SelectedPlayerChanged = l_BindableEvent_0.Event;
    return v64;
end;
return v10.new();