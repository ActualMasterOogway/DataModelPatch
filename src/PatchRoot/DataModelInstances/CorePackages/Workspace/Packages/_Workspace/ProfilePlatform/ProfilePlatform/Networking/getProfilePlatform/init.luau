local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local v1 = require(l_script_FirstAncestor_0.Networking.myRoduxNetworking);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.Http);
local _ = require(l_script_FirstAncestor_0.Common.Enums);
local _ = require(l_Parent_0.SocialCommon);
local _ = require(l_script_FirstAncestor_0.Types.Component);
return v1.POST({
    Name = "GetProfile"
}, function(v7, v8) --[[ Line: 24 ]]
    -- upvalues: v3 (copy)
    return v7(v3.Url.APIS_URL .. "profile-platform-api"):path("v1"):path("profiles"):path("get"):body({
        profileType = v8.profileType, 
        profileId = v8.profileId, 
        components = v8.components, 
        includeComponentOrdering = v8.includeComponentOrdering
    });
end);