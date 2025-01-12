local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceSearch");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local v4 = require(l_Parent_0.RoactGamepad);
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_wasLastInputGamepad_0 = require(l_Parent_0.RoactUtils).wasLastInputGamepad;
local v8 = require(l_script_FirstAncestor_0.Components.FlexLayout);
local l_Images_0 = v3.App.ImageSet.Images;
local l_ImageSetLabel_0 = v3.Core.ImageSet.ImageSetLabel;
local l_ImageSetButton_0 = v3.Core.ImageSet.ImageSetButton;
local l_useSelectionCursor_0 = v3.App.SelectionImage.useSelectionCursor;
local l_CursorKind_0 = v3.App.SelectionImage.CursorKind;
local l_Focusable_0 = v4.Focusable;
local v15 = {
    clear = l_Images_0["icons/actions/edit/clear_small"], 
    search = l_Images_0["icons/common/search_small"]
};
local v16 = {
    cancelButtonText = "Feature.Catalog.Action.Cancel", 
    placeholder = "Feature.Catalog.Search.Placeholder"
};
local function v18(v17) --[[ Line: 32 ]] --[[ Name: mapTokens ]]
    return {
        borderRadius = v17.Semantic.Radius.Medium, 
        cancelButtonPadding = v17.Global.Space_100, 
        defaultHeight = v17.Global.Size_500, 
        font = v17.Semantic.Typography.Body.Font, 
        iconAndTextInputMargin = v17.Global.Space_200, 
        iconOffsetX = v17.Global.Size_150, 
        iconSize = v17.Global.Size_200, 
        inputAndCancelButtonMargin = v17.Global.Space_100, 
        inputBackgroundColor = v17.Semantic.Color.Background.Contrast.Color3, 
        textIconColor = v17.Semantic.Color.Text.Emphasis.Color3, 
        textIconTransparency = v17.Semantic.Color.Text.Emphasis.Transparency, 
        textSize = v17.Semantic.Typography.Body.FontSize
    };
