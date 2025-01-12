local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local l_Core_0 = l_Parent_1.Core;
local v4 = require(l_Parent_2.Cryo);
local v5 = require(l_Parent_2.React);
local v6 = require(l_Parent_0.ImageSet.Images);
local v7 = require(l_Parent_0.ImageSet.Enum.IconSize);
local v8 = require(l_Parent_0.ImageSet.getIconSize);
local v9 = require(l_Parent_0.SelectionImage.useSelectionCursor);
local v10 = require(l_Parent_0.SelectionImage.CursorKind);
local v11 = require(l_Core_0.Style.useStyle);
local v12 = require(l_Core_0.Control.Enum.ControlState);
local v13 = require(l_Core_0.Control.Interactable);
local v14 = require(l_Core_0.Control.useControlState);
local v15 = require(l_Core_0.Button.getContentStyle);
local v16 = require(l_Core_0.Text.GenericTextLabel.GenericTextLabel);
local v17 = require(l_Parent_1.Core.ImageSet.ImageSetComponent);
local v18 = require(l_Parent_1.App.Loading.ShimmerPanel);
local v19 = require(l_Parent_0.SelectionCursor.useCursorByType);
local v20 = require(l_Parent_0.SelectionCursor.CursorType);
local v21 = require(l_Parent_1.UIBloxConfig);
local v22 = require(l_Parent_1.Core.Text.GetTextSize);
local v23 = {
    hasBorder = false, 
    isDisabled = false, 
    isLoading = false, 
    isSelected = false, 
    layoutOrder = 1, 
    text = ""
};
local v24 = {
    [v12.Default] = "SystemPrimaryContent", 
    [v12.Hover] = "SystemPrimaryContent"
};
local v25 = {
    [v12.Default] = "TextDefault", 
    [v12.Hover] = "TextEmphasis"
};
local v26 = {
    [v12.Default] = "SystemPrimaryContent", 
    [v12.Hover] = "SystemPrimaryContent"
};
local v27 = {
    [v12.Default] = "BackgroundUIDefault", 
    [v12.Hover] = "BackgroundUIDefault"
};
local v28 = {
    [v12.Default] = "SystemPrimaryDefault", 
    [v12.Hover] = "SystemPrimaryOnHover"
};
local v29 = {
    [v12.Default] = "BackgroundOnHover", 
    [v12.Hover] = "BackgroundOnHover"
};
local function v68(v30) --[[ Line: 114 ]] --[[ Name: Pillv2 ]]
    -- upvalues: v4 (copy), v23 (copy), v14 (copy), v5 (copy), v11 (copy), v21 (copy), v19 (copy), v20 (copy), v9 (copy), v10 (copy), v26 (copy), v25 (copy), v28 (copy), v27 (copy), v15 (copy), v24 (copy), v29 (copy), v8 (copy), v7 (copy), v22 (copy), v18 (copy), v12 (copy), v13 (copy), v16 (copy), v17 (copy), v6 (copy)
    local v31 = v4.Dictionary.join(v23, v30);
    local l_text_0 = v31.text;
    local v33, v34 = v14();
    local v37 = v5.useCallback(function(v35, v36) --[[ Line: 119 ]]
        -- upvalues: v31 (copy), v34 (copy)
        if v31.onStateChanged then
            v31.onStateChanged(v35, v36);
        end;
        v34(v35, v36);
    end, {
        v31.onStateChanged
    });
    local v38 = v11();
    local l_Font_0 = v38.Font;
    local v40 = if v21.migrateToNewSelectionCursor then v19(v20.SmallPill) else v9(v10.SmallPill);
    local v41 = if v31.isSelected then v26 else v25;
    local v42 = if v31.isSelected then v28 else v27;
    local v43 = v15(v24, v33, v38);
    local v44 = v15(v41, v33, v38);
    local v45 = v15(v42, v33, v38);
    local v46 = v15(v29, v33, v38);
    local v47 = v8(v7.Small);
    local l_BaseSize_0 = l_Font_0.BaseSize;
    local v49 = l_Font_0.CaptionHeader.RelativeSize * l_BaseSize_0;
    local l_X_0 = v22(l_text_0, v49, l_Font_0.CaptionHeader.Font, Vector2.new(10000, 10000)).X;
    local v51 = l_X_0 + 24;
    local v52 = 216;
    if v31.isSelected then
        local v53 = 4 + v47;
        v51 = v51 + v53;
        v52 = v52 - v53;
    end;
    if v31.isLoading then
        return v5.createElement(v18, {
            LayoutOrder = v31.layoutOrder, 
            Size = UDim2.new(0, v51, 0, 28), 
            cornerRadius = UDim.new(1, 0)
        });
    else
        local v54 = not v31.isSelected and v33 == v12.Hover;
        local l_createElement_0 = v5.createElement;
        local l_v13_0 = v13;
        local v57 = {
            Size = UDim2.new(0, v51, 0, 28), 
            BackgroundColor3 = v45.Color, 
            BackgroundTransparency = v45.Transparency, 
            ImageColor3 = v45.Color, 
            ImageTransparency = v45.Transparency, 
            AutoButtonColor = false, 
            BorderSizePixel = 0, 
            LayoutOrder = v31.layoutOrder, 
            ScaleType = Enum.ScaleType.Slice, 
            isDisabled = v31.isDisabled, 
            SelectionImageObject = v40, 
            [v5.Event.Activated] = if not v31.isLoading then v31.onActivated else nil, 
            onStateChanged = v37, 
            ref = v31.controlRef, 
            NextSelectionLeft = v31.NextSelectionLeft, 
            NextSelectionRight = v31.NextSelectionRight, 
            NextSelectionUp = v31.NextSelectionUp, 
            NextSelectionDown = v31.NextSelectionDown
        };
        local v58 = {
            UICorner = v5.createElement("UICorner", {
                CornerRadius = UDim.new(1, 0)
            }), 
            UISizeConstraint = v5.createElement("UISizeConstraint", {
                MinSize = Vector2.new(28, 28), 
                MaxSize = Vector2.new(240, 28)
            })
        };
        local l_createElement_1 = v5.createElement;
        local v60 = "Frame";
        local v61 = {
            Size = UDim2.fromScale(1, 1), 
            BorderSizePixel = 0, 
            BackgroundColor3 = v46.Color, 
            BackgroundTransparency = if v54 then v46.Transparency else 1
        };
        local v62 = {
            UICorner = v5.createElement("UICorner", {
                CornerRadius = UDim.new(1, 0)
            }), 
            UIStroke = if v31.hasBorder then v5.createElement("UIStroke", {
                Color = v38.Theme.Divider.Color, 
                Transparency = v38.Theme.Divider.Transparency, 
                Thickness = 1
            }) else nil
        };
        local l_createElement_2 = v5.createElement;
        local v64 = "Frame";
        local v65 = {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.fromScale(0.5, 0.5), 
            Size = UDim2.new(0, l_X_0 + 4 + v47, 1, 0), 
            ClipsDescendants = true, 
            BackgroundTransparency = 1
        };
        local v66 = {
            UIListLayout = v5.createElement("UIListLayout", {
                Padding = UDim.new(0, 4), 
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center
            })
        };
        local v67 = false;
        if string.len(l_text_0) > 0 then
            v67 = v5.createElement("Frame", {
                Size = UDim2.fromOffset(l_X_0, v49), 
                LayoutOrder = 1, 
                BackgroundTransparency = 1
            }, {
                PillText = v5.createElement(v16, {
                    Text = l_text_0, 
                    BackgroundTransparency = 1, 
                    fontStyle = l_Font_0.CaptionHeader, 
                    colorStyle = v44, 
                    TextTruncate = Enum.TextTruncate.AtEnd, 
                    Size = UDim2.fromOffset(v52, v49), 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextYAlignment = Enum.TextYAlignment.Center
                }); 
                v5.createElement("UISizeConstraint", {
                    MaxSize = Vector2.new(v52, 28)
                })
            });
        end;
        v66.TextArea = v67;
        v66.CloseIcon = v31.isSelected and v5.createElement(v17.Label, {
            LayoutOrder = 2, 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Size = UDim2.fromOffset(v47, v47), 
            BackgroundTransparency = 1, 
            Image = v6["icons/navigation/close_small"], 
            ImageColor3 = v43.Color, 
            ImageTransparency = v43.Transparency
        });
        v66.UISizeConstraint = v5.createElement("UISizeConstraint", {
            MaxSize = Vector2.new(216, 28)
        });
        v62.Content = l_createElement_2(v64, v65, v66);
        v58.BackgroundLayer2 = l_createElement_1(v60, v61, v62);
        return l_createElement_0(l_v13_0, v57, v58);
    end;
end;
return v5.forwardRef(function(v69, v70) --[[ Line: 259 ]]
    -- upvalues: v5 (copy), v68 (copy), v4 (copy)
    return v5.createElement(v68, v4.Dictionary.join(v69, {
        controlRef = v70
    }));
end);