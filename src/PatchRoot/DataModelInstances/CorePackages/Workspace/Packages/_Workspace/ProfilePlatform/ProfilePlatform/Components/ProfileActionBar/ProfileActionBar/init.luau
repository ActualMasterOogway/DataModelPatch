local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.UIBlox);
local l_Button_0 = v4.App.Button.Button;
local l_IconButton_0 = v4.App.Button.IconButton;
local l_IconSize_0 = v4.App.ImageSet.Enum.IconSize;
local l_getIconSize_0 = v4.App.ImageSet.getIconSize;
local l_ButtonType_0 = v4.App.Button.Enum.ButtonType;
local l_HorizontalPageMargin_0 = v4.App.Container.HorizontalPageMargin;
local v11 = require(l_script_FirstAncestor_0.Components.ProfileActionBar.ProfileMoreButton);
local v12 = require(l_script_FirstAncestor_0.Common.Constants);
return function(v13) --[[ Line: 30 ]] --[[ Name: ProfileActionBar ]]
    -- upvalues: v2 (copy), v3 (copy), l_IconButton_0 (copy), l_IconSize_0 (copy), l_getIconSize_0 (copy), l_HorizontalPageMargin_0 (copy), v11 (copy), l_Button_0 (copy), l_ButtonType_0 (copy), v12 (copy)
    local l_profileActions_0 = v13.profileActions;
    local v15 = {
        UIListLayout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 4)
        })
    };
    local v17 = v2.useMemo(function() --[[ Line: 42 ]]
        -- upvalues: l_profileActions_0 (copy), v3 (ref), v15 (copy), v2 (ref), l_IconButton_0 (ref), l_IconSize_0 (ref)
        if l_profileActions_0.secondary then
            return v3.List.map(l_profileActions_0.secondary, function(v16) --[[ Line: 44 ]]
                -- upvalues: v15 (ref), v2 (ref), l_IconButton_0 (ref), l_IconSize_0 (ref)
                v15[v16] = v2.createElement(l_IconButton_0, {
                    iconSize = l_IconSize_0.Medium, 
                    icon = v16.icon, 
                    onActivated = v16.onActivated
                });
                return {};
            end);
        else
            return nil;
        end;
    end, {
        l_profileActions_0.secondary
    });
    local v18 = v13.openContextualMenu and 1 or 0;
    if v17 then
        v18 = v18 + #v17;
    end;
    local v19 = v18 * (l_getIconSize_0(l_IconSize_0.Medium) + 4 + 8);
    return v2.createElement(l_HorizontalPageMargin_0, {
        size = UDim2.fromScale(1, 0), 
        backgroundTransparency = 1, 
        layoutOrder = v13.layoutOrder, 
        useAutomaticSizing = true
    }, {
        ActionBar = v2.createElement("Frame", {
            Size = UDim2.fromScale(1, 1), 
            BackgroundTransparency = 1, 
            LayoutOrder = 0
        }, {
            UIListLayout = v2.createElement("UIListLayout", {
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 4)
            }), 
            MoreButton = if v13.openContextualMenu then v2.createElement(v11, {
                layoutOrder = 1, 
                onActivated = v13.openContextualMenu, 
                isSelected = v13.isContextualMenuOpen, 
                buttonRef = v13.moreButtonRef
            }) else nil, 
            SecondaryButtonFrame = if v17 then v2.createElement("Frame", {
                Size = UDim2.fromScale(0, 1), 
                AutomaticSize = Enum.AutomaticSize.X, 
                BackgroundTransparency = 1, 
                LayoutOrder = 2
            }, v15) else nil, 
            PrimaryCTAButton = if l_profileActions_0.primary then v2.createElement(l_Button_0, {
                layoutOrder = 3, 
                isLoading = l_profileActions_0.primary.isLoading, 
                isDisabled = l_profileActions_0.primary.isDisabled, 
                buttonType = if l_profileActions_0.primary.buttonType then l_profileActions_0.primary.buttonType else l_ButtonType_0.PrimarySystem, 
                size = UDim2.new(1, -v19, 0, v12.CTA_BUTTON_HEIGHT), 
                onActivated = l_profileActions_0.primary.onActivated, 
                text = l_profileActions_0.primary.text
            }) else nil
        })
    });
end;