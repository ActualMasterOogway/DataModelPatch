local l_Parent_0 = script:FindFirstAncestor("SocialLinksRodux").Parent;
local v1 = require(l_Parent_0.Rodux);
local v2 = v1.makeActionCreator("SOCIAL_LINKS_SUCCEEDED", function() --[[ Line: 6 ]]
    return {
        namedIds = {
            users = "123"
        }, 
        responseBody = {
            facebook = "facebookUrl", 
            twitter = "twitterUrl", 
            youtube = "youtubeUrl", 
            twitch = "twitchUrl", 
            guilded = nil
        }, 
        queryArgs = {
            alwaysReturnUrls = true
        }
    };
end);
local v3 = v1.makeActionCreator("SELF_SOCIAL_LINKS_SUCCEEDED", function() --[[ Line: 25 ]]
    return {
        responseBody = {
            promotionChannelsVisibilityPrivacy = "NoOne", 
            facebook = "url", 
            twitter = "url", 
            youtube = "url", 
            twitch = "url", 
            guilded = nil
        }
    };
end);
return {
    mockGetSocialLinks = "SOCIAL_LINKS_SUCCEEDED", 
    mockGetSocialLinksAction = v2, 
    mockGetSelfSocialLinks = "SELF_SOCIAL_LINKS_SUCCEEDED", 
    mockGetSelfSocialLinksAction = v3
};