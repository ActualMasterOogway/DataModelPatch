local l_Players_0 = game:GetService("Players");
local l_GameSettings_0 = UserSettings().GameSettings;
local l_CoreGui_0 = game:GetService("CoreGui");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local v4 = require(l_CoreGui_0.RobloxGui.Modules.Stats.StatsAggregatorManager);
local v5 = require(l_CoreGui_0.RobloxGui.Modules.Stats.StatsButton);
local v6 = require(l_CoreGui_0.RobloxGui.Modules.Stats.StatsUtils);
local v7 = require(l_CoreGui_0.RobloxGui.Modules.Stats.StatsViewer);
local l_Frame_0 = Instance.new("Frame");
l_Frame_0.Name = "PerformanceStats";
local v9 = v4.getSingleton();
local v10 = v7.new();
local v11 = {};
local v12 = nil;
local v13 = nil;
for _, v15 in ipairs(v6.AllStatTypes) do
    v11[v15] = v5.new(v15);
end;
ShowMasterFrame = function() --[[ Line: 40 ]] --[[ Name: ShowMasterFrame ]]
    -- upvalues: l_Frame_0 (copy), l_CoreGui_0 (copy)
    l_Frame_0.Visible = true;
    l_Frame_0.Parent = l_CoreGui_0.RobloxGui;
end;
HideMasterFrame = function() --[[ Line: 45 ]] --[[ Name: HideMasterFrame ]]
    -- upvalues: l_Frame_0 (copy)
    l_Frame_0.Visible = false;
    l_Frame_0.Parent = nil;
end;
ConfigureMasterFrame = function() --[[ Line: 51 ]] --[[ Name: ConfigureMasterFrame ]]
    -- upvalues: l_Frame_0 (copy)
    l_Frame_0.Position = UDim2.new(0, 0, 0, 0);
    l_Frame_0.Size = UDim2.new(1, 0, 1, 0);
    l_Frame_0.Selectable = false;
    l_Frame_0.BackgroundTransparency = 1;
    l_Frame_0.Active = false;
    l_Frame_0.ZIndex = 0;
    HideMasterFrame();
end;
ConfigureStatButtonsInMasterFrame = function() --[[ Line: 69 ]] --[[ Name: ConfigureStatButtonsInMasterFrame ]]
    -- upvalues: v6 (copy)
    for v16, v17 in ipairs(v6.AllStatTypes) do
        AddButton(v17, v16);
    end;
end;
OnButtonToggled = function(v18) --[[ Line: 76 ]] --[[ Name: OnButtonToggled ]]
    -- upvalues: v11 (copy), v12 (ref)
    if not v11[v18]._isSelected then
        v12 = v18;
    else
        v12 = nil;
    end;
    UpdateButtonSelectedStates();
    UpdateViewerVisibility();
end;
UpdateButtonSelectedStates = function() --[[ Line: 91 ]] --[[ Name: UpdateButtonSelectedStates ]]
    -- upvalues: v6 (copy), v11 (copy), v12 (ref)
    for _, v20 in ipairs(v6.AllStatTypes) do
        v11[v20]:SetIsSelected(v20 == v12);
    end;
end;
UpdateViewerVisibility = function() --[[ Line: 98 ]] --[[ Name: UpdateViewerVisibility ]]
    -- upvalues: v12 (ref), v10 (copy), v9 (copy), l_RbxAnalyticsService_0 (copy)
    if v12 == nil then
        if v10:GetIsVisible() then
            v10:SetVisible(false);
            v10:SetStatsAggregator(nil);
            return;
        end;
    else
        local v21 = false;
        if not v10:GetIsVisible() then
            v21 = true;
            v10:SetVisible(true);
        end;
        if v12 ~= v10:GetStatType() then
            v10:SetStatType(v12);
            v10:SetStatsAggregator(v9:GetAggregator(v12));
            v21 = true;
        end;
        if v21 then
            l_RbxAnalyticsService_0:TrackEvent("Game", "Enlarge PerfStat", v12, 0);
        end;
    end;
end;
AddButton = function(v22, v23) --[[ Line: 127 ]] --[[ Name: AddButton ]]
    -- upvalues: v11 (copy), l_Frame_0 (copy), v9 (copy), v6 (copy)
    local v24 = v11[v22];
    v24:SetParent(l_Frame_0);
    v24:SetStatsAggregator(v9:GetAggregator(v22));
    local v25 = 1 / v6.NumButtonTypes;
    v24:SetSizeAndPosition(UDim2.new(v25, 0, 0, v6.ButtonHeight), (UDim2.new(v25 * (v23 - 1), 0, 0, 0)));
    v24:SetToggleCallbackFunction(OnButtonToggled);
end;
ConfigureStatViewerInMasterFrame = function() --[[ Line: 146 ]] --[[ Name: ConfigureStatViewerInMasterFrame ]]
    -- upvalues: v10 (copy), l_Frame_0 (copy), v6 (copy)
    v10:SetParent(l_Frame_0);
    local v26 = UDim2.new(0, v6.ViewerWidth, 0, v6.ViewerHeight);
    local v27 = UDim2.new(1, -v6.ViewerWidth, 0, v6.ButtonHeight + v6.ViewerTopMargin);
    v10:SetSizeAndPosition(v26, v27);
end;
UpdatePerformanceStatsVisibility = function() --[[ Line: 157 ]] --[[ Name: UpdatePerformanceStatsVisibility ]]
    -- upvalues: v6 (copy), l_Frame_0 (copy), v10 (copy), v11 (copy), l_RbxAnalyticsService_0 (copy), v13 (ref)
    local v28 = v6.PerformanceStatsShouldBeVisible();
    if v28 == l_Frame_0.Visible then
        return;
    else
        if v28 then
            ShowMasterFrame();
        else
            HideMasterFrame();
        end;
        v10:OnPerformanceStatsShouldBeVisibleChanged();
        for _, v30 in ipairs(v6.AllStatTypes) do
            v11[v30]:OnPerformanceStatsShouldBeVisibleChanged();
        end;
        local v31 = "Hide PerfStats";
        if v28 then
            v31 = "Show PerfStats";
        end;
        l_RbxAnalyticsService_0:TrackEvent("Game", v31, "", 0);
        if v28 then
            v13 = time();
            l_RbxAnalyticsService_0:ReportCounter("OpenPerformanceProfiler", 1);
            return;
        else
            if v13 then
                local v32 = time() - v13;
                l_RbxAnalyticsService_0:ReportStats("TimeOpenPerformanceProfiler", v32);
            end;
            return;
        end;
    end;
end;
ConfigureMasterFrame();
ConfigureStatButtonsInMasterFrame();
ConfigureStatViewerInMasterFrame();
l_GameSettings_0.PerformanceStatsVisibleChanged:connect(UpdatePerformanceStatsVisibility);
UpdateButtonSelectedStates();
UpdateViewerVisibility();
UpdatePerformanceStatsVisibility();
spawn(function() --[[ Line: 216 ]]
    -- upvalues: l_Players_0 (copy)
    local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    while not l_LocalPlayer_0 do
        l_Players_0.PlayerAdded:wait();
        l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    end;
    UpdatePerformanceStatsVisibility();
end);