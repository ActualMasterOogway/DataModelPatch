local l_Players_0 = game:GetService("Players");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_Modules_0 = l_RobloxGui_0:WaitForChild("Modules");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_EventIngestService_0 = game:GetService("EventIngestService");
local v7 = require(l_CorePackages_0.Workspace.Packages.Analytics).Analytics.new(l_RbxAnalyticsService_0);
local l_EventIngest_0 = require(l_CorePackages_0.Workspace.Packages.Analytics).AnalyticsReporters.EventIngest;
local v9 = require(l_CorePackages_0.Packages.Roact);
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Settings");
local v11 = require(l_Modules_0.Settings.SettingsPageFactory);
local l_Create_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Create;
local l_ReportAbuseAnalytics_0 = require(l_RobloxGui_0.Modules.AbuseReportMenu).ReportAbuseAnalytics;
local v14 = require(l_script_FirstAncestor_0.Analytics.BlockingAnalytics);
local v15 = require(l_RobloxGui_0.Modules.Flags.GetFFlagReportAbuseThankYouPageSizeFix);
local v16 = require(l_script_FirstAncestor_0.Components.ReportConfirmation.ReportConfirmationScreen);
local v17 = nil;
local function _() --[[ Line: 25 ]]
    -- upvalues: v17 (ref), v9 (copy)
    if v17 ~= nil then
        v9.unmount(v17);
        v17 = nil;
    end;
end;
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
while not l_LocalPlayer_0 do
    l_Players_0.ChildAdded:wait();
    l_LocalPlayer_0 = l_Players_0.LocalPlayer;
end;
local v20 = l_ReportAbuseAnalytics_0.new(l_EventIngest_0.new(l_EventIngestService_0), v7.Diag, l_ReportAbuseAnalytics_0.MenuContexts.LegacySentPage);
local v21 = v14.new(l_LocalPlayer_0.UserId, {
    EventStream = l_RbxAnalyticsService_0
});
local v23 = (function() --[[ Line: 46 ]] --[[ Name: Initialize ]]
    -- upvalues: v11 (copy), l_Create_0 (copy)
    local l_v11_NewPage_0 = v11:CreateNewPage();
    l_v11_NewPage_0.TabHeader = nil;
    l_v11_NewPage_0.PageListLayout.Parent = nil;
    l_v11_NewPage_0.ShouldShowBottomBar = false;
    l_v11_NewPage_0.ShouldShowHubBar = false;
    l_v11_NewPage_0.IsPageClipped = false;
    l_v11_NewPage_0.Page.Name = "ReportSentPageV2";
    l_v11_NewPage_0.Page.Size = UDim2.fromScale(1, 0);
    l_v11_NewPage_0.Page.AutomaticSize = Enum.AutomaticSize.Y;
    l_v11_NewPage_0.Root = l_Create_0("Frame")({
        BackgroundTransparency = 1, 
        Size = UDim2.fromScale(1, 1), 
        Name = "ReportSentContents", 
        Parent = l_v11_NewPage_0.Page
    });
    return l_v11_NewPage_0;
end)();
v23.UpdateMenu = function(v24) --[[ Line: 70 ]] --[[ Name: UpdateMenu ]]
    -- upvalues: v17 (ref), v9 (copy), v15 (copy), v16 (copy), v20 (copy), v21 (copy)
    local l_ReportedPlayer_0 = v24.ReportedPlayer;
    if v17 ~= nil then
        v9.unmount(v17);
        v17 = nil;
    end;
    if v24.settingsShowChangedSignal then
        v24.settingsShowChangedSignal:disconnect();
        v24.settingsShowChangedSignal = nil;
    end;
    v24.settingsShowChangedSignal = v24.HubRef.SettingsShowSignal:connect(function(v26) --[[ Line: 79 ]]
        -- upvalues: v24 (copy)
        if not v26 then
            v24:HandleDone();
        end;
    end);
    local v27 = nil;
    if v15() then
        v27 = Instance.new("BindableEvent");
        v24.SizeChangedSignal = v24.Root:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ Line: 89 ]]
            -- upvalues: v27 (ref), v24 (copy)
            v27:Fire(v24.Root.AbsoluteSize);
        end);
    end;
    local v28 = v9.createElement(v16, {
        player = {
            UserId = l_ReportedPlayer_0.UserId, 
            Name = l_ReportedPlayer_0.Name, 
            DisplayName = l_ReportedPlayer_0.DisplayName
        }, 
        closeMenu = function() --[[ Line: 100 ]] --[[ Name: closeMenu ]]
            -- upvalues: v24 (copy)
            v24:HandleDone();
        end, 
        isVoiceReport = v24.isVoiceReport, 
        ZIndex = v24.HubRef.Shield.ZIndex + 1, 
        reportAbuseAnalytics = v20, 
        blockingAnalytics = v21, 
        onSizeChanged = if v15() then v27.Event else nil
    });
    v17 = v9.mount(v28, v24.Root, "ReportSentPageV2");
end;
v23.ShowReportedPlayer = function(v29, v30, v31) --[[ Line: 113 ]] --[[ Name: ShowReportedPlayer ]]
    -- upvalues: v23 (copy)
    v29.ReportedPlayer = v30;
    v29.isVoiceReport = v31;
    v29:UpdateMenu();
    v29.HubRef:SwitchToPage(v23, true);
end;
v23.HandleDone = function(v32) --[[ Line: 121 ]] --[[ Name: HandleDone ]]
    -- upvalues: v17 (ref), v9 (copy)
    if v17 ~= nil then
        v9.unmount(v17);
        v17 = nil;
    end;
    if v32.settingsShowChangedSignal then
        v32.settingsShowChangedSignal:disconnect();
        v32.settingsShowChangedSignal = nil;
    end;
    if v32.SizeChangedSignal then
        v32.SizeChangedSignal:disconnect();
        v32.SizeChangedSignal = nil;
    end;
    v32.HubRef:SetVisibility(false, true);
end;
return v23;