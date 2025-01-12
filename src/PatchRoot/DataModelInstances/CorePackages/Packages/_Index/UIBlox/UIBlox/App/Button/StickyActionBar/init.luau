local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local l_Core_0 = l_Parent_2.Core;
local l_Parent_3 = l_Parent_2.Parent;
local v5 = require(l_Parent_3.t);
local v6 = require(l_Parent_3.Roact);
local l_Label_0 = require(l_Core_0.ImageSet.ImageSetComponent).Label;
local v8 = require(l_Core_0.Text.GenericTextLabel.GenericTextLabel);
local v9 = require(l_Core_0.ImageSet.Validator.validateImage);
local v10 = require(l_Parent_1.ImageSet.Enum.IconSize);
local v11 = require(l_Parent_1.ImageSet.getIconSize);
local v12 = require(l_Core_0.Style.withStyle);
local v13 = require(l_Core_0.Text.GetTextSize);
local v14 = require(l_Parent_0.ActionBar);
local v15 = v11(v10.Large);
local v16 = v6.PureComponent:extend("StickyActionBar");
v16.validateProps = v5.strictInterface({
    actionBarProps = v5.optional(v14.validateProps), 
    actionBarWidth = v5.optional(v5.number), 
    infoProps = v5.optional(v5.strictInterface({
        title = v5.string, 
        icon = v5.optional(v9), 
        enableInfoAtStart = v5.optional(v5.boolean), 
        infoSectionWidth = v5.optional(v5.integer)
    })), 
    width = v5.optional(v5.integer), 
    layoutOrder = v5.optional(v5.integer)
});
v16.defaultProps = {
    actionBarProps = nil, 
    actionBarWidth = 380, 
    infoProps = nil, 
    layoutOrder = 1, 
    width = nil
};
v16.init = function(v17) --[[ Line: 73 ]] --[[ Name: init ]]
    -- upvalues: v13 (copy)
    v17.state = {
        containerWidth = nil
    };
    v17.onContainerSizeChange = function(v18) --[[ Line: 77 ]]
        -- upvalues: v17 (copy)
        v17:setState(function(_, _) --[[ Line: 78 ]]
            -- upvalues: v18 (copy)
            return {
                containerWidth = v18.AbsoluteSize.X
            };
        end);
    end;
    local function _() --[[ Line: 85 ]]
        -- upvalues: v17 (copy)
        return UDim2.fromOffset(v17.props.actionBarWidth, 48);
    end;
    local function _(v22, v23, v24) --[[ Line: 89 ]]
        -- upvalues: v17 (copy)
        if v24 and v24.infoSectionWidth then
            return v24.infoSectionWidth;
        else
            local l_Offset_0 = UDim2.fromOffset(v17.props.actionBarWidth, 48).X.Offset;
            return v23 and v22 - 80 - l_Offset_0 or v22 - 80;
        end;
    end;
    local function v34(v27, v28, v29, v30) --[[ Line: 100 ]]
        -- upvalues: v17 (copy)
        if v30 or not v29 then
            return {
                horizontalAlignment = Enum.HorizontalAlignment.Left, 
                left = 24, 
                right = 24
            };
        else
            local v31 = (v27 - v28) / 2;
            local v32 = nil;
            v32 = v27 < 1280 and 24 or 80;
            local l_Offset_1 = UDim2.fromOffset(v17.props.actionBarWidth, 48).X.Offset;
            return {
                left = math.max(l_Offset_1 + v32, v31) - l_Offset_1, 
                right = 24
            };
        end;
    end;
    local function _(v35, v36, v37) --[[ Line: 124 ]]
        -- upvalues: v13 (ref)
        local l_BaseSize_0 = v37.Font.BaseSize;
        local v39 = v36.RelativeSize * l_BaseSize_0;
        local v40 = Vector2.new(10000, 10000);
        return v13(v35, v39, v36.Font, v40).X;
    end;
    v17.getLayoutConfig = function(v42, v43, v44, v45, v46, v47, v48) --[[ Line: 131 ]]
        -- upvalues: v17 (copy), v13 (ref), v34 (copy)
        local v49 = v17.props.infoProps and v17.props.infoProps.enableInfoAtStart and true or false;
        local l_BaseSize_1 = v48.Font.BaseSize;
        local v51 = v47.RelativeSize * l_BaseSize_1;
        local v52 = Vector2.new(10000, 10000);
        local v53 = v13(v46, v51, v47.Font, v52).X + v45 + (v45 > 0 and 12 or 0);
        local v54 = {
            layoutOrder = v49 and {
                infoSection = 1, 
                actionBarSection = 2
            } or {
                infoSection = 2, 
                actionBarSection = 1
            }, 
            infoHorizontalAlignment = Enum.HorizontalAlignment.Left
        };
        if v44 and v44.infoSectionWidth then
            l_BaseSize_1 = v44.infoSectionWidth;
        else
            v51 = UDim2.fromOffset(v17.props.actionBarWidth, 48).X.Offset;
            l_BaseSize_1 = v43 and v42 - 80 - v51 or v42 - 80;
        end;
        v54.infoSectionWidth = l_BaseSize_1;
        v54.infoSectionPadding = v34(v42, v53, v43, v49);
        v54.actionBarSectionSize = UDim2.fromOffset(v17.props.actionBarWidth, 48);
        v54.actionBarSectionMarginOverride = {
            left = 0, 
            right = 0, 
            top = 0, 
            bottom = 0
        };
        return v54;
    end;
