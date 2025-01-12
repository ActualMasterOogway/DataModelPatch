local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserInputService_0 = game:GetService("UserInputService");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Workspace.Packages.VerifiedBadges);
local v4 = require(l_CorePackages_0.Packages.InGameMenuDependencies);
local l_Roact_0 = v4.Roact;
local l_UIBlox_0 = v4.UIBlox;
local l_Cryo_0 = v4.Cryo;
local l_t_0 = v4.t;
local l_Cell_0 = l_UIBlox_0.App.Table.Cell;
local l_CursorKind_0 = l_UIBlox_0.App.SelectionImage.CursorKind;
local l_ImageSetLabel_0 = l_UIBlox_0.Core.ImageSet.ImageSetLabel;
local l_LoadableImage_0 = l_UIBlox_0.App.Loading.LoadableImage;
local l_LoadingStrategy_0 = l_UIBlox_0.App.Loading.Enum.LoadingStrategy;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local l_withStyle_0 = l_UIBlox_0.Core.Style.withStyle;
local l_withSelectionCursorProvider_0 = l_UIBlox_0.App.SelectionImage.withSelectionCursorProvider;
local l_Parent_0 = script.Parent.Parent;
local v18 = require(l_Parent_0.Resources.Assets);
local v19 = require(l_Parent_0.Components.ThemedTextLabel);
local v20 = UDim.new(0, 24);
local v21 = l_Roact_0.PureComponent:extend("PlayerCell");
v21.validateProps = l_t_0.strictInterface({
    userId = l_t_0.number, 
    username = l_t_0.string, 
    displayName = l_t_0.optional(l_t_0.string), 
    hasVerifiedBadge = l_t_0.optional(l_t_0.boolean), 
    isOnline = l_t_0.optional(l_t_0.boolean), 
    isSelected = l_t_0.optional(l_t_0.boolean), 
    LayoutOrder = l_t_0.union(l_t_0.integer, l_t_0.table), 
    Visible = l_t_0.optional(l_t_0.boolean), 
    loadingStrategy = l_t_0.optional(l_LoadingStrategy_0.isEnumValue), 
    onActivated = l_t_0.optional(l_t_0.callback), 
    memoKey = l_t_0.optional(l_t_0.number), 
    [l_Roact_0.Children] = l_t_0.optional(l_t_0.table), 
    [l_Roact_0.Change.AbsolutePosition] = l_t_0.optional(l_t_0.callback), 
    forwardRef = l_t_0.optional(l_t_0.union(l_t_0.callback, l_t_0.table)), 
    UserInputService = l_t_0.optional(l_t_0.union(l_t_0.Instance, l_t_0.table))
});
v21.defaultProps = {
    Visible = true, 
    UserInputService = l_UserInputService_0
};
v21.init = function(v22) --[[ Line: 64 ]] --[[ Name: init ]]
    v22.onActivated = function() --[[ Line: 65 ]]
        -- upvalues: v22 (copy)
        if v22.props.onActivated and v22.props.userId then
            v22.props.onActivated(v22.props.userId);
        end;
    end;
end;
v21.renderButtons = function(v23) --[[ Line: 72 ]] --[[ Name: renderButtons ]]
    -- upvalues: l_Roact_0 (copy), l_Cryo_0 (copy)
    local v24 = v23.props[l_Roact_0.Children] or {};
    return (l_Cryo_0.Dictionary.join(v24, {
        List = l_Roact_0.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Right, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            Padding = UDim.new(0, 5)
        })
    }));
