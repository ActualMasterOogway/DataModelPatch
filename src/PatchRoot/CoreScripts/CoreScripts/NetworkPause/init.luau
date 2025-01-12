local l_Players_0 = game:GetService("Players");
local l_CoreGui_0 = game:GetService("CoreGui");
local _ = game:GetService("StarterGui");
local l_RunService_0 = game:GetService("RunService");
local l_GuiService_0 = game:GetService("GuiService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
while not l_LocalPlayer_0 do
    wait();
    l_LocalPlayer_0 = l_Players_0.LocalPlayer;
end;
local v8 = require(l_Modules_0.NetworkPauseNotification);
local l_Create_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Create;
local v10 = game:DefineFastFlag("GameplayPausePausesInteraction", false);
local v11 = true;
local v12 = v8.new();
local v13 = v10 and l_Create_0("Frame")({
    Name = "Container", 
    Size = UDim2.new(1, 0, 1, 0), 
    BackgroundTransparency = 1, 
    Active = false
});
local v14 = l_Create_0("ScreenGui")({
    Name = "RobloxNetworkPauseNotification", 
    OnTopOfCoreBlur = true, 
    DisplayOrder = 8, 
    Parent = l_CoreGui_0, 
    IgnoreGuiInset = v10, 
    AutoLocalize = false; 
    v13
});
local function v16() --[[ Line: 57 ]] --[[ Name: togglePauseState ]]
    -- upvalues: l_LocalPlayer_0 (ref), v14 (copy), v11 (ref), v12 (copy), v10 (copy), v13 (copy), l_RunService_0 (copy)
    local v15 = l_LocalPlayer_0.GameplayPaused and v14.Enabled and not v11;
    v11 = false;
    if v15 then
        v12:Show();
    else
        v12:Hide();
    end;
    if v10 then
        v13.Active = v15;
    end;
    l_RunService_0:SetRobloxGuiFocused(v15);
end;
l_LocalPlayer_0:GetPropertyChangedSignal("GameplayPaused"):Connect(v16);
local function v19(v17) --[[ Line: 73 ]] --[[ Name: enableNotification ]]
    -- upvalues: v14 (copy), l_LocalPlayer_0 (ref), v11 (ref), v12 (copy), v10 (copy), v13 (copy), l_RunService_0 (copy)
    assert(type(v17) == "boolean", "Specified argument 'enabled' must be of type boolean");
    if v17 == v14.Enabled then
        return;
    else
        v14.Enabled = v17;
        local v18 = l_LocalPlayer_0.GameplayPaused and v14.Enabled and not v11;
        v11 = false;
        if v18 then
            v12:Show();
        else
            v12:Hide();
        end;
        if v10 then
            v13.Active = v18;
        end;
        l_RunService_0:SetRobloxGuiFocused(v18);
        return;
    end;
end;
if v10 then
    v12:SetParent(v13);
else
    v12:SetParent(v14);
end;
l_GuiService_0.NetworkPausedEnabledChanged:Connect(v19);