end;
return v2.forwardRef(function(v19, v20) --[[ Line: 66 ]] --[[ Name: SearchBar ]]
    -- upvalues: l_useLocalization_0 (copy), v16 (copy), l_useDesignTokens_0 (copy), v18 (copy), l_useSelectionCursor_0 (copy), l_CursorKind_0 (copy), v2 (copy), l_wasLastInputGamepad_0 (copy), v8 (copy), l_ImageSetLabel_0 (copy), v15 (copy), l_Focusable_0 (copy), l_ImageSetButton_0 (copy)
    local v21 = l_useLocalization_0(v16);
    local v22 = l_useDesignTokens_0(v18);
    local v23 = l_useSelectionCursor_0(l_CursorKind_0.InputFields);
    local v24 = l_useSelectionCursor_0(l_CursorKind_0.RoundedRect);
    local v25 = l_useSelectionCursor_0(l_CursorKind_0.RoundedRectNoInset);
    local v26, v27 = v2.useState(v19.text and v19.text ~= "");
    local v28 = v20 or v2.useRef(nil);
    local v29 = v2.useRef(nil);
    local v30 = v2.useRef(nil);
    local v31 = v2.useRef(false);
    local v32 = v19.height or v22.defaultHeight;
    local v33 = v19.placeholder or v21.placeholder;
    local v34 = v22.iconSize + 2 * v22.iconOffsetX;
    local v35 = -v34 + if v26 then -v34 else 0;
    local v36 = -(v22.iconSize + v22.iconOffsetX);
    v2.useEffect(function() --[[ Line: 89 ]]
        -- upvalues: v19 (copy), v28 (copy), v31 (copy), l_wasLastInputGamepad_0 (ref)
        if v19.autofocus and v28.current and not v31.current and not l_wasLastInputGamepad_0() then
            v31.current = true;
            v28.current:CaptureFocus();
        end;
    end, {
        v19.autofocus
    });
    local function v37() --[[ Line: 106 ]]
        -- upvalues: v28 (copy), v19 (copy)
        if v28.current then
            if v19.onClear then
                v19.onClear(v28.current.Text or "");
            end;
            v28.current.Text = "";
            v28.current:CaptureFocus();
        end;
    end;
    return v2.createElement(v8, {
        margin = v22.inputAndCancelButtonMargin, 
        flexSlot = v2.createElement("Frame", {
            BackgroundColor3 = v22.inputBackgroundColor, 
            BackgroundTransparency = 0, 
            BorderSizePixel = 0, 
            Size = UDim2.new(1, 0, 0, v32)
        }, {
            UICorner = v2.createElement("UICorner", {
                CornerRadius = UDim.new(0, v22.borderRadius)
            }), 
            SearchIcon = v2.createElement(l_ImageSetLabel_0, {
                AnchorPoint = Vector2.new(0, 0.5), 
                BackgroundTransparency = 1, 
                Image = v15.search, 
                ImageColor3 = v22.textIconColor, 
                ImageTransparency = v22.textIconTransparency, 
                Position = UDim2.new(0, v22.iconOffsetX, 0.5, 0), 
                Size = UDim2.fromOffset(v22.iconSize, v22.iconSize)
            }), 
            SearchBox = v2.createElement(l_Focusable_0.TextBox, {
                AnchorPoint = Vector2.new(0, 0.5), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                ClearTextOnFocus = false, 
                ClipsDescendants = true, 
                Font = v22.font, 
                OverlayNativeInput = true, 
                PlaceholderColor3 = v22.textIconColor, 
                PlaceholderText = v33, 
                Position = UDim2.new(0, v34, 0.5, 0), 
                ReturnKeyType = Enum.ReturnKeyType.Search, 
                RichText = false, 
                Size = UDim2.new(1, v35, 1, 0), 
                Text = v19.text or "", 
                TextColor3 = v22.textIconColor, 
                TextInputType = Enum.TextInputType.NoSuggestions, 
                TextSize = v22.textSize, 
                TextTransparency = v22.textIconTransparency, 
                TextWrapped = false, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                [v2.Change.Text] = function(v38) --[[ Line: 117 ]]
                    -- upvalues: v19 (copy), v27 (copy)
                    if v19.onChange then
                        v19.onChange(v38.Text or "");
                    end;
                    v27(v38.Text ~= "");
                end, 
                [v2.Event.Focused] = function(v39) --[[ Line: 125 ]]
                    -- upvalues: v19 (copy)
                    if v19.onFocus then
                        v19.onFocus(v39);
                    end;
                end, 
                [v2.Event.FocusLost] = function(v40, v41, _) --[[ Line: 131 ]]
                    -- upvalues: v19 (copy)
                    if v41 and v19.onSubmit then
                        v19.onSubmit(v40.Text or "");
                    end;
                end, 
                [v2.Event.ReturnPressedFromOnScreenKeyboard] = function(v43) --[[ Line: 139 ]]
                    -- upvalues: v19 (copy)
                    if v19.onSubmit then
                        v19.onSubmit(v43.Text or "");
                    end;
                end, 
                [v2.Tag] = "data-testid=AvatarExperienceSearch_SearchBar_TextBox", 
                ref = v28, 
                SelectionImageObject = v23, 
                NextSelectionDown = v19.nextSelectionDown, 
                NextSelectionUp = v19.nextSelectionUp, 
                NextSelectionRight = if v26 then v29 else if v19.showCancelButton then v30 else nil
            }), 
            ClearSearchButton = v26 and v2.createElement(l_Focusable_0[l_ImageSetButton_0], {
                AnchorPoint = Vector2.new(0, 0.5), 
                BackgroundTransparency = 1, 
                Image = v15.clear, 
                ImageColor3 = v22.textIconColor, 
                ImageTransparency = v22.textIconTransparency, 
                Position = UDim2.new(1, v36, 0.5, 0), 
                Size = UDim2.fromOffset(v22.iconSize, v22.iconSize), 
                [v2.Event.Activated] = v37, 
                [v2.Tag] = "data-testid=AvatarExperienceSearch_SearchBar_ClearButton", 
                SelectionImageObject = v24, 
                NextSelectionDown = v19.nextSelectionDown, 
                NextSelectionUp = v19.nextSelectionUp, 
                NextSelectionLeft = v28, 
                NextSelectionRight = if v19.showCancelButton then v30 else nil
            })
        }), 
        rigidSlot = if v19.showCancelButton then v2.createElement(l_Focusable_0.TextButton, {
            AutomaticSize = Enum.AutomaticSize.X, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Font = v22.font, 
            Size = UDim2.new(0, 0, 0, v32), 
            Text = v21.cancelButtonText, 
            TextColor3 = v22.textIconColor, 
            TextSize = v22.textSize, 
            TextTransparency = v22.textIconTransparency, 
            TextXAlignment = Enum.TextXAlignment.Center, 
            [v2.Event.Activated] = v19.onCancel, 
            [v2.Tag] = "data-testid=AvatarExperienceSearch_SearchBar_CancelButton", 
            SelectionImageObject = v25, 
            NextSelectionDown = v19.nextSelectionDown, 
            NextSelectionUp = v19.nextSelectionUp, 
            NextSelectionLeft = if v26 then v29 else v28
        }, {
            Padding = v2.createElement("UIPadding", {
                PaddingRight = UDim.new(0, v22.cancelButtonPadding), 
                PaddingLeft = UDim.new(0, v22.cancelButtonPadding)
            })
        }) else nil
    });
end);