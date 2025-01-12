local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_Images_0 = require(l_CorePackages_0.Packages.UIBlox).App.ImageSet.Images;
local l_Parent_0 = script.Parent.Parent;
local v4 = require(l_Parent_0.Components.LimitedLabel);
local v5 = require(l_Parent_0.Constants);
local v6 = require(l_CorePackages_0.Packages.Roact);
local v7 = require(l_CorePackages_0.Packages.RoactRodux);
local v8 = require(l_Parent_0.UtilityFunctions);
local v9 = require(l_CoreGui_0.RobloxGui.Modules.RobloxTranslator);
local v10 = require(l_Parent_0.Components.InspectAndBuyContext);
local v11 = require(l_Parent_0.Flags.GetFFlagDisplayCollectiblesIcon);
local v12 = require(l_Parent_0.Flags.GetFFlagIBEnableCollectiblesSystemSupport);
local v13 = game:DefineFastFlag("FixBundleThumbnailOnDetailPage", false);
local v14 = v6.PureComponent:extend("DetailsThumbnail");
local function _(v15) --[[ Line: 25 ]] --[[ Name: isPartOfBundleAndOffsale ]]
    return v15 and v15.parentBundleId ~= nil or false;
end;
v14.getUrl = function(v17) --[[ Line: 29 ]] --[[ Name: getUrl ]]
    -- upvalues: v8 (copy), v13 (copy)
    local l_assetInfo_0 = v17.props.assetInfo;
    local l_detailsInformation_0 = v17.props.detailsInformation;
    local l_bundles_0 = v17.props.bundles;
    local v21 = v8.getBundleId(l_assetInfo_0);
    local v22 = l_assetInfo_0 and l_assetInfo_0.parentBundleId ~= nil or false;
    local _ = "";
    if v22 and l_bundles_0[v21] and l_bundles_0[v21].costumeId then
        if v13 then
            return "rbxthumb://type=BundleThumbnail&id=" .. tostring(v21) .. "&w=420&h=420";
        else
            return "rbxthumb://type=Outfit&id=" .. l_bundles_0[v21].costumeId .. "&w=420&h=420";
        end;
    else
        return "rbxthumb://type=Asset&id=" .. l_detailsInformation_0.assetId .. "&w=420&h=420";
    end;
end;
v14.render = function(v24) --[[ Line: 54 ]] --[[ Name: render ]]
    -- upvalues: l_Images_0 (copy), v6 (copy), v10 (copy), v11 (copy), v8 (copy), v12 (copy), v5 (copy), v9 (copy), v4 (copy)
    local l_view_0 = v24.props.view;
    local l_detailsInformation_1 = v24.props.detailsInformation;
    local l_tryingOnInfo_0 = v24.props.tryingOnInfo;
    local l_locale_0 = v24.props.locale;
    local l_assetInfo_1 = v24.props.assetInfo;
    local v30 = l_Images_0["icons/status/item/limited"];
    local v31 = v30 and v30.ImageRectSize / l_Images_0.ImagesResolutionScale or Vector2.new(0, 0);
    return v6.createElement(v10.Consumer, {
        render = function(v32) --[[ Line: 64 ]] --[[ Name: render ]]
            -- upvalues: l_view_0 (copy), v11 (ref), v8 (ref), l_assetInfo_1 (copy), v12 (ref), v5 (ref), v31 (copy), v9 (ref), l_locale_0 (copy), v6 (ref), l_tryingOnInfo_0 (copy), l_detailsInformation_1 (copy), v24 (copy), v4 (ref)
            local v33 = v32[l_view_0];
            local v34 = v11() and v8.isCollectibles(l_assetInfo_1);
            local v35 = nil;
            local v36 = nil;
            local v37 = nil;
            local v38 = nil;
            if v12() and l_assetInfo_1 then
                v35 = v8.hasLimitedQuantity(l_assetInfo_1);
                v36 = v8.isLimited1Point0_LimitedUnique(l_assetInfo_1) or v8.isLimited2Point0_Or_LimitedCollectible(l_assetInfo_1);
                local v39 = if v36 then v5.LimitedIconFrameSizeXOffset * 2 else v5.LimitedIconFrameSizeXOffset;
                v37 = UDim2.new(0, v31.X + v39, 0, v31.Y + v5.LimitedIconFrameSizeYOffset);
                v38 = if v36 then "#" .. "    " .. v9:FormatByKeyForLocale("InGame.InspectMenu.Label.LimitedItems", l_locale_0) else "    " .. v9:FormatByKeyForLocale("InGame.InspectMenu.Label.LimitedItems", l_locale_0);
            end;
            return v6.createElement("Frame", {
                Position = v33.DetailsThumbnailFramePosition, 
                Size = UDim2.new(1, 0, 0, v11() and v5.DetailsThumbnailFrameHeight or 300), 
                BackgroundTransparency = 1, 
                LayoutOrder = 2, 
                Visible = not l_tryingOnInfo_0.tryingOn
            }, {
                Thumbnail = l_detailsInformation_1.viewingDetails and v6.createElement("ImageLabel", {
                    Position = v33.DetailsThumbnailPosition, 
                    AnchorPoint = v33.DetailsThumbnailAnchorPoint, 
                    Size = UDim2.new(1, 0, 1, 0), 
                    BackgroundTransparency = 1, 
                    Image = v24:getUrl()
                }, {
                    AspectRatioConstraint = v6.createElement("UIAspectRatioConstraint", {
                        AspectRatio = 1, 
                        AspectType = Enum.AspectType.FitWithinMaxSize, 
                        DominantAxis = v33.DetailsThumbnailARDominantAxis
                    })
                }), 
                LimitedLabel = (if v12() then v35 else v34) and v6.createElement(v4, {
                    frameSize = if v12() then v37 else UDim2.new(0, v31.X + 18, 0, v31.Y + 6), 
                    framePosition = UDim2.new(0, 0, 0, v5.DetailsThumbnailFrameHeight - v31.Y - 8), 
                    imageSize = UDim2.new(0, v31.X, 0, v31.Y), 
                    imagePosition = UDim2.new(0, 4, 0, 3), 
                    textSize = UDim2.new(0, 4 + v31.X, 0, v31.Y), 
                    textPosition = UDim2.new(0, 5 + v31.X, 0, 3), 
                    text = if v12() then v38 else "#" .. "    " .. v9:FormatByKeyForLocale("InGame.InspectMenu.Label.LimitedItems", l_locale_0)
                })
            });
        end
    });
end;
return v7.UNSTABLE_connect2(function(v40, _) --[[ Line: 139 ]]
    local l_assetId_0 = v40.detailsInformation.assetId;
    return {
        view = v40.view, 
        tryingOnInfo = v40.tryingOnInfo, 
        detailsInformation = v40.detailsInformation, 
        assetInfo = v40.assets[l_assetId_0], 
        locale = v40.locale, 
        bundles = v40.bundles
    };
end)(v14);