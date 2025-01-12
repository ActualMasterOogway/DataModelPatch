local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_GuiService_0 = game:GetService("GuiService");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local v6 = require(l_RobloxGui_0.Modules.Settings.Utility);
local v7 = require(l_RobloxGui_0.Modules.Settings.leaveGame);
local l_Create_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Create;
local v9 = nil;
l_RobloxGui_0:WaitForChild("Modules"):WaitForChild("TenFootInterface");
local v10 = require(l_RobloxGui_0.Modules.TenFootInterface):IsEnabled();
local l_Constants_0 = require(l_RobloxGui_0.Modules:WaitForChild("InGameMenu"):WaitForChild("Resources"):WaitForChild("Constants"));
local v12 = require(l_RobloxGui_0.Modules.Settings.Theme);
v9 = (function() --[[ Line: 37 ]] --[[ Name: Initialize ]]
    -- upvalues: l_RobloxGui_0 (copy), l_RbxAnalyticsService_0 (copy), l_Constants_0 (copy), l_Create_0 (copy), v12 (copy), v10 (copy), v6 (copy), v7 (copy)
    local l_NewPage_0 = require(l_RobloxGui_0.Modules.Settings.SettingsPageFactory):CreateNewPage();
    l_NewPage_0.DontLeaveFunc = function(v14) --[[ Line: 41 ]]
        -- upvalues: l_NewPage_0 (copy), l_RbxAnalyticsService_0 (ref), l_Constants_0 (ref)
        if l_NewPage_0.HubRef then
            l_NewPage_0.HubRef:PopMenu(v14, true);
        end;
        l_RbxAnalyticsService_0:SetRBXEventStream(l_Constants_0.AnalyticsTargetName, l_Constants_0.AnalyticsInGameMenuName, l_Constants_0.AnalyticsLeaveGameName, {
            confirmed = l_Constants_0.AnalyticsCancelledName, 
            universeid = tostring(game.GameId), 
            source = l_Constants_0.AnalyticsLeaveGameSource
        });
    end;
    l_NewPage_0.DontLeaveFromHotkey = function(_, v16, v17) --[[ Line: 57 ]]
        -- upvalues: l_NewPage_0 (copy)
        if v16 == Enum.UserInputState.Begin then
            local v18 = true;
            if v17.UserInputType ~= Enum.UserInputType.Gamepad1 then
                v18 = true;
                if v17.UserInputType ~= Enum.UserInputType.Gamepad2 then
                    v18 = true;
                    if v17.UserInputType ~= Enum.UserInputType.Gamepad3 then
                        v18 = v17.UserInputType == Enum.UserInputType.Gamepad4;
                    end;
                end;
            end;
            l_NewPage_0.DontLeaveFunc(v18);
        end;
    end;
    l_NewPage_0.DontLeaveFromButton = function(v19) --[[ Line: 65 ]]
        -- upvalues: l_NewPage_0 (copy)
        l_NewPage_0.DontLeaveFunc(v19);
    end;
    l_NewPage_0.TabHeader = nil;
    l_NewPage_0.Page.Name = "LeaveGamePage";
    l_NewPage_0.ShouldShowBottomBar = false;
    l_NewPage_0.ShouldShowHubBar = false;
    local v20 = l_Create_0("TextLabel")({
        Name = "LeaveGameText", 
        Text = "Are you sure you want to leave the experience?", 
        Font = v12.font(Enum.Font.SourceSansBold, "Confirmation"), 
        FontSize = v12.fontSize(Enum.FontSize.Size36, "Confirmation"), 
        TextColor3 = Color3.new(1, 1, 1), 
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 0, 200), 
        TextWrapped = true, 
        ZIndex = 2, 
        Parent = l_NewPage_0.Page, 
        Position = v10 and UDim2.new(0, 0, 0, 100) or UDim2.new(0, 0, 0, 0)
    });
    local v21 = l_Create_0("Frame")({
        Name = "LeaveButtonContainer", 
        Parent = v20, 
        Size = UDim2.new(1, 0, 0, 400), 
        BackgroundTransparency = 1, 
        Position = UDim2.new(0, 0, 1, 0)
    });
    local _ = l_Create_0("UIGridLayout")({
        Name = "LeavetButtonsLayout", 
        CellSize = v10 and UDim2.new(0, 300, 0, 80) or UDim2.new(0, 200, 0, 50), 
        CellPadding = UDim2.new(0, 20, 0, 20), 
        FillDirection = Enum.FillDirection.Horizontal, 
        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
        SortOrder = Enum.SortOrder.LayoutOrder, 
        VerticalAlignment = Enum.VerticalAlignment.Top, 
        Parent = v21
    });
    if v6:IsSmallTouchScreen() then
        v20.FontSize = Enum.FontSize.Size24;
        v20.Size = UDim2.new(1, 0, 0, 100);
    elseif v10 then
        v20.FontSize = Enum.FontSize.Size48;
    end;
    l_NewPage_0.LeaveGameButton = v6:MakeStyledButton("LeaveGame", "Leave", nil, function() --[[ Line: 122 ]]
        -- upvalues: v7 (ref)
        v7(true);
    end);
    l_NewPage_0.LeaveGameButton.NextSelectionRight = nil;
    l_NewPage_0.LeaveGameButton.Parent = v21;
    local v23 = v6:MakeStyledButton("DontLeaveGame", "Don't Leave", nil, l_NewPage_0.DontLeaveFromButton);
    v23.NextSelectionLeft = nil;
    v23.Parent = v21;
    l_NewPage_0.Page.Size = UDim2.new(1, 0, 0, v23.AbsolutePosition.Y + v23.AbsoluteSize.Y);
    return l_NewPage_0;
end)();
v9.Displayed.Event:connect(function() --[[ Line: 141 ]]
    -- upvalues: l_GuiService_0 (copy), v9 (ref), l_ContextActionService_0 (copy)
    l_GuiService_0.SelectedCoreObject = v9.LeaveGameButton;
    l_ContextActionService_0:BindCoreAction("LeaveGameCancelAction", v9.DontLeaveFromHotkey, false, Enum.KeyCode.ButtonB);
end);
v9.Hidden.Event:connect(function() --[[ Line: 146 ]]
    -- upvalues: l_ContextActionService_0 (copy)
    l_ContextActionService_0:UnbindCoreAction("LeaveGameCancelAction");
end);
return v9;