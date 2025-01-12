local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.VirtualizedList);
local l_useStyle_0 = require(l_Parent_0.UIBlox).Core.Style.useStyle;
local v5 = game:DefineFastInt("ExpChatScrollLockThreshold", 90) / 100;
local v6 = require(l_script_FirstAncestor_0.Flags.getFFlagEnableChatWindowMemoization);
local function _(v7) --[[ Line: 15 ]] --[[ Name: isScrollbarNearBottom ]]
    -- upvalues: v5 (copy)
    local l_AbsoluteWindowSize_0 = v7.AbsoluteWindowSize;
    local l_CanvasPosition_0 = v7.CanvasPosition;
    local l_AbsoluteCanvasSize_0 = v7.AbsoluteCanvasSize;
    local v11 = l_AbsoluteCanvasSize_0 - l_AbsoluteWindowSize_0;
    local v12 = l_CanvasPosition_0.Y / v11.Y;
    if l_AbsoluteCanvasSize_0.Y <= l_AbsoluteWindowSize_0.Y then
        return true;
    else
        return v5 <= v12;
    end;
end;
local function _(v14) --[[ Line: 30 ]] --[[ Name: isMouseMovementOrTouch ]]
    local v15 = true;
    if v14.UserInputType ~= Enum.UserInputType.MouseMovement then
        v15 = v14.UserInputType == Enum.UserInputType.Touch;
    end;
    return v15;
end;
local function v43(v17) --[[ Line: 35 ]] --[[ Name: BottomLockedScrollViewV2 ]]
    -- upvalues: l_useStyle_0 (copy), v2 (copy), v3 (copy), v5 (copy)
    local l_Theme_0 = l_useStyle_0().Theme;
    local v19 = v2.useRef(nil);
    local v20 = v2.useRef(nil);
    local v21, v22 = v2.useState(true);
    local v23, v24 = v2.useState(false);
    local v25, v26 = v2.useState(false);
    local v27, v28 = v2.useState(nil);
    v2.useEffect(function() --[[ Line: 46 ]]
        -- upvalues: v20 (copy), v19 (copy)
        if v20.current then
            local l_FirstChildWhichIsA_0 = v20.current:FindFirstChildWhichIsA("ScrollingFrame", true);
            if l_FirstChildWhichIsA_0 then
                v19.current = l_FirstChildWhichIsA_0;
            end;
        end;
    end, {
        v20
    });
    v2.useEffect(function() --[[ Line: 56 ]]
        -- upvalues: v21 (copy), v25 (copy), v19 (copy)
        if v21 and v25 == false and v19.current then
            v19.current.CanvasPosition = Vector2.new(0, 9.223372036854776E18);
        end;
    end, {
        tostring(v17.messages), 
        v21, 
        v25, 
        tostring(v19), 
        v17.targetTextChannel
    });
    v2.useEffect(function() --[[ Line: 64 ]]
        -- upvalues: v17 (copy), v27 (copy), v28 (copy), v22 (copy)
        if v17.targetTextChannel and v17.targetTextChannel ~= v27 then
            v28(v17.targetTextChannel);
            if v17.isChannelBarVisible then
                v22(true);
            end;
        end;
    end, {
        v17.targetTextChannel
    });
    return v2.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = v17.Size, 
        ref = v20, 
        [v2.Event.InputBegan] = function(_, v31) --[[ Line: 78 ]]
            -- upvalues: v24 (copy), v26 (copy)
            local v32 = true;
            if v31.UserInputType ~= Enum.UserInputType.MouseMovement then
                v32 = v31.UserInputType == Enum.UserInputType.Touch;
            end;
            if v32 then
                v24(true);
            end;
            if v31.UserInputType == Enum.UserInputType.Touch then
                v26(true);
            end;
        end, 
        [v2.Event.InputEnded] = function(_, v34) --[[ Line: 87 ]]
            -- upvalues: v24 (copy), v26 (copy)
            local v35 = true;
            if v34.UserInputType ~= Enum.UserInputType.MouseMovement then
                v35 = v34.UserInputType == Enum.UserInputType.Touch;
            end;
            if v35 then
                v24(false);
            end;
            if v34.UserInputType == Enum.UserInputType.Touch then
                v26(false);
            end;
        end
    }, {
        padding = v2.createElement("UIPadding", {
            PaddingTop = UDim.new(0, 0), 
            PaddingBottom = UDim.new(0, 0), 
            PaddingLeft = UDim.new(0, 8), 
            PaddingRight = UDim.new(0, 8)
        }), 
        scrollView = v2.createElement(v3.ScrollView, {
            style = {
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                ScrollBarImageColor3 = l_Theme_0.UIEmphasis.Color, 
                ScrollBarImageTransparency = v23 and 0 or 1, 
                ScrollBarThickness = 8
            }, 
            contentContainerStyle = {
                BackgroundTransparency = 1
            }, 
            Size = UDim2.fromScale(1, 1), 
            onScroll = function(v36) --[[ Line: 115 ]] --[[ Name: onScroll ]]
                -- upvalues: v22 (copy), v5 (ref)
                local l_v22_0 = v22;
                local l_AbsoluteWindowSize_1 = v36.AbsoluteWindowSize;
                local l_CanvasPosition_1 = v36.CanvasPosition;
                local l_AbsoluteCanvasSize_1 = v36.AbsoluteCanvasSize;
                local v41 = l_AbsoluteCanvasSize_1 - l_AbsoluteWindowSize_1;
                local v42 = l_CanvasPosition_1.Y / v41.Y;
                l_v22_0(l_AbsoluteCanvasSize_1.Y <= l_AbsoluteWindowSize_1.Y or v42 >= v5);
            end
        }, v17.children)
    });
end;
if v6() then
    return (v2.memo(v43));
else
    return v43;
end;