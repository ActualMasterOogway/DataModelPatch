local l_CorePackages_0 = game:GetService("CorePackages");
local l_TextService_0 = game:GetService("TextService");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Packages.RoactRodux);
local v5 = require(l_CorePackages_0.Packages.t);
local v6 = require(l_CorePackages_0.Packages.RoactGamepad);
local v7 = require(l_RobloxGui_0.Modules.RobloxTranslator);
local l_Focusable_0 = v6.Focusable;
local v9 = require(l_CorePackages_0.Packages.UIBlox);
local l_withStyle_0 = v9.Style.withStyle;
local l_withSelectionCursorProvider_0 = v9.App.SelectionImage.withSelectionCursorProvider;
local l_CursorKind_0 = v9.App.SelectionImage.CursorKind;
local l_Images_0 = v9.App.ImageSet.Images;
local l_ImageSetLabel_0 = v9.Core.ImageSet.ImageSetLabel;
local v15 = l_Images_0["component_assets/circle_17_stroke_1"];
local v16 = Rect.new(8, 8, 8, 8);
local l_Parent_0 = script.Parent.Parent;
local v18 = require(l_Parent_0.GetFFlagValidateDescription);
local v19 = v3.PureComponent:extend("AssetDescriptionTextBox");
v19.validateProps = v5.strictInterface({
    Size = v5.optional(v5.UDim2), 
    Position = v5.optional(v5.UDim2), 
    onAssetDescriptionUpdated = v5.callback, 
    descriptionTextBoxRef = v5.optional(v5.table), 
    NextSelectionUp = v5.optional(v5.table), 
    assetType = v5.optional(v5.enum(Enum.AssetType)), 
    defaultDescription = v5.optional(v5.string)
});
local function _(v20) --[[ Line: 55 ]] --[[ Name: getStringLength ]]
    local v21 = utf8.len(utf8.nfcnormalize(v20));
    if v21 == nil then
        return 0;
    else
        return v21;
    end;
end;
local function _(v23, v24) --[[ Line: 64 ]] --[[ Name: isDescriptionTooLong ]]
    local v25 = utf8.len(utf8.nfcnormalize(v23));
    return v24 < (v25 == nil and 0 or v25);
end;
v19.init = function(v27) --[[ Line: 68 ]] --[[ Name: init ]]
    v27:setState({
        lastValidDescription = "", 
        assetDescription = v27.props.defaultDescription or "", 
        descriptionLength = 0, 
        scrollingFrameHeight = 100, 
        canvasHeight = 100, 
        canvasPosition = 0, 
        cursorPosition = 0, 
        textBoxWidth = 100, 
        isDescriptionValid = true
    });
    v27.wasInitiallyFocused = false;
    v27.tryFocusTextBox = function() --[[ Line: 83 ]]
        -- upvalues: v27 (copy)
        if v27.wasInitiallyFocused then
            return;
        else
            local v28 = v27.props.descriptionTextBoxRef:getValue();
            if v28 and v28:IsDescendantOf(game) then
                v28:CaptureFocus();
                v27.wasInitiallyFocused = true;
            end;
            return;
        end;
    end;
end;
v19.calculateNeedsRescroll = function(v29, v30, v31) --[[ Line: 97 ]] --[[ Name: calculateNeedsRescroll ]]
    -- upvalues: l_TextService_0 (copy)
    if v29.state.cursorPosition == -1 then
        return;
    else
        local v32 = (v29.state.assetDescription or ""):sub(1, v29.state.cursorPosition - 1);
        local v33 = v31.RelativeSize * v30.Font.BaseSize;
        local v34 = Vector2.new(v29.state.textBoxWidth, 10000);
        local l_l_TextService_0_TextSize_0 = l_TextService_0:GetTextSize(v32, v33, v31.Font, v34);
        if l_l_TextService_0_TextSize_0.Y > v29.state.scrollingFrameHeight + v29.state.canvasPosition then
            v29:setState({
                canvasPosition = l_l_TextService_0_TextSize_0.Y - v29.state.scrollingFrameHeight
            });
            return;
        else
            if l_l_TextService_0_TextSize_0.Y - v33 < v29.state.canvasPosition then
                v29:setState({
                    canvasPosition = l_l_TextService_0_TextSize_0.Y - v33
                });
            end;
            return;
        end;
    end;
