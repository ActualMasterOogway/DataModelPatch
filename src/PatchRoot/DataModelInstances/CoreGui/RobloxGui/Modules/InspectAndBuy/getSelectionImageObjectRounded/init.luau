local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.Colors);
return function() --[[ Line: 4 ]] --[[ Name: getSelectionImageObjectRounded ]]
    -- upvalues: v1 (copy)
    local l_ImageLabel_0 = Instance.new("ImageLabel");
    l_ImageLabel_0.Image = "rbxasset://textures/ui/InspectMenu/selection_rounded.png";
    l_ImageLabel_0.ImageColor3 = v1.White;
    l_ImageLabel_0.ScaleType = Enum.ScaleType.Slice;
    l_ImageLabel_0.SliceCenter = Rect.new(5, 5, 120, 20);
    l_ImageLabel_0.BackgroundTransparency = 1;
    l_ImageLabel_0.Size = UDim2.new(1, 0, 1, 0);
    return l_ImageLabel_0;
end;