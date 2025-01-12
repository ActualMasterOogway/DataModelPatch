local l_script_FirstAncestor_0 = script:FindFirstAncestor("FetchStatusRodux");
local v1 = require(l_script_FirstAncestor_0.SetFetchStatus);
local v2 = require(l_script_FirstAncestor_0.FetchStatusNamespace);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_RetrievalStatus_0 = require(l_Parent_0.Http).Enum.RetrievalStatus;
local _ = require(l_Parent_0.DiscoveryTypes);
local function v6() --[[ Line: 9 ]] --[[ Name: initializeFetchStatus ]]
    -- upvalues: v2 (copy), l_RetrievalStatus_0 (copy)
    return {
        [v2.GameSortToken] = {
            Games = l_RetrievalStatus_0.NotStarted, 
            HomeGames = l_RetrievalStatus_0.NotStarted, 
            GamesSeeAll = l_RetrievalStatus_0.NotStarted
        }, 
        [v2.GameSorts] = {}, 
        [v2.OmniRecommendations] = {}
    };
end;
return {
    key = "FetchStatusKey", 
    reducer = function(v7, v8) --[[ Line: 21 ]]
        -- upvalues: v6 (copy), v1 (copy)
        v7 = v7 or v6();
        if v8.type == v1.name then
            assert(v7, "state should always exist, assert for linter");
            local l_fetchNamespace_0 = v8.fetchNamespace;
            local l_fetchKey_0 = v8.fetchKey;
            assert(l_fetchNamespace_0, "SetFetchStatus does not have a valid fetch namespace");
            assert(l_fetchKey_0, (("SetFetchStatus does not have a valid fetch key for namespace %*"):format(l_fetchNamespace_0)));
            local v11 = v7[l_fetchNamespace_0];
            if not v11 then
                warn((("No namespace %* defined in FetchStatusReducer for action"):format(l_fetchNamespace_0)));
                return v7;
            else
                assert(v11, "namespaceState should always exist, assert for linter");
                local v12 = table.clone(v11);
                v12[l_fetchKey_0] = v8.fetchStatus;
                local v13 = table.clone(v7);
                v13[l_fetchNamespace_0] = v12;
                return v13;
            end;
        else
            return v7;
        end;
    end
};