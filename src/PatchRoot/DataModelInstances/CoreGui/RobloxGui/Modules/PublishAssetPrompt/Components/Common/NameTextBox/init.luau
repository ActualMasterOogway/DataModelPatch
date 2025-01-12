local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.t);
local v4 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v6 = require(l_RobloxGui_0.Modules.RobloxTranslator);
local l_Focusable_0 = v4.Focusable;
local v8 = require(l_CorePackages_0.Packages.UIBlox);
local l_withStyle_0 = v8.Style.withStyle;
local l_withSelectionCursorProvider_0 = v8.App.SelectionImage.withSelectionCursorProvider;
local l_CursorKind_0 = v8.App.SelectionImage.CursorKind;
local l_Images_0 = v8.App.ImageSet.Images;
local l_ImageSetLabel_0 = v8.Core.ImageSet.ImageSetLabel;
local v14 = l_Images_0["component_assets/circle_17_stroke_1"];
local v15 = Rect.new(8, 8, 8, 8);
local v16 = v2.PureComponent:extend("NameTextBox");
local v17 = game:DefineFastFlag("RemoveNameRegex", false);
local v18 = require(script.Parent.Parent.Parent.FFlagPublishAvatarPromptEnabled);
local v19 = require(script.Parent.Parent.Parent.FFlagPromptCreateAvatarDescriptionInvalidFix);
v16.validateProps = v3.strictInterface({
    Size = v3.optional(v3.UDim2), 
    Position = v3.optional(v3.UDim2), 
    centerText = v3.optional(v3.boolean), 
    maxLength = v3.optional(v3.number), 
    onNameUpdated = v3.callback, 
    LayoutOrder = v3.optional(v3.number), 
    nameTextBoxRef = v3.optional(v3.table), 
    NextSelectionDown = v3.optional(v3.table), 
    defaultName = v3.optional(v3.string), 
    invalidInputText = v3.optional(v3.string)
});
v16.defaultProps = {
    maxLength = 50, 
    centerText = true, 
    invalidInputText = v6:FormatByKey("CoreScripts.PublishAssetPrompt.InvalidName")
};
local function _(v20, v21) --[[ Line: 58 ]] --[[ Name: isNameTooLong ]]
    local v22 = utf8.len(utf8.nfcnormalize(v20));
    if v22 == nil then
        return true;
    else
        return v21 < v22;
    end;
end;
v16.init = function(v24) --[[ Line: 67 ]] --[[ Name: init ]]
    -- upvalues: v18 (copy)
    v24:setState({
        name = v24.props.defaultName or "", 
        lastValidName = "", 
        isNameValid = true
    });
    v24.wasInitiallyFocused = false;
    v24.tryFocusTextBox = function() --[[ Line: 76 ]]
        -- upvalues: v24 (copy), v18 (ref)
        if v24.wasInitiallyFocused then
            return;
        else
            local v25 = if v18 then v24.props.nameTextBoxRef and v24.props.nameTextBoxRef:getValue() else v24.props.nameTextBoxRef:getValue();
            if v25 and v25:IsDescendantOf(game) then
                v25:CaptureFocus();
                v24.wasInitiallyFocused = true;
            end;
            return;
        end;
    end;
    v24.onTextChanged = function(v26) --[[ Line: 90 ]]
        -- upvalues: v18 (ref), v24 (copy)
        local l_Text_0 = v26.Text;
        local v28 = if v18 then v24.props.maxLength else 50;
        local v29 = utf8.len(utf8.nfcnormalize(l_Text_0));
        if v29 == nil or v28 < v29 then
            l_Text_0 = string.sub(l_Text_0, 1, utf8.offset(l_Text_0, v28 + 1) - 1);
            v26.Text = l_Text_0;
        end;
        local v30 = v24:checkIsNameValid(l_Text_0);
        local l_lastValidName_0 = v24.state.lastValidName;
        if v30 then
            l_lastValidName_0 = v26.Text;
        end;
        v24:setState({
            lastValidName = l_lastValidName_0, 
            isNameValid = v30, 
            name = l_Text_0
        });
        v24.props.onNameUpdated(l_Text_0, v30);
    end;
end;
v16.checkIsNameValid = function(_, v33) --[[ Line: 117 ]] --[[ Name: checkIsNameValid ]]
    -- upvalues: v17 (copy)
    if not v17 then
        if not string.match(v33, "[0-9a-zA-Z_'%s]+$") then
            return false;
        elseif string.sub(v33, 1, 1) == " " then
            return false;
        end;
    end;
    if string.match(v33, "^%s*$") then
        return false;
    else
        return true;
    end;
