game:DefineFastInt("OffPlatformFriendRequestsRolloutEnabled", 0);
local l_script_FirstAncestor_0 = script:FindFirstAncestor("ContactImporter");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_setupIsRolloutEnabledForUser_0 = v1.SocialLibraries.ReleaseHelpers.setupIsRolloutEnabledForUser;
local l_getFStringSocialFriendsLayer_0 = v1.getFStringSocialFriendsLayer;
local l_useUserExperiment_0 = v1.useUserExperiment;
local v5 = require(script.Parent.getFStringOffPlatformIXPName);
local v6 = require(script.Parent.getFStringShowFindFriendsBannerIXPName);
local v7 = require(l_script_FirstAncestor_0.Common.IXPVariants);
local v8 = v5();
local v9 = v6();
local function v10() --[[ Line: 17 ]]
    return game:GetFastInt("OffPlatformFriendRequestsRolloutEnabled");
end;
local function _(v11) --[[ Line: 21 ]]
    -- upvalues: v8 (copy)
    local v12 = nil;
    if v11 then
        v12 = v11[v8];
    end;
    return v12;
end;
local function v17(v14) --[[ Line: 30 ]]
    -- upvalues: l_getFStringSocialFriendsLayer_0 (copy), v8 (copy)
    local v15 = if v14 then v14[l_getFStringSocialFriendsLayer_0()] else nil;
    local v16 = nil;
    if v15 then
        v16 = v15[v8];
    end;
    return v16;
end;
local function v21(v18) --[[ Line: 34 ]]
    -- upvalues: l_getFStringSocialFriendsLayer_0 (copy), v9 (copy)
    local v19 = nil;
    local v20 = if v18 then v18[l_getFStringSocialFriendsLayer_0()] else nil;
    if v20 then
        v19 = v20[v9];
    end;
    return v19;
end;
local v22 = l_setupIsRolloutEnabledForUser_0(v10);
local function v27(v23) --[[ Line: 46 ]]
    -- upvalues: l_getFStringSocialFriendsLayer_0 (copy), v8 (copy), v7 (copy), v22 (copy)
    local v24 = if v23 then v23[l_getFStringSocialFriendsLayer_0()] else nil;
    local v25 = nil;
    if v24 then
        v25 = v24[v8];
    end;
    local l_v25_0 = v25;
    v24 = false;
    if l_v25_0 then
        v25 = true;
        if l_v25_0 ~= v7.INVITES_ONLY then
            v25 = l_v25_0 == v7.BLENDED;
        end;
        v24 = v25;
    end;
    return v24 or v22();
end;
return {
    experimentOrRolloutEnabled = v27, 
    IXPVariants = v7, 
    useOffPlatformFriendRequestsVariant = function() --[[ Line: 57 ]]
        -- upvalues: l_useUserExperiment_0 (copy), l_getFStringSocialFriendsLayer_0 (copy), v17 (copy)
        return l_useUserExperiment_0({
            l_getFStringSocialFriendsLayer_0()
        }, v17);
    end, 
    useOffPlatformFriendRequestsEnabled = function() --[[ Line: 63 ]]
        -- upvalues: l_useUserExperiment_0 (copy), l_getFStringSocialFriendsLayer_0 (copy), v27 (copy)
        return l_useUserExperiment_0({
            l_getFStringSocialFriendsLayer_0()
        }, v27);
    end, 
    useFindFriendsBannerVariant = function() --[[ Line: 69 ]]
        -- upvalues: l_useUserExperiment_0 (copy), l_getFStringSocialFriendsLayer_0 (copy), v21 (copy)
        return l_useUserExperiment_0({
            l_getFStringSocialFriendsLayer_0()
        }, v21);
    end, 
    getExperimentVariant = v17, 
    isRolloutEnabled = function(v28) --[[ Line: 83 ]] --[[ Name: isRolloutEnabled ]]
        -- upvalues: l_getFStringSocialFriendsLayer_0 (copy), v8 (copy), v7 (copy), v22 (copy)
        local v29 = if v28 then v28[l_getFStringSocialFriendsLayer_0()] else nil;
        local v30 = nil;
        if v29 then
            v30 = v29[v8];
        end;
        local l_v30_0 = v30;
        v29 = false;
        if l_v30_0 then
            v30 = true;
            if l_v30_0 ~= v7.INVITES_ONLY then
                v30 = l_v30_0 == v7.BLENDED;
            end;
            v29 = v30;
        end;
        if v29 or v22() then
            return v7.BLENDED;
        else
            return v7.CONTROL;
        end;
    end
};