local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Cryo);
local v3 = require(l_Parent_1.React);
local l_Label_0 = require(l_Parent_0.Core.ImageSet.ImageSetComponent).Label;
local v5 = require(l_Parent_0.Core.Text.GenericTextLabel.GenericTextLabel);
local v6 = require(l_Parent_0.Core.Style.useStyle);
local _ = require(l_Parent_0.App.Style.StyleTypes);
local _ = require(l_Parent_0.App.Style.Fonts);
local v9 = {
    size = UDim2.fromScale(1, 1), 
    faceGroupCount = 3, 
    maxBadgeDisplayNumber = 99, 
    styleProps = {}, 
    showEmphasisBorder = false
};
local v10 = {
    containerGap = 6, 
    faceGroupGap = -9, 
    faceBorderWidth = 3, 
    faceBorderRadius = 50, 
    faceWidth = 24, 
    faceHeight = 24, 
    badgeBorderWidth = 3, 
    badgeBorderRadius = 50, 
    badgeSpacingLeading = 9, 
    badgeSpacingTrailing = 9, 
    badgeHeight = 24
};
local function _(v11) --[[ Line: 135 ]] --[[ Name: getAvatarImage ]]
    return string.format("rbxthumb://type=AvatarHeadShot&id=%s&w=150&h=150", (tostring(v11)));
end;
local function v14(v13) --[[ Line: 139 ]] --[[ Name: renderCornerStroke ]]
    -- upvalues: v3 (copy)
    return v3.createElement(v3.Fragment, nil, {
        Corner = v3.createElement("UICorner", {
            CornerRadius = UDim.new(0, v13.borderRadius)
        }), 
        Stroke = v3.createElement("UIStroke", {
            ApplyStrokeMode = Enum.ApplyStrokeMode.Border, 
            Color = v13.borderColor.Color, 
            Transparency = v13.borderColor.Transparency, 
            Thickness = v13.borderWidth
        })
    });
end;
local function v22(v15, v16, v17, v18) --[[ Line: 153 ]] --[[ Name: renderEmphasisBorder ]]
    -- upvalues: v3 (copy), v14 (copy)
    local l_Theme_0 = v17.Theme;
    local v20 = v15 - 1;
    local v21 = (1 - v15) / 2;
    return v3.createElement("Frame", {
        BackgroundTransparency = 1, 
        Position = UDim2.new(0, v21, 0, v21), 
        Size = UDim2.new(1, v20, 1, v20), 
        ZIndex = v18
    }, {
        v14({
            borderWidth = 1, 
            borderColor = l_Theme_0.ContextualPrimaryDefault, 
            borderRadius = v16.badgeBorderRadius
        })
    });