end;
v16.renderWithProviders = function(v34, v35, v36) --[[ Line: 137 ]] --[[ Name: renderWithProviders ]]
    -- upvalues: v2 (copy), l_Focusable_0 (copy), l_CursorKind_0 (copy), l_ImageSetLabel_0 (copy), v14 (copy), v15 (copy), v6 (copy), v18 (copy), v19 (copy)
    local l_Font_0 = v35.Font;
    local l_Theme_0 = v35.Theme;
    local l_Body_0 = l_Font_0.Body;
    local v40 = not v34.state.isNameValid;
    local v41 = v2.createElement("Frame", {
        BackgroundColor3 = l_Theme_0.BackgroundMuted.Color, 
        LayoutOrder = 1, 
        Size = v34.props.Size
    }, {
        Textbox = v2.createElement(l_Focusable_0.TextBox, {
            Text = v34.state.name, 
            BackgroundTransparency = 1, 
            ClearTextOnFocus = false, 
            Font = l_Body_0.Font, 
            TextSize = l_Font_0.BaseSize * l_Body_0.RelativeSize, 
            PlaceholderColor3 = l_Theme_0.PlaceHolder.Color, 
            PlaceholderText = v34.props.defaultName, 
            Position = UDim2.fromOffset(6, 0), 
            Size = UDim2.new(1, -12, 1, 0), 
            TextColor3 = l_Theme_0.TextDefault.Color, 
            TextTruncate = Enum.TextTruncate.AtEnd, 
            TextWrapped = true, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = if not v34.props.centerText then Enum.TextYAlignment.Top else nil, 
            OverlayNativeInput = true, 
            [v2.Change.Text] = v34.onTextChanged, 
            SelectionImageObject = v36(l_CursorKind_0.InputFields), 
            NextSelectionDown = v34.props.NextSelectionDown, 
            [v2.Ref] = v34.props.nameTextBoxRef, 
            [v2.Event.AncestryChanged] = v34.tryFocusTextBox
        }, {
            UIPadding = v2.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, 6), 
                PaddingRight = UDim.new(0, 6), 
                PaddingTop = if not v34.props.centerText then UDim.new(0, 6) else nil
            })
        }), 
        UICorner = v2.createElement("UICorner", {
            CornerRadius = UDim.new(0, 8)
        }), 
        UIStroke = v2.createElement("UIStroke", {
            Thickness = 0.5, 
            Transparency = l_Theme_0.Divider.Transparency, 
            Color = l_Theme_0.Divider.Color, 
            ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        })
    });
    local v42 = v2.createElement(l_ImageSetLabel_0, {
        BackgroundTransparency = 1, 
        Image = v14, 
        ImageColor3 = l_Theme_0.UIDefault.Color, 
        ImageTransparency = l_Theme_0.UIDefault.Transparency, 
        LayoutOrder = 1, 
        ScaleType = Enum.ScaleType.Slice, 
        Size = UDim2.new(1, 0, 0, 30), 
        SliceCenter = v15
    }, {
        Textbox = v2.createElement(l_Focusable_0.TextBox, {
            Text = v34.state.name, 
            BackgroundTransparency = 1, 
            ClearTextOnFocus = false, 
            Font = l_Font_0.CaptionBody.Font, 
            TextSize = l_Font_0.BaseSize * l_Font_0.CaptionBody.RelativeSize, 
            PlaceholderColor3 = l_Theme_0.PlaceHolder.Color, 
            PlaceholderText = v6:FormatByKey("CoreScripts.PublishAssetPrompt.AssetNamePlaceholder"), 
            Position = UDim2.fromOffset(6, 0), 
            Size = UDim2.new(1, -12, 1, 0), 
            TextColor3 = l_Theme_0.TextDefault.Color, 
            TextTruncate = Enum.TextTruncate.AtEnd, 
            TextWrapped = true, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            OverlayNativeInput = true, 
            [v2.Change.Text] = v34.onTextChanged, 
            SelectionImageObject = v36(l_CursorKind_0.InputFields), 
            NextSelectionDown = v34.props.NextSelectionDown, 
            [v2.Ref] = v34.props.nameTextBoxRef, 
            [v2.Event.AncestryChanged] = v34.tryFocusTextBox
        })
    });
    return v2.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = v34.props.Size, 
        Position = v34.props.Position, 
        LayoutOrder = if v18 then v34.props.LayoutOrder else nil
    }, {
        TextBoxContainer = if v18 then v41 else v42, 
        WarningText = v40 and v2.createElement("TextLabel", {
            Position = UDim2.new(0, 0, 1, 0), 
            BackgroundTransparency = 1, 
            Text = if v19 then v34.props.invalidInputText else v6:FormatByKey("CoreScripts.PublishAssetPrompt.InvalidName"), 
            LayoutOrder = 2, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Top, 
            Size = UDim2.new(1, 0, 0, 20), 
            TextColor3 = l_Theme_0.Alert.Color, 
            TextWrapped = true, 
            Font = l_Font_0.Body.Font, 
            TextSize = 12
        })
    });
end;
v16.render = function(v43) --[[ Line: 250 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), l_withSelectionCursorProvider_0 (copy)
    return l_withStyle_0(function(v44) --[[ Line: 251 ]]
        -- upvalues: l_withSelectionCursorProvider_0 (ref), v43 (copy)
        return l_withSelectionCursorProvider_0(function(v45) --[[ Line: 252 ]]
            -- upvalues: v43 (ref), v44 (copy)
            return v43:renderWithProviders(v44, v45);
        end);
    end);
end;
v16.didMount = function(v46) --[[ Line: 258 ]] --[[ Name: didMount ]]
    v46.tryFocusTextBox();
end;
return v16;