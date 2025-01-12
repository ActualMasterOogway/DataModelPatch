local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_script_FirstAncestor_0.types);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.React);
local l_useStyle_0 = require(l_Parent_0.UIBlox).Core.Style.useStyle;
local v6 = {
    addTopPadding = false, 
    addBottomPadding = false, 
    backgroundTransparency = 0.4, 
    heightFactor = 1, 
    isIncoming = false, 
    showAvatarCircle = false, 
    widthPercentage = 0.5
};
return function(v7) --[[ Line: 38 ]] --[[ Name: PendingShimmerBubble ]]
    -- upvalues: v3 (copy), v6 (copy), l_useStyle_0 (copy), v4 (copy)
    local v8 = v3.Dictionary.join(v6, v7);
    local v9 = l_useStyle_0();
    local v10 = v8.style or v9;
    local l_Space_100_0 = v10.Tokens.Global.Space_100;
    local v12 = if v8.addBottomPadding then v10.Tokens.Global.Space_300 else v10.Tokens.Global.Space_50;
    local l_Size_450_0 = v10.Tokens.Global.Size_450;
    local l_Color_0 = v10.Theme.UIDefault.Color;
    return v4.createElement("Frame", {
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y
    }, {
        UIListLayout = v4.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = if v8.isIncoming then Enum.HorizontalAlignment.Left else Enum.HorizontalAlignment.Right, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Bottom, 
            Padding = UDim.new(0, v10.Tokens.Global.Space_50)
        }), 
        ContentPadding = v4.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, l_Space_100_0), 
            PaddingRight = UDim.new(0, l_Space_100_0), 
            PaddingBottom = UDim.new(0, v12), 
            PaddingTop = if v8.addTopPadding then UDim.new(0, v10.Tokens.Global.Space_300) else nil
        }), 
        IncomingFrame = if v8.isIncoming then v4.createElement("Frame", {
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Size = UDim2.new(0, l_Size_450_0, 0, l_Size_450_0), 
            LayoutOrder = 1
        }, {
            AvatarCircleShimmer = if v8.showAvatarCircle then v4.createElement("Frame", {
                BackgroundTransparency = v8.backgroundTransparency, 
                BackgroundColor3 = l_Color_0, 
                BorderSizePixel = 0, 
                Size = UDim2.new(1, 0, 1, 0), 
                LayoutOrder = 1
            }, {
                UICorner = v4.createElement("UICorner", {
                    CornerRadius = UDim.new(1, v10.Tokens.Semantic.Radius.Circle)
                })
            }) else nil
        }) else nil, 
        ShimmerBubble = v4.createElement("Frame", {
            BackgroundTransparency = v8.backgroundTransparency, 
            BackgroundColor3 = l_Color_0, 
            BorderSizePixel = 0, 
            Size = UDim2.new(v8.widthPercentage, 0, 0, v8.heightFactor * v10.Tokens.Global.Size_250 + v10.Tokens.Global.Size_200), 
            LayoutOrder = 2
        }, {
            UICorner = v4.createElement("UICorner", {
                CornerRadius = UDim.new(0, v10.Tokens.Semantic.Radius.Large)
            }), 
            UISizeConstraint = v4.createElement("UISizeConstraint", {
                MaxSize = Vector2.new(800 * v8.widthPercentage, 1000)
            })
        })
    });
end;