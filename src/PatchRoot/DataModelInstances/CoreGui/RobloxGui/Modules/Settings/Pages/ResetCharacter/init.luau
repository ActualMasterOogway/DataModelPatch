local l_CoreGui_0 = game:GetService("CoreGui");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_GuiService_0 = game:GetService("GuiService");
local l_Players_0 = game:GetService("Players");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_CorePackages_0 = game:GetService("CorePackages");
local v7 = require(l_RobloxGui_0.Modules.Settings.Utility);
local v8 = require(l_RobloxGui_0.Modules.Settings.Theme);
local l_Create_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Create;
local v10 = nil;
l_RobloxGui_0:WaitForChild("Modules"):WaitForChild("TenFootInterface");
local v11 = require(l_RobloxGui_0.Modules.TenFootInterface):IsEnabled();
local l_Constants_0 = require(l_RobloxGui_0.Modules:WaitForChild("InGameMenu"):WaitForChild("Resources"):WaitForChild("Constants"));
v10 = (function() --[[ Line: 35 ]] --[[ Name: Initialize ]]
    -- upvalues: l_RobloxGui_0 (copy), l_RbxAnalyticsService_0 (copy), l_Constants_0 (copy), l_Create_0 (copy), v8 (copy), v11 (copy), v7 (copy), l_Players_0 (copy)
    local l_NewPage_0 = require(l_RobloxGui_0.Modules.Settings.SettingsPageFactory):CreateNewPage();
    l_NewPage_0.DontResetCharFunc = function(v14) --[[ Line: 39 ]]
        -- upvalues: l_RbxAnalyticsService_0 (ref), l_Constants_0 (ref), l_NewPage_0 (copy)
        l_RbxAnalyticsService_0:SetRBXEventStream(l_Constants_0.AnalyticsTargetName, l_Constants_0.AnalyticsInGameMenuName, l_Constants_0.AnalyticsRespawnCharacterName, {
            confirmed = l_Constants_0.AnalyticsCancelledName, 
            universeid = tostring(game.GameId)
        });
        if l_NewPage_0.HubRef then
            l_NewPage_0.HubRef:PopMenu(v14, true);
        end;
    end;
    l_NewPage_0.DontResetCharFromHotkey = function(_, v16, v17) --[[ Line: 47 ]]
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
            l_NewPage_0.DontResetCharFunc(v18);
        end;
    end;
    l_NewPage_0.DontResetCharFromButton = function(v19) --[[ Line: 55 ]]
        -- upvalues: l_NewPage_0 (copy)
        l_NewPage_0.DontResetCharFunc(v19);
    end;
    l_NewPage_0.TabHeader = nil;
    l_NewPage_0.Page.Name = "ResetCharacter";
    l_NewPage_0.ShouldShowBottomBar = false;
    l_NewPage_0.ShouldShowHubBar = false;
    local v20 = l_Create_0("TextLabel")({
        Name = "ResetCharacterText", 
        Text = "Are you sure you want to reset your character?", 
        Font = v8.font(Enum.Font.SourceSansBold, "Confirmation"), 
        FontSize = v8.fontSize(Enum.FontSize.Size36, "Confirmation"), 
        TextColor3 = Color3.new(1, 1, 1), 
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 0, 200), 
        TextWrapped = true, 
        ZIndex = 2, 
        Parent = l_NewPage_0.Page, 
        Position = v11 and UDim2.new(0, 0, 0, 100) or UDim2.new(0, 0, 0, 0)
    });
    local v21 = l_Create_0("Frame")({
        Name = "ResetButtonContainer", 
        Parent = v20, 
        Size = UDim2.new(1, 0, 0, 400), 
        BackgroundTransparency = 1, 
        Position = UDim2.new(0, 0, 1, 0)
    });
    local _ = l_Create_0("UIGridLayout")({
        Name = "ResetButtonsLayout", 
        CellSize = v11 and UDim2.new(0, 300, 0, 80) or UDim2.new(0, 200, 0, 50), 
        CellPadding = UDim2.new(0, 20, 0, 20), 
        FillDirection = Enum.FillDirection.Horizontal, 
        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
        SortOrder = Enum.SortOrder.LayoutOrder, 
        VerticalAlignment = Enum.VerticalAlignment.Top, 
        Parent = v21
    });
    if v7:IsSmallTouchScreen() then
        v20.FontSize = Enum.FontSize.Size24;
        v20.Size = UDim2.new(1, 0, 0, 100);
    elseif v11 then
        v20.FontSize = Enum.FontSize.Size48;
    end;
    local function v26() --[[ Line: 111 ]]
        -- upvalues: l_Players_0 (ref), l_RbxAnalyticsService_0 (ref), l_Constants_0 (ref)
        local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
        if l_LocalPlayer_0 then
            local l_Character_0 = l_LocalPlayer_0.Character;
            if l_Character_0 then
                local l_Humanoid_0 = l_Character_0:FindFirstChild("Humanoid");
                if l_Humanoid_0 then
                    l_Humanoid_0.Health = 0;
                end;
            end;
        end;
        l_RbxAnalyticsService_0:SetRBXEventStream(l_Constants_0.AnalyticsTargetName, l_Constants_0.AnalyticsInGameMenuName, l_Constants_0.AnalyticsRespawnCharacterName, {
            confirmed = l_Constants_0.AnalyticsConfirmedName, 
            universeid = tostring(game.GameId)
        });
        l_RbxAnalyticsService_0:ReportCounter("InGameMenu-ResetCharacter");
    end;
    l_NewPage_0.ResetBindable = true;
    l_NewPage_0.ResetCharacterButton = v7:MakeStyledButton("ResetCharacter", "Reset", nil, function() --[[ Line: 130 ]]
        -- upvalues: l_NewPage_0 (copy), v26 (copy)
        if l_NewPage_0.ResetBindable == true then
            v26();
        elseif l_NewPage_0.ResetBindable then
            l_NewPage_0.ResetBindable:Fire();
        end;
        if l_NewPage_0.HubRef then
            l_NewPage_0.HubRef:SetVisibility(false, true);
        end;
    end);
    l_NewPage_0.ResetCharacterButton.NextSelectionRight = nil;
    l_NewPage_0.ResetCharacterButton.Parent = v21;
    local v27 = v7:MakeStyledButton("DontResetCharacter", "Don't Reset", nil, l_NewPage_0.DontResetCharFromButton);
    v27.NextSelectionLeft = nil;
    v27.Parent = v21;
    l_NewPage_0.Page.Size = UDim2.new(1, 0, 0, v27.AbsolutePosition.Y + v27.AbsoluteSize.Y);
    return l_NewPage_0;
end)();
local v28 = false;
v10.Displayed.Event:connect(function() --[[ Line: 160 ]]
    -- upvalues: v28 (ref), l_GuiService_0 (copy), v10 (ref), l_ContextActionService_0 (copy)
    v28 = true;
    l_GuiService_0.SelectedCoreObject = v10.ResetCharacterButton;
    l_ContextActionService_0:BindCoreAction("ResetCharacterAction", v10.DontResetCharFromHotkey, false, Enum.KeyCode.ButtonB);
end);
v10.Hidden.Event:connect(function() --[[ Line: 166 ]]
    -- upvalues: v28 (ref), l_ContextActionService_0 (copy)
    v28 = false;
    l_ContextActionService_0:UnbindCoreAction("ResetCharacterAction");
end);
v10.SetResetCallback = function(_, v30) --[[ Line: 171 ]] --[[ Name: SetResetCallback ]]
    -- upvalues: v28 (ref), v10 (ref)
    if v30 == false and v28 then
        v10.HubRef:PopMenu(nil, true);
    end;
    v10.ResetBindable = v30;
end;
return v10;