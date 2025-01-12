local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.UIBlox);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(script.Parent.OptionsEnum);
local v5 = require(script.Parent.OptionsConstants);
local v9 = {
    isIncoming = false, 
    handleEvent = function(_, _, _) --[[ Line: 14 ]] --[[ Name: handleEvent ]]

    end
};
Options = function(v10) --[[ Line: 26 ]] --[[ Name: Options ]]
    -- upvalues: v3 (copy), v9 (copy), v1 (copy), v4 (copy), v5 (copy), v2 (copy)
    local v11 = v3.Dictionary.union(v9, v10);
    local v12 = v1.useCallback(function() --[[ Line: 29 ]]
        -- upvalues: v11 (copy), v1 (ref), v4 (ref)
        v11.handleEvent(v1.Event.Activated, nil, v4.Reply);
    end, {
        v11.handleEvent
    });
    local v13 = v1.useCallback(function() --[[ Line: 33 ]]
        -- upvalues: v11 (copy), v1 (ref), v4 (ref)
        v11.handleEvent(v1.Event.Activated, nil, v4.MessageContextMenu);
    end, {
        v11.handleEvent
    });
    return v1.createElement("Frame", {
        BackgroundTransparency = 1, 
        LayoutOrder = v11.isIncoming and 2 or 1, 
        AutomaticSize = Enum.AutomaticSize.XY
    }, {
        UIListLayout = v1.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Horizontal, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            Padding = UDim.new(0, v5.INDIVIDUAL_ICON_HORIZONTAL_MARGIN)
        }), 
        Reply = v1.createElement(v2.App.Button.IconButton, {
            layoutOrder = v11.isIncoming and 1 or v5.NUM_DESKTOP_ICONS - 1, 
            icon = v2.App.ImageSet.Images["icons/placeholder/placeholderOff"], 
            iconSize = v2.App.ImageSet.Enum.IconSize.Small, 
            iconTransparency = 0, 
            onActivated = v12
        }), 
        MessageContextMenu = v1.createElement(v2.App.Button.IconButton, {
            layoutOrder = v11.isIncoming and 2 or v5.NUM_DESKTOP_ICONS - 2, 
            icon = v2.App.ImageSet.Images["icons/actions/overflow"], 
            iconSize = v2.App.ImageSet.Enum.IconSize.Small, 
            iconTransparency = 0, 
            onActivated = v13
        })
    });
end;
return v1.memo(Options);