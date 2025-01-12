local l_CorePackages_0 = game:GetService("CorePackages");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Chrome");
local v2 = require(l_script_FirstAncestor_0.Service);
local l_GetFFlagAppChatAddConnectUnibarForActiveSquad_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagAppChatAddConnectUnibarForActiveSquad;
local l_InExperienceAppChatModal_0 = require(l_CorePackages_0.Workspace.Packages.AppChat).App.InExperienceAppChatModal;
local v5 = require(script.Parent.registerConnectIntegration);
local v6 = require(script.Parent.isConnectDropdownEnabled);
local v7 = nil;
if v6() then
    v7 = v5("connect_dropdown", v2.AvailabilitySignal.Available);
    if l_GetFFlagAppChatAddConnectUnibarForActiveSquad_0() then
        if l_InExperienceAppChatModal_0.default.currentSquadId ~= "" then
            v7.availability:unavailable();
        end;
        l_InExperienceAppChatModal_0.default.currentSquadIdSignal.Event:Connect(function(v8) --[[ Line: 27 ]]
            -- upvalues: v7 (ref)
            if v8 == "" then
                v7.availability:available();
                return;
            else
                v7.availability:unavailable();
                return;
            end;
        end);
    end;
end;
return v7;