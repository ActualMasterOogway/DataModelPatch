local l_Parent_0 = script:FindFirstAncestor("TopicContentsRodux").Parent;
local l_OmniRecommendationsContentType_0 = require(l_Parent_0.DiscoveryTypes).OmniRecommendationsContentType;
local v2 = require(l_Parent_0.Result);
local l_FFlagSearchOmniAutocompletePage_0 = require(l_Parent_0.SharedFlags).FFlagSearchOmniAutocompletePage;
local v6 = {
    new = function() --[[ Line: 13 ]] --[[ Name: new ]]
        return {};
    end, 
    mock = function(v4) --[[ Line: 19 ]] --[[ Name: mock ]]
        -- upvalues: l_OmniRecommendationsContentType_0 (copy)
        local v5 = {
            contentType = l_OmniRecommendationsContentType_0.Game, 
            contentId = v4 or "149757", 
            isSponsored = false
        };
        v5.isShowSponsoredLabel = v5.isSponsored;
        v5.adId = nil;
        return v5;
    end
};
v6.fromGamesApiData = function(v7) --[[ Line: 29 ]] --[[ Name: fromGamesApiData ]]
    -- upvalues: v2 (copy), v6 (copy), l_OmniRecommendationsContentType_0 (copy)
    if type(v7.universeId) ~= "number" and type(v7.universeId) ~= "string" then
        return v2.error("TopicContentsEntryModel.fromGamesApiData expects universeId to be a number or a string");
    else
        local v8 = v6.new();
        v8.contentType = l_OmniRecommendationsContentType_0.Game;
        v8.contentId = tostring(v7.universeId);
        v8.isSponsored = v7.isSponsored;
        v8.isShowSponsoredLabel = nil;
        if v7.isShowSponsoredLabel == nil then
            v8.isShowSponsoredLabel = true;
        else
            v8.isShowSponsoredLabel = v7.isShowSponsoredLabel;
        end;
        v8.adId = v7.nativeAdData;
        return v2.success(v8);
    end;
end;
if l_FFlagSearchOmniAutocompletePage_0 then
    v6.fromOmniAutocompleteApi = function(v9) --[[ Line: 52 ]] --[[ Name: fromOmniAutocompleteApi ]]
        -- upvalues: v2 (copy), v6 (copy), l_OmniRecommendationsContentType_0 (copy)
        if type(v9.universeId) ~= "number" and type(v9.universeId) ~= "string" then
            return v2.error("TopicContentsEntryModel.fromOmniAutocomplete expects universeId to be a number or a string");
        else
            local v10 = v6.new();
            v10.contentType = l_OmniRecommendationsContentType_0.Game;
            v10.contentId = tostring(v9.universeId);
            return v2.success(v10);
        end;
    end;
end;
v6.fromExploreApiData = function(v11) --[[ Line: 69 ]] --[[ Name: fromExploreApiData ]]
    -- upvalues: v2 (copy), v6 (copy), l_OmniRecommendationsContentType_0 (copy)
    if type(v11.universeId) ~= "number" and type(v11.universeId) ~= "string" then
        return v2.error("TopicContentsEntryModel.fromExploreApiData expects universeId to be a number or a string");
    else
        local v12 = v6.new();
        v12.contentType = l_OmniRecommendationsContentType_0.Game;
        v12.contentId = tostring(v11.universeId);
        v12.isSponsored = v11.isSponsored;
        v12.adId = v11.nativeAdData;
        v12.isShowSponsoredLabel = nil;
        return v2.success(v12);
    end;
end;
v6.fromOmniRecommendations = function(v13) --[[ Line: 84 ]] --[[ Name: fromOmniRecommendations ]]
    -- upvalues: v6 (copy), v2 (copy)
    local v14 = v6.new();
    v14.contentType = v13.contentType;
    v14.contentId = tostring(v13.contentId);
    v14.adId = v13.contentMetadata and v13.contentMetadata.EncryptedAdTrackingData or nil;
    local v15 = false;
    if v14.adId ~= nil then
        v15 = v14.adId ~= "";
    end;
    v14.isSponsored = v15;
    v14.isShowSponsoredLabel = nil;
    return v2.success(v14);
end;
return v6;