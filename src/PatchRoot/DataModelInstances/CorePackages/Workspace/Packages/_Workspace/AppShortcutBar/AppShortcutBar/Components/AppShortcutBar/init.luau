local l_Parent_0 = script:FindFirstAncestor("AppShortcutBar").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Responsive);
local v3 = require(l_Parent_0.UIBlox);
local l_useFocusedTextBox_0 = require(l_Parent_0.FocusNavigationUtils).useFocusedTextBox;
local l_ShortcutBar_0 = v3.App.Navigation.ShortcutBar;
local l_FFlagEnableUniversalFocusNavigation_0 = require(l_Parent_0.SharedFlags).FFlagEnableUniversalFocusNavigation;
local v7 = game:DefineFastFlag("ShortcutBarMinSize", false);
AppShortcutBar = function(v8) --[[ Line: 21 ]] --[[ Name: AppShortcutBar ]]
    -- upvalues: l_FFlagEnableUniversalFocusNavigation_0 (copy), l_useFocusedTextBox_0 (copy), v7 (copy), v2 (copy), v1 (copy), l_ShortcutBar_0 (copy)
    local v9 = if l_FFlagEnableUniversalFocusNavigation_0 and v8.Position then v8.Position else UDim2.fromScale(0.5, 0);
    local v10 = if l_FFlagEnableUniversalFocusNavigation_0 and v8.AnchorPoint then v8.AnchorPoint else Vector2.new(0.5, 0);
    local v11 = l_useFocusedTextBox_0();
    local v12 = false;
    if #v8.items > 0 then
        v12 = not v11;
    end;
    if v7 then
        local v13 = not v2.useBreakpointXOrSmaller(v2.Keys.Small);
        local v14 = not v2.useBreakpointYOrSmaller(v2.Keys.XSmall);
        local v15 = v13 and v14;
        v12 = v12 and v15;
    end;
    return v1.createElement("Frame", {
        Position = UDim2.fromScale(0, 0), 
        Size = if v7 and v8.Size then v8.Size else UDim2.fromScale(1, 1), 
        BackgroundTransparency = 1
    }, if v12 then v1.createElement(l_ShortcutBar_0, {
        items = v8.items, 
        position = v9, 
        anchorPoint = v10
    }) else nil);
end;
return AppShortcutBar;