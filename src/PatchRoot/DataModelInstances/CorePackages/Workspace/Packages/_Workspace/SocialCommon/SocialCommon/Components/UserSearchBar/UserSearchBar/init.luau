local l_Parent_0 = script:FindFirstAncestor("SocialCommon").Parent;
local l_CallbackInputBox_0 = require(l_Parent_0.LuaSocialLibrariesDeps).SocialLibraries.config({}).Components.CallbackInputBox;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.RoactAppExperiment);
local l_Text_0 = require(l_Parent_0.AppCommonLib).Text;
local v5 = require(l_Parent_0.Dash);
local v6 = require(l_Parent_0.UIBlox);
local l_IconSize_0 = v6.App.Constant.IconSize;
local l_TextButton_0 = v6.App.Button.TextButton;
local l_Images_0 = v6.App.ImageSet.Images;
local l_ImageSetLabel_0 = v6.Core.ImageSet.ImageSetLabel;
local l_useStyle_0 = v6.Core.Style.useStyle;
local v12 = l_Images_0["icons/common/search"];
local v13 = l_Images_0["icons/actions/edit/clear_small"];
local l_FFlagDisableAutocorrectSocialUserSearch_0 = require(l_Parent_0.SharedFlags).FFlagDisableAutocorrectSocialUserSearch;
local v15 = game:DefineFastString("DisableAutocorrectExperimentLayer", "Social.UserSearchUX");
local v16 = {
    cancelText = "Cancel", 
    searchPlaceholderText = "Text", 
    initialInputText = nil, 
    LayoutOrder = 1, 
    isDisabled = false, 
    captureFocusOnMount = false, 
    cancelCallback = nil, 
    textChangedCallback = nil, 
    focusChangedCallback = function() --[[ Line: 68 ]] --[[ Name: focusChangedCallback ]]

    end
};
return function(v17) --[[ Line: 71 ]]
    -- upvalues: l_FFlagDisableAutocorrectSocialUserSearch_0 (copy), v3 (copy), v15 (copy), v5 (copy), v16 (copy), l_useStyle_0 (copy), v2 (copy), l_Text_0 (copy), l_TextButton_0 (copy), l_ImageSetLabel_0 (copy), v12 (copy), l_CallbackInputBox_0 (copy), v13 (copy), l_IconSize_0 (copy)
    local v19 = if l_FFlagDisableAutocorrectSocialUserSearch_0 then v3.useUserExperiment({
        v15
    }, function(v18) --[[ Line: 73 ]]
        -- upvalues: v15 (ref)
        return (v18[v15] or {}).disableAutocorrectSocialUserSearch;
    end) else nil;
    local v20 = v5.join(v16, v17 or {});
    local v21 = l_useStyle_0();
    local v22 = v2.useRef(nil);
    local v23, v24 = v2.useState(nil);
    local v25, v26 = v2.useState(nil);
    v2.useEffect(function() --[[ Line: 86 ]]
        -- upvalues: v20 (copy)
        if v20.onSelectCallback then
            v20.onSelectCallback();
        end;
        if v20.resetOnMount then
            v20.resetOnMount();
        end;
    end, {});
    local l_Header2_0 = v21.Font.Header2;
    local v28 = v21.Font.BaseSize * l_Header2_0.RelativeSize;
    local v29 = l_Text_0.GetTextWidth(v20.cancelText, l_Header2_0.Font, v28);
    local v30 = UDim.new(0, 4);
    local v31 = if v20.isDisabled then UDim2.new(1, 0, 1, 0) else UDim2.new(1, -v29 - 12, 1, 0);
    local l_Body_0 = v21.Font.Body;
    local v33 = v21.Font.BaseSize * l_Body_0.RelativeSize;
    local function v36(v34, v35) --[[ Line: 110 ]]
        -- upvalues: v20 (copy), v24 (copy), v21 (copy), v26 (copy)
        if v20.focusChangedCallback then
            v20.focusChangedCallback(v34, v35);
        end;
        if v34 then
            v24(v21.Theme.SecondaryOnHover.Color);
            v26(v21.Theme.SecondaryOnHover.Transparency);
            return;
        else
            v24(v21.Theme.Divider.Color);
            v26(v21.Theme.Divider.Transparency);
            return;
        end;
    end;
    return v2.createElement("Frame", {
        BackgroundTransparency = v21.Theme.BackgroundDefault.Transparency, 
        BackgroundColor3 = v21.Theme.BackgroundDefault.Color, 
        BorderSizePixel = 0, 
        Size = UDim2.new(1, 0, 1, 0), 
        LayoutOrder = v20.LayoutOrder
    }, {
        Layout = v2.createElement("UIListLayout", {
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            FillDirection = Enum.FillDirection.Horizontal, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = v30
        }), 
        Padding = v2.createElement("UIPadding", {
            PaddingTop = UDim.new(0, 6), 
            PaddingBottom = UDim.new(0, 6)
        }), 
        CancelTextButton = if v20.isDisabled then nil else v20.cancelCallback and v2.createElement(l_TextButton_0, {
            text = v20.cancelText, 
            layoutOrder = 2, 
            onActivated = v20.cancelCallback
        }), 
        FilterBoxBackground = v2.createElement(l_ImageSetLabel_0, {
            Size = v31, 
            BackgroundColor3 = v21.Theme.UIMuted.Color, 
            BackgroundTransparency = v21.Theme.UIMuted.Transparency, 
            BorderSizePixel = 0, 
            LayoutOrder = 1
        }, {
            UICorner = v2.createElement("UICorner", {
                CornerRadius = UDim.new(0, 4)
            }), 
            UIStroke = v2.createElement("UIStroke", {
                Color = v23 or v21.Theme.Divider.Color, 
                Transparency = v25 or v21.Theme.Divider.Transparency, 
                Thickness = 1
            }), 
            UIListLayout = v2.createElement("UIListLayout", {
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 4)
            }), 
            UIPadding = v2.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, 10), 
                PaddingRight = UDim.new(0, 10)
            }), 
            SearchIcon = v2.createElement(l_ImageSetLabel_0, {
                BackgroundTransparency = 1, 
                Size = UDim2.new(0, 24, 0, 24), 
                Image = v12, 
                ImageColor3 = v21.Theme.IconEmphasis.Color, 
                ImageTransparency = v21.Theme.IconEmphasis.Transparency, 
                LayoutOrder = 1
            }), 
            FilterBoxContainer = v2.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, -28, 1, 0), 
                LayoutOrder = 2
            }, {
                filterBox = if v20.isDisabled then v2.createElement("TextLabel", {
                    Text = v20.searchPlaceholderText, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextYAlignment = Enum.TextYAlignment.Center, 
                    BackgroundTransparency = 1, 
                    Size = UDim2.fromScale(1, 1), 
                    TextSize = v33, 
                    Font = l_Body_0.Font, 
                    TextColor3 = v21.Theme.TextDefault.Color, 
                    TextTransparency = v21.Theme.TextMuted.Transparency
                }) else v2.createElement(l_CallbackInputBox_0, {
                    initialInputText = v20.initialInputText, 
                    inputTextColor3 = v21.Theme.TextEmphasis.Color, 
                    inputTextFont = l_Body_0.Font, 
                    inputTextSize = v33, 
                    inputTextTransparency = v21.Theme.TextEmphasis.Transparency, 
                    inputTextXAlignment = Enum.TextXAlignment.Left, 
                    textInputType = if l_FFlagDisableAutocorrectSocialUserSearch_0 and v19 then Enum.TextInputType.NoSuggestions else nil, 
                    returnKeyType = if l_FFlagDisableAutocorrectSocialUserSearch_0 and v19 then Enum.ReturnKeyType.Search else nil, 
                    placeholderText = v20.searchPlaceholderText, 
                    placeholderTextColor3 = v21.Theme.TextDefault.Color, 
                    placeholderTextTransparency = v21.Theme.TextMuted.Transparency, 
                    captureFocusOnMount = v20.captureFocusOnMount, 
                    clearButtonDisabled = false, 
                    clearIcon = v13, 
                    clearIconColor3 = v21.Theme.IconEmphasis.Color, 
                    clearIconTransparency = v21.Theme.IconEmphasis.Transparency, 
                    clearButtonSize = l_IconSize_0.Small, 
                    textChangedCallback = v20.textChangedCallback, 
                    onSelectCallback = v20.onSelectCallback, 
                    focusChangedCallback = v36, 
                    returnPressedFromOnScreenKeyboardCallback = if l_FFlagDisableAutocorrectSocialUserSearch_0 and v19 then v20.returnPressedFromOnScreenKeyboardCallback else nil, 
                    inputBoxRef = v22
                })
            })
        })
    });
end;