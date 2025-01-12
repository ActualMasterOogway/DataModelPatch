local l_script_FirstAncestor_0 = script:FindFirstAncestor("TenFootUiGlobalNav");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.UIBlox);
local v5 = require(l_Parent_0.Style);
local l_AppHeaderBar_0 = require(l_Parent_0.AppHeaderBar).AppHeaderBar;
local l_NavigationBar_0 = v4.App.Navigation.NavigationBar;
local l_NavigationTab_0 = v4.App.Navigation.NavigationTab;
local l_NavigationBarAlignment_0 = v4.App.Navigation.Enum.NavigationBarAlignment;
local l_NavigationTabLayout_0 = v4.App.Navigation.Enum.NavigationTabLayout;
local l_Placement_0 = v4.App.Navigation.Enum.Placement;
local l_UtilityActionIcon_0 = v4.App.Button.UtilityActionIcon;
local l_ControlState_0 = v4.Core.Control.Enum.ControlState;
local l_useDesignTokens_0 = v5.useDesignTokens;
local v15 = game:DefineFastFlag("LuaAppFix10ftGlobalNavAppHeaderBarSelection", false);
local _ = require(l_script_FirstAncestor_0.Components.GlobalNav.GlobalNav);
return (v3.forwardRef(function(v17, _) --[[ Line: 21 ]]
    -- upvalues: l_useDesignTokens_0 (copy), v3 (copy), l_NavigationTab_0 (copy), l_Placement_0 (copy), l_ControlState_0 (copy), l_NavigationTabLayout_0 (copy), l_NavigationBar_0 (copy), l_NavigationBarAlignment_0 (copy), v15 (copy), v2 (copy), l_UtilityActionIcon_0 (copy), l_AppHeaderBar_0 (copy)
    local l_tabGroupProps_0 = v17.tabGroupProps;
    local l_optionGroupProps_0 = v17.optionGroupProps;
    local v22 = l_useDesignTokens_0(function(v21) --[[ Line: 24 ]]
        return {
            safeAreaMargin = v21.Global.Space_800, 
            tabGroupHeight = v21.Global.Size_600, 
            tabLabelFontStyle = v21.Semantic.Typography.Header, 
            defaultSpacing = v21.Global.Size_400
        };
    end);
    local v23 = if l_tabGroupProps_0 and l_tabGroupProps_0.selection then l_tabGroupProps_0.selection[1] else nil;
    local v29 = v3.useCallback(function(v24, v25, _, v27) --[[ Line: 37 ]]
        -- upvalues: v3 (ref), l_NavigationTab_0 (ref), l_Placement_0 (ref), l_ControlState_0 (ref), v22 (copy), v23 (copy), l_NavigationTabLayout_0 (ref)
        return v3.createElement(l_NavigationTab_0, {
            iconImage = v24.icon, 
            renderIcon = v24.iconComponent ~= nil and function(v28) --[[ Line: 41 ]]
                -- upvalues: v3 (ref), v24 (copy), l_Placement_0 (ref), v25 (copy), l_ControlState_0 (ref)
                return v3.createElement(v24.iconComponent, {
                    placement = l_Placement_0.Bottom, 
                    selected = v28, 
                    pressed = v25 == l_ControlState_0.SelectedPressed, 
                    hovered = false
                });
            end or nil, 
            labelText = v24.title, 
            labelTypography = v22.tabLabelFontStyle, 
            hasLabel = true, 
            isChecked = v23 == v27, 
            layout = l_NavigationTabLayout_0.Inline, 
            onActivated = v24.onActivated
        }), {
            Size = UDim2.fromScale(0, 0), 
            AutomaticSize = Enum.AutomaticSize.XY, 
            BackgroundTransparency = 1, 
            Selectable = false
        };
    end, {
        v23, 
        v22
    });
    local v30 = v3.useCallback(function() --[[ Line: 66 ]]
        -- upvalues: v3 (ref), l_tabGroupProps_0 (copy), l_NavigationBar_0 (ref), l_NavigationBarAlignment_0 (ref), v22 (copy), v15 (ref), v23 (copy), v29 (copy)
        return v3.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            AutomaticSize = Enum.AutomaticSize.XY, 
            BackgroundTransparency = 1
        }, {
            TabGroup = if l_tabGroupProps_0 then v3.createElement(l_NavigationBar_0, {
                alignment = l_NavigationBarAlignment_0.Left, 
                size = UDim2.new(0, 0, 0, v22.tabGroupHeight), 
                selection = if v15 then v23 else l_tabGroupProps_0.selection, 
                items = l_tabGroupProps_0.items, 
                renderItem = v29, 
                spacing = UDim.new(0, v22.defaultSpacing), 
                paddings = if l_tabGroupProps_0.padding then {
                    Left = l_tabGroupProps_0.padding.left or 0, 
                    Top = l_tabGroupProps_0.padding.top or 0, 
                    Right = l_tabGroupProps_0.padding.right or 0, 
                    Bottom = l_tabGroupProps_0.padding.bottom or 0
                } else nil
            }) else nil
        });
    end, if v15 then {
        v29, 
        l_tabGroupProps_0, 
        v22, 
        v23
    } else {
        v29, 
        l_tabGroupProps_0, 
        v22
    });
    local v34 = v3.useCallback(function() --[[ Line: 99 ]]
        -- upvalues: v2 (ref), l_optionGroupProps_0 (copy), v3 (ref), l_UtilityActionIcon_0 (ref), v22 (copy)
        local v33 = v2.List.map(if l_optionGroupProps_0 then l_optionGroupProps_0.items else {}, function(v31, v32) --[[ Line: 102 ]]
            -- upvalues: v3 (ref), l_UtilityActionIcon_0 (ref)
            return v3.createElement(l_UtilityActionIcon_0, {
                icon = v31.icon, 
                tooltipText = v31.label, 
                layoutOrder = v32, 
                disableOutset = true, 
                onActivated = v31.onActivated
            });
        end);
        return v3.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            AutomaticSize = Enum.AutomaticSize.X, 
            BackgroundTransparency = 1
        }, v2.Dictionary.join({
            UILayout = v3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, v22.defaultSpacing)
            })
        }, v33));
    end, {
        l_optionGroupProps_0, 
        v22
    });
    return v3.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1
    }, {
        AppHeaderBarLayout = v3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            VerticalAlignment = Enum.VerticalAlignment.Center
        }), 
        AppHeaderBar = v3.createElement(l_AppHeaderBar_0, {
            automaticHeight = true, 
            renderNavigation = v30, 
            renderUtilities = v34, 
            paddingLeft = UDim.new(0, v22.safeAreaMargin), 
            paddingRight = UDim.new(0, v22.safeAreaMargin), 
            groupTransparencyLeft = {
                transparency = v17.animationProps.tabGroupTransparency, 
                guiObjectRef = v17.animationProps.tabGroupRef
            }, 
            groupTransparencyRight = {
                transparency = v17.animationProps.optionGroupTransparency, 
                guiObjectRef = v17.animationProps.optionGroupRef
            }, 
            onMedia = false, 
            backgroundStyle = {
                Color3 = Color3.new(0, 0, 0), 
                Transparency = 1
            }
        })
    });
end));