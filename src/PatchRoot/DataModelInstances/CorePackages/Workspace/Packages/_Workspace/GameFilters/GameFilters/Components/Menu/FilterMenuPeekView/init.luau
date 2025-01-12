local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameFilters");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.AppCommonLib);
local _ = require(l_Parent_0.DiscoveryTypes);
local v4 = require(l_Parent_0.PeekView);
local l_PeekView_0 = v4.PeekView;
local l_PeekViewState_0 = v4.PeekViewState;
local v7 = require(l_Parent_0.React);
local l_Signal_0 = v2.Signal;
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local l_useNavigationProps_0 = require(l_Parent_0.RobloxAppNavigation).useNavigationProps;
local v12 = require(l_script_FirstAncestor_0.Analytics.FilterClickButtonName);
local v13 = require(l_script_FirstAncestor_0.Components.Menu.FilterMenuActionBar);
local v14 = require(l_script_FirstAncestor_0.Components.Menu.FilterMenuHeader);
local v15 = require(l_script_FirstAncestor_0.Components.Menu.FilterMenuOptions);
local v16 = require(l_script_FirstAncestor_0.Components.Menu.useTopBarHeightSelector);
local l_FFlagLuaAppTopChartsFilterMenuPeekViewHeightFix_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppTopChartsFilterMenuPeekViewHeightFix;
return function() --[[ Line: 35 ]] --[[ Name: FilterMenuPeekView ]]
    -- upvalues: l_useNavigationProps_0 (copy), v7 (copy), l_useNavigation_0 (copy), l_PeekViewState_0 (copy), v12 (copy), l_dependencyArray_0 (copy), l_FFlagLuaAppTopChartsFilterMenuPeekViewHeightFix_0 (copy), v16 (copy), l_Signal_0 (copy), l_PeekView_0 (copy), v13 (copy), v14 (copy), v15 (copy)
    local v20 = l_useNavigationProps_0(function(_, v19) --[[ Line: 36 ]]
        return {
            filter = v19.filter, 
            onFilterApplied = v19.onFilterApplied, 
            onFilterMenuClosed = v19.onFilterMenuClosed, 
            sendFilterClick = v19.sendFilterClick
        };
    end);
    local l_filter_0 = v20.filter;
    local v22, v23 = v7.useState(l_filter_0.selectedOptionId);
    local v24 = v7.useRef(false);
    local v25 = l_useNavigation_0();
    local v28 = v7.useCallback(function(v26, _) --[[ Line: 55 ]]
        -- upvalues: l_PeekViewState_0 (ref), v25 (copy), v20 (copy), v24 (copy), v12 (ref), l_filter_0 (copy), v22 (copy)
        if v26 == l_PeekViewState_0.Closed or v26 == l_PeekViewState_0.Hidden then
            v25.goBack();
            v20.onFilterMenuClosed();
            if not v24.current then
                v20.sendFilterClick(v12.ClosePeekView, l_filter_0.selectedOptionId, v22);
            end;
        end;
    end, l_dependencyArray_0(l_filter_0.selectedOptionId, v22, v25, v20.onFilterMenuClosed, v20.sendFilterClick));
    local v29 = if l_FFlagLuaAppTopChartsFilterMenuPeekViewHeightFix_0 then v16() else nil;
    local v30, v31 = v7.useBinding(Vector2.new(0, 0));
    local v32, v33 = v7.useBinding(0);
    local v34, v35 = v7.useBinding(Vector2.new(0, 0));
    local v37 = v30:map(function(v36) --[[ Line: 85 ]]
        return v36.X;
    end);
    local v44 = v7.joinBindings({
        v30, 
        v32, 
        v34
    }):map(function(v38) --[[ Line: 93 ]]
        -- upvalues: l_FFlagLuaAppTopChartsFilterMenuPeekViewHeightFix_0 (ref), v29 (copy)
        local l_Y_0 = v38[1].Y;
        local v40 = v38[2];
        local l_Y_1 = v38[3].Y;
        local v42 = if l_FFlagLuaAppTopChartsFilterMenuPeekViewHeightFix_0 then l_Y_0 - 84 - 25 - v29 else l_Y_0 - 84 - 25;
        local v43 = math.min(v40 + l_Y_1, v42);
        return UDim2.new(1, 0, 0, v43);
    end);
    local v46 = v32:map(function(v45) --[[ Line: 107 ]]
        return UDim2.new(1, 0, 1, -v45);
    end);
    local v47 = v7.useRef(nil);
    local v51 = v7.useCallback(function(v48) --[[ Line: 113 ]]
        -- upvalues: v47 (copy)
        local l_current_0 = v47.current;
        if l_current_0 then
            local l_Y_2 = v48.AbsoluteSize.Y;
            l_current_0.AutomaticSize = Enum.AutomaticSize.None;
            l_current_0.Size = UDim2.new(1, 0, 0, l_Y_2);
        end;
    end, {});
    local v52 = v7.useRef(l_Signal_0.new());
    local v53 = v7.useCallback(function() --[[ Line: 126 ]]
        -- upvalues: v52 (copy)
        v52.current:fire();
    end, {});
    local v55 = v7.useCallback(function(v54) --[[ Line: 131 ]]
        -- upvalues: v23 (copy)
        v23(v54);
    end, {});
    local v56 = v22 ~= l_filter_0.selectedOptionId;
    local v57 = v7.useCallback(function() --[[ Line: 139 ]]
        -- upvalues: v20 (copy), l_filter_0 (copy), v22 (copy), v24 (copy), v53 (copy), v12 (ref)
        v20.onFilterApplied(l_filter_0.filterType, v22);
        v24.current = true;
        v53();
        v20.sendFilterClick(v12.Apply, v22, l_filter_0.selectedOptionId);
    end, l_dependencyArray_0(l_filter_0.filterType, l_filter_0.selectedOptionId, v22, v20.onFilterApplied, v53, v20.sendFilterClick));
    return v7.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        ClipsDescendants = false, 
        [v7.Change.AbsoluteSize] = function(v58) --[[ Line: 159 ]]
            -- upvalues: v31 (copy)
            v31(v58.AbsoluteSize);
        end
    }, {
        PeekView = v7.createElement(l_PeekView_0, {
            briefViewContentHeight = UDim.new(0, 0), 
            contentFrameRef = v47, 
            closeSignal = v52.current, 
            hasScrim = true, 
            mountAsFullView = true, 
            returnToFullView = true, 
            showDraggerInClosedState = false, 
            thumbstickScrollEnabled = true, 
            viewStateChanged = v28, 
            bottomDockedContainerHeight = 84, 
            bottomDockedContainerContent = v7.createElement(v13, {
                Size = UDim2.new(1, 0, 0, 84), 
                applyEnabled = v56, 
                onApply = v57
            })
        }, {
            Content = v7.createElement("Frame", {
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Size = v44, 
                [v7.Change.AbsoluteSize] = v51
            }, {
                Layout = v7.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    HorizontalFlex = Enum.UIFlexAlignment.Fill, 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                Header = v7.createElement(v14, {
                    LayoutOrder = 1, 
                    title = l_filter_0.filterDisplayName, 
                    onCloseButtonActivated = v53, 
                    onHeightChanged = v33
                }), 
                Options = v7.createElement(v15, {
                    LayoutOrder = 2, 
                    Size = v46, 
                    containerMaxWidthBinding = v37, 
                    options = l_filter_0.filterOptions, 
                    selectedOptionId = v22, 
                    onSelectedOptionChanged = v55, 
                    onCanvasSizeChanged = v35
                })
            })
        })
    });
end;