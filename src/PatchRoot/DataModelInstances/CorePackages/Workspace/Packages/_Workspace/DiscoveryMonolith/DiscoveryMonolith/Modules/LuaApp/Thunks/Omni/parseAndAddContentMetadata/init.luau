local l_script_FirstAncestor_0 = script:FindFirstAncestor("DiscoveryMonolith");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.DiscoveryTypes);
local l_OmniRecommendationsContentType_0 = v2.OmniRecommendationsContentType;
local l_GameInfoModel_0 = require(l_Parent_0.GameModels).GameInfoModel;
local l_parseAndAddGameInfos_0 = require(l_Parent_0.GameInfosRodux).parseAndAddGameInfos;
local l_mutedError_0 = require(l_Parent_0.Loggers).mutedError;
local l_PYMKCarouselModel_0 = require(l_Parent_0.PYMKCarousel).PYMKCarouselModel;
local l_Modules_0 = l_script_FirstAncestor_0.Modules;
local v9 = require(l_Modules_0.LuaApp.Models.DiscoveryApi.GameCoPlay);
local v10 = require(l_Modules_0.LuaApp.Models.DiscoveryApi.CatalogAsset);
local v11 = require(l_Modules_0.LuaApp.Models.DiscoveryApi.CatalogBundle);
local v12 = require(l_Modules_0.LuaApp.Actions.Games.AddContentMetadata);
local v13 = require(l_Modules_0.LuaApp.Thunks.Games.ApiFetchIconsForOmniData);
local v14 = {
    [l_OmniRecommendationsContentType_0.GameCoPlay] = v9.fromJsonData, 
    [l_OmniRecommendationsContentType_0.CatalogAsset] = v10.fromJsonData, 
    [l_OmniRecommendationsContentType_0.CatalogBundle] = v11.fromJsonData, 
    [l_OmniRecommendationsContentType_0.RecommendedFriend] = l_PYMKCarouselModel_0.fromJsonData
};
local function v29(v15, v16, v17, v18) --[[ Line: 25 ]] --[[ Name: parseAndAddContentEntries ]]
    -- upvalues: v2 (copy), l_parseAndAddGameInfos_0 (copy), l_GameInfoModel_0 (copy), v14 (copy), l_mutedError_0 (copy)
    for v19, v20 in pairs(v17) do
        if not v18[v19] then
            v18[v19] = {};
        end;
        if v19 == v2.OmniRecommendationsContentType.Game then
            l_parseAndAddGameInfos_0(v15, v16, v20, l_GameInfoModel_0.fromOmniApi, function(_, v22) --[[ Line: 32 ]]
                -- upvalues: v18 (copy), v19 (copy)
                local l_universeId_0 = v22.universeId;
                v18[v19][l_universeId_0] = v22;
            end);
        else
            local v24 = v14[v19];
            if v24 then
                for v25, v26 in pairs(v20) do
                    v24(v26):match(function(v27) --[[ Line: 46 ]]
                        -- upvalues: v18 (copy), v19 (copy), v25 (copy), l_mutedError_0 (ref)
                        if v18[v19][v25] then
                            l_mutedError_0((("Duplicate contentStringId %* found for type %*"):format(v25, v19)));
                            return;
                        else
                            v18[v19][v25] = v27;
                            return;
                        end;
                    end):matchError(function(v28) --[[ Line: 53 ]]
                        warn(v28);
                    end);
                end;
            end;
        end;
    end;
end;
return function(v30, v31, v32) --[[ Line: 61 ]] --[[ Name: parseAndAddContentMetadata ]]
    -- upvalues: v29 (copy), v12 (copy), v13 (copy)
    if not v32 then
        return {};
    elseif not v32.contentMetadata and not v32.contentMetadataByStringId then
        return {};
    else
        local v33 = {};
        v29(v30, v31, v32.contentMetadata, v33);
        if v32.contentMetadataByStringId then
            v29(v30, v31, v32.contentMetadataByStringId, v33);
        end;
        if next(v33) then
            v31:dispatch(v12(v33));
            v31:dispatch(v13(v30, v33));
        end;
        return v33;
    end;
end;