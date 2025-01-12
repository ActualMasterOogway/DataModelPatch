local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_t_0 = v1.t;
local l_Roact_0 = v1.Roact;
local l_UIBlox_0 = v1.UIBlox;
local l_withLocalization_0 = v1.withLocalization;
local l_Tooltip_0 = l_UIBlox_0.App.Dialog.Tooltip;
local l_TooltipOrientation_0 = l_UIBlox_0.App.Dialog.Enum.TooltipOrientation;
local v8 = require(l_Parent_0.Common.TextKeys);
local v9 = l_Roact_0.PureComponent:extend("FindFriendsHint");
v9.defaultProps = {
    tileHeight = 100
};
v9.validateProps = l_t_0.strictInterface({
    layoutOrder = l_t_0.number, 
    tileHeight = l_t_0.number, 
    onDidMount = l_t_0.optional(l_t_0.callback)
});
v9.didMount = function(v10) --[[ Line: 35 ]] --[[ Name: didMount ]]
    local l_props_0 = v10.props;
    if l_props_0.onDidMount then
        l_props_0.onDidMount();
    end;
end;
v9.render = function(v12) --[[ Line: 43 ]] --[[ Name: render ]]
    -- upvalues: l_withLocalization_0 (copy), v8 (copy), l_Roact_0 (copy), l_Tooltip_0 (copy), l_TooltipOrientation_0 (copy)
    local l_props_1 = v12.props;
    return l_withLocalization_0({
        findFriendsTitle = v8.FindFriendsTitle, 
        findFriendsBody = v8.FindFriendsBody
    })(function(v14) --[[ Line: 49 ]]
        -- upvalues: l_Roact_0 (ref), l_props_1 (copy), l_Tooltip_0 (ref), l_TooltipOrientation_0 (ref)
        return l_Roact_0.createElement("Frame", {
            Size = UDim2.new(0, 250, 1, 0), 
            LayoutOrder = l_props_1.layoutOrder, 
            BackgroundTransparency = 1
        }, {
            HintFrame = l_Roact_0.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 0), 
                BackgroundTransparency = 1
            }, {
                Tooltip = l_Roact_0.createElement(l_Tooltip_0, {
                    triggerPosition = Vector2.new(0, l_props_1.tileHeight), 
                    triggerSize = Vector2.new(-12, l_props_1.tileHeight), 
                    bodyText = v14.findFriendsBody, 
                    headerText = v14.findFriendsTitle, 
                    orientation = l_TooltipOrientation_0.Right, 
                    forceClickTriggerPoint = true, 
                    isDirectChild = true
                })
            })
        });
    end);
end;
return v9;