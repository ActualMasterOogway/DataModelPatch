local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v3 = require(l_Parent_2.Cryo);
local v4 = require(l_Parent_2.React);
local v5 = require(l_Parent_2.ReactOtter);
local _ = require(l_Parent_0.Style.StyleTypes);
local v7 = require(l_Parent_1.Core.Style.useStyle);
local v8 = require(l_Parent_0.Navigation.Enum.NavigationBarAlignment);
local v9 = require(l_Parent_1.UIBloxConfig);
local v10 = {
    visible = true, 
    zIndex = 1, 
    animated = false, 
    maxWidth = 600, 
    animationConfig = {
        dampingRatio = 1, 
        frequency = 3
    }
};
return function(v11) --[[ Line: 68 ]] --[[ Name: NavigationBarV2 ]]
    -- upvalues: v3 (copy), v10 (copy), v7 (copy), v4 (copy), v8 (copy), v9 (copy), v5 (copy)
    assert(#v11.items > 0, "At least one item should be present!");
    local v12 = v3.Dictionary.join(v10, v11);
    local v13 = v7();
    local v14, v15 = v4.useState(if v12.size then v12.size.Y.Offset else 0);
    local v16, v17 = v4.useBinding(UDim2.new());
    local v18 = if v12.paddings and v12.paddings.Top then v12.paddings.Top else v13.Tokens.Global.Space_75;
    local v19 = if v12.paddings and v12.paddings.Bottom then v12.paddings.Bottom else v13.Tokens.Global.Space_75;
    local v20 = if v12.paddings and v12.paddings.Left then v12.paddings.Left else v13.Tokens.Global.Space_75;
    local v21 = if v12.paddings and v12.paddings.Right then v12.paddings.Right else v13.Tokens.Global.Space_75;
    local v22 = nil;
    local v23 = nil;
    if v12.alignment == v8.Left then
        v22 = Enum.HorizontalAlignment.Left;
    elseif v12.alignment == v8.EvenlyDistributed then
        if v9.enableAppNavFlexLayout then
            v23 = Enum.UIFlexAlignment.SpaceAround;
        end;
        v22 = Enum.HorizontalAlignment.Center;
    else
        error("NavigationBar Alignment type is incorrect!");
    end;
    local v27 = v4.useCallback(function(v24) --[[ Line: 99 ]]
        -- upvalues: v12 (copy), v15 (copy), v8 (ref), v9 (ref), v20 (copy), v21 (copy), v18 (copy), v19 (copy), v17 (copy)
        if v12.animated then
            v15(v24.AbsoluteSize.Y);
        end;
        if v12.alignment == v8.EvenlyDistributed and not v9.enableAppNavFlexLayout then
            local v25 = ((if v12.maxWidth ~= nil and v24.AbsoluteSize.X > v12.maxWidth then v12.maxWidth else v24.AbsoluteSize.X) - v20 - v21) / #v12.items;
            local v26 = v24.AbsoluteSize.Y - v18 - v19;
            v17(UDim2.new(0, v25, 0, v26));
        end;
    end, {
        v12.animated, 
        v12.alignment, 
        v12.maxWidth, 
        #v12.items
    });
    local v28, v29 = v5.useAnimatedBinding(0);
    v4.useEffect(function() --[[ Line: 114 ]]
        -- upvalues: v12 (copy), v29 (copy), v5 (ref), v14 (copy)
        if v12.animated then
            if v12.isVisible then
                v29(v5.spring(0, v12.animationConfig));
            else
                v29(v5.spring(v14, v12.animationConfig));
            end;
        end;
        return nil;
    end, {
        v12.animated, 
        v12.isVisible, 
        v14, 
        v12.animationConfig
    });
    local v30 = {
        Constraint = if v12.maxWidth ~= nil then v4.createElement("UISizeConstraint", {
            MaxSize = Vector2.new(v12.maxWidth, 1e999)
        }) else nil, 
        UIPadding = v4.createElement("UIPadding", {
            PaddingTop = UDim.new(0, v18), 
            PaddingBottom = UDim.new(0, v19), 
            PaddingLeft = UDim.new(0, v20), 
            PaddingRight = UDim.new(0, v21)
        }), 
        Layout = v4.createElement("UIListLayout", {
            Padding = v12.spacing, 
            SortOrder = Enum.SortOrder.Name, 
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalFlex = v23, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left
        })
    };
    for v31, v32 in ipairs(v12.items) do
        local v33 = v31 == v12.selection;
        if v12.alignment == v8.Left or v9.enableAppNavFlexLayout then
            v30[tostring(v31)] = v12.renderItem(v32, v33);
        else
            v30[tostring(v31)] = v4.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = v16
            }, {
                Item = v12.renderItem(v32, v33)
            });
        end;
    end;
    return v4.createElement("Frame", {
        BackgroundTransparency = 1, 
        ClipsDescendants = v12.clipsDescendants, 
        Size = v12.size, 
        AutomaticSize = v12.automaticSize, 
        Position = v12.position, 
        Visible = v12.visible, 
        [v4.Change.AbsoluteSize] = v27
    }, {
        AnimatedFrame = v4.createElement("Frame", {
            Position = v28:map(function(v34) --[[ Line: 170 ]]
                -- upvalues: v9 (ref)
                if v9.enableAppNavAnimationFix then
                    return UDim2.new(0, 0, 0, (math.floor(v34 + 0.5)));
                else
                    return UDim2.new(0, 0, 0, v34);
                end;
            end), 
            BorderSizePixel = 0, 
            Size = UDim2.fromScale(1, 1), 
            AutomaticSize = v12.automaticSize, 
            BackgroundColor3 = if v12.backgroundColor then v12.backgroundColor.Color else v13.Theme.NavigationBar.Color, 
            BackgroundTransparency = if v12.backgroundColor then v12.backgroundColor.Transparency else v13.Theme.NavigationBar.Transparency, 
            Selectable = false, 
            Visible = v12.visible, 
            ZIndex = v12.zIndex
        }, {
            Layout = v4.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                VerticalAlignment = Enum.VerticalAlignment.Top, 
                HorizontalAlignment = v22
            }), 
            InnerFrame = v4.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.fromScale(1, 1), 
                AutomaticSize = v12.automaticSize
            }, v30)
        })
    });
end;