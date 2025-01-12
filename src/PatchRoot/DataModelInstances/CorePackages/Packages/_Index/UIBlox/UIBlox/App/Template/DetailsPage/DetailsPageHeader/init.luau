local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local l_Parent_3 = l_Parent_2.Parent;
local v4 = require(l_Parent_2.UIBloxConfig);
local v5 = require(l_Parent_2.Core.Style.withStyle);
local l_Label_0 = require(l_Parent_2.Core.ImageSet.ImageSetComponent).Label;
local v7 = require(l_Parent_2.App.ImageSet.Images);
local v8 = require(l_Parent_1.Loading.LoadableImage);
local v9 = require(l_Parent_1.Button.ActionBar);
local l_DeviceType_0 = require(l_Parent_1.Style.Constants).DeviceType;
local v11 = require(l_Parent_3.Roact);
local v12 = require(l_Parent_3.t);
local v13 = require(l_Parent_0.DetailsPageTitleContent);
local v14 = v11.PureComponent:extend("DetailsPageHeader");
v14.defaultProps = {
    thumbnailHeight = 200, 
    thumbnailAspectRatio = Vector2.new(1, 1), 
    actionBarHeight = 48, 
    actionBarWidth = 380
};
v14.validateProps = v12.strictInterface({
    thumbnailImageUrl = v12.optional(v12.string), 
    thumbnailAspectRatio = v12.optional(v12.Vector2), 
    thumbnailHeight = v12.optional(v12.number), 
    titleText = v12.optional(v12.string), 
    subTitleText = v12.optional(v12.string), 
    actionBarLabelText = v12.optional(v12.string), 
    renderInfoContent = v12.optional(v12.callback), 
    headerBarBackgroundHeight = v12.optional(v12.number), 
    sideMargin = v12.optional(v12.number), 
    itemPadding = v12.optional(v12.number), 
    bottomMargin = v12.optional(v12.number), 
    gradientHeight = v12.optional(v12.number), 
    thumbnailShadowHeight = v12.optional(v12.number), 
    actionBarHeight = v12.optional(v12.number), 
    actionBarWidth = v12.optional(v12.number), 
    actionBarProps = v12.optional(v9.validateProps), 
    deviceType = v12.optional(v12.string)
});
v14.renderThumbnail = function(v15, v16, v17, v18, v19) --[[ Line: 71 ]] --[[ Name: renderThumbnail ]]
    -- upvalues: v11 (copy), v8 (copy), l_Label_0 (copy), v7 (copy)
    return v11.createElement("Frame", {
        Size = UDim2.fromOffset(v18, v19), 
        LayoutOrder = 1, 
        AnchorPoint = Vector2.new(0, 1), 
        Position = UDim2.new(0, 0, 1, 0), 
        BackgroundTransparency = 1
    }, {
        ThumbnailTile = v11.createElement(v8, {
            cornerRadius = UDim.new(0, 8), 
            Size = UDim2.fromScale(1, 1), 
            Image = v15.props.thumbnailImageUrl
        }), 
        DropShadow = if v17 > 0 then v11.createElement(l_Label_0, {
            Size = UDim2.new(1, 0, 0, 28), 
            Position = UDim2.fromScale(0, 1), 
            BackgroundTransparency = 1, 
            Image = v7["component_assets/dropshadow_thumbnail_28"], 
            ImageColor3 = v16.Theme.DropShadow.Color, 
            ImageTransparency = v16.Theme.DropShadow.Transparency, 
            ScaleType = Enum.ScaleType.Slice, 
            SliceCenter = Rect.new(32, 0, 33, 28)
        }) else nil
    });
