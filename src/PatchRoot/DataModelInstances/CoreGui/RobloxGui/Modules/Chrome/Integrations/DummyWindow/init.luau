local l_script_FirstAncestor_0 = script:FindFirstAncestor("Chrome");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_script_FirstAncestor_0.Service);
local v4 = require(l_script_FirstAncestor_0.Integrations.CommonIcon);
local v5 = require(l_script_FirstAncestor_0.ChromeShared.Unibar.Constants);
local v6 = require(l_script_FirstAncestor_0.ChromeShared.Service.WindowSizeSignal);
local v7 = require(l_CorePackages_0.Packages.UIBlox);
local l_Images_0 = v7.App.ImageSet.Images;
local l_IconButton_0 = v7.App.Button.IconButton;
local l_GetFFlagDebugEnableUnibarDummyIntegrations_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagDebugEnableUnibarDummyIntegrations;
local v11 = require(l_script_FirstAncestor_0.Flags.GetFFlagChromeTrackWindowPosition);
local v12 = require(l_script_FirstAncestor_0.Flags.GetFFlagChromeTrackWindowStatus);
local v13 = l_Images_0["icons/navigation/cycleUp"];
local v14 = false;
local v15 = v6.new(v5.DEFAULT_WIDTH, v5.DEFAULT_HEIGHT);
local v16 = UDim2.new(1, -95, 0, 165);
if not v11() then
    v3:updateWindowPosition("dummy_window", v16);
end;
return (v3:register({
    initialAvailability = if l_GetFFlagDebugEnableUnibarDummyIntegrations_0() then v3.AvailabilitySignal.Available else v3.AvailabilitySignal.Unavailable, 
    id = "dummy_window", 
    label = "CoreScripts.TopBar.Menu", 
    draggable = true, 
    cachePosition = true, 
    startingWindowPosition = v16, 
    windowSize = v15, 
    persistWindowState = v11() or v12() or nil, 
    components = {
        Icon = function(_) --[[ Line: 41 ]] --[[ Name: Icon ]]
            -- upvalues: v4 (copy)
            return v4("icons/menu/avatar_on");
        end, 
        Window = function(_) --[[ Line: 44 ]] --[[ Name: Window ]]
            -- upvalues: v2 (copy), v5 (copy), l_IconButton_0 (copy), v13 (copy), v14 (ref), v15 (copy)
            return v2.createElement("Frame", {
                BackgroundTransparency = 0, 
                Size = UDim2.new(1, 0, 1, 0)
            }, {
                Corner = v2.createElement("UICorner", {
                    CornerRadius = v5.CORNER_RADIUS
                }), 
                SizeIcon = v2.createElement(l_IconButton_0, {
                    icon = v13, 
                    iconSize = v5.CLOSE_ICON_SIZE, 
                    anchorPoint = Vector2.new(0.5, 1), 
                    position = UDim2.new(0.5, 0, 1, 0), 
                    backgroundTransparency = 0.5, 
                    onActivated = function() --[[ Line: 58 ]] --[[ Name: onActivated ]]
                        -- upvalues: v14 (ref), v15 (ref), v5 (ref)
                        if v14 then
                            v15:requestSize(v5.DEFAULT_WIDTH, v5.DEFAULT_HEIGHT);
                            v14 = false;
                            return;
                        else
                            v15:requestSize(v5.DEFAULT_WIDTH_LARGE, v5.DEFAULT_HEIGHT_LARGE);
                            v14 = true;
                            return;
                        end;
                    end
                })
            });
        end
    }
}));