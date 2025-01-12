local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialLinksRodux");
local v1 = require(l_script_FirstAncestor_0.Reducers.SocialLinks.getSocialLinks);
local v2 = require(l_script_FirstAncestor_0.Reducers.SocialLinks.getSelfSocialLinks);
local v3 = {
    profileSocialLinks = {}, 
    selfSocialLinks = {}
};
return function(v4) --[[ Line: 10 ]]
    -- upvalues: v3 (copy), v1 (copy), v2 (copy)
    return function(v5, v6) --[[ Line: 11 ]]
        -- upvalues: v3 (ref), v1 (ref), v4 (copy), v2 (ref)
        local v7 = v5 or v3;
        local v8 = v1(v4);
        local v9 = v2(v4);
        return {
            profileSocialLinks = v8(v7.profileSocialLinks, v6), 
            selfSocialLinks = v9(v7.selfSocialLinks, v6)
        };
    end;
end;