local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Roact);
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.t);
local v4 = require(l_Parent_0.UIBlox.Core.Style.withStyle);
local v5 = require(l_Parent_0.UIBlox.App.ImageSet.Images);
local v6 = require(l_Parent_0.UIBlox.Core.InputButton.InputButton);
local v7 = require(l_Parent_0.UIBlox.App.SelectionImage.CursorKind);
local v8 = require(l_Parent_0.UIBlox.App.SelectionImage.withSelectionCursorProvider);
local v9 = require(l_Parent_0.UIBlox.App.SelectionCursor.withCursor);
local v10 = require(l_Parent_0.UIBlox.App.SelectionCursor.CursorType);
local v11 = require(l_Parent_0.UIBlox.UIBloxConfig);
local v12 = v1.PureComponent:extend("Checkbox");
v12.validateProps = v3.strictInterface({
    text = v3.string, 
    isSelected = v3.optional(v3.boolean), 
    isDisabled = v3.optional(v3.boolean), 
    onActivated = v3.callback, 
    size = v3.optional(v3.UDim2), 
    layoutOrder = v3.optional(v3.number), 
    frameRef = v3.optional(v3.table), 
    NextSelectionDown = v3.optional(v3.table), 
    NextSelectionUp = v3.optional(v3.table), 
    NextSelectionLeft = v3.optional(v3.table), 
    NextSelectionRight = v3.optional(v3.table)
});
v12.defaultProps = {
    text = "Checkbox Text", 
    isSelected = false, 
    isDisabled = false
};
v12.init = function(v13) --[[ Line: 53 ]] --[[ Name: init ]]
    v13.state = {
        value = v13.props.isSelected
    };
    v13.onFlip = function() --[[ Line: 58 ]]
        -- upvalues: v13 (copy)
        if v13.props.isDisabled then
            return;
        else
            v13.props.onActivated(not v13.props.isSelected);
            return;
        end;
    end;
end;
v12.render = function(v14) --[[ Line: 66 ]] --[[ Name: render ]]
    -- upvalues: v8 (copy), v4 (copy), v11 (copy), v9 (copy), v10 (copy)
    return v8(function(v15) --[[ Line: 67 ]]
        -- upvalues: v4 (ref), v11 (ref), v9 (ref), v10 (ref), v14 (copy)
        return v4(function(v16) --[[ Line: 68 ]]
            -- upvalues: v11 (ref), v9 (ref), v10 (ref), v14 (ref), v15 (copy)
            if v11.migrateToNewSelectionCursor then
                return v9(function(v17) --[[ Line: 70 ]]
                    -- upvalues: v10 (ref), v14 (ref), v16 (copy), v15 (ref)
                    local v18 = v17.getCursorByType(v10.InputButton);
                    return v14:renderWithProviders(v16, v15, v18);
                end);
            else
                return v14:renderWithProviders(v16, v15);
            end;
        end);
    end);
end;
v12.renderWithProviders = function(v19, v20, v21, v22) --[[ Line: 81 ]] --[[ Name: renderWithProviders ]]
    -- upvalues: v5 (copy), v1 (copy), v6 (copy), v11 (copy), v7 (copy)
    local v23 = nil;
    local v24 = nil;
    local v25 = nil;
    local v26 = nil;
    local l_Theme_0 = v20.Theme;
    local l_Transparency_0 = l_Theme_0.TextDefault.Transparency;
    local l_Color_0 = l_Theme_0.TextDefault.Color;
    local l_Color_1 = l_Theme_0.SystemPrimaryContent.Color;
    if v19.props.isDisabled then
        l_Transparency_0 = 0.5;
    end;
    if v19.props.isSelected then
        v23 = v5["squircles/fill"];
        v24 = l_Theme_0.SystemPrimaryDefault.Color;
        v25 = v5["icons/status/success_small"];
        v26 = UDim2.new(0, 14, 0, 14);
    else
        v23 = v5["squircles/hollow"];
        v24 = l_Theme_0.TextDefault.Color;
    end;
    return v1.createElement(v6, {
        text = v19.props.text, 
        onActivated = v19.onFlip, 
        size = v19.props.size, 
        image = v23, 
        imageColor = v24, 
        fillImage = v25, 
        fillImageSize = v26, 
        fillImageColor = l_Color_1, 
        selectedColor = l_Theme_0.SystemPrimaryDefault.Color, 
        textColor = l_Color_0, 
        transparency = l_Transparency_0, 
        layoutOrder = v19.props.layoutOrder, 
        isDisabled = v19.props.isDisabled, 
        [v1.Ref] = v19.props.frameRef, 
        SelectionImageObject = if v11.migrateToNewSelectionCursor then v22 else v21(v7.InputButton)
    });
end;
return v1.forwardRef(function(v31, v32) --[[ Line: 124 ]]
    -- upvalues: v1 (copy), v12 (copy), v2 (copy)
    return v1.createElement(v12, v2.Dictionary.join(v31, {
        frameRef = v32
    }));
end);