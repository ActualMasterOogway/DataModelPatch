local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v3 = require(l_Parent_2.Cryo);
local v4 = require(l_Parent_2.React);
local v5 = require(l_Parent_2.ReactOtter);
local _ = require(l_Parent_0.Style.StyleTypes);
local v7 = require(l_Parent_1.Core.Style.useStyle);
local v8 = require(l_Parent_1.Core.Control.InteractableList);
local _ = require(l_Parent_1.Core.Control.Enum.ControlState);
local v10 = require(l_Parent_0.Navigation.Enum.NavigationBarAlignment);
local v11 = require(l_Parent_1.UIBloxConfig);
local v12 = {
    visible = true, 
    zIndex = 1, 
    position = UDim2.new(0, 0, 0, 0), 
    size = UDim2.new(1, 0, 1, 0), 
    maxWidth = 600, 
    animationConfig = {
        dampingRatio = 1, 
        frequency = 3
    }, 
    showAnimation = false
};
return function(v13) --[[ Line: 70 ]] --[[ Name: NavigationBar ]]
    -- upvalues: v3 (copy), v12 (copy), v7 (copy), v4 (copy), v10 (copy), v5 (copy), v11 (copy), v8 (copy)
    assert(#v13.items > 0, "At least one item should be present!");
    local v14 = v3.Dictionary.join(v12, v13);
    local v15 = v7();
    local v16, v17 = v4.useBinding(UDim2.new());
    local l_Offset_0 = v14.size.Y.Offset;
    local v19 = if v14.paddings and v14.paddings.Top then v14.paddings.Top else v15.Tokens.Global.Space_75;
    local v20 = if v14.paddings and v14.paddings.Bottom then v14.paddings.Bottom else v15.Tokens.Global.Space_75;
    local v21 = if v14.paddings and v14.paddings.Left then v14.paddings.Left else v15.Tokens.Global.Space_75;
    local v22 = if v14.paddings and v14.paddings.Right then v14.paddings.Right else v15.Tokens.Global.Space_75;
    local v26 = v4.useCallback(function(v23) --[[ Line: 89 ]]
        -- upvalues: v14 (copy), v10 (ref), v21 (copy), v22 (copy), l_Offset_0 (copy), v19 (copy), v20 (copy), v17 (copy)
        if v14.alignment == v10.EvenlyDistributed then
            local v24 = ((if v23.AbsoluteSize.X > v14.maxWidth then v14.maxWidth else v23.AbsoluteSize.X) - v21 - v22) / #v14.items;
            local v25 = l_Offset_0 - v19 - v20;
            v17(UDim2.new(0, v24, 0, v25));
        end;
    end, {
        l_Offset_0, 
        v19, 
        v20, 
        v21, 
        v22, 
        v14.maxWidth, 
        v14.alignment, 
        v14.items
    });
    local v27, v28 = v5.useAnimatedBinding(0);
    v4.useEffect(function() --[[ Line: 109 ]]
        -- upvalues: v14 (copy), v28 (copy), v5 (ref), l_Offset_0 (copy)
        if v14.isVisible then
            v28(v5.spring(0, v14.animationConfig));
        else
            v28(v5.spring(l_Offset_0, v14.animationConfig));
        end;
        return nil;
    end, {
        l_Offset_0, 
        v14.isVisible, 
        v14.animationConfig
    });
    local v36 = v4.useCallback(function(v29, v30) --[[ Line: 118 ]]
        -- upvalues: v3 (ref), v11 (ref), v4 (ref), v14 (copy), v15 (copy), v26 (copy), v27 (copy), l_Offset_0 (copy), v19 (copy), v20 (copy), v21 (copy), v22 (copy)
        local v34 = v3.List.map(v29, function(_, v32) --[[ Line: 119 ]]
            -- upvalues: v11 (ref), v30 (copy)
            if v11.fixAppNavTestIssues then
                local v33 = v30(v32);
                v33.key = nil;
                return v33;
            else
                return v30(v32);
            end;
        end);
        return v4.createElement("Frame", {
            BackgroundColor3 = if v11.enableAppNavTransparentBackground then nil else if v14.rootBackgroundColor then v14.rootBackgroundColor.Color else v15.Theme.BackgroundDefault.Color, 
            BackgroundTransparency = v11.enableAppNavTransparentBackground and 1 or if v14.rootBackgroundColor then v14.rootBackgroundColor.Transparency else v15.Theme.BackgroundDefault.Transparency, 
            BorderSizePixel = if v11.enableAppNavTransparentBackground then nil else 0, 
            ClipsDescendants = v14.clipsDescendants, 
            Size = v14.size, 
            Position = v14.position, 
            Visible = v14.visible, 
            [v4.Change.AbsoluteSize] = v26
        }, {
            AnimatedNavigationBar = v4.createElement("Frame", {
                Position = v27:map(function(v35) --[[ Line: 148 ]]
                    -- upvalues: v11 (ref)
                    if v11.enableAppNavAnimationFix then
                        return UDim2.new(0, 0, 0, (math.floor(v35 + 0.5)));
                    else
                        return UDim2.new(0, 0, 0, v35);
                    end;
                end), 
                BorderSizePixel = 0, 
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundColor3 = if v14.backgroundColor then v14.backgroundColor.Color else v15.Theme.NavigationBar.Color, 
                BackgroundTransparency = if v14.backgroundColor then v14.backgroundColor.Transparency else v15.Theme.NavigationBar.Transparency, 
                Selectable = false, 
                Visible = v14.visible, 
                ZIndex = v14.zIndex
            }, {
                Layout = v4.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal, 
                    VerticalAlignment = Enum.VerticalAlignment.Top, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center
                }), 
                InnerFrame = v4.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 1, 0)
                }, v3.Dictionary.join({
                    Constraint = v4.createElement("UISizeConstraint", {
                        MaxSize = Vector2.new(v14.maxWidth, l_Offset_0)
                    }), 
                    UIPadding = v4.createElement("UIPadding", {
                        PaddingTop = UDim.new(0, v19), 
                        PaddingBottom = UDim.new(0, v20), 
                        PaddingLeft = UDim.new(0, v21), 
                        PaddingRight = UDim.new(0, v22)
                    }), 
                    Layout = v4.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Horizontal, 
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center
                    })
                }, v34))
            })
        });
    end, {
        v15, 
        l_Offset_0, 
        v19, 
        v20, 
        v21, 
        v22, 
        v14.maxWidth, 
        v14.visible, 
        v14.zIndex, 
        v14.size, 
        v14.clipsDescendants, 
        if v11.enableAppNavTransparentBackground then nil else v14.rootBackgroundColor, 
        v14.backgroundColor
    });
    local v37 = {};
    if v14.alignment == v10.Left then
        v37 = {
            itemSize = UDim2.fromScale(0, 0), 
            automaticSize = Enum.AutomaticSize.X, 
            padding = v14.spacing
        };
    elseif v14.alignment == v10.EvenlyDistributed then
        v37 = {
            itemSize = v16
        };
    else
        error("NavigationBar Alignment type is incorrect!");
    end;
    local l_selection_0 = v14.selection;
    if l_selection_0 then
        l_selection_0 = if v14.items[l_selection_0] == nil then if v11.enableNavigationBarSelectionChangeFix then {
            nil
        } else nil else {
            l_selection_0
        };
    elseif v11.enableNavigationBarSelectionChangeFix then
        l_selection_0 = {
            nil
        };
    end;
    local v41 = v4.useCallback(function(v39) --[[ Line: 245 ]]
        -- upvalues: v14 (copy)
        local v40 = v14.items[v39[1]];
        if v40 ~= nil and v40.onActivated ~= nil then
            v40.onActivated();
        end;
    end, {
        v14.items
    });
    return v4.createElement(v8, v3.Dictionary.join({
        fillDirection = Enum.FillDirection.Horizontal, 
        horizontalAlignment = Enum.HorizontalAlignment.Left, 
        verticalAlignment = Enum.VerticalAlignment.Center, 
        sortOrder = Enum.SortOrder.LayoutOrder, 
        size = v14.size, 
        position = v14.position, 
        itemList = v14.items, 
        selection = l_selection_0, 
        renderItem = v14.renderItem, 
        onSelectionChanged = v41, 
        renderList = if v14.showAnimation then v36 else nil
    }, v37));
end;