local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local v4 = require(l_script_FirstAncestor_0.LuaAppNavigationContext);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useStyle_0 = v3.Core.Style.useStyle;
local v7 = require(script.Parent.Utils.getBoldTextTheme);
local v8 = require(l_script_FirstAncestor_0.Flags.getFFlagEnableAppChatPaddingConsistency);
local v9 = require(l_script_FirstAncestor_0.Utils.getAppChatCommunitiesVisualConfig);
local l_getFFlagCommunitiesUseVisualConfigUtil_0 = require(l_Parent_0.SharedFlags).getFFlagCommunitiesUseVisualConfigUtil;
local l_GetFFlagUseCommunitiesTranslation_0 = require(l_Parent_0.SharedFlags).GetFFlagUseCommunitiesTranslation;
local l_Images_0 = v3.App.ImageSet.Images;
local l_ImageSetLabel_0 = v3.Core.ImageSet.ImageSetLabel;
local l_IconSize_0 = v3.App.Constant.IconSize;
local v15 = l_Images_0["icons/navigation/pushRight"];
local v16 = l_Images_0["icons/menu/groups"];
ConversationGroupsEntry = function(v17) --[[ Line: 29 ]] --[[ Name: ConversationGroupsEntry ]]
    -- upvalues: l_useStyle_0 (copy), v2 (copy), v4 (copy), v7 (copy), l_getFFlagCommunitiesUseVisualConfigUtil_0 (copy), v9 (copy), l_useLocalization_0 (copy), l_GetFFlagUseCommunitiesTranslation_0 (copy), l_IconSize_0 (copy), v8 (copy), l_ImageSetLabel_0 (copy), l_Images_0 (copy), v16 (copy), v15 (copy)
    local v18 = l_useStyle_0();
    local v19 = v2.useContext(v4);
    local v20 = v7(v18);
    local v21 = if l_getFFlagCommunitiesUseVisualConfigUtil_0() then v9() else nil;
    local v22 = l_useLocalization_0({
        groupsText = if l_getFFlagCommunitiesUseVisualConfigUtil_0() then v21.label else l_GetFFlagUseCommunitiesTranslation_0() and "Feature.SocialTab.Label.Groups" or "CommonUI.Features.Label.sGroups", 
        createAndExploreGroupsText = "Feature.SocialTab.Label.CreateAndExploreGroups"
    });
    local l_groupsText_0 = v22.groupsText;
    local l_Font_0 = v20.Font.Header2.Font;
    local l_Transparency_0 = v20.Theme.TextEmphasis.Transparency;
    local l_Color_0 = v20.Theme.TextEmphasis.Color;
    local v27 = v20.Font.Header2.RelativeSize * v20.Font.BaseSize;
    local l_createAndExploreGroupsText_0 = v22.createAndExploreGroupsText;
    local l_Font_1 = v18.Font.CaptionBody.Font;
    local l_Transparency_1 = v18.Theme.TextDefault.Transparency;
    local l_Color_1 = v18.Theme.TextDefault.Color;
    local v32 = v18.Font.CaptionBody.RelativeSize * v18.Font.BaseSize;
    local v33 = l_IconSize_0.Regular + 12;
    local v34 = if v8() then 60 - (60 - l_IconSize_0.Regular) / 2 else 60;
    return v2.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, v17.entryHeight), 
        BackgroundColor3 = v18.Theme.BackgroundDefault.Color, 
        BackgroundTransparency = v18.Theme.BackgroundDefault.Transprency, 
        BorderSizePixel = 0
    }, {
        overlay = v2.createElement("ImageButton", {
            AutoButtonColor = false, 
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            [v2.Event.Activated] = v19.navigateToGroups
        }), 
        leftAlign = v2.createElement("Frame", {
            Size = UDim2.new(1, -v33, 1, 0), 
            BackgroundTransparency = 1
        }, {
            layout = v2.createElement("UIListLayout", {
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            iconHolder = v2.createElement("Frame", {
                Size = UDim2.new(0, v34, 1, 0), 
                BackgroundTransparency = 1, 
                LayoutOrder = 0
            }, {
                layout = v2.createElement("UIListLayout", {
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    HorizontalAlignment = if v8() then Enum.HorizontalAlignment.Left else Enum.HorizontalAlignment.Center
                }), 
                icon = v2.createElement(l_ImageSetLabel_0, {
                    BackgroundColor3 = v20.Theme.BackgroundUIDefault.Color, 
                    BackgroundTransparency = v20.Theme.BackgroundUIDefault.Transparency, 
                    BorderSizePixel = 0, 
                    Size = UDim2.new(0, l_IconSize_0.Regular, 0, l_IconSize_0.Regular), 
                    ScaleType = Enum.ScaleType.Stretch, 
                    Image = if l_getFFlagCommunitiesUseVisualConfigUtil_0() then l_Images_0[v21.icon] else v16, 
                    ImageColor3 = v18.Theme.IconEmphasis.Color, 
                    ImageTransparency = v18.Theme.IconEmphasis.Transparency
                }, {
                    corner = v2.createElement("UICorner", {
                        CornerRadius = UDim.new(0, 8)
                    })
                })
            }), 
            conversationInfo = v2.createElement("Frame", {
                Size = UDim2.new(1, -60, 1, 0), 
                BackgroundTransparency = 1, 
                LayoutOrder = 1
            }, {
                layout = v2.createElement("UIListLayout", {
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    FillDirection = Enum.FillDirection.Vertical, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, 2)
                }), 
                title = v2.createElement("TextLabel", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 0, v27), 
                    TextSize = v27, 
                    TextColor3 = l_Color_0, 
                    TextTransparency = l_Transparency_0, 
                    Font = l_Font_0, 
                    Text = l_groupsText_0 or "", 
                    TextTruncate = Enum.TextTruncate.AtEnd, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    LayoutOrder = 1
                }), 
                subTitle = v2.createElement("TextLabel", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 0, v32), 
                    TextSize = v32, 
                    TextColor3 = l_Color_1, 
                    TextTransparency = l_Transparency_1, 
                    Font = l_Font_1, 
                    Text = l_createAndExploreGroupsText_0, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextTruncate = Enum.TextTruncate.AtEnd, 
                    LayoutOrder = 2
                })
            })
        }), 
        rightAlign = v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1
        }, {
            layout = v2.createElement("UIListLayout", {
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            padding = v2.createElement("UIPadding", {
                PaddingRight = UDim.new(0, 12)
            }), 
            icon = v2.createElement(l_ImageSetLabel_0, {
                LayoutOrder = 0, 
                BackgroundTransparency = 1, 
                Size = UDim2.new(0, l_IconSize_0.Regular, 0, l_IconSize_0.Regular), 
                ScaleType = Enum.ScaleType.Stretch, 
                Image = v15, 
                ImageColor3 = v18.Theme.IconEmphasis.Color, 
                ImageTransparency = v18.Theme.IconEmphasis.Transparency
            })
        }), 
        divider = v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1
        }, {
            layout = v2.createElement("UIListLayout", {
                VerticalAlignment = Enum.VerticalAlignment.Bottom, 
                HorizontalAlignment = Enum.HorizontalAlignment.Right
            }), 
            divider = v2.createElement("Frame", {
                BackgroundTransparency = v18.Theme.Divider.Transparency, 
                BackgroundColor3 = v18.Theme.Divider.Color, 
                BorderSizePixel = 0, 
                Size = UDim2.new(1, -v34, 0, 1)
            })
        })
    });
end;
return ConversationGroupsEntry;