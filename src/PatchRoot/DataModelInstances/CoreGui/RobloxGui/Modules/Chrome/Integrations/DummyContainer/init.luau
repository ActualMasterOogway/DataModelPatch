local l_script_FirstAncestor_0 = script:FindFirstAncestor("Chrome");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_script_FirstAncestor_0.Service);
local v4 = require(l_script_FirstAncestor_0.ChromeShared.Service.ContainerSlotSignal);
local l_GetFFlagDebugEnableUnibarDummyIntegrations_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagDebugEnableUnibarDummyIntegrations;
local v6 = v4.new(5);
local v8 = v3:register({
    initialAvailability = if l_GetFFlagDebugEnableUnibarDummyIntegrations_0() then v3.AvailabilitySignal.Available else v3.AvailabilitySignal.Unavailable, 
    id = "dummy_container", 
    label = "CoreScripts.TopBar.Menu", 
    containerWidthSlots = v6, 
    components = {
        Container = function(_) --[[ Line: 22 ]] --[[ Name: Container ]]
            -- upvalues: v2 (copy)
            return v2.createElement("Frame", {
                Size = UDim2.fromScale(1, 1)
            }, {
                Content = v2.createElement("Frame", {
                    Size = UDim2.fromScale(1, 1), 
                    BackgroundColor3 = Color3.new(0.5, 0.5, 0.5)
                })
            });
        end
    }
});
_simulateContainerSlotChange = function() --[[ Line: 36 ]] --[[ Name: _simulateContainerSlotChange ]]
    -- upvalues: v6 (copy)
    while true do
        task.wait(2);
        local v9 = math.random(1, 8);
        print("Request slots: ", v9);
        v6:requestSlots(v9);
    end;
end;
return v8;