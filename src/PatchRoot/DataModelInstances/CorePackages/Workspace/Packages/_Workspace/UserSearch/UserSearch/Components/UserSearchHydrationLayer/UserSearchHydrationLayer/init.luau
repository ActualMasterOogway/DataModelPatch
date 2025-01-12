local l_script_FirstAncestor_0 = script:FindFirstAncestor("UserSearch");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_script_FirstAncestor_0.Utils.useMatchSearchPagination);
local v5 = require(script.Parent.Parent.ProfileInsightsContextFetchWrapper.usePaginatedProfileInsightsFetch);
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local v7 = require(l_script_FirstAncestor_0.Networking.NetworkingPresence);
local _ = require(l_script_FirstAncestor_0.Common.LocalTypes);
local v9 = require(l_script_FirstAncestor_0.Thunks.HydrateFriendStatuses);
local v10 = require(l_script_FirstAncestor_0.Thunks.HydrateFollowingStatuses);
local _ = require(l_Parent_0.GraphQLServer);
return function(v12) --[[ Line: 32 ]]
    -- upvalues: l_useDispatch_0 (copy), v4 (copy), v5 (copy), v2 (copy), v3 (copy), v7 (copy), v10 (copy), v9 (copy)
    local v13 = l_useDispatch_0();
    local v14 = v4({
        users = v12.users
    });
    local v15 = v5({
        users = v12.users or {}, 
        searchKeyword = v12.searchParameters.searchKeyword
    }) or {};
    local v17 = v2.useMemo(function() --[[ Line: 40 ]]
        -- upvalues: v3 (ref), v14 (copy)
        return v3.List.map(v14, function(v16) --[[ Line: 41 ]]
            return v16.id;
        end);
    end, {
        v12.users
    });
    v2.useEffect(function() --[[ Line: 46 ]]
        -- upvalues: v13 (copy), v7 (ref), v17 (copy), v10 (ref), v9 (ref)
        v13(v7.GetPresencesFromUserIds.API(v17));
        v13(v10(v17));
        v13(v9(v17));
    end, {
        v17
    });
    return v12.renderComponent({
        mappedProfilesInsights = v15
    });
end;