local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v3 = require(l_Parent_2.React);
local l_Object_0 = require(l_Parent_2.LuauPolyfill).Object;
local v5 = require(l_Parent_1.Core.Style.useStyle);
local v6 = require(l_Parent_1.Core.ImageSet.ImageSetComponent);
local v7 = require(l_Parent_0.ImageSet.Enum.IconSize);
local v8 = require(l_Parent_0.ImageSet.getIconSize);
local v9 = require(l_Parent_1.Core.Text.GenericTextLabel.GenericTextLabel);
local v10 = require(l_Parent_0.Menu.KeyLabel.KeyLabel);
local v11 = require(script.Parent.ProgressIconAnimated);
local _ = require(script.Parent.Types);
local v13 = {
    iconLabelGap = 6, 
    actionTextSpacingLeading = 12
};
local v14 = {
    hasProgress = false, 
    animationTriggerTime = 0.3, 
    animationKeyHoldingTime = 1.5, 
    animationCoolDownTime = 0.75
};
local function v30(v15, v16) --[[ Line: 39 ]] --[[ Name: renderIcon ]]
    -- upvalues: v8 (copy), v7 (copy), v3 (copy), v10 (copy), v6 (copy), v11 (copy)
    local l_layoutOrder_0 = v15.layoutOrder;
    local l_itemProps_0 = v15.itemProps;
    local v19 = v8(v7.Medium);
    local l_hasProgress_0 = l_itemProps_0.hasProgress;
    local v21 = nil;
    if l_hasProgress_0 then
        v21 = l_itemProps_0;
    end;
    local l_icon_0 = l_itemProps_0.icon;
    local v23 = nil;
    local v24 = typeof(l_icon_0) == "EnumItem";
    local v25 = false;
    if typeof(l_icon_0) == "table" then
        v25 = #l_icon_0 > 0;
    end;
    if v24 or v25 then
        v23 = Enum.AutomaticSize.X;
    end;
    local v26 = nil;
    if v24 then
        v26 = v3.createElement(v10, {
            keyCode = l_icon_0, 
            iconThemeKey = "IconEmphasis"
        });
    elseif v25 then
        local v27 = {
            Layout = v3.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Horizontal, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            })
        };
        for v28, v29 in l_icon_0 do
            v27["KeyLabel" .. v28] = v3.createElement(v10, {
                keyCode = v29, 
                LayoutOrder = v28, 
                iconThemeKey = "IconEmphasis"
            });
        end;
        v26 = v3.createElement("Frame", {
            Size = UDim2.fromScale(0, 0), 
            AutomaticSize = Enum.AutomaticSize.XY, 
            BackgroundTransparency = 1
        }, v27);
    else
        v26 = v3.createElement(v6.Label, {
            Size = UDim2.fromScale(1, 1), 
            Image = l_icon_0, 
            ImageColor3 = v16.Theme.TextEmphasis.Color, 
            ImageTransparency = v16.Theme.TextEmphasis.Transparency, 
            BackgroundTransparency = 1
        });
    end;
    return v3.createElement("Frame", {
        LayoutOrder = l_layoutOrder_0, 
        Size = UDim2.fromOffset(v19, v19), 
        AutomaticSize = v23, 
        BorderSizePixel = 0, 
        BackgroundTransparency = 1
    }, {
        ProgressIcon = if l_hasProgress_0 then v3.createElement(v11, v21) else nil, 
        Image = if l_hasProgress_0 then nil else v26
    });
end;
return function(v31) --[[ Line: 112 ]] --[[ Name: Shortcut ]]
    -- upvalues: l_Object_0 (copy), v13 (copy), v14 (copy), v5 (copy), v3 (copy), v9 (copy), v30 (copy)
    local v32 = l_Object_0.assign({}, v13, v31);
    local v33 = l_Object_0.assign({}, v14, v32.publicProps);
    local v34 = v5();
    local l_index_0 = v32.index;
    return v3.createElement("Frame", {
        LayoutOrder = l_index_0, 
        Size = UDim2.fromOffset(0, 0), 
        BorderSizePixel = 0, 
        BackgroundTransparency = 1, 
        AutomaticSize = Enum.AutomaticSize.XY
    }, {
        UIListLayout = v3.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Horizontal, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            Padding = UDim.new(0, v32.iconLabelGap)
        }), 
        ActionText = if v33.actionText then v3.createElement("Frame", {
            LayoutOrder = 1, 
            Size = UDim2.fromOffset(0, 0), 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            AutomaticSize = Enum.AutomaticSize.XY
        }, {
            Padding = v3.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, v32.actionTextSpacingLeading)
            }), 
            Label = v3.createElement(v9, {
                Size = UDim2.fromOffset(0, 0), 
                AutomaticSize = Enum.AutomaticSize.XY, 
                Text = v33.actionText, 
                colorStyle = v34.Theme.TextEmphasis, 
                fontStyle = v34.Font.SubHeader1, 
                BackgroundTransparency = 1
            })
        }) else nil, 
        Icon = v30({
            layoutOrder = 2, 
            itemProps = v33
        }, v34), 
        LabelText = v3.createElement(v9, {
            LayoutOrder = 3, 
            Size = UDim2.fromOffset(0, 0), 
            AutomaticSize = Enum.AutomaticSize.XY, 
            Text = v33.text, 
            colorStyle = v34.Theme.TextEmphasis, 
            fontStyle = v34.Font.SubHeader1, 
            BackgroundTransparency = 1
        })
    });
end;