end;
v21.renderWithSelectionCursor = function(v25, v26) --[[ Line: 87 ]] --[[ Name: renderWithSelectionCursor ]]
    -- upvalues: l_withStyle_0 (copy), l_Roact_0 (copy), l_Cell_0 (copy), l_CursorKind_0 (copy), l_ImageSetLabel_0 (copy), l_Images_0 (copy), v20 (copy), l_LoadableImage_0 (copy), v18 (copy), v3 (copy), v19 (copy)
    local l_props_0 = v25.props;
    local v28 = l_props_0.displayName ~= "" and l_props_0.displayName or l_props_0.username;
    return l_withStyle_0(function(v29) --[[ Line: 97 ]]
        -- upvalues: v25 (copy), l_Roact_0 (ref), l_Cell_0 (ref), v26 (copy), l_CursorKind_0 (ref), l_props_0 (copy), l_ImageSetLabel_0 (ref), l_Images_0 (ref), v20 (ref), l_LoadableImage_0 (ref), v18 (ref), v3 (ref), v19 (ref), v28 (copy)
        local l_BackgroundContrast_0 = v29.Theme.BackgroundContrast;
        local v31 = 1.1;
        if v25.props.isSelected then
            l_BackgroundContrast_0 = v29.Theme.BackgroundOnHover;
            v31 = 0.23;
        end;
        local l_Color_0 = l_BackgroundContrast_0.Color;
        return l_Roact_0.createElement(l_Cell_0, {
            background = v25.props.isSelected and l_Roact_0.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundColor3 = l_Color_0, 
                BackgroundTransparency = l_BackgroundContrast_0.Transparency
            }) or nil, 
            onActivated = v25.onActivated, 
            [l_Roact_0.Change.AbsolutePosition] = v25.props[l_Roact_0.Change.AbsolutePosition], 
            [l_Roact_0.Ref] = v25.props.forwardRef or nil, 
            SelectionImageObject = v26(l_CursorKind_0.Square), 
            layoutOrder = l_props_0.LayoutOrder, 
            size = UDim2.new(1, 0, 0, 72), 
            head = l_Roact_0.createElement("Frame", {
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                AnchorPoint = Vector2.new(0, 0), 
                Size = UDim2.new(1, -20, 0, 72), 
                AutomaticSize = Enum.AutomaticSize.XY
            }, {
                HeadListLayout = l_Roact_0.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    VerticalAlignment = Enum.VerticalAlignment.Center
                }), 
                AvatarBackground = l_Roact_0.createElement(l_ImageSetLabel_0, {
                    BackgroundTransparency = 1, 
                    Image = l_Images_0["component_assets/userBG_dark"], 
                    Size = UDim2.new(0, 48, 0, 48)
                }, {
                    BorderRadius = l_Roact_0.createElement("UICorner", {
                        CornerRadius = v20
                    }), 
                    PlayerIcon = l_Roact_0.createElement(l_LoadableImage_0, {
                        loadingStrategy = v25.props.loadingStrategy, 
                        Size = UDim2.fromScale(1, 1), 
                        ImageColor3 = l_props_0.isOnline and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(115, 115, 115), 
                        BackgroundTransparency = 1, 
                        Image = l_props_0.userId > 0 and "rbxthumb://type=AvatarHeadShot&id=" .. l_props_0.userId .. "&w=60&h=60" or "", 
                        ZIndex = 2, 
                        LayoutOrder = 1, 
                        useShimmerAnimationWhileLoading = true, 
                        renderOnFailed = function() --[[ Line: 151 ]] --[[ Name: renderOnFailed ]]
                            -- upvalues: l_Roact_0 (ref), l_ImageSetLabel_0 (ref), l_Images_0 (ref), v20 (ref)
                            return l_Roact_0.createElement(l_ImageSetLabel_0, {
                                Size = UDim2.fromScale(1, 1), 
                                BackgroundTransparency = 1, 
                                Image = l_Images_0["icons/common/user"], 
                                ZIndex = 2, 
                                LayoutOrder = 1
                            }, {
                                Corner = l_Roact_0.createElement("UICorner", {
                                    CornerRadius = v20
                                })
                            });
                        end, 
                        cornerRadius = v20
                    }), 
                    OnlineIndicator = v25.props.isOnline and l_Roact_0.createElement(l_ImageSetLabel_0, {
                        AnchorPoint = Vector2.new(1, 1), 
                        Image = v18.Images.Circle, 
                        ImageColor3 = l_props_0.isOnline and v29.Theme.OnlineStatus.Color or nil, 
                        Position = UDim2.new(1, -3, 1, -3), 
                        Size = UDim2.new(0, 6, 0, 6), 
                        ZIndex = 3
                    }, {
                        Corner = l_Roact_0.createElement("UICorner", {
                            CornerRadius = UDim.new(0, 3)
                        }), 
                        Border = l_Roact_0.createElement("UIStroke", {
                            ApplyStrokeMode = Enum.ApplyStrokeMode.Border, 
                            Color = Color3.new(l_Color_0.R * v31, l_Color_0.G * v31, l_Color_0.B * v31), 
                            Transparency = 0, 
                            Thickness = 2
                        })
                    }) or nil
                }), 
                NameContainer = l_Roact_0.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, -68, 0, 72), 
                    Position = UDim2.fromOffset(48, 0), 
                    AnchorPoint = Vector2.new(0, 0.5), 
                    LayoutOrder = 2
                }, {
                    NameListLayout = l_Roact_0.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Vertical, 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        VerticalAlignment = Enum.VerticalAlignment.Center
                    }), 
                    NamePadding = l_Roact_0.createElement("UIPadding", {
                        PaddingLeft = UDim.new(0, 6)
                    }), 
                    DisplayNameLabel = l_Roact_0.createElement(v3.EmojiWrapper, {
                        emoji = if l_props_0.hasVerifiedBadge then v3.emoji.verified else "", 
                        automaticSize = Enum.AutomaticSize.None, 
                        size = UDim2.new(1, -40, 0, 20)
                    }, {
                        DisplayNameLabel = l_Roact_0.createElement(v19, {
                            fontKey = "CaptionHeader", 
                            themeKey = "TextEmphasis", 
                            BackgroundTransparency = 1, 
                            Text = v28 or l_props_0.username, 
                            Size = UDim2.new(1, 0, 0, 20), 
                            AutomaticSize = if l_props_0.hasVerifiedBadge then Enum.AutomaticSize.XY else Enum.AutomaticSize.None, 
                            TextXAlignment = Enum.TextXAlignment.Left, 
                            TextTruncate = Enum.TextTruncate.AtEnd, 
                            LayoutOrder = 1
                        })
                    }), 
                    UsernameLabel = l_Roact_0.createElement(v19, {
                        fontKey = "Footer", 
                        themeKey = "TextDefault", 
                        BackgroundTransparency = 1, 
                        AnchorPoint = Vector2.new(0, 0.5), 
                        Size = UDim2.new(1, 0, 0, 14), 
                        Text = "@" .. l_props_0.username, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextTruncate = Enum.TextTruncate.AtEnd, 
                        LayoutOrder = 2
                    })
                })
            }), 
            tail = l_Roact_0.createElement("Frame", {
                AnchorPoint = Vector2.new(1, 0), 
                BackgroundTransparency = 1, 
                Position = UDim2.new(1, 0, 0, 0), 
                Size = UDim2.new(0, 0, 1, 0)
            }, v25:renderButtons())
        });
    end);
end;
v21.render = function(v33) --[[ Line: 247 ]] --[[ Name: render ]]
    -- upvalues: l_withSelectionCursorProvider_0 (copy)
    return l_withSelectionCursorProvider_0(function(v34) --[[ Line: 248 ]]
        -- upvalues: v33 (copy)
        return v33:renderWithSelectionCursor(v34);
    end);
end;
return v2.memo(v21, function(v35, v36) --[[ Line: 253 ]]
    -- upvalues: l_Roact_0 (copy)
    local v37 = false;
    if v35.isSelected == v36.isSelected then
        v37 = false;
        if v35.isOnline == v36.isOnline then
            v37 = false;
            if v35[l_Roact_0.Change.AbsolutePosition] == v36[l_Roact_0.Change.AbsolutePosition] then
                v37 = false;
                if v35.forwardRef == v36.forwardRef then
                    v37 = false;
                    if v35.memoKey == v36.memoKey then
                        v37 = v35.loadingStrategy == v36.loadingStrategy;
                    end;
                end;
            end;
        end;
    end;
    return v37;
end);