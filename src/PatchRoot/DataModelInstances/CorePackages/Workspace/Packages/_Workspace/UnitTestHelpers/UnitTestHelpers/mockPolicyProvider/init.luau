local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Roact);
return function(v2, v3) --[[ Line: 7 ]]
    -- upvalues: l_Parent_0 (copy), v1 (copy)
    local l_RoactAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).RoactAppPolicy;
    local l_AppFeaturePolicies_0 = require(l_Parent_0.UniversalAppPolicy).AppFeaturePolicies;
    local l_ChatPolicies_0 = require(l_Parent_0.SocialPolicies).ChatPolicies;
    local l_AvatarPolicies_0 = require(l_Parent_0.AvatarPolicies).AvatarPolicies;
    local l_SharePolicies_0 = require(l_Parent_0.SocialPolicies).SharePolicies;
    local l_ShareTargetGamePolicies_0 = require(l_Parent_0.SocialPolicies).ShareTargetGamePolicies;
    local v10 = v3 or {};
    return v1.createElement(l_RoactAppPolicy_0.Provider, {
        policy = {
            l_AppFeaturePolicies_0, 
            l_ChatPolicies_0, 
            l_AvatarPolicies_0, 
            l_SharePolicies_0, 
            l_ShareTargetGamePolicies_0
        }, 
        policyData = v10
    }, {
        Element = v2
    });
end;