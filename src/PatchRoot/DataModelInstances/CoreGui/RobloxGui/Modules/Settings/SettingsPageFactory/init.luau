local l_GuiService_0 = game:GetService("GuiService");
local l_HttpService_0 = game:GetService("HttpService");
local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_TweenService_0 = game:GetService("TweenService");
local v6 = require(l_RobloxGui_0.Modules.Settings.Utility);
local v7 = require(l_RobloxGui_0.Modules.StyleWidgets);
local v8 = require(l_RobloxGui_0.Modules.Settings.Theme);
local l_Create_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Create;
l_RobloxGui_0:WaitForChild("Modules"):WaitForChild("TenFootInterface");
local v10 = require(l_RobloxGui_0.Modules.TenFootInterface):IsEnabled();
local l_status_0, l_result_0 = pcall(function() --[[ Line: 29 ]]
    return settings():GetFFlag("UseNotificationsLocalization");
end);
local v13 = l_status_0 and l_result_0;
local v14 = require(script.Parent.Flags.GetFFlagFixIGMTabTransitions);
local v15 = require(l_RobloxGui_0.Modules.Settings.Flags.FFlagInExperienceMenuCanvasGroupsInvisible);
local function v71() --[[ Line: 35 ]] --[[ Name: Initialize ]]
    -- upvalues: l_Create_0 (copy), v6 (copy), v10 (copy), v8 (copy), v13 (copy), v7 (copy), l_GuiService_0 (copy), l_HttpService_0 (copy), v15 (copy), v14 (copy), l_UserGameSettings_0 (copy), l_TweenService_0 (copy)
    local v16 = {
        HubRef = nil, 
        LastSelectedObject = nil, 
        TabPosition = 0, 
        Active = false, 
        OpenStateChangedCount = 0, 
        ShouldShowBottomBar = true, 
        ShouldShowHubBar = true, 
        IsPageClipped = true, 
        SelectARow = nil
    };
    local v17 = {};
    local v18 = false;
    v16.TabHeader = l_Create_0("TextButton")({
        Name = "Header", 
        Text = "", 
        BackgroundTransparency = 1, 
        Size = UDim2.new(0.2, 0, 1, 0), 
        Position = UDim2.new(0, 0, 0, 0)
    });
    if v6:IsSmallTouchScreen() then
        v16.TabHeader.Size = UDim2.new(0, 84, 1, 0);
    elseif v10 then
        v16.TabHeader.Size = UDim2.new(0, 220, 1, 0);
    end;
    v16.TabHeader.MouseButton1Click:connect(function() --[[ Line: 63 ]]
        -- upvalues: v16 (copy)
        if v16.HubRef then
            v16.HubRef:SwitchToPage(v16, true);
        end;
    end);
    local v19 = l_Create_0("ImageLabel")({
        Name = "Icon", 
        BackgroundTransparency = 1, 
        Size = UDim2.new(0.75, 0, 0.75, 0), 
        Position = UDim2.new(0, 10, 0.5, -18), 
        Image = "", 
        ImageTransparency = 0.5, 
        Parent = v16.TabHeader
    });
    local _ = l_Create_0("UIAspectRatioConstraint")({
        Name = "AspectRatioConstraint", 
        AspectRatio = 1, 
        Parent = v19
    });
    local v21 = 0;
    if v8.UIBloxThemeEnabled then
        v21 = -2;
    end;
    local v22 = l_Create_0("TextLabel")({
        Name = "Title", 
        Text = "", 
        Font = v8.font(Enum.Font.SourceSansBold, "Button"), 
        FontSize = v8.fontSize(Enum.FontSize.Size24, "Button"), 
        TextColor3 = Color3.new(1, 1, 1), 
        BackgroundTransparency = 1, 
        Size = UDim2.new(1.05, 0, 1, 0), 
        Position = UDim2.new(1.2, v8.TabHeaderIconPadding, 0, v21), 
        TextXAlignment = Enum.TextXAlignment.Left, 
        TextTransparency = 0.5
    });
    local l_UITextSizeConstraint_0 = Instance.new("UITextSizeConstraint");
    l_UITextSizeConstraint_0.MaxTextSize = 24;
    if v13 and not v8.UIBloxThemeEnabled then
        v22.Parent = v16.TabHeader;
        v22.TextScaled = true;
        v22.TextWrapped = true;
        l_UITextSizeConstraint_0.Parent = v22;
    else
        v22.Parent = v19;
    end;
    if v6:IsPortrait() and v6:IsSmallTouchScreen() then
        l_UITextSizeConstraint_0.Parent = v22;
    end;
    if v6:IsSmallTouchScreen() then
        v22.FontSize = v8.fontSize(Enum.FontSize.Size18);
        l_UITextSizeConstraint_0.MaxTextSize = 18;
    elseif v10 then
        v22.FontSize = v8.fontSize(Enum.FontSize.Size48);
        l_UITextSizeConstraint_0.MaxTextSize = 48;
    end;
    local v24 = nil;
    local v25 = nil;
    if v8.UIBloxThemeEnabled then
        v24 = l_Create_0("ImageLabel")({
            Name = "TabSelection", 
            Visible = false, 
            BackgroundColor3 = v8.color("TabSelection"), 
            BackgroundTransparency = v8.transparency("TabSelection"), 
            Size = UDim2.new(1, -2, 0, 2), 
            Position = UDim2.new(0, 3, 1, -2), 
            BorderSizePixel = 0, 
            Parent = v16.TabHeader
        });
        v25 = l_Create_0("Frame")({
            Name = "TabLabel", 
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Parent = v16.TabHeader
        });
        l_Create_0("UIListLayout")({
            Name = "Layout", 
            FillDirection = Enum.FillDirection.Horizontal, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 10), 
            Parent = v25
        });
        v19.Parent = v25;
        v22.Parent = v25;
        v22.Size = UDim2.new(0, 0, 0, 0);
        v22.AutomaticSize = Enum.AutomaticSize.XY;
    else
        v24 = v7.MakeTabSelectionWidget(v16.TabHeader);
    end;
    local v26 = Vector2.new(v22.Size.X.Scale, v22.Size.Y.Scale);
    local function v31() --[[ Line: 176 ]] --[[ Name: onResized ]]
        -- upvalues: v16 (copy), v8 (ref), v6 (ref), v19 (copy), v10 (ref), v25 (ref), v22 (copy), v13 (ref), v26 (copy)
        if not v16.TabHeader then
            return;
        else
            if v8.UIBloxThemeEnabled then
                if v6:IsSmallTouchScreen() then
                    v19.Size = UDim2.new(0, 34, 0, 28);
                elseif v10 then
                    v19.Size = UDim2.new(0, 88, 0, 74);
                else
                    local v27 = v8.getIconSize(v8.IconSize.Medium);
                    v19.Size = UDim2.fromOffset(v27, v27);
                end;
            elseif v6:IsSmallTouchScreen() then
                v16.TabHeader.Icon.Size = UDim2.new(0, 34, 0, 28);
                v16.TabHeader.Icon.Position = UDim2.new(v16.TabHeader.Icon.Position.X.Scale, v16.TabHeader.Icon.Position.X.Offset, 0.5, -14);
                v16.TabHeader.Icon.AnchorPoint = Vector2.new(0, 0);
            elseif v10 then
                v16.TabHeader.Icon.Size = UDim2.new(0, 88, 0, 74);
                v16.TabHeader.Icon.Position = UDim2.new(0, 0, 0.5, 0);
                v16.TabHeader.Icon.AnchorPoint = Vector2.new(0, 0.5);
            else
                v16.TabHeader.Icon.Size = UDim2.new(0, 44, 0, 37);
                v16.TabHeader.Icon.Position = UDim2.new(0, 15, 0.5, -18);
                v16.TabHeader.Icon.AnchorPoint = Vector2.new(0, 0);
            end;
            local v28 = v6:IsPortrait();
            if v8.UIBloxThemeEnabled then
                local l_Layout_0 = v25.Layout;
                if v28 then
                    if v6:IsSmallTouchScreen() then
                        v22.FontSize = v8.fontSize(Enum.FontSize.Size14);
                    end;
                    v19.Size = UDim2.new(0, 22, 0, 22);
                    l_Layout_0.FillDirection = Enum.FillDirection.Vertical;
                    l_Layout_0.Padding = UDim.new(0, 0);
                else
                    if v6:IsSmallTouchScreen() then
                        v22.FontSize = v8.fontSize(Enum.FontSize.Size18);
                    end;
                    l_Layout_0.FillDirection = Enum.FillDirection.Horizontal;
                    l_Layout_0.Padding = UDim.new(0, 10);
                end;
            elseif v28 then
                v16.TabHeader.Icon.Position = UDim2.new(0.5, 0, 0.5, 0);
                v16.TabHeader.Icon.AnchorPoint = Vector2.new(0.5, 0.5);
                v16.TabHeader.Icon.Size = UDim2.new(0.5, 0, 0.5, 0);
                if v13 then
                    v16.TabHeader.Title.Visible = false;
                else
                    v16.TabHeader.Icon.Title.Visible = false;
                end;
            else
                v16.TabHeader.Icon.Position = UDim2.new(0, 10, 0.5, -14);
                v16.TabHeader.Icon.AnchorPoint = Vector2.new(0, 0);
                v16.TabHeader.Icon.Size = UDim2.new(0, 34, 0, 28);
                if v13 then
                    v16.TabHeader.Title.Visible = true;
                else
                    v16.TabHeader.Icon.Title.Visible = true;
                end;
            end;
            if v13 and not v8.UIBloxThemeEnabled then
                local l_AbsoluteSize_0 = v16.TabHeader.Icon.AbsoluteSize;
                v22.Position = UDim2.new(0.125, l_AbsoluteSize_0.X + v8.TabHeaderIconPadding, 0.225, 0);
                v22.Size = UDim2.new(v26.X - 0.125 - 0.025, -(l_AbsoluteSize_0.X + v8.TabHeaderIconPadding), 0.5, 0);
            end;
            return;
        end;
    end;
    v6:OnResized(v16.TabHeader, v31);
    v16.Page = l_Create_0("Frame")({
        Name = "Page", 
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 1, 0), 
        AutomaticSize = Enum.AutomaticSize.Y
    });
    if v8.UIBloxThemeEnabled then
        l_Create_0("UIPadding")({
            PaddingLeft = UDim.new(0, 12), 
            PaddingRight = UDim.new(0, 11), 
            Parent = v16.Page
        });
    end;
    v16.PageListLayout = l_Create_0("UIListLayout")({
        Name = "RowListLayout", 
        FillDirection = Enum.FillDirection.Vertical, 
        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
        VerticalAlignment = Enum.VerticalAlignment.Top, 
        Padding = UDim.new(0, v8.UIBloxThemeEnabled and 8 or 3), 
        SortOrder = Enum.SortOrder.LayoutOrder, 
        Parent = v16.Page
    });
    l_GuiService_0:AddSelectionParent(l_HttpService_0:GenerateGUID(false), v16.Page);
    v16.Displayed = Instance.new("BindableEvent");
    v16.Displayed.Name = "Displayed";
    v16.Displayed.Event:connect(function() --[[ Line: 307 ]]
        -- upvalues: v16 (copy)
        if not v16.HubRef.Shield.Visible then
            return;
        else
            v16:SelectARow();
            return;
        end;
    end);
    v16.Hidden = Instance.new("BindableEvent");
    v16.Hidden.Event:connect(function() --[[ Line: 314 ]]
        -- upvalues: l_GuiService_0 (ref), v16 (copy)
        if l_GuiService_0.SelectedCoreObject and l_GuiService_0.SelectedCoreObject:IsDescendantOf(v16.Page) then
            l_GuiService_0.SelectedCoreObject = nil;
        end;
    end);
    v16.Hidden.Name = "Hidden";
    v16.SelectARow = function(_, v33) --[[ Line: 322 ]] --[[ Name: SelectARow ]]
        -- upvalues: l_GuiService_0 (ref), v16 (copy), v17 (copy)
        if v33 or not l_GuiService_0.SelectedCoreObject or not l_GuiService_0.SelectedCoreObject:IsDescendantOf(v16.Page) then
            if v16.LastSelectedObject then
                l_GuiService_0.SelectedCoreObject = v16.LastSelectedObject;
                return;
            elseif v17 and #v17 > 0 then
                local _ = nil;
                l_GuiService_0.SelectedCoreObject = if type(v17[1].ValueChanger) ~= "table" then v17[1].ValueChanger else v17[1].ValueChanger.SliderFrame and v17[1].ValueChanger.SliderFrame or v17[1].ValueChanger.SelectorFrame;
            end;
        end;
    end;
    v16.Display = function(_, v36, v37) --[[ Line: 342 ]] --[[ Name: Display ]]
        -- upvalues: v16 (copy), v8 (ref), v19 (copy), v22 (copy), v13 (ref), v15 (ref), v14 (ref), l_UserGameSettings_0 (ref), v18 (ref), l_TweenService_0 (ref)
        v16.OpenStateChangedCount = v16.OpenStateChangedCount + 1;
        if v16.TabHeader then
            if v8.UIBloxThemeEnabled then
                v16.TabHeader.TabSelection.Visible = true;
                v19.ImageTransparency = 0;
                v22.TextTransparency = 0;
            else
                v16.TabHeader.TabSelection.Visible = true;
                v16.TabHeader.Icon.ImageTransparency = 0;
                if v13 then
                    v16.TabHeader.Title.TextTransparency = 0;
                else
                    v16.TabHeader.Icon.Title.TextTransparency = 0;
                end;
            end;
        end;
        v16.Page.Parent = v36;
        v16.Page.Visible = true;
        local v38 = UDim2.new(0, 0, 0, 0);
        local function v39() --[[ Line: 368 ]]
            -- upvalues: v15 (ref), v36 (copy), v14 (ref), l_UserGameSettings_0 (ref), v16 (ref), v38 (copy), v18 (ref)
            if v15 then
                v36.InnerCanvasGroupShow.Visible = false;
            end;
            if v14() then
                if l_UserGameSettings_0.ReducedMotion then
                    v36.InnerCanvasGroupShow.GroupTransparency = 0;
                end;
                v16.Page.Position = v38;
            end;
            v16.Page.Visible = true;
            v18 = true;
            v16.Displayed:Fire();
        end;
        if v37 then
            v16.Page.Position = v38;
            if v15 then
                v36.InnerCanvasGroupShow.Visible = false;
            end;
            if v14() then
                if l_UserGameSettings_0.ReducedMotion then
                    v36.InnerCanvasGroupShow.GroupTransparency = 0;
                end;
                v16.Page.Position = v38;
            end;
            v16.Page.Visible = true;
            v18 = true;
            v16.Displayed:Fire();
            return;
        elseif l_UserGameSettings_0.ReducedMotion then
            v16.Page.Position = v38;
            v36.InnerCanvasGroupShow.GroupTransparency = 1;
            if v15 then
                v36.InnerCanvasGroupShow.Visible = true;
            end;
            v16.Page.Parent = v36.InnerCanvasGroupShow;
            v16.Page.Visible = true;
            local v40 = TweenInfo.new(0.25);
            local v41 = {
                GroupTransparency = 0
            };
            local v42 = l_TweenService_0:Create(v36.InnerCanvasGroupShow, v40, v41);
            v42:Play();
            v42.Completed:Connect(function() --[[ Line: 401 ]]
                -- upvalues: v16 (ref), v36 (copy), v15 (ref), v14 (ref), l_UserGameSettings_0 (ref), v38 (copy), v18 (ref)
                v16.Page.Parent = v36;
                if v15 then
                    v36.InnerCanvasGroupShow.Visible = false;
                end;
                if v14() then
                    if l_UserGameSettings_0.ReducedMotion then
                        v36.InnerCanvasGroupShow.GroupTransparency = 0;
                    end;
                    v16.Page.Position = v38;
                end;
                v16.Page.Visible = true;
                v18 = true;
                v16.Displayed:Fire();
            end);
            return;
        else
            v16.Page:TweenPosition(v38, Enum.EasingDirection.In, Enum.EasingStyle.Quad, 0.1, true, v39);
            return;
        end;
    end;
    v16.Hide = function(_, v44, v45, v46, v47, v48, v49) --[[ Line: 409 ]] --[[ Name: Hide ]]
        -- upvalues: v16 (copy), v8 (ref), v19 (copy), v22 (copy), v13 (ref), v15 (ref), v14 (ref), l_UserGameSettings_0 (ref), v18 (ref), l_TweenService_0 (ref)
        v16.OpenStateChangedCount = v16.OpenStateChangedCount + 1;
        if v16.TabHeader then
            if v8.UIBloxThemeEnabled then
                v16.TabHeader.TabSelection.Visible = false;
                v19.ImageTransparency = 0.5;
                v22.TextTransparency = 0.5;
            else
                v16.TabHeader.TabSelection.Visible = false;
                v16.TabHeader.Icon.ImageTransparency = 0.5;
                if v13 then
                    v16.TabHeader.Title.TextTransparency = 0.5;
                else
                    v16.TabHeader.Icon.Title.TextTransparency = 0.5;
                end;
            end;
        end;
        if v16.Page.Parent then
            local v50 = UDim2.new(1 * v44, 0, 0, 0);
            local function v51() --[[ Line: 430 ]]
                -- upvalues: v15 (ref), v48 (copy), v14 (ref), l_UserGameSettings_0 (ref), v16 (ref), v45 (copy), v18 (ref)
                if v15 then
                    v48.InnerCanvasGroupHide.Visible = false;
                elseif v14() and l_UserGameSettings_0.ReducedMotion then
                    v48.InnerCanvasGroupShow.GroupTransparency = 1;
                end;
                v16.Page.Visible = false;
                v16.Page.Position = UDim2.new(v16.TabPosition - v45, 0, 0, 0);
                v18 = false;
                v16.Hidden:Fire();
            end;
            local function v55() --[[ Line: 444 ]]
                -- upvalues: v46 (copy), v16 (ref), v50 (copy), v51 (copy), l_UserGameSettings_0 (ref), v49 (copy), v48 (copy), v15 (ref), l_TweenService_0 (ref)
                if v46 then
                    v16.Page.Position = v50;
                    v51();
                    return;
                elseif l_UserGameSettings_0.ReducedMotion and v49 then
                    v48.InnerCanvasGroupHide.GroupTransparency = 0;
                    if v15 then
                        v48.InnerCanvasGroupHide.Visible = true;
                    end;
                    v16.Page.Parent = v48.InnerCanvasGroupHide;
                    local v52 = TweenInfo.new(0.25);
                    local v53 = {
                        GroupTransparency = 1
                    };
                    local v54 = l_TweenService_0:Create(v48.InnerCanvasGroupHide, v52, v53);
                    v54:Play();
                    v54.Completed:Connect(function() --[[ Line: 462 ]]
                        -- upvalues: v16 (ref), v48 (ref), v50 (ref), v51 (ref)
                        v16.Page.Parent = v48;
                        v16.Page.Position = v50;
                        v51();
                    end);
                    return;
                else
                    v16.Page:TweenPosition(v50, Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.1, true, v51);
                    return;
                end;
            end;
            if v47 then
                local l_OpenStateChangedCount_0 = v16.OpenStateChangedCount;
                delay(v47, function() --[[ Line: 474 ]]
                    -- upvalues: l_OpenStateChangedCount_0 (copy), v16 (ref), v55 (copy)
                    if l_OpenStateChangedCount_0 == v16.OpenStateChangedCount then
                        v55();
                    end;
                end);
                return;
            else
                v55();
            end;
        end;
    end;
    v16.GetDisplayed = function(_) --[[ Line: 485 ]] --[[ Name: GetDisplayed ]]
        -- upvalues: v18 (ref)
        return v18;
    end;
    v16.GetVisibility = function(_) --[[ Line: 489 ]] --[[ Name: GetVisibility ]]
        -- upvalues: v16 (copy)
        return v16.Page.Parent;
    end;
    v16.GetTabHeader = function(_) --[[ Line: 493 ]] --[[ Name: GetTabHeader ]]
        -- upvalues: v16 (copy)
        return v16.TabHeader;
    end;
    v16.SetHub = function(_, v61) --[[ Line: 497 ]] --[[ Name: SetHub ]]
        -- upvalues: v16 (copy), v17 (copy)
        v16.HubRef = v61;
        for _, v63 in next, v17 do
            if type(v63.ValueChanger) == "table" then
                v63.ValueChanger.HubRef = v16.HubRef;
            end;
        end;
    end;
    v16.GetSize = function(_) --[[ Line: 507 ]] --[[ Name: GetSize ]]
        -- upvalues: v16 (copy)
        return v16.Page.AbsoluteSize;
    end;
    v16.AddRow = function(_, v66, v67, v68, v69) --[[ Line: 511 ]] --[[ Name: AddRow ]]
        -- upvalues: v17 (copy), v16 (copy)
        v17[#v17 + 1] = {
            SelectionFrame = v66, 
            Label = v67, 
            ValueChanger = v68
        };
        local v70 = 0;
        if v66 then
            v70 = v66.Size.Y.Offset;
        end;
        if v69 then
            v16.Page.Size = UDim2.new(1, 0, 0, v16.Page.Size.Y.Offset + v70 + v69);
        else
            v16.Page.Size = UDim2.new(1, 0, 0, v16.Page.Size.Y.Offset + v70);
        end;
        if v16.HubRef and type(v68) == "table" then
            v68.HubRef = v16.HubRef;
        end;
    end;
    return v16;
end;
return {
    CreateNewPage = function(_) --[[ Line: 537 ]] --[[ Name: CreateNewPage ]]
        -- upvalues: v71 (copy)
        return (v71());
    end
};