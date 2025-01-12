local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local l_Parent_0 = script:FindFirstAncestor("CollectionViews").Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local l_Images_0 = v3.App.ImageSet.Images;
local l_ImageSetLabel_0 = v3.Core.ImageSet.ImageSetLabel;
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local v7 = require(l_Parent_0.ReactOtter);
local v8 = l_Images_0["icons/actions/cycleLeft"];
local v9 = l_Images_0["icons/actions/cycleRight"];
local v10 = l_Images_0["component_assets/dropshadow_56_8"];
local v11 = {
    duration = 0.2, 
    easingStyle = Enum.EasingStyle.Cubic
};
local v12 = {
    duration = 0.1, 
    easingStyle = Enum.EasingStyle.Cubic
};
local function _(v13, v14, v15) --[[ Line: 30 ]] --[[ Name: interpolateValue ]]
    return v13 + (v14 - v13) * v15;
end;
local function v26(v17) --[[ Line: 34 ]] --[[ Name: CarouselScrollButton ]]
    -- upvalues: l_useDesignTokens_0 (copy), v7 (copy), v2 (copy), l_UserGameSettings_0 (copy), v11 (copy), v12 (copy), l_ImageSetLabel_0 (copy), v10 (copy)
    local v18 = l_useDesignTokens_0();
    local l_Size_75_0 = v18.Global.Size_75;
    local l_Size_450_0 = v18.Global.Size_450;
    local v21, v22 = v7.useAnimatedBinding(0);
    local v23 = v2.useCallback(function() --[[ Line: 47 ]]
        -- upvalues: v22 (copy), l_UserGameSettings_0 (ref), v7 (ref), v11 (ref), v17 (copy)
        v22(if l_UserGameSettings_0.ReducedMotion then v7.instant(1) else v7.ease(1, v11));
        if v17.onScrollButtonEnter then
            v17.onScrollButtonEnter();
        end;
    end, {
        v17.onScrollButtonEnter
    });
    local v24 = v2.useCallback(function() --[[ Line: 56 ]]
        -- upvalues: v22 (copy), l_UserGameSettings_0 (ref), v7 (ref), v12 (ref), v17 (copy)
        v22(if l_UserGameSettings_0.ReducedMotion then v7.instant(0) else v7.ease(0, v12));
        if v17.onScrollButtonLeave then
            v17.onScrollButtonLeave();
        end;
    end, {
        v17.onScrollButtonLeave
    });
    return v2.createElement("TextButton", {
        Active = true, 
        AnchorPoint = v17.AnchorPoint, 
        AutoButtonColor = false, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        Position = v17.Position, 
        [v2.Event.Activated] = v17.onActivate, 
        [v2.Event.MouseEnter] = v23, 
        [v2.Event.MouseLeave] = v24, 
        Size = UDim2.fromOffset(l_Size_450_0, l_Size_450_0), 
        Text = ""
    }, {
        IconFrame = v2.createElement("Frame", {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundTransparency = 1, 
            Position = UDim2.fromScale(0.5, 0.5), 
            Size = UDim2.fromScale(1, 1)
        }, {
            Shadow = v2.createElement(l_ImageSetLabel_0, {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Image = v10, 
                ImageColor3 = v18.Semantic.Color.Common.DropShadow.Color3, 
                ImageTransparency = v18.Semantic.Color.Common.DropShadow.Transparency, 
                Position = UDim2.fromScale(0.5, 0.5), 
                Size = UDim2.new(1, 4, 1, 4), 
                ZIndex = 1
            }), 
            Circle = v2.createElement("Frame", {
                BackgroundColor3 = v18.Semantic.Color.BackgroundUi.Default.Color3, 
                BackgroundTransparency = v21:map(function(v25) --[[ Line: 97 ]]
                    return 0.1 + -0.1 * v25;
                end), 
                BorderSizePixel = 0, 
                Size = UDim2.new(1, 0, 1, 0), 
                ZIndex = 3
            }, {
                UICorner = v2.createElement("UICorner", {
                    CornerRadius = UDim.new(0.5, 0)
                })
            }), 
            Icon = v2.createElement(l_ImageSetLabel_0, {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                BackgroundTransparency = 1, 
                ImageColor3 = v18.Semantic.Color.Text.Emphasis.Color3, 
                Image = v17.image, 
                Position = UDim2.fromScale(0.5, 0.5), 
                Size = UDim2.new(1, -l_Size_75_0, 1, -l_Size_75_0), 
                ZIndex = 4
            })
        })
    });
end;
return function(v27) --[[ Line: 126 ]] --[[ Name: CarouselScrollButtons ]]
    -- upvalues: l_useDesignTokens_0 (copy), v2 (copy), v26 (copy), v8 (copy), v9 (copy)
    local l_Size_100_0 = l_useDesignTokens_0().Global.Size_100;
    local v29, v30 = v2.useState(false);
    local v31 = v2.useCallback(function() --[[ Line: 148 ]]
        -- upvalues: v30 (copy)
        v30(true);
    end);
    local v32 = v2.useCallback(function() --[[ Line: 151 ]]
        -- upvalues: v30 (copy)
        v30(false);
    end);
    return v2.createElement("Frame", {
        [v2.Event.MouseEnter] = v31, 
        [v2.Event.MouseLeave] = v32, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        Position = v27.Position, 
        Size = v27.Size, 
        ZIndex = v27.ZIndex or 10, 
        AnchorPoint = v27.AnchorPoint
    }, {
        LeftButtonFrame = v29 and v27.leftScrollingEnabled and v2.createElement(v26, {
            AnchorPoint = Vector2.new(0, 0.5), 
            Position = UDim2.new(0, l_Size_100_0, 0.5, 0), 
            onActivate = v27.handleScrollLeft, 
            image = v8, 
            onScrollButtonEnter = v27.onScrollButtonEnter, 
            onScrollButtonLeave = v27.onScrollButtonLeave
        }) or nil, 
        RightButtonFrame = v29 and v27.rightScrollingEnabled and v2.createElement(v26, {
            AnchorPoint = Vector2.new(1, 0.5), 
            Position = UDim2.new(1, -l_Size_100_0, 0.5, 0), 
            onActivate = v27.handleScrollRight, 
            image = v9, 
            onScrollButtonEnter = v27.onScrollButtonEnter, 
            onScrollButtonLeave = v27.onScrollButtonLeave
        }) or nil
    });
end;