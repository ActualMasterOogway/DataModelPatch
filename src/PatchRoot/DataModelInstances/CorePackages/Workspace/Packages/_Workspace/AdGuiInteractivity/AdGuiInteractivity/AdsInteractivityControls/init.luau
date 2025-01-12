local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Roact);
local v3 = nil;
local v4 = require(l_Parent_0.FadeController);
local v5 = require(l_Parent_0.AdLabel);
local v6 = require(l_Parent_0.CircularButton);
local v7 = nil;
local v8 = require(script.Parent.Flags);
local v9 = nil;
local v10 = nil;
local v11 = nil;
local v12 = nil;
local v13 = nil;
local v14 = nil;
local v15 = nil;
local v16 = nil;
if v8.GetEnableAdGuiUiBloxImages() then
    local v17 = require(l_Parent_1.UIBlox);
    v3 = v17.Core.ImageSet.ImageSetLabel;
    local l_Images_0 = v17.App.ImageSet.Images;
    v9 = l_Images_0["icons/controls/speakerMute"];
    v10 = l_Images_0["icons/controls/speaker"];
    v11 = l_Images_0["icons/actions/previewExpand"];
    v12 = l_Images_0["icons/actions/previewShrink"];
    v13 = l_Images_0["icons/controls/media-play-large"];
    v14 = l_Images_0["icons/controls/media-pause-large"];
    v15 = l_Images_0["icons/navigation/close"];
    v16 = l_Images_0["component_assets/circle_42_stroke_3"];
else
    v9 = v8.GetFStringAdsVolumeOffImageLua();
    v10 = v8.GetFStringAdsVolumeOnImageLua();
    v11 = v8.GetFStringAdsEnterFullscreenImageLua();
    v12 = v8.GetFStringAdsExitFullscreenImageLua();
    v13 = v8.GetFStringAdGuiPlayButtonImageLua();
    v14 = v8.GetFStringAdGuiPauseButtonImageLua();
    v15 = v8.GetFStringAdGuiCloseButtonImageLua();
end;
local v19 = v8.GetFFlagAdGuiEnableWatermark();
local l_game_EngineFeature_0 = game:GetEngineFeature("EnableDynamicLivePreviewWatermark");
local l_game_EngineFeature_1 = game:GetEngineFeature("EnableViewabilityCheckForCPV15");
if v19 then
    v7 = require(l_Parent_0.LivePreviewWatermark);
end;
local v22 = v8.GetFFlagEnableReportAdDropdown();
local l_game_EngineFeature_2 = game:GetEngineFeature("EnableReportAdPopup");
local v24 = v22 and l_game_EngineFeature_2;
local v25 = v8.GetEnableHideReportAdModalDuringScreenshot();
local l_game_EngineFeature_3 = game:GetEngineFeature("EnablePauseVideoWhenDropdownIsOpen");
local v27 = if v24 then require(l_Parent_0.ReportAdPopup) else nil;
local v28 = if v24 then require(l_Parent_0.AdDropdownMenu) else nil;
local v29 = v8.GetFFlagADS6383();
local v30 = if v29 then require(l_Parent_0.AdsInteractivityTelemetry) else nil;
local v31 = v2.PureComponent:extend("AdsInteractivityControls");
local function _(v32) --[[ Line: 57 ]] --[[ Name: opacityToTransparency ]]
    return 1 - v32;
end;
local function _(v34) --[[ Line: 64 ]] --[[ Name: getAdornee ]]
    if v34 == nil then
        return nil;
    elseif v34.Adornee ~= nil then
        return v34.Adornee;
    elseif v34.Parent ~= nil and v34.Parent:IsA("BasePart") then
        return v34.Parent;
    else
        return nil;
    end;
