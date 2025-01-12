local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local l_Parent_3 = l_Parent_2.Parent;
local v4 = require(l_Parent_3.Roact);
local v5 = require(l_Parent_3.Cryo);
local v6 = require(l_Parent_3.RoactGamepad);
local v7 = require(l_Parent_3.t);
local l_FitFrameOnAxis_0 = require(l_Parent_3.FitFrame).FitFrameOnAxis;
local v9 = require(l_Parent_2.UIBloxConfig);
local v10 = require(l_Parent_0.Button);
local v11 = require(l_Parent_0.ComboButton);
local v12 = require(l_Parent_0.IconButton);
local v13 = require(l_Parent_0.TextButton);
local v14 = require(l_Parent_0.Enum.ButtonType);
local v15 = require(l_Parent_2.Core.Style.withStyle);
local v16 = require(l_Parent_1.ImageSet.Enum.IconSize);
local v17 = require(l_Parent_1.Container.getPageMargin);
local v18 = require(l_Parent_1.Style.Constants);
local v19 = v4.PureComponent:extend("ActionBar");
v19.init = function(v20) --[[ Line: 32 ]] --[[ Name: init ]]
    -- upvalues: v6 (copy), v4 (copy)
    v20.buttonRefs = v6.createRefCache();
    v20.state = {
        frameWidth = 0
    };
    v20.frameRef = v20.props.frameRef or v4.createRef();
    v20.updateFrameSize = function(v21) --[[ Line: 41 ]]
        -- upvalues: v20 (copy)
        local l_X_0 = v21.AbsoluteSize.X;
        if l_X_0 ~= v20.state.frameWidth then
            v20:setState({
                frameWidth = l_X_0
            });
        end;
        if v20.props.onAbsoluteSizeChanged then
            v20.props.onAbsoluteSizeChanged(v21.AbsoluteSize);
        end;
    end;
    v20.getGamepadNextSelectionLeft = function(v23, _) --[[ Line: 54 ]]
        -- upvalues: v20 (copy)
        return v23 > 1 and v20.buttonRefs[v23 - 1] or nil;
    end;
    v20.getGamepadNextSelectionRight = function(v25, v26) --[[ Line: 58 ]]
        -- upvalues: v20 (copy)
        return v25 < v26 and v20.buttonRefs[v25 + 1] or nil;
    end;
