local l_script_FirstAncestor_0 = script:FindFirstAncestor("UIBlox");
local v1 = require(l_script_FirstAncestor_0.Core.ImageSet.ImageSetComponent);
local v2 = require(l_script_FirstAncestor_0.App.ImageSet.Images);
local v3 = require(l_script_FirstAncestor_0.App.Button.Button);
local v4 = require(l_script_FirstAncestor_0.App.Button.Enum.ButtonType);
local v5 = require(l_script_FirstAncestor_0.Parent.Cryo);
local v6 = require(l_script_FirstAncestor_0.Parent.React);
local v7 = UDim2.fromScale(0.4, 0.512);
local v8 = UDim2.fromScale(0.25, 0.33);
local v9 = {
    numItemsShown = 3.5, 
    itemAspectRatio = 1.7777777777777777, 
    itemPadding = 16, 
    borderRadius = UDim.new(0, 8)
};
return function(v10) --[[ Line: 38 ]] --[[ Name: MediaGalleryCarousel ]]
    -- upvalues: v5 (copy), v9 (copy), v6 (copy), v3 (copy), v4 (copy), v7 (copy), v1 (copy), v8 (copy), v2 (copy)
    local v11 = v5.Dictionary.join(v9, v10);
    local v12, v13 = v6.useState(Vector2.zero);
    local v17 = v6.useCallback(function(v14) --[[ Line: 42 ]]
        -- upvalues: v11 (copy), v13 (copy)
        local v15 = v11.itemPadding * (v11.numItemsShown - 1);
        local v16 = (v14.AbsoluteSize.X - v15) / v11.numItemsShown;
        v13(Vector2.new(v16, v16 / v11.itemAspectRatio));
    end, {
        v11.itemAspectRatio, 
        v11.numItemsShown
    });
    local v19 = v6.useCallback(function(v18) --[[ Line: 52 ]]
        -- upvalues: v11 (copy)
        if v11.onVideoPlayActivated and v11.items[v18].isVideo then
            return v11.onVideoPlayActivated(v18);
        elseif v11.onPreviewActivated then
            return v11.onPreviewActivated(v18);
        else
            return;
        end;
    end, {
        v11.items, 
        v11.onVideoPlayActivated, 
        v11.onPreviewActivated
    });
    local v20 = {};
    for v21, v22 in v11.items do
        local l_isVideo_0 = v22.isVideo;
        v20["Item" .. v21] = v6.createElement("ImageButton", {
            LayoutOrder = v21, 
            Size = UDim2.fromOffset(v12.X, v12.Y), 
            Image = v22.imageId, 
            ScaleType = Enum.ScaleType.Crop, 
            BackgroundTransparency = 1, 
            AutoButtonColor = false, 
            [v6.Event.Activated] = function() --[[ Line: 78 ]]
                -- upvalues: v19 (copy), v21 (copy)
                v19(v21);
            end
        }, {
            Corner = v6.createElement("UICorner", {
                CornerRadius = v11.borderRadius
            }), 
            PlayButton = if l_isVideo_0 then v6.createElement(v3, {
                buttonType = v4.PrimaryContextual, 
                size = v7, 
                anchorPoint = Vector2.new(0.5, 0.5), 
                position = UDim2.fromScale(0.5, 0.5), 
                onActivated = function() --[[ Line: 91 ]] --[[ Name: onActivated ]]
                    -- upvalues: v19 (copy), v21 (copy)
                    v19(v21);
                end
            }) else nil, 
            PlayIcon = if l_isVideo_0 then v6.createElement(v1.Label, {
                Size = v8, 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.fromScale(0.5, 0.5), 
                Image = v2["icons/common/play"], 
                BackgroundTransparency = 1, 
                ZIndex = 2
            }) else nil
        });
    end;
    return v6.createElement("ScrollingFrame", {
        BackgroundTransparency = 1, 
        Size = UDim2.fromScale(1, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        AutomaticCanvasSize = Enum.AutomaticSize.XY, 
        ScrollBarImageTransparency = 1, 
        ScrollingDirection = Enum.ScrollingDirection.X, 
        ClipsDescendants = false, 
        [v6.Change.AbsoluteSize] = v17
    }, {
        Layout = v6.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Horizontal, 
            Padding = UDim.new(0, v11.itemPadding)
        }), 
        Items = v6.createElement(v6.Fragment, {}, v20)
    });
end;