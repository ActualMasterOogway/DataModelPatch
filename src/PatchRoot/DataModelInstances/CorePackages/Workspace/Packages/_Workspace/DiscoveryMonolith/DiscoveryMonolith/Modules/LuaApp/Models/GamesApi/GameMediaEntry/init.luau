local l_Parent_0 = script:FindFirstAncestor("DiscoveryMonolith").Parent;
local l_Logging_0 = require(l_Parent_0.AppCommonLib).Logging;
local v2 = require(l_Parent_0.ArgCheck);
local l_GameMediaImageType_0 = require(l_Parent_0.DiscoveryTypes).GameMediaImageType;
local v4 = {};
for v5, v6 in pairs(l_GameMediaImageType_0) do
    v4[v6] = v5;
end;
local v7 = {
    new = function() --[[ Line: 50 ]] --[[ Name: new ]]
        return {};
    end
};
v7.fromJsonData = function(v8) --[[ Line: 54 ]] --[[ Name: fromJsonData ]]
    -- upvalues: v7 (copy), v2 (copy), v4 (copy), l_Logging_0 (copy)
    local v9 = v7.new();
    v9.id = v8.id and tostring(v2.isType(v8.id, "number", "jsonData.id"));
    v9.assetTypeId = v2.isType(v8.assetTypeId, "number", "jsonData.assetTypeId");
    v9.imageId = v8.imageId and tostring(v2.isType(v8.imageId, "number", "jsonData.imageId"));
    v9.videoHash = v8.videoHash and v2.isType(v8.videoHash, "string", "jsonData.videoHash");
    v9.videoTitle = v8.videoTitle and v2.isType(v8.videoTitle, "string", "jsonData.videoTitle");
    v9.approved = v2.isType(v8.approved, "boolean", "jsonData.approved");
    if not v4[v9.assetTypeId] then
        l_Logging_0.warn("Unrecognized assetTypeId: " .. tostring(v9.assetTypeId));
    end;
    return v9;
end;
return v7;