end;
v31.init = function(v36) --[[ Line: 79 ]] --[[ Name: init ]]
    -- upvalues: v4 (copy), v2 (copy)
    v36.state = {
        adUIType = Enum.AdUIType.None, 
        adGuiRectStuds = Vector2.new(0, 0), 
        isViewable = false, 
        videoPlaying = false, 
        isFullscreen = false, 
        isClickToPlay = false, 
        eudsaPromptActive = false, 
        isDropDownOpen = false, 
        isReportAdPopupOpen = false, 
        hideLivePreviewWatermark = false
    };
    local function v40() --[[ Line: 93 ]] --[[ Name: onAdorneeChanged ]]
        -- upvalues: v36 (copy)
        local l_v36_0 = v36;
        local v38 = {};
        local l_adGui_0 = v36.props.adGui;
        v38.adornee = if l_adGui_0 == nil then nil else if l_adGui_0.Adornee ~= nil then l_adGui_0.Adornee else if l_adGui_0.Parent ~= nil and l_adGui_0.Parent:IsA("BasePart") then l_adGui_0.Parent else nil;
        l_v36_0:setState(v38);
    end;
    v36.signalConnections = {
        v36.props.adGui:GetPropertyChangedSignal("Adornee"):Connect(v40), 
        v36.props.adGui:GetPropertyChangedSignal("Parent"):Connect(v40)
    };
    v36.props.adGui.adGuiStateChanged:Connect(function(v41) --[[ Line: 104 ]]
        -- upvalues: v36 (copy)
        v36:setState(v41);
    end);
    v36.fadeController = v4.new();
    local v42, v43 = v2.createBinding(1);
    v36.controlsOpacity = v42;
    v36.updateControlsOpacity = v43;
    v36.fadeController:subscribe(function(v44) --[[ Line: 111 ]]
        -- upvalues: v36 (copy)
        v36.updateControlsOpacity(v44);
    end);
    v36.props.adGui:forwardStateToLuaUI();
end;
v31.willUnmount = function(v45) --[[ Line: 118 ]] --[[ Name: willUnmount ]]
    for _, v47 in ipairs(v45.signalConnections) do
        v47:Disconnect();
    end;
