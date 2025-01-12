local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceSearch");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Components.SuggestedItem);
local v4 = require(l_script_FirstAncestor_0.Components.Divider);
return function(v5) --[[ Line: 20 ]] --[[ Name: SuggestedItemList ]]
    -- upvalues: v2 (copy), v3 (copy), v4 (copy)
    local v9 = v2.useMemo(function() --[[ Line: 21 ]]
        -- upvalues: v2 (ref), v5 (copy), v3 (ref), v4 (ref)
        local v6 = {
            Layout = v2.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical
            })
        };
        for v7, v8 in v5.items do
            v6[("SuggestedItem%*"):format(v7)] = v2.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.XY, 
                AnchorPoint = Vector2.new(0, 0), 
                Position = UDim2.new(0, 0, 0, 0), 
                BorderSizePixel = 0, 
                BackgroundTransparency = 1, 
                LayoutOrder = v7
            }, {
                ItemLayout = v2.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Vertical
                }), 
                Item = v2.createElement(v3, {
                    text = v8.text, 
                    type = v8.type, 
                    onActivate = v8.onActivate, 
                    onTrailingButtonActivate = v8.onRemove, 
                    layoutOrder = 0, 
                    ref = if v7 == 1 then v5.firstSuggestedItemRef else nil
                }), 
                Divider = if v7 < #v5.items then v2.createElement(v4, {
                    layoutOrder = 1
                }) else nil
            });
        end;
        return v6;
    end, {
        v5.items
    });
    return v2.createElement("ScrollingFrame", {
        BorderSizePixel = 0, 
        AutomaticCanvasSize = Enum.AutomaticSize.XY, 
        BackgroundTransparency = 1, 
        CanvasSize = UDim2.fromScale(1, 1), 
        ScrollBarThickness = 0, 
        ScrollingDirection = Enum.ScrollingDirection.Y, 
        Selectable = false, 
        Size = UDim2.fromScale(1, 1)
    }, v9);
end;