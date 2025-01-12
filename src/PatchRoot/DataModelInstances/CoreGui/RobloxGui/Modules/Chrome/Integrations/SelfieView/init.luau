local l_script_FirstAncestor_0 = script:FindFirstAncestor("Chrome");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_script_FirstAncestor_0.Service);
local v4 = require(l_script_FirstAncestor_0.ChromeShared.Service.ChromeUtils);
local l_VideoCaptureService_0 = game:GetService("VideoCaptureService");
local l_FaceAnimatorService_0 = game:GetService("FaceAnimatorService");
local l_SocialService_0 = game:GetService("SocialService");
local l_StarterGui_0 = game:GetService("StarterGui");
local v9 = require(l_script_FirstAncestor_0.Integrations.CommonIcon);
local l_MappedSignal_0 = v4.MappedSignal;
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_TopBar_0 = l_RobloxGui_0.Modules.TopBar;
local v13 = require(l_TopBar_0.Constants);
local l_SelfieView_0 = l_script_FirstAncestor_0.Parent.SelfieView;
local v15 = require(l_SelfieView_0.Flags.GetFFlagSelfieViewEnabled);
local v16 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagSelfViewFixes();
local v17 = require(l_SelfieView_0.Flags.GetFFlagSelfieViewRedStatusDot);
local v18 = require(l_script_FirstAncestor_0.Flags.GetFFlagDisableSelfViewDefaultOpen);
local v19 = require(l_script_FirstAncestor_0.Flags.GetFFlagChromeSupportSocialService);
local v20 = require(l_script_FirstAncestor_0.Flags.GetFFlagChromeSelfViewIgnoreCoreGui);
local v21 = require(l_script_FirstAncestor_0.Flags.GetFFlagAddChromeActivatedEvents);
local v22 = require(l_script_FirstAncestor_0.Flags.GetFFlagChromeTrackWindowPosition);
local v23 = require(l_script_FirstAncestor_0.Flags.GetFFlagChromeTrackWindowStatus);
local l_GetFFlagChromeDefaultWindowStartingPosition_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagChromeDefaultWindowStartingPosition;
local v25 = require(l_SelfieView_0);
local v26 = require(l_SelfieView_0.Utils.FaceChatUtils);
local v27 = require(l_SelfieView_0.Utils.SizingUtils);
local l_AvailabilitySignalState_0 = require(l_script_FirstAncestor_0.ChromeShared.Service.ChromeUtils).AvailabilitySignalState;
local v29 = require(l_script_FirstAncestor_0.ChromeShared.Service.WindowSizeSignal);
local v30 = require(l_script_FirstAncestor_0.ChromeShared.Service.ViewportUtil);
local v31 = v27.getSize(v30.screenSize:get(), false);
local v32 = v29.new(v31.X, v31.Y);
local v33 = require(l_script_FirstAncestor_0.ChromeShared.Unibar.Constants);
local v34 = UDim2.new(0, v33.ICON_SIZE, 0, v33.ICON_SIZE);
local v35 = require(l_RobloxGui_0.Modules.SelfView.Analytics).new();
local v36 = UDim2.new(0, v13.ScreenSideOffset, 0, v33.WINDOW_DEFAULT_PADDING);
local l_SELFIE_VIEW_ID_0 = v33.SELFIE_VIEW_ID;
local v38 = l_MappedSignal_0.new(v3:onIntegrationStatusChanged(), function() --[[ Line: 52 ]]
    -- upvalues: v3 (copy), l_SELFIE_VIEW_ID_0 (copy)
    return v3:isWindowOpen(l_SELFIE_VIEW_ID_0);
end);
local v39 = nil;
local v40 = nil;
if not v22() then
    v3:updateWindowPosition(l_SELFIE_VIEW_ID_0, v36);
