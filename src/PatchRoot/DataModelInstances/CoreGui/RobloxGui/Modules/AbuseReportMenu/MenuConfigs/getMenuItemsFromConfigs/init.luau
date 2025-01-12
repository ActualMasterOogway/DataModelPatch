local l_script_FirstAncestor_0 = script:FindFirstAncestor("AbuseReportMenu");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.UIBlox);
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local v5 = require(l_script_FirstAncestor_0.Components.MenuItems.DropdownReportMenuItem);
local v6 = require(l_script_FirstAncestor_0.Components.MenuItems.ButtonReportMenuItem);
local v7 = require(l_script_FirstAncestor_0.Components.MenuItems.FreeCommentsMenuItem);
local v8 = require(l_script_FirstAncestor_0.Components.MenuItems.ModalBasedSelectorMenuItem);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v10 = require(l_script_FirstAncestor_0.Utility.getMenuItemSizings);
local v11 = require(l_script_FirstAncestor_0.Components.Constants);
local l_Button_0 = v3.App.Button.Button;
local l_ButtonType_0 = v3.App.Button.Enum.ButtonType;
local l_Images_0 = v3.App.ImageSet.Images;
return function(v15, v16, v17, v18, v19) --[[ Line: 19 ]] --[[ Name: getMenuItemsFromConfigs ]]
    -- upvalues: v10 (copy), l_useLocalization_0 (copy), v11 (copy), v2 (copy), v7 (copy), v6 (copy), l_Button_0 (copy), l_ButtonType_0 (copy), l_Images_0 (copy), v5 (copy), v8 (copy)
    local v20 = v10();
    local v21 = {};
    local v22 = l_useLocalization_0(v11.localizationKeys);
    for v23, v24 in v18 do
        if v24.getIsVisible(v15) then
            local l_componentType_0 = v24.componentType;
            local l_componentName_0 = v24.componentName;
            if l_componentType_0 ~= "generic" then
                if l_componentType_0 == "freeComments" then
                    v21[l_componentName_0] = v2.createElement(v7, {
                        layoutOrder = v23, 
                        comment = v15.comment, 
                        placeholderText = v22.ReportCommentPlaceholder, 
                        menuContainerWidth = v17.menuWidth, 
                        isSmallPortraitViewport = v19, 
                        onUpdate = function(v27) --[[ Line: 43 ]] --[[ Name: onUpdate ]]
                            -- upvalues: v24 (copy), v15 (copy), v16 (copy), v17 (copy)
                            v24.onUpdate(v27, v15, v16, v17);
                        end
                    });
                elseif l_componentType_0 == "button" then
                    local v28 = v24.getIconSrc(v17);
                    v21[l_componentName_0] = v2.createElement(v6, {
                        label = if v24.fieldLabel == "" then v24.fieldLabel else v22[v24.fieldLabel], 
                        button = v2.createElement(l_Button_0, {
                            buttonType = if v24.variant == "primary" then l_ButtonType_0.PrimarySystem else l_ButtonType_0.Secondary, 
                            text = v22[v24.getButtonLabel(v17)], 
                            size = UDim2.new(1, 0, 0, v20.ButtonSize), 
                            fontStyle = v20.FontStyle, 
                            icon = if v28 ~= "" then l_Images_0[v28] else nil, 
                            isDisabled = v24.getIsDisabled ~= nil and v24.getIsDisabled(v15, v17), 
                            onActivated = function() --[[ Line: 63 ]] --[[ Name: onActivated ]]
                                -- upvalues: v24 (copy), v15 (copy), v16 (copy), v17 (copy)
                                v24.onClick(v15, v16, v17);
                            end
                        }), 
                        menuContainerWidth = v17.menuWidth, 
                        layoutOrder = v23, 
                        isSmallPortraitViewport = v19
                    });
                elseif l_componentType_0 == "dropdown" then
                    v21[l_componentName_0] = v2.createElement(v5, {
                        label = v22[v24.fieldLabel], 
                        placeholderText = v22.ChooseOne, 
                        layoutOrder = v23, 
                        onSelect = function(v29) --[[ Line: 76 ]] --[[ Name: onSelect ]]
                            -- upvalues: v24 (copy), v15 (copy), v16 (copy), v17 (copy)
                            v24.onUpdateSelectedOption(v29, v15, v16, v17);
                        end, 
                        menuContainerWidth = v17.menuWidth, 
                        readonlyValue = v22[v24.readonlyValue], 
                        selections = v24.getMenuItems(v15), 
                        isSmallPortraitViewport = v19, 
                        minHeight = v19 and 0 or v11.MenuItemHeight
                    });
                elseif l_componentType_0 == "modalSelector" then
                    v21[l_componentName_0] = v2.createElement(v8, {
                        label = v22[v24.fieldLabel], 
                        layoutOrder = v23, 
                        onSelect = function(v30, v31, v32) --[[ Line: 89 ]] --[[ Name: onSelect ]]
                            -- upvalues: v24 (copy), v15 (copy), v16 (copy), v17 (copy)
                            local v33 = {
                                label = v30, 
                                subLabel = v31, 
                                identifier = v32
                            };
                            v24.onUpdateSelectedOption(v33, v15, v16, v17);
                        end, 
                        menuContainerWidth = v17.menuWidth, 
                        selectorHeight = v11.MenuItemHeight, 
                        selectedValue = if v24.getSelectedValue then v22[v24.getSelectedValue(v15)] or v24.getSelectedValue(v15) or nil else nil, 
                        selections = v24.getMenuItems(v15, v22), 
                        viewportHeight = v17.viewportDimension.height, 
                        viewportWidth = v17.viewportDimension.width, 
                        isSmallPortraitViewport = v19, 
                        placeholderText = v22.ChooseOne
                    });
                end;
            end;
        end;
    end;
    return v21;
end;