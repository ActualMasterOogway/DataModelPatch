local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Roact);
local v3 = require(l_Parent_1.t);
local v4 = require(l_Parent_1.Cryo);
local v5 = require(l_Parent_0.Core.Style.withStyle);
local v6 = require(l_Parent_0.Core.Control.Enum.ControlState);
local v7 = require(l_Parent_0.Core.ImageSet.ImageSetComponent);
local v8 = require(l_Parent_0.Core.ImageSet.Validator.validateImageSetData);
local v9 = require(l_Parent_0.App.Indicator.Badge);
local v10 = require(l_Parent_0.App.Indicator.Enum.BadgeStates);
local v11 = require(l_Parent_0.App.ImageSet.Enum.IconSize);
local v12 = require(l_Parent_0.App.ImageSet.getIconSize);
local v13 = require(l_Parent_0.Core.Control.InteractableList);
local v14 = require(l_Parent_0.Core.Animation.withAnimation);
local v15 = require(script.Parent.Enum.Placement);
local v16 = {
    frequency = 3
};
local v17 = v12(v11.Medium);
local v18 = v17 + 8;
local v19 = (v18 - v17) / 2;
local v20 = (v18 - v17) / 2;
local v21 = v19 + 4;
local v22 = v20 - 4;
local v23 = 12 + (64 - v18) / 2;
local v24 = 4 + (64 - v18);
local v25 = v2.PureComponent:extend("SystemBar");
v25.validateProps = v3.strictInterface({
    itemList = v3.array(v3.strictInterface({
        iconOn = v3.optional(v8), 
        iconOff = v3.optional(v8), 
        iconImageComponent = v3.optional(v3.union(v3.table, v3.callback)), 
        iconComponent = v3.optional(v3.union(v3.table, v3.callback)), 
        onActivated = v3.callback, 
        badgeValue = v3.optional(v3.union(v3.integer, v3.string, v10.isEnumValue)), 
        itemSize = v3.optional(v3.UDim2), 
        bottomAligned = v3.optional(v3.boolean)
    })), 
    selection = v3.optional(v3.integer), 
    placement = v3.optional(v15.isEnumValue), 
    hidden = v3.optional(v3.boolean), 
    onSafeAreaChanged = v3.optional(v3.callback), 
    size = v3.optional(v3.UDim2), 
    position = v3.optional(v3.UDim2), 
    layoutOrder = v3.optional(v3.integer), 
    layoutPaddingOffset = v3.optional(v3.UDim), 
    firstItemPaddingOffset = v3.optional(v3.UDim), 
    lastItemPaddingOffset = v3.optional(v3.UDim), 
    [v2.Children] = v3.optional(v3.any), 
    roundCorners = v3.optional(v3.boolean), 
    buttonStroke = v3.optional(v3.boolean), 
    bgTransparency = v3.optional(v3.integer), 
    sortOrder = v3.optional(v3.enum(Enum.SortOrder)), 
    clipsDescendants = v3.optional(v3.boolean), 
    experimentalTabSizePortraitY = v3.optional(v3.number)
});
v25.defaultProps = {
    placement = v15.Auto, 
    layoutPaddingOffset = UDim.new(0, 0), 
    firstItemPaddingOffset = UDim.new(0, 0), 
    lastItemPaddingOffset = UDim.new(0, 0), 
    clipsDescendants = true, 
    experimentalTabSizePortraitY = 48
};
v25.isPortrait = function(v26) --[[ Line: 141 ]] --[[ Name: isPortrait ]]
    -- upvalues: v15 (copy)
    if v26.props.placement == v15.Left then
        return false;
    elseif v26.props.placement == v15.Bottom then
        return true;
    else
        return v26.state.portrait;
    end;
