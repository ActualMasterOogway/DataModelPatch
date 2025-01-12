local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatMakeBackgroundTransparent);
local v3 = require(l_script_FirstAncestor_0.SocialLibraries);
local v4 = require(l_Parent_0.Roact);
local v5 = require(l_Parent_0.UIBlox);
local l_Text_0 = require(l_Parent_0.AppCommonLib).Text;
local l_memoize_0 = require(l_Parent_0.AppCommonLib).memoize;
local l_TextButton_0 = v5.App.Button.TextButton;
local l_Images_0 = v5.App.ImageSet.Images;
local l_IconSize_0 = v5.App.Constant.IconSize;
local l_ImageSetLabel_0 = v5.Core.ImageSet.ImageSetLabel;
local l_CallbackInputBox_0 = v3.Components.CallbackInputBox;
local l_GetFFlagLuaAppEnableFoundationColors_0 = require(l_Parent_0.SharedFlags).GetFFlagLuaAppEnableFoundationColors;
local v14 = l_Images_0["icons/common/search"];
local v15 = l_Images_0["icons/actions/edit/clear_small"];
local v16 = {
    Image = l_Images_0["squircles/fill"], 
    SliceCenter = Rect.new(8, 8, 9, 9)
};
local v17 = v4.PureComponent:extend("SearchTopBar");
v17.defaultProps = {
    cancelText = "CancelPlaceholder", 
    searchPlaceholderText = "PlaceholderText", 
    initialInputText = nil, 
    filterBoxPaddingTop = 6, 
    filterBoxPaddingBottom = 6, 
    filterBoxPaddingLeft = 0, 
    filterBoxPaddingRight = 0, 
    captureFocusOnMount = false, 
    resetOnMount = function() --[[ Line: 44 ]] --[[ Name: resetOnMount ]]

    end, 
    cancelCallback = nil, 
    shouldShowCancel = true, 
    textChangedCallback = nil, 
    LayoutOrder = 1, 
    onSelectCallback = function() --[[ Line: 49 ]] --[[ Name: onSelectCallback ]]

    end
};
v17.init = function(v18) --[[ Line: 52 ]] --[[ Name: init ]]
    -- upvalues: v4 (copy), l_memoize_0 (copy), l_Text_0 (copy)
    v18.inputBoxRef = v4.createRef();
    v18.props.onSelectCallback();
    v18.getTextWidth = l_memoize_0(function(v19, v20, v21) --[[ Line: 56 ]]
        -- upvalues: l_Text_0 (ref)
        return l_Text_0.GetTextWidth(v19, v20, v21);
    end);
end;
v17.didMount = function(v22) --[[ Line: 61 ]] --[[ Name: didMount ]]
    v22.props.resetOnMount();
