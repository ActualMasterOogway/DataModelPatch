local l_script_FirstAncestor_0 = script:FindFirstAncestor("Chrome");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v4 = require(l_script_FirstAncestor_0.Service);
local v5 = require(l_script_FirstAncestor_0.Integrations.CommonIcon);
local l_Signal_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Signal;
local l_MappedSignal_0 = require(l_script_FirstAncestor_0.ChromeShared.Service.ChromeUtils).MappedSignal;
local v8 = require(l_script_FirstAncestor_0.Flags.GetFFlagAddChromeActivatedEvents);
local v9 = false;
local v10 = l_Signal_0.new();
local v11 = l_MappedSignal_0.new(v10, function() --[[ Line: 22 ]]
    -- upvalues: v9 (ref)
    return v9;
end);
task.defer(function() --[[ Line: 27 ]]
    -- upvalues: l_RobloxGui_0 (copy), v9 (ref), v10 (copy)
    local v12 = require(l_RobloxGui_0.Modules.Settings.SettingsHub);
    v12.CurrentPageSignal:connect(function(v13) --[[ Line: 29 ]]
        -- upvalues: v9 (ref), v12 (copy), v10 (ref)
        v9 = v13 == v12.Instance.ReportAbusePage.Page.Name;
        v10:fire();
    end);
end);
return v4:register({
    initialAvailability = v4.AvailabilitySignal.Available, 
    id = "trust_and_safety", 
    label = "CoreScripts.InGameMenu.QuickActions.Report", 
    activated = function(_) --[[ Line: 39 ]] --[[ Name: activated ]]
        -- upvalues: l_RobloxGui_0 (copy), v9 (ref)
        local v15 = require(l_RobloxGui_0.Modules.Settings.SettingsHub);
        if v15:GetVisibility() then
            if v9 then
                v15:SetVisibility(false);
                return;
            else
                v15:SwitchToPage(v15.Instance.ReportAbusePage, true);
                return;
            end;
        else
            v15:SetVisibility(true, false, v15.Instance.ReportAbusePage);
            return;
        end;
    end, 
    isActivated = v8() and function() --[[ Line: 52 ]]
        -- upvalues: v11 (copy)
        return v11:get();
    end or nil, 
    components = {
        Icon = function(_) --[[ Line: 57 ]] --[[ Name: Icon ]]
            -- upvalues: v5 (copy), v11 (copy)
            return v5("icons/menu/safety_off", "icons/menu/safety_on", v11);
        end
    }
});