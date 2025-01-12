local l_CoreGui_0 = game:GetService("CoreGui");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_GuiService_0 = game:GetService("GuiService");
local l_RunService_0 = game:GetService("RunService");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_CorePackages_0 = game:GetService("CorePackages");
local v7 = require(l_RobloxGui_0.Modules.Common.PerfUtils);
local v8 = require(l_RobloxGui_0.Modules.Settings.Utility);
local l_LinkingProtocol_0 = require(l_CorePackages_0.Workspace.Packages.LinkingProtocol).LinkingProtocol;
local v10 = require(l_RobloxGui_0.Modules.Settings.Theme);
local l_Create_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Create;
local v12 = nil;
l_RobloxGui_0:WaitForChild("Modules"):WaitForChild("TenFootInterface");
local v13 = require(l_RobloxGui_0.Modules.TenFootInterface):IsEnabled();
local v14 = require(l_RobloxGui_0.Modules.Common.Flags.GetFFlagEnableInGameMenuDurationLogger);
local l_FFlag_0 = settings():GetFFlag("CollectAnalyticsForSystemMenu");
local l_GetDefaultQualityLevel_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).GetDefaultQualityLevel;
local v17 = nil;
if l_FFlag_0 then
    v17 = require(l_RobloxGui_0.Modules:WaitForChild("InGameMenu"):WaitForChild("Resources"):WaitForChild("Constants"));
