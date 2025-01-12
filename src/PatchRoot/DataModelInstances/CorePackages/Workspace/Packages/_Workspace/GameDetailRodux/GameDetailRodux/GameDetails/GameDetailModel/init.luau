local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameDetailRodux");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_DateTime_0 = require(l_Parent_0.Time).DateTime;
local v3 = require(l_script_FirstAncestor_0.GameDetails.getZendeskUrl);
local l_GetFFlagEnableSwapToSourceButton_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableSwapToSourceButton;
local l_FFlagLuaAppGenreUpdate_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppGenreUpdate;
local l_FFlagLuaAppEDPOfficial_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppEDPOfficial;
local l_FFlagLuaAppFiatPaidAccess_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppFiatPaidAccess;
local v8 = {
    new = function() --[[ Line: 57 ]] --[[ Name: new ]]
        return {};
    end
};
v8.mock = function(v9, v10, v11) --[[ Line: 63 ]] --[[ Name: mock ]]
    -- upvalues: v8 (copy), l_DateTime_0 (copy), l_GetFFlagEnableSwapToSourceButton_0 (copy), l_FFlagLuaAppGenreUpdate_0 (copy)
    local v12 = v8.new();
    local v13 = l_DateTime_0.new();
    local v14 = l_DateTime_0.fromUnixTimestamp(v13:GetUnixTimestamp() + 60);
    v12.id = v9;
    v12.rootPlaceId = "370731277";
    v12.name = v10;
    v12.description = "This is MeepCity";
    v12.sourceName = l_GetFFlagEnableSwapToSourceButton_0() and "source name" or nil;
    v12.sourceDescription = l_GetFFlagEnableSwapToSourceButton_0() and "source description" or nil;
    v12.creator = {
        id = 123247, 
        name = "alexnewtron", 
        type = "User", 
        isRNVAccount = false, 
        hasVerifiedBadge = false
    };
    v12.price = nil;
    v12.isExperimental = false;
    v12.allowedGearGenres = {
        "TownAndCity"
    };
    v12.allowedGearCategories = {};
    v12.playing = 49252;
    v12.visits = 2358954901;
    v12.maxPlayers = v11 or 110;
    v12.created = v13:GetIsoDate();
    v12.updated = v14:GetIsoDate();
    v12.studioAccessToApisAllowed = true;
    v12.universeAvatarType = "MorphToR15";
    v12.genre = "Town and City";
    if l_FFlagLuaAppGenreUpdate_0 then
        v12.genre_l1 = "Test Genre";
    end;
    v12.genre_l2 = "Test Subgenre";
    return v12;
end;
v8.fromJsonData = function(v15) --[[ Line: 101 ]] --[[ Name: fromJsonData ]]
    -- upvalues: v8 (copy), l_GetFFlagEnableSwapToSourceButton_0 (copy), l_FFlagLuaAppGenreUpdate_0 (copy), l_FFlagLuaAppEDPOfficial_0 (copy), l_FFlagLuaAppFiatPaidAccess_0 (copy), v3 (copy)
    local v16 = v8.new();
    v16.id = tostring(v15.id);
    v16.rootPlaceId = tostring(v15.rootPlaceId);
    v16.name = v15.name;
    v16.description = v15.description;
    v16.sourceName = if l_GetFFlagEnableSwapToSourceButton_0() then v15.sourceName else nil;
    v16.sourceDescription = if l_GetFFlagEnableSwapToSourceButton_0() then v15.sourceDescription else nil;
    v16.creator = {
        id = v15.creator.id, 
        name = v15.creator.name, 
        type = v15.creator.type, 
        isRNVAccount = v15.creator.isRNVAccount, 
        hasVerifiedBadge = v15.creator.hasVerifiedBadge
    };
    v16.price = v15.price;
    v16.isExperimental = v15.isExperimental;
    v16.allowedGearGenres = v15.allowedGearGenres;
    v16.allowedGearCategories = v15.allowedGearCategories;
    v16.playing = v15.playing;
    v16.visits = v15.visits;
    v16.maxPlayers = v15.maxPlayers;
    v16.created = v15.created;
    v16.updated = v15.updated;
    v16.studioAccessToApisAllowed = v15.studioAccessToApisAllowed;
    v16.universeAvatarType = v15.universeAvatarType;
    v16.genre = v15.genre;
    if l_FFlagLuaAppGenreUpdate_0 then
        v16.genre_l1 = v15.genre_l1;
    end;
    v16.genre_l2 = v15.genre_l2;
    if l_FFlagLuaAppEDPOfficial_0 then
        v16.licenseDescription = v15.licenseDescription;
    end;
    if l_FFlagLuaAppFiatPaidAccess_0 then
        v16.localizedFiatPrice = v15.localizedFiatPrice;
        v16.refundLink = v15.refundLink;
        if v15.refundPolicy then
            v16.refundPolicy = {
                policyText = v15.refundPolicy.policyText, 
                learnMoreUrl = v3(v15.refundPolicy.learnMoreBaseUrl, v15.refundPolicy.locale, v15.refundPolicy.articleId)
            };
        end;
    end;
    return v16;
end;
return v8;