end;
v19.onTextChanged = function(v36, v37, v38, v39) --[[ Line: 130 ]] --[[ Name: onTextChanged ]]
    -- upvalues: v18 (copy), l_TextService_0 (copy)
    local l_Text_0 = v37.Text;
    local v41 = not v18() or l_Text_0 ~= "";
    local l_lastValidDescription_0 = v36.state.lastValidDescription;
    local v43 = utf8.len(utf8.nfcnormalize(l_Text_0));
    if (v43 == nil and 0 or v43) > 1000 then
        l_Text_0 = l_lastValidDescription_0;
        v37.Text = l_Text_0;
    else
        l_lastValidDescription_0 = v37.Text;
    end;
    local v44 = utf8.len(utf8.nfcnormalize(l_Text_0));
    local v45 = v44 == nil and 0 or v44;
    local v46 = v39.RelativeSize * v38.Font.BaseSize;
    v44 = Vector2.new(v36.state.textBoxWidth, 10000);
    v43 = l_TextService_0:GetTextSize(l_Text_0, v46, v39.Font, v44);
    v36:setState({
        lastValidDescription = l_lastValidDescription_0, 
        assetDescription = l_Text_0, 
        descriptionLength = v45, 
        canvasHeight = math.max(100, v43.Y), 
        isDescriptionValid = v41
    });
    v36.props.onAssetDescriptionUpdated(l_Text_0, v41);
