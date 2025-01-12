local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local v2 = require(l_CorePackages_0.Packages.RoactGamepad);
local v3 = require(l_CorePackages_0.Packages.t);
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local v5 = require(l_RobloxGui_0.Modules.RobloxTranslator);
local l_EmoteUtility_0 = require(l_CorePackages_0.Packages.Thumbnailing).EmoteUtility;
local v7 = require(l_CorePackages_0.Packages.UIBlox);
local l_withStyle_0 = v7.Style.withStyle;
local l_InteractiveAlert_0 = v7.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v7.App.Button.Enum.ButtonType;
local l_SystemSlider_0 = v7.App.Slider.SystemSlider;
local v12 = require(script.Parent.EmoteThumbnailParameters);
local v13 = require(script.Parent.EmoteThumbnailView);
local v14 = {
    CurveAnimationTimeIncrements = 0.01
};
local v15 = {
    Rotation = {
        Precision = 0, 
        Range = NumberRange.new(0, 360), 
        Default = 0, 
        Increments = 361
    }
};
local v16 = v1.PureComponent:extend("EmoteThumbnailEditor");
v16.validateProps = v3.strictInterface({
    screenSize = v3.Vector2, 
    animationClip = v3.instanceIsA("AnimationClip"), 
    initialThumbnailParameters = v3.optional(v12.validate), 
    closePromptCallback = v3.callback, 
    updateThumbnailCallback = v3.callback
});
v16.init = function(v17) --[[ Line: 64 ]] --[[ Name: init ]]
    -- upvalues: v12 (copy), v1 (copy)
    v17:setState({
        thumbnailParameters = v17.props.initialThumbnailParameters or v12.defaultParameters
    });
    v17.onCancelPressed = function() --[[ Line: 72 ]]
        -- upvalues: v17 (copy)
        v17.props.closePromptCallback();
    end;
    v17.onUpdatePressed = function() --[[ Line: 76 ]]
        -- upvalues: v17 (copy)
        local l_thumbnailParameters_0 = v17.state.thumbnailParameters;
        v17.props.updateThumbnailCallback(l_thumbnailParameters_0);
        v17.props.closePromptCallback();
    end;
    v17.onRotateChanged = function(v19) --[[ Line: 82 ]]
        -- upvalues: v17 (copy)
        local v20 = table.clone(v17.state.thumbnailParameters);
        v20.thumbnailCharacterRotation = v19;
        v17:updateThumbnailParameters(v20);
    end;
    v17.onKeyframeOrTimeChanged = function(v21) --[[ Line: 88 ]]
        -- upvalues: v17 (copy)
        local v22 = table.clone(v17.state.thumbnailParameters);
        v22.thumbnailTime = v21;
        v22.thumbnailKeyframe = v21;
        v17:updateThumbnailParameters(v22);
    end;
    v17.rotationSliderRef = v1.createRef();
    v17.timeSliderRef = v1.createRef();
    v17:updateSliderValuesForAnimationClip();
end;
v16.updateSliderValuesForAnimationClip = function(v23) --[[ Line: 102 ]] --[[ Name: updateSliderValuesForAnimationClip ]]
    -- upvalues: l_EmoteUtility_0 (copy), v14 (copy)
    local l_props_0 = v23.props;
    local v25 = nil;
    local v26 = nil;
    local v27 = nil;
    if l_props_0.animationClip:IsA("KeyframeSequence") then
        local l_Keyframes_0 = l_props_0.animationClip:GetKeyframes();
        v25 = 1;
        v26 = #l_Keyframes_0;
        v27 = 1;
    elseif l_props_0.animationClip:IsA("CurveAnimation") then
        local v29 = math.floor(l_EmoteUtility_0.GetCurveAnimationTimeLength(l_props_0.animationClip) / v14.CurveAnimationTimeIncrements);
        v25 = 0;
        v26 = v29 * v14.CurveAnimationTimeIncrements;
        v27 = v14.CurveAnimationTimeIncrements;
    else
        error("Unsupported animation type:", l_props_0.animationClip.ClassName);
    end;
    v23:setState({
        timeSliderMin = v25, 
        timeSliderMax = v26, 
        timeSliderStepInterval = v27
    });
end;
v16.updateThumbnailParameters = function(v30, v31) --[[ Line: 130 ]] --[[ Name: updateThumbnailParameters ]]
    v30:setState({
        thumbnailParameters = v31
    });
