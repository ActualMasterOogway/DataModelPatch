local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Cryo);
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local v4 = require(l_Parent_0.Localization);
local l_useStyle_0 = v3.Core.Style.useStyle;
local l_ControlState_0 = v3.Core.Control.Enum.ControlState;
local l_NavigationTab_0 = v3.App.Navigation.NavigationTab;
local l_NavigationTabLayout_0 = v3.App.Navigation.Enum.NavigationTabLayout;
local l_useLocalization_0 = v4.Hooks.useLocalization;
return v2.memo(function(v10) --[[ Line: 45 ]] --[[ Name: AppNavItem ]]
    -- upvalues: l_useStyle_0 (copy), l_useLocalization_0 (copy), v2 (copy), l_ControlState_0 (copy), l_NavigationTab_0 (copy), l_NavigationTabLayout_0 (copy)
    local l_Tokens_0 = l_useStyle_0().Tokens;
    local v12 = l_useLocalization_0({
        labelText = v10.item.labelText
    });
    local v13, v14 = v2.useState(l_ControlState_0.Initialize);
    local l_Footer_0 = l_Tokens_0.Semantic.Typography.Footer;
    local v16 = v10.systemBarLabelTextSizeBinding.default:getBinding();
    v2.useEffect(function() --[[ Line: 54 ]]
        -- upvalues: v10 (copy), v12 (copy), l_Footer_0 (copy), l_Tokens_0 (copy)
        v10.systemBarLabelTextSizeBinding.default:getMinTextSize(v12.labelText or "", l_Footer_0.Font, Vector2.new(l_Tokens_0.Global.Space_600, l_Tokens_0.Global.Space_600));
    end, {
        v16, 
        v12.labelText, 
        l_Tokens_0
    });
    return v2.createElement(l_NavigationTab_0, {
        iconImage = v10.item.iconImage, 
        iconCheckedImage = v10.item.iconCheckedImage, 
        renderIcon = v10.item.renderIcon and function(v17) --[[ Line: 66 ]]
            -- upvalues: v10 (copy), v13 (copy)
            return v10.item.renderIcon(v17, v13);
        end or nil, 
        hasLabel = v10.hasLabel, 
        labelText = v12.labelText, 
        labelTypography = {
            Font = l_Footer_0.Font, 
            FontSize = v16, 
            LineHeight = l_Footer_0.LineHeight, 
            LetterSpacing = l_Footer_0.LetterSpacing
        }, 
        isChecked = v10.isChecked, 
        badgeValue = v10.item.badgeValue, 
        layout = l_NavigationTabLayout_0.Stacked, 
        anchorPoint = if v10.isCenterPositioned then Vector2.new(0.5, 0.5) else nil, 
        position = if v10.isCenterPositioned then UDim2.fromScale(0.5, 0.5) else nil, 
        onActivated = v10.item.onActivated, 
        onStateChanged = v10.item.renderIcon and function(_, v19) --[[ Line: 85 ]]
            -- upvalues: v14 (copy)
            v14(v19);
        end or nil
    });
end, function(v20, v21) --[[ Line: 36 ]] --[[ Name: arePropsEqual ]]
    -- upvalues: v1 (copy)
    return v1.Dictionary.equals(v20.item, v21.item) and v20.systemBarLabelTextSizeBinding == v21.systemBarLabelTextSizeBinding and v20.isChecked == v21.isChecked and v20.isCenterPositioned == v21.isCenterPositioned and v20.hasLabel == v21.hasLabel;
end);