end;
v14.renderDesktopMode = function(v20, v21) --[[ Line: 99 ]] --[[ Name: renderDesktopMode ]]
    -- upvalues: v11 (copy), v4 (copy), v13 (copy), v9 (copy)
    local l_thumbnailHeight_0 = v20.props.thumbnailHeight;
    local v23 = l_thumbnailHeight_0 * (v20.props.thumbnailAspectRatio.X / v20.props.thumbnailAspectRatio.Y);
    local v24 = v20.props.sideMargin or 48;
    local v25 = v20.props.itemPadding or 24;
    local v26 = 28;
    if v20.props.thumbnailShadowHeight ~= nil then
        v26 = v20.props.thumbnailShadowHeight;
    end;
    return {
        Padding = v11.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, v24), 
            PaddingRight = UDim.new(0, v24), 
            PaddingBottom = UDim.new(0, 16)
        }), 
        Layout = v11.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Horizontal, 
            VerticalAlignment = Enum.VerticalAlignment.Bottom, 
            Padding = UDim.new(0, v25)
        }), 
        ThumbnailTileFrame = v20:renderThumbnail(v21, v26, v23, l_thumbnailHeight_0), 
        InfoFrame = v11.createElement("Frame", {
            Size = UDim2.new(1, -(v23 + v24 * 2), 1, 0), 
            BackgroundTransparency = 1, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            LayoutOrder = 2
        }, {
            Layout = v11.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical, 
                VerticalAlignment = Enum.VerticalAlignment.Top, 
                Padding = if v4.enableDetailsPageHeaderActionBarLabel then UDim.new(0, 16) else nil
            }), 
            TitleInfo = v11.createElement(v13, {
                titleText = v20.props.titleText, 
                subTitleText = v20.props.subTitleText, 
                renderInfoContent = v20.props.renderInfoContent, 
                verticalAlignment = Enum.VerticalAlignment.Top, 
                layoutOrder = 1
            }), 
            Padding = if v4.enableDetailsPageHeaderActionBarLabel then nil else v11.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 16), 
                BackgroundTransparency = 1, 
                LayoutOrder = 2
            }), 
            ActonBarFrame = v11.createElement("Frame", {
                Size = UDim2.fromOffset(v20.props.actionBarWidth, v20.props.actionBarHeight), 
                BackgroundTransparency = 1, 
                LayoutOrder = v4.enableDetailsPageHeaderActionBarLabel and 2 or 3
            }, {
                ActionBar = v20.props.actionBarProps and v11.createElement(v9, {
                    button = v20.props.actionBarProps.button, 
                    icons = v20.props.actionBarProps.icons, 
                    iconSize = v20.props.actionBarProps.iconSize, 
                    buttonHeight = v20.props.actionBarProps.buttonHeight, 
                    buttonPadding = v20.props.actionBarProps.buttonPadding, 
                    textButtons = v20.props.actionBarProps.textButtons, 
                    enableButtonAtStart = true, 
                    marginOverride = {
                        left = 0, 
                        right = 0, 
                        top = 0, 
                        bottom = 0
                    }, 
                    horizontalAlignment = Enum.HorizontalAlignment.Left
                }) or nil
            }), 
            ActionBarLabel = if v4.enableDetailsPageHeaderActionBarLabel and v20.props.actionBarLabelText then v11.createElement("TextLabel", {
                Size = UDim2.new(1, 0, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                Text = v20.props.actionBarLabelText, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextWrapped = true, 
                BackgroundTransparency = 1, 
                Font = v21.Tokens.Semantic.Typography.Body.Font, 
                TextSize = v21.Tokens.Semantic.Typography.Body.FontSize, 
                TextColor3 = v21.Tokens.Semantic.Color.Text.Emphasis.Color3, 
                TextTransparency = v21.Tokens.Semantic.Color.Text.Emphasis.Transparency, 
                LayoutOrder = 3
            }) else nil
        })
    };
end;
v14.renderisPhone = function(v27, v28) --[[ Line: 192 ]] --[[ Name: renderisPhone ]]
    -- upvalues: v11 (copy)
    local l_thumbnailHeight_1 = v27.props.thumbnailHeight;
    local v30 = l_thumbnailHeight_1 * (v27.props.thumbnailAspectRatio.X / v27.props.thumbnailAspectRatio.Y);
    local v31 = v27.props.sideMargin or 24;
    return {
        Padding = v11.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, v31), 
            PaddingRight = UDim.new(0, v31), 
            PaddingBottom = UDim.new(0, 16)
        }), 
        ThumbnailTileFrame = v27:renderThumbnail(v28, v30, l_thumbnailHeight_1)
    };
end;
v14.render = function(v32) --[[ Line: 207 ]] --[[ Name: render ]]
    -- upvalues: l_DeviceType_0 (copy), v5 (copy), v11 (copy)
    local v33 = v32.props.deviceType == l_DeviceType_0.Phone;
    local l_thumbnailHeight_2 = v32.props.thumbnailHeight;
    local v35 = v32.props.headerBarBackgroundHeight or 80;
    local v36 = v32.props.gradientHeight or l_thumbnailHeight_2 + 16 - v35 + 44;
    local l_bottomMargin_0 = v32.props.bottomMargin;
    return v5(function(v38) --[[ Line: 217 ]]
        -- upvalues: v11 (ref), v36 (copy), v35 (copy), v33 (copy), v32 (copy), l_thumbnailHeight_2 (copy), l_bottomMargin_0 (copy)
        local l_Theme_0 = v38.Theme;
        return v11.createElement("Frame", {
            Size = UDim2.fromScale(1, 1), 
            BackgroundTransparency = 1
        }, {
            Layout = v11.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical, 
                VerticalAlignment = Enum.VerticalAlignment.Bottom, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left
            }), 
            GradientBar = v11.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, v36), 
                BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
                AnchorPoint = Vector2.new(0, 1), 
                BorderSizePixel = 0, 
                LayoutOrder = 1
            }, {
                Gradient = v11.createElement("UIGradient", {
                    Rotation = 270, 
                    Transparency = NumberSequence.new({
                        NumberSequenceKeypoint.new(0, 0), 
                        NumberSequenceKeypoint.new(0.5, 0.25), 
                        NumberSequenceKeypoint.new(1, 1)
                    })
                })
            }), 
            BackgroundBar = v11.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, v35), 
                Position = UDim2.fromScale(0, 1), 
                AnchorPoint = Vector2.new(0, 1), 
                BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
                BackgroundTransparency = l_Theme_0.BackgroundDefault.Transparency, 
                BorderSizePixel = 0, 
                LayoutOrder = 2
            }, v33 and v32:renderisPhone(v38, l_thumbnailHeight_2) or v32:renderDesktopMode(v38, l_thumbnailHeight_2)), 
            Padding = if l_bottomMargin_0 then v11.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, l_bottomMargin_0), 
                BackgroundTransparency = 1, 
                LayoutOrder = 3
            }) else nil
        });
    end);
end;
return v14;