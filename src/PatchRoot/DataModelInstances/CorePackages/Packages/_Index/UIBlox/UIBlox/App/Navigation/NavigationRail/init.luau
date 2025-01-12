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
local v10 = require(l_Parent_0.Navigation.Enum.NavigationRailAlignment);
local v11 = require(l_Parent_1.UIBloxConfig);
local v12 = {
    visible = true, 
    isVisible = true, 
    zIndex = 1, 
    position = UDim2.new(0, 0, 0, 0), 
    animationConfig = {
        dampingRatio = 1, 
        frequency = 3
    }
};
return function(v13) --[[ Line: 66 ]] --[[ Name: NavigationRail ]]
    -- upvalues: v3 (copy), v12 (copy), v7 (copy), v5 (copy), v4 (copy), v10 (copy), v11 (copy), v8 (copy)
    local v14 = v3.Dictionary.join(v12, v13);
    local v15 = v7();
    local l_Offset_0 = v14.size.X.Offset;
    local v17, v18 = v5.useAnimatedBinding(0);
    v4.useEffect(function() --[[ Line: 72 ]]
        -- upvalues: v14 (copy), v18 (copy), v5 (ref), l_Offset_0 (copy)
        if v14.isVisible then
            v18(v5.spring(0, v14.animationConfig));
        else
            v18(v5.spring(-l_Offset_0, v14.animationConfig));
        end;
        return nil;
    end, {
        l_Offset_0, 
        v14.isVisible, 
        v14.animationConfig
    });
    local v19 = if v14.alignment == v10.Centered then Enum.VerticalAlignment.Center else Enum.VerticalAlignment.Top;
    local v32 = v4.useCallback(function(v20, v21) --[[ Line: 85 ]]
        -- upvalues: v11 (ref), v4 (ref), v14 (copy), v15 (copy), v17 (copy), v19 (copy), v3 (ref), v10 (ref)
        local v22 = {};
        local v23 = {};
        local v24 = false;
        if v11.fixAppNavTestIssues then
            for v25, v26 in ipairs(v20) do
                local v27 = v21(v25);
                v27.key = nil;
                if v26.isSecondary then
                    v23[tostring(v25)] = v27;
                    v24 = true;
                else
                    v22[tostring(v25)] = v27;
                end;
            end;
        else
            for v28, v29 in ipairs(v20) do
                if v29.isSecondary then
                    table.insert(v23, v21(v28));
                else
                    table.insert(v22, v21(v28));
                end;
            end;
            v24 = #v23 > 0;
        end;
        local v30 = v4.createElement("UIPadding", {
            PaddingTop = if v14.paddings and v14.paddings.Top then UDim.new(0, v14.paddings.Top) else UDim.new(0, v15.Tokens.Global.Space_75), 
            PaddingBottom = if v14.paddings and v14.paddings.Bottom then UDim.new(0, v14.paddings.Bottom) else UDim.new(0, v15.Tokens.Global.Space_75), 
            PaddingLeft = if v14.paddings and v14.paddings.Left then UDim.new(0, v14.paddings.Left) else UDim.new(0, v15.Tokens.Global.Space_75), 
            PaddingRight = if v14.paddings and v14.paddings.Right then UDim.new(0, v14.paddings.Right) else UDim.new(0, v15.Tokens.Global.Space_75)
        });
        return v4.createElement("Frame", {
            BackgroundColor3 = if v11.enableAppNavTransparentBackground then nil else if v14.rootBackgroundColor then v14.rootBackgroundColor.Color else v15.Theme.BackgroundDefault.Color, 
            BackgroundTransparency = v11.enableAppNavTransparentBackground and 1 or if v14.rootBackgroundColor then v14.rootBackgroundColor.Transparency else v15.Theme.BackgroundDefault.Transparency, 
            BorderSizePixel = if v11.enableAppNavTransparentBackground then nil else 0, 
            ClipsDescendants = v14.clipsDescendants, 
            Size = v14.size, 
            Position = v14.position, 
            Visible = v14.visible
        }, {
            AnimatedNavigationRail = v4.createElement("Frame", {
                Position = v17:map(function(v31) --[[ Line: 144 ]]
                    -- upvalues: v11 (ref)
                    if v11.enableAppNavAnimationFix then
                        return UDim2.new(0, math.floor(v31 + 0.5), 0, 0);
                    else
                        return UDim2.new(0, v31, 0, 0);
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
                MainFrame = v4.createElement("Frame", {
                    Position = UDim2.new(0, 0, 0, 0), 
                    Size = UDim2.new(1, 0, 1, 0), 
                    BackgroundTransparency = 1
                }, {
                    UIListLayout = v4.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Vertical, 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        VerticalAlignment = v19, 
                        Padding = UDim.new(0, v15.Tokens.Global.Space_200)
                    }), 
                    UIPadding = v30, 
                    PrimaryItems = v4.createElement("Frame", {
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(1, 0, 0, 0), 
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        LayoutOrder = 1
                    }, if v11.fixAppNavTestIssues then v3.Dictionary.join({
                        Layout = v4.createElement("UIListLayout", {
                            FillDirection = Enum.FillDirection.Vertical, 
                            HorizontalAlignment = Enum.HorizontalAlignment.Center
                        })
                    }, v22) else {
                        v3.Dictionary.join({
                            Layout = v4.createElement("UIListLayout", {
                                FillDirection = Enum.FillDirection.Vertical, 
                                HorizontalAlignment = Enum.HorizontalAlignment.Center
                            })
                        }, v22)
                    }), 
                    CenteredSeondaryItems = if v24 and v14.alignment == v10.Centered then v4.createElement("Frame", {
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(1, 0, 0, 0), 
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        LayoutOrder = 2
                    }, if v11.fixAppNavTestIssues then v3.Dictionary.join({
                        Layout = v4.createElement("UIListLayout", {
                            FillDirection = Enum.FillDirection.Vertical, 
                            HorizontalAlignment = Enum.HorizontalAlignment.Center
                        })
                    }, v23) else {
                        v3.Dictionary.join({
                            Layout = v4.createElement("UIListLayout", {
                                FillDirection = Enum.FillDirection.Vertical, 
                                HorizontalAlignment = Enum.HorizontalAlignment.Center
                            })
                        }, v23)
                    }) else nil
                }), 
                BottomAlignedSecondaryItems = if v24 and v14.alignment == v10.Justified then v4.createElement("Frame", {
                    Position = UDim2.new(0, 0, 0, 0), 
                    Size = UDim2.new(1, 0, 1, 0), 
                    BackgroundTransparency = 1
                }, if v11.fixAppNavTestIssues then v3.Dictionary.join({
                    Layout = v4.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Vertical, 
                        VerticalAlignment = Enum.VerticalAlignment.Bottom, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center
                    }), 
                    UIPadding = v30
                }, v23) else {
                    v3.Dictionary.join({
                        Layout = v4.createElement("UIListLayout", {
                            FillDirection = Enum.FillDirection.Vertical, 
                            VerticalAlignment = Enum.VerticalAlignment.Bottom, 
                            HorizontalAlignment = Enum.HorizontalAlignment.Center
                        }), 
                        UIPadding = v30
                    }, v23)
                }) else nil
            })
        });
    end, {
        v15, 
        v19, 
        v14.size, 
        v14.clipsDescendants, 
        v14.alignment, 
        v14.visible, 
        v14.zIndex, 
        v14.paddings, 
        if v11.enableAppNavTransparentBackground then nil else v14.rootBackgroundColor, 
        v14.backgroundColor
    });
    local l_selection_0 = v14.selection;
    if l_selection_0 then
        l_selection_0 = if v14.items[l_selection_0] == nil then nil else {
            l_selection_0
        };
    end;
    local v36 = v4.useCallback(function(v34) --[[ Line: 282 ]]
        -- upvalues: v14 (copy)
        local v35 = v14.items[v34[1]];
        if v35 ~= nil and v35.onActivated ~= nil then
            v35.onActivated();
        end;
    end, {
        v14.items
    });
    return v4.createElement(v8, {
        fillDirection = Enum.FillDirection.Horizontal, 
        horizontalAlignment = Enum.HorizontalAlignment.Left, 
        sortOrder = Enum.SortOrder.LayoutOrder, 
        size = v14.size, 
        position = v14.position, 
        itemList = v14.items, 
        selection = l_selection_0, 
        itemSize = v14.itemSize, 
        renderItem = v14.renderItem, 
        renderList = v32, 
        onSelectionChanged = v36
    });
end;