end;
v12 = (function() --[[ Line: 47 ]] --[[ Name: Initialize ]]
    -- upvalues: l_RobloxGui_0 (copy), v14 (copy), v7 (copy), l_GuiService_0 (copy), l_FFlag_0 (copy), l_RbxAnalyticsService_0 (copy), v17 (ref), l_LinkingProtocol_0 (copy), l_RunService_0 (copy), l_GetDefaultQualityLevel_0 (copy), l_Create_0 (copy), v10 (copy), v13 (copy), v8 (copy)
    local l_NewPage_0 = require(l_RobloxGui_0.Modules.Settings.SettingsPageFactory):CreateNewPage();
    l_NewPage_0.LeaveFunc = function() --[[ Line: 51 ]]
        -- upvalues: v14 (ref), v7 (ref), l_GuiService_0 (ref), l_FFlag_0 (ref), l_RbxAnalyticsService_0 (ref), v17 (ref), l_LinkingProtocol_0 (ref), l_RunService_0 (ref), l_GetDefaultQualityLevel_0 (ref)
        if v14() then
            v7.leavingGame();
        end;
        l_GuiService_0.SelectedCoreObject = nil;
        if l_FFlag_0 then
            l_RbxAnalyticsService_0:SetRBXEventStream(v17.AnalyticsTargetName, v17.AnalyticsInGameMenuName, v17.AnalyticsLeaveGameName, {
                confirmed = v17.AnalyticsConfirmedName, 
                universeid = tostring(game.GameId), 
                source = v17.AnalyticsLeaveToHomeSource
            });
        end;
        l_LinkingProtocol_0.default:detectURL("roblox://navigation/home");
        l_RunService_0.RenderStepped:wait();
        l_RunService_0.RenderStepped:wait();
        game:Shutdown();
        settings().Rendering.QualityLevel = l_GetDefaultQualityLevel_0();
    end;
    l_NewPage_0.DontLeaveFunc = function(v19) --[[ Line: 82 ]]
        -- upvalues: l_NewPage_0 (copy), l_FFlag_0 (ref), l_RbxAnalyticsService_0 (ref), v17 (ref)
        if l_NewPage_0.HubRef then
            l_NewPage_0.HubRef:PopMenu(v19, true);
        end;
        if l_FFlag_0 then
            l_RbxAnalyticsService_0:SetRBXEventStream(v17.AnalyticsTargetName, v17.AnalyticsInGameMenuName, v17.AnalyticsLeaveGameName, {
                confirmed = v17.AnalyticsCancelledName, 
                universeid = tostring(game.GameId), 
                source = v17.AnalyticsLeaveToHomeSource
            });
        end;
    end;
    l_NewPage_0.DontLeaveFromHotkey = function(_, v21, v22) --[[ Line: 100 ]]
        -- upvalues: l_NewPage_0 (copy)
        if v21 == Enum.UserInputState.Begin then
            local v23 = true;
            if v22.UserInputType ~= Enum.UserInputType.Gamepad1 then
                v23 = true;
                if v22.UserInputType ~= Enum.UserInputType.Gamepad2 then
                    v23 = true;
                    if v22.UserInputType ~= Enum.UserInputType.Gamepad3 then
                        v23 = v22.UserInputType == Enum.UserInputType.Gamepad4;
                    end;
                end;
            end;
            l_NewPage_0.DontLeaveFunc(v23);
        end;
    end;
    l_NewPage_0.DontLeaveFromButton = function(v24) --[[ Line: 108 ]]
        -- upvalues: l_NewPage_0 (copy)
        l_NewPage_0.DontLeaveFunc(v24);
    end;
    l_NewPage_0.TabHeader = nil;
    l_NewPage_0.Page.Name = "LeaveGameToHomePage";
    l_NewPage_0.ShouldShowBottomBar = false;
    l_NewPage_0.ShouldShowHubBar = false;
    local v25 = l_Create_0("TextLabel")({
        Name = "LeaveGameText", 
        Text = "Are you sure you want to leave the experience?", 
        Font = v10.font(Enum.Font.SourceSansBold, "Confirmation"), 
        FontSize = v10.fontSize(Enum.FontSize.Size36, "Confirmation"), 
        TextColor3 = Color3.new(1, 1, 1), 
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 0, 200), 
        TextWrapped = true, 
        ZIndex = 2, 
        Parent = l_NewPage_0.Page, 
        Position = v13 and UDim2.new(0, 0, 0, 100) or UDim2.new(0, 0, 0, 0)
    });
    local v26 = l_Create_0("Frame")({
        Name = "LeaveButtonContainer", 
        Parent = v25, 
        Size = UDim2.new(1, 0, 0, 400), 
        BackgroundTransparency = 1, 
        Position = UDim2.new(0, 0, 1, 0)
    });
    local _ = l_Create_0("UIGridLayout")({
        Name = "LeavetButtonsLayout", 
        CellSize = v13 and UDim2.new(0, 300, 0, 80) or UDim2.new(0, 200, 0, 50), 
        CellPadding = UDim2.new(0, 20, 0, 20), 
        FillDirection = Enum.FillDirection.Horizontal, 
        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
        SortOrder = Enum.SortOrder.LayoutOrder, 
        VerticalAlignment = Enum.VerticalAlignment.Top, 
        Parent = v26
    });
    if v8:IsSmallTouchScreen() then
        v25.FontSize = Enum.FontSize.Size24;
        v25.Size = UDim2.new(1, 0, 0, 100);
    elseif v13 then
        v25.FontSize = Enum.FontSize.Size48;
    end;
    l_NewPage_0.LeaveGameButton = v8:MakeStyledButton("LeaveGame", "Leave", nil, l_NewPage_0.LeaveFunc);
    l_NewPage_0.LeaveGameButton.NextSelectionRight = nil;
    l_NewPage_0.LeaveGameButton.Parent = v26;
    local v28 = v8:MakeStyledButton("DontLeaveGame", "Don't Leave", nil, l_NewPage_0.DontLeaveFromButton);
    v28.NextSelectionLeft = nil;
    v28.Parent = v26;
    l_NewPage_0.Page.Size = UDim2.new(1, 0, 0, v28.AbsolutePosition.Y + v28.AbsoluteSize.Y);
    return l_NewPage_0;
end)();
v12.Displayed.Event:connect(function() --[[ Line: 184 ]]
    -- upvalues: l_GuiService_0 (copy), v12 (ref), l_ContextActionService_0 (copy)
    l_GuiService_0.SelectedCoreObject = v12.LeaveGameButton;
    l_ContextActionService_0:BindCoreAction("LeaveGameCancelAction", v12.DontLeaveFromHotkey, false, Enum.KeyCode.ButtonB);
end);
v12.Hidden.Event:connect(function() --[[ Line: 189 ]]
    -- upvalues: l_ContextActionService_0 (copy)
    l_ContextActionService_0:UnbindCoreAction("LeaveGameCancelAction");
end);
return v12;