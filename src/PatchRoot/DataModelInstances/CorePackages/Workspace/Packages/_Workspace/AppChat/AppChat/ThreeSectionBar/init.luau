local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local l_RoactFitComponents_0 = require(l_Parent_0.LuaSocialLibrariesDeps).RoactFitComponents;
local v2 = require(l_Parent_0.Roact);
local v3 = v2.PureComponent:extend("ThreeSectionBar");
v3.Rect = l_RoactFitComponents_0.Rect;
v3.defaultProps = {
    marginLeft = v3.Rect.square(0), 
    marginRight = v3.Rect.square(0), 
    contentPaddingLeft = UDim.new(0, 0), 
    contentPaddingRight = UDim.new(0, 0), 
    height = UDim.new(0, 0)
};
v3.init = function(v4) --[[ Line: 23 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy)
    local v5, v6 = v2.createBinding(0);
    v4.leftWidth = v5;
    v4.updateLeftWidth = v6;
    v5, v6 = v2.createBinding(0);
    v4.rightWidth = v5;
    v4.updateRightWidth = v6;
    v5, v6 = v2.createBinding(0);
    v4.fullWidth = v5;
    v4.updateFullWidth = v6;
end;
v3.render = function(v7) --[[ Line: 30 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), l_RoactFitComponents_0 (copy)
    return v2.createElement("Frame", {
        Size = UDim2.new(UDim.new(1, 0), v7.props.height), 
        LayoutOrder = v7.props.LayoutOrder, 
        [v2.Change.AbsoluteSize] = function(v8) --[[ Line: 35 ]]
            -- upvalues: v7 (copy)
            v7.updateFullWidth(v8.AbsoluteSize.X);
        end
    }, {
        leftFrame = v2.createElement(l_RoactFitComponents_0.FitFrameHorizontal, {
            Transparency = 1, 
            AnchorPoint = Vector2.new(0, 0), 
            Position = UDim2.fromScale(0, 0), 
            minimumSize = UDim.new(0, 0), 
            height = UDim.new(1, 0), 
            FillDirection = Enum.FillDirection.Horizontal, 
            contentPadding = v7.props.contentPaddingLeft, 
            margin = v7.props.marginLeft, 
            [v2.Change.AbsoluteSize] = function(v9) --[[ Line: 49 ]]
                -- upvalues: v7 (copy)
                v7.updateLeftWidth(v9.AbsoluteSize.X);
            end
        }, {
            leftContent = v7.props.renderLeft(v7.props)
        }), 
        centerFrame = v2.createElement("Frame", {
            AnchorPoint = Vector2.new(0.5, 0), 
            Position = UDim2.fromScale(0.5, 0), 
            Size = v2.joinBindings({
                v7.leftWidth, 
                v7.rightWidth, 
                v7.fullWidth
            }):map(function(v10) --[[ Line: 60 ]]
                local v11 = v10[1];
                local v12 = v10[2];
                local v13 = v10[3];
                local v14 = math.max(v11, v12);
                local l_Magnitude_0 = (Vector2.new(v13 / 2, 0) - Vector2.new(v14, 0)).Magnitude;
                return UDim2.new(0, l_Magnitude_0 * 2, 1, 0);
            end)
        }, {
            ["$layout"] = v2.createElement("UIListLayout", {
                HorizontalAlignment = Enum.HorizontalAlignment.Center
            }), 
            centerContent = v7.props.renderCenter(v7.props)
        }), 
        rightFrame = v2.createElement(l_RoactFitComponents_0.FitFrameHorizontal, {
            AnchorPoint = Vector2.new(1, 0), 
            Position = UDim2.fromScale(1, 0), 
            minimumSize = UDim.new(0, 0), 
            height = UDim.new(1, 0), 
            FillDirection = Enum.FillDirection.Horizontal, 
            contentPadding = v7.props.contentPaddingRight, 
            margin = v7.props.marginRight, 
            [v2.Change.AbsoluteSize] = function(v16) --[[ Line: 89 ]]
                -- upvalues: v7 (copy)
                v7.updateRightWidth(v16.AbsoluteSize.X);
            end
        }, {
            rightContent = v7.props.renderRight(v7.props)
        })
    });
end;
return v3;