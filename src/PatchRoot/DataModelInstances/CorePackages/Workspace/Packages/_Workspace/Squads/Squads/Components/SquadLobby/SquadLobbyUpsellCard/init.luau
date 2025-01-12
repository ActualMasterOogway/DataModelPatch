local l_script_FirstAncestor_0 = script:FindFirstAncestor("Squads");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_Foundation_0 = v1.Foundation;
local l_React_0 = v1.React;
local l_dependencyArray_0 = v1.Hooks.dependencyArray;
local l_useTokens_0 = l_Foundation_0.Hooks.useTokens;
local l_useLocalization_0 = v1.Hooks.useLocalization;
return function(v7) --[[ Line: 18 ]]
    -- upvalues: l_useTokens_0 (copy), l_useLocalization_0 (copy), l_React_0 (copy), l_Foundation_0 (copy), l_dependencyArray_0 (copy)
    local v8 = l_useTokens_0();
    local v9 = l_useLocalization_0({
        upsellText = "Feature.Squads.Description.UpsellMessage"
    });
    local v10 = l_React_0.useMemo(function() --[[ Line: 25 ]]
        -- upvalues: l_React_0 (ref), l_Foundation_0 (ref), v8 (copy), v9 (copy)
        return l_React_0.createElement(l_Foundation_0.Text, {
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.fromScale(1, 0), 
            fontStyle = v8.Typography.BodyLarge, 
            LayoutOrder = 1, 
            Text = v9.upsellText, 
            textStyle = v8.Color.Content.Default, 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextWrapped = true
        });
    end, l_dependencyArray_0(v8, v9.upsellText));
    return l_React_0.createElement("Frame", {
        Size = v7.size, 
        BackgroundTransparency = 1, 
        LayoutOrder = v7.layoutOrder
    }, {
        l_React_0.createElement(l_Foundation_0.View, {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.fromScale(0.5, 0.5), 
            Size = UDim2.new(1, -2 * v8.Stroke.Standard, 1, -2 * v8.Stroke.Standard), 
            cornerRadius = UDim.new(0, v8.Radius.Medium), 
            padding = v8.Padding.XXLarge, 
            layout = {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                Padding = UDim.new(0, v8.Gap.XXLarge), 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }, 
            stroke = {
                Color = v8.Color.Stroke.Default.Color3, 
                Transparency = v8.Color.Stroke.Default.Transparency, 
                Thickness = v8.Stroke.Standard
            }
        }, {
            UpsellLabel = v10
        })
    });
end;