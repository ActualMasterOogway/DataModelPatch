local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Core_0 = l_Parent_1.Core;
local l_Parent_2 = l_Parent_1.Parent;
local v4 = require(l_Parent_2.Roact);
local v5 = require(l_Parent_2.t);
local v6 = require(l_Parent_0.SelectionImage.CursorKind);
local v7 = require(l_Parent_0.ImageSet.Images);
local v8 = require(l_Parent_0.SelectionCursor.withCursor);
local v9 = require(l_Parent_0.SelectionImage.withSelectionCursorProvider);
local v10 = require(l_Core_0.Control.Enum.ControlState);
local v11 = require(l_Core_0.Button.GenericButton);
local v12 = require(l_Core_0.ImageSet.Validator.validateImage);
local v13 = require(l_Core_0.Style.withStyle);
local v14 = require(l_Parent_1.UIBloxConfig);
local v15 = v4.PureComponent:extend("ComboButton");
local v16 = UDim.new(0, 8);
local v17 = {
    [v10.Default] = "ContextualPrimaryDefault", 
    [v10.Hover] = "ContextualPrimaryOnHover"
};
local v18 = {
    [v10.Default] = "ContextualPrimaryContent"
};
v15.validateProps = v5.strictInterface({
    button = v5.strictInterface({
        icon = v5.optional(v12), 
        text = v5.optional(v5.string), 
        isDisabled = v5.optional(v5.boolean), 
        onActivated = v5.callback
    }), 
    overflow = v5.strictInterface({
        icon = v5.optional(v12), 
        isDisabled = v5.optional(v5.boolean), 
        onActivated = v5.callback
    }), 
    position = v5.optional(v5.UDim2), 
    size = v5.optional(v5.UDim2), 
    layoutOrder = v5.optional(v5.number)
});
v15.defaultProps = {
    size = UDim2.fromScale(1, 1)
};
v15.init = function(v19) --[[ Line: 73 ]] --[[ Name: init ]]
    -- upvalues: v10 (copy)
    v19:setState({
        buttonControlState = v10.Initialize, 
        overflowControlState = v10.Initialize
    });
    v19.onButtonStateChanged = function(_, v21) --[[ Line: 76 ]]
        -- upvalues: v19 (copy)
        v19:setState({
            buttonControlState = v21
        });
    end;
    v19.onOverflowStateChanged = function(_, v23) --[[ Line: 80 ]]
        -- upvalues: v19 (copy)
        v19:setState({
            overflowControlState = v23
        });
    end;
end;
v15.render = function(v24) --[[ Line: 85 ]] --[[ Name: render ]]
    -- upvalues: v13 (copy), v9 (copy), v14 (copy), v8 (copy)
    return v13(function(v25) --[[ Line: 86 ]]
        -- upvalues: v9 (ref), v14 (ref), v8 (ref), v24 (copy)
        return v9(function(v26) --[[ Line: 87 ]]
            -- upvalues: v14 (ref), v8 (ref), v24 (ref), v25 (copy)
            if v14.useNewSelectionCursor then
                return v8(function(v27) --[[ Line: 89 ]]
                    -- upvalues: v24 (ref), v25 (ref)
                    return v24:renderWithProviders(v25, nil, v27.getCursor);
                end);
            else
                return v24:renderWithProviders(v25, v26, nil);
            end;
        end);
    end);
end;
v15.renderWithProviders = function(v28, _, v30, v31) --[[ Line: 99 ]] --[[ Name: renderWithProviders ]]
    -- upvalues: v4 (copy), v11 (copy), v7 (copy), v17 (copy), v18 (copy), v16 (copy), v6 (copy)
    local l_size_0 = v28.props.size;
    local v33 = UDim2.new(1, -40, 1, 0);
    local v34 = UDim2.new(0, 39, 1, 0);
    return v4.createElement("Frame", {
        LayoutOrder = v28.props.layoutOrder, 
        Position = v28.props.position, 
        Size = l_size_0, 
        BackgroundTransparency = 1
    }, {
        Button = v4.createElement(v11, {
            Position = UDim2.fromScale(0, 0), 
            Size = v33, 
            buttonImage = v7["component_assets/bulletLeft_17"], 
            buttonStateColorMap = v17, 
            contentStateColorMap = v18, 
            hoverImage = v7["component_assets/bulletLeft_17"], 
            icon = v28.props.button.icon, 
            isDisabled = v28.props.button.isDisabled, 
            isHoverBackgroundEnabled = true, 
            onActivated = v28.props.button.onActivated, 
            onStateChanged = v28.onButtonStateChanged, 
            SelectionImageObject = if v31 then v31(v16) else v30(v6.RoundedRectNoInset), 
            text = v28.props.button.text, 
            ZIndex = 0
        }), 
        Overflow = v4.createElement(v11, {
            AnchorPoint = Vector2.new(1, 0), 
            Position = UDim2.fromScale(1, 0), 
            Size = v34, 
            ZIndex = 0, 
            buttonImage = v7["component_assets/bulletRight_17"], 
            buttonStateColorMap = v17, 
            contentStateColorMap = v18, 
            hoverImage = v7["component_assets/bulletRight_17"], 
            icon = v28.props.overflow.icon or v7["icons/actions/truncationExpand"], 
            isDisabled = v28.props.overflow.isDisabled, 
            isHoverBackgroundEnabled = true, 
            onActivated = v28.props.overflow.onActivated, 
            onStateChanged = v28.onOverflowStateChanged, 
            SelectionImageObject = if v31 then v31(v16) else v30(v6.RoundedRectNoInset)
        })
    });
end;
return v15;