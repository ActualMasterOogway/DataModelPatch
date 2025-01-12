local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Cryo);
local v3 = require(l_Parent_1.React);
local v4 = require(l_Parent_1.RoactUtils);
local v5 = require(l_Parent_1.UIBlox);
local l_Checkbox_0 = v5.App.InputButton.Checkbox;
local l_Images_0 = v5.App.ImageSet.Images;
local v8 = require(l_Parent_0.Analytics.useAnalytics);
local l_useDispatch_0 = v4.Hooks.RoactRodux.useDispatch;
local l_useSelector_0 = v4.Hooks.RoactRodux.useSelector;
local v11 = require(l_Parent_0.Enums.CaptureType);
local v12 = require(l_Parent_0.Constants);
local v13 = require(l_Parent_0.Analytics.EventNames);
local v14 = require(l_Parent_0.Thunks.SelectCapture);
local _ = require(l_Parent_0.Types);
return function(v16) --[[ Line: 32 ]]
    -- upvalues: v8 (copy), l_useDispatch_0 (copy), v3 (copy), l_useSelector_0 (copy), v12 (copy), v13 (copy), v14 (copy), v2 (copy), v11 (copy), l_Checkbox_0 (copy), l_Images_0 (copy)
    local v17 = v8();
    local v18 = l_useDispatch_0();
    local v19, v20 = v3.useState(UDim2.fromScale(1, 1));
    local v21, v22 = v3.useState(false);
    local v24 = l_useSelector_0(function(v23) --[[ Line: 38 ]]
        -- upvalues: v12 (ref)
        return v23[v12.RoduxKey].CaptureManager.SelectedCaptures;
    end);
    local v25 = v3.useCallback(function() --[[ Line: 42 ]]
        -- upvalues: v22 (copy), v21 (copy), v17 (copy), v13 (ref), v18 (copy), v14 (ref), v16 (copy)
        v22(not v21);
        v17.fireEvent(v13.CapturesManagerItemActivated);
        v18(v14(v16.capture));
    end, {
        v21, 
        v16.capture
    });
    local v28 = v3.useCallback(function(v26) --[[ Line: 48 ]]
        -- upvalues: v20 (copy)
        local l_Resolution_0 = v26.Resolution;
        v20(UDim2.fromOffset(l_Resolution_0.X, l_Resolution_0.Y));
    end, {});
    v3.useEffect(function() --[[ Line: 53 ]]
        -- upvalues: v22 (copy), v2 (ref), v24 (copy), v16 (copy)
        v22(v2.List.find(v24, v16.capture) ~= nil);
    end, {
        v24, 
        v16.capture
    });
    return v3.createElement("ImageButton", {
        BackgroundTransparency = 1, 
        ClipsDescendants = true, 
        Image = if v16.capture.type == v11.Screenshot then v16.capture.contentId else nil, 
        ImageTransparency = v21 and 0.5 or 0, 
        ScaleType = Enum.ScaleType.Crop, 
        Size = UDim2.fromScale(1, 1), 
        [v3.Event.Activated] = v25
    }, {
        CheckboxFrame = v3.createElement("Frame", {
            BackgroundTransparency = 1, 
            Position = UDim2.new(1, -34, 0, 8), 
            Size = UDim2.fromOffset(26, 26)
        }, {
            Checkbox = if v21 then v3.createElement(l_Checkbox_0, {
                isSelected = true, 
                isDisabled = false, 
                layoutOrder = 1, 
                text = "", 
                onActivated = v25
            }) else v3.createElement("ImageButton", {
                BackgroundTransparency = 1, 
                Image = l_Images_0["squircles/hollow"].Image, 
                ImageRectOffset = l_Images_0["squircles/hollow"].ImageRectOffset, 
                ImageRectSize = l_Images_0["squircles/hollow"].ImageRectSize, 
                ImageTransparency = 0.7, 
                Size = UDim2.fromOffset(26, 26), 
                [v3.Event.Activated] = v25
            })
        }), 
        VideoPreview = if v16.capture.type == v11.Video then v3.createElement("VideoFrame", {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundTransparency = 1, 
            Playing = false, 
            Position = UDim2.fromScale(0.5, 0.5), 
            Size = v19, 
            Video = v16.capture.contentId, 
            [v3.Event.Loaded] = v28
        }) else nil
    });
end;