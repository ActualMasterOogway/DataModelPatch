local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.React);
local v3 = require(l_Parent_1.Dash);
local l_useDesignTokens_0 = require(l_Parent_1.Style).useDesignTokens;
local v5 = require(l_Parent_1.UIBlox);
local l_BaseMenu_0 = v5.App.Menu.BaseMenu;
local l_Interactable_0 = v5.Core.Control.Interactable;
local v8 = require(script.Parent.PlayerContextualMenuHeader);
local v9 = require(l_Parent_0.Flags.FFlagSwitchCFMPositionFrameToTextButton);
local v10 = {
    width = UDim.new(1, 0)
};
return function(v11) --[[ Line: 30 ]]
    -- upvalues: v3 (copy), v10 (copy), l_useDesignTokens_0 (copy), v2 (copy), v8 (copy), v9 (copy), l_Interactable_0 (copy), l_BaseMenu_0 (copy)
    local v12 = v3.join(v10, v11);
    local v14 = l_useDesignTokens_0(function(v13) --[[ Line: 32 ]]
        return {
            overlayBackgroundColor3 = v13.Semantic.Color.Common.Overlay.Color3, 
            overlayBackgroundTransparency = v13.Semantic.Color.Common.Overlay.Transparency, 
            backgroundColor = v13.Semantic.Color.Background.Default.Color3, 
            backgroundTransparency = v13.Semantic.Color.Background.Default.Transparency, 
            menuCornerRadius = v13.Semantic.Radius.Medium
        };
    end);
    local v15, v16 = v2.useState(0);
    local v17 = v2.useCallback(function() --[[ Line: 44 ]]
        -- upvalues: v2 (ref), v8 (ref), v3 (ref), v12 (copy), v16 (copy)
        return v2.createElement(v8, v3.join(v12.headerProps, {
            onHeaderHeightChanged = v16
        }));
    end, {
        v12.headerProps
    });
    return v2.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundColor3 = v14.overlayBackgroundColor3, 
        BackgroundTransparency = v14.overlayBackgroundTransparency, 
        ZIndex = -1
    }, {
        PositionFrame = v2.createElement(v9 and "TextButton" or l_Interactable_0, {
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.new(v12.width, UDim.new(0, 0)), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            AutoButtonColor = false, 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            BackgroundTransparency = v14.backgroundTransparency, 
            BackgroundColor3 = v14.backgroundColor, 
            Text = v9 and "" or nil, 
            ZIndex = 0
        }, {
            Corner = v2.createElement("UICorner", {
                CornerRadius = UDim.new(0, v14.menuCornerRadius)
            }), 
            BaseMenu = v2.createElement(l_BaseMenu_0, {
                topElementRounded = false, 
                buttonProps = v12.buttonProps, 
                width = v12.width, 
                enableTokenOverride = true, 
                renderHeader = v17, 
                headerHeight = v15
            })
        })
    });
end;