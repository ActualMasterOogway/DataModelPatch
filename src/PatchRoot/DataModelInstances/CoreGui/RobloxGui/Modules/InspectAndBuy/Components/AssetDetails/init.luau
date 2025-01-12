local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_Players_0 = game:GetService("Players");
local l_Parent_0 = script.Parent.Parent;
local v4 = require(l_CorePackages_0.Packages.Roact);
local v5 = require(l_CorePackages_0.Packages.RoactRodux);
local l_AppFonts_0 = require(l_CorePackages_0.Workspace.Packages.Style).AppFonts;
local v7 = require(l_Parent_0.Components.DetailsText);
local v8 = require(l_Parent_0.Components.DetailsThumbnail);
local v9 = require(l_Parent_0.Components.DetailsDescription);
local v10 = require(l_Parent_0.Components.DetailsButtons);
local v11 = require(l_Parent_0.Components.TryOnViewport);
local v12 = require(l_Parent_0.Actions.OpenOverlay);
local v13 = require(l_Parent_0.Enums.Overlay);
local v14 = require(l_Parent_0.Thunks.GetAssetBundles);
local v15 = require(l_Parent_0.Thunks.ReportOpenDetailsPage);
local v16 = require(l_Parent_0.Thunks.GetEconomyProductInfo);
local v17 = require(l_Parent_0.Thunks.GetCollectibleResellableInstances);
local v18 = require(l_Parent_0.Colors);
local v19 = require(l_Parent_0.Constants);
local v20 = require(l_Parent_0.UtilityFunctions);
local v21 = require(l_CorePackages_0.Packages.tutils);
local v22 = require(l_CoreGui_0.RobloxGui.Modules.RobloxTranslator);
local v23 = require(l_CorePackages_0.Packages.UIBlox);
local l_Images_0 = v23.App.ImageSet.Images;
local l_ImageSetLabel_0 = v23.Core.ImageSet.ImageSetLabel;
local l_ItemInfoList_0 = require(l_CorePackages_0.Workspace.Packages.ItemDetails).ItemInfoList;
local v27 = require(l_Parent_0.AttributionConstants);
local v28 = require(l_Parent_0.Flags.FFlagAssetDetailsUseAutomaticCanvasSize);
local v29 = require(l_Parent_0.Flags.FFlagAttributionInInspectAndBuy);
local v30 = require(l_Parent_0.Components.InspectAndBuyContext);
local v31 = require(l_Parent_0.Flags.GetFFlagDisplayCollectiblesIcon);
local v32 = require(l_Parent_0.Thunks.GetItemDetails);
local v33 = require(l_Parent_0.Actions.SetAssetFromBundleInfo);
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v35 = require(l_Modules_0.Settings.Theme);
local l_ControllerBarHeight_0 = require(l_CoreGui_0.RobloxGui.Modules.InGameMenuConstants).ControllerBarHeight;
local v37 = v4.PureComponent:extend("AssetDetails");
v37.setScrollingEnabled = function(v38, v39) --[[ Line: 48 ]] --[[ Name: setScrollingEnabled ]]
    if v38.state.scrollingEnabled ~= v39 then
        v38:setState({
            scrollingEnabled = v39
        });
    end;