end;
v16.renderMiddle = function(v32, v33) --[[ Line: 136 ]] --[[ Name: renderMiddle ]]
    -- upvalues: l_withStyle_0 (copy), v1 (copy), v2 (copy), v13 (copy), l_SystemSlider_0 (copy), v15 (copy)
    return l_withStyle_0(function(v34) --[[ Line: 137 ]]
        -- upvalues: v32 (copy), v1 (ref), v2 (ref), v13 (ref), v33 (copy), l_SystemSlider_0 (ref), v15 (ref)
        local l_Font_0 = v34.Font;
        local l_Theme_0 = v34.Theme;
        local v37 = v32.props.screenSize.Y > 481;
        local v38 = {};
        if v37 then
            v38.contentSize = UDim2.new(1, 0, 0, 262);
            v38.thumbnailPosition = UDim2.new(0.5, 0, 0, 0);
            v38.thumbnailAnchorPoint = Vector2.new(0.5, 0);
            v38.leversPosition = UDim2.new(0, 0, 0, 160);
            v38.leversSize = UDim2.new(1, 0, 0, 102);
        else
            v38.contentSize = UDim2.new(1, 0, 0, 150);
            v38.thumbnailPosition = UDim2.new(0, 0, 0, 0);
            v38.thumbnailAnchorPoint = Vector2.new(0, 0);
            v38.leversPosition = UDim2.new(0, 160, 0, 0);
            v38.leversSize = UDim2.new(1, -160, 0, 102);
        end;
        local l_thumbnailParameters_1 = v32.state.thumbnailParameters;
        local l_thumbnailKeyframe_0 = l_thumbnailParameters_1.thumbnailKeyframe;
        local l_thumbnailCharacterRotation_0 = l_thumbnailParameters_1.thumbnailCharacterRotation;
        local function _(v42) --[[ Line: 163 ]] --[[ Name: getStepIntervalForOption ]]
            return (v42.Range.Max - v42.Range.Min) / (v42.Increments - 1);
        end;
        local l_createElement_0 = v1.createElement;
        local l_Frame_0 = v2.Focusable.Frame;
        local v46 = {
            Size = v38.contentSize, 
            BackgroundColor3 = Color3.new(1, 0, 1), 
            BackgroundTransparency = 1, 
            [v1.Ref] = v32.middleContentRef
        };
        local v47 = {};
        local l_createElement_1 = v1.createElement;
        local v49 = "Frame";
        local v50 = {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1
        };
        local v51 = {
            ThumbnailViewParent = v1.createElement("Frame", {
                LayoutOrder = 0, 
                Position = v38.thumbnailPosition, 
                AnchorPoint = v38.thumbnailAnchorPoint, 
                Size = UDim2.new(0, 150, 0, 150), 
                BackgroundColor3 = Color3.new(1, 1, 0), 
                BackgroundTransparency = 1
            }, {
                EmoteThumbnailView = v1.createElement(v13, {
                    position = UDim2.new(0.5, 0, 0.5, 0), 
                    anchorPoint = Vector2.new(0.5, 0.5), 
                    animationClip = v32.props.animationClip, 
                    thumbnailParameters = v32.state.thumbnailParameters
                })
            })
        };
        local l_createElement_2 = v1.createElement;
        local v53 = "Frame";
        local v54 = {
            LayoutOrder = 1, 
            Size = v38.leversSize, 
            AnchorPoint = Vector2.new(0, 0), 
            Position = v38.leversPosition, 
            BackgroundColor3 = Color3.new(1, 0, 0), 
            BackgroundTransparency = 1
        };
        local v55 = {
            ListLayout = v1.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center
            }), 
            FrameDescriptionLabel = v1.createElement("TextLabel", {
                LayoutOrder = 0, 
                Size = UDim2.new(1, 0, 0, 15), 
                Font = l_Font_0.Body.Font, 
                TextSize = 12, 
                Text = v33.timeLabelText, 
                TextColor3 = l_Theme_0.TextDefault.Color, 
                BackgroundTransparency = 1, 
                TextXAlignment = Enum.TextXAlignment.Left
            }), 
            TimeSlider = v1.createElement(l_SystemSlider_0, {
                layoutOrder = 1, 
                min = v32.state.timeSliderMin, 
                max = v32.state.timeSliderMax, 
                stepInterval = v32.state.timeSliderStepInterval, 
                value = l_thumbnailKeyframe_0, 
                onValueChanged = v32.onKeyframeOrTimeChanged, 
                width = UDim.new(1, 0), 
                position = UDim2.new(0, 0, 0.5, 0), 
                anchorPoint = Vector2.new(0, 0.5), 
                NextSelectionDown = v32.rotationSliderRef, 
                [v1.Ref] = v32.timeSliderRef
            }), 
            RotationDescriptionLabel = v1.createElement("TextLabel", {
                LayoutOrder = 2, 
                Size = UDim2.new(1, 0, 0, 15), 
                Font = l_Font_0.Body.Font, 
                TextSize = 12, 
                Text = v33.rotationLabelText, 
                TextColor3 = l_Theme_0.TextDefault.Color, 
                BackgroundTransparency = 1, 
                TextXAlignment = Enum.TextXAlignment.Left
            })
        };
        local l_createElement_3 = v1.createElement;
        local l_l_SystemSlider_0_0 = l_SystemSlider_0;
        local v58 = {
            layoutOrder = 3, 
            min = v15.Rotation.Range.Min, 
            max = v15.Rotation.Range.Max
        };
        local l_Rotation_0 = v15.Rotation;
        v58.stepInterval = (l_Rotation_0.Range.Max - l_Rotation_0.Range.Min) / (l_Rotation_0.Increments - 1);
        v58.value = l_thumbnailCharacterRotation_0;
        v58.onValueChanged = v32.onRotateChanged;
        v58.width = UDim.new(1, 0);
        v58.position = UDim2.new(0, 0, 0.5, 0);
        v58.anchorPoint = Vector2.new(0, 0.5);
        v58.NextSelectionUp = v32.timeSliderRef;
        v58[v1.Ref] = v32.rotationSliderRef;
        v55.RotationSlider = l_createElement_3(l_l_SystemSlider_0_0, v58);
        v51.Levers = l_createElement_2(v53, v54, v55);
        v47.TopSection = l_createElement_1(v49, v50, v51);
        return l_createElement_0(l_Frame_0, v46, v47);
    end);