end;
v31.render = function(v48) --[[ Line: 124 ]] --[[ Name: render ]]
    -- upvalues: v13 (ref), v14 (ref), v10 (ref), v9 (ref), v12 (ref), v11 (ref), l_game_EngineFeature_1 (copy), v2 (copy), v24 (copy), l_game_EngineFeature_3 (copy), v29 (copy), v30 (copy), v27 (copy), v25 (copy), v28 (copy), v5 (copy), v6 (copy), v8 (copy), v15 (ref), v3 (ref), v16 (ref), v19 (copy), v7 (ref), l_game_EngineFeature_0 (copy)
    if not v48.props.adGui then
        return nil;
    else
        local v49 = v48.state.adUIType == Enum.AdUIType.Video;
        local v50 = v48.state.adUIType == Enum.AdUIType.None;
        local v51 = nil;
        if v49 then
            if v48.state.isFullscreen and not v48.state.videoPlaying or v48.state.isClickToPlay and not v48.state.isFullscreen then
                v51 = v13;
            elseif v48.state.isFullscreen and v48.state.videoPlaying then
                v51 = v14;
            end;
        end;
        local v52 = v49 and v48.state.isFullscreen;
        local v53 = v49 and not v48.state.isFullscreen and not v48.state.isClickToPlay and v48.state.videoPlaying;
        local v54 = v48.state.volumeEnabled and v10 or v9;
        local v55 = v48.state.isFullscreen and v12 or v11;
        local v56 = Vector2.new(0.10038949275, 0.17847020934);
        if not v48.state.isFullscreen then
            v56 = v56 * 1.5;
        end;
        local v59 = v48.controlsOpacity:map(function(v57) --[[ Line: 155 ]]
            -- upvalues: v51 (ref), v13 (ref)
            if v51 == v13 then
                return true;
            else
                local v58 = false;
                if v51 ~= nil then
                    v58 = v57 and v57 > 0;
                end;
                return v58;
            end;
        end);
        if l_game_EngineFeature_1 and not v48.state.isViewable then
            v59 = false;
        end;
        local v61 = v48.controlsOpacity:map(function(v60) --[[ Line: 166 ]]
            -- upvalues: v51 (ref), v13 (ref)
            if v51 == v13 then
                return 0.19999999999999996;
            else
                return 1 - v60 * 0.8;
            end;
        end);
        local l_createElement_0 = v2.createElement;
        local v63 = "SurfaceGui";
        local v64 = {
            ZOffset = 1, 
            ZIndexBehavior = if v24 then Enum.ZIndexBehavior.Sibling else Enum.ZIndexBehavior.Global, 
            LightInfluence = 0, 
            SizingMode = Enum.SurfaceGuiSizingMode.PixelsPerStud, 
            PixelsPerStud = 50
        };
        local l_adGui_1 = v48.props.adGui;
        v64.Adornee = if l_adGui_1 == nil then nil else if l_adGui_1.Adornee ~= nil then l_adGui_1.Adornee else if l_adGui_1.Parent ~= nil and l_adGui_1.Parent:IsA("BasePart") then l_adGui_1.Parent else nil;
        v64.Face = v48.props.adGui.Face;
        v64.AlwaysOnTop = v48.state.isFullscreen;
        v64.Brightness = 2;
        return l_createElement_0(v63, v64, {
            InteractiveArea = v2.createElement("TextButton", {
                Size = UDim2.fromOffset(v48.state.adGuiRectStuds.X * 50, v48.state.adGuiRectStuds.Y * 50), 
                Position = UDim2.new(0.5, 0, 0.5, 0), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                BackgroundColor3 = Color3.new(0, 0, 0), 
                BackgroundTransparency = v48.controlsOpacity:map(function(v66) --[[ Line: 193 ]]
                    -- upvalues: v51 (ref), v13 (ref)
                    if v51 == v13 then
                        return 0.7;
                    else
                        return 1 - v66 * 0.3;
                    end;
                end), 
                Text = "", 
                [v2.Event.MouseMoved] = function(_, _) --[[ Line: 202 ]]
                    -- upvalues: v49 (copy), v48 (copy)
                    if v49 and v48.state.isFullscreen then
                        v48.fadeController:updateLastInputTime();
                    end;
                end, 
                [v2.Event.Activated] = function(_, v70) --[[ Line: 207 ]]
                    -- upvalues: v24 (ref), v48 (copy), l_game_EngineFeature_3 (ref), v29 (ref), v30 (ref), v49 (copy), l_game_EngineFeature_1 (ref)
                    if v24 and v48.state.isDropDownOpen then
                        v48:setState({
                            isDropDownOpen = false
                        });
                        if l_game_EngineFeature_3 then
                            v48.props.adGui:HandleLuaUIEvent(Enum.AdUIEventType.PlayEventTriggered);
                            v48.props.adGui:HandleLuaUIEvent(Enum.AdUIEventType.PlayButtonClicked);
                        end;
                        if v29 and v30 then
                            v30.logAdMenuEvent("close");
                        end;
                        return;
                    else
                        if v49 then
                            if not v48.state.isFullscreen then
                                if l_game_EngineFeature_1 then
                                    if v48.state.isViewable then
                                        v48.props.adGui:HandleLuaUIEvent(Enum.AdUIEventType.FullscreenButtonClicked);
                                        return;
                                    end;
                                else
                                    v48.props.adGui:HandleLuaUIEvent(Enum.AdUIEventType.FullscreenButtonClicked);
                                    return;
                                end;
                            elseif v48.state.videoPlaying then
                                if v70.UserInputType == Enum.UserInputType.Touch then
                                    if v48.fadeController:inProgress() and not v48.fadeController:isFading() then
                                        v48.fadeController:skipToFade();
                                        return;
                                    else
                                        v48.fadeController:updateLastInputTime();
                                        return;
                                    end;
                                else
                                    v48.props.adGui:HandleLuaUIEvent(Enum.AdUIEventType.PauseButtonClicked);
                                    return;
                                end;
                            else
                                v48.props.adGui:HandleLuaUIEvent(Enum.AdUIEventType.PlayButtonClicked);
                            end;
                        end;
                        return;
                    end;
                end
            }, {
                AbuseReportingModal = v24 and v27 and v48.state.isReportAdPopupOpen and v2.createElement(v27, {
                    showReportAdPopup = v48.state.isReportAdPopupOpen, 
                    onClose = function() --[[ Line: 253 ]] --[[ Name: onClose ]]
                        -- upvalues: v48 (copy)
                        v48:setState({
                            isReportAdPopupOpen = false
                        });
                    end, 
                    onOpen = v25 and function() --[[ Line: 259 ]]
                        -- upvalues: v48 (copy), v29 (ref), v30 (ref)
                        v48:setState({
                            isReportAdPopupOpen = true
                        });
                        if v29 and v30 then
                            v30.logReportAdEvent("open");
                        end;
                    end or nil, 
                    adInfo = v48.props.adGui:GetSingleReportAdInfo()
                }) or nil, 
                AdDropdownMenu = if v24 and v28 then v2.createElement(v28, {
                    showDropDownMenu = v48.state.isDropDownOpen, 
                    onWhyThisAdActivated = function() --[[ Line: 276 ]] --[[ Name: onWhyThisAdActivated ]]
                        -- upvalues: v48 (copy), v29 (ref), v30 (ref)
                        v48.props.adGui:HandleLuaUIEvent(Enum.AdUIEventType.WhyThisAdClicked);
                        if v29 and v30 then
                            v30.logWhyThisAdEvent();
                        end;
                    end, 
                    onReportAdActivated = function() --[[ Line: 283 ]] --[[ Name: onReportAdActivated ]]
                        -- upvalues: v48 (copy)
                        v48:setState({
                            isReportAdPopupOpen = true
                        });
                    end, 
                    transparency = 0.19999999999999996
                }) else nil, 
                AdLabel = v2.createElement(v5, {
                    onActivated = v24 and function() --[[ Line: 293 ]]
                        -- upvalues: v48 (copy), l_game_EngineFeature_3 (ref), v29 (ref), v30 (ref)
                        v48:setState({
                            isDropDownOpen = not v48.state.isDropDownOpen
                        });
                        if l_game_EngineFeature_3 then
                            if v48.state.isDropDownOpen then
                                v48.props.adGui:HandleLuaUIEvent(Enum.AdUIEventType.PlayEventTriggered);
                                v48.props.adGui:HandleLuaUIEvent(Enum.AdUIEventType.PlayButtonClicked);
                            else
                                v48.props.adGui:HandleLuaUIEvent(Enum.AdUIEventType.PauseEventTriggered);
                                v48.props.adGui:HandleLuaUIEvent(Enum.AdUIEventType.PauseButtonClicked);
                            end;
                        end;
                        if v29 and v30 then
                            v30.logAdMenuEvent(v48.state.isDropDownOpen and "open" or "close");
                        end;
                    end or function() --[[ Line: 311 ]]
                        -- upvalues: v48 (copy)
                        v48.props.adGui:HandleLuaUIEvent(Enum.AdUIEventType.AdLabelClicked);
                    end, 
                    isMenuOpen = v48.state.isDropDownOpen, 
                    Visible = not v50
                }), 
                CloseButton = v2.createElement(v6, {
                    HorizontalScale = 0.06884057971, 
                    Position = UDim2.fromScale(0.995, 0.005), 
                    AnchorPoint = Vector2.new(1, 0), 
                    ImageSize = UDim2.fromScale(v8.GetEnableAdGuiUiBloxImages() and 0.8 or 0.5, v8.GetEnableAdGuiUiBloxImages() and 0.8 or 0.5), 
                    Image = v15, 
                    Visible = v52, 
                    Transparency = if v8.GetEnableAdGuiUiBloxImages() then v61 else v48.controlsOpacity:map(function(v71) --[[ Line: 329 ]]
                        -- upvalues: v51 (ref), v13 (ref)
                        if v51 == v13 then
                            return 0.19999999999999996;
                        else
                            return 1 - v71 * 0.8;
                        end;
                    end), 
                    AutoButtonColor = not v24 or not v48.state.isDropDownOpen or false, 
                    onActivated = function() --[[ Line: 337 ]] --[[ Name: onActivated ]]
                        -- upvalues: v24 (ref), v48 (copy), l_game_EngineFeature_3 (ref), v29 (ref), v30 (ref)
                        if v24 and v48.state.isDropDownOpen then
                            v48:setState({
                                isDropDownOpen = false
                            });
                            if l_game_EngineFeature_3 then
                                v48.props.adGui:HandleLuaUIEvent(Enum.AdUIEventType.PlayEventTriggered);
                                v48.props.adGui:HandleLuaUIEvent(Enum.AdUIEventType.PlayButtonClicked);
                            end;
                            if v29 and v30 then
                                v30.logAdMenuEvent("close");
                            end;
                            return;
                        else
                            v48.props.adGui:HandleLuaUIEvent(Enum.AdUIEventType.CloseButtonClicked);
                            return;
                        end;
                    end
                }), 
                PlayPauseButton = v2.createElement("ImageButton", {
                    BackgroundTransparency = 1, 
                    ImageTransparency = if v8.GetEnableAdGuiUiBloxImages() then nil else v48.controlsOpacity:map(function(v72) --[[ Line: 361 ]]
                        -- upvalues: v51 (ref), v13 (ref)
                        if v51 == v13 then
                            return 0.19999999999999996;
                        else
                            return 1 - v72 * 0.8;
                        end;
                    end), 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Position = UDim2.fromScale(0.5, 0.5), 
                    Size = UDim2.fromScale(v56.X, v56.Y), 
                    Image = if v8.GetEnableAdGuiUiBloxImages() then nil else v51, 
                    Visible = v59, 
                    AutoButtonColor = not v24 or not v48.state.isDropDownOpen or false, 
                    [v2.Event.Activated] = function() --[[ Line: 374 ]]
                        -- upvalues: v24 (ref), v48 (copy), l_game_EngineFeature_3 (ref), v29 (ref), v30 (ref), v51 (ref), v13 (ref), v14 (ref)
                        if v24 and v48.state.isDropDownOpen then
                            v48:setState({
                                isDropDownOpen = false
                            });
                            if l_game_EngineFeature_3 then
                                v48.props.adGui:HandleLuaUIEvent(Enum.AdUIEventType.PlayEventTriggered);
                                v48.props.adGui:HandleLuaUIEvent(Enum.AdUIEventType.PlayButtonClicked);
                            end;
                            if v29 and v30 then
                                v30.logAdMenuEvent("close");
                            end;
                            return;
                        elseif v51 == v13 then
                            v48.props.adGui:HandleLuaUIEvent(Enum.AdUIEventType.PlayButtonClicked);
                            return;
                        else
                            if v51 == v14 then
                                v48.props.adGui:HandleLuaUIEvent(Enum.AdUIEventType.PauseButtonClicked);
                            end;
                            return;
                        end;
                    end
                }, if v8.GetEnableAdGuiUiBloxImages() then {
                    circle = v2.createElement(v3, {
                        Image = v16, 
                        Size = UDim2.fromScale(1, 1), 
                        Position = UDim2.fromScale(0.5, 0.5), 
                        AnchorPoint = Vector2.new(0.5, 0.5), 
                        BackgroundTransparency = 1, 
                        ImageTransparency = v61
                    }), 
                    icon = v2.createElement(v3, {
                        Image = v51, 
                        Size = UDim2.fromScale(0.6, 0.6), 
                        Position = UDim2.fromScale(0.5, 0.5), 
                        AnchorPoint = Vector2.new(0.5, 0.5), 
                        BackgroundTransparency = 1, 
                        ImageTransparency = v61
                    })
                } else nil), 
                VolumeButton = v2.createElement(v6, {
                    Visible = v53, 
                    Position = UDim2.fromScale(0.075, 0.75), 
                    HorizontalScale = 0.12, 
                    Image = v54, 
                    ImageSize = UDim2.fromScale(v8.GetEnableAdGuiUiBloxImages() and 0.8 or 0.5, v8.GetEnableAdGuiUiBloxImages() and 0.8 or 0.5), 
                    AutoButtonColor = not v24 or not v48.state.isDropDownOpen or false, 
                    onActivated = function() --[[ Line: 427 ]] --[[ Name: onActivated ]]
                        -- upvalues: v24 (ref), v48 (copy), l_game_EngineFeature_3 (ref), v29 (ref), v30 (ref)
                        if v24 and v48.state.isDropDownOpen then
                            v48:setState({
                                isDropDownOpen = false
                            });
                            if l_game_EngineFeature_3 then
                                v48.props.adGui:HandleLuaUIEvent(Enum.AdUIEventType.PlayEventTriggered);
                            end;
                            if v29 and v30 then
                                v30.logAdMenuEvent("close");
                            end;
                            return;
                        else
                            v48.props.adGui:HandleLuaUIEvent(Enum.AdUIEventType.VolumeButtonClicked);
                            return;
                        end;
                    end, 
                    Transparency = 0.19999999999999996
                }), 
                FullscreenButton = v2.createElement(v6, {
                    Visible = v53, 
                    Position = UDim2.fromScale(0.87625, 0.75), 
                    AnchorPoint = Vector2.new(1, 0), 
                    HorizontalScale = 0.12, 
                    Image = v55, 
                    ImageSize = UDim2.fromScale(v8.GetEnableAdGuiUiBloxImages() and 0.7 or 0.5, v8.GetEnableAdGuiUiBloxImages() and 0.7 or 0.5), 
                    AutoButtonColor = not v24 or not v48.state.isDropDownOpen or false, 
                    onActivated = function() --[[ Line: 456 ]] --[[ Name: onActivated ]]
                        -- upvalues: v24 (ref), v48 (copy), l_game_EngineFeature_3 (ref), v29 (ref), v30 (ref)
                        if v24 and v48.state.isDropDownOpen then
                            v48:setState({
                                isDropDownOpen = false
                            });
                            if l_game_EngineFeature_3 then
                                v48.props.adGui:HandleLuaUIEvent(Enum.AdUIEventType.PlayEventTriggered);
                            end;
                            if v29 and v30 then
                                v30.logAdMenuEvent("close");
                            end;
                            return;
                        else
                            v48.props.adGui:HandleLuaUIEvent(Enum.AdUIEventType.FullscreenButtonClicked);
                            return;
                        end;
                    end, 
                    Transparency = 0.19999999999999996
                }), 
                LivePreviewWatermark = v19 and v2.createElement(v7, l_game_EngineFeature_0 and {
                    IsVisible = not v48.state.hideLivePreviewWatermark
                } or nil) or nil
            })
        });
    end;
end;
return v31;