end;
v37.getInfoRowProps = function(v40) --[[ Line: 58 ]] --[[ Name: getInfoRowProps ]]
    -- upvalues: v22 (copy), v29 (copy), v27 (copy), v13 (copy), v4 (copy), v19 (copy)
    local v41 = v40.props.assetInfo or {};
    local l_locale_0 = v40.props.locale;
    local v43 = v41.parentBundleId ~= nil;
    local v44 = {
        infoName = v22:FormatByKeyForLocale("Feature.Catalog.Label.Filter.Creator", l_locale_0), 
        infoData = v41.creatorName or "", 
        hasVerifiedBadge = v41.creatorHasVerifiedBadge, 
        LayoutOrder = 1, 
        Selectable = not v29 and nil
    };
    local v45 = nil;
    local l_creatingUniverseId_0 = v41.creatingUniverseId;
    if l_creatingUniverseId_0 then
        local v47 = v40.props.creatingExperiences[l_creatingUniverseId_0];
        if v47 then
            local l_playabilityStatus_0 = v47.playabilityStatus;
            if v27.ShowPlayableAttributionMapper[l_playabilityStatus_0] then
                local v49 = v47.name or "";
                local l_v47_0 = v47 --[[ copy: 7 -> 11 ]];
                v45 = {
                    infoName = v22:FormatByKeyForLocale("Feature.Catalog.Label.Attribution", l_locale_0), 
                    infoData = v49, 
                    onActivate = v29 and function() --[[ Line: 92 ]]
                        -- upvalues: v40 (copy), v13 (ref), l_v47_0 (copy)
                        v40.props.openOverlay(v13.AttributionTraversal, l_v47_0);
                    end or nil, 
                    LayoutOrder = 2, 
                    [v4.Ref] = if v29 then v40.attributionRef else nil, 
                    Selectable = v29 and true or nil
                };
            end;
        end;
    end;
    local v51 = nil;
    if v43 then
        v51 = v22:FormatByKeyForLocale("Feature.Catalog.Label.Bundle", l_locale_0);
    else
        local v52 = v19.AssetTypeIdToCategory[v41.assetTypeId];
        local v53 = v19.AssetCategoriesLocalized[v52];
        local v54 = v19.AssetTypeIdToTypeLocalized[v41.assetTypeId];
        if v53 and v54 then
            v51 = v22:FormatByKeyForLocale(v53, l_locale_0) .. " | " .. v22:FormatByKeyForLocale(v54, l_locale_0);
        end;
    end;
    return {
        v44, 
        v45, 
        {
            infoName = v22:FormatByKeyForLocale("Feature.Catalog.Label.CategoryType", l_locale_0), 
            infoData = v51, 
            LayoutOrder = 3, 
            Selectable = not v29 and nil
        }
    };
end;
v37.init = function(v55) --[[ Line: 137 ]] --[[ Name: init ]]
    -- upvalues: v29 (copy), v4 (copy)
    v55.state = {
        scrollingEnabled = true
    };
    if v29 then
        v55.attributionRef = v4.createRef();
    end;
end;
v37.willUpdate = function(v56, v57) --[[ Line: 147 ]] --[[ Name: willUpdate ]]
    -- upvalues: v20 (copy), v21 (copy)
    if v20.isCollectibles(v56.props.assetInfo) then
        local l_collectibleItemId_0 = v56.props.assetInfo.collectibleItemId;
        local l_resellableInstances_0 = v56.props.resellableInstances;
        local l_resellableInstances_1 = v57.resellableInstances;
        if l_resellableInstances_0 and l_resellableInstances_0[l_collectibleItemId_0] and l_resellableInstances_1 and l_resellableInstances_1[l_collectibleItemId_0] and v21.fieldCount(l_resellableInstances_0[l_collectibleItemId_0]) ~= v21.fieldCount(l_resellableInstances_1[l_collectibleItemId_0]) then
            v56:setState({});
        end;
    end;
    local v61 = v56.props.assetInfo and v56.props.assetInfo.parentBundleId;
    local l_bundles_0 = v56.props.bundles;
    local l_bundles_1 = v57.bundles;
    if v61 and l_bundles_0 and l_bundles_0[v61] and l_bundles_1 and l_bundles_1[v61] and l_bundles_1[v61] ~= l_bundles_0[v61] then
        v56.props.setAssetFromBundleInfo(v56.props.assetInfo.assetId, l_bundles_1[v61]);
    end;
end;
v37.didUpdate = function(v64, v65) --[[ Line: 180 ]] --[[ Name: didUpdate ]]
    -- upvalues: v20 (copy)
    local l_reportOpenDetailsPage_0 = v64.props.reportOpenDetailsPage;
    local l_assetInfo_0 = v64.props.assetInfo;
    local l_assetInfo_1 = v65.assetInfo;
    if l_assetInfo_0 and l_assetInfo_0 ~= l_assetInfo_1 then
        local l_bundles_2 = v64.props.bundles;
        local v70 = l_assetInfo_0.parentBundleId ~= nil;
        local v71 = v70 and v20.getBundleId(l_assetInfo_0);
        if not v70 and l_assetInfo_0.owned == nil or v70 and l_bundles_2[v71].owned == nil then
            local l_assetId_0 = l_assetInfo_0.assetId;
            local l_Asset_0 = Enum.AvatarItemType.Asset;
            if v70 then
                l_assetId_0 = v71;
                l_Asset_0 = Enum.AvatarItemType.Bundle;
            end;
            v64.props.getItemDetails(l_assetId_0, l_Asset_0);
        end;
    end;
    if v64.props.detailsInformation.viewingDetails and not v65.detailsInformation.viewingDetails then
        l_reportOpenDetailsPage_0(l_assetInfo_0);
    end;
