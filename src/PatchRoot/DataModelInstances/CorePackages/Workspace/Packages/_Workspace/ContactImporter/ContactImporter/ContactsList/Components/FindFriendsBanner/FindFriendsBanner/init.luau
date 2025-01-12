local l_script_FirstAncestor_0 = script:FindFirstAncestor("ContactImporter");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_React_0 = v1.React;
local l_UIBlox_0 = v1.UIBlox;
local l_useLocalization_0 = v1.useLocalization;
local l_useStyle_0 = v1.useStyle;
local l_Button_0 = l_UIBlox_0.App.Button.Button;
local l_ButtonType_0 = l_UIBlox_0.App.Button.Enum.ButtonType;
local l_IconSize_0 = l_UIBlox_0.App.Constant.IconSize;
local l_StandardButtonSize_0 = l_UIBlox_0.App.Button.Enum.StandardButtonSize;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local l_ImageSetLabel_0 = l_UIBlox_0.Core.ImageSet.ImageSetLabel;
local l_StyledTextLabel_0 = l_UIBlox_0.App.Text.StyledTextLabel;
local v13 = require(l_script_FirstAncestor_0.Common.TextKeys);
local v14 = require(l_script_FirstAncestor_0.Flags.FFlagDisablePhoneVerificationForCI);
local v15 = require(l_script_FirstAncestor_0.Flags.DisablePhoneVerificationForCIIXP);
local v16 = l_Images_0["icons/graphic/contacts_large"];
return function(v17) --[[ Line: 32 ]] --[[ Name: FindFriendsBanner ]]
    -- upvalues: v15 (copy), l_useLocalization_0 (copy), v14 (copy), v13 (copy), l_useStyle_0 (copy), l_React_0 (copy), l_ImageSetLabel_0 (copy), l_IconSize_0 (copy), v16 (copy), l_StyledTextLabel_0 (copy), l_Button_0 (copy), l_ButtonType_0 (copy), l_StandardButtonSize_0 (copy)
    local l_openAmpUpsell_0 = v17.openAmpUpsell;
    local v19 = not v17.showMatchedContacts;
    local v20 = v19 and 122 or 0;
    local l_isUserInGreenFindFriendsButtonExperiment_0 = v17.isUserInGreenFindFriendsButtonExperiment;
    local v22 = v15.usePVUpsellV2({
        isExposureEnabled = true
    });
    local v23 = l_useLocalization_0({
        findFriendsButton = if v14 and v22 then v13.CONTACTS_FIND_FRIENDS_BUTTON_V2 else v13.CONTACTS_FIND_FRIENDS_BUTTON, 
        findFriendsDescription = if v14 and v22 then v13.CONTACTS_FIND_FRIENDS_DESCRIPTION_V2 else v13.CONTACTS_FIND_FRIENDS_DESCRIPTION, 
        findFriendsDescriptionPV = v13.CONTACTS_FIND_FRIENDS_DESCRIPTION_PV
    });
    local v24 = l_useStyle_0();
    return l_React_0.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 48), 
        BorderSizePixel = 0, 
        BackgroundTransparency = 1, 
        LayoutOrder = v17.layoutOrder
    }, {
        UIListLayout = l_React_0.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            Padding = UDim.new(0, 12)
        }), 
        ImageIcon = l_React_0.createElement(l_ImageSetLabel_0, {
            AnchorPoint = Vector2.new(0, 0.5), 
            Size = UDim2.new(0, l_IconSize_0.Large, 0, l_IconSize_0.Large), 
            ScaleType = Enum.ScaleType.Fit, 
            LayoutOrder = 1, 
            BackgroundTransparency = 1, 
            Image = v16, 
            ImageTransparency = v24.Theme.SystemPrimaryDefault.Transparency
        }), 
        TextFrame = l_React_0.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, -(v20 + 48 + 12), 0, 48), 
            LayoutOrder = 2
        }, {
            textLayout = l_React_0.createElement("UIListLayout", {
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }), 
            Description = l_React_0.createElement(l_StyledTextLabel_0, {
                text = if v19 then v23.findFriendsDescription else v23.findFriendsDescriptionPV, 
                fontStyle = v24.Font.CaptionBody, 
                colorStyle = v24.Theme.TextDefault, 
                size = UDim2.new(1, 0, 1, 0), 
                lineHeight = 1, 
                textTruncate = Enum.TextTruncate.AtEnd, 
                textXAlignment = Enum.TextXAlignment.Left, 
                textYAlignment = Enum.TextYAlignment.Center
            })
        }), 
        ButtonFrame = if v19 then l_React_0.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, 110, 0, 48), 
            AnchorPoint = Vector2.new(1, 0.5), 
            LayoutOrder = 3
        }, {
            ButtonLayout = l_React_0.createElement("UIListLayout", {
                HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }), 
            FindFriendsButton = l_React_0.createElement(l_Button_0, {
                buttonType = if l_isUserInGreenFindFriendsButtonExperiment_0 then l_ButtonType_0.PrimaryContextual else l_ButtonType_0.PrimarySystem, 
                standardSize = l_StandardButtonSize_0.XSmall, 
                fitContent = false, 
                text = v23.findFriendsButton, 
                onActivated = l_openAmpUpsell_0
            })
        }) else nil
    });
end;