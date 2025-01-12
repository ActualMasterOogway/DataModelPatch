local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_Roact_0 = v1.Roact;
local l_t_0 = v1.t;
local l_ShimmerPanel_0 = v1.UIBlox.App.Loading.ShimmerPanel;
local v5 = l_Roact_0.PureComponent:extend("LoadingTile");
v5.validateProps = l_t_0.strictInterface({
    layoutOrder = l_t_0.number, 
    tileSize = l_t_0.number, 
    tileInfoHeight = l_t_0.number
});
v5.defaultProps = {
    layoutOrder = 0, 
    tileSize = 100, 
    tileInfoHeight = 70
};
v5.render = function(v6) --[[ Line: 31 ]] --[[ Name: render ]]
    -- upvalues: l_Roact_0 (copy), l_ShimmerPanel_0 (copy)
    local l_props_0 = v6.props;
    local v8 = UDim.new(0, l_props_0.tileSize);
    return l_Roact_0.createFragment({
        LoadingTile = l_Roact_0.createElement("Frame", {
            LayoutOrder = l_props_0.layoutOrder, 
            Size = UDim2.fromOffset(l_props_0.tileSize, 0), 
            BackgroundTransparency = 1
        }, {
            Layout = l_Roact_0.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Top, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 10)
            }), 
            PlayerTile = l_Roact_0.createElement(l_ShimmerPanel_0, {
                LayoutOrder = 1, 
                Size = UDim2.fromOffset(l_props_0.tileSize, l_props_0.tileSize), 
                cornerRadius = v8
            })
        })
    });
end;
return v5;