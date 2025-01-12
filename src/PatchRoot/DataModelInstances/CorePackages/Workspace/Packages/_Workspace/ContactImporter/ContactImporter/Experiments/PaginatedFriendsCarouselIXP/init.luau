local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.RoactAppExperiment);
local v2 = require(l_Parent_0.SharedFlags);
local l_useUserExperiment_0 = v1.useUserExperiment;
local l_FStringPaginatedCarouselExperimentLayer_0 = v2.FStringPaginatedCarouselExperimentLayer;
local l_FFlagPaginatedFriendsCarouselEnabledForAll_0 = v2.FFlagPaginatedFriendsCarouselEnabledForAll;
return {
    usePaginatedFriendsCarouselExperiment = function() --[[ Line: 12 ]] --[[ Name: usePaginatedFriendsCarouselExperiment ]]
        -- upvalues: l_useUserExperiment_0 (copy), l_FStringPaginatedCarouselExperimentLayer_0 (copy), l_FFlagPaginatedFriendsCarouselEnabledForAll_0 (copy)
        local v8, v9 = l_useUserExperiment_0({
            l_FStringPaginatedCarouselExperimentLayer_0
        }, function(v6) --[[ Line: 15 ]]
            -- upvalues: l_FStringPaginatedCarouselExperimentLayer_0 (ref), l_FFlagPaginatedFriendsCarouselEnabledForAll_0 (ref)
            local v7 = v6[l_FStringPaginatedCarouselExperimentLayer_0] or {};
            return v7.paginatedFriendsCarouselEnabled or l_FFlagPaginatedFriendsCarouselEnabledForAll_0, v7.friendsSortVariant;
        end);
        return v8, v9;
    end
};