local l_script_FirstAncestor_0 = script:FindFirstAncestor("Chrome");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_StarterGui_0 = game:GetService("StarterGui");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v4 = require(l_RobloxGui_0.Modules.Captures.CapturesApp);
local v5 = require(l_script_FirstAncestor_0.Service);
local v6 = require(l_script_FirstAncestor_0.ChromeShared.Service.ChromeUtils);
local v7 = require(l_script_FirstAncestor_0.Integrations.CommonIcon);
local l_MappedSignal_0 = v6.MappedSignal;
local v9 = require(l_script_FirstAncestor_0.Flags.GetFFlagFixCapturesAvailability);
local v10 = require(l_script_FirstAncestor_0.Flags.GetFFlagAddChromeActivatedEvents);
local l_Available_0 = v5.AvailabilitySignal.Available;
l_Available_0 = if not not l_StarterGui_0:GetCoreGuiEnabled(Enum.CoreGuiType.All) or l_StarterGui_0:GetCoreGuiEnabled(Enum.CoreGuiType.Captures) then v5.AvailabilitySignal.Available else v5.AvailabilitySignal.Unavailable;
local v12 = l_MappedSignal_0.new(v4.onIsActiveChanged, function() --[[ Line: 23 ]]
    -- upvalues: v4 (copy)
    return v4.getIsActive();
end);
local v15 = v5:register({
    initialAvailability = l_Available_0, 
    id = "camera_entrypoint", 
    label = "Feature.SettingsHub.Label.Captures", 
    activated = function(_) --[[ Line: 31 ]] --[[ Name: activated ]]
        -- upvalues: v4 (copy)
        v4.onToggleActivationFromChrome();
    end, 
    isActivated = v10() and function() --[[ Line: 35 ]]
        -- upvalues: v12 (copy)
        return v12:get();
    end or nil, 
    components = {
        Icon = function(_) --[[ Line: 40 ]] --[[ Name: Icon ]]
            -- upvalues: v7 (copy), v12 (copy)
            return v7("icons/controls/cameraOff", "icons/controls/cameraOn", v12);
        end
    }
});
if v9() then
    v6.setCoreGuiAvailability(v15, Enum.CoreGuiType.Captures);
    return v15;
else
    l_StarterGui_0.CoreGuiChangedSignal:Connect(function(v16, _) --[[ Line: 49 ]]
        -- upvalues: v15 (copy), v6 (copy)
        if v16 == Enum.CoreGuiType.All or v16 == Enum.CoreGuiType.Captures then
            local l_v15_0 = v15;
            if l_v15_0 == nil then
                return;
            else
                v6.setCoreGuiAvailability(l_v15_0, v16, function(v19) --[[ Line: 55 ]]
                    -- upvalues: l_v15_0 (copy)
                    local l_availability_0 = l_v15_0.availability;
                    if v19 then
                        l_availability_0:available();
                        return;
                    else
                        l_availability_0:unavailable();
                        return;
                    end;
                end);
            end;
        end;
    end);
    return v15;
end;