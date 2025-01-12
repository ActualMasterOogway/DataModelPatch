local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Rodux);
local v3 = require(l_script_FirstAncestor_0.Rodux.ContentPostsRodux);
local v4 = require(l_script_FirstAncestor_0.Rodux.Games);
local v5 = require(l_script_FirstAncestor_0.Rodux.Groups);
local v6 = require(l_script_FirstAncestor_0.Rodux.ItemDetails);
local v7 = require(l_script_FirstAncestor_0.Networking.myRoduxNetworking);
local v8 = require(l_script_FirstAncestor_0.Rodux.Presence);
local v9 = require(l_script_FirstAncestor_0.Rodux.Users);
local l_FFlagCapturesPostEnabledForAll_0 = require(l_Parent_0.SharedFlags).FFlagCapturesPostEnabledForAll;
local l_FFlagEnableOnPlatformSharingExperiment_0 = require(l_Parent_0.SharedFlags).FFlagEnableOnPlatformSharingExperiment;
return function() --[[ Line: 20 ]]
    -- upvalues: v2 (copy), l_FFlagCapturesPostEnabledForAll_0 (copy), l_FFlagEnableOnPlatformSharingExperiment_0 (copy), v3 (copy), v4 (copy), v5 (copy), v6 (copy), v7 (copy), v8 (copy), v9 (copy)
    return v2.combineReducers({
        ContentPosts = if not not l_FFlagCapturesPostEnabledForAll_0 or l_FFlagEnableOnPlatformSharingExperiment_0 then v3.installReducer() else nil, 
        Games = v4.installReducer(), 
        Groups = v5, 
        ItemAssets = v6, 
        NetworkStatus = v7.installReducer(), 
        Presence = v8.installReducer(), 
        Users = v9
    });
end;