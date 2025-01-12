local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.AppCommonLib);
local v3 = require(l_Parent_1.React);
local v4 = require(l_Parent_1.RobloxAppHooks);
local v5 = require(l_Parent_1.UIBlox);
local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local l_memoize_0 = v2.memoize;
local l_useScreenSize_0 = v4.useScreenSize;
local l_useStyle_0 = v5.Core.Style.useStyle;
local v10 = require(l_Parent_0.Enums.CaptureType);
local v11 = require(l_Parent_0.Utils.getCaptureSize);
local _ = require(l_Parent_0.Types);
local v18 = l_memoize_0(function(v13, v14) --[[ Line: 25 ]]
    local v15 = v13.X / v13.Y;
    local l_X_0 = v14.X;
    local v17 = math.floor(l_X_0 / v15);
    if v14.Y < v17 then
        v17 = v14.Y;
        l_X_0 = math.floor(v17 * v15);
    end;
    return Vector2.new(l_X_0, v17);
end);
local function _(v19) --[[ Line: 39 ]] --[[ Name: getDeleteTransitionSize ]]
    return UDim2.fromScale(v19, v19);
end;
local function v22(v21) --[[ Line: 43 ]] --[[ Name: getDeleteTransitionTransparency ]]
    -- upvalues: l_UserGameSettings_0 (copy)
    if l_UserGameSettings_0.ReducedMotion then
        return v21;
    else
        return 1;
    end;
end;
local function v24(v23) --[[ Line: 47 ]] --[[ Name: getCapturesItemSize ]]
    -- upvalues: l_UserGameSettings_0 (copy)
    if l_UserGameSettings_0.ReducedMotion then
        return (UDim2.fromScale(1, 1));
    else
        return (UDim2.fromScale(v23, v23));
    end;
