local l_Parent_0 = script:FindFirstAncestor("GameTile").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.UIBlox);
local l_useStyle_0 = v2.Core.Style.useStyle;
local l_ImageSetLabel_0 = v2.Core.ImageSet.ImageSetLabel;
local l_StyledTextLabel_0 = v2.App.Text.StyledTextLabel;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v7 = require(l_Parent_0.UserLib);
local l_Constants_0 = v7.Utils.Constants;
local l_getRbxthumbWithTypeSizeAndOptions_0 = v7.Utils.getRbxthumbWithTypeSizeAndOptions;
local function v11(v10) --[[ Line: 24 ]]
    -- upvalues: v1 (copy)
    return v1.createElement(v1.Fragment, nil, {
        Corner = v1.createElement("UICorner", {
            CornerRadius = UDim.new(0, 8)
        }), 
        Border = v1.createElement("UIStroke", {
            ApplyStrokeMode = Enum.ApplyStrokeMode.Border, 
            Color = v10.Theme.BackgroundUIDefault.Color, 
            Transparency = v10.Theme.BackgroundUIDefault.Transparency, 
            Thickness = 2
        })
    });
end;
local function v20(v12, v13) --[[ Line: 38 ]]
    -- upvalues: l_getRbxthumbWithTypeSizeAndOptions_0 (copy), l_Constants_0 (copy), v1 (copy), l_ImageSetLabel_0 (copy), v11 (copy), l_StyledTextLabel_0 (copy)
    local v14 = {};
    if v12 then
        local v15 = 0;
        for _, v17 in pairs(v12) do
            v15 = v15 + 1;
            local v18 = tostring(v17);
            if v15 <= 3 then
                local v19 = l_getRbxthumbWithTypeSizeAndOptions_0(v18, l_Constants_0.RbxthumbTypes.AvatarHeadShot, 100);
                v14["mini_avatar_" .. v18] = v1.createElement(l_ImageSetLabel_0, {
                    AnchorPoint = Vector2.new(0, 0.5), 
                    Position = UDim2.new(0, v15 * 16 / 2, 0.5, 0), 
                    Size = UDim2.fromOffset(16, 16), 
                    BackgroundTransparency = 0, 
                    Image = v19, 
                    BackgroundColor3 = Color3.fromRGB(209, 209, 209), 
                    ZIndex = 4 - v15
                }, {
                    v11(v13)
                });
            end;
        end;
        v14.online_indicator = v1.createElement("Frame", {
            AnchorPoint = Vector2.new(0, 0.5), 
            Position = UDim2.new(0, 0, 0.5, 0), 
            Size = UDim2.fromOffset(14, 14), 
            BackgroundTransparency = 0, 
            BackgroundColor3 = Color3.fromRGB(0, 180, 109), 
            ZIndex = 4
        }, {
            v11(v13); 
            InExperienceCounter = v1.createElement(l_StyledTextLabel_0, {
                colorStyle = v13.Theme.TextEmphasis, 
                fontStyle = v13.Font.Footer, 
                textXAlignment = Enum.TextXAlignment.Center, 
                size = UDim2.fromScale(1, 1), 
                lineHeight = 1, 
                text = tostring(v15), 
                textTruncate = Enum.TextTruncate.None, 
                richText = false
            })
        });
        return v1.createElement("Frame", {
            Size = UDim2.fromScale(1, 1), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.fromScale(0.5, 0.5), 
            BackgroundTransparency = 1
        }, v14), v15;
    else
        return nil, nil;
    end;
end;
return function(v21) --[[ Line: 99 ]]
    -- upvalues: l_useStyle_0 (copy), v20 (copy), l_useLocalization_0 (copy), v1 (copy), l_StyledTextLabel_0 (copy)
    local v22 = l_useStyle_0();
    local l_Font_0 = v22.Font;
    local v24, v25 = v20(v21.friends, v22);
    local v26 = l_useLocalization_0({
        friendsText = "CommonUI.Features.Label.Friends"
    });
    return v1.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1
    }, {
        UIListLayout = v1.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 6)
        }), 
        PresenceList = v1.createElement("Frame", {
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Size = UDim2.new(0, 16 + math.min(3, v25 or 0) * 16 / 2, 0, 22), 
            LayoutOrder = 1
        }, {
            ActiveFriends = v24
        }), 
        FriendsLabel = v1.createElement(l_StyledTextLabel_0, {
            colorStyle = v22.Theme.TextMuted, 
            fontStyle = l_Font_0.CaptionHeader, 
            textXAlignment = Enum.TextXAlignment.Left, 
            size = UDim2.new(1, -40, 0, l_Font_0.BaseSize * l_Font_0.CaptionHeader.RelativeSize), 
            lineHeight = 1, 
            text = v26.friendsText, 
            textTruncate = Enum.TextTruncate.AtEnd, 
            richText = false, 
            layoutOrder = 2
        })
    });
end;