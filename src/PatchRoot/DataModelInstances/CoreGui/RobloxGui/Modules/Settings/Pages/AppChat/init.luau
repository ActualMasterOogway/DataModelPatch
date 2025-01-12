local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_FFlagUpdateSquadInDefaultAppChatContainer_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagUpdateSquadInDefaultAppChatContainer;
local _ = nil;
return ((function() --[[ Line: 10 ]] --[[ Name: Initialize ]]
    -- upvalues: l_RobloxGui_0 (copy), l_FFlagUpdateSquadInDefaultAppChatContainer_0 (copy)
    local l_NewPage_0 = require(l_RobloxGui_0.Modules.Settings.SettingsPageFactory):CreateNewPage();
    l_NewPage_0.TabHeader = nil;
    l_NewPage_0.ShouldShowBottomBar = false;
    l_NewPage_0.ShouldShowHubBar = false;
    l_NewPage_0.IsPageClipped = true;
    l_NewPage_0.Page.Name = "AppChatPage";
    l_NewPage_0.Page.Size = UDim2.new(1, 0, 0, 0);
    l_NewPage_0.Page.AutomaticSize = Enum.AutomaticSize.Y;
    if l_FFlagUpdateSquadInDefaultAppChatContainer_0 then
        l_NewPage_0.CurrentSquadId = "";
        l_NewPage_0.CurrentSquadIdSignal = Instance.new("BindableEvent");
        l_NewPage_0.SetCurrentSquadId = function(v6) --[[ Line: 27 ]]
            -- upvalues: l_NewPage_0 (copy)
            l_NewPage_0.CurrentSquadId = v6;
            l_NewPage_0.CurrentSquadIdSignal:Fire(v6);
        end;
    end;
    return l_NewPage_0;
end)());