end;
v19.validateProps = v7.strictInterface({
    button = v7.optional(v7.union(v7.strictInterface({
        props = v10.validateProps
    }), v7.strictInterface({
        props = v11.validateProps
    }))), 
    iconSize = v7.optional(v7.number), 
    buttonHeight = v7.optional(v7.number), 
    buttonPadding = v7.optional(v7.number), 
    enableButtonAtStart = v7.optional(v7.boolean), 
    icons = v7.optional(v7.array(v7.strictInterface({
        props = v12.validateProps
    }))), 
    marginOverride = v7.optional(v7.strictInterface({
        left = v7.number, 
        right = v7.number, 
        top = v7.number, 
        bottom = v7.number
    })), 
    horizontalAlignment = v7.optional(v7.enum(Enum.HorizontalAlignment)), 
    onAbsoluteSizeChanged = v7.optional(v7.callback), 
    [v4.Children] = v7.optional(v7.table), 
    NextSelectionLeft = v7.optional(v7.table), 
    NextSelectionRight = v7.optional(v7.table), 
    NextSelectionUp = v7.optional(v7.table), 
    NextSelectionDown = v7.optional(v7.table), 
    frameRef = v7.optional(v7.table), 
    textButtons = v7.optional(v7.array(v7.strictInterface({
        props = v13.validateProps
    })))
});
v19.defaultProps = {
    horizontalAlignment = Enum.HorizontalAlignment.Center, 
    iconSize = 36, 
    buttonHeight = 48, 
    buttonPadding = 12
};
v19.render = function(v27) --[[ Line: 125 ]] --[[ Name: render ]]
    -- upvalues: v15 (copy), v17 (copy), v16 (copy), v18 (copy), v5 (copy), v4 (copy), v6 (copy), v12 (copy), v13 (copy), v9 (copy), v11 (copy), v14 (copy), v10 (copy), l_FitFrameOnAxis_0 (copy)
    return v15(function(_) --[[ Line: 126 ]]
        -- upvalues: v17 (ref), v27 (copy), v16 (ref), v18 (ref), v5 (ref), v4 (ref), v6 (ref), v12 (ref), v13 (ref), v9 (ref), v11 (ref), v14 (ref), v10 (ref), l_FitFrameOnAxis_0 (ref)
        local v29 = v17(v27.state.frameWidth);
        local v30 = v27.state.frameWidth - v29 * 2;
        local l_Medium_0 = v16.Medium;
        local v32 = nil;
        v32 = if v27.props.marginOverride then v27.props.marginOverride else {
            left = v29, 
            right = v29, 
            top = 0, 
            bottom = v18.Layout.ActionBar.PositionOffset
        };
        local v33 = 0;
        if v27.props.icons and #v27.props.icons then
            v33 = #v27.props.icons;
        end;
        local v34 = 0;
        if v27.props.textButtons and #v27.props.textButtons then
            v34 = #v27.props.textButtons;
        end;
        local v35 = v27.props.button ~= nil and 1 or 0;
        local v36 = false;
        if v27.props.enableButtonAtStart == true then
            v36 = v35 ~= 0;
        end;
        local v37 = v34 + v33 + v35;
        local v38 = {};
        if v33 ~= 0 then
            for v39, v40 in ipairs(v27.props.icons) do
                local v41 = v36 and v39 + v35 or v39;
                local v42 = {
                    layoutOrder = v41, 
                    iconSize = l_Medium_0
                };
                local v43 = v5.Dictionary.join(v42, v40.props);
                local v44 = {
                    key = "Button" .. tostring(v41), 
                    Size = UDim2.fromOffset(v27.props.iconSize, v27.props.iconSize), 
                    BackgroundTransparency = 1, 
                    [v4.Ref] = v27.buttonRefs[v41], 
                    NextSelectionUp = nil, 
                    NextSelectionDown = nil, 
                    NextSelectionLeft = v27.getGamepadNextSelectionLeft(v41, v37), 
                    NextSelectionRight = v27.getGamepadNextSelectionRight(v41, v37), 
                    inputBindings = {
                        Activated = v43.onActivated and v6.Input.onBegin(Enum.KeyCode.ButtonA, v43.onActivated) or nil
                    }
                };
                table.insert(v38, v4.createElement(v6.Focusable.Frame, v44, {
                    Icon = v4.createElement(v12, v43)
                }));
            end;
        end;
        if v34 ~= 0 then
            for v45, v46 in ipairs(v27.props.textButtons) do
                local v47 = (if v36 then v45 + v35 else v45) + v33;
                local v48 = {
                    layoutOrder = v47
                };
                local v49 = v5.Dictionary.join(v48, v46.props);
                local v50 = {
                    key = "Button" .. tostring(v47), 
                    Size = UDim2.fromOffset(0, v27.props.iconSize), 
                    AutomaticSize = Enum.AutomaticSize.X, 
                    BackgroundTransparency = 1, 
                    [v4.Ref] = v27.buttonRefs[v47], 
                    NextSelectionUp = nil, 
                    NextSelectionDown = nil, 
                    NextSelectionLeft = v27.getGamepadNextSelectionLeft(v47, v37), 
                    NextSelectionRight = v27.getGamepadNextSelectionRight(v47, v37), 
                    inputBindings = {
                        Activated = v49.onActivated and v6.Input.onBegin(Enum.KeyCode.ButtonA, v49.onActivated) or nil
                    }
                };
                table.insert(v38, v4.createElement(v6.Focusable.Frame, v50, {
                    TextButton = v4.createElement(v13, v49)
                }));
            end;
        end;
        if v35 ~= 0 then
            local v51 = UDim2.fromOffset(v30 - v33 * (v27.props.iconSize + v27.props.buttonPadding), v27.props.buttonHeight);
            local v52 = v36 and 1 or v33 + 1;
            local v53 = v9.enableComboButtonInActionBar and v11.validateProps(v27.props.button.props);
            local v54 = {
                layoutOrder = v52, 
                size = v51
            };
            local v55 = v5.Dictionary.join(v54, v27.props.button.props);
            local v56 = {
                key = "Button" .. v52, 
                Size = v51, 
                BackgroundTransparency = 1, 
                [v4.Ref] = v27.buttonRefs[v52], 
                NextSelectionUp = nil, 
                NextSelectionDown = nil, 
                NextSelectionLeft = v27.getGamepadNextSelectionLeft(v52, v37), 
                NextSelectionRight = v27.getGamepadNextSelectionRight(v52, v37), 
                inputBindings = {
                    Activated = if not v53 then v6.Input.onBegin(Enum.KeyCode.ButtonA, v55.onActivated) else nil
                }
            };
            if not v53 and v55.buttonType == nil then
                v55.buttonType = if v33 == 0 then v14.PrimarySystem else v14.PrimaryContextual;
            end;
            table.insert(v38, v36 and 1 or v37, v4.createElement(v6.Focusable.Frame, v56, {
                Icon = v4.createElement(if v53 then v11 else v10, v55)
            }));
        end;
        if v27.props[v4.Children] then
            v38 = v27.props[v4.Children];
        end;
        return v4.createElement(v6.Focusable[l_FitFrameOnAxis_0], {
            BackgroundTransparency = 1, 
            minimumSize = UDim2.new(1, 0, 0, v27.props.buttonHeight), 
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = v27.props.horizontalAlignment, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            Position = UDim2.new(0, 0, 1, 0), 
            AnchorPoint = Vector2.new(0, 1), 
            contentPadding = UDim.new(0, 12), 
            [v4.Ref] = v27.frameRef, 
            [v4.Change.AbsoluteSize] = v27.updateFrameSize, 
            margin = v32, 
            NextSelectionLeft = v27.props.NextSelectionLeft, 
            NextSelectionRight = v27.props.NextSelectionRight, 
            NextSelectionUp = v27.props.NextSelectionUp, 
            NextSelectionDown = v27.props.NextSelectionDown
        }, v38);
    end);
end;
v19.didMount = function(v57) --[[ Line: 298 ]] --[[ Name: didMount ]]
    if v57.frameRef.current then
        v57.updateFrameSize(v57.frameRef.current);
    end;
end;
local v60 = v4.forwardRef(function(v58, v59) --[[ Line: 304 ]]
    -- upvalues: v4 (copy), v19 (copy), v5 (copy)
    return v4.createElement(v19, v5.Dictionary.join(v58, {
        frameRef = v59
    }));
end);
v60.validateProps = v19.validateProps;
return v60;