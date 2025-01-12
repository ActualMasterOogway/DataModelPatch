local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local v1 = require(l_RobloxGui_0.Modules.Common.IXPServiceWrapper);
local l_Players_0 = game:GetService("Players");
local v3 = {
    enabled = true, 
    inSortingExperiment = false, 
    inEntryExperiment = false
};
if game:DefineFastFlag("EnableReportAbuseMenuLayerOnV3", false) then
    local v4 = game:DefineFastString("ReportAbuseMenuLayerOnV3Layer", "Social.VoiceAbuseReport.ReportAbuseMenu.V1");
    local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    local v6 = 0;
    while not l_LocalPlayer_0 do
        l_Players_0:GetPropertyChangedSignal("LocalPlayer"):Wait();
        l_LocalPlayer_0 = l_Players_0.LocalPlayer;
        v6 = l_LocalPlayer_0 and l_LocalPlayer_0.UserId or 0;
    end;
    v1:InitializeAsync(v6, v4);
    local l_v1_LayerData_0 = v1:GetLayerData(v4);
    if l_v1_LayerData_0 then
        v3.inSortingExperiment = l_v1_LayerData_0.VoiceAbuseReportProximitySort;
        v3.inEntryExperiment = l_v1_LayerData_0.VoiceAbuseReportSmartEntry;
        v3.enabled = not l_v1_LayerData_0.VoiceAbuseReportDisabled;
        return v3;
    else
        v3.enabled = false;
    end;
end;
return v3;