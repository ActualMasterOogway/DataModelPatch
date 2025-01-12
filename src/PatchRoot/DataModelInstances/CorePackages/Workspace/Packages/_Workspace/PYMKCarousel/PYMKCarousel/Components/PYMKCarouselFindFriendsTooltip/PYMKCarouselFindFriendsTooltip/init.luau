local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_0.dependencies);
local l_React_0 = v2.React;
local l_UIBlox_0 = v2.UIBlox;
local l_useLocalization_0 = v2.Hooks.useLocalization;
local l_TooltipCallout_0 = l_UIBlox_0.App.Dialog.TooltipCallout;
local l_TooltipOrientation_0 = l_UIBlox_0.App.Dialog.Enum.TooltipOrientation;
local v8 = require(l_Parent_0.Common.TextKeys);
local l_FFlagLuaAppPYMKCollectionMigration_0 = require(l_Parent_1.SharedFlags).FFlagLuaAppPYMKCollectionMigration;
return function(v10) --[[ Line: 17 ]]
    -- upvalues: l_React_0 (copy), l_UIBlox_0 (copy), l_useLocalization_0 (copy), v8 (copy), l_TooltipOrientation_0 (copy), l_FFlagLuaAppPYMKCollectionMigration_0 (copy), l_TooltipCallout_0 (copy)
    local v11, v12 = l_React_0.useState(0);
    local v13 = l_UIBlox_0.Core.Style.useStyle();
    local v14 = l_useLocalization_0({
        findFriendsTitle = v8.FindFriendsTooltipTitle, 
        findFriendsBody = v8.FindFriendsTooltipBody
    });
    local v15 = {
        headerText = v14.findFriendsTitle, 
        bodyText = v14.findFriendsBody, 
        orientation = l_TooltipOrientation_0.Right, 
        distanceOffset = -12, 
        triggerPointCenter = Vector2.new(0, 50), 
        canvasBackground = v13.Theme.BackgroundDefault, 
        contentOffsetVector = Vector2.zero, 
        triggerPointRadius = Vector2.zero
    };
    return l_React_0.createElement("Frame", {
        LayoutOrder = if l_FFlagLuaAppPYMKCollectionMigration_0 then v10.LayoutOrder else nil, 
        AutomaticSize = Enum.AutomaticSize.XY, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        [l_React_0.Change.AbsoluteSize] = function(v16) --[[ Line: 44 ]]
            -- upvalues: v12 (copy)
            v12((math.max(0, v16.AbsoluteSize.Y - 100)));
        end, 
        Position = UDim2.new(0, 0, 0, v11)
    }, {
        Tooltip = l_React_0.createElement(l_TooltipCallout_0, v15)
    });
end;