local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Localization);
local v3 = require(l_Parent_1.React);
local v4 = require(l_Parent_1.RoactUtils);
local v5 = require(l_Parent_1.RobloxAppHooks);
local v6 = require(l_Parent_1.UIBlox);
local l_GridView_0 = v6.App.Grid.GridView;
local l_Images_0 = v6.App.ImageSet.Images;
local l_HeaderBar_0 = v6.App.Bar.HeaderBar;
local l_IconButton_0 = v6.App.Button.IconButton;
local l_IconSize_0 = v6.App.ImageSet.Enum.IconSize;
local v12 = require(l_Parent_0.Hooks.useAnalytics);
local l_useCallback_0 = v3.useCallback;
local l_useContext_0 = v3.useContext;
local l_useDispatch_0 = v4.Hooks.RoactRodux.useDispatch;
local l_useLocalization_0 = v2.Hooks.useLocalization;
local l_useScreenSize_0 = v5.useScreenSize;
local l_useSelector_0 = v4.Hooks.RoactRodux.useSelector;
local l_useStyle_0 = v6.Core.Style.useStyle;
local v20 = require(l_Parent_0.Components.AvatarItemTile);
local v21 = require(l_Parent_0.Analytics.EventNames);
local v22 = require(l_Parent_0.App.FeedContext);
local v23 = require(l_Parent_0.Actions.InspectClosed);
local v24 = UDim.new(0, 8);
local function v27(v25, _) --[[ Line: 45 ]] --[[ Name: renderItem ]]
    -- upvalues: v3 (copy), v20 (copy)
    return v3.createElement(v20, {
        assetId = v25.assetId, 
        name = v25.name, 
        onActivated = v25.onActivated
    });