end;
v17.render = function(v23) --[[ Line: 65 ]] --[[ Name: render ]]
    -- upvalues: v5 (copy), v4 (copy), v2 (copy), l_TextButton_0 (copy), l_ImageSetLabel_0 (copy), v16 (copy), l_GetFFlagLuaAppEnableFoundationColors_0 (copy), l_IconSize_0 (copy), v14 (copy), l_CallbackInputBox_0 (copy), v15 (copy)
    return v5.Style.withStyle(function(v24) --[[ Line: 66 ]]
        -- upvalues: v23 (copy), v4 (ref), v2 (ref), l_TextButton_0 (ref), l_ImageSetLabel_0 (ref), v16 (ref), l_GetFFlagLuaAppEnableFoundationColors_0 (ref), l_IconSize_0 (ref), v14 (ref), l_CallbackInputBox_0 (ref), v15 (ref)
        local l_cancelText_0 = v23.props.cancelText;
        local l_Header2_0 = v24.Font.Header2;
        local v27 = v24.Font.BaseSize * l_Header2_0.RelativeSize;
        local v28 = v23.getTextWidth(l_cancelText_0, l_Header2_0.Font, v27);
        local l_Left_0 = Enum.HorizontalAlignment.Left;
        local v30 = UDim.new(0, 4);
        local v31 = UDim2.new(1, 0, 1, 0);
        if v23.props.shouldShowCancel then
            v31 = UDim2.new(1, -v28 - 12, 1, 0);
        end;
        local l_Body_0 = v24.Font.Body;
        local v33 = v24.Font.BaseSize * l_Body_0.RelativeSize;
        return v4.createElement("Frame", {
            BackgroundTransparency = if v2() then v24.Tokens.Global.Color.None.Transparency else v24.Theme.BackgroundDefault.Transparency, 
            BackgroundColor3 = v24.Theme.BackgroundDefault.Color, 
            BorderSizePixel = 0, 
            Size = UDim2.new(1, 0, 1, 0), 
            LayoutOrder = v23.props.LayoutOrder
        }, {
            layout = v4.createElement("UIListLayout", {
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                HorizontalAlignment = l_Left_0, 
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = v30
            }), 
            padding = v4.createElement("UIPadding", {
                PaddingTop = UDim.new(0, v23.props.filterBoxPaddingTop), 
                PaddingBottom = UDim.new(0, v23.props.filterBoxPaddingBottom), 
                PaddingLeft = UDim.new(0, v23.props.filterBoxPaddingLeft), 
                PaddingRight = UDim.new(0, v23.props.filterBoxPaddingRight)
            }), 
            cancel = if v23.props.shouldShowCancel then v4.createElement(l_TextButton_0, {
                text = l_cancelText_0, 
                layoutOrder = 2, 
                onActivated = v23.props.cancelCallback
            }) else nil, 
            filterBoxBackground = v4.createElement(l_ImageSetLabel_0, {
                Size = v31, 
                Image = v16.Image, 
                ImageColor3 = if l_GetFFlagLuaAppEnableFoundationColors_0() then v24.Theme.UIDefault.Color else v24.Theme.BackgroundMuted.Color, 
                ImageTransparency = if l_GetFFlagLuaAppEnableFoundationColors_0() then v24.Theme.UIDefault.Transparency else v24.Theme.BackgroundMuted.Transparency, 
                ScaleType = Enum.ScaleType.Slice, 
                SliceCenter = v16.SliceCenter, 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                LayoutOrder = 1
            }, {
                layout = v4.createElement("UIListLayout", {
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, 4)
                }), 
                padding = v4.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, 12), 
                    PaddingRight = UDim.new(0, 12)
                }), 
                filterBoxIcon = v4.createElement(l_ImageSetLabel_0, {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(0, l_IconSize_0.Small, 0, l_IconSize_0.Small), 
                    Image = v14, 
                    ImageColor3 = v24.Theme.IconEmphasis.Color, 
                    ImageTransparency = v24.Theme.IconEmphasis.Transparency, 
                    LayoutOrder = 1
                }), 
                filterBoxContainer = v4.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, -(l_IconSize_0.Small + 4), 1, 0), 
                    LayoutOrder = 2
                }, {
                    filterBox = v4.createElement(l_CallbackInputBox_0, {
                        initialInputText = v23.props.initialInputText, 
                        inputTextColor3 = v24.Theme.TextEmphasis.Color, 
                        inputTextFont = l_Body_0.Font, 
                        inputTextSize = v33, 
                        inputTextTransparency = v24.Theme.TextEmphasis.Transparency, 
                        inputTextXAlignment = Enum.TextXAlignment.Left, 
                        placeholderText = v23.props.searchPlaceholderText, 
                        placeholderTextColor3 = if l_GetFFlagLuaAppEnableFoundationColors_0() then v24.Theme.TextDefault.Color else v24.Theme.TextMuted.Color, 
                        placeholderTextTransparency = if l_GetFFlagLuaAppEnableFoundationColors_0() then v24.Theme.TextDefault.Transparency else v24.Theme.PlaceHolder.Transparency, 
                        captureFocusOnMount = v23.props.captureFocusOnMount, 
                        clearIcon = v15, 
                        clearIconColor3 = v24.Theme.IconEmphasis.Color, 
                        clearIconTransparency = v24.Theme.IconEmphasis.Transparency, 
                        clearButtonSize = l_IconSize_0.Small, 
                        clearButtonDisabled = false, 
                        textChangedCallback = v23.props.textChangedCallback, 
                        onSelectCallback = v23.props.onSelectCallback, 
                        inputBoxRef = v23.inputBoxRef
                    })
                })
            })
        });
    end);
end;
return v17;