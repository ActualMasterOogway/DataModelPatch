local l_script_FirstAncestor_0 = script:FindFirstAncestor("DiscoveryMonolith");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Result);
local l_Modules_0 = l_script_FirstAncestor_0.Modules;
local v4 = require(l_Modules_0.LuaApp.Flags.GetFFlagShowCreatorNameOnEmphasisSearchTileIXP);
local v5 = {
    new = function() --[[ Line: 24 ]] --[[ Name: new ]]
        return {};
    end
};
v5.mock = function(v6, v7) --[[ Line: 30 ]] --[[ Name: mock ]]
    -- upvalues: v5 (copy)
    local v8 = v5.new();
    v8.name = "test name";
    v8.universeId = v6 or "149757";
    v8.placeId = v7 or "384314";
    v8.isSponsored = false;
    v8.isShowSponsoredLabel = v8.isSponsored;
    v8.adId = nil;
    v8.playerCount = 150;
    v8.creatorName = "test name";
    v8.creatorHasVerifiedBadge = false;
    v8.topicId = "test_topic";
    return v8;
end;
v5.fromJsonData = function(v9, v10) --[[ Line: 45 ]] --[[ Name: fromJsonData ]]
    -- upvalues: v2 (copy), v5 (copy), v4 (copy)
    if v10 and type(v9.universeId) ~= "number" and type(v9.universeId) ~= "string" then
        return v2.error("GameSearchEntry.fromJsonData expects universeId to be a number or a string for game contents");
    elseif v10 and type(v9.placeId) ~= "number" and type(v9.placeId) ~= "string" then
        return v2.error("GameSearchEntry.fromJsonData expects placeId to be a number or a string for game contents");
    else
        local v11 = v5.new();
        v11.name = v9.name;
        v11.topicId = v9.topicId;
        if v10 then
            v11.universeId = tostring(v9.universeId);
            v11.placeId = tostring(v9.placeId);
            v11.isSponsored = v9.isSponsored;
            v11.isShowSponsoredLabel = nil;
            if v9.isShowSponsoredLabel == nil then
                v11.isShowSponsoredLabel = true;
            else
                v11.isShowSponsoredLabel = v9.isShowSponsoredLabel;
            end;
            v11.adId = v9.nativeAdData;
            v11.playerCount = v9.playerCount;
            if v4() then
                v11.creatorName = v9.creatorName;
                v11.creatorHasVerifiedBadge = v9.creatorHasVerifiedBadge;
            end;
        end;
        return v2.success(v11);
    end;
end;
return v5;