end;
v25.renderItem = function(v27, v28, v29, v30, v31) --[[ Line: 151 ]] --[[ Name: renderItem ]]
    -- upvalues: v6 (copy), v15 (copy), v2 (copy), v10 (copy), v3 (copy), v19 (copy), v20 (copy), v22 (copy), v21 (copy), v14 (copy), v5 (copy), v7 (copy), v17 (copy), v17 (copy), v9 (copy), v16 (copy)
    assert(v28.iconOn ~= nil and v28.iconOff ~= nil or v28.iconImageComponent ~= nil or v28.iconComponent ~= nil, "items must define either iconOn and iconOff or iconImageComponent or iconComponent");
    local v32 = v29 == v6.Pressed;
    local v33 = v32 or v29 == v6.Hover;
    if v28.iconComponent then
        local v34 = nil;
        v34 = if v27:isPortrait() then v15.Bottom else v15.Left;
        return v2.createElement(v28.iconComponent, {
            placement = v34, 
            hovered = v33, 
            selected = v30, 
            pressed = v32, 
            badgeValue = v28.badgeValue
        }), {
            LayoutOrder = v31
        };
    else
        local v35 = nil;
        v35 = if v28.badgeValue then v28.badgeValue == v10.isEmpty or v3.string(v28.badgeValue) and true or v28.badgeValue > 0 else false;
        local l_v19_0 = v19;
        local l_v20_0 = v20;
        if v33 then
            if v27:isPortrait() then
                l_v20_0 = v22;
            else
                l_v19_0 = v21;
            end;
        end;
        return v14({
            positionX = l_v19_0, 
            positionY = l_v20_0
        }, function(v38) --[[ Line: 204 ]]
            -- upvalues: v5 (ref), v2 (ref), v28 (copy), v7 (ref), v17 (ref), v17 (ref), v27 (copy), v30 (copy), v32 (copy), v35 (ref), v9 (ref), v10 (ref)
            return v5(function(v39) --[[ Line: 205 ]]
                -- upvalues: v2 (ref), v28 (ref), v7 (ref), v38 (copy), v17 (ref), v17 (ref), v27 (ref), v30 (ref), v32 (ref), v35 (ref), v9 (ref), v10 (ref)
                local l_Theme_0 = v39.Theme;
                return v2.createElement(v28.iconImageComponent or v7.Label, {
                    Position = UDim2.fromOffset(math.floor(v38.positionX + 0.5), (math.floor(v38.positionY + 0.5))), 
                    Size = UDim2.fromOffset(v17, v17), 
                    BackgroundTransparency = v27.props.buttonStroke and 0.99 or 1, 
                    Image = v30 and v28.iconOn or v28.iconOff, 
                    ImageColor3 = l_Theme_0.IconDefault.Color, 
                    ImageTransparency = v32 and 0.5 or 0
                }, {
                    Badge = v35 and v2.createElement(v9, {
                        position = if v28.badgeValue == v10.isEmpty then UDim2.fromOffset(22, 2) else UDim2.fromOffset(18, -2), 
                        value = v28.badgeValue
                    }) or nil, 
                    UICorner = v27.props.roundCorners and v2.createElement("UICorner", {
                        CornerRadius = UDim.new(0.15, 0)
                    }) or nil, 
                    UIStroke = v27.props.buttonStroke and v2.createElement("UIStroke", {
                        Color = Color3.new(0.4, 0.4, 0.4), 
                        Transparency = 0, 
                        Thickness = 1
                    }) or nil
                });
            end);
        end, v16), {
            LayoutOrder = v31
        };
    end;
end;
v25.renderPortrait = function(v41, v42, v43) --[[ Line: 238 ]] --[[ Name: renderPortrait ]]
    -- upvalues: v14 (copy), v2 (copy), v4 (copy), v18 (copy), v16 (copy)
    return v14({
        offset = v41.props.hidden and 0 or -v41.props.experimentalTabSizePortraitY
    }, function(v44) --[[ Line: 241 ]]
        -- upvalues: v2 (ref), v4 (ref), v42 (copy), v41 (copy), v18 (ref), v43 (copy)
        return v2.createElement("Frame", v4.Dictionary.join(v42, {
            Position = UDim2.new(0, 0, 1, (math.floor(v44.offset + 0.5))), 
            Size = UDim2.new(1, 0, 0, v41.props.experimentalTabSizePortraitY), 
            ZIndex = 99
        }), {
            Layout = v2.createElement("UIListLayout", {
                HorizontalAlignment = Enum.HorizontalAlignment.Center
            }), 
            InnerFrame = v2.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1
            }, v4.Dictionary.join({
                Constraint = v2.createElement("UISizeConstraint", {
                    MaxSize = Vector2.new(600, v41.props.experimentalTabSizePortraitY)
                }), 
                Layout = v2.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    Padding = v41.props.layoutPaddingOffset + UDim.new(1 / #v41.props.itemList, -v18), 
                    SortOrder = v41.props.sortOrder
                }, {})
            }, v43))
        });
    end, v16);
