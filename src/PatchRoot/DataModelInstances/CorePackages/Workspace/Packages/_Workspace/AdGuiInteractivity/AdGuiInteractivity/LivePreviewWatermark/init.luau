local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Roact);
local v2 = require(script.Parent.Flags);
local v3 = v2.GetFStringAdGuiLivePreviewWatermark();
local v4 = v2.GetFStringAdGuiLivePreviewWatermarkV2();
local v5 = v2.GetFStringLivePreviewPlaceId();
local v6 = v2.GetFFlagUseV2LivePreviewWatermark();
local l_game_EngineFeature_0 = game:GetEngineFeature("EnableDynamicLivePreviewWatermark");
local v8 = v1.PureComponent:extend("LivePreviewWatermark");
v8.init = function(v9) --[[ Line: 14 ]] --[[ Name: init ]]
    v9.placeId = tostring(game.PlaceId);
end;
v8.render = function(v10) --[[ Line: 18 ]] --[[ Name: render ]]
    -- upvalues: v5 (copy), l_game_EngineFeature_0 (copy), v1 (copy), v6 (copy), v4 (copy), v3 (copy)
    local v11 = v5 == v10.placeId;
    if l_game_EngineFeature_0 then
        v11 = v11 and v10.props.IsVisible;
    end;
    return v11 and v1.createElement("ImageLabel", {
        Image = v6 and v4 or v3, 
        Size = v6 and UDim2.new(1, 0, 1, 0) or UDim2.new(0.5, 0, 0.5, 0), 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Position = UDim2.new(0.5, 0, 0.5, 0), 
        ScaleType = Enum.ScaleType.Fit, 
        ZIndex = -999, 
        Transparency = 1, 
        ImageTransparency = v6 and 0 or 0.7, 
        Rotation = v6 and 0 or 15
    }) or nil;
end;
return v8;