local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local l_Parent_3 = l_Parent_2.Parent;
local v4 = require(l_Parent_2.UIBloxConfig);
local v5 = require(l_Parent_0.Enum.ContentPosition);
local v6 = require(l_Parent_0.validateDetailsPageComponentList);
local l_DeviceType_0 = require(l_Parent_1.Style.Constants).DeviceType;
local v8 = require(l_Parent_0.getPlatformConfig);
local v9 = require(l_Parent_0.DetailsPageTitleContent);
local v10 = require(l_Parent_3.Roact);
local v11 = require(l_Parent_3.t);
local v12 = v10.PureComponent:extend("DetailsPageBody");
v12.validateProps = v11.strictInterface({
    titleText = v11.optional(v11.string), 
    subTitleText = v11.optional(v11.string), 
    renderInfoContent = v11.optional(v11.callback), 
    componentList = v11.optional(v6), 
    dualPanelBreakpoint = v11.optional(v11.number), 
    sideMargin = v11.optional(v11.number), 
    bodyClipsDescendants = v11.optional(v11.boolean), 
    deviceType = v11.optional(v11.string)
});
v12.defaultProps = {
    bodyClipsDescendants = true
};
v12.init = function(v13) --[[ Line: 47 ]] --[[ Name: init ]]
    -- upvalues: v10 (copy)
    v13.state = {
        containerWidth = nil
    };
    v13.containerFrameRef = v10.createRef();
    v13.mounted = false;
    v13.onContainerSizeChange = function(v14) --[[ Line: 53 ]]
        -- upvalues: v13 (copy)
        if not v13.mounted then
            return;
        else
            v13:setState(function(v15, _) --[[ Line: 58 ]]
                -- upvalues: v14 (copy)
                if v15.containerWidth ~= v14.AbsoluteSize.x then
                    return {
                        containerWidth = v14.AbsoluteSize.x
                    };
                else
                    return nil;
                end;
            end);
            return;
        end;
    end;
end;
v12.renderSinglePanel = function(v17) --[[ Line: 69 ]] --[[ Name: renderSinglePanel ]]
    -- upvalues: v10 (copy), v4 (copy)
    local v18 = {
        Layout = v10.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Vertical, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            Padding = UDim.new(0, 24)
        })
    };
    for v19, v20 in pairs(v17.props.componentList) do
        v18[v19 .. "Container"] = v10.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            LayoutOrder = v20.portraitLayoutOrder, 
            Visible = if v4.addEdpComponentVisibility then v20.visible else nil
        }, {
            [v19] = v20.renderComponent()
        });
    end;
    return {
        Panel = v10.createElement("Frame", {
            Size = UDim2.fromScale(1, 0), 
            ClipsDescendants = false, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1
        }, v18)
    };
end;
v12.renderDualPanel = function(v21) --[[ Line: 102 ]] --[[ Name: renderDualPanel ]]
    -- upvalues: v10 (copy), v5 (copy), v4 (copy)
    local v22 = v21.state.containerWidth < 1920 and 48 or 96;
    local v23 = {
        Layout = v10.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Vertical, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            Padding = UDim.new(0, 24)
        })
    };
    local v24 = {
        Layout = v10.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Vertical, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            Padding = UDim.new(0, 24)
        })
    };
    for v25, v26 in pairs(v21.props.componentList) do
        local l_v23_0 = v23;
        if v26.landscapePosition == v5.Right then
            l_v23_0 = v24;
        end;
        l_v23_0[v25 .. "Container"] = v10.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            LayoutOrder = v26.landscapeLayoutOrder, 
            Visible = if v4.addEdpComponentVisibility then v26.visible else nil
        }, {
            [v25] = v26.renderComponent()
        });
    end;
    local v28 = v10.createElement("Frame", {
        Size = UDim2.new(0.5, -v22 / 2, 0, 0), 
        ClipsDescendants = true, 
        BackgroundTransparency = 1, 
        AutomaticSize = Enum.AutomaticSize.Y, 
        LayoutOrder = 1
    }, v23);
    local v29 = v10.createElement("Frame", {
        Size = UDim2.new(0.5, -v22 / 2, 0, 0), 
        ClipsDescendants = true, 
        BackgroundTransparency = 1, 
        AutomaticSize = Enum.AutomaticSize.Y, 
        LayoutOrder = 2
    }, v24);
    return {
        Layout = v10.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Horizontal, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            Padding = UDim.new(0, v22)
        }), 
        LeftPanel = v28, 
        RightPanel = v29
    };
end;
v12.renderBodyContent = function(v30) --[[ Line: 170 ]] --[[ Name: renderBodyContent ]]
    local v31 = v30.props.dualPanelBreakpoint or 1280;
    if v30.state.containerWidth and v30.props.componentList then
        if v30.state.containerWidth < v31 then
            return v30:renderSinglePanel();
        else
            return v30:renderDualPanel();
        end;
    else
        return {};
    end;
end;
v12.render = function(v32) --[[ Line: 183 ]] --[[ Name: render ]]
    -- upvalues: l_DeviceType_0 (copy), v8 (copy), v10 (copy), v9 (copy)
    local v33 = v32.props.deviceType == l_DeviceType_0.Phone;
    local v34 = v8(v32.props.deviceType);
    local v35 = if v32.props.sideMargin then v32.props.sideMargin else v34.sideMargin;
    return v10.createElement("Frame", {
        Size = UDim2.fromScale(1, 0), 
        BackgroundTransparency = 1, 
        ClipsDescendants = v32.props.bodyClipsDescendants, 
        AutomaticSize = Enum.AutomaticSize.Y, 
        [v10.Ref] = v32.containerFrameRef, 
        [v10.Change.AbsoluteSize] = v32.onContainerSizeChange
    }, {
        Layout = v10.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Vertical, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left
        }), 
        UIPadding = v10.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, v35), 
            PaddingRight = UDim.new(0, v35)
        }), 
        TitleInfo = v33 and v10.createElement(v9, {
            titleText = v32.props.titleText, 
            subTitleText = v32.props.subTitleText, 
            renderInfoContent = v32.props.renderInfoContent, 
            verticalAlignment = Enum.VerticalAlignment.Top, 
            layoutOrder = 1
        } or nil), 
        Padding = v10.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, v35), 
            BackgroundTransparency = 1, 
            LayoutOrder = 2
        }), 
        ContentFrame = v10.createElement("Frame", {
            Size = UDim2.fromScale(1, 0), 
            BackgroundTransparency = 1, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            LayoutOrder = 3
        }, v32:renderBodyContent()), 
        BottomPadding = v10.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 3 * v35), 
            BackgroundTransparency = 1, 
            LayoutOrder = 4
        })
    });
end;
v12.didMount = function(v36) --[[ Line: 234 ]] --[[ Name: didMount ]]
    v36.mounted = true;
    if v36.containerFrameRef.current then
        v36.onContainerSizeChange(v36.containerFrameRef.current);
    end;
end;
v12.willUnmount = function(v37) --[[ Line: 242 ]] --[[ Name: willUnmount ]]
    v37.mounted = false;
end;
return v12;