end;
return function(v25) --[[ Line: 61 ]]
    -- upvalues: l_useStyle_0 (copy), v3 (copy), l_useScreenSize_0 (copy), v10 (copy), v11 (copy), v18 (copy), l_UserGameSettings_0 (copy), v24 (copy), v22 (copy)
    local v26 = l_useStyle_0();
    local l_itemSize_0 = v25.itemSize;
    local v28, v29 = v3.useBinding(0);
    local v30, v31 = v3.useState(Vector2.new(0, 0));
    local v32 = l_useScreenSize_0();
    local l_imagePadding_0 = v25.imagePadding;
    local l_itemIndex_0 = v25.itemIndex;
    local v36 = v3.useCallback(function(v35) --[[ Line: 72 ]]
        -- upvalues: v29 (copy)
        v29(v35.AbsolutePosition.X);
    end, {
        v29
    });
    v3.useEffect(function() --[[ Line: 76 ]]
        -- upvalues: v25 (copy), v10 (ref), v11 (ref), v31 (copy), l_itemSize_0 (copy)
        if v25.capture.type == v10.Video then
            return;
        else
            task.spawn(function() --[[ Line: 81 ]]
                -- upvalues: v11 (ref), v25 (ref), v31 (ref), l_itemSize_0 (ref)
                local v37 = v11(v25.capture.contentId);
                if v37 then
                    v31(v37);
                    return;
                else
                    v31(l_itemSize_0);
                    return;
                end;
            end);
            return;
        end;
    end, {
        l_itemSize_0, 
        v25.capture
    });
    local v40 = v3.useCallback(function(v38) --[[ Line: 92 ]]
        -- upvalues: v31 (copy)
        local l_Resolution_0 = v38.Resolution;
        v31(Vector2.new(l_Resolution_0.X, l_Resolution_0.Y));
    end, {});
    local v46 = v3.useCallback(function(v41) --[[ Line: 97 ]]
        -- upvalues: l_itemSize_0 (copy), v32 (copy)
        local v42 = l_itemSize_0.X / 2;
        local v43 = v32.X / 2;
        local v44 = v41 + v42;
        local v45 = math.abs(v43 - v44);
        v45 = v45 < 25 and 0 or v45 - 25;
        return math.sign(v43 - v44), (math.min(1, v45 / (l_itemSize_0.X - 25)));
    end, {
        l_itemSize_0, 
        l_itemIndex_0, 
        v32
    });
    local v54 = v3.useCallback(function(v47) --[[ Line: 115 ]]
        -- upvalues: v46 (copy), v18 (ref), v30 (copy), l_itemSize_0 (copy), v25 (copy)
        local _, v49 = v46(v47);
        local v50 = v18(v30, l_itemSize_0);
        if v49 == 0 then
            return UDim2.fromOffset(v50.X, v50.Y);
        else
            local v51 = 1 - v49 * (1 - v25.unfocusedSizeMultiplier);
            local v52 = v50.Y * v51;
            local v53 = v50.X * v51;
            v52 = math.floor(v52);
            v53 = math.floor(v53);
            return UDim2.fromOffset(v53, v52);
        end;
    end, {
        v30, 
        l_itemSize_0, 
        v25.unfocusedSizeMultiplier, 
        v46
    });
    local v60 = v3.useCallback(function(v55) --[[ Line: 134 ]]
        -- upvalues: v46 (copy), v54 (copy), l_itemSize_0 (copy), l_imagePadding_0 (copy)
        local v56, v57 = v46(v55);
        if v57 == 0 then
            return UDim2.fromScale(0.5, 0.5);
        else
            local l_Offset_0 = v54(v55).X.Offset;
            local v59 = (l_itemSize_0.X / 2 - l_imagePadding_0 - l_Offset_0 / 2) * v57;
            return UDim2.new(0.5, v59 * v56, 0.5, 0);
        end;
    end, {
        v30, 
        l_imagePadding_0, 
        l_itemSize_0, 
        v32, 
        v46, 
        v54
    });
    local l_Transparency_0 = v26.Theme.Overlay.Transparency;
    local v65 = v3.useCallback(function(v62) --[[ Line: 155 ]]
        -- upvalues: v46 (copy), l_Transparency_0 (copy)
        local _, v64 = v46(v62);
        return 1 - (1 - l_Transparency_0) * v64;
    end, {
        l_Transparency_0, 
        v46
    });
    local v69 = v3.useCallback(function(v66) --[[ Line: 160 ]]
        -- upvalues: l_UserGameSettings_0 (ref), v65 (copy)
        local l_absoluteXPosition_0 = v66.absoluteXPosition;
        local l_fadeOutBinding_0 = v66.fadeOutBinding;
        if l_UserGameSettings_0.ReducedMotion and l_fadeOutBinding_0 then
            return 1;
        elseif l_fadeOutBinding_0 then
            return (math.min(v65(l_absoluteXPosition_0), l_fadeOutBinding_0));
        else
            return v65(l_absoluteXPosition_0);
        end;
    end, {
        v65
    });
    return v3.createElement("Frame", {
        AnchorPoint = Vector2.new(0.5, 0.5), 
        BackgroundTransparency = 1, 
        Position = UDim2.fromScale(0.5, 0.5), 
        Size = UDim2.fromScale(1, 1), 
        [v3.Change.AbsolutePosition] = v36
    }, {
        CaptureContainer = v3.createElement("Frame", {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundTransparency = 1, 
            Position = v28:map(v60), 
            Size = v28:map(v54)
        }, {
            CaptureImage = if v25.capture.type == v10.Screenshot then v3.createElement("ImageLabel", {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                BackgroundTransparency = 1, 
                Image = v25.capture.contentId, 
                Position = UDim2.fromScale(0.5, 0.5), 
                ScaleType = Enum.ScaleType.Crop, 
                Size = if v25.fadeOutBinding then v25.fadeOutBinding:map(v24) else UDim2.fromScale(1, 1), 
                Visible = v30 ~= Vector2.new(0, 0), 
                ZIndex = 1
            }) else nil, 
            CaptureVideo = if v25.capture.type == v10.Video then v3.createElement("VideoFrame", {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                BackgroundTransparency = 1, 
                Playing = v28:map(function(v70) --[[ Line: 206 ]]
                    -- upvalues: v46 (copy)
                    local _, v72 = v46(v70);
                    return v72 < 0.5;
                end), 
                Position = UDim2.fromScale(0.5, 0.5), 
                Looped = true, 
                Size = if v25.fadeOutBinding then v25.fadeOutBinding:map(v24) else UDim2.fromScale(1, 1), 
                Video = v25.capture.contentId, 
                Volume = 0, 
                ZIndex = 1, 
                [v3.Event.Loaded] = v40
            }) else nil, 
            Overlay = v3.createElement("Frame", {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                BackgroundColor3 = v26.Theme.Overlay.Color, 
                BackgroundTransparency = v3.joinBindings({
                    absoluteXPosition = v28, 
                    fadeOutBinding = v25.fadeOutBinding
                }):map(v69), 
                BorderSizePixel = 0, 
                Position = UDim2.fromScale(0.5, 0.5), 
                Size = if v25.fadeOutBinding then v25.fadeOutBinding:map(v24) else UDim2.fromScale(1, 1), 
                ZIndex = 2
            }), 
            TransitionOverlay = v3.createElement("Frame", {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                BackgroundColor3 = v26.Theme.BackgroundContrast.Color, 
                BackgroundTransparency = if v25.transitionBinding then v25.transitionBinding:map(v22) else 1, 
                BorderSizePixel = 0, 
                Position = UDim2.fromScale(0.5, 0.5), 
                Size = UDim2.fromScale(1, 1), 
                ZIndex = 3
            })
        })
    });
end;