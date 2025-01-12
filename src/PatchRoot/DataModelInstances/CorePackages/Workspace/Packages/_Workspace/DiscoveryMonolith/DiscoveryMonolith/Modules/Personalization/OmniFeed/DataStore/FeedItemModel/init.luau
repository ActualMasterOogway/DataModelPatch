local l_script_FirstAncestor_0 = script:FindFirstAncestor("DiscoveryMonolith");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_isSubjectToDesktopPolicies_0 = require(l_Parent_0.SharedFlags).isSubjectToDesktopPolicies;
local _ = require(l_Parent_0.DiscoveryTypes);
local l_Modules_0 = l_script_FirstAncestor_0.Modules;
local v5 = require(l_Modules_0.Personalization.OmniFeed.OmniFeedTypes);
local v6 = require(l_Modules_0.Personalization.OmniFeed.OmniFeedConstants);
local v7 = require(l_Modules_0.Personalization.Games.CollectionViewsExperimentation);
local l_FFlagLuaAppPropagateFriendsCarouselHeader_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppPropagateFriendsCarouselHeader;
local l_FFlagSearchOmniAutocompletePage_0 = require(l_Parent_0.SharedFlags).FFlagSearchOmniAutocompletePage;
local l_FFlagLuaAppPYMKCollectionMigration_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppPYMKCollectionMigration;
local l_FFlagLuaAppPYMKCollectionMigrationIXP_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppPYMKCollectionMigrationIXP;
local l_FFlagLuaAppTopChartsFiltersEnabled_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppTopChartsFiltersEnabled;
local v30 = {
    fromLocalData = function(v13, v14, v15, v16) --[[ Line: 24 ]] --[[ Name: fromLocalData ]]
        -- upvalues: v6 (copy)
        return {
            orderHint = v13, 
            treatmentType = v14, 
            treatmentProps = v15, 
            numberOfRows = v16 or 1, 
            dataSource = v6.DataSource.Local
        };
    end, 
    fromGamesApi = function(v17, v18, v19) --[[ Line: 41 ]] --[[ Name: fromGamesApi ]]
        -- upvalues: v5 (copy), v6 (copy)
        return {
            treatmentType = v5.Carousel, 
            numberOfRows = 1, 
            itemId = {
                sortName = v18, 
                sortIndex = v17
            }, 
            treatmentProps = {
                sortIndex = v17, 
                isOmni = false, 
                topicLayoutData = v19
            }, 
            dataSource = v6.DataSource.GamesApi
        };
    end, 
    fromExploreTopicInfo = function(v20, v21) --[[ Line: 60 ]] --[[ Name: fromExploreTopicInfo ]]
        -- upvalues: v6 (copy), l_FFlagLuaAppTopChartsFiltersEnabled_0 (copy), v5 (copy)
        local v22 = {
            treatmentType = v21.treatmentType, 
            numberOfRows = 1, 
            itemId = {
                sortName = v21.name, 
                sortIndex = v20
            }, 
            dataSource = v6.DataSource.GamesApi
        };
        if l_FFlagLuaAppTopChartsFiltersEnabled_0 then
            if v21.treatmentType == v5.Pills then
                v22.treatmentProps = {
                    sortIndex = v20, 
                    gameSortId = v21.name, 
                    topicName = v21.displayName, 
                    isOmni = false, 
                    topicLayoutData = v21.topicLayoutData
                };
                return v22;
            else
                v22.treatmentProps = {
                    sortIndex = v20, 
                    isOmni = false, 
                    topicLayoutData = v21.topicLayoutData
                };
                return v22;
            end;
        else
            v22.treatmentProps = {
                sortIndex = v20, 
                isOmni = false, 
                topicLayoutData = v21.topicLayoutData
            };
            return v22;
        end;
    end, 
    fromDiscoveryApi = function(v23, v24) --[[ Line: 98 ]] --[[ Name: fromDiscoveryApi ]]
        -- upvalues: v6 (copy), v5 (copy), l_FFlagLuaAppPropagateFriendsCarouselHeader_0 (copy), l_FFlagLuaAppPYMKCollectionMigration_0 (copy), l_isSubjectToDesktopPolicies_0 (copy), l_FFlagLuaAppPYMKCollectionMigrationIXP_0 (copy), v7 (copy)
        local l_treatmentType_0 = v24.treatmentType;
        local v26 = {
            treatmentType = l_treatmentType_0, 
            numberOfRows = v24.numberOfRows, 
            dataSource = v6.DataSource.DiscoveryApi
        };
        if l_treatmentType_0 == v5.Carousel or l_treatmentType_0 == v5.AvatarCarousel then
            v26.itemId = {
                topicId = v24.topicId, 
                sortIndex = v23
            };
            v26.treatmentProps = {
                sortIndex = v23, 
                topicLayoutData = v24.topicLayoutData, 
                isOmni = true
            };
            return v26;
        elseif l_treatmentType_0 == v5.HomeGameGrid then
            v26.itemId = {
                topicId = v24.topicId, 
                sortIndex = v23
            };
            v26.treatmentProps = {
                sortIndex = v23, 
                topicId = v24.topicId, 
                topicName = v24.topic, 
                topicLayoutData = v24.topicLayoutData, 
                numberOfRows = v24.numberOfRows
            };
            return v26;
        elseif l_treatmentType_0 == v5.JoinYourFriendsCarousel then
            v26.treatmentProps = {
                topicId = v24.topicId, 
                topicLayoutData = v24.topicLayoutData
            };
            return v26;
        elseif l_FFlagLuaAppPropagateFriendsCarouselHeader_0 and l_treatmentType_0 == v5.FriendCarousel then
            v26.treatmentProps = {
                topic = v24.topic
            };
            return v26;
        else
            if (l_FFlagLuaAppPYMKCollectionMigration_0 or not l_isSubjectToDesktopPolicies_0()) and l_treatmentType_0 == v5.FriendRecommendationCarousel and (l_FFlagLuaAppPYMKCollectionMigration_0 and (not l_FFlagLuaAppPYMKCollectionMigrationIXP_0 or v7.getIsPYMKCollectionCarouselEnabled()) or not l_isSubjectToDesktopPolicies_0()) then
                v26.treatmentProps = {
                    sortIndex = v23, 
                    carouselTitle = v24.topic, 
                    topicLayoutData = v24.topicLayoutData
                };
            end;
            return v26;
        end;
    end, 
    getUniqueNameForAnalytics = function(v27) --[[ Line: 160 ]] --[[ Name: getUniqueNameForAnalytics ]]
        -- upvalues: v5 (copy)
        if not v27 then
            return nil;
        elseif not v27.treatmentType then
            return nil;
        else
            if v27.treatmentType == v5.Carousel then
                local l_itemId_0 = v27.itemId;
                if l_itemId_0.topicId then
                    return "topicId:" .. l_itemId_0.topicId .. "_" .. l_itemId_0.sortIndex;
                elseif l_itemId_0.sortName then
                    return "sortId:" .. l_itemId_0.sortName .. "_" .. l_itemId_0.sortIndex;
                end;
            end;
            if v27.treatmentType == v5.HomeGameGrid then
                local l_itemId_1 = v27.itemId;
                if l_itemId_1.topicId then
                    return "GameGrid_topicId:" .. l_itemId_1.topicId .. "_" .. l_itemId_1.sortIndex;
                end;
            end;
            return "type:" .. v27.treatmentType;
        end;
    end
};
v30.getUniqueNameForFeed = function(v31) --[[ Line: 191 ]] --[[ Name: getUniqueNameForFeed ]]
    -- upvalues: v30 (copy)
    return v30.getUniqueNameForAnalytics(v31);
