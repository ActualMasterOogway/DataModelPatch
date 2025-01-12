local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.React);
local v3 = require(l_Parent_0.Enums.BlurDirection);
local v4 = require(l_Parent_0.Flags.FFlagContentFeedPinchToZoomEnabled);
local function v9(v5, v6) --[[ Line: 26 ]] --[[ Name: getImageRect ]]
    -- upvalues: v3 (copy)
    local l_X_0 = v6.X;
    local l_Y_0 = v6.Y;
    if v5 == v3.Up then
        return Vector2.new(0, 0), Vector2.new(l_X_0, 1);
    elseif v5 == v3.Down then
        return Vector2.new(0, l_Y_0 - 1), Vector2.new(l_X_0, 1);
    elseif v5 == v3.Left then
        return Vector2.new(0, 0), Vector2.new(1, l_Y_0);
    elseif v5 == v3.Right then
        return Vector2.new(l_X_0 - 1, 0), Vector2.new(1, l_Y_0);
    else
        return nil;
    end;
end;
local function _(v10) --[[ Line: 42 ]] --[[ Name: getGradientRotation ]]
    -- upvalues: v3 (copy)
    if v10 == v3.Up then
        return 270;
    elseif v10 == v3.Down then
        return 90;
    elseif v10 == v3.Left then
        return 180;
    elseif v10 == v3.Right then
        return 0;
    else
        return nil;
    end;
end;
local function v13(v12) --[[ Line: 56 ]] --[[ Name: getRadialGradientPosition ]]
    -- upvalues: v3 (copy)
    if v12 == v3.Up then
        return UDim2.fromScale(0.5, 1);
    elseif v12 == v3.Down then
        return UDim2.fromScale(0.5, 0);
    elseif v12 == v3.Left then
        return UDim2.fromScale(1, 0.5);
    elseif v12 == v3.Right then
        return UDim2.fromScale(0, 0.5);
    else
        return nil;
    end;
end;
local function v17(v14, v15) --[[ Line: 70 ]] --[[ Name: getTransparency ]]
    if not v15 then
        return v14;
    else
        return v15:map(function(v16) --[[ Line: 78 ]]
            -- upvalues: v14 (copy)
            return v14 + (1 - v14) * v16;
        end);
    end;
end;
return function(v18) --[[ Line: 83 ]] --[[ Name: ImageBlurEffect ]]
    -- upvalues: v9 (copy), v13 (copy), v2 (copy), v17 (copy), v4 (copy), v3 (copy)
    local v19 = if v18.gradientColor then v18.gradientColor else Color3.new(0, 0, 0);
    local v20, v21 = v9(v18.direction, v18.imageSize);
    local v22 = v13(v18.direction);
    local v23 = v2.useMemo(function() --[[ Line: 88 ]]
        -- upvalues: v17 (ref), v18 (copy)
        return v17(0, v18.transparencyBinding);
    end, {
        v18.transparencyBinding
    });
    local v24 = v2.useMemo(function() --[[ Line: 92 ]]
        -- upvalues: v17 (ref), v18 (copy)
        return v17(0.9, v18.transparencyBinding);
    end, {
        v18.transparencyBinding
    });
    local v25 = v2.useMemo(function() --[[ Line: 96 ]]
        -- upvalues: v17 (ref), v18 (copy)
        return v17(0.8, v18.transparencyBinding);
    end, {
        v18.transparencyBinding
    });
    local l_createElement_0 = v2.createElement;
    local v27 = "ImageLabel";
    local v28 = {
        AnchorPoint = v18.AnchorPoint, 
        BackgroundTransparency = 1, 
        ClipsDescendants = true, 
        Image = v18.image, 
        ImageRectOffset = v20, 
        ImageRectSize = v21, 
        ImageTransparency = if v4 then v23 else 0, 
        Position = v18.Position, 
        ScaleType = Enum.ScaleType.Crop, 
        Size = v18.Size, 
        ZIndex = v18.ZIndex
    };
    local v29 = {};
    local l_createElement_1 = v2.createElement;
    local v31 = "UIGradient";
    local v32 = {
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.new(1, 1, 1)), 
            ColorSequenceKeypoint.new(1, v19)
        })
    };
    local l_direction_0 = v18.direction;
    v32.Rotation = l_direction_0 == v3.Up and 270 or l_direction_0 == v3.Down and 90 or l_direction_0 == v3.Left and 180 or l_direction_0 == v3.Right and 0 or nil;
    v32.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.3), 
        NumberSequenceKeypoint.new(0.5, 0.5), 
        NumberSequenceKeypoint.new(1, 1)
    });
    v29.UIGradient = l_createElement_1(v31, v32);
    v29.RadialBlur = v2.createElement("ImageLabel", {
        AnchorPoint = Vector2.new(0.5, 0.5), 
        BackgroundTransparency = 1, 
        Image = "rbxasset://textures/shadowblurmask.png", 
        ImageTransparency = if v4 then v24 else 0.9, 
        Position = v22, 
        ScaleType = Enum.ScaleType.Crop, 
        Size = UDim2.fromScale(2, 2), 
        ZIndex = 1
    });
    v29.SoftEdges = v2.createElement("ImageLabel", {
        AnchorPoint = Vector2.new(0.5, 0.5), 
        BackgroundTransparency = 1, 
        Image = "rbxasset://textures/ui/VR/edgeBlur.png", 
        ImageTransparency = if v4 then v25 else 0.8, 
        Position = v22, 
        ScaleType = Enum.ScaleType.Crop, 
        Size = UDim2.fromScale(1.5, 2), 
        ZIndex = 2
    });
    return l_createElement_0(v27, v28, v29);
end;