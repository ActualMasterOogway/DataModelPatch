local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsCarousel");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_Roact_0 = v1.Roact;
local l_React_0 = v1.React;
local l_Text_0 = v1.Text;
local l_llama_0 = v1.llama;
local l_memoize_0 = v1.memoize;
local l_useDesignTokens_0 = v1.Hooks.useDesignTokens;
local l_useUiModeInfo_0 = v1.Hooks.useUiModeInfo;
local l_UiMode_0 = v1.RobloxAppEnums.UiMode;
local l_UIBlox_0 = v1.UIBlox;
local l_useStyle_0 = l_UIBlox_0.Core.Style.useStyle;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local l_StyledTextLabel_0 = l_UIBlox_0.App.Text.StyledTextLabel;
local l_ImageSetLabel_0 = l_UIBlox_0.Core.ImageSet.ImageSetLabel;
local l_ShimmerPanel_0 = l_UIBlox_0.App.Loading.ShimmerPanel;
local l_useCursor_0 = l_UIBlox_0.App.SelectionCursor.useCursor;
local l_FFlagLuaAppFixCursorHooks_0 = v1.FFlagLuaAppFixCursorHooks;
local v18 = require(l_script_FirstAncestor_0.Flags.FFlagFriendsCarouselSmallerUIExperiment);
local v19 = require(l_script_FirstAncestor_0.Flags.FFlagFriendsCarouselNewPresenceUIEnabledForAll);
local v20 = game:DefineFastString("FriendCarouselVendorImagePath", "rbxasset://textures/ui/Shell/Icons/PlatformLogo.png");
local v21 = l_Images_0["component_assets/circle_25"];
local v22 = UDim.new(0.5, 0);
local v27 = l_memoize_0(function(v23, v24, v25) --[[ Line: 42 ]]
    -- upvalues: l_Text_0 (copy)
    local v26 = if v24.RelativeSize then v24.RelativeSize * v25 else v24.FontSize;
    return l_Text_0.GetTextBounds(v23, v24.Font, v26, Vector2.new(10000, 10000));
end);
local v28 = {
    username = "", 
    thumbnail = "", 
    layoutOrder = 0, 
    tileSize = 96, 
    infoHeight = 24
};
return function(v29) --[[ Line: 76 ]]
    -- upvalues: l_llama_0 (copy), v28 (copy), l_Roact_0 (copy), l_React_0 (copy), l_useUiModeInfo_0 (copy), l_useDesignTokens_0 (copy), l_UiMode_0 (copy), l_FFlagLuaAppFixCursorHooks_0 (copy), l_useCursor_0 (copy), v22 (copy), l_useStyle_0 (copy), v27 (copy), v18 (copy), v19 (copy), l_ImageSetLabel_0 (copy), v21 (copy), v20 (copy), l_StyledTextLabel_0 (copy), l_ShimmerPanel_0 (copy)
    local v30 = l_llama_0.Dictionary.join(v28, v29 or {});
    local v31 = l_Roact_0.createRef();
    local v32 = l_React_0.useCallback(function() --[[ Line: 80 ]]
        -- upvalues: v31 (copy), v30 (copy)
        if v31 and v30.onActivated then
            v30.onActivated(v31);
        end;
    end, {
        v31
    });
    local v33 = l_useUiModeInfo_0();
    local v35 = l_useDesignTokens_0(function(v34) --[[ Line: 87 ]]
        -- upvalues: v33 (copy), l_UiMode_0 (ref)
        if v33.uiMode == l_UiMode_0.TenFoot then
            return {
                presenceIconSize = v34.Global.Size_150, 
                presenceIconPadding = v34.Global.Space_50, 
                tilePadding = v34.Global.Space_100, 
                gameTitlePadding = v34.Global.Space_50, 
                usernameTextFont = v34.Semantic.Typography.CaptionHeader, 
                contextualTextFont = v34.Semantic.Typography.CaptionBody
            };
        else
            return {
                presenceIconSize = 12, 
                presenceIconPadding = 4, 
                tilePadding = 8, 
                gameTitlePadding = 4
            };
        end;
    end);
    local v36 = if l_FFlagLuaAppFixCursorHooks_0 then l_useCursor_0(v22) else nil;
    local v37 = l_useStyle_0();
    local v38 = v35.contextualTextFont or v37.Font.CaptionSubHeader;
    local v39 = v35.usernameTextFont or v37.Font.CaptionHeader;
    local v40 = v27(v30.username, v39, v37.Font.BaseSize);
    local v41 = if not not ((not v18 or not v30.showNewPresenceIndicator) and not v19 and v30.showOnlineIndicator) or v30.showVendorIcon then v35.presenceIconSize + v35.presenceIconPadding else 0;
    local v42 = math.min(v30.tileSize - v41, v40.X);
    local v43 = nil;
    if v18 or v19 then
        v43 = l_React_0.useMemo(function() --[[ Line: 127 ]]
            -- upvalues: v30 (copy)
            return v30.tileSize / 2 * 1.7071067811865475;
        end, {
            v30.tileSize
        });
    end;
    return l_Roact_0.createFragment({
        UserTileCircular = l_Roact_0.createElement("Frame", {
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            LayoutOrder = v30.layoutOrder, 
            Size = UDim2.fromOffset(v30.tileSize, 0), 
            [l_Roact_0.Ref] = v31
        }, {
            Layout = l_Roact_0.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Top, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, v35.tilePadding)
            }), 
            PlayerAvatar = l_Roact_0.createElement("TextButton", {
                BackgroundTransparency = 1, 
                LayoutOrder = 1, 
                SelectionImageObject = if l_FFlagLuaAppFixCursorHooks_0 then v36 else l_useCursor_0(v22), 
                Size = UDim2.fromOffset(v30.tileSize, v30.tileSize), 
                Text = "", 
                [l_Roact_0.Event.Activated] = v32
            }, {
                AvatarImage = l_Roact_0.createElement(l_ImageSetLabel_0, {
                    Image = v30.thumbnail, 
                    Size = UDim2.fromScale(1, 1)
                }, {
                    UICorner = l_Roact_0.createElement("UICorner", {
                        CornerRadius = v22
                    })
                }), 
                PresenceIcon = if (v18 and v30.showNewPresenceIndicator or v19) and v30.showOnlineIndicator then l_Roact_0.createElement(l_ImageSetLabel_0, {
                    Image = v21, 
                    ImageColor3 = v37.Theme.OnlineStatus.Color, 
                    ImageTransparency = v37.Theme.OnlineStatus.Transparency, 
                    LayoutOrder = 1, 
                    Size = UDim2.new(0, v35.presenceIconSize, 0, v35.presenceIconSize), 
                    BackgroundTransparency = 1, 
                    ScaleType = Enum.ScaleType.Slice, 
                    Visible = v30.showVendorIcon ~= true, 
                    AnchorPoint = Vector2.new(0.6, 0.6), 
                    Position = UDim2.fromOffset(v43, v43), 
                    ZIndex = 3
                }, {
                    UICorner = l_Roact_0.createElement("UICorner", {
                        CornerRadius = UDim.new(0.5, 0)
                    }), 
                    UIStroke = l_Roact_0.createElement("UIStroke", {
                        Thickness = 4, 
                        Color = v37.Theme.BackgroundDefault.Color, 
                        Transparency = v37.Theme.BackgroundDefault.Transparency
                    })
                }) else nil
            }), 
            UserInfo = l_Roact_0.createElement("TextButton", {
                BackgroundTransparency = 1, 
                LayoutOrder = 2, 
                Selectable = false, 
                Size = UDim2.new(1, 0, 0, v30.infoHeight), 
                Text = "", 
                [l_Roact_0.Event.Activated] = v32
            }, {
                Layout = l_Roact_0.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    VerticalAlignment = Enum.VerticalAlignment.Top, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, v35.gameTitlePadding)
                }), 
                UsernameFrame = l_Roact_0.createElement("Frame", {
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 1
                }, {
                    Layout = l_Roact_0.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Horizontal, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        Padding = UDim.new(0, v35.presenceIconPadding)
                    }), 
                    PresenceIcon = if v18 and v30.showNewPresenceIndicator or v19 then nil else v30.showOnlineIndicator and l_Roact_0.createElement(l_ImageSetLabel_0, {
                        AnchorPoint = Vector2.new(0.5, 0.5), 
                        Image = v21, 
                        ImageColor3 = v37.Theme.OnlineStatus.Color, 
                        ImageTransparency = v37.Theme.OnlineStatus.Transparency, 
                        LayoutOrder = 1, 
                        Position = UDim2.fromScale(0.5, 0.5), 
                        Size = UDim2.new(0, v35.presenceIconSize, 0, v35.presenceIconSize), 
                        BackgroundTransparency = 1, 
                        ScaleType = Enum.ScaleType.Slice, 
                        Visible = v30.showVendorIcon ~= true
                    }) or nil, 
                    VendorIcon = v30.showVendorIcon and l_Roact_0.createElement(l_ImageSetLabel_0, {
                        AnchorPoint = Vector2.new(0.5, 0.5), 
                        Image = {
                            Image = v20, 
                            ImageRectOffset = Vector2.zero, 
                            ImageRectSize = Vector2.zero
                        }, 
                        LayoutOrder = 1, 
                        Position = UDim2.fromScale(0.5, 0.5), 
                        Size = UDim2.new(0, v35.presenceIconSize, 0, v35.presenceIconSize), 
                        BackgroundTransparency = 1
                    }) or nil, 
                    PlayerName = if not v30.shouldShimmerName then l_Roact_0.createElement(l_StyledTextLabel_0, {
                        layoutOrder = 2, 
                        text = v30.username, 
                        fontStyle = v39, 
                        size = UDim2.new(0, v42, 0, v40.Y), 
                        colorStyle = v37.Theme.TextEmphasis, 
                        textTruncate = Enum.TextTruncate.AtEnd, 
                        textXAlignment = Enum.TextXAlignment.Left, 
                        textYAlignment = Enum.TextYAlignment.Center, 
                        fluidSizing = false, 
                        richText = false
                    }) else nil, 
                    ShimmerName = if v30.shouldShimmerName then l_Roact_0.createElement(l_ShimmerPanel_0, {
                        Size = UDim2.fromScale(0.8, 0.8), 
                        LayoutOrder = 2
                    }) else nil
                }), 
                ContextualInfo = if v30.contextualText then l_Roact_0.createElement(l_StyledTextLabel_0, {
                    layoutOrder = 2, 
                    text = v30.contextualText, 
                    fontStyle = v38, 
                    size = UDim2.new(1, 0, 0, v27(v30.contextualText, v38, v37.Font.BaseSize).Y), 
                    colorStyle = v30.isContextualTextMuted and v37.Theme.TextMuted or v37.Theme.TextEmphasis, 
                    textTruncate = Enum.TextTruncate.AtEnd, 
                    textXAlignment = Enum.TextXAlignment.Center, 
                    textYAlignment = Enum.TextYAlignment.Top, 
                    fluidSizing = false, 
                    richText = false, 
                    lineHeight = 1
                }) else nil
            })
        })
    });
end;