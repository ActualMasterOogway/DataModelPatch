local l_script_FirstAncestor_0 = script:FindFirstAncestor("Chrome");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_script_FirstAncestor_0.Service);
local v4 = require(l_script_FirstAncestor_0.Integrations.CommonIcon);
local v5 = require(l_script_FirstAncestor_0.ChromeShared.Unibar.Constants);
local l_GetFFlagDebugEnableUnibarDummyIntegrations_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagDebugEnableUnibarDummyIntegrations;
local v7 = require(l_script_FirstAncestor_0.Flags.GetFFlagChromeTrackWindowPosition);
local v8 = require(l_script_FirstAncestor_0.Flags.GetFFlagChromeTrackWindowStatus);
return v3:register({
    initialAvailability = if l_GetFFlagDebugEnableUnibarDummyIntegrations_0() then v3.AvailabilitySignal.Available else v3.AvailabilitySignal.Unavailable, 
    id = "dummy_window_2", 
    label = "CoreScripts.TopBar.Menu", 
    startingWindowPosition = UDim2.new(1, -245, 0, 95), 
    persistWindowState = v7() or v8() or nil, 
    components = {
        Icon = function(_) --[[ Line: 24 ]] --[[ Name: Icon ]]
            -- upvalues: v4 (copy)
            return v4("icons/menu/home_on");
        end, 
        Window = function(_) --[[ Line: 27 ]] --[[ Name: Window ]]
            -- upvalues: v2 (copy), v5 (copy)
            return v2.createElement("Frame", {
                BackgroundTransparency = 0, 
                Size = UDim2.new(1, 0, 1, 0)
            }, {
                Corner = v2.createElement("UICorner", {
                    CornerRadius = v5.CORNER_RADIUS
                })
            });
        end
    }
});