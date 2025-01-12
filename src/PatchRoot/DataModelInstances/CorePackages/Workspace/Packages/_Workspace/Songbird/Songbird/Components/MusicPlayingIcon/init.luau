local l_script_FirstAncestor_0 = script:FindFirstAncestor("Songbird");
local v1 = require(l_script_FirstAncestor_0.Parent.Cryo);
local v2 = require(l_script_FirstAncestor_0.Parent.React);
local v3 = require(l_script_FirstAncestor_0.Components.AnimatedBar);
local v4 = {
    numAnimatedBars = 5
};
return function(v5) --[[ Line: 21 ]] --[[ Name: MusicPlayingIcon ]]
    -- upvalues: v1 (copy), v4 (copy), v2 (copy), v3 (copy)
    local v6 = v1.Dictionary.join(v4, v5);
    local v7 = 24 / v6.numAnimatedBars;
    local v8 = {};
    for v9 = 1, v6.numAnimatedBars do
        v8[("Bar%*"):format(v9)] = v2.createElement(v3, {
            layoutOrder = v9, 
            width = UDim.new(1 / (v6.numAnimatedBars * 1.2), -v7)
        });
    end;
    return v2.createElement("Frame", {
        Size = UDim2.fromScale(1, 1), 
        BackgroundTransparency = 1
    }, {
        Layout = v2.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            Padding = UDim.new(0, v7)
        })
    }, v8);
end;