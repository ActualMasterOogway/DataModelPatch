local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local l_Parent_3 = l_Parent_2.Parent;
local v4 = require(l_Parent_2.UIBloxConfig);
local v5 = require(l_Parent_3.Cryo);
local l_AnimatedFlatList_0 = require(l_Parent_3.VirtualizedList).AnimatedFlatList;
local v7 = require(l_Parent_0.DetailsPageHeader);
local v8 = require(l_Parent_0.getPlatformConfig);
local v9 = require(l_Parent_0.Hooks.useDetailsPageRenderItems);
local v10 = require(l_Parent_0.Hooks.useAnimateFullscreen);
local v11 = require(l_Parent_0.DetailsPageRenderItem);
local v12 = require(l_Parent_1.Dialog.Overlay.Overlay);
local v13 = require(l_Parent_1.Loading.LoadableImage);
local _ = require(l_Parent_1.Style.Constants);
local _ = require(l_Parent_3.ReactOtter);
local _ = require(l_Parent_0.Types);
local v17 = require(l_Parent_3.React);
local v18 = Vector2.new(96, 144);
local v19 = {
    animationConfig = {
        dampingRatio = 1, 
        frequency = 3
    }, 
    itemPadding = 36, 
    safeAreaSize = v18, 
    trailingWhitespace = 3000
};
return function(v20) --[[ Line: 150 ]] --[[ Name: DetailsPageTenfootTemplate ]]
    -- upvalues: v19 (copy), v5 (copy), v17 (copy), v8 (copy), v10 (copy), v7 (copy), v4 (copy), v9 (copy), v11 (copy), v13 (copy), v12 (copy), l_AnimatedFlatList_0 (copy)
    local l_v19_0 = v19;
    if v20.tokens then
        l_v19_0 = v5.Dictionary.join(l_v19_0, v20.tokens);
    end;
    local v22, v23 = v17.useState(true);
    local v24 = v17.useMemo(function() --[[ Line: 161 ]]
        -- upvalues: v8 (ref), v20 (copy)
        return v8(v20.deviceType);
    end, {
        v20.deviceType
    });
    local v25 = v17.useRef(nil);
    local v26, v27 = v17.useState(Vector2.new(0, 0));
    local v29 = v17.useCallback(function(v28) --[[ Line: 167 ]]
        -- upvalues: v27 (copy)
        v27(v28.AbsoluteSize);
    end, {});
    v17.useEffect(function() --[[ Line: 170 ]]
        -- upvalues: v25 (copy), v27 (copy)
        if v25.current then
            v27(v25.current.AbsoluteSize);
        end;
    end, {});
    local v30 = if v20.thumbnailHeight then v20.thumbnailHeight else v24.thumbnailHeight;
    local v31 = if v20.headerBarBackgroundHeight ~= nil then v20.headerBarBackgroundHeight else v24.headerBarBackgroundHeight;
    local v32 = if v20.sideMargin then v20.sideMargin else v24.sideMargin;
    local v33 = v20.isFullscreen ~= nil and v20.isFullscreen;
    local l_renderFullscreenContent_0 = v20.renderFullscreenContent;
    local v35, v36 = v10(v33, l_renderFullscreenContent_0, l_v19_0.animationConfig);
    local v37 = v17.useMemo(function() --[[ Line: 189 ]]
        -- upvalues: v17 (ref), v7 (ref), v20 (copy), v30 (copy), v4 (ref), v32 (copy), v31 (copy), l_v19_0 (ref)
        return v17.createElement(v7, {
            thumbnailImageUrl = v20.thumbnailImageUrl, 
            thumbnailAspectRatio = v20.thumbnailAspectRatio, 
            thumbnailHeight = v30, 
            titleText = v20.titleText, 
            subTitleText = v20.subTitleText, 
            actionBarLabelText = if v4.enableDetailsPageHeaderActionBarLabel then v20.actionBarLabelText else nil, 
            renderInfoContent = v20.renderInfoContent, 
            actionBarProps = v20.actionBarProps, 
            sideMargin = v32, 
            headerBarBackgroundHeight = v31, 
            deviceType = v20.deviceType, 
            thumbnailShadowHeight = l_v19_0.thumbnailShadowHeight, 
            gradientHeight = l_v19_0.headerGradientHeight, 
            actionBarHeight = l_v19_0.actionBarHeight, 
            actionBarWidth = l_v19_0.actionBarWidth, 
            itemPadding = l_v19_0.thumbnailMargin, 
            bottomMargin = l_v19_0.headerBottomMargin
        });
    end, {
        v20.thumbnailImageUrl, 
        v20.thumbnailAspectRatio, 
        v30, 
        v20.titleText, 
        v20.subTitleText, 
        v20.renderInfoContent, 
        v20.actionBarProps, 
        v32, 
        v31, 
        v20.deviceType, 
        l_v19_0.thumbnailShadowHeight, 
        l_v19_0.headerGradientHeight, 
        l_v19_0.thumbnailMargin, 
        l_v19_0.headerBottomMargin
    });
    local v38 = v9(v20.componentList, v37, v26, l_v19_0.safeAreaSize);
    local v40 = v17.useCallback(function(v39) --[[ Line: 232 ]]
        -- upvalues: v17 (ref), v11 (ref), l_v19_0 (ref)
        return v17.createElement(v11, {
            item = v39.item, 
            itemPadding = l_v19_0.itemPadding, 
            safeArea = l_v19_0.safeAreaSize
        });
    end, {
        l_v19_0.itemPadding, 
        l_v19_0.safeAreaSize
    });
    local v41 = v17.useCallback(function() --[[ Line: 240 ]]
        -- upvalues: v17 (ref), l_v19_0 (ref)
        return v17.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, l_v19_0.itemPadding), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0
        });
    end, {
        l_v19_0.itemPadding
    });
    local v43 = v17.useCallback(function(v42) --[[ Line: 248 ]]
        -- upvalues: v38 (copy), v23 (copy)
        if v38[v42].showCornerGradient == false then
            v23(false);
            return;
        else
            v23(true);
            return;
        end;
    end, {
        v38
    });
    return v17.createElement("Frame", {
        [v17.Change.AbsoluteSize] = v29, 
        Size = UDim2.fromScale(1, 1), 
        BackgroundTransparency = 1, 
        ref = v25
    }, {
        BackgroundImage = v17.createElement("Frame", {
            ZIndex = 1, 
            Size = UDim2.fromScale(1, 1), 
            BackgroundTransparency = 1
        }, {
            BackgroundImage = v17.createElement(v13, {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.fromScale(0.5, 0.5), 
                Size = UDim2.new(1, 0, 1, 0), 
                Image = v20.bannerImageUrl, 
                ScaleType = Enum.ScaleType.Crop
            })
        }), 
        Overlay = v17.createElement(v12, {
            ZIndex = 2, 
            showGradient = v22, 
            gradientDirection = "topRight"
        }), 
        Content = v17.createElement(l_AnimatedFlatList_0, {
            onSelectedIndexChanged = v43, 
            animated = true, 
            initialNumToRender = #v38, 
            data = v38, 
            renderItem = v40, 
            ItemSeparatorComponent = v41, 
            ListFooterComponent = v17.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, l_v19_0.trailingWhitespace), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0
            }), 
            ListHeaderComponent = v17.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, l_v19_0.safeAreaSize.Y), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0
            }), 
            viewOffset = l_v19_0.safeAreaSize.Y, 
            contentContainerStyle = {
                BackgroundTransparency = 1
            }, 
            style = {
                BackgroundTransparency = 1, 
                ScrollBarThickness = 0, 
                ScrollingEnabled = false, 
                Selectable = false, 
                VerticalScrollBarInset = Enum.ScrollBarInset.None, 
                ZIndex = 3
            }, 
            animationConfig = l_v19_0.animationConfig, 
            UNSTABLE_forceSiblingLayoutUpdate = true, 
            overrideAutomaticCanvasSize = true
        }), 
        Fullscreen = v17.createElement("CanvasGroup", {
            Size = UDim2.fromScale(1, 1), 
            GroupTransparency = v36, 
            BorderSizePixel = 0, 
            ZIndex = 4
        }, {
            FullscreenContent = if v35 then l_renderFullscreenContent_0() else nil
        })
    });
end;