end;
v16.render = function(v55) --[[ Line: 172 ]] --[[ Name: render ]]
    -- upvalues: v12 (copy), v15 (copy), v6 (copy), v14 (copy), l_Label_0 (copy), v8 (copy)
    local v56 = v55.props.actionBarProps ~= nil;
    local v57 = v55.props.infoProps ~= nil;
    local v58 = v55.props.width or v55.state.containerWidth;
    assert(v56 or v57, "Either actionbar or info should be present!");
    return v12(function(v59) --[[ Line: 177 ]]
        -- upvalues: v57 (copy), v55 (copy), v15 (ref), v58 (copy), v56 (copy), v6 (ref), v14 (ref), l_Label_0 (ref), v8 (ref)
        local v60 = v57 and v55.props.infoProps.icon and v15 or 0;
        local v61 = v57 and v55.props.infoProps.title or "";
        local l_Header2_0 = v59.Font.Header2;
        local v63 = v55.getLayoutConfig(v58 or 0, v56, v55.props.infoProps, v60, v61, l_Header2_0, v59);
        return v55:renderHorizontalLayout({
            layoutOrder = v55.props.layoutOrder, 
            size = v55.props.width and UDim2.new(0, v55.props.width, 1, 0) or UDim2.fromScale(1, 1), 
            onContainerSizeChange = v55.onContainerSizeChange, 
            horizontalAlignment = Enum.HorizontalAlignment.Left, 
            padding = {
                left = 56, 
                right = 24
            }
        }, {
            ActionBarSection = v56 and v55:renderHorizontalLayout({
                layoutOrder = v63.layoutOrder.actionBarSection, 
                size = v63.actionBarSectionSize, 
                horizontalAlignment = Enum.HorizontalAlignment.Left
            }, {
                ActionBar = v6.createElement(v14, {
                    button = v55.props.actionBarProps.button, 
                    icons = v55.props.actionBarProps.icons, 
                    marginOverride = v63.actionBarSectionMarginOverride, 
                    enableButtonAtStart = true
                })
            }) or nil, 
            InfoSection = v57 and v58 ~= nil and v55:renderHorizontalLayout({
                layoutOrder = v63.layoutOrder.infoSection, 
                width = v63.infoSectionWidth, 
                horizontalAlignment = v63.infoHorizontalAlignment, 
                padding = v63.infoSectionPadding, 
                internalSpacing = 12
            }, {
                Icon = v55.props.infoProps.icon and v6.createElement(l_Label_0, {
                    Size = UDim2.new(0, v60, 0, v60), 
                    LayoutOrder = 1, 
                    Position = UDim2.new(0, 0, 0, 0), 
                    Image = v55.props.infoProps.icon, 
                    BackgroundTransparency = 1, 
                    ScaleType = Enum.ScaleType.Crop
                }, {
                    RoundCorner = v6.createElement("UICorner", {
                        CornerRadius = UDim.new(0, 8)
                    })
                }) or nil, 
                Title = v6.createElement(v8, {
                    LayoutOrder = 2, 
                    Size = UDim2.new(0, 0, 0, 48), 
                    AutomaticSize = Enum.AutomaticSize.X, 
                    Position = UDim2.new(0, v15 + 12, 0, 0), 
                    Text = v61, 
                    fluidSizing = false, 
                    TextWrapped = true, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    colorStyle = v59.Theme.TextEmphasis, 
                    fontStyle = l_Header2_0, 
                    TextTruncate = Enum.TextTruncate.AtEnd, 
                    BackgroundTransparency = 1
                })
            })
        });
    end);
end;
v16.renderHorizontalLayout = function(_, v65, v66) --[[ Line: 250 ]] --[[ Name: renderHorizontalLayout ]]
    -- upvalues: v6 (copy)
    return v6.createElement("Frame", {
        Size = v65.size and v65.size or UDim2.new(0, v65.width, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        LayoutOrder = v65.layoutOrder, 
        [v6.Change.AbsoluteSize] = v65.onContainerSizeChange
    }, {
        Layout = v6.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = v65.horizontalAlignment, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, v65.internalSpacing or 0)
        }), 
        Padding = if v65.padding then v6.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, v65.padding.left or 0), 
            PaddingRight = UDim.new(0, v65.padding.right or 0), 
            PaddingTop = UDim.new(0, v65.padding.top or 0), 
            PaddingBottom = UDim.new(0, v65.padding.bottom or 0)
        }) else nil, 
        Elements = v6.createFragment(v66)
    });
end;
return v16;