end;
v37.render = function(v74) --[[ Line: 218 ]] --[[ Name: render ]]
    -- upvalues: l_Images_0 (copy), v4 (copy), v30 (copy), v31 (copy), v20 (copy), l_Players_0 (copy), v21 (copy), l_ControllerBarHeight_0 (copy), v35 (copy), v18 (copy), v10 (copy), v28 (copy), v8 (copy), v11 (copy), v7 (copy), l_ImageSetLabel_0 (copy), v22 (copy), l_AppFonts_0 (copy), v9 (copy), v29 (copy), l_ItemInfoList_0 (copy)
    local l_view_0 = v74.props.view;
    local l_detailsInformation_0 = v74.props.detailsInformation;
    local v77 = v74.props.assetInfo or {};
    local l_localPlayerModel_0 = v74.props.localPlayerModel;
    local l_scrollingEnabled_0 = v74.state.scrollingEnabled;
    local l_locale_1 = v74.props.locale;
    local v81 = l_Images_0["icons/status/item/owned"];
    local v82 = v81 and v81.ImageRectSize / l_Images_0.ImagesResolutionScale or Vector2.new(0, 0);
    return v4.createElement(v30.Consumer, {
        render = function(v83) --[[ Line: 229 ]] --[[ Name: render ]]
            -- upvalues: l_view_0 (copy), v31 (ref), v20 (ref), v77 (copy), v74 (copy), l_Players_0 (ref), v21 (ref), l_ControllerBarHeight_0 (ref), v35 (ref), v4 (ref), v18 (ref), l_detailsInformation_0 (copy), v10 (ref), l_localPlayerModel_0 (copy), l_scrollingEnabled_0 (copy), v28 (ref), v8 (ref), v11 (ref), v7 (ref), v82 (copy), l_ImageSetLabel_0 (ref), v81 (copy), v22 (ref), l_locale_1 (copy), l_AppFonts_0 (ref), v9 (ref), v29 (ref), l_ItemInfoList_0 (ref)
            local v84 = v83[l_view_0];
            local v85 = 0;
            local v86 = v31() and v20.isCollectibles(v77);
            local v87 = 0;
            if v86 then
                local l_getCollectibleResellableInstances_0 = v74.props.getCollectibleResellableInstances;
                local l_resellableInstances_2 = v74.props.resellableInstances;
                local v90 = l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.UserId;
                l_getCollectibleResellableInstances_0(v77.collectibleItemId, v90);
                v87 = l_resellableInstances_2 and l_resellableInstances_2[v77.collectibleItemId] and v21.fieldCount(l_resellableInstances_2[v77.collectibleItemId]) or 0;
            end;
            local v91 = v20.isLimited2Point0_Or_LimitedCollectible(v77);
            if v74.props.gamepadEnabled then
                v85 = -1 * l_ControllerBarHeight_0;
            end;
            if v35.UIBloxThemeEnabled then
                v85 = v85 + -v35.DefaultCornerRadius.Offset;
            end;
            return v4.createElement("Frame", {
                Position = UDim2.new(0, v84.BorderPaddingSize, 0, 0), 
                Size = UDim2.new(1, -(2 * v84.BorderPaddingSize), 1, v85), 
                BackgroundTransparency = 0, 
                BackgroundColor3 = v18.Carbon, 
                BorderSizePixel = 0, 
                Visible = l_detailsInformation_0.viewingDetails
            }, {
                DetailsButtons = v4.createElement(v10, {
                    localPlayerModel = l_localPlayerModel_0
                }), 
                Container = v4.createElement("ScrollingFrame", {
                    BackgroundTransparency = 1, 
                    ScrollBarThickness = 0, 
                    Size = UDim2.new(1, 0, 1, -55), 
                    ScrollingEnabled = l_scrollingEnabled_0, 
                    Selectable = false, 
                    CanvasSize = if v28 then UDim2.new(1, 0, 0, 0) else nil, 
                    AutomaticCanvasSize = if v28 then Enum.AutomaticSize.Y else nil
                }, {
                    UIListLayout = v4.createElement("UIListLayout", {
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        Padding = UDim.new(0, 10)
                    }), 
                    DetailsThumbnail = v4.createElement(v8), 
                    TryOnViewport = l_localPlayerModel_0 and v4.createElement(v11, {
                        localPlayerModel = l_localPlayerModel_0, 
                        setScrollingEnabled = function(v92) --[[ Line: 282 ]] --[[ Name: setScrollingEnabled ]]
                            -- upvalues: v74 (ref)
                            v74:setScrollingEnabled(v92);
                        end
                    }), 
                    DetailsText = v4.createElement(v7, {
                        localPlayerModel = l_localPlayerModel_0
                    }), 
                    ItemOwnedLabelContainer = v91 and v4.createElement("Frame", {
                        Size = UDim2.new(1, 0, 0, v82.Y + 20), 
                        BorderSizePixel = 0, 
                        LayoutOrder = 3, 
                        BackgroundColor3 = Color3.fromRGB(57, 59, 61)
                    }, {
                        Corner = v4.createElement("UICorner", {
                            CornerRadius = UDim.new(0, 8)
                        }), 
                        OwnedIcon = v4.createElement(l_ImageSetLabel_0, {
                            Size = UDim2.new(0, v82.X, 0, v82.Y), 
                            Position = UDim2.new(0, 12, 0, 10), 
                            Image = v81, 
                            BackgroundTransparency = 1, 
                            BorderSizePixel = 0
                        }), 
                        ItemOwnedLabel = v4.createElement("TextLabel", {
                            Size = UDim2.new(0, v82.X, 0, v82.Y), 
                            Position = UDim2.new(0, v82.X + 60, 0, 10), 
                            Text = v22:FormatByKeyForLocale("InGame.InspectMenu.Label.OwnedItems", l_locale_1, {
                                QUANTITY = tostring(v87)
                            }), 
                            Font = l_AppFonts_0.default:getDefault(), 
                            TextSize = 12, 
                            TextColor3 = Color3.new(1, 1, 1), 
                            BackgroundTransparency = 1
                        })
                    }), 
                    DetailsDescription = v4.createElement(v9), 
                    ItemInfoList = v29 and v4.createElement(l_ItemInfoList_0, {
                        rowData = v74:getInfoRowProps(), 
                        LayoutOrder = 5
                    })
                })
            });
        end
    });
