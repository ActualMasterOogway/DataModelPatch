local l_UserInputService_0 = game:GetService("UserInputService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AuthCommon");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.RoactRodux);
local v4 = require(l_Parent_0.Roact);
local v5 = require(l_Parent_0.UIBlox);
local l_withStyle_0 = v5.Style.withStyle;
local l_ImageSetLabel_0 = v5.Core.ImageSet.ImageSetLabel;
local l_GetImageData_0 = require(l_Parent_0.RobloxAppAssets).GetImageData;
local v9 = require(l_script_FirstAncestor_0.Utils.AreaTest);
local l_withSelectionCursorProvider_0 = v5.App.SelectionImage.withSelectionCursorProvider;
local l_CursorKind_0 = v5.App.SelectionImage.CursorKind;
local l_OpenTypeSupport_0 = v5.Utility.OpenTypeSupport;
local l_GetFFlagLuaAppFixSelectionCursor_0 = require(l_Parent_0.SharedFlags).GetFFlagLuaAppFixSelectionCursor;
local l_GetFFlagEnableTextFieldContentType_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableTextFieldContentType;
local l_GetFFlagLuaAppEnableOpenTypeSupport_0 = require(l_Parent_0.SharedFlags).GetFFlagLuaAppEnableOpenTypeSupport;
local v16 = game:DefineFastFlag("EnableKeyboardVisibilityCheckOnPasswordFocus", false);
local v17 = v4.PureComponent:extend("PasswordBox");
v17.init = function(v18) --[[ Line: 38 ]] --[[ Name: init ]]
    -- upvalues: v4 (copy), v9 (copy), v16 (copy), l_UserInputService_0 (copy)
    v18.state = {
        hidePassword = true, 
        containerSize = Vector2.new(0, 0)
    };
    v18.getHidePassword = function() --[[ Line: 45 ]]
        -- upvalues: v18 (copy)
        if v18.props.hidePassword ~= nil then
            return v18.props.hidePassword;
        else
            return v18.state.hidePassword;
        end;
    end;
    v18.isMounted = false;
    v18.passwordBoxRef = v4.createRef();
    local v19 = v4.createRef();
    v18.getPasswordTextBoxRef = function() --[[ Line: 57 ]]
        -- upvalues: v18 (copy), v19 (copy)
        return v18.props.TextBoxRef or v19;
    end;
    v18.isTouchPositionInPasswordBox = function(v20) --[[ Line: 61 ]]
        -- upvalues: v18 (copy), v9 (ref)
        if not v18.passwordBoxRef.current then
            return false;
        else
            local l_AbsolutePosition_0 = v18.passwordBoxRef.current.AbsolutePosition;
            local l_AbsoluteSize_0 = v18.passwordBoxRef.current.AbsoluteSize;
            return v9.IsPointInRect(Rect.new(l_AbsolutePosition_0, l_AbsolutePosition_0 + l_AbsoluteSize_0), v20);
        end;
    end;
    v18.tapBeganInTextbox = false;
    v18.tapEventBegan = function(v23, _) --[[ Line: 75 ]]
        -- upvalues: v18 (copy), v16 (ref), l_UserInputService_0 (ref)
        if v18.props.CentralOverlayBlocksInput and v18.props.centralOverlay and v18.props.centralOverlay.OverlayType ~= nil then
            return;
        elseif v16 and not l_UserInputService_0.OnScreenKeyboardVisible then
            return;
        else
            v18.tapBeganInTextbox = v18.isTouchPositionInPasswordBox(v23);
            local l_current_0 = v18.getPasswordTextBoxRef().current;
            local l_l_UserInputService_0_FocusedTextBox_0 = l_UserInputService_0:GetFocusedTextBox();
            if l_current_0 and l_l_UserInputService_0_FocusedTextBox_0 ~= l_current_0 and v18.tapBeganInTextbox and v18.props.CaptureFocusOnTapStart then
                if l_l_UserInputService_0_FocusedTextBox_0 then
                    l_l_UserInputService_0_FocusedTextBox_0:ReleaseFocus();
                end;
                l_current_0:CaptureFocus();
            end;
            return;
        end;
    end;
    v18.tapEventEnded = function(v27, _) --[[ Line: 109 ]]
        -- upvalues: v18 (copy), l_UserInputService_0 (ref)
        if v18.tapBeganInTextbox then
            v18.tapBeganInTextbox = false;
            return;
        else
            local l_l_UserInputService_0_FocusedTextBox_1 = l_UserInputService_0:GetFocusedTextBox();
            local l_current_1 = v18.getPasswordTextBoxRef().current;
            if not l_l_UserInputService_0_FocusedTextBox_1 or l_l_UserInputService_0_FocusedTextBox_1 ~= l_current_1 then
                return;
            else
                if not v18.isTouchPositionInPasswordBox(v27) then
                    l_current_1:ReleaseFocus();
                end;
                return;
            end;
        end;
    end;
    v18.onAbsoluteSizeChanged = function(v31) --[[ Line: 127 ]]
        -- upvalues: v18 (copy)
        local l_containerSize_0 = v18.state.containerSize;
        local l_AbsoluteSize_1 = v31.AbsoluteSize;
        if l_AbsoluteSize_1.X > 0 and l_AbsoluteSize_1.Y > 0 and l_containerSize_0 ~= l_AbsoluteSize_1 then
            spawn(function() --[[ Line: 133 ]]
                -- upvalues: v18 (ref), l_AbsoluteSize_1 (copy)
                if v18.isMounted then
                    v18:setState({
                        containerSize = l_AbsoluteSize_1
                    });
                end;
            end);
        end;
    end;
    v18.onTogglerActivated = function(_) --[[ Line: 143 ]]
        -- upvalues: v18 (copy)
        local l_onToggleCallback_0 = v18.props.onToggleCallback;
        local v36 = v18.getHidePassword();
        if l_onToggleCallback_0 then
            l_onToggleCallback_0(v36);
        end;
        if v18.isMounted then
            v18:setState({
                hidePassword = not v36
            });
        end;
    end;
    v18.shouldTakeInput = function(v37) --[[ Line: 158 ]]
        -- upvalues: v18 (copy)
        if v18.props.Disabled then
            return false;
        else
            local v38 = true;
            if v37.UserInputType ~= Enum.UserInputType.MouseButton1 then
                v38 = v37.UserInputType == Enum.UserInputType.Touch;
            end;
            return not v18.props.ManualFocusRelease and v38;
        end;
    end;
