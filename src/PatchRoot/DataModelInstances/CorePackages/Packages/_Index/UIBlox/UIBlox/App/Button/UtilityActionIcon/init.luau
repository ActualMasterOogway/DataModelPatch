local l_CoreGui_0 = game:GetService("CoreGui");
local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v3 = require(l_Parent_1.React);
local v4 = require(l_Parent_1.Cryo);
local l_Label_0 = require(l_Parent_0.Core.ImageSet.ImageSetComponent).Label;
local v6 = require(l_Parent_0.Core.Style.useStyle);
local _ = require(l_Parent_0.App.ImageSet.ImagesTypes);
local _ = require(l_Parent_0.App.Style.StyleTypes);
local l_withHoverTooltip_0 = require(l_Parent_0.App.Dialog.TooltipV2.Controllers).withHoverTooltip;
local v10 = require(l_Parent_0.App.Dialog.Tooltip.Enum.TooltipOrientation);
local v11 = require(l_Parent_0.Core.Control.StateLayer);
local v12 = require(l_Parent_0.App.Indicator.Badge);
local v13 = {
    badgeVariant = require(l_Parent_0.App.Indicator.Enum.BadgeVariant).Alert, 
    tooltipTarget = l_CoreGui_0, 
    disableOutset = false, 
    onMedia = false
};
return v3.forwardRef(function(v14, v15) --[[ Line: 56 ]] --[[ Name: UtilityActionIcon ]]
    -- upvalues: v4 (copy), v13 (copy), v6 (copy), v3 (copy), l_withHoverTooltip_0 (copy), v10 (copy), v11 (copy), l_Label_0 (copy), v12 (copy)
    local v16 = v4.Dictionary.join(v13, v14);
    local l_anchorPoint_0 = v16.anchorPoint;
    local l_position_0 = v16.position;
    local l_layoutOrder_0 = v16.layoutOrder;
    local l_icon_0 = v16.icon;
    local l_badgeValue_0 = v16.badgeValue;
    local l_badgeVariant_0 = v16.badgeVariant;
    local l_tooltipText_0 = v16.tooltipText;
    local l_tooltipTarget_0 = v16.tooltipTarget;
    local l_disableOutset_0 = v16.disableOutset;
    local l_onMedia_0 = v16.onMedia;
    local l_onActivated_0 = v16.onActivated;
    local l_Tokens_0 = v6().Tokens;
    local l_Size_500_0 = l_Tokens_0.Global.Size_500;
    local l_Medium_0 = l_Tokens_0.Semantic.Icon.Size.Medium;
    local v31 = if l_onMedia_0 then l_Tokens_0.Global.Color.White else l_Tokens_0.Semantic.Color.Icon.Emphasis;
    local v32 = if v16.iconColor then v16.iconColor else v31;
    local v33 = l_onMedia_0 and "Darken" or "Standard";
    local v34 = Vector2.new(0, 1);
    local v35 = UDim2.new(0.5, l_Tokens_0.Global.Size_25, 0.5, -l_Tokens_0.Global.Size_25);
    local v36 = v3.useMemo(function() --[[ Line: 82 ]]
        -- upvalues: l_disableOutset_0 (copy), l_Tokens_0 (copy)
        if l_disableOutset_0 then
            return nil;
        else
            return {
                top = UDim.new(0, l_Tokens_0.Global.Size_50), 
                right = UDim.new(0, l_Tokens_0.Global.Size_50), 
                bottom = UDim.new(0, l_Tokens_0.Global.Size_50), 
                left = UDim.new(0, l_Tokens_0.Global.Size_50)
            };
        end;
    end, {
        l_disableOutset_0, 
        l_Tokens_0
    });
    local v38 = v3.useMemo(function() --[[ Line: 93 ]]
        -- upvalues: l_Size_500_0 (copy), v36 (copy)
        local v37 = UDim.new(0, l_Size_500_0);
        if v36 then
            return (UDim2.new(v37 + v36.left + v36.right, v37 + v36.top + v36.bottom));
        else
            return (UDim2.new(v37, v37));
        end;
    end, {
        l_Size_500_0, 
        v36
    });
    return l_withHoverTooltip_0({
        bodyText = l_tooltipText_0
    }, {
        disabled = not l_tooltipText_0 or false, 
        preferredOrientation = v10.Bottom, 
        guiTarget = l_tooltipTarget_0, 
        DEBUG_useTargetDirectly = v16._DEBUG_is_plugin, 
        DisplayOrder = 10
    }, function(v39, v40) --[[ Line: 108 ]]
        -- upvalues: v3 (ref), v38 (copy), l_anchorPoint_0 (copy), l_position_0 (copy), l_layoutOrder_0 (copy), v15 (copy), l_onMedia_0 (copy), l_Size_500_0 (copy), l_Tokens_0 (copy), v11 (ref), v33 (copy), v36 (copy), l_onActivated_0 (copy), l_Label_0 (ref), l_Medium_0 (copy), l_icon_0 (copy), v32 (copy), l_badgeValue_0 (copy), v12 (ref), v35 (copy), v34 (copy), l_badgeVariant_0 (copy), v16 (copy)
        return v3.createElement("Frame", {
            Selectable = false, 
            Size = v38, 
            AnchorPoint = l_anchorPoint_0, 
            Position = l_position_0, 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            LayoutOrder = l_layoutOrder_0, 
            [v3.Change.AbsoluteSize] = v39, 
            [v3.Change.AbsolutePosition] = v39, 
            ref = v15
        }, {
            Background = if l_onMedia_0 then v3.createElement("Frame", {
                Selectable = false, 
                Size = UDim2.fromOffset(l_Size_500_0, l_Size_500_0), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.fromScale(0.5, 0.5), 
                BorderSizePixel = 0, 
                BackgroundColor3 = l_Tokens_0.Global.Color.Black.Color3, 
                BackgroundTransparency = 0.5, 
                ZIndex = 1
            }, {
                UICorner = v3.createElement("UICorner", {
                    CornerRadius = UDim.new(0, l_Tokens_0.Semantic.Radius.Circle)
                })
            }) else nil, 
            StateLayer = v3.createElement(v11, {
                size = UDim2.fromOffset(l_Size_500_0, l_Size_500_0), 
                anchorPoint = Vector2.new(0.5, 0.5), 
                position = UDim2.fromScale(0.5, 0.5), 
                cornerRadius = UDim.new(0, l_Tokens_0.Semantic.Radius.Circle), 
                zIndex = 2, 
                stateStyle = v33, 
                outset = v36, 
                onStateChanged = v40, 
                onActivated = l_onActivated_0
            }), 
            Icon = v3.createElement(l_Label_0, {
                Selectable = false, 
                Size = UDim2.fromOffset(l_Medium_0, l_Medium_0), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.fromScale(0.5, 0.5), 
                Image = l_icon_0, 
                ImageColor3 = v32.Color3, 
                ImageTransparency = v32.Transparency, 
                BackgroundTransparency = 1, 
                ZIndex = 3
            }, {
                UICorner = v3.createElement("UICorner", {
                    CornerRadius = UDim.new(0, l_Tokens_0.Semantic.Radius.Circle)
                }), 
                Badge = if l_badgeValue_0 then v3.createElement(v12, {
                    position = v35, 
                    anchorPoint = v34, 
                    value = l_badgeValue_0, 
                    badgeVariant = l_badgeVariant_0
                }) else nil
            }, v16.children)
        });
    end);
end);