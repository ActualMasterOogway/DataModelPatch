local l_Parent_0 = script:FindFirstAncestor("GenericAbuseReporting").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local l_Icon_0 = v2.Icon;
local l_Text_0 = v2.Text;
local l_View_0 = v2.View;
local l_ControlState_0 = v2.Enums.ControlState;
local l_IconSize_0 = v2.Enums.IconSize;
local l_useTokens_0 = v2.Hooks.useTokens;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
return function(v10) --[[ Line: 24 ]] --[[ Name: SideModalDropdown ]]
    -- upvalues: l_useTokens_0 (copy), v1 (copy), l_useLocalization_0 (copy), l_ControlState_0 (copy), l_View_0 (copy), l_Text_0 (copy), l_Icon_0 (copy), l_IconSize_0 (copy)
    local v11 = l_useTokens_0();
    local v12, v13 = v1.useState(false);
    local v14 = l_useLocalization_0({
        ChooseOne = "Feature.ReportAbuse.Label.ChooseOne"
    });
    local v16 = v1.useCallback(function(v15) --[[ Line: 31 ]]
        -- upvalues: l_ControlState_0 (ref), v13 (copy)
        if v15 == l_ControlState_0.Hover then
            v13(true);
            return;
        else
            v13(false);
            return;
        end;
    end, {
        v13
    });
    return v1.createElement(l_View_0, {
        Size = UDim2.new(1, 0, 0, 48), 
        tag = "radius-medium align-x-left align-y-center padding-xxsmall", 
        onStateChanged = v16, 
        onActivated = v10.onActivated
    }, {
        UIStroke = v1.createElement("UIStroke", {
            ApplyStrokeMode = Enum.ApplyStrokeMode.Border, 
            Color = v10.isDropdownError and v11.Color.System.Alert.Color3 or v11.Color.Content.Emphasis.Color3, 
            Transparency = if v12 then v11.Color.Content.Emphasis.Transparency else v11.Color.Content.Muted.Transparency, 
            Thickness = 1
        }), 
        UIListLayout = v1.createElement("UIListLayout", {
            HorizontalFlex = Enum.UIFlexAlignment.SpaceBetween, 
            FillDirection = Enum.FillDirection.Horizontal, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Center
        }), 
        Text = v1.createElement(l_Text_0, {
            Text = v10.text or v14.ChooseOne, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            Size = UDim2.new(1, -44, 1, 0), 
            tag = "text-truncate-split padding-left-small", 
            LayoutOrder = 0
        }), 
        IconContainer = v1.createElement(l_View_0, {
            tag = "auto-xy padding-right-small", 
            LayoutOrder = 1
        }, {
            Icon = v1.createElement(l_Icon_0, {
                name = "icons/navigation/cycleDown", 
                size = l_IconSize_0.Medium, 
                LayoutOrder = 1
            })
        })
    });
end;