local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppShortcutBar");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Components.AppShortcutBar);
local v4 = require(script.Parent.useAppShortcutBarProps);
AppShortcutBarContainer = function() --[[ Line: 7 ]] --[[ Name: AppShortcutBarContainer ]]
    -- upvalues: v4 (copy), v2 (copy), v3 (copy)
    local v5 = v4();
    return v2.createElement(v3, v5);
end;
return AppShortcutBarContainer;