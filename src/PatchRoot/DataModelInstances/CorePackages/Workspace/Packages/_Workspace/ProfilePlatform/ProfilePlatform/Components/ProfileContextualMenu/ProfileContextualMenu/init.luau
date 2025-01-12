local l_Parent_0 = script:FindFirstAncestor("ProfilePlatform").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.UIBlox);
local l_MenuDirection_0 = v2.App.Menu.MenuDirection;
local l_ContextualMenu_0 = v2.App.Menu.ContextualMenu;
local v5 = {
    motorCallback = require(l_Parent_0.Otter).instant, 
    open = {
        targetValue = 1
    }, 
    close = {
        targetValue = 0
    }
};
return function(v6) --[[ Line: 31 ]] --[[ Name: ProfileContextualMenu ]]
    -- upvalues: l_MenuDirection_0 (copy), v1 (copy), l_ContextualMenu_0 (copy), v5 (copy)
    local v7 = if v6.screenSize.Y / 2 < v6.rootElementPosition.Y then l_MenuDirection_0.Up else l_MenuDirection_0.Down;
    local v8 = if v7 == l_MenuDirection_0.Up then -(v6.screenSize.Y - v6.rootElementPosition.Y) + -20 else v6.rootElementPosition.Y + 60;
    return v1.createElement(l_ContextualMenu_0, {
        buttonProps = v6.buttonProps, 
        open = true, 
        onDismiss = v6.onDismiss, 
        menuDirection = v7, 
        openPositionX = UDim.new(0, -125), 
        openPositionY = UDim.new(v7 == l_MenuDirection_0.Up and 1 or 0, v8), 
        screenSize = v6.screenSize, 
        closeBackgroundVisible = false, 
        motorOverrideOptions = v5
    });
end;