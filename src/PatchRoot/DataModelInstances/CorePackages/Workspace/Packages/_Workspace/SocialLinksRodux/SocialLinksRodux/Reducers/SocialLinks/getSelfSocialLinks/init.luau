local l_Parent_0 = script:FindFirstAncestor("SocialLinksRodux").Parent;
local v1 = require(l_Parent_0.Rodux);
return function(v2) --[[ Line: 15 ]]
    -- upvalues: v1 (copy)
    local l_SocialLinksNetworking_0 = v2.SocialLinksNetworking;
    return v1.createReducer({}, {
        [l_SocialLinksNetworking_0.GetSelfSocialLinks.Succeeded.name] = function(_, v5) --[[ Line: 19 ]]
            return {
                socialLinks = {
                    facebook = v5.responseBody.facebook, 
                    twitter = v5.responseBody.twitter, 
                    youtube = v5.responseBody.youtube, 
                    twitch = v5.responseBody.twitch, 
                    guilded = v5.responseBody.guilded
                }, 
                visibility = v5.responseBody.promotionChannelsVisibilityPrivacy
            };
        end
    });
end;