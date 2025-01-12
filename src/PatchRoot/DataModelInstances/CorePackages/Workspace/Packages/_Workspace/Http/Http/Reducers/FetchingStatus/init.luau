local l_script_FirstAncestor_0 = script:FindFirstAncestor("Http");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_UpdateFetchingStatus_0 = require(l_script_FirstAncestor_0.Actions).UpdateFetchingStatus;
local l_BatchUpdateFetchingStatus_0 = require(l_script_FirstAncestor_0.Actions).BatchUpdateFetchingStatus;
local v4 = require(l_Parent_0.Cryo);
local l_FFlagLuaAppBatchFetchingStatus_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppBatchFetchingStatus;
local l_FFlagLuaAppBatchSingleFetches_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppBatchSingleFetches;
local function v14(v7) --[[ Line: 11 ]] --[[ Name: mapStatusToValue ]]
    -- upvalues: v4 (copy)
    local v8 = {};
    for _, v10 in pairs(v7) do
        local l_key_0 = v10.key;
        local l_status_0 = v10.status;
        local _ = nil;
        v8[l_key_0] = if l_status_0 ~= nil then l_status_0 else v4.None;
    end;
    return v8;
end;
return function(v15, v16) --[[ Line: 30 ]]
    -- upvalues: l_UpdateFetchingStatus_0 (copy), v4 (copy), l_FFlagLuaAppBatchFetchingStatus_0 (copy), l_FFlagLuaAppBatchSingleFetches_0 (copy), l_BatchUpdateFetchingStatus_0 (copy), v14 (copy)
    v15 = v15 or {};
    if v16.type == l_UpdateFetchingStatus_0.name then
        local l_key_1 = v16.key;
        local l_status_1 = v16.status;
        local v19 = nil;
        v19 = if l_status_1 ~= nil then l_status_1 else v4.None;
        v15 = v4.Dictionary.join(v15, {
            [l_key_1] = v19
        });
    end;
    if (l_FFlagLuaAppBatchFetchingStatus_0 or l_FFlagLuaAppBatchSingleFetches_0) and v16.type == l_BatchUpdateFetchingStatus_0.name then
        local l_fetchingStatuses_0 = v16.fetchingStatuses;
        v15 = v4.Dictionary.join(v15, (v14(l_fetchingStatuses_0)));
    end;
    return v15;
end;