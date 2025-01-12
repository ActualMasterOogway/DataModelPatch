local l_script_FirstAncestor_0 = script:FindFirstAncestor("DiscoveryMonolith");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Promise);
local l_RetrievalStatus_0 = require(l_Parent_0.Http).Enum.RetrievalStatus;
local v4 = require(l_Parent_0.FetchStatusRodux);
local l_FetchStatusReducer_0 = v4.FetchStatusReducer;
local l_FetchStatusNamespace_0 = v4.FetchStatusNamespace;
local v7 = require(l_Parent_0.NextDataExpirationTimeRodux);
local l_NextDataExpirationTimeReducer_0 = v7.NextDataExpirationTimeReducer;
local l_ExpirationTimeNamespace_0 = v7.ExpirationTimeNamespace;
local l_Modules_0 = l_script_FirstAncestor_0.Modules;
local v11 = require(l_Modules_0.LuaApp.Thunks.Games.ApiFetchSortTokens);
local function _(v12, v13, v14) --[[ Line: 22 ]] --[[ Name: shouldRefreshSortGroup ]]
    -- upvalues: l_RetrievalStatus_0 (copy)
    local v15 = false;
    if v12 ~= l_RetrievalStatus_0.Fetching then
        v15 = v13 - 600 <= v14;
    end;
    return v15;
end;
return function(v17, v18) --[[ Line: 29 ]]
    -- upvalues: l_FetchStatusReducer_0 (copy), l_FetchStatusNamespace_0 (copy), l_NextDataExpirationTimeReducer_0 (copy), l_ExpirationTimeNamespace_0 (copy), l_RetrievalStatus_0 (copy), v11 (copy), v2 (copy)
    return function(v19) --[[ Line: 30 ]]
        -- upvalues: v18 (copy), l_FetchStatusReducer_0 (ref), l_FetchStatusNamespace_0 (ref), l_NextDataExpirationTimeReducer_0 (ref), l_ExpirationTimeNamespace_0 (ref), l_RetrievalStatus_0 (ref), v11 (ref), v17 (copy), v2 (ref)
        local v20 = {};
        local v21 = tick();
        local v22 = v19:getState();
        for _, v24 in ipairs(v18) do
            local v25 = v22.Personalization[l_FetchStatusReducer_0.key][l_FetchStatusNamespace_0.GameSortToken][v24];
            local v26 = nil;
            local v27 = v22.Personalization[l_NextDataExpirationTimeReducer_0.key][l_ExpirationTimeNamespace_0.GameSortGroup];
            if v27 then
                v26 = v27[v24];
            end;
            local v28 = v26 or 0;
            local v29 = false;
            if v25 ~= l_RetrievalStatus_0.Fetching then
                v29 = v28 - 600 <= v21;
            end;
            if v29 then
                table.insert(v20, v19:dispatch(v11(v17, v24, nil)));
            end;
        end;
        return v2.all(v20);
    end;
end;