end;
local function v38(v23, v24, v25) --[[ Line: 176 ]] --[[ Name: renderBadge ]]
    -- upvalues: v3 (copy), v14 (copy), v22 (copy)
    local v26 = nil;
    v26 = if v23.usersCount > v23.maxDisplayNumber then tostring(v23.maxDisplayNumber) .. "+" else tostring(v23.usersCount);
    local l_Theme_1 = v25.Theme;
    local l_Font_0 = v25.Font;
    local v29 = v24.badgeBackgroundColor or l_Theme_1.BackgroundUIDefault;
    local l_badgeBorderWidth_0 = v24.badgeBorderWidth;
    local v31 = v24.badgeBorderColor or v25.Theme.BackgroundDefault;
    local l_badgeBorderRadius_0 = v24.badgeBorderRadius;
    local l_badgeSpacingLeading_0 = v24.badgeSpacingLeading;
    local l_badgeSpacingTrailing_0 = v24.badgeSpacingTrailing;
    local l_badgeHeight_0 = v24.badgeHeight;
    local v36 = v24.badgeContentColor or l_Theme_1.TextMuted;
    local v37 = v3.createElement("Frame", {
        LayoutOrder = v23.layoutOrder, 
        ZIndex = v23.ZIndex, 
        Size = UDim2.fromOffset(0, l_badgeHeight_0), 
        BorderSizePixel = 0, 
        BackgroundColor3 = v29.Color, 
        BackgroundTransparency = v29.Transparency, 
        AutomaticSize = Enum.AutomaticSize.X
    }, {
        v14({
            borderWidth = l_badgeBorderWidth_0, 
            borderColor = v31, 
            borderRadius = l_badgeBorderRadius_0
        }); 
        SizeConstraint = v3.createElement("UISizeConstraint", {
            MinSize = Vector2.new(l_badgeHeight_0, 0)
        }), 
        Content = v3.createElement("TextLabel", {
            Size = UDim2.fromScale(1, 1), 
            BorderSizePixel = 0, 
            Text = v26, 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            Font = l_Font_0.CaptionHeader.Font, 
            TextSize = l_Font_0.BaseSize * l_Font_0.CaptionHeader.RelativeSize, 
            TextColor3 = v36.Color, 
            TextTransparency = v36.Transparency, 
            BackgroundTransparency = 1, 
            AutomaticSize = Enum.AutomaticSize.X, 
            ZIndex = v23.ZIndex + 1
        }, {
            Padding = v3.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, l_badgeSpacingLeading_0), 
                PaddingRight = UDim.new(0, l_badgeSpacingTrailing_0)
            })
        })
    });
    return v3.createElement("Frame", {
        LayoutOrder = v23.layoutOrder, 
        ZIndex = v23.ZIndex, 
        Size = UDim2.fromOffset(0, l_badgeHeight_0), 
        BorderSizePixel = 0, 
        BackgroundColor3 = v29.Color, 
        BackgroundTransparency = 1, 
        AutomaticSize = Enum.AutomaticSize.X
    }, {
        BadgeContainer = v37, 
        emphasisBorder = if v23.showEmphasisBorder then v22(l_badgeBorderWidth_0, v24, v25, v23.ZIndex + 1) else nil
    });
end;
local function v52(v39, v40, v41) --[[ Line: 250 ]] --[[ Name: renderFaceImage ]]
    -- upvalues: v3 (copy), l_Label_0 (copy), v14 (copy), v22 (copy)
    local v42 = v40.faceBackgroundColor or v41.Theme.TextDefault;
    local l_faceBorderWidth_0 = v40.faceBorderWidth;
    local v44 = v40.faceBorderColor or v41.Theme.BackgroundDefault;
    local l_faceBorderRadius_0 = v40.faceBorderRadius;
    local l_faceWidth_0 = v40.faceWidth;
    local l_faceHeight_0 = v40.faceHeight;
    local l_createElement_0 = v3.createElement;
    local l_l_Label_0_0 = l_Label_0;
    local v50 = {
        LayoutOrder = v39.layoutOrder, 
        ZIndex = v39.ZIndex, 
        Size = UDim2.fromOffset(l_faceWidth_0, l_faceHeight_0)
    };
    local l_user_0 = v39.user;
    v50.Image = string.format("rbxthumb://type=AvatarHeadShot&id=%s&w=150&h=150", (tostring(l_user_0)));
    v50.BackgroundColor3 = v42.Color;
    v50.BackgroundTransparency = v42.Transparency;
    v50.BorderSizePixel = 0;
    return l_createElement_0(l_l_Label_0_0, v50, {
        v14({
            borderWidth = l_faceBorderWidth_0, 
            borderColor = v44, 
            borderRadius = l_faceBorderRadius_0
        }); 
        emphasisBorder = if v39.showEmphasisBorder then v22(l_faceBorderWidth_0, v40, v41, v39.ZIndex + 1) else nil
    });
