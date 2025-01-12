local l_Parent_0 = script:FindFirstAncestor("TopicInfosRodux").Parent;
local _ = require(l_Parent_0.DiscoveryTypes);
local l_FFlagSearchOmniAutocompletePage_0 = require(l_Parent_0.SharedFlags).FFlagSearchOmniAutocompletePage;
local l_FFlagLuaAppTopChartsFiltersEnabled_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppTopChartsFiltersEnabled;
local l_FFlagEnableChartsSubtitleLink_0 = require(l_Parent_0.SharedFlags).FFlagEnableChartsSubtitleLink;
local v5 = {
    default = "LuaApp/category/filter_default", 
    Featured = "LuaApp/category/filter_featured", 
    FriendActivity = "LuaApp/category/filter_friendsplaying", 
    MyFavorite = "LuaApp/category/filter_myfavorites", 
    MyRecent = "LuaApp/category/filter_continueplaying", 
    Popular = "LuaApp/category/filter_popular", 
    PopularInCountry = "LuaApp/category/filter_popularnearyou", 
    TopGrossing = "LuaApp/category/filter_topearning", 
    TopRated = "LuaApp/category/filter_toprated", 
    TopRetaining = "LuaApp/category/filter_recommended"
};
local v6 = {};
v6.__index = v6;
v6.new = function() --[[ Line: 37 ]] --[[ Name: new ]]
    -- upvalues: v6 (copy)
    local v7 = {};
    setmetatable(v7, v6);
    return v7;
end;
v6.mockFromGamesApi = function(v8, v9) --[[ Line: 45 ]] --[[ Name: mockFromGamesApi ]]
    -- upvalues: v6 (copy)
    return (v6.fromGamesApi({
        name = v8, 
        displayName = "", 
        token = "", 
        contextUniverseId = "", 
        contextCountryRegionId = "", 
        gameSetTypeId = v9 or 0
    }));
end;
v6.mockFromExploreJsonData = function(v10, v11) --[[ Line: 58 ]] --[[ Name: mockFromExploreJsonData ]]
    -- upvalues: v6 (copy)
    return (v6.fromExploreJsonData({
        sortDisplayName = "", 
        sortId = v10, 
        gameSetTargetId = 0, 
        gameSetTypeId = 0, 
        topicLayoutData = {}, 
        treatmentType = v11
    }));
end;
v6.mockFromOmniApi = function(v12) --[[ Line: 71 ]] --[[ Name: mockFromOmniApi ]]
    -- upvalues: v6 (copy)
    return (v6.fromOmniApi({
        topicId = v12, 
        topic = "", 
        treatmentType = ""
    }));
end;
v6.fromGamesApi = function(v13) --[[ Line: 80 ]] --[[ Name: fromGamesApi ]]
    -- upvalues: v6 (copy), v5 (copy)
    local v14 = v6.new();
    v14.name = v13.name;
    v14.displayName = v13.displayName;
    v14.token = v13.token;
    v14.contextUniverseId = v13.contextUniverseId;
    v14.contextCountryRegionId = v13.contextCountryRegionId;
    v14.gameSetTypeId = tostring(v13.gameSetTypeId);
    v14.gameSetTargetId = v13.gameSetTargetId;
    v14.treatmentType = "Carousel";
    if v14.name ~= nil then
        v14.displayIcon = v5[v14.name];
    end;
    if v14.displayIcon == nil then
        v14.displayIcon = v5.default;
    end;
    v14.uniqueKey = v14.name;
    v14.analyticsTypeId = v14.gameSetTypeId;
    return v14;
end;
v6.fromExploreJsonData = function(v15) --[[ Line: 108 ]] --[[ Name: fromExploreJsonData ]]
    -- upvalues: v6 (copy), l_FFlagEnableChartsSubtitleLink_0 (copy), l_FFlagLuaAppTopChartsFiltersEnabled_0 (copy), v5 (copy)
    local v16 = v6.new();
    v16.displayName = v15.sortDisplayName;
    v16.name = v15.sortId;
    v16.subtitle = if l_FFlagEnableChartsSubtitleLink_0 then v15.subtitle else nil;
    v16.token = "";
    v16.gameSetTargetId = v15.gameSetTargetId;
    v16.gameSetTypeId = tostring(v15.gameSetTypeId);
    v16.topicLayoutData = v15.topicLayoutData;
    v16.treatmentType = v15.treatmentType;
    if l_FFlagLuaAppTopChartsFiltersEnabled_0 then
        v16.appliedFilters = v15.appliedFilters;
        v16.subtitle = v15.subtitle;
    end;
    if v16.name ~= nil then
        v16.displayIcon = v5[v16.name];
    end;
    if v16.displayIcon == nil then
        v16.displayIcon = v5.default;
    end;
    v16.uniqueKey = v16.name;
    v16.analyticsTypeId = v16.gameSetTypeId;
    return v16;
end;
v6.fromOmniApi = function(v17) --[[ Line: 138 ]] --[[ Name: fromOmniApi ]]
    -- upvalues: v6 (copy)
    local v18 = v6.new();
    v18.displayName = v17.topic;
    v18.topicId = tostring(v17.topicId);
    v18.subtitle = v17.subtitle;
    v18.treatmentType = v17.treatmentType;
    v18.uniqueKey = v18.topicId;
    v18.analyticsTypeId = v18.topicId;
    v18.fromOmni = true;
    return v18;
end;
if l_FFlagSearchOmniAutocompletePage_0 then
    v6.fromOmniAutocompleteApi = function(v19) --[[ Line: 153 ]] --[[ Name: fromOmniAutocompleteApi ]]
        -- upvalues: v6 (copy)
        local v20 = v6.new();
        v20.displayName = v19.sortDisplayName;
        v20.name = v19.sortId;
        v20.topicLayoutData = v19.topicLayoutData or {};
        v20.uniqueKey = v20.name;
        v20.analyticsTypeId = v20.name;
        v20.gameSetTypeId = v20.name;
        return v20;
    end;
end;
v6.makeTopSearchTopicKey = function(v21, v22) --[[ Line: 167 ]] --[[ Name: makeTopSearchTopicKey ]]
    return (("%*_%*"):format(v21, v22));
end;
v6.fromTopSearchApi = function(v23, v24) --[[ Line: 171 ]] --[[ Name: fromTopSearchApi ]]
    -- upvalues: v6 (copy)
    local v25 = v6.new();
    v25.topicId = tostring(v23.topicId);
    v25.treatmentType = v23.treatmentType;
    v25.topicLayoutData = v23.topicLayoutData or {};
    v25.searchUuid = v24;
    v25.uniqueKey = v6.makeTopSearchTopicKey(v25.searchUuid, v25.topicId);
    v25.analyticsTypeId = v25.uniqueKey;
    return v25;
end;
v6.isOmni = function(v26) --[[ Line: 184 ]] --[[ Name: isOmni ]]
    if v26.fromOmni then
        return true;
    else
        return false;
    end;
end;
v6.isSponsored = function(v27) --[[ Line: 192 ]] --[[ Name: isSponsored ]]
    if v27.topicId == "400000000" then
        return true;
    elseif v27.gameSetTypeId == "27" then
        return true;
    else
        return false;
    end;
end;
return v6;