local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local v1 = require(l_script_FirstAncestor_0.Utils.getDeepValue);
local l_GetExperiencesDetails_0 = require(l_script_FirstAncestor_0.Networking.NetworkingGames).GetExperiencesDetails;
local v3 = require(l_script_FirstAncestor_0.Utils.getUniverseIds);
local v4 = require(l_script_FirstAncestor_0.Networking.myContentSharingNetworking);
game:DefineFastInt("ProfileContentPostCarouselPostLimit", 10);
return function(v5) --[[ Line: 10 ]]
    -- upvalues: v4 (copy), v1 (copy), v3 (copy), l_GetExperiencesDetails_0 (copy)
    return function(v6) --[[ Line: 11 ]]
        -- upvalues: v4 (ref), v5 (copy), v1 (ref), v3 (ref), l_GetExperiencesDetails_0 (ref)
        v6:dispatch(v4.GetPostsByUserId.API({
            userId = v5, 
            limit = game:GetFastInt("ProfileContentPostCarouselPostLimit")
        })):andThen(function(v7) --[[ Line: 17 ]]
            -- upvalues: v1 (ref), v3 (ref), v6 (copy), l_GetExperiencesDetails_0 (ref)
            local v8 = v1(v7, "responseBody.posts") or {};
            if #v8 > 0 then
                local v9 = v3(v8);
                v6:dispatch(l_GetExperiencesDetails_0.API(v9));
            end;
        end):catch(function(_) --[[ Line: 24 ]]

        end);
    end;
end;