end;
v17.defaultProps = {
    TextXAlignment = Enum.TextXAlignment.Left, 
    PaddingX = 10, 
    PaddingY = 7, 
    ClearTextOnFocus = false, 
    IsKeyboardOverlayUsed = true
};
v17.didMount = function(v39) --[[ Line: 178 ]] --[[ Name: didMount ]]
    -- upvalues: l_UserInputService_0 (copy)
    v39.isMounted = true;
    if v39.props.IsKeyboardOverlayUsed then
        v39.inputBeganConnection = l_UserInputService_0.InputBegan:connect(function(v40, v41) --[[ Line: 182 ]]
            -- upvalues: v39 (copy)
            if v39.shouldTakeInput(v40) then
                v39.tapEventBegan(v40.Position, v41);
            end;
        end);
        v39.inputEndedConnection = l_UserInputService_0.InputEnded:connect(function(v42, v43) --[[ Line: 188 ]]
            -- upvalues: v39 (copy)
            if v39.shouldTakeInput(v42) then
                v39.tapEventEnded(v42.Position, v43);
            end;
        end);
    end;
end;
v17.willUnmount = function(v44) --[[ Line: 196 ]] --[[ Name: willUnmount ]]
    v44.isMounted = false;
    if v44.props.IsKeyboardOverlayUsed then
        if v44.inputBeganConnection then
            v44.inputBeganConnection:disconnect();
        end;
        if v44.inputEndedConnection then
            v44.inputEndedConnection:disconnect();
        end;
    end;
end;
v17.render = function(v45) --[[ Line: 208 ]] --[[ Name: render ]]
    -- upvalues: l_GetFFlagLuaAppFixSelectionCursor_0 (copy), l_withSelectionCursorProvider_0 (copy)
    if l_GetFFlagLuaAppFixSelectionCursor_0() then
        return l_withSelectionCursorProvider_0(function(v46) --[[ Line: 210 ]]
            -- upvalues: v45 (copy)
            return v45:renderWithSelectionCursor(v46);
        end);
    else
        return v45:renderWithSelectionCursor(nil);
    end;