end;
local function v66(v53, v54, v55, v56, v57, v58) --[[ Line: 277 ]] --[[ Name: renderFaces ]]
    -- upvalues: v3 (copy), v38 (copy), v52 (copy)
    local l_users_0 = v53.users;
    local l_faceGroupGap_0 = v54.faceGroupGap;
    local l_badgeBorderWidth_1 = v54.badgeBorderWidth;
    local l_faceBorderWidth_1 = v54.faceBorderWidth;
    local v63 = math.max(l_badgeBorderWidth_1, l_faceBorderWidth_1);
    local v64 = {
        ListLayout = v3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, l_faceGroupGap_0)
        }), 
        Padding = v3.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, l_badgeBorderWidth_1), 
            PaddingTop = UDim.new(0, v63), 
            PaddingRight = UDim.new(0, l_faceBorderWidth_1), 
            PaddingBottom = UDim.new(0, v63)
        }), 
        Badge = if v57 then v38({
            usersCount = #l_users_0, 
            layoutOrder = 0, 
            ZIndex = v56 + 1, 
            maxDisplayNumber = v53.maxBadgeDisplayNumber, 
            showEmphasisBorder = v53.showEmphasisBorder
        }, v54, v55) else nil
    };
    for v65 = 1, math.min(v58, #l_users_0) do
        v64["Face_" .. v65] = v52({
            user = l_users_0[v65], 
            layoutOrder = v65, 
            ZIndex = v56 - v65, 
            showEmphasisBorder = v53.showEmphasisBorder
        }, v54, v55);
    end;
    return v3.createElement("Frame", {
        AutomaticSize = Enum.AutomaticSize.XY, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0
    }, v64);
end;
return function(v67) --[[ Line: 331 ]] --[[ Name: CoPlayFooter ]]
    -- upvalues: v2 (copy), v9 (copy), v6 (copy), v3 (copy), v10 (copy), v66 (copy), v5 (copy)
    local v68 = v2.Dictionary.join(v9, v67);
    if not v68.users or #v68.users == 0 then
        return nil;
    else
        local v69 = v6();
        local v70, v71 = v3.useBinding(Vector2.new(0, 0));
        local v72 = v2.Dictionary.join(v10, v68.styleProps);
        local l_containerGap_0 = v72.containerGap;
        local v74 = v72.labelContentColor or v69.Theme.TextMuted;
        local l_faceGroupCount_0 = v68.faceGroupCount;
        local v76 = #v68.users > l_faceGroupCount_0 + 1;
        if not v76 then
            l_faceGroupCount_0 = l_faceGroupCount_0 + 1;
        end;
        local v77 = l_faceGroupCount_0 + 1;
        local v79 = v3.useCallback(function(v78) --[[ Line: 352 ]]
            -- upvalues: v71 (copy)
            v71(v78.AbsoluteSize);
        end, {
            v71
        });
        return v3.createElement("Frame", {
            Size = v68.size, 
            Position = v68.position, 
            AnchorPoint = v68.anchorPoint, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            LayoutOrder = v68.layoutOrder
        }, {
            ListLayout = v3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                Padding = UDim.new(0, l_containerGap_0)
            }), 
            FacesFrame = v3.createElement("Frame", {
                LayoutOrder = 1, 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                AutomaticSize = Enum.AutomaticSize.XY, 
                [v3.Change.AbsoluteSize] = v79
            }, {
                Faces = v66(v68, v72, v69, v77, v76, l_faceGroupCount_0)
            }), 
            LabelFrame = if v68.labelText then v3.createElement("Frame", {
                LayoutOrder = 2, 
                Size = v70:map(function(v80) --[[ Line: 381 ]]
                    -- upvalues: l_containerGap_0 (copy)
                    return UDim2.new(1, -v80.X - l_containerGap_0, 1, 0);
                end), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0
            }, {
                Label = v3.createElement(v5, {
                    Size = UDim2.fromScale(1, 1), 
                    Text = v68.labelText, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextYAlignment = Enum.TextYAlignment.Center, 
                    TextTruncate = Enum.TextTruncate.AtEnd, 
                    TextWrapped = false, 
                    fontStyle = v72.fontStyle or v69.Font.CaptionBody, 
                    colorStyle = v74
                })
            }) else nil
        });
    end;
end;