end;
v25.renderLandscape = function(v45, v46, v47, v48) --[[ Line: 277 ]] --[[ Name: renderLandscape ]]
    -- upvalues: v14 (copy), v2 (copy), v4 (copy), v23 (copy), v24 (copy), v16 (copy)
    return v14({
        offset = v45.props.hidden and -64 or 0
    }, function(v49) --[[ Line: 280 ]]
        -- upvalues: v2 (ref), v4 (ref), v46 (copy), v48 (copy), v45 (copy), v23 (ref), v24 (ref), v47 (copy)
        return v2.createElement("Frame", v4.Dictionary.join(v46, {
            Position = UDim2.new(0, math.floor(v49.offset + 0.5), 0, 0), 
            Size = UDim2.new(0, 64, 1, 0), 
            ZIndex = 99, 
            BackgroundTransparency = v48 and 1 or nil
        }), v4.Dictionary.join({
            Padding = v2.createElement("UIPadding", {
                PaddingTop = if not v48 then v45.props.firstItemPaddingOffset + UDim.new(0, v23) else nil, 
                PaddingBottom = if v48 then v45.props.lastItemPaddingOffset + UDim.new(0, v24) else nil
            }), 
            Layout = v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = if v48 then Enum.VerticalAlignment.Bottom else nil, 
                Padding = v45.props.layoutPaddingOffset + UDim.new(0, v24), 
                SortOrder = v45.props.sortOrder
            })
        }, v47));
    end, v16);
end;
v25.renderBackground = function(v50, v51, v52) --[[ Line: 310 ]] --[[ Name: renderBackground ]]
    -- upvalues: v4 (copy), v2 (copy)
    if v50:isPortrait() then
        return v50:renderPortrait(v51, v52);
    else
        local v55 = v4.List.filter(v52, function(_, v54) --[[ Line: 314 ]]
            -- upvalues: v50 (copy)
            return not v50.props.itemList[v54].bottomAligned;
        end);
        local v58 = v4.List.filter(v52, function(_, v57) --[[ Line: 317 ]]
            -- upvalues: v50 (copy)
            return v50.props.itemList[v57].bottomAligned;
        end);
        local v59 = v50:renderLandscape(v51, v55);
        if #v58 > 0 then
            v59 = v2.createFragment({
                NavBar = v59, 
                BottomAlignedNavBar = v50:renderLandscape(v51, v58, true)
            });
        end;
        return v59;
    end;
end;
v25.renderSafeArea = function(v60) --[[ Line: 331 ]] --[[ Name: renderSafeArea ]]
    -- upvalues: v2 (copy)
    local v61 = nil;
    local v62 = nil;
    if v60.props.hidden then
        v61 = UDim2.new(0, 0, 0, 0);
        v62 = UDim2.new(1, 0, 1, 0);
    elseif v60:isPortrait() then
        v61 = UDim2.new(0, 0, 0, 0);
        v62 = UDim2.new(1, 0, 1, -v60.props.experimentalTabSizePortraitY);
    else
        v61 = UDim2.new(0, 64, 0, 0);
        v62 = UDim2.new(1, -64, 1, 0);
    end;
    return v2.createElement("Frame", {
        Position = v61, 
        Size = v62, 
        BackgroundTransparency = 1, 
        [v2.Change.AbsoluteSize] = v60.onSafeAreaEvent, 
        [v2.Change.AbsolutePosition] = v60.onSafeAreaEvent
    }, v60.props[v2.Children]);
