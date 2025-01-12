local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_Parent_0 = script:FindFirstAncestor("GameCollections").Parent;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local v3 = require(l_Parent_0.ArgCheck);
local v4 = require(l_Parent_0.LoggingProtocol);
local v5 = require(l_Parent_0.Cryo);
local _ = require(l_Parent_0.DiscoveryTypes);
local l_getGameTileLayoutData_0 = require(l_Parent_0.GameTile).getGameTileLayoutData;
local l_getValidTileBadges_0 = require(l_Parent_0.GameTile).getValidTileBadges;
local v9 = require(script.Parent.gameImpressionsEvent);
local v10 = require(script.Parent.reportGameImpressionCounts);
local v11 = require(script.Parent.FeedItemRowDataHitCounter);
local v12 = require(script.Parent.FeedItemRowDataMissingCounter);
local l_FFlagLuaAppTopChartsFiltersEnabled_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppTopChartsFiltersEnabled;
local function v50(v14, v15, v16, v17, v18, v19) --[[ Line: 20 ]] --[[ Name: addGameFields ]]
    -- upvalues: v3 (copy), l_getGameTileLayoutData_0 (copy), l_getValidTileBadges_0 (copy), v5 (copy)
    local v20 = {};
    local v21 = {};
    local v22 = {};
    local v23 = {};
    local v24 = {};
    local v25 = {};
    local v26 = {};
    local v27 = {};
    local v28 = {};
    local v29 = {};
    local v30 = {};
    local v31 = {};
    local v32 = false;
    for _, v34 in ipairs(v14) do
        local v35 = v15[v34];
        if v35 ~= nil then
            local v36 = v35.uiIndex or v34;
            local v37 = v35.topicContentsIndex or v34;
            table.insert(v20, v35.placeId or 0);
            table.insert(v21, v34);
            table.insert(v23, v35.universeId or 0);
            table.insert(v22, v37);
            if v35.isSponsored then
                v32 = true;
                table.insert(v26, 1);
                table.insert(v27, v35.adId or 0);
            else
                table.insert(v26, 0);
                table.insert(v27, 0);
            end;
            local v38 = nil;
            local v39 = nil;
            if v16 and v16 > 0 then
                v38 = math.ceil(v36 / v16);
                v39 = v36 % v16;
                if v39 == 0 then
                    v39 = v16;
                end;
                table.insert(v28, v38);
            else
                v3.assert(v16 ~= 0);
                v38 = 1;
                v39 = v36;
            end;
            if v18 then
                table.insert(v29, v18 + v38 - 1);
                table.insert(v30, v39);
            end;
            if v17 then
                local v40 = l_getGameTileLayoutData_0(v35, v19);
                table.insert(v24, v40 and v40.primaryMediaAsset and v40.primaryMediaAsset.wideImageAssetId or v35 and v35.primaryWideAssetId or nil or "0");
                table.insert(v25, v40 and v40.primaryMediaAsset and v40.primaryMediaAsset.wideImageListId or v35 and v35.primaryWideListId or "0");
                local v41 = nil;
                if v40 and v40.tileBadgesByPosition then
                    local v42 = l_getValidTileBadges_0(v40.tileBadgesByPosition);
                    local v43 = {};
                    for v44, v45 in v42 do
                        local v47 = v5.List.map(v45, function(v46) --[[ Line: 114 ]]
                            return v46.analyticsId;
                        end);
                        if #v47 > 0 then
                            table.insert(v43, v44 .. "=" .. table.concat(v47, "+"));
                        end;
                    end;
                    if #v43 > 0 then
                        v41 = table.concat(v43, "&");
                    end;
                end;
                table.insert(v31, v41 or "0");
            end;
        end;
    end;
    local v48 = #v20;
    v3.assert(v48 == #v21);
    v3.assert(v48 == #v22);
    v3.assert(v48 == #v23);
    v3.assert(v48 == #v26);
    v3.assert(v48 == #v27);
    if #v28 > 0 then
        v3.assert(v48 == #v28);
    end;
    if #v29 > 0 then
        v3.assert(v48 == #v29);
    end;
    if #v30 > 0 then
        v3.assert(v48 == #v30);
    end;
    local v49 = {
        rootPlaceIds = table.concat(v20, ","), 
        absPositions = table.concat(v21, ","), 
        topicDataPositions = table.concat(v22, ","), 
        universeIds = table.concat(v23, ",")
    };
    if v32 then
        v49.adFlags = table.concat(v26, ",");
        v49.adIds = table.concat(v27, ",");
    end;
    if #v28 > 0 then
        v49.rows = table.concat(v28, ",");
    end;
    if #v29 > 0 then
        v49.rowsOnPage = table.concat(v29, ",");
    end;
    if #v30 > 0 then
        v49.positionsInRows = table.concat(v30, ",");
    end;
    if v17 and #v24 > 0 then
        v49.thumbnailAssetIds = table.concat(v24, ",");
    end;
    if v17 and #v25 > 0 then
        v49.thumbnailListIds = table.concat(v25, ",");
    end;
    if v17 and #v31 > 0 then
        v49.tileBadgeContexts = table.concat(v31, ",");
    end;
    return v49, v48;
end;
return {
    sendFromTopicContents = function(v51, v52, v53, v54, v55, v56, v57, v58, v59, v60, v61, v62, v63, v64) --[[ Line: 187 ]]
        -- upvalues: l_AppPage_0 (copy), v4 (copy), v11 (copy), v12 (copy), v50 (copy), v5 (copy), l_LocalizationService_0 (copy), l_FFlagLuaAppTopChartsFiltersEnabled_0 (copy), v9 (copy), v10 (copy)
        if not v51 or not v52 then
            return;
        elseif not v53 or #v53 == 0 then
            return;
        elseif not v54 or #v54 == 0 then
            return;
        else
            local v65 = nil;
            if v55 == l_AppPage_0.Home and v58 then
                if v58.startRowNumber and v58.numberOfRows then
                    v4.default:logRobloxTelemetryCounter(v11);
                else
                    v4.default:logRobloxTelemetryCounter(v12);
                end;
                v65 = if v58.numberOfRows == 0 then nil else v58.startRowNumber;
            end;
            local v66 = nil;
            local v67 = nil;
            local v68, v69 = v50(v53, v54, v61, v62, v65, v56);
            v66 = v68;
            v67 = v69;
            v66 = v5.Dictionary.join(v66, {
                sortPos = v57, 
                gameSetTypeId = v56, 
                gameSetTargetId = v59, 
                pageId = v60, 
                componentType = v63, 
                locale = l_LocalizationService_0.RobloxLocaleId, 
                appliedFilters = if l_FFlagLuaAppTopChartsFiltersEnabled_0 then v64 else nil
            });
            v9(v51, v55, v66);
            v10(v52, v55, v67);
            return;
        end;
    end, 
    sendFromSearch = function(v70, v71, v72, v73, v74, v75, v76, v77) --[[ Line: 253 ]]
        -- upvalues: v50 (copy), l_LocalizationService_0 (copy), v5 (copy), v9 (copy), v10 (copy)
        if not v70 or not v71 then
            return;
        elseif not v72 or #v72 == 0 then
            return;
        elseif not v73 or #v73 == 0 then
            return;
        else
            local v78, v79 = v50(v72, v73, v76, nil, v77);
            v78.locale = l_LocalizationService_0.RobloxLocaleId;
            v78 = v5.Dictionary.join(v78, v75);
            v9(v70, v74, v78);
            v10(v71, v74, v79);
            return;
        end;
    end, 
    sendFromGameDetails = function(v80, v81, v82, v83, v84) --[[ Line: 284 ]]
        -- upvalues: v50 (copy), l_LocalizationService_0 (copy), v9 (copy), v10 (copy)
        local v85, v86 = v50(v82, v83);
        v85.locale = l_LocalizationService_0.RobloxLocaleId;
        v85.refId = v84;
        v9(v80, "recommended", v85);
        v10(v81, "recommended", v86);
    end, 
    sendFromSeeAll = function(v87, v88, v89, v90, v91, v92, v93, v94, v95) --[[ Line: 299 ]]
        -- upvalues: v50 (copy), v5 (copy), l_LocalizationService_0 (copy), l_FFlagLuaAppTopChartsFiltersEnabled_0 (copy), v9 (copy), v10 (copy)
        if not v87 or not v88 then
            return;
        elseif not v89 or #v89 == 0 then
            return;
        elseif not v90 or #v90 == 0 then
            return;
        else
            local v96, v97 = v50(v89, v90);
            v96 = v5.Dictionary.join(v96, {
                gameSetTypeId = v92, 
                gameSetTargetId = v93, 
                pageId = v94, 
                locale = l_LocalizationService_0.RobloxLocaleId, 
                seeAllFlag = 1, 
                appliedFilters = if l_FFlagLuaAppTopChartsFiltersEnabled_0 then v95 else nil
            });
            v9(v87, v91, v96);
            v10(v88, v91, v97, 1);
            return;
        end;
    end
};