local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameFilters");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_Parent_0.DiscoveryTypes);
local v3 = require(l_Parent_0.Foundation);
local v4 = require(l_Parent_0.React);
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useTokens_0 = v3.Hooks.useTokens;
local v8 = require(l_script_FirstAncestor_0.Analytics.FilterClickButtonName);
local v9 = require(l_script_FirstAncestor_0.Components.Menu.FilterMenuActionBar);
local v10 = require(l_script_FirstAncestor_0.Components.Menu.FilterMenuHeader);
local v11 = require(l_script_FirstAncestor_0.Components.Menu.FilterMenuOptions);
local l_GetFFlagLuaAppEnableFoundationColors_0 = require(l_Parent_0.SharedFlags).GetFFlagLuaAppEnableFoundationColors;
return function(v13) --[[ Line: 38 ]] --[[ Name: FilterMenuDropdown ]]
    -- upvalues: l_useTokens_0 (copy), l_useDispatch_0 (copy), v4 (copy), l_GetFFlagLuaAppEnableFoundationColors_0 (copy), v8 (copy), l_dependencyArray_0 (copy), v10 (copy), v11 (copy), v9 (copy)
    local v14 = l_useTokens_0();
    local v15 = l_useDispatch_0();
    local v16, v17 = v4.useState(v13.filter.selectedOptionId);
    local l_Scrim_0 = v14.Color.Common.Scrim;
    local v19 = if l_GetFFlagLuaAppEnableFoundationColors_0() then v14.Color.Surface.Surface_100 else v14.Color.Surface.Surface_0;
    local l_Border_0 = v14.Color.ActionStandard.Border;
    local v21 = nil;
    local v22 = nil;
    if v13.openPosition then
        v21 = UDim2.fromOffset(v13.openPosition.X, v13.openPosition.Y);
        v22 = Vector2.new(0, 0);
    else
        v21 = UDim2.fromScale(0.5, 0.5);
        v22 = Vector2.new(0.5, 0.5);
    end;
    local v23, v24 = v4.useBinding(Vector2.new(0, 0));
    local v25, v26 = v4.useBinding(0);
    local v27, v28 = v4.useBinding(Vector2.new(10000, 0));
    local v32 = v23:map(function(v29) --[[ Line: 65 ]]
        -- upvalues: v13 (copy)
        local v30 = nil;
        local v31 = nil;
        if v13.openPosition then
            v30 = math.max(v29.X - v13.openPosition.X - 24, 260);
            v31 = math.max(v29.Y - v13.openPosition.Y - 24, 0);
        else
            v30 = v29.X - 48;
            v31 = v29.Y - 48;
        end;
        return Vector2.new(v30, v31);
    end);
    local v34 = v32:map(function(v33) --[[ Line: 80 ]]
        return v33.X;
    end);
    local v38 = v4.joinBindings({
        v25, 
        v27
    }):map(function(v35) --[[ Line: 87 ]]
        local v36 = v35[1];
        local v37 = v35[2];
        return UDim2.fromOffset(v37.X, v36 + v37.Y + 84);
    end);
    local v40 = v25:map(function(v39) --[[ Line: 94 ]]
        return UDim2.new(1, 0, 1, -v39 - 84);
    end);
    local v41 = v4.useCallback(function() --[[ Line: 99 ]]
        -- upvalues: v15 (copy), v13 (copy), v8 (ref), v16 (copy)
        v15(v13.closeCentralOverlayThunk());
        v13.onFilterMenuClosed();
        v13.sendFilterClick(v8.CloseDropdown, v13.filter.selectedOptionId, v16);
    end, l_dependencyArray_0(v13.filter, v16, v13.closeCentralOverlayThunk, v13.onFilterMenuClosed, v13.sendFilterClick));
    local v42 = v16 ~= v13.filter.selectedOptionId;
    local v43 = v4.useCallback(function() --[[ Line: 116 ]]
        -- upvalues: v13 (copy), v16 (copy), v15 (copy), v8 (ref)
        v13.onFilterApplied(v13.filter.filterType, v16);
        v15(v13.closeCentralOverlayThunk());
        v13.onFilterMenuClosed();
        v13.sendFilterClick(v8.Apply, v16, v13.filter.selectedOptionId);
    end, l_dependencyArray_0(v13.filter, v16, v13.onFilterApplied, v13.closeCentralOverlayThunk, v13.onFilterMenuClosed, v13.sendFilterClick));
    return v4.createElement("TextButton", {
        BackgroundColor3 = l_Scrim_0.Color3, 
        BackgroundTransparency = l_Scrim_0.Transparency, 
        Size = UDim2.fromScale(1, 1), 
        ClipsDescendants = false, 
        Text = "", 
        AutoButtonColor = false, 
        [v4.Event.Activated] = v41, 
        [v4.Change.AbsoluteSize] = function(v44) --[[ Line: 141 ]]
            -- upvalues: v24 (copy)
            v24(v44.AbsoluteSize);
        end
    }, {
        Dropdown = v4.createElement("TextButton", {
            BackgroundColor3 = v19.Color3, 
            BackgroundTransparency = v19.Transparency, 
            BorderColor3 = l_Border_0.Color3, 
            ClipsDescendants = true, 
            Text = "", 
            AutoButtonColor = false, 
            Position = v21, 
            AnchorPoint = v22, 
            Size = v38
        }, {
            Corner = v4.createElement("UICorner", {
                CornerRadius = UDim.new(0, v14.Radius.Medium)
            }), 
            SizeConstraint = v4.createElement("UISizeConstraint", {
                MinSize = Vector2.new(260, 0), 
                MaxSize = v32
            }), 
            Layout = v4.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            Header = v4.createElement(v10, {
                LayoutOrder = 1, 
                title = v13.filter.filterDisplayName, 
                onCloseButtonActivated = v41, 
                onHeightChanged = v26
            }), 
            Options = v4.createElement(v11, {
                LayoutOrder = 2, 
                Size = v40, 
                containerMaxWidthBinding = v34, 
                options = v13.filter.filterOptions, 
                selectedOptionId = v16, 
                onSelectedOptionChanged = v17, 
                onCanvasSizeChanged = v28
            }), 
            ActionBar = v4.createElement(v9, {
                LayoutOrder = 3, 
                Size = UDim2.new(1, 0, 0, 84), 
                applyEnabled = v42, 
                onApply = v43
            })
        })
    });
end;