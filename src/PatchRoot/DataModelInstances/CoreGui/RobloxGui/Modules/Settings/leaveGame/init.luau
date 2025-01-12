local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_GuiService_0 = game:GetService("GuiService");
local l_RunService_0 = game:GetService("RunService");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_Players_0 = game:GetService("Players");
local v7 = require(l_RobloxGui_0.Modules.Flags.FFlagCoreGuiFinalStateAnalytic);
local v8 = require(l_RobloxGui_0.Modules.Common.PerfUtils);
local l_MessageBus_0 = require(l_CorePackages_0.Workspace.Packages.MessageBus).MessageBus;
local v10 = nil;
l_RobloxGui_0:WaitForChild("Modules"):WaitForChild("TenFootInterface");
local v11 = require(l_RobloxGui_0.Modules.Common.Flags.GetFFlagEnableInGameMenuDurationLogger);
local l_GetDefaultQualityLevel_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).GetDefaultQualityLevel;
local l_Constants_0 = require(l_RobloxGui_0.Modules:WaitForChild("InGameMenu"):WaitForChild("Resources"):WaitForChild("Constants"));
return function(v14) --[[ Line: 31 ]]
    -- upvalues: v11 (copy), v8 (copy), l_GuiService_0 (copy), l_RbxAnalyticsService_0 (copy), l_Constants_0 (copy), l_Players_0 (copy), l_MessageBus_0 (copy), v7 (copy), v10 (ref), l_RunService_0 (copy), l_GetDefaultQualityLevel_0 (copy)
    if v11() then
        v8.leavingGame();
    end;
    l_GuiService_0.SelectedCoreObject = nil;
    l_RbxAnalyticsService_0:SetRBXEventStream(l_Constants_0.AnalyticsTargetName, l_Constants_0.AnalyticsInGameMenuName, l_Constants_0.AnalyticsLeaveGameName, {
        confirmed = l_Constants_0.AnalyticsConfirmedName, 
        universeid = tostring(game.GameId), 
        source = l_Constants_0.AnalyticsLeaveGameSource
    });
    if v14 then
        local v15 = {
            chromeSeenCount = tostring(0)
        };
        local v16 = tostring(l_Players_0.LocalPlayer.UserId);
        l_MessageBus_0.publish(l_Constants_0.OnSurveyEventDescriptor, {
            eventType = l_Constants_0.SurveyEventType, 
            userId = v16, 
            customProps = v15
        });
    end;
    if v7 then
        v10 = require(script:FindFirstAncestor("Settings").Analytics.CoreGuiFinalStateAnalytics).new();
        v10:sendCoreGuiFinalAnalytic();
    end;
    l_RunService_0.RenderStepped:wait();
    l_RunService_0.RenderStepped:wait();
    game:Shutdown();
    settings().Rendering.QualityLevel = l_GetDefaultQualityLevel_0();
end;