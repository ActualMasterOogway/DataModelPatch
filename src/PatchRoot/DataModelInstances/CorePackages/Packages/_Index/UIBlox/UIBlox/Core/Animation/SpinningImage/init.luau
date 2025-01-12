local l_RunService_0 = game:GetService("RunService");
local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v3 = require(l_Parent_1.Roact);
local v4 = require(l_Parent_0.Parent.t);
local l_Label_0 = require(l_Parent_0.Core.ImageSet.ImageSetComponent).Label;
local v6 = v3.PureComponent:extend("SpinningImage");
v6.validateProps = v4.strictInterface({
    image = v4.table, 
    size = v4.optional(v4.UDim2), 
    anchorPoint = v4.optional(v4.Vector2), 
    position = v4.optional(v4.union(v4.UDim2, v4.table)), 
    rotationRate = v4.optional(v4.number)
});
v6.defaultProps = {
    rotationRate = 360
};
v6.init = function(v7) --[[ Line: 25 ]] --[[ Name: init ]]
    v7.state = {
        angle = 0
    };
end;
v6.didMount = function(v8) --[[ Line: 31 ]] --[[ Name: didMount ]]
    -- upvalues: l_RunService_0 (copy)
    v8.heartbeatConnection = l_RunService_0.Heartbeat:Connect(function(v9) --[[ Line: 32 ]]
        -- upvalues: v8 (copy)
        local v10 = v8.state.angle + v8.props.rotationRate * v9;
        if v10 > 360 then
            v10 = v10 - 360;
        elseif v10 < 0 then
            v10 = v10 + 360;
        end;
        v8:setState({
            angle = v10
        });
    end);
end;
v6.willUnmount = function(v11) --[[ Line: 45 ]] --[[ Name: willUnmount ]]
    v11.heartbeatConnection:Disconnect();
end;
v6.getDerivedStateFromProps = function(v12, _) --[[ Line: 49 ]] --[[ Name: getDerivedStateFromProps ]]
    local l_ImageRectSize_0 = v12.image.ImageRectSize;
    return {
        size = v12.size or UDim2.fromOffset(l_ImageRectSize_0.X, l_ImageRectSize_0.Y)
    };
end;
v6.render = function(v15) --[[ Line: 56 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy), l_Label_0 (copy)
    return v3.createElement("Frame", {
        Size = v15.state.size, 
        AnchorPoint = v15.props.anchorPoint, 
        Position = v15.props.position, 
        BackgroundTransparency = 1
    }, {
        inner = v3.createElement(l_Label_0, {
            Size = v15.state.size, 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.fromScale(0.5, 0.5), 
            Image = v15.props.image, 
            Rotation = v15.state.angle, 
            BackgroundTransparency = 1
        })
    });
end;
return v6;