local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local l_EmptyState_0 = v3.App.Indicator.EmptyState;
local l_getPageMargin_0 = v3.App.Container.getPageMargin;
local l_ItemTile_0 = v3.Tile.ItemTile;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useScreenSize_0 = require(l_Parent_0.RobloxAppHooks).useScreenSize;
local l_CollectionCarousel_0 = require(l_Parent_0.CollectionViews).CollectionCarousel;
local _ = require(l_script_FirstAncestor_0.Types.ContentPost);
local v11 = require(l_script_FirstAncestor_0.Utils.getDeepValue);
local v12 = require(l_script_FirstAncestor_0.Utils.getPostThumbnailUrl);
local v13 = require(l_script_FirstAncestor_0.Common.TextKeys);
local v14 = require(script.Parent.ContentPostsHeader);
return function(v15) --[[ Line: 37 ]] --[[ Name: ContentPostsCarousel ]]
    -- upvalues: l_useScreenSize_0 (copy), v2 (copy), l_useLocalization_0 (copy), v13 (copy), l_EmptyState_0 (copy), l_ItemTile_0 (copy), v11 (copy), v12 (copy), l_getPageMargin_0 (copy), v14 (copy), l_CollectionCarousel_0 (copy)
    local v16 = l_useScreenSize_0();
    local v17, v18 = v2.useState(24);
    local v19, v20 = v2.useState(0);
    local v21 = l_useLocalization_0({
        selfNoPosts = v13.SelfNoPosts
    });
    local v22, v23 = v2.useState(false);
    local v24 = #v15.posts == 0;
    local l_openFeed_0 = v15.openFeed;
    local v29 = v2.useCallback(function(v26, v27, v28) --[[ Line: 49 ]]
        -- upvalues: v24 (copy), v2 (ref), l_EmptyState_0 (ref), v21 (copy), l_ItemTile_0 (ref), v11 (ref), v15 (copy), v12 (ref), v23 (copy)
        return if v24 then v2.createElement(l_EmptyState_0, {
            text = v21.selfNoPosts, 
            size = UDim2.new(1, 0, 1, 0)
        }) else v2.createElement("Frame", {
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = v28, 
            BackgroundTransparency = 1, 
            LayoutOrder = v27
        }, {
            v2.createElement(l_ItemTile_0, {
                aspectRatio = 0.5625, 
                name = v11(v15.gameInfoByIds, (("%*.name"):format(v26.experienceContext.experienceId))) or "", 
                thumbnail = v12(v26.contentLinkId), 
                scaleType = Enum.ScaleType.Crop, 
                onActivated = function() --[[ Line: 66 ]] --[[ Name: onActivated ]]
                    -- upvalues: v23 (ref), v15 (ref), v26 (copy), v27 (copy)
                    v23(false);
                    v15.openFeed(v26.postId, v27);
                end, 
                useMaxTitleHeight = true
            })
        }), "PostTile";
    end, {
        v24, 
        v15.gameInfoByIds, 
        l_openFeed_0
    });
    local v31 = v2.useCallback(function(v30) --[[ Line: 76 ]]
        -- upvalues: v20 (copy)
        v20(v30);
        return v30 / 0.5625 + 42;
    end, {});
    local v34 = v2.useCallback(function(v32) --[[ Line: 81 ]]
        -- upvalues: l_getPageMargin_0 (ref), v18 (copy)
        local v33 = l_getPageMargin_0(v32.AbsoluteSize.X);
        v18(v33);
    end, {});
    local v35 = #v15.posts > 4;
    local v36 = if v24 then {
        "dummy"
    } else v15.posts;
    local v40 = v2.useCallback(function() --[[ Line: 89 ]]
        -- upvalues: v23 (copy), v15 (copy), l_openFeed_0 (copy)
        v23(false);
        local v37 = "";
        for _, v39 in pairs(v15.posts) do
            v37 = v39.postId;
            break;
        end;
        if v37 and v37 ~= "" then
            l_openFeed_0(v37, 1);
        end;
    end, {
        v15.posts, 
        l_openFeed_0
    });
    local v41 = v2.useCallback(function() --[[ Line: 102 ]]
        -- upvalues: v2 (ref), v14 (ref), v22 (copy), v23 (copy), v40 (copy)
        return v2.createElement(v14, {
            isTooltipActive = v22, 
            setIsTooltipActive = v23, 
            onActivate = v40
        });
    end, {
        v22, 
        v40
    });
    return v2.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, v19 + 42 + (v35 and 0 or 60 + v16.Y * 0.01)), 
        AutomaticSize = if v24 then Enum.AutomaticSize.None else Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        LayoutOrder = v15.layoutOrder, 
        [v2.Change.AbsoluteSize] = v34
    }, {
        CollectionContent = v2.createElement(l_CollectionCarousel_0, {
            LayoutOrder = v15.layoutOrder, 
            title = v41, 
            items = v36, 
            renderItem = v29, 
            getItemHeight = v31, 
            numColumns = 4, 
            fractionalItemAmount = 0.8, 
            columnGap = 8, 
            sideMargin = v17
        })
    });
end;