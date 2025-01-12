local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_CaptureService_0 = game:GetService("CaptureService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_UserInputService_0 = game:GetService("UserInputService");
local v5 = require(l_Parent_1.React);
local v6 = require(l_Parent_1.RoactUtils);
local v7 = require(l_Parent_1.RobloxAppHooks);
local v8 = require(l_Parent_1.SocialCommon);
local v9 = require(l_Parent_1.SocialStopwatch);
local v10 = require(l_Parent_1.UIBlox);
local l_InputUtilities_0 = v8.Utils.InputUtilities;
local l_ControlState_0 = v10.Core.Control.Enum.ControlState;
local l_Images_0 = v10.App.ImageSet.Images;
local l_ImageSetLabel_0 = v10.Core.ImageSet.ImageSetLabel;
local l_Interactable_0 = v10.Core.Control.Interactable;
local l_TooltipOrientation_0 = v10.App.Dialog.Enum.TooltipOrientation;
local l_useExternalEvent_0 = v10.Core.Hooks.useExternalEvent;
local l_useStyle_0 = v10.Core.Style.useStyle;
local l_withHoverTooltip_0 = v10.App.Dialog.TooltipV2.withHoverTooltip;
local v20 = require(l_Parent_0.Constants);
local v21 = require(l_Parent_0.Analytics.EventNames);
local v22 = require(l_Parent_0.Thunks.TakeCapture);
local v23 = require(l_Parent_0.Analytics.useAnalytics);
local l_useCallback_0 = v5.useCallback;
local l_useDeviceInsets_0 = require(l_Parent_1.AppCommonResponsive).useDeviceInsets;
local l_useDispatch_0 = v6.Hooks.RoactRodux.useDispatch;
local l_useEffect_0 = v5.useEffect;
local v28 = require(l_Parent_0.Hooks.useKeyboardEnabled);
local v29 = require(l_Parent_0.Hooks.usePlayShutterSound);
local l_useRef_0 = v5.useRef;
local l_useScreenSize_0 = v7.useScreenSize;
local l_useSelector_0 = v6.Hooks.RoactRodux.useSelector;
local v33 = require(l_Parent_0.Hooks.useTopbarInsetHeight);
local v34 = require(l_Parent_0.Flags.FFlagCapturesHotkeyEnabledForAll);
local v35 = require(l_Parent_0.Flags.FFlagEnableCapturesHotkeyExperiment);
local v36 = l_UserInputService_0:GetPlatform() == Enum.Platform.OSX;
local v37 = UDim2.new(1, -75, 0.5, 0);
local v38 = UDim2.new(1, -75, 0.625, 0);
local v39 = game:DefineFastInt("CapturesButtonLargeScreenSizeThreshold", 750);
local v40 = require(l_Parent_0.Flags.FIntCapturesEntrypointButtonDraggabilityEventThrottle);
local function _(v41) --[[ Line: 58 ]] --[[ Name: isLargeScreen ]]
    -- upvalues: v39 (copy)
    local v42 = false;
    if v41.X > v39 then
        v42 = v41.Y > v39;
    end;
    return v42;
end;
return function(_) --[[ Line: 65 ]]
    -- upvalues: v23 (copy), l_useDispatch_0 (copy), l_useStyle_0 (copy), l_useSelector_0 (copy), v20 (copy), l_useDeviceInsets_0 (copy), v5 (copy), l_useScreenSize_0 (copy), v33 (copy), v39 (copy), v38 (copy), v37 (copy), l_useRef_0 (copy), v29 (copy), l_useCallback_0 (copy), v9 (copy), v21 (copy), v22 (copy), l_InputUtilities_0 (copy), l_useExternalEvent_0 (copy), l_CaptureService_0 (copy), l_UserInputService_0 (copy), v40 (copy), l_useEffect_0 (copy), v34 (copy), v28 (copy), v35 (copy), l_ControlState_0 (copy), l_Interactable_0 (copy), l_ImageSetLabel_0 (copy), l_Images_0 (copy), l_withHoverTooltip_0 (copy), v36 (copy), l_CoreGui_0 (copy), l_TooltipOrientation_0 (copy)
    local v45 = v23();
    local v46 = l_useDispatch_0();
    local v47 = l_useStyle_0();
    local v49 = l_useSelector_0(function(v48) --[[ Line: 70 ]]
        -- upvalues: v20 (ref)
        return v48[v20.RoduxKey].IsActive;
    end);
    local v50 = l_useDeviceInsets_0();
    local v51, v52 = v5.useState(false);
    local v53 = l_useScreenSize_0();
    local v54 = v33();
    local v55 = false;
    if v53.X > v39 then
        v55 = v53.Y > v39;
    end;
    local v56 = if v55 then v38 else v37;
    v55 = l_useRef_0(nil);
    local v57 = l_useRef_0(false);
    local v58 = v29();
    local v59 = l_useRef_0(nil);
    local v60 = l_useRef_0(nil);
    local v61 = l_useRef_0(nil);
    local v64 = l_useCallback_0(function(_, v63) --[[ Line: 88 ]]
        -- upvalues: v60 (copy), v61 (copy)
        v60.current = DateTime.now().UnixTimestampMillis;
        v61.current = v63;
    end, {});
    local v65 = l_useCallback_0(function() --[[ Line: 95 ]]
        -- upvalues: v9 (ref), v45 (copy), v21 (ref), v58 (copy), v46 (copy), v22 (ref)
        if not v9.Stopwatch.get(v9.Events.CaptureTaken) then
            v9.Stopwatch.start(v9.Events.CaptureTaken);
        end;
        v45.fireEvent(v21.CapturesEntrypointActivated);
        v58();
        v46(v22());
    end, {});
    local v68 = l_useCallback_0(function(_, v67) --[[ Line: 104 ]]
        -- upvalues: l_InputUtilities_0 (ref), v65 (copy)
        if l_InputUtilities_0.isTouchInput(v67) then
            return;
        else
            v65();
            return;
        end;
    end, {
        v65
    });
    l_useExternalEvent_0(l_CaptureService_0.CaptureBegan, function() --[[ Line: 112 ]]
        -- upvalues: v52 (copy)
        v52(true);
    end);
    l_useExternalEvent_0(l_UserInputService_0.TouchMoved, function(v69, _) --[[ Line: 116 ]]
        -- upvalues: v60 (copy), v57 (copy), v61 (copy), v55 (copy), v50 (copy), v53 (copy), v54 (copy)
        if v60.current and DateTime.now().UnixTimestampMillis - v60.current >= 100 then
            v57.current = true;
        end;
        if v69 == v61.current and v57.current and v55.current then
            v55.current.Position = UDim2.fromOffset(math.min(math.max(v50.left + 24, v69.Position.X), v53.X - 24 - v50.right), (math.min(v53.Y - 24 - v50.bottom, (math.max(v69.Position.Y + v54, v54 + 24 + v50.top)))));
        end;
    end);
    l_useExternalEvent_0(l_UserInputService_0.TouchEnded, function(v71, _) --[[ Line: 141 ]]
        -- upvalues: v60 (copy), v57 (copy), v40 (ref), v45 (copy), v21 (ref), v65 (copy), v61 (copy)
        if v60.current and v57.current then
            if math.random() < 1 / v40 then
                v45.fireEvent(v21.CapturesEntrypointDragged);
            end;
        elseif v60.current then
            v60.current = nil;
            v65();
        end;
        if v71 == v61.current then
            v61.current = nil;
        end;
        v57.current = false;
        v60.current = nil;
    end);
    l_useEffect_0(function() --[[ Line: 159 ]]
        -- upvalues: v55 (copy), v56 (copy)
        if v55.current then
            v55.current.Position = v56;
        end;
    end, {
        v56, 
        v53.X, 
        v53.Y
    });
    l_useEffect_0(function() --[[ Line: 165 ]]
        -- upvalues: v49 (copy), v45 (copy), v21 (ref)
        if v49 then
            v45.fireEvent(v21.CapturesEntrypointViewed);
        end;
    end, {
        v49
    });
    local v73 = nil;
    if v34 then
        v73 = v28();
    end;
    local v74 = nil;
    if v34 then
        v74 = v73;
    elseif v35 then
        v74 = true;
    end;
    local function v81(v75, v76) --[[ Line: 183 ]]
        -- upvalues: v52 (copy), l_ControlState_0 (ref), l_UserInputService_0 (ref), v59 (copy), v45 (copy), v21 (ref), v35 (ref), v34 (ref), l_Interactable_0 (ref), v5 (ref), v56 (copy), v49 (copy), v74 (ref), v55 (copy), v47 (copy), v68 (copy), v64 (copy), l_ImageSetLabel_0 (ref), l_Images_0 (ref)
        local function v79(...) --[[ Line: 184 ]]
            -- upvalues: v52 (ref), l_ControlState_0 (ref), l_UserInputService_0 (ref), v59 (ref), v45 (ref), v21 (ref), v76 (copy)
            v52(false);
            local _, v78 = ...;
            if v78 == l_ControlState_0.Hover and l_UserInputService_0.MouseEnabled then
                v59.current = DateTime.now().UnixTimestampMillis;
            elseif v78 == l_ControlState_0.Default and v59.current and l_UserInputService_0.MouseEnabled and DateTime.now().UnixTimestampMillis - v59.current >= 500 then
                v45.fireEvent(v21.CapturesEntrypointHotkeyTooltipActivated);
                v59.current = nil;
            end;
            v76(...);
        end;
        local v80 = if not not v35 or v34 then l_Interactable_0 else "Frame";
        return v5.createElement(v80, {
            Active = false, 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundTransparency = 1, 
            Position = v56, 
            Size = UDim2.fromOffset(48, 48), 
            Visible = v49, 
            onStateChanged = if v74 then v79 else nil, 
            ref = v55, 
            [v5.Change.AbsolutePosition] = if v74 then v75 else nil, 
            [v5.Change.AbsoluteSize] = if v74 then v75 else nil
        }, {
            CameraButton = v5.createElement("ImageButton", {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                BackgroundColor3 = v47.Theme.Overlay.Color, 
                BackgroundTransparency = v47.Theme.Overlay.Transparency * v47.Theme.Overlay.Transparency, 
                Position = UDim2.fromScale(0.5, 0.5), 
                Size = UDim2.fromScale(1, 1), 
                [v5.Event.Activated] = v68, 
                [v5.Event.InputBegan] = v64
            }, {
                Border = v5.createElement("UIStroke", {
                    Color = v47.Theme.Overlay.Color, 
                    Thickness = 2, 
                    Transparency = v47.Theme.Overlay.Transparency
                }), 
                Corner = v5.createElement("UICorner", {
                    CornerRadius = UDim.new(0.5, 0)
                }), 
                CameraIcon = v5.createElement(l_ImageSetLabel_0, {
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    BackgroundTransparency = 1, 
                    Image = l_Images_0["icons/controls/screenshot"], 
                    Position = UDim2.fromScale(0.5, 0.5), 
                    Size = UDim2.fromOffset(36, 36)
                })
            })
        });
    end;
    return if not not v35 or v34 then l_withHoverTooltip_0({
        headerText = "Screenshot", 
        bodyText = v36 and "Opt + 1" or nil, 
        hotkeyCodes = if v36 then nil else {
            Enum.KeyCode.LeftAlt, 
            Enum.KeyCode.One
        }, 
        textAlignment = Enum.TextXAlignment.Center
    }, {
        disabled = if v34 then v51 or not v74 else v51, 
        DisplayOrder = v20.HotkeyTooltipDisplayOrder, 
        guiTarget = l_CoreGui_0, 
        preferredOrientation = l_TooltipOrientation_0.Left, 
        triggerPointName = "EntrypointButtonContainer"
    }, function(v82, v83) --[[ Line: 261 ]]
        -- upvalues: v81 (copy)
        return v81(v82, v83);
    end) else v81(function() --[[ Line: 264 ]]

    end, function() --[[ Line: 264 ]]

    end);
end;