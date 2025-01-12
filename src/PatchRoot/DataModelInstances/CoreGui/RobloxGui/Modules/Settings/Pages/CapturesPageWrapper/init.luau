local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_Modules_0 = l_RobloxGui_0.Modules;
local v2 = require(l_Modules_0.RobloxTranslator);
local v3 = require(l_Modules_0.Settings.SettingsPageFactory);
local v4 = require(l_Modules_0.Settings.Theme);
local v5 = require(l_RobloxGui_0.Modules.Chrome.Enabled)();
local v6 = nil;
local l_status_0, l_result_0 = pcall(function() --[[ Line: 20 ]]
    return settings():GetFFlag("UseNotificationsLocalization");
end);
v6 = l_status_0 and l_result_0;
l_status_0 = require(script.Parent.Parent.Flags.GetFFlagFixIGMTabTransitions);
l_result_0 = v3:CreateNewPage();
l_result_0.TabHeader.Name = "CapturesTab";
if v4.UIBloxThemeEnabled then
    local v9 = if v5 then v4.Images["icons/controls/cameraOff"] else v4.Images["icons/controls/screenshot"];
    l_result_0.TabHeader.TabLabel.Icon.Image = v9.Image;
    l_result_0.TabHeader.TabLabel.Icon.ImageRectOffset = v9.ImageRectOffset;
    l_result_0.TabHeader.TabLabel.Icon.ImageRectSize = v9.ImageRectSize;
    l_result_0.TabHeader.TabLabel.Title.AutoLocalize = false;
    l_result_0.TabHeader.TabLabel.Title.Text = v2:FormatByKey("Feature.SettingsHub.Label.Captures");
else
    l_result_0.TabHeader.Icon.Image = "rbxasset://textures/ui/Settings/MenuBarIcons/CaptureTab.png";
    if v6 then
        l_result_0.TabHeader.Title.AutoLocalize = false;
        l_result_0.TabHeader.Title.Text = v2:FormatByKey("Feature.SettingsHub.Label.Captures");
    else
        l_result_0.TabHeader.Icon.Title.AutoLocalize = false;
        l_result_0.TabHeader.Icon.Title.Text = v2:FormatByKey("Feature.SettingsHub.Label.Captures");
    end;
end;
l_result_0.PageListLayout.Parent = nil;
l_result_0.ShouldShowBottomBar = true;
l_result_0.ShouldShowHubBar = true;
l_result_0.Page.Name = "Captures";
l_result_0.Page.Size = UDim2.fromScale(1, 0);
local l_UIPadding_0 = l_result_0.Page:FindFirstChildWhichIsA("UIPadding");
if l_UIPadding_0 then
    l_UIPadding_0:Destroy();
end;
l_result_0.ConnectHubToApp = function(_, v12, v13, v14) --[[ Line: 69 ]] --[[ Name: ConnectHubToApp ]]
    -- upvalues: l_result_0 (copy), l_status_0 (copy)
    l_result_0:SetHub(v12);
    local v15 = v13.AbsoluteSize.Y - 20;
    l_result_0.Page.Size = UDim2.new(1, 0, 0, v15);
    v13:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ Line: 74 ]]
        -- upvalues: v15 (ref), v13 (copy), l_result_0 (ref)
        v15 = v13.AbsoluteSize.Y - 20;
        l_result_0.Page.Size = UDim2.new(1, 0, 0, v15);
    end);
    local l_Display_0 = l_result_0.Display;
    l_result_0.Display = function(_, ...) --[[ Line: 80 ]] --[[ Name: Display ]]
        -- upvalues: v14 (copy), l_Display_0 (copy), l_result_0 (ref)
        v14.openMenu();
        l_Display_0(l_result_0, ...);
    end;
    l_result_0.Hidden.Event:Connect(function() --[[ Line: 85 ]]
        -- upvalues: l_status_0 (ref), v14 (copy)
        if not l_status_0() then
            v14.closeMenu();
        end;
    end);
    local l_Hide_0 = l_result_0.Hide;
    l_result_0.Hide = function(_, ...) --[[ Line: 94 ]] --[[ Name: Hide ]]
        -- upvalues: l_status_0 (ref), v14 (copy), l_Hide_0 (copy), l_result_0 (ref)
        if l_status_0() then
            v14.closeMenu();
        end;
        l_Hide_0(l_result_0, ...);
    end;
end;
return l_result_0;