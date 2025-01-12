local l_Parent_0 = script:FindFirstAncestor("SocialLinksRodux").Parent;
local v1 = require(l_Parent_0.Rodux);
local v2 = require(l_Parent_0.Cryo);
local l_FFlagProfileEnableSocialNetworksUsernames_0 = require(l_Parent_0.SharedFlags).FFlagProfileEnableSocialNetworksUsernames;
local v4 = {
    "facebook", 
    "twitter", 
    "youtube", 
    "twitch", 
    "guilded"
};
return function(v5) --[[ Line: 51 ]]
    -- upvalues: v1 (copy), l_FFlagProfileEnableSocialNetworksUsernames_0 (copy), v2 (copy), v4 (copy)
    local l_SocialLinksNetworking_0 = v5.SocialLinksNetworking;
    return v1.createReducer({}, {
        [l_SocialLinksNetworking_0.GetSocialLinks.Succeeded.name] = function(v7, v8) --[[ Line: 55 ]]
            -- upvalues: l_FFlagProfileEnableSocialNetworksUsernames_0 (ref), v2 (ref), v4 (ref)
            local v9 = tostring(v8.namedIds.users);
            if l_FFlagProfileEnableSocialNetworksUsernames_0 then
                local v10 = {};
                if v8.queryArgs.alwaysReturnUrls then
                    v2.List.map(v4, function(v11) --[[ Line: 60 ]]
                        -- upvalues: v10 (copy), v8 (copy), v7 (copy), v9 (copy)
                        v10[v11] = {
                            url = v8.responseBody[v11], 
                            username = if v7[v9] then v7[v9][v11].username else nil
                        };
                    end);
                else
                    v2.List.map(v4, function(v12) --[[ Line: 67 ]]
                        -- upvalues: v10 (copy), v7 (copy), v9 (copy), v8 (copy)
                        v10[v12] = {
                            url = if v7[v9] then v7[v9][v12].url else nil, 
                            username = v8.responseBody[v12]
                        };
                    end);
                end;
                return v2.Dictionary.union(v7, {
                    [v9] = v10
                });
            else
                return v2.Dictionary.join(v7, {
                    [v9] = v8.responseBody
                });
            end;
        end
    });
end;