end;
local v44 = v3:register({
    id = l_SELFIE_VIEW_ID_0, 
    label = "CoreScripts.TopBar.SelfViewLabel", 
    windowSize = v32, 
    startingWindowPosition = if l_GetFFlagChromeDefaultWindowStartingPosition_0() then nil else v36, 
    windowDefaultOpen = not v18(), 
    windowAnchorPoint = if l_GetFFlagChromeDefaultWindowStartingPosition_0() then nil else Vector2.new(0, 0), 
    initialAvailability = l_AvailabilitySignalState_0.Unavailable, 
    persistWindowState = v22() or v23() or nil, 
    activated = function() --[[ Line: 76 ]] --[[ Name: activated ]]
        -- upvalues: v3 (copy), l_SELFIE_VIEW_ID_0 (copy)
        v3:toggleWindow(l_SELFIE_VIEW_ID_0);
    end, 
    isActivated = v21() and function() --[[ Line: 80 ]]
        -- upvalues: v38 (copy)
        return v38:get();
    end or nil, 
    draggable = true, 
    cachePosition = true, 
    components = {
        Icon = function(_) --[[ Line: 87 ]] --[[ Name: Icon ]]
            -- upvalues: v2 (copy), v34 (copy), v9 (copy), v38 (copy), v25 (copy), v3 (copy), l_SELFIE_VIEW_ID_0 (copy), v17 (copy)
            return v2.createElement("Frame", {
                Size = v34, 
                BackgroundTransparency = 1
            }, {
                v9("icons/controls/selfieOff", "icons/controls/selfie", v38); 
                CameraStatusDot = if not v25.useCameraOn() or v3:isWindowOpen(l_SELFIE_VIEW_ID_0) then nil else v2.createElement(v25.CameraStatusDot, {
                    Position = if v17() then UDim2.new(1, -7, 1, -7) else UDim2.fromScale(0.8, 0.7), 
                    ZIndex = 2
                })
            }, {});
        end, 
        Window = function(_) --[[ Line: 103 ]] --[[ Name: Window ]]
            -- upvalues: v3 (copy), l_SELFIE_VIEW_ID_0 (copy), v2 (copy), v25 (copy), v32 (copy), v16 (copy)
            local v43 = v3:dragConnection(l_SELFIE_VIEW_ID_0);
            return v2.createElement(v25.Window, {
                id = l_SELFIE_VIEW_ID_0, 
                windowSize = v32, 
                isDraggedOut = if v16 then v43 ~= nil and v43.connection ~= nil else v43 ~= nil
            }, {});
        end
    }
});
v30.screenSize:connect(function(v45) --[[ Line: 117 ]]
    -- upvalues: v3 (copy), l_SELFIE_VIEW_ID_0 (copy), v27 (copy), v32 (copy)
    if not v3:isWindowOpen(l_SELFIE_VIEW_ID_0) then
        local v46 = v27.getSize(v45, v32:getIsLarge());
        v32:requestSize(v46.X, v46.Y);
    end;
end, true);
local function v51() --[[ Line: 124 ]]
    -- upvalues: l_StarterGui_0 (copy), v20 (copy), v44 (copy), v26 (copy)
    local l_l_StarterGui_0_CoreGuiEnabled_0 = l_StarterGui_0:GetCoreGuiEnabled(Enum.CoreGuiType.SelfView);
    if not v20() and not l_l_StarterGui_0_CoreGuiEnabled_0 then
        v44.availability:unavailable();
        return;
    else
        local v48 = v26.getPermissions();
        local v49 = v48.placeCamEnabled or v48.placeMicEnabled;
        local v50 = v48.userCamEligible or v48.userMicEligible;
        if not v49 or not v50 then
            v44.availability:unavailable();
            return;
        else
            v44.availability:available();
            return;
        end;
    end;
end;
local function _() --[[ Line: 148 ]]
    -- upvalues: v26 (copy), v35 (copy)
    local v52 = v26.getPermissions();
    v35:reportExperienceSettings(true, v52.placeCamEnabled, v52.placeMicEnabled);
    v35:reportUserAccountSettings(v52.userCamEnabled, v52.userMicEnabled);
end;
if v15() and game:GetEngineFeature("VideoCaptureService") then
    v51();
    l_VideoCaptureService_0.Started:Connect(v51);
    l_VideoCaptureService_0.Stopped:Connect(v51);
    l_VideoCaptureService_0.DevicesChanged:Connect(v51);
    l_FaceAnimatorService_0:GetPropertyChangedSignal("VideoAnimationEnabled"):Connect(v51);
    l_FaceAnimatorService_0:GetPropertyChangedSignal("AudioAnimationEnabled"):Connect(v51);
    local v54 = v26.getPermissions();
    v35:reportExperienceSettings(true, v54.placeCamEnabled, v54.placeMicEnabled);
    v35:reportUserAccountSettings(v54.userCamEnabled, v54.userMicEnabled);
end;
l_StarterGui_0.CoreGuiChangedSignal:Connect(v51);
if v19() and game:GetEngineFeature("EnableSelfViewToggleApi") then
    if v39 then
        v39:Disconnect();
        v39 = nil;
    end;
    if v40 then
        v40:Disconnect();
        v40 = nil;
    end;
    v39 = l_SocialService_0.SelfViewVisible:Connect(function(v55) --[[ Line: 175 ]]
        -- upvalues: v3 (copy), l_SELFIE_VIEW_ID_0 (copy), v32 (copy), v30 (copy), v13 (copy), v33 (copy)
        if not v3:isWindowOpen(l_SELFIE_VIEW_ID_0) then
            local v56 = v32:get();
            local v57 = v30.screenSize:get();
            local v58 = nil;
            if v55 == Enum.SelfViewPosition.TopLeft then
                v58 = UDim2.fromOffset(v13.ScreenSideOffset, v33.WINDOW_DEFAULT_PADDING);
            elseif v55 == Enum.SelfViewPosition.TopRight then
                v58 = UDim2.fromOffset(v57.X - (v56.X.Offset + v13.ScreenSideOffset), v33.WINDOW_DEFAULT_PADDING);
            elseif v55 == Enum.SelfViewPosition.BottomLeft then
                v58 = UDim2.fromOffset(v13.ScreenSideOffset, v57.Y - (v13.TopBarHeight + v56.Y.Offset + v33.WINDOW_DEFAULT_PADDING));
            elseif v55 == Enum.SelfViewPosition.BottomRight then
                v58 = UDim2.fromOffset(v57.X - (v56.X.Offset + v13.ScreenSideOffset), v57.Y - (v13.TopBarHeight + v56.Y.Offset + v33.WINDOW_DEFAULT_PADDING));
            end;
            v3:toggleWindow(l_SELFIE_VIEW_ID_0);
            if v58 then
                v3:updateWindowPosition(l_SELFIE_VIEW_ID_0, v58);
            end;
        end;
    end);
    v40 = l_SocialService_0.SelfViewHidden:Connect(function() --[[ Line: 211 ]]
        -- upvalues: v3 (copy), l_SELFIE_VIEW_ID_0 (copy)
        if v3:isWindowOpen(l_SELFIE_VIEW_ID_0) then
            v3:toggleWindow(l_SELFIE_VIEW_ID_0);
        end;
    end);
end;
return v44;