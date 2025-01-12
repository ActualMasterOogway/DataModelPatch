local l_UserInputService_0 = game:GetService("UserInputService");
local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v4 = require(l_Parent_2.React);
local v5 = require(l_Parent_2.ReactOtter);
local v6 = require(l_Parent_2.ReactUtils);
local l_useDelayedActionHandler_0 = v6.useDelayedActionHandler;
local l_useEventConnection_0 = v6.useEventConnection;
local l_Object_0 = require(l_Parent_2.LuauPolyfill).Object;
local v10 = require(l_Parent_1.Core.Style.useStyle);
local _ = require(script.Parent.Types);
local v12 = require(script.Parent.Shortcut);
local v13 = require(l_Parent_1.Utility.useInputType);
local v14 = require(l_Parent_0.Utilities);
local _ = require(l_Parent_1.Enums.InputType);
local v16 = {
    dampingRatio = 2, 
    frequency = 3
};
local v17 = {
    items = {}, 
    spacingTop = 12, 
    spacingTrailing = 30, 
    spacingBottom = 12, 
    spacingLeading = 18, 
    itemsGap = 24, 
    itemIconLabelGap = 6, 
    actionTextSpacingLeading = 12
};
return function(v18) --[[ Line: 69 ]] --[[ Name: ShortcutBar ]]
    -- upvalues: l_Object_0 (copy), v17 (copy), v10 (copy), v4 (copy), v13 (copy), v5 (copy), l_useDelayedActionHandler_0 (copy), v16 (copy), v14 (copy), l_useEventConnection_0 (copy), l_UserInputService_0 (copy), v12 (copy)
    local v19 = l_Object_0.assign({}, v17, v18);
    local v20 = v10();
    local v21 = {
        UICorner = v4.createElement("UICorner", {
            CornerRadius = UDim.new(0.5, 0)
        }), 
        Padding = v4.createElement("UIPadding", {
            PaddingTop = UDim.new(0, v19.spacingTop), 
            PaddingRight = UDim.new(0, v19.spacingTrailing), 
            PaddingBottom = UDim.new(0, v19.spacingBottom), 
            PaddingLeft = UDim.new(0, v19.spacingLeading)
        }), 
        ListLayout = v4.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Horizontal, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            Padding = UDim.new(0, v19.itemsGap)
        })
    };
    local v22 = v13();
    local v23, v24 = v5.useAnimatedBinding(0);
    local v25 = l_useDelayedActionHandler_0(if v19.transitionDelaySeconds then v19.transitionDelaySeconds else 0, 0.1, function() --[[ Line: 99 ]]
        -- upvalues: v24 (copy), v5 (ref), v16 (ref)
        v24(v5.spring(0, v16));
    end);
    local function v26() --[[ Line: 104 ]] --[[ Name: onInputChanged ]]
        -- upvalues: v19 (copy), v24 (copy), v5 (ref), v16 (ref), v25 (copy)
        if v19.transitionDelaySeconds then
            v24(v5.spring(1, v16));
            v25();
        end;
    end;
    local v27, v28 = v4.useState(v14.filterItems(v19.items, v22));
    l_useEventConnection_0(l_UserInputService_0.InputChanged, v26);
    v4.useEffect(function() --[[ Line: 114 ]]
        -- upvalues: v28 (copy), v14 (ref), v19 (copy), v22 (copy)
        v28(v14.filterItems(v19.items, v22));
    end, {
        v22, 
        v19.items
    });
    for v29, v30 in ipairs(v27) do
        v21["Item" .. tostring(v29)] = v4.createElement(v12, {
            index = v29, 
            iconLabelGap = v19.itemIconLabelGap, 
            actionTextSpacingLeading = v19.actionTextSpacingLeading, 
            publicProps = v30
        });
    end;
    if #v27 > 0 then
        local l_Contrast_0 = v20.Tokens.Semantic.Color.BackgroundUi.Contrast;
        return v4.createElement("CanvasGroup", {
            Position = v19.position, 
            AnchorPoint = v19.anchorPoint, 
            BackgroundTransparency = 1, 
            GroupTransparency = if v19.transitionDelaySeconds then v23 else 0, 
            AutomaticSize = Enum.AutomaticSize.XY
        }, {
            ShortcutBarComponent = v4.createElement("Frame", {
                Size = UDim2.fromOffset(0, 0), 
                BorderSizePixel = 0, 
                BackgroundColor3 = l_Contrast_0.Color3, 
                BackgroundTransparency = l_Contrast_0.Transparency, 
                AutomaticSize = Enum.AutomaticSize.XY
            }, v21)
        });
    else
        return nil;
    end;
end;