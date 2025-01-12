local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.InGameMenuDependencies);
local l_Roact_0 = v2.Roact;
local l_RoactRodux_0 = v2.RoactRodux;
local l_t_0 = v2.t;
local l_UIBlox_0 = v2.UIBlox;
local l_Parent_0 = script.Parent.Parent;
local v8 = require(l_Parent_0.Localization.withLocalization);
local v9 = require(l_Parent_0.Actions.SetMenuIconTooltipOpen);
local v10 = require(l_Parent_0.Parent.TopBar.Constants);
local l_Tooltip_0 = l_UIBlox_0.App.Dialog.Tooltip;
local v12 = Vector2.new(v10.ScreenSideOffset, v10.TopBarHeight - 32);
local v13 = l_Roact_0.PureComponent:extend("MenuIconTooltip");
v13.validateProps = l_t_0.strictInterface({
    isTooltipOpen = l_t_0.boolean, 
    onDismiss = l_t_0.callback
});
v13.render = function(v14) --[[ Line: 26 ]] --[[ Name: render ]]
    -- upvalues: v8 (copy), l_Roact_0 (copy), l_CoreGui_0 (copy), l_Tooltip_0 (copy), v12 (copy)
    return v8({
        bodyText = "CoreScripts.InGameMenu.EducationalPopup.MenuIconTooltip"
    })(function(v15) --[[ Line: 29 ]]
        -- upvalues: v14 (copy), l_Roact_0 (ref), l_CoreGui_0 (ref), l_Tooltip_0 (ref), v12 (ref)
        return v14.props.isTooltipOpen and l_Roact_0.createElement(l_Roact_0.Portal, {
            target = l_CoreGui_0
        }, {
            TooltipScreenGui = l_Roact_0.createElement("ScreenGui", {
                IgnoreGuiInset = true, 
                ZIndexBehavior = Enum.ZIndexBehavior.Sibling
            }, {
                Tooltip = l_Roact_0.createElement(l_Tooltip_0, {
                    triggerPosition = v12, 
                    triggerSize = Vector2.new(32, 32), 
                    bodyText = v15.bodyText, 
                    onDismiss = v14.props.onDismiss, 
                    forceClickTriggerPoint = true
                })
            })
        });
    end);
end;
return l_RoactRodux_0.UNSTABLE_connect2(function(v16, _) --[[ Line: 51 ]]
    return {
        isTooltipOpen = v16.nativeClosePrompt.menuIconTooltipOpen
    };
end, function(v18) --[[ Line: 55 ]]
    -- upvalues: v9 (copy)
    return {
        onDismiss = function() --[[ Line: 57 ]] --[[ Name: onDismiss ]]
            -- upvalues: v18 (copy), v9 (ref)
            v18(v9(false));
        end
    };
end)(v13);