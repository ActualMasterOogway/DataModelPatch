local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_Roact_0 = v1.Roact;
local l_t_0 = v1.t;
local l_RoactRodux_0 = v1.RoactRodux;
local v5 = require(l_Parent_0.Components.LoadingTile);
local v6 = l_Roact_0.Component:extend("LoadingCarousel");
v6.validateProps = l_t_0.strictInterface({
    layoutOrder = l_t_0.number, 
    tileSize = l_t_0.number, 
    tileInfoHeight = l_t_0.number, 
    screenWidth = l_t_0.number, 
    cardPadding = l_t_0.number
});
v6.defaultProps = {
    layoutOrder = 0, 
    tileSize = 100, 
    tileInfoHeight = 70, 
    cardPadding = 10
};
v6.init = function(v7) --[[ Line: 37 ]] --[[ Name: init ]]
    -- upvalues: l_Roact_0 (copy), v5 (copy)
    v7.getListOfTiles = function() --[[ Line: 38 ]]
        -- upvalues: v7 (copy), l_Roact_0 (ref), v5 (ref)
        local l_props_0 = v7.props;
        local v9 = math.ceil(l_props_0.screenWidth / l_props_0.tileSize);
        local v10 = {
            ListLayout = l_Roact_0.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Top, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, l_props_0.cardPadding)
            })
        };
        for v11 = 1, v9 do
            table.insert(v10, l_Roact_0.createElement(v5, {
                layoutOrder = v11, 
                tileSize = l_props_0.tileSize, 
                tileInfoHeight = l_props_0.tileInfoHeight
            }));
        end;
        return v10;
    end;
end;
v6.render = function(v12) --[[ Line: 66 ]] --[[ Name: render ]]
    -- upvalues: l_Roact_0 (copy)
    local l_props_1 = v12.props;
    return l_Roact_0.createElement("Frame", {
        LayoutOrder = l_props_1.layoutOrder, 
        BackgroundTransparency = 1
    }, v12.getListOfTiles());
end;
return l_RoactRodux_0.connect(function(v14) --[[ Line: 75 ]]
    return {
        screenWidth = v14.ScreenSize.X
    };
end, nil)(v6);