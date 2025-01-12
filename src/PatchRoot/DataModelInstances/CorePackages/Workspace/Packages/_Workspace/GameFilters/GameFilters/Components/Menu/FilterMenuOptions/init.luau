local l_Parent_0 = script:FindFirstAncestor("GameFilters").Parent;
local _ = require(l_Parent_0.DiscoveryTypes);
local v2 = require(l_Parent_0.Foundation);
local l_RadioGroup_0 = v2.RadioGroup;
local v4 = require(l_Parent_0.React);
local l_useTokens_0 = v2.Hooks.useTokens;
return function(v6) --[[ Line: 21 ]]
    -- upvalues: l_useTokens_0 (copy), v4 (copy), l_RadioGroup_0 (copy)
    local v7 = l_useTokens_0();
    local l_XXLarge_0 = v7.Padding.XXLarge;
    local v10 = {
        Padding = v4.createElement("UIPadding", {
            PaddingTop = UDim.new(0, v7.Padding.Medium), 
            PaddingBottom = UDim.new(0, v7.Padding.Medium)
        }), 
        SizeConstraint = v4.createElement("UISizeConstraint", {
            MaxSize = v6.containerMaxWidthBinding:map(function(v9) --[[ Line: 32 ]]
                -- upvalues: l_XXLarge_0 (copy)
                return Vector2.new(v9 - 3 * l_XXLarge_0, 1e999);
            end)
        })
    };
    for _, v12 in v6.options do
        table.insert(v10, v4.createElement(l_RadioGroup_0.Item, {
            value = v12.optionId, 
            label = v12.optionDisplayName
        }));
    end;
    return v4.createElement("ScrollingFrame", {
        AutomaticCanvasSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        CanvasSize = UDim2.fromScale(1, 0), 
        ClipsDescendants = true, 
        ElasticBehavior = Enum.ElasticBehavior.Always, 
        LayoutOrder = v6.LayoutOrder, 
        ScrollBarThickness = 0, 
        ScrollingDirection = Enum.ScrollingDirection.Y, 
        Selectable = false, 
        Size = v6.Size
    }, {
        MenuFrame = v4.createElement("Frame", {
            BackgroundTransparency = 1, 
            AutomaticSize = Enum.AutomaticSize.XY, 
            [v4.Change.AbsoluteSize] = function(v13) --[[ Line: 66 ]]
                -- upvalues: v6 (copy)
                v6.onCanvasSizeChanged(v13.AbsoluteSize);
            end
        }, {
            Padding = v4.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, l_XXLarge_0), 
                PaddingRight = UDim.new(0, l_XXLarge_0)
            }), 
            RadioGroup = v4.createElement(l_RadioGroup_0.Root, {
                value = v6.selectedOptionId, 
                onValueChanged = v6.onSelectedOptionChanged
            }, v10)
        })
    });
end;