local l_Parent_0 = script:FindFirstAncestor("ExpChat").Parent;
local v1 = require(l_Parent_0.React);
local l_Localization_0 = require(l_Parent_0.RobloxAppLocales).Localization;
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_LocalizationProvider_0 = require(l_Parent_0.Localization).LocalizationProvider;
local l_ChatBoxContextMenu_0 = require(l_Parent_0.ChatLineReporting).ChatBoxContextMenu;
local l_Constants_0 = require(l_Parent_0.ChatLineReporting).Constants;
local v7 = require(l_Parent_0.UIBlox);
local l_IconButton_0 = v7.App.Button.IconButton;
local l_Images_0 = v7.App.ImageSet.Images;
return function(v10) --[[ Line: 16 ]]
    -- upvalues: v1 (copy), l_Localization_0 (copy), l_LocalizationService_0 (copy), l_Constants_0 (copy), l_IconButton_0 (copy), l_Images_0 (copy), l_LocalizationProvider_0 (copy), l_ChatBoxContextMenu_0 (copy)
    local v11, v12 = v1.useState(false);
    local v13 = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId);
    return v1.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, l_Constants_0.TopBannerSize), 
        BackgroundTransparency = 1
    }, {
        DotMenu = v1.createElement(l_IconButton_0, {
            size = UDim2.new(0, l_Constants_0.IconButtonSize, 0, l_Constants_0.IconButtonSize), 
            position = UDim2.new(1, l_Constants_0.IconButtonPositionXOffset, 0, l_Constants_0.IconButtonPositionYOffset), 
            icon = l_Images_0["icons/menu/more_off"], 
            showBackground = true, 
            backgroundTransparency = 1, 
            iconTransparency = v10.iconTransparency, 
            onActivated = function() --[[ Line: 36 ]] --[[ Name: onActivated ]]
                -- upvalues: v12 (copy), v10 (copy)
                v12(true);
                v10.onFocus();
            end
        }), 
        LocalizationProvider = v1.createElement(l_LocalizationProvider_0, {
            localization = v13
        }, {
            ContextMenu = if v11 then v1.createElement(l_ChatBoxContextMenu_0, {
                setContextMenuOpen = v12, 
                backgroundColor3 = v10.backgroundColor3, 
                backgroundTransparency = v10.backgroundTransparency, 
                onUnfocus = v10.onUnfocus, 
                messages = v10.messages
            }) else nil
        })
    });
end;