end;
return v5.UNSTABLE_connect2(function(v93, _) --[[ Line: 331 ]]
    local l_assetId_1 = v93.detailsInformation.assetId;
    return {
        view = v93.view, 
        detailsInformation = v93.detailsInformation, 
        assetInfo = v93.assets[l_assetId_1], 
        bundles = v93.bundles, 
        gamepadEnabled = v93.gamepadEnabled, 
        locale = v93.locale, 
        resellableInstances = v93.collectibleResellableInstances, 
        creatingExperiences = v93.creatingExperiences
    };
end, function(v96) --[[ Line: 344 ]]
    -- upvalues: v14 (copy), v16 (copy), v15 (copy), v17 (copy), v29 (copy), v12 (copy), v32 (copy), v33 (copy)
    return {
        getAssetBundles = function(v97) --[[ Line: 346 ]] --[[ Name: getAssetBundles ]]
            -- upvalues: v96 (copy), v14 (ref)
            v96(v14(v97));
        end, 
        getEconomyProductInfo = function(v98, v99, v100) --[[ Line: 349 ]] --[[ Name: getEconomyProductInfo ]]
            -- upvalues: v96 (copy), v16 (ref)
            v96(v16(v98, v99, v100));
        end, 
        reportOpenDetailsPage = function(v101) --[[ Line: 352 ]] --[[ Name: reportOpenDetailsPage ]]
            -- upvalues: v96 (copy), v15 (ref)
            v96(v15(v101));
        end, 
        getCollectibleResellableInstances = function(v102, v103) --[[ Line: 355 ]] --[[ Name: getCollectibleResellableInstances ]]
            -- upvalues: v96 (copy), v17 (ref)
            v96(v17(v102, v103));
        end, 
        openOverlay = v29 and function(v104, v105) --[[ Line: 359 ]]
            -- upvalues: v96 (copy), v12 (ref)
            v96(v12(v104, v105));
        end or nil, 
        getItemDetails = function(v106, v107) --[[ Line: 363 ]] --[[ Name: getItemDetails ]]
            -- upvalues: v96 (copy), v32 (ref)
            v96(v32(v106, v107));
        end, 
        setAssetFromBundleInfo = function(v108, v109) --[[ Line: 366 ]] --[[ Name: setAssetFromBundleInfo ]]
            -- upvalues: v96 (copy), v33 (ref)
            v96(v33(v108, v109));
        end
    };
end)(v37);