local l_script_FirstAncestor_0 = script:FindFirstAncestor("UserLib");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local l_PromiseUtilities_0 = require(l_Parent_0.AppCommonLib).Utils.PromiseUtilities;
local _ = require(l_script_FirstAncestor_0.Utils);
local v5 = require(l_Parent_0.Promise);
local v6 = require(l_script_FirstAncestor_0.Utils.Constants);
local l_getRbxthumbWithTypeSizeAndOptions_0 = require(l_script_FirstAncestor_0.Utils).getRbxthumbWithTypeSizeAndOptions;
local l_FFlagFixPreloadingThumbsNilEntries_0 = require(l_Parent_0.SharedFlags).FFlagFixPreloadingThumbsNilEntries;
local function v13(v9, v10) --[[ Line: 34 ]] --[[ Name: subdivideEntries ]]
    -- upvalues: v2 (copy)
    local v11 = {};
    for v12 = 1, #v9, v10 do
        table.insert(v11, (v2.List.getRange(v9, v12, v12 + v10 - 1)));
    end;
    return v11;
end;
local _ = function(v14, v15, v16) --[[ Line: 43 ]] --[[ Name: makePreloadAsyncPromise ]]
    -- upvalues: v5 (copy), v6 (copy), l_getRbxthumbWithTypeSizeAndOptions_0 (copy)
    return (v5.new(function(v17, _) --[[ Line: 48 ]]
        -- upvalues: v14 (copy), v15 (copy), v6 (ref), l_getRbxthumbWithTypeSizeAndOptions_0 (ref), v16 (copy)
        local v19 = {};
        local v20 = {};
        for _, v22 in v14 do
            v20[v22] = {};
            for _, v24 in v15 do
                v20[v22][v24.thumbnailType] = v20[v22][v24.thumbnailType] or {};
                local v25 = v6.RbxThumbnailSizeToNumberSize[v24.thumbnailSize];
                local v26 = v6.RbxAvatarThumbnailTypeFromEnumToRbxthumbType[v24.thumbnailType];
                local v27 = l_getRbxthumbWithTypeSizeAndOptions_0(v22, v26, v25);
                v20[v22][v24.thumbnailType][v24.thumbnailSize] = v27;
                table.insert(v19, v27);
            end;
        end;
        (v16 or game:GetService("ContentProvider")):PreloadAsync(v19);
        v17();
    end));
end;
return function(v29, v30, v31) --[[ Line: 81 ]]
    -- upvalues: l_FFlagFixPreloadingThumbsNilEntries_0 (copy), v13 (copy), v5 (copy), v6 (copy), l_getRbxthumbWithTypeSizeAndOptions_0 (copy), l_PromiseUtilities_0 (copy)
    if l_FFlagFixPreloadingThumbsNilEntries_0 then
        assert(v29 ~= nil, "userIds should not be nil");
    end;
    return function(_) --[[ Line: 85 ]]
        -- upvalues: v13 (ref), v29 (copy), v30 (copy), v31 (copy), v5 (ref), v6 (ref), l_getRbxthumbWithTypeSizeAndOptions_0 (ref), l_PromiseUtilities_0 (ref)
        local v33 = {};
        local v34 = v13(v29, 100);
        for _, v36 in pairs(v34) do
            local l_v30_0 = v30;
            local l_v31_0 = v31;
            table.insert(v33, (v5.new(function(v39, _) --[[ Line: 48 ]]
                -- upvalues: v36 (copy), l_v30_0 (copy), v6 (ref), l_getRbxthumbWithTypeSizeAndOptions_0 (ref), l_v31_0 (copy)
                local v41 = {};
                local v42 = {};
                for _, v44 in v36 do
                    v42[v44] = {};
                    for _, v46 in l_v30_0 do
                        v42[v44][v46.thumbnailType] = v42[v44][v46.thumbnailType] or {};
                        local v47 = v6.RbxThumbnailSizeToNumberSize[v46.thumbnailSize];
                        local v48 = v6.RbxAvatarThumbnailTypeFromEnumToRbxthumbType[v46.thumbnailType];
                        local v49 = l_getRbxthumbWithTypeSizeAndOptions_0(v44, v48, v47);
                        v42[v44][v46.thumbnailType][v46.thumbnailSize] = v49;
                        table.insert(v41, v49);
                    end;
                end;
                (l_v31_0 or game:GetService("ContentProvider")):PreloadAsync(v41);
                v39();
            end)));
        end;
        return l_PromiseUtilities_0.Batch(v33);
    end;
end;