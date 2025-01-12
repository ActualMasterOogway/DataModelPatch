local l_Parent_0 = script:FindFirstAncestor("FriendsCarousel").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.RoactAppExperiment);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.SharedFlags);
local l_FStringPaginatedCarouselExperimentLayer_0 = v4.FStringPaginatedCarouselExperimentLayer;
local l_FFlagPaginatedFriendsCarouselEnabledForAll_0 = v4.FFlagPaginatedFriendsCarouselEnabledForAll;
local v7 = require(script.Parent.PaginatedCarouselImplementationWrapper);
return function(v8) --[[ Line: 15 ]] --[[ Name: PaginatedCarouselWrapper ]]
    -- upvalues: v2 (copy), l_FStringPaginatedCarouselExperimentLayer_0 (copy), l_FFlagPaginatedFriendsCarouselEnabledForAll_0 (copy), v1 (copy), v7 (copy), v3 (copy)
    return function(v9) --[[ Line: 16 ]]
        -- upvalues: v2 (ref), l_FStringPaginatedCarouselExperimentLayer_0 (ref), l_FFlagPaginatedFriendsCarouselEnabledForAll_0 (ref), v1 (ref), v7 (ref), v3 (ref), v8 (copy)
        local v12, v13 = v2.useUserExperiment({
            l_FStringPaginatedCarouselExperimentLayer_0
        }, function(v10) --[[ Line: 19 ]]
            -- upvalues: l_FStringPaginatedCarouselExperimentLayer_0 (ref)
            local v11 = v10[l_FStringPaginatedCarouselExperimentLayer_0] or {};
            return v11.paginatedFriendsCarouselEnabled, v11.friendsSortVariant;
        end);
        if v12 or l_FFlagPaginatedFriendsCarouselEnabledForAll_0 then
            return (v1.createElement(v7, v3.Dictionary.join(v9, {
                renderChildComponent = function(v14) --[[ Line: 28 ]] --[[ Name: renderChildComponent ]]
                    -- upvalues: v1 (ref), v8 (ref), v3 (ref), v9 (copy)
                    return v1.createElement(v8, v3.Dictionary.join(v9, v14 or {}));
                end, 
                friendsSortVariant = v13
            })));
        else
            return (v1.createElement(v8, v9));
        end;
    end;
end;