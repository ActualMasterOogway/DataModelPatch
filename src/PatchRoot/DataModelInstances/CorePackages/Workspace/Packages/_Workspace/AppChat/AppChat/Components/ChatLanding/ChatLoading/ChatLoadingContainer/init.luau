local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Roact);
local v3 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatMakeBackgroundTransparent);
local l_withStyle_0 = require(l_Parent_0.UIBlox).Style.withStyle;
local v5 = require(script.Parent.ChatLoadingIndicator);
local v6 = v2.PureComponent:extend("ChatLoadingContainer");
v6.defaultProps = {
    topBarHeight = 0, 
    cellHeight = 64, 
    cellWidth = 375
};
v6.render = function(v7) --[[ Line: 18 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), v2 (copy), v3 (copy), v5 (copy)
    return l_withStyle_0(function(v8) --[[ Line: 19 ]]
        -- upvalues: v2 (ref), v3 (ref), v5 (ref), v7 (copy)
        return v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundColor3 = v8.Theme.BackgroundDefault.Color, 
            BackgroundTransparency = if v3() then v8.Tokens.Global.Color.None.Transparency else v8.Theme.BackgroundDefault.Transparency, 
            BorderSizePixel = 0, 
            ClipsDescendants = true
        }, {
            UIListLayout = v2.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                FillDirection = Enum.FillDirection.Vertical
            }), 
            ChatLoadingFrame = v2.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1, 
                LayoutOrder = 2
            }, {
                ChatLoadingIndicator = v2.createElement(v5, {
                    cellHeight = v7.props.cellHeight, 
                    cellWidth = v7.props.cellWidth
                })
            })
        });
    end);
end;
return v6;