end;
v25.renderList = function(v63, v64, v65) --[[ Line: 352 ]] --[[ Name: renderList ]]
    -- upvalues: v5 (copy), v4 (copy), v2 (copy)
    return v5(function(v66) --[[ Line: 353 ]]
        -- upvalues: v4 (ref), v64 (copy), v65 (copy), v2 (ref), v63 (copy)
        local l_Theme_1 = v66.Theme;
        local v70 = v4.List.map(v64, function(_, v69) --[[ Line: 355 ]]
            -- upvalues: v65 (ref)
            return v65(v69);
        end);
        return v2.createElement("Frame", {
            Position = v63.props.position or UDim2.new(0, 0, 0, 0), 
            Size = v63.props.size or UDim2.new(1, 0, 1, 0), 
            BackgroundColor3 = Color3.new(0, 0, 0), 
            ClipsDescendants = v63.props.clipsDescendants, 
            LayoutOrder = v63.props.layoutOrder, 
            BackgroundTransparency = v63.props.bgTransparency or 1, 
            [v2.Change.AbsoluteSize] = function(v71) --[[ Line: 365 ]]
                -- upvalues: v63 (ref)
                if v63.state.portrait and v71.AbsoluteSize.X > v71.AbsoluteSize.Y then
                    v63:setState({
                        portrait = false
                    });
                    return;
                else
                    if not v63.state.portrait and v71.AbsoluteSize.X < v71.AbsoluteSize.Y then
                        v63:setState({
                            portrait = true
                        });
                    end;
                    return;
                end;
            end
        }, {
            NavBar = v63:renderBackground({
                BackgroundColor3 = l_Theme_1.NavigationBar.Color, 
                BackgroundTransparency = v63.props.roundCorners and 1 or l_Theme_1.NavigationBar.Transparency, 
                BorderSizePixel = 0
            }, v70), 
            SafeArea = v63:renderSafeArea()
        }, {
            UICorner = v63.props.roundCorners and v2.createElement("UICorner", {
                CornerRadius = UDim.new(0.15, 0) or nil
            }) or nil
        });
    end);
end;
v25.init = function(v72) --[[ Line: 391 ]] --[[ Name: init ]]
    v72:setState({
        portrait = true
    });
    v72.onSelectionChanged = function(v73) --[[ Line: 395 ]]
        -- upvalues: v72 (copy)
        if #v73 > 0 then
            local v74 = v72.props.itemList[v73[1]];
            if v74 and v74.onActivated then
                v74.onActivated();
            end;
        end;
    end;
    v72.onSafeAreaEvent = function(v75) --[[ Line: 403 ]]
        -- upvalues: v72 (copy)
        if v72.props.onSafeAreaChanged then
            v72.props.onSafeAreaChanged({
                Position = v75.Position, 
                AbsolutePosition = v75.AbsolutePosition, 
                Size = v75.Size, 
                AbsoluteSize = v75.AbsoluteSize
            });
        end;
    end;
end;
v25.render = function(v76) --[[ Line: 415 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v13 (copy), v18 (copy), v18 (copy)
    local l_itemList_0 = v76.props.itemList;
    local l_selection_0 = v76.props.selection;
    if l_selection_0 then
        l_selection_0 = if l_itemList_0[l_selection_0] == nil then nil else {
            l_selection_0
        };
    end;
    return v2.createElement(v13, {
        itemList = l_itemList_0, 
        selection = l_selection_0, 
        itemSize = UDim2.fromOffset(v18, v18), 
        renderList = function(...) --[[ Line: 431 ]] --[[ Name: renderList ]]
            -- upvalues: v76 (copy)
            return v76:renderList(...);
        end, 
        renderItem = function(...) --[[ Line: 434 ]] --[[ Name: renderItem ]]
            -- upvalues: v76 (copy)
            return v76:renderItem(...);
        end, 
        sortOrder = v76.props.sortOrder, 
        onSelectionChanged = v76.onSelectionChanged
    });
end;
return v25;