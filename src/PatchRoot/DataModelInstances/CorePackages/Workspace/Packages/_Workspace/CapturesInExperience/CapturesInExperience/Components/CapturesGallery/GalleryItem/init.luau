local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.React);
local v3 = require(l_Parent_1.RoactUtils);
local v4 = require(l_Parent_0.Analytics.useAnalytics);
local l_useDispatch_0 = v3.Hooks.RoactRodux.useDispatch;
local v6 = require(l_Parent_0.Enums.CaptureType);
local v7 = require(l_Parent_0.Actions.CarouselOpened);
local v8 = require(l_Parent_0.Analytics.EventNames);
local _ = require(l_Parent_0.Types);
return function(v10) --[[ Line: 20 ]]
    -- upvalues: v4 (copy), l_useDispatch_0 (copy), v2 (copy), v8 (copy), v7 (copy), v6 (copy)
    local v11 = v4();
    local v12 = l_useDispatch_0();
    local v13, v14 = v2.useState(UDim2.fromScale(1, 1));
    local v15 = v2.useCallback(function() --[[ Line: 25 ]]
        -- upvalues: v11 (copy), v8 (ref), v12 (copy), v7 (ref), v10 (copy)
        v11.fireEvent(v8.CapturesCarouselOpened);
        v12(v7(v10.captureIndex));
    end, {});
    local v18 = v2.useCallback(function(v16) --[[ Line: 30 ]]
        -- upvalues: v14 (copy)
        local l_Resolution_0 = v16.Resolution;
        v14(UDim2.fromOffset(l_Resolution_0.X, l_Resolution_0.Y));
    end, {});
    return v2.createElement("ImageButton", {
        BackgroundTransparency = 1, 
        ClipsDescendants = true, 
        Image = if v10.capture.type == v6.Screenshot then v10.capture.contentId else nil, 
        ScaleType = Enum.ScaleType.Crop, 
        Size = UDim2.fromScale(1, 1), 
        [v2.Event.Activated] = v15
    }, {
        VideoPreview = if v10.capture.type == v6.Video then v2.createElement("VideoFrame", {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundTransparency = 1, 
            Playing = false, 
            Position = UDim2.fromScale(0.5, 0.5), 
            Size = v13, 
            Video = v10.capture.contentId, 
            [v2.Event.Loaded] = v18
        }) else nil
    });
end;