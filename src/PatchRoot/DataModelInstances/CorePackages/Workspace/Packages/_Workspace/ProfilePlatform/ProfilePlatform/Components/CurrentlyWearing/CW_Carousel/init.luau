local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_getPageMargin_0 = require(l_Parent_0.UIBlox).App.Container.getPageMargin;
local l_CollectionCarousel_0 = require(l_Parent_0.CollectionViews).CollectionCarousel;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useScreenSize_0 = require(l_Parent_0.RobloxAppHooks).useScreenSize;
local v7 = require(script.Parent.CW_Tile);
local _ = require(l_script_FirstAncestor_0.Common.AssetInfo);
local v9 = require(l_script_FirstAncestor_0.Common.Enums);
local v10 = require(l_script_FirstAncestor_0.Common.TextKeys);
local v11 = game:DefineFastFlag("ProfilePlatformFixItemTypeLogging", false);
return function(v12) --[[ Line: 35 ]] --[[ Name: CW_Carousel ]]
    -- upvalues: l_useScreenSize_0 (copy), v2 (copy), l_useLocalization_0 (copy), v10 (copy), v7 (copy), v11 (copy), v9 (copy), l_getPageMargin_0 (copy), l_CollectionCarousel_0 (copy)
    local v13 = l_useScreenSize_0();
    local v14, v15 = v2.useState(24);
    local v16, v17 = v2.useState(0);
    local v18 = l_useLocalization_0({
        currentlyWearing = v10.CurrentlyWearing
    });
    local v22 = v2.useCallback(function(v19, v20, v21) --[[ Line: 43 ]]
        -- upvalues: v2 (ref), v7 (ref), v11 (ref), v12 (copy), v9 (ref)
        return v2.createElement("Frame", {
            Size = v21, 
            BackgroundTransparency = 1, 
            LayoutOrder = v20
        }, {
            [("%*"):format(v19.name)] = v2.createElement(v7, {
                name = v19.name, 
                assetId = v19.id, 
                onActivated = function() --[[ Line: 55 ]] --[[ Name: onActivated ]]
                    -- upvalues: v11 (ref), v12 (ref), v19 (copy), v9 (ref)
                    if v11 then
                        v12.openItemDetails(v19.id, v9.ItemTypes.Asset);
                        return;
                    else
                        v12.openItemDetails(v19.id, v19.assetType);
                        return;
                    end;
                end
            })
        }), "CW_Tile";
    end, {
        v12.openItemDetails
    });
    local v24 = v2.useCallback(function(v23) --[[ Line: 68 ]]
        -- upvalues: v17 (copy)
        v17(v23);
        return v23 + 42;
    end, {});
    local v27 = v2.useCallback(function(v25) --[[ Line: 73 ]]
        -- upvalues: l_getPageMargin_0 (ref), v15 (copy)
        local v26 = l_getPageMargin_0(v25.AbsoluteSize.X);
        v15(v26);
    end, {});
    local v28 = #v12.assets > 2;
    return v2.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, v16 + 42 + (v28 and 0 or 60 + v13.Y * 0.01)), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        LayoutOrder = v12.layoutOrder, 
        [v2.Change.AbsoluteSize] = v27
    }, {
        CollectionCarousel = v2.createElement(l_CollectionCarousel_0, {
            LayoutOrder = v12.layoutOrder, 
            title = v18.currentlyWearing, 
            items = v12.assets, 
            renderItem = v22, 
            getItemHeight = v24, 
            numColumns = 2, 
            fractionalItemAmount = 0.8, 
            columnGap = 8, 
            sideMargin = v14
        })
    });
end;