end;
v19.renderWithProviders = function(v47, v48, v49) --[[ Line: 163 ]] --[[ Name: renderWithProviders ]]
    -- upvalues: v18 (copy), v3 (copy), l_ImageSetLabel_0 (copy), v15 (copy), v16 (copy), l_Focusable_0 (copy), v7 (copy), l_CursorKind_0 (copy)
    local l_Font_0 = v48.Font;
    local l_CaptionBody_0 = l_Font_0.CaptionBody;
    local l_Theme_0 = v48.Theme;
    local v53 = if v18() then not v47.state.isDescriptionValid else false;
    return v3.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = v47.props.Size, 
        Position = v47.props.Position
    }, {
        TextboxContainer = v3.createElement(l_ImageSetLabel_0, {
            BackgroundTransparency = 1, 
            Image = v15, 
            ImageColor3 = l_Theme_0.UIDefault.Color, 
            ImageTransparency = l_Theme_0.UIDefault.Transparency, 
            LayoutOrder = 1, 
            ScaleType = Enum.ScaleType.Slice, 
            Size = UDim2.new(1, 0, 1, -15), 
            SliceCenter = v16
        }, {
            ScrollingFrame = v3.createElement("ScrollingFrame", {
                Size = UDim2.fromScale(1, 1), 
                BackgroundTransparency = 1, 
                CanvasPosition = Vector2.new(0, v47.state.canvasPosition), 
                AutomaticCanvasSize = Enum.AutomaticSize.Y, 
                ScrollBarThickness = 12, 
                BorderSizePixel = 0, 
                [v3.Change.CanvasPosition] = function(v54) --[[ Line: 193 ]]
                    -- upvalues: v47 (copy)
                    v47:setState({
                        canvasPosition = v54.CanvasPosition.Y
                    });
                end, 
                [v3.Change.AbsoluteSize] = function(v55) --[[ Line: 199 ]]
                    -- upvalues: v47 (copy), v48 (copy), l_CaptionBody_0 (copy)
                    v47:setState({
                        scrollingFrameHeight = v55.AbsoluteSize.Y
                    });
                    v47:calculateNeedsRescroll(v48, l_CaptionBody_0);
                end
            }, {
                Textbox = v3.createElement(l_Focusable_0.TextBox, {
                    Text = v47.state.assetDescription, 
                    BackgroundTransparency = 1, 
                    ClearTextOnFocus = false, 
                    Font = l_Font_0.Header2.Font, 
                    TextSize = l_Font_0.BaseSize * l_CaptionBody_0.RelativeSize, 
                    PlaceholderColor3 = l_Theme_0.PlaceHolder.Color, 
                    PlaceholderText = v7:FormatByKey("CoreScripts.PublishAssetPrompt.AssetDescriptionPlaceholder"), 
                    Position = UDim2.fromOffset(6, 0), 
                    Size = UDim2.new(1, -24, 0, v47.state.canvasHeight), 
                    MultiLine = true, 
                    TextColor3 = l_Theme_0.TextDefault.Color, 
                    TextTruncate = Enum.TextTruncate.AtEnd, 
                    TextWrapped = true, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextYAlignment = Enum.TextYAlignment.Top, 
                    OverlayNativeInput = true, 
                    NextSelectionUp = v47.props.NextSelectionUp, 
                    [v3.Change.TextFits] = v47.onTextFitsChanged, 
                    SelectionImageObject = v49(l_CursorKind_0.InputFields), 
                    [v3.Ref] = v47.props.descriptionTextBoxRef, 
                    [v3.Event.AncestryChanged] = v47.tryFocusTextBox, 
                    [v3.Change.Text] = function(v56) --[[ Line: 232 ]]
                        -- upvalues: v47 (copy), v48 (copy), l_CaptionBody_0 (copy)
                        v47:onTextChanged(v56, v48, l_CaptionBody_0);
                    end, 
                    [v3.Change.AbsoluteSize] = function(v57) --[[ Line: 236 ]]
                        -- upvalues: v47 (copy), v48 (copy), l_CaptionBody_0 (copy)
                        v47:setState({
                            textBoxWidth = v57.AbsoluteSize.X
                        });
                        v47:calculateNeedsRescroll(v48, l_CaptionBody_0);
                    end, 
                    [v3.Change.CursorPosition] = function(v58) --[[ Line: 243 ]]
                        -- upvalues: v47 (copy), v48 (copy), l_CaptionBody_0 (copy)
                        v47:setState({
                            cursorPosition = v58.CursorPosition
                        });
                        v47:calculateNeedsRescroll(v48, l_CaptionBody_0);
                    end
                })
            })
        }), 
        LengthDisplay = if v47.state.descriptionLength / 1000 > 0.9 then v3.createElement("TextLabel", {
            Size = UDim2.new(v18() and 0.2 or 1, 0, 0, 15), 
            AnchorPoint = Vector2.new(1, 1), 
            Position = UDim2.fromScale(1, 1), 
            Text = v47.state.descriptionLength .. "/" .. 1000, 
            TextXAlignment = Enum.TextXAlignment.Right, 
            TextColor3 = l_Theme_0.TextDefault.Color, 
            BackgroundTransparency = 1
        }) else nil, 
        WarningText = v18() and v53 and v3.createElement("TextLabel", {
            Position = UDim2.new(0, 0, 1, -15), 
            BackgroundTransparency = 1, 
            Text = v7:FormatByKey("CoreScripts.PublishAssetPrompt.InvalidDescription"), 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Top, 
            Size = UDim2.new(0.8, 0, 0, 20), 
            TextColor3 = l_Theme_0.Alert.Color, 
            TextWrapped = true, 
            Font = l_Font_0.Body.Font, 
            TextSize = 12
        })
    });
end;
v19.render = function(v59) --[[ Line: 280 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), l_withSelectionCursorProvider_0 (copy)
    return l_withStyle_0(function(v60) --[[ Line: 281 ]]
        -- upvalues: l_withSelectionCursorProvider_0 (ref), v59 (copy)
        return l_withSelectionCursorProvider_0(function(v61) --[[ Line: 282 ]]
            -- upvalues: v59 (ref), v60 (copy)
            return v59:renderWithProviders(v60, v61);
        end);
    end);
end;
v19.didMount = function(v62) --[[ Line: 288 ]] --[[ Name: didMount ]]
    v62.tryFocusTextBox();
end;
return v4.connect(function(v63) --[[ Line: 292 ]] --[[ Name: mapStateToProps ]]
    return {
        assetType = v63.promptRequest.promptInfo.assetType
    };
end)(v19);