end;
return function(v28) --[[ Line: 53 ]]
    -- upvalues: v12 (copy), l_useDispatch_0 (copy), l_useContext_0 (copy), v22 (copy), l_useStyle_0 (copy), l_useScreenSize_0 (copy), l_useLocalization_0 (copy), l_useCallback_0 (copy), v23 (copy), l_useSelector_0 (copy), v21 (copy), v3 (copy), l_IconButton_0 (copy), l_Images_0 (copy), l_IconSize_0 (copy), v24 (copy), l_HeaderBar_0 (copy), l_GridView_0 (copy), v27 (copy)
    local v29 = v12();
    local v30 = l_useDispatch_0();
    local v31 = l_useContext_0(v22);
    local v32 = l_useStyle_0();
    local v33 = l_useScreenSize_0();
    local v34 = l_useLocalization_0({
        avatarItems = "Feature.ContentFeed.Label.AvatarItems"
    });
    local v35 = l_useCallback_0(function() --[[ Line: 64 ]]
        -- upvalues: v30 (copy), v23 (ref)
        v30(v23());
    end, {});
    local v37 = l_useSelector_0(function(v36) --[[ Line: 68 ]]
        return v36.ContentFeed.ItemAssets or {};
    end);
    local v39 = l_useSelector_0(function(v38) --[[ Line: 72 ]]
        return v38.ContentFeed.Inspect.AssetIds;
    end);
    local v44 = l_useCallback_0(function() --[[ Line: 76 ]]
        -- upvalues: v39 (copy), v37 (copy), v29 (copy), v21 (ref), v28 (copy), v31 (copy)
        local v40 = {};
        for _, v42 in v39 do
            local v43 = v37[tostring(v42)];
            table.insert(v40, {
                assetId = v42, 
                name = if v43 ~= nil then v43.name else "", 
                onActivated = function() --[[ Line: 83 ]] --[[ Name: onActivated ]]
                    -- upvalues: v29 (ref), v21 (ref), v42 (copy), v28 (ref), v31 (ref)
                    v29.fireEvent(v21.ContentFeedInspectItemPressed, {
                        itemId = v42, 
                        postId = v28.postId
                    });
                    v31.navigateToItemDetailPage((tostring(v42)));
                end
            });
        end;
        return v40;
    end, {
        v39, 
        v30, 
        v37
    });
    local v45 = l_useCallback_0(function() --[[ Line: 95 ]]
        -- upvalues: v3 (ref), v32 (copy), v34 (copy)
        return v3.createElement("TextLabel", {
            BackgroundTransparency = 1, 
            Font = v32.Font.Header2.Font, 
            LayoutOrder = 1, 
            Size = UDim2.new(1, 0, 0, 24), 
            Text = v34.avatarItems, 
            TextColor3 = v32.Theme.TextEmphasis.Color, 
            TextSize = 24, 
            TextXAlignment = Enum.TextXAlignment.Left
        });
    end, {
        v34.avatarItems
    });
    local v46 = l_useCallback_0(function() --[[ Line: 108 ]]
        -- upvalues: v3 (ref), l_IconButton_0 (ref), l_Images_0 (ref), l_IconSize_0 (ref), v35 (copy)
        return v3.createElement(l_IconButton_0, {
            icon = l_Images_0["icons/navigation/close"], 
            iconSize = l_IconSize_0.Medium, 
            onActivated = v35, 
            showBackground = false
        });
    end);
    local v47 = v33.X - 52;
    return v3.createElement("Frame", {
        Active = true, 
        BackgroundColor3 = v32.Theme.BackgroundContrast.Color, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        Position = UDim2.fromOffset(0, 0), 
        Size = UDim2.fromScale(1, 1), 
        ZIndex = 5
    }, {
        Layout = v3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Bottom
        }), 
        InfoOverlay = v3.createElement("Frame", {
            Active = true, 
            BackgroundColor3 = v32.Theme.BackgroundContrast.Color, 
            BackgroundTransparency = v32.Theme.BackgroundContrast.Transparency, 
            BorderSizePixel = 0, 
            Position = UDim2.fromOffset(0, 0), 
            Size = UDim2.new(1, 0, 0, 530)
        }, {
            UICorner = v3.createElement("UICorner", {
                CornerRadius = v24
            }), 
            Layout = v3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Top
            }), 
            Padding = v3.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, 12), 
                PaddingRight = UDim.new(0, 12), 
                PaddingTop = UDim.new(0, 12)
            }), 
            ModalHeaderBar = v3.createElement(l_HeaderBar_0, {
                backgroundTransparency = 1, 
                isTitleCentered = false, 
                layoutOrder = 1, 
                margin = 0, 
                renderLeft = v45, 
                renderRight = v46, 
                size = UDim2.new(1, 0, 0, 48)
            }), 
            BodyFrame = v3.createElement("Frame", {
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1, 
                LayoutOrder = 2, 
                Size = UDim2.new(1, 0, 0, 458)
            }, {
                Layout = v3.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    Padding = UDim.new(0, 8), 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    VerticalAlignment = Enum.VerticalAlignment.Top
                }), 
                ScrollingFrame = v3.createElement("ScrollingFrame", {
                    AutomaticCanvasSize = Enum.AutomaticSize.Y, 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    CanvasSize = UDim2.fromScale(1, 0), 
                    LayoutOrder = 1, 
                    ScrollBarThickness = 1, 
                    ScrollingDirection = Enum.ScrollingDirection.Y, 
                    Size = UDim2.fromScale(1, 1)
                }, {
                    UIListLayout = v3.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Vertical, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        Padding = UDim.new(0, 4), 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        VerticalAlignment = Enum.VerticalAlignment.Top
                    }), 
                    GridView = v3.createElement(l_GridView_0, {
                        itemPadding = Vector2.new(8, 8), 
                        items = v44(), 
                        itemSize = Vector2.new(v47 / 3, v47 / 3 + 80), 
                        LayoutOrder = 1, 
                        renderItem = v27
                    })
                })
            })
        })
    });
end;