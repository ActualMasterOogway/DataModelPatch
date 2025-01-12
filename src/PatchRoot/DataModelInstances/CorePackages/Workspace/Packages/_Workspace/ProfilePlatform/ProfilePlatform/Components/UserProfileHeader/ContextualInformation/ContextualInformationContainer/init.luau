local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.RoactUtils);
local l_useDispatch_0 = v3.Hooks.RoactRodux.useDispatch;
local l_useSelector_0 = v3.Hooks.RoactRodux.useSelector;
local l_useEffectOnMount_0 = v3.Hooks.useEffectOnMount;
local l_getDeepValue_0 = require(l_Parent_0.LuaSocialLibrariesDeps).SocialLibraries.config({}).Dictionary.getDeepValue;
local v8 = require(l_script_FirstAncestor_0.Contexts.useProfileWrapperContext);
local v9 = require(l_script_FirstAncestor_0.Common.Constants);
local v10 = require(l_script_FirstAncestor_0.Common.Enums);
local l_HorizontalPageMargin_0 = require(l_Parent_0.UIBlox).App.Container.HorizontalPageMargin;
local v12 = require(l_script_FirstAncestor_0.Networking.NetworkingGames);
local v13 = require(script.Parent.ContextualGeneric);
local v14 = require(script.Parent.ContextualPresence);
local v15 = require(script.Parent.ContextualMutualFriends);
return function(v16) --[[ Line: 36 ]] --[[ Name: ContextualInformationContainer ]]
    -- upvalues: v8 (copy), l_useSelector_0 (copy), l_getDeepValue_0 (copy), v9 (copy), v10 (copy), l_useDispatch_0 (copy), l_useEffectOnMount_0 (copy), v12 (copy), v2 (copy), v14 (copy), v15 (copy), v13 (copy), l_HorizontalPageMargin_0 (copy)
    local v17 = v8();
    local l_profileUserId_0 = v17.profileUserId;
    local l_sourceInfo_0 = v17.sourceInfo;
    local l_contextualInformation_0 = l_useSelector_0(function(v20) --[[ Line: 41 ]]
        -- upvalues: l_getDeepValue_0 (ref), v9 (ref), l_profileUserId_0 (copy), v10 (ref)
        return l_getDeepValue_0(v20, (("%*.Users.%*.components.%*"):format(v9.RODUX_KEY, l_profileUserId_0, v10.Components.UserProfileHeader))) or {};
    end).contextualInformation;
    local l_context_0 = l_contextualInformation_0.context;
    local l_contextDetails_0 = l_contextualInformation_0.contextDetails;
    local v24 = if l_context_0 == v10.ContextualTypes.SentFromExperience then l_contextDetails_0[l_context_0].sourceUniverseId else nil;
    local v25 = l_useDispatch_0();
    l_useEffectOnMount_0(function() --[[ Line: 58 ]]
        -- upvalues: l_context_0 (copy), v10 (ref), v25 (copy), v12 (ref), v24 (copy)
        if l_context_0 == v10.ContextualTypes.SentFromExperience then
            v25(v12.GetExperiencesDetails.API({
                v24
            })):catch(function(_) --[[ Line: 60 ]]

            end);
        end;
    end);
    local v28 = l_useSelector_0(function(v27) --[[ Line: 64 ]]
        -- upvalues: l_getDeepValue_0 (ref), v24 (copy)
        return l_getDeepValue_0(v27, (("ProfilePlatform.Games.byGameId.%*.name"):format((tostring(v24))))) or "";
    end);
    local v29 = l_getDeepValue_0(l_sourceInfo_0, "contextualOverride.icon");
    local v30 = l_getDeepValue_0(l_sourceInfo_0, "contextualOverride.text");
    local v31 = nil;
    if l_context_0 == v10.ContextualTypes.Presence then
        v31 = v2.createElement(v14);
    elseif l_context_0 == v10.ContextualTypes.MutualFriends then
        local v32 = l_contextDetails_0[l_context_0];
        v31 = v2.createElement(v15, {
            mutualFriends = v32.mutualFriends, 
            mutualFriendsCount = v32.mutualFriendsCount
        });
    else
        v31 = v2.createElement(v13, {
            contextualType = l_context_0, 
            experienceName = v28, 
            iconOverride = v29, 
            textOverride = v30
        });
    end;
    return v2.createElement(l_HorizontalPageMargin_0, {
        size = v16.size, 
        layoutOrder = v16.layoutOrder, 
        backgroundTransparency = 1
    }, {
        contextualInformation = v31
    });
end;