end;
v16.renderAlertLocalized = function(v60, v61) --[[ Line: 260 ]] --[[ Name: renderAlertLocalized ]]
    -- upvalues: v1 (copy), l_InteractiveAlert_0 (copy), l_ButtonType_0 (copy)
    return v1.createElement(l_InteractiveAlert_0, {
        title = v61.titleText or "", 
        buttonStackInfo = {
            buttons = {
                {
                    props = {
                        onActivated = v60.onCancelPressed, 
                        text = v61.cancelButtonText
                    }, 
                    isDefaultChild = true
                }, 
                {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        onActivated = v60.onUpdatePressed, 
                        text = v61.updateButtonText
                    }, 
                    isDefaultChild = false
                }
            }
        }, 
        middleContent = function() --[[ Line: 282 ]] --[[ Name: middleContent ]]
            -- upvalues: v60 (copy), v61 (copy)
            return v60:renderMiddle(v61);
        end, 
        screenSize = v60.props.screenSize, 
        defaultChildRef = v60.props.defaultChildRef, 
        isMiddleContentFocusable = true
    });
end;
local function v62() --[[ Line: 291 ]] --[[ Name: GetLocalizedStrings ]]
    -- upvalues: v5 (copy)
    return {
        cancelButtonText = v5:FormatByKey("CoreScripts.EmoteThumbnailEditor.Action.Cancel"), 
        updateButtonText = v5:FormatByKey("CoreScripts.EmoteThumbnailEditor.Action.Update"), 
        titleText = v5:FormatByKey("CoreScripts.EmoteThumbnailEditor.Heading.EditThumbnail"), 
        rotationLabelText = v5:FormatByKey("CoreScripts.EmoteThumbnailEditor.Label.Rotation"), 
        timeLabelText = v5:FormatByKey("CoreScripts.EmoteThumbnailEditor.Label.Time")
    };
end;
v16.render = function(v63) --[[ Line: 303 ]] --[[ Name: render ]]
    -- upvalues: v62 (copy)
    return v63:renderAlertLocalized((v62()));
end;
return v16;