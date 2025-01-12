local l_CorePackages_0 = game:GetService("CorePackages");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Chrome");
local v2 = require(l_script_FirstAncestor_0.Service);
local l_GetFFlagAppChatAddConnectUnibarForActiveSquad_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagAppChatAddConnectUnibarForActiveSquad;
local l_InExperienceAppChatModal_0 = require(l_CorePackages_0.Workspace.Packages.AppChat).App.InExperienceAppChatModal;
local v5 = require(script.Parent.registerConnectIntegration);
local v6 = require(script.Parent.isConnectUnibarEnabled);
local v7 = require(script.Parent.isConnectDropdownEnabled);
local v8 = nil;
if v6() then
    local v9 = l_GetFFlagAppChatAddConnectUnibarForActiveSquad_0() and v7();
    v8 = v5("connect_unibar", if v9 then v2.AvailabilitySignal.Unavailable else v2.AvailabilitySignal.Pinned);
    if v9 then
        if l_InExperienceAppChatModal_0.default.currentSquadId ~= "" then
            v8.availability:pinned();
        end;
        l_InExperienceAppChatModal_0.default.currentSquadIdSignal.Event:Connect(function(v10) --[[ Line: 43 ]]
            -- upvalues: v8 (ref)
            if v10 == "" then
                v8.availability:unavailable();
                return;
            else
                v8.availability:pinned();
                return;
            end;
        end);
    end;
end;
return v8;