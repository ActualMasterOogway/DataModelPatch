local l_script_FirstAncestor_0 = script:FindFirstAncestor("Chrome");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.Packages.UIBlox);
local l_useStyle_0 = v4.Core.Style.useStyle;
local l_ImageSetLabel_0 = v4.Core.ImageSet.ImageSetLabel;
local l_Images_0 = v4.App.ImageSet.Images;
local l_SelfieView_0 = l_script_FirstAncestor_0.Parent.SelfieView;
local v9 = require(l_SelfieView_0);
local l_default_0 = require(l_RobloxGui_0.Modules.VoiceChat.VoiceChatServiceManager).default;
local v11 = require(l_script_FirstAncestor_0.Service);
local v12 = require(l_script_FirstAncestor_0.Integrations.RedVoiceDot);
local v13 = require(l_script_FirstAncestor_0.ChromeShared.Unibar.Constants);
local v14 = require(l_script_FirstAncestor_0.Flags.GetFFlagTweakedMicPinning);
local v15 = require(l_script_FirstAncestor_0.Flags.GetFFlagUseNewUnibarIcon);
local l_GetFFlagUsePolishedAnimations_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagUsePolishedAnimations;
local v17 = require(l_SelfieView_0.Flags.GetFFlagSelfieViewRedStatusDot);
local v18 = l_Images_0["icons/actions/overflow"];
local v19 = v15() and 32 or v13.ICON_SIZE;
local v20 = nil;
ToggleMenuButton = function(v21) --[[ Line: 29 ]] --[[ Name: ToggleMenuButton ]]
    -- upvalues: l_useStyle_0 (copy), v11 (copy), v3 (copy), l_ImageSetLabel_0 (copy), v15 (copy), v18 (copy), l_Images_0 (copy), v19 (copy), l_GetFFlagUsePolishedAnimations_0 (copy), v20 (ref), v14 (copy), v12 (copy), v17 (copy), v9 (copy), l_default_0 (copy)
    local l_toggleTransition_0 = v21.toggleTransition;
    local v23 = l_useStyle_0();
    local v24 = false;
    v24 = v11:getCurrentUtility():get() and true or false;
    local l_IconEmphasis_0 = v23.Theme.IconEmphasis;
    return v3.createElement("Frame", {
        Size = UDim2.new(0, 36, 0, 36), 
        BorderSizePixel = 0, 
        BackgroundColor3 = v23.Theme.BackgroundOnHover.Color, 
        BackgroundTransparency = l_toggleTransition_0:map(function(v26) --[[ Line: 42 ]]
            -- upvalues: v23 (copy)
            return 1 - (1 - v23.Theme.BackgroundOnHover.Transparency) * v26;
        end)
    }, {
        v3.createElement("UICorner", {
            Name = "Corner", 
            CornerRadius = UDim.new(1, 0)
        }), 
        v3.createElement(l_ImageSetLabel_0, {
            Name = v15() and "Overflow" or "Cube", 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            BackgroundTransparency = 1, 
            Image = if v15() then v18 else l_Images_0["icons/menu/AR"], 
            Size = l_toggleTransition_0:map(function(v27) --[[ Line: 56 ]]
                -- upvalues: v19 (ref)
                v27 = 1 - v27;
                return UDim2.new(0, v19 * v27, 0, v19 * v27);
            end), 
            Visible = if l_GetFFlagUsePolishedAnimations_0() then l_toggleTransition_0:map(function(v28) --[[ Line: 61 ]]
                -- upvalues: v20 (ref), v11 (ref)
                if v28 == 1 then
                    v20 = false;
                end;
                return v20 or v11:status():get() == v11.MenuStatus.Closed;
            end) else nil, 
            ImageColor3 = v23.Theme.IconEmphasis.Color, 
            ImageTransparency = v23.Theme.IconEmphasis.Transparency
        }), 
        v3.createElement("Frame", {
            Name = "X1", 
            Position = l_toggleTransition_0:map(function(_) --[[ Line: 73 ]]
                return UDim2.new(0.5, 0, 0.5, 0);
            end), 
            AnchorPoint = if not not v15() or l_GetFFlagUsePolishedAnimations_0() then Vector2.new(0.5, 0.5) else Vector2.new(0.5, 0), 
            Size = l_toggleTransition_0:map(function(v30) --[[ Line: 79 ]]
                return UDim2.new(0, 16 * v30, 0, 2);
            end), 
            Visible = not v24, 
            BorderSizePixel = 0, 
            BackgroundColor3 = l_IconEmphasis_0.Color, 
            BackgroundTransparency = if l_GetFFlagUsePolishedAnimations_0() then l_toggleTransition_0:map(function(v31) --[[ Line: 86 ]]
                return 1 - v31;
            end) else l_IconEmphasis_0.Transparency, 
            Rotation = 45
        }), 
        v3.createElement("Frame", {
            Name = "X2", 
            Position = l_toggleTransition_0:map(function(_) --[[ Line: 94 ]]
                return UDim2.new(0.5, 0, 0.5, 0);
            end), 
            AnchorPoint = if not not v15() or l_GetFFlagUsePolishedAnimations_0() then Vector2.new(0.5, 0.5) else Vector2.new(0.5, 0), 
            Size = l_toggleTransition_0:map(function(v33) --[[ Line: 100 ]]
                return UDim2.new(0, 16 * v33, 0, 2);
            end), 
            Visible = not v24, 
            BorderSizePixel = 0, 
            BackgroundColor3 = l_IconEmphasis_0.Color, 
            BackgroundTransparency = if l_GetFFlagUsePolishedAnimations_0() then l_toggleTransition_0:map(function(v34) --[[ Line: 107 ]]
                return 1 - v34;
            end) else l_IconEmphasis_0.Transparency, 
            Rotation = -45
        }), 
        v3.createElement(l_ImageSetLabel_0, {
            Name = "Arrow", 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = l_toggleTransition_0:map(function(_) --[[ Line: 116 ]]
                return UDim2.new(0.5, 0, 0.5, 0);
            end), 
            BackgroundTransparency = 1, 
            Image = l_Images_0["icons/actions/truncationCollapse_small"], 
            Size = l_toggleTransition_0:map(function(v36) --[[ Line: 121 ]]
                -- upvalues: l_GetFFlagUsePolishedAnimations_0 (ref)
                if l_GetFFlagUsePolishedAnimations_0() then
                    v36 = 1 - v36;
                end;
                return UDim2.new(0, 16 * v36, 0, 16 * v36);
            end), 
            Visible = if l_GetFFlagUsePolishedAnimations_0() then l_toggleTransition_0:map(function(_) --[[ Line: 126 ]]
                -- upvalues: v20 (ref), v11 (ref)
                return not (v20 or v11:status():get() == v11.MenuStatus.Closed);
            end) else v24, 
            ImageColor3 = v23.Theme.IconEmphasis.Color, 
            ImageTransparency = v23.Theme.IconEmphasis.Transparency, 
            Rotation = 270
        }), 
        if v14() then nil else v3.createElement("Frame", {
            Name = "RedVoiceDotVisibleContiner", 
            Visible = l_toggleTransition_0:map(function(v38) --[[ Line: 140 ]]
                return v38 < 0.5;
            end), 
            Size = UDim2.new(1, 0, 1, 0), 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1
        }, {
            v3.createElement(v12, {
                position = UDim2.new(1, -7, 1, -7)
            })
        }), 
        v3.createElement("Frame", {
            Name = v17() and "RedCameraDotVisibleContainer" or "GreenCameraDotVisibleContiner", 
            Visible = l_toggleTransition_0:map(function(v39) --[[ Line: 156 ]]
                return v39 < 0.5;
            end), 
            Size = UDim2.new(1, 0, 1, 0), 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1
        }, {
            v9.useCameraOn() and v3.createElement(v9.CameraStatusDot, {
                Position = if v17() then UDim2.new(1, -7, 1, -7) else if v14() or l_default_0.localMuted then UDim2.new(1, -7, 1, -8) else UDim2.new(1, -7, 1, -12), 
                ZIndex = 2
            })
        })
    });
end;
return v11:register({
    id = "chrome_toggle", 
    label = "CoreScripts.TopBar.MenuToggle", 
    hideNotificationCountWhileOpen = true, 
    flashNotificationSource = true, 
    activated = function() --[[ Line: 180 ]] --[[ Name: activated ]]
        -- upvalues: v20 (ref)
        v20 = true;
    end, 
    components = {
        Icon = function(v40) --[[ Line: 184 ]] --[[ Name: Icon ]]
            -- upvalues: v3 (copy)
            return v3.createElement(ToggleMenuButton, v40);
        end
    }, 
    notification = v11:totalNotifications(), 
    initialAvailability = v11.AvailabilitySignal.Pinned
});