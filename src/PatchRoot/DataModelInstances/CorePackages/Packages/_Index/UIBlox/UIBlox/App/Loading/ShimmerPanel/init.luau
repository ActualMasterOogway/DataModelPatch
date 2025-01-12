local l_RunService_0 = game:GetService("RunService");
local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local l_Skeleton_0 = require(l_Parent_2.Foundation).Skeleton;
local v5 = require(l_Parent_0.getClosestRadius);
local v6 = require(l_Parent_2.Roact);
local v7 = require(l_Parent_2.t);
local l_EventConnection_0 = require(l_Parent_2.ReactUtils).EventConnection;
local v9 = require(l_Parent_1.Core.Style.withStyle);
local v10 = require(script.Parent.TextureScroller);
local v11 = require(l_Parent_2.UIBlox.Utility.lerp);
local v12 = require(l_Parent_1.UIBloxConfig);
local v13 = v6.PureComponent:extend("ShimmerPanel");
v13.validateProps = v7.strictInterface({
    AnchorPoint = v7.optional(v7.Vector2), 
    LayoutOrder = v7.optional(v7.integer), 
    Position = v7.optional(v7.UDim2), 
    Size = v7.UDim2, 
    cornerRadius = v7.optional(v7.UDim), 
    Image = v7.optional(v7.string), 
    imageDimensions = v7.optional(v7.Vector2), 
    imageScale = v7.optional(v7.number), 
    shimmerSpeed = v7.optional(v7.number)
});
v13.defaultProps = {
    cornerRadius = UDim.new(0, 0), 
    Image = "rbxasset://textures/ui/LuaApp/graphic/shimmer.png", 
    imageDimensions = Vector2.new(219, 250), 
    imageScale = 2.5, 
    shimmerSpeed = 4
};
local function _(v14) --[[ Line: 66 ]] --[[ Name: lerpValueToAnimCurve ]]
    v14 = math.abs(v14 - 1);
    if v14 > 1 then
        return 1;
    elseif v14 < 0.5 then
        return 4 * math.pow(v14, 3);
    else
        return 1 - math.pow(-2 * v14 + 2, 3) / 2;
    end;
end;
v13.init = function(v16) --[[ Line: 77 ]] --[[ Name: init ]]
    -- upvalues: v6 (copy)
    v16.state = {
        lerpValue = 0
    };
    v16.frameRef = v6.createRef();
    v16.lerpValue = 0;
end;
v13.render = function(v17) --[[ Line: 85 ]] --[[ Name: render ]]
    -- upvalues: v9 (copy), v12 (copy), v5 (copy), v6 (copy), l_Skeleton_0 (copy), v11 (copy), l_EventConnection_0 (copy), l_RunService_0 (copy), v10 (copy)
    local l_AnchorPoint_0 = v17.props.AnchorPoint;
    local l_LayoutOrder_0 = v17.props.LayoutOrder;
    local l_Position_0 = v17.props.Position;
    local l_cornerRadius_0 = v17.props.cornerRadius;
    local l_Image_0 = v17.props.Image;
    local l_imageDimensions_0 = v17.props.imageDimensions;
    local l_imageScale_0 = v17.props.imageScale;
    local l_shimmerSpeed_0 = v17.props.shimmerSpeed;
    local l_Size_0 = v17.props.Size;
    local v27 = l_imageDimensions_0 / l_imageScale_0;
    local v28 = 0;
    if l_shimmerSpeed_0 ~= 0 then
        v28 = (l_imageScale_0 + 1) / l_shimmerSpeed_0;
    end;
    return v9(function(v29) --[[ Line: 103 ]]
        -- upvalues: v12 (ref), v5 (ref), l_cornerRadius_0 (copy), v6 (ref), l_Skeleton_0 (ref), l_AnchorPoint_0 (copy), l_Position_0 (copy), l_Size_0 (copy), l_LayoutOrder_0 (copy), v17 (copy), v11 (ref), l_EventConnection_0 (ref), l_RunService_0 (ref), v10 (ref), l_Image_0 (copy), v27 (copy), l_imageDimensions_0 (copy), v28 (ref)
        local l_Theme_0 = v29.Theme;
        local l_Settings_0 = v29.Settings;
        local l_Tokens_0 = v29.Tokens;
        if v12.useFoundationSkeleton then
            local v33 = v5(l_Tokens_0.Semantic.Radius, l_cornerRadius_0);
            return v6.createElement(l_Skeleton_0, {
                radius = v33, 
                AnchorPoint = l_AnchorPoint_0, 
                Position = l_Position_0, 
                Size = l_Size_0, 
                LayoutOrder = l_LayoutOrder_0
            });
        else
            local function v39(v34) --[[ Line: 119 ]]
                -- upvalues: l_Theme_0 (copy), v17 (ref), v11 (ref)
                local l_BackgroundOnHover_0 = l_Theme_0.BackgroundOnHover;
                local v36 = v17.lerpValue + v34;
                if v36 > 2.5 then
                    v36 = 0;
                end;
                v17.lerpValue = v36;
                if v17.frameRef.current then
                    local v37 = math.abs(v17.lerpValue - 1);
                    local v38 = v37 > 1 and 1 or if v37 < 0.5 then 4 * math.pow(v37, 3) else 1 - math.pow(-2 * v37 + 2, 3) / 2;
                    v17.frameRef.current.BackgroundColor3 = l_BackgroundOnHover_0.Color:Lerp(l_BackgroundOnHover_0.Color, v38);
                    v17.frameRef.current.BackgroundTransparency = v11(l_BackgroundOnHover_0.Transparency, l_BackgroundOnHover_0.Transparency - 0.1, v38);
                end;
            end;
            if l_Settings_0.ReducedMotion then
                return v6.createElement("Frame", {
                    AnchorPoint = l_AnchorPoint_0, 
                    LayoutOrder = l_LayoutOrder_0, 
                    BorderSizePixel = 0, 
                    Position = l_Position_0, 
                    Size = l_Size_0, 
                    [v6.Ref] = v17.frameRef
                }, {
                    UICorner = l_cornerRadius_0 ~= UDim.new(0, 0) and v6.createElement("UICorner", {
                        CornerRadius = l_cornerRadius_0
                    }) or nil, 
                    renderStepped = v6.createElement(l_EventConnection_0, {
                        callback = v39, 
                        event = l_RunService_0.renderStepped
                    })
                });
            else
                return v6.createElement(v10, {
                    anchorPoint = l_AnchorPoint_0, 
                    layoutOrder = l_LayoutOrder_0, 
                    backgroundColor3 = l_Theme_0.PlaceHolder.Color, 
                    backgroundTransparency = l_Theme_0.PlaceHolder.Transparency, 
                    cornerRadius = l_cornerRadius_0, 
                    image = l_Image_0, 
                    imageRectSize = v27, 
                    imageAnchorPoint = Vector2.new(0, 0.5), 
                    imageTransparency = 0, 
                    imageRectOffsetStart = Vector2.new(l_imageDimensions_0.X, l_imageDimensions_0.Y / 2), 
                    imageRectOffsetEnd = Vector2.new(-v27.X, l_imageDimensions_0.Y / 2), 
                    imageScrollCycleTime = v28, 
                    position = l_Position_0, 
                    size = l_Size_0
                });
            end;
        end;
    end);
end;
return v13;