end;
v30.fromSearchApi = function(v32, v33, v34, v35, v36) --[[ Line: 195 ]] --[[ Name: fromSearchApi ]]
    -- upvalues: v6 (copy)
    return {
        treatmentType = v34, 
        itemId = {
            topicId = v33, 
            sortIndex = v35
        }, 
        treatmentProps = {
            searchUuid = v32, 
            topicId = v33, 
            topicLayoutData = v36
        }, 
        dataSource = v6.DataSource.SearchApi, 
        numberOfRows = if v36 then v36.numOfRows else nil
    };
end;
if l_FFlagSearchOmniAutocompletePage_0 then
    v30.fromOmniAutocompleteApi = function(v37, v38) --[[ Line: 222 ]] --[[ Name: fromOmniAutocompleteApi ]]
        -- upvalues: v6 (copy), v5 (copy)
        local l_treatmentType_1 = v38.treatmentType;
        local v40 = {
            treatmentType = l_treatmentType_1, 
            dataSource = v6.DataSource.OmniAutocompleteApi, 
            itemId = {
                topicId = v38.sortId, 
                sortIndex = v37
            }
        };
        if l_treatmentType_1 == v5.Carousel then
            v40.treatmentProps = {
                sortIndex = v37, 
                sortName = v38.sortId, 
                topicLayoutData = v38.topicLayoutData, 
                isOmni = false
            };
            return v40;
        else
            if l_treatmentType_1 == v5.SearchPillCarousel then
                v40.treatmentProps = {
                    sortIndex = v37, 
                    sortName = v38.sortId, 
                    topicLayoutData = v38.topicLayoutData, 
                    isOmni = false
                };
            end;
            return v40;
        end;
    end;
end;
return v30;