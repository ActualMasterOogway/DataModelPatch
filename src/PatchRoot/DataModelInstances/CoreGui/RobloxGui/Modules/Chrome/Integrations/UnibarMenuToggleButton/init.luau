local l_script_FirstAncestor_0 = script:FindFirstAncestor("Chrome");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local l_useStyle_0 = require(l_CorePackages_0.Packages.UIBlox).Core.Style.useStyle;
local v4 = require(l_script_FirstAncestor_0.Service);
local v5 = require(l_script_FirstAncestor_0.Integrations.RedVoiceDot);
local v6 = require(l_script_FirstAncestor_0.Flags.GetFFlagTweakedMicPinning);
ToggleMenuButton = function(v7) --[[ Line: 15 ]] --[[ Name: ToggleMenuButton ]]
    -- upvalues: l_useStyle_0 (copy), v2 (copy), v6 (copy), v5 (copy)
    local l_toggleTransition_0 = v7.toggleTransition;
    local v9 = l_useStyle_0();
    local l_IconEmphasis_0 = v9.Theme.IconEmphasis;
    return v2.createElement("Frame", {
        Size = UDim2.new(0, 36, 0, 36), 
        BorderSizePixel = 0, 
        BackgroundColor3 = v9.Theme.BackgroundMuted.Color, 
        BackgroundTransparency = v9.Theme.BackgroundMuted.Transparency
    }, {
        v2.createElement("UICorner", {
            Name = "Corner", 
            CornerRadius = UDim.new(1, 0)
        }), 
        v2.createElement("Frame", {
            Name = "TopLine", 
            Position = l_toggleTransition_0:map(function(v11) --[[ Line: 33 ]]
                return UDim2.new(0.5, 0, 0.5 - 0.17 * (1 - v11), 0);
            end), 
            AnchorPoint = Vector2.new(0.5, 0), 
            Size = UDim2.new(0, 16, 0, 2), 
            BorderSizePixel = 0, 
            BackgroundColor3 = l_IconEmphasis_0.Color, 
            BackgroundTransparency = l_IconEmphasis_0.Transparency, 
            Rotation = l_toggleTransition_0:map(function(v12) --[[ Line: 41 ]]
                return 45 * v12;
            end)
        }), 
        v2.createElement("Frame", {
            Name = "CenterLine", 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            AnchorPoint = Vector2.new(0.5, 0), 
            Size = UDim2.new(0, 16, 0, 2), 
            BorderSizePixel = 0, 
            BackgroundColor3 = l_IconEmphasis_0.Color, 
            BackgroundTransparency = l_toggleTransition_0:map(function(v13) --[[ Line: 52 ]]
                -- upvalues: l_IconEmphasis_0 (copy)
                return 1 - (1 - l_IconEmphasis_0.Transparency) * (1 - v13);
            end)
        }), 
        v2.createElement("Frame", {
            Name = "BottomLine", 
            Position = l_toggleTransition_0:map(function(v14) --[[ Line: 58 ]]
                return UDim2.new(0.5, 0, 0.5 + 0.17 * (1 - v14), 0);
            end), 
            AnchorPoint = Vector2.new(0.5, 0), 
            Size = UDim2.new(0, 16, 0, 2), 
            BorderSizePixel = 0, 
            BackgroundColor3 = l_IconEmphasis_0.Color, 
            BackgroundTransparency = l_IconEmphasis_0.Transparency, 
            Rotation = l_toggleTransition_0:map(function(v15) --[[ Line: 66 ]]
                return -45 * v15;
            end)
        }), 
        if v6() then nil else v2.createElement("Frame", {
            Name = "RedVoiceDotVisibleContiner", 
            Visible = l_toggleTransition_0:map(function(v16) --[[ Line: 76 ]]
                return v16 < 0.5;
            end), 
            Size = UDim2.new(1, 0, 1, 0), 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1
        }, {
            v2.createElement(v5, {
                position = UDim2.new(1, -7, 1, -7)
            })
        })
    });
end;
return v4:register({
    id = "chrome_toggle", 
    label = "CoreScripts.TopBar.MenuToggle", 
    hideNotificationCountWhileOpen = true, 
    activated = function() --[[ Line: 94 ]] --[[ Name: activated ]]

    end, 
    components = {
        Icon = function(v17) --[[ Line: 96 ]] --[[ Name: Icon ]]
            return ToggleMenuButton(v17);
        end
    }, 
    notification = v4:totalNotifications(), 
    initialAvailability = v4.AvailabilitySignal.Pinned
});