end;
v17.renderWithSelectionCursor = function(v47, v48) --[[ Line: 218 ]] --[[ Name: renderWithSelectionCursor ]]
    -- upvalues: l_GetFFlagEnableTextFieldContentType_0 (copy), l_withStyle_0 (copy), l_GetFFlagLuaAppFixSelectionCursor_0 (copy), l_CursorKind_0 (copy), v4 (copy), l_ImageSetLabel_0 (copy), l_GetImageData_0 (copy), l_GetFFlagLuaAppEnableOpenTypeSupport_0 (copy), l_OpenTypeSupport_0 (copy)
    local l_Size_0 = v47.props.Size;
    local l_Position_0 = v47.props.Position;
    local l_LayoutOrder_0 = v47.props.LayoutOrder;
    local l_Text_0 = v47.props.Text;
    local l_TextSize_0 = v47.props.TextSize;
    local l_PlaceholderText_0 = v47.props.PlaceholderText;
    local l_TextXAlignment_0 = v47.props.TextXAlignment;
    local l_TextColor_0 = v47.props.TextColor;
    local l_PlaceholderColor_0 = v47.props.PlaceholderColor;
    local l_ClearTextOnFocus_0 = v47.props.ClearTextOnFocus;
    local l_Color_0 = v47.props.Color;
    local l_Transparency_0 = v47.props.Transparency;
    local l_TextTransparency_0 = v47.props.TextTransparency;
    local l_ReturnKeyType_0 = v47.props.ReturnKeyType;
    local l_NextSelectionDown_0 = v47.props.NextSelectionDown;
    local l_NextSelectionLeft_0 = v47.props.NextSelectionLeft;
    local l_NextSelectionRight_0 = v47.props.NextSelectionRight;
    local l_NextSelectionUp_0 = v47.props.NextSelectionUp;
    local l_PaddingX_0 = v47.props.PaddingX;
    local l_PaddingY_0 = v47.props.PaddingY;
    local v69 = v47.getHidePassword();
    local l_Y_0 = v47.state.containerSize.Y;
    local l_onFocused_0 = v47.props.onFocused;
    local l_onFocusLost_0 = v47.props.onFocusLost;
    local l_onMouseEnter_0 = v47.props.onMouseEnter;
    local l_onMouseLeave_0 = v47.props.onMouseLeave;
    local v75 = l_GetFFlagEnableTextFieldContentType_0() and Enum.TextInputType.PasswordShown or Enum.TextInputType.NoSuggestions;
    return l_withStyle_0(function(v76) --[[ Line: 254 ]]
        -- upvalues: l_GetFFlagLuaAppFixSelectionCursor_0 (ref), v48 (copy), l_CursorKind_0 (ref), v4 (ref), l_ImageSetLabel_0 (ref), l_Size_0 (copy), l_Position_0 (copy), l_LayoutOrder_0 (copy), l_GetImageData_0 (ref), l_Color_0 (copy), l_Transparency_0 (copy), v47 (copy), l_Y_0 (copy), l_Text_0 (copy), l_PlaceholderText_0 (copy), l_PlaceholderColor_0 (copy), l_GetFFlagLuaAppEnableOpenTypeSupport_0 (ref), l_OpenTypeSupport_0 (ref), l_TextSize_0 (copy), l_TextColor_0 (copy), l_TextTransparency_0 (copy), l_TextXAlignment_0 (copy), l_ClearTextOnFocus_0 (copy), v69 (copy), v75 (copy), l_ReturnKeyType_0 (copy), l_NextSelectionDown_0 (copy), l_NextSelectionLeft_0 (copy), l_NextSelectionRight_0 (copy), l_NextSelectionUp_0 (copy), l_onFocused_0 (copy), l_onFocusLost_0 (copy), l_onMouseEnter_0 (copy), l_onMouseLeave_0 (copy), l_PaddingY_0 (copy), l_PaddingX_0 (copy)
        local v77 = nil;
        if l_GetFFlagLuaAppFixSelectionCursor_0() then
            v77 = v48(l_CursorKind_0.InputButton);
        end;
        return v4.createElement(l_ImageSetLabel_0, {
            Size = l_Size_0, 
            Position = l_Position_0, 
            LayoutOrder = l_LayoutOrder_0, 
            BackgroundTransparency = 1, 
            Image = l_GetImageData_0("LuaApp/buttons/buttonFill") or "LuaApp/buttons/buttonFill", 
            ImageColor3 = l_Color_0, 
            ImageTransparency = l_Transparency_0, 
            BorderSizePixel = 0, 
            ScaleType = Enum.ScaleType.Slice, 
            SliceCenter = Rect.new(8, 8, 9, 9), 
            [v4.Ref] = v47.passwordBoxRef, 
            [v4.Change.AbsoluteSize] = v47.onAbsoluteSizeChanged
        }, {
            TextBoxContainer = v4.createElement("Frame", {
                Size = UDim2.new(1, -l_Y_0, 1, 0), 
                BackgroundTransparency = 1
            }, {
                TextBox = v4.createElement("TextBox", {
                    Size = UDim2.new(1, 0, 1, 0), 
                    Position = UDim2.new(0.5, 0, 0.5, 0), 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Text = l_Text_0, 
                    PlaceholderText = l_PlaceholderText_0, 
                    PlaceholderColor3 = l_PlaceholderColor_0, 
                    Font = v76.Font.Body.Font, 
                    OpenTypeFeatures = if l_GetFFlagLuaAppEnableOpenTypeSupport_0() then l_OpenTypeSupport_0:getPasswordStylisticAlternative() else nil, 
                    TextSize = l_TextSize_0, 
                    TextColor3 = l_TextColor_0, 
                    TextTransparency = l_TextTransparency_0, 
                    TextXAlignment = l_TextXAlignment_0, 
                    TextYAlignment = Enum.TextYAlignment.Center, 
                    BackgroundTransparency = 1, 
                    ClearTextOnFocus = l_ClearTextOnFocus_0, 
                    OverlayNativeInput = true, 
                    ManualFocusRelease = v47.props.IsKeyboardOverlayUsed, 
                    ClipsDescendants = true, 
                    TextInputType = v69 and Enum.TextInputType.Password or v75, 
                    ReturnKeyType = l_ReturnKeyType_0, 
                    NextSelectionDown = l_NextSelectionDown_0, 
                    NextSelectionLeft = l_NextSelectionLeft_0, 
                    NextSelectionRight = l_NextSelectionRight_0, 
                    NextSelectionUp = l_NextSelectionUp_0, 
                    SelectionImageObject = v77, 
                    [v4.Ref] = v47.getPasswordTextBoxRef(), 
                    [v4.Change.Text] = v47.props.onChangeText, 
                    [v4.Event.ReturnPressedFromOnScreenKeyboard] = v47.props.onReturnPressedFromOnScreenKeyboard, 
                    [v4.Event.Focused] = l_onFocused_0, 
                    [v4.Event.FocusLost] = l_onFocusLost_0, 
                    [v4.Event.MouseEnter] = l_onMouseEnter_0, 
                    [v4.Event.MouseLeave] = l_onMouseLeave_0
                }), 
                UIPadding = v4.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, l_PaddingY_0), 
                    PaddingBottom = UDim.new(0, l_PaddingY_0), 
                    PaddingLeft = UDim.new(0, l_PaddingX_0), 
                    PaddingRight = UDim.new(0, l_PaddingX_0)
                })
            }), 
            Toggler = v4.createElement("TextButton", {
                Position = UDim2.new(1, 0, 0.5, 0), 
                Size = UDim2.new(0, l_Y_0, 1, 0), 
                AnchorPoint = Vector2.new(1, 0.5), 
                Text = "", 
                BackgroundTransparency = 1, 
                SelectionImageObject = v77, 
                [v4.Event.Activated] = v47.onTogglerActivated
            }, {
                ImageLabel = v4.createElement(l_ImageSetLabel_0, {
                    Size = UDim2.new(0, 16, 0, 16), 
                    Position = UDim2.new(0.5, 0, 0.5, 0), 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    BackgroundTransparency = 1, 
                    Image = if v69 then l_GetImageData_0("LuaApp/icons/actions_privacy_show") or "LuaApp/icons/actions_privacy_show" else l_GetImageData_0("LuaApp/icons/actions_edit_hide") or "LuaApp/icons/actions_edit_hide", 
                    ImageColor3 = v76.Theme.UIDefault.Color, 
                    ImageTransparency = v76.Theme.UIDefault.Transparency
                })
            })
        });
    end);
end;
return (v3.connect(function(v78, _) --[[ Line: 345 ]]
    return {
        centralOverlay = v78.CentralOverlay
    };
end)(v17));