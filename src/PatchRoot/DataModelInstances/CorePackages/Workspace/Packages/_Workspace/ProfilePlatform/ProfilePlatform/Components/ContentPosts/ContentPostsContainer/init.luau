local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local v3 = require(l_Parent_0.NavigationRodux);
local v4 = require(l_Parent_0.React);
local v5 = require(l_Parent_0.RoactUtils);
local v6 = require(l_Parent_0.UniversalAppPolicy);
local l_useDispatch_0 = v5.Hooks.RoactRodux.useDispatch;
local l_useEffectOnMount_0 = v5.Hooks.useEffectOnMount;
local l_useLocalUserId_0 = require(l_Parent_0.RobloxAppHooks).useLocalUserId;
local v10 = require(l_script_FirstAncestor_0.Contexts.useProfileAnalyticsContext);
local v11 = require(l_script_FirstAncestor_0.Contexts.useProfileWrapperContext);
local l_useSelector_0 = v5.Hooks.RoactRodux.useSelector;
local l_useState_0 = v4.useState;
local v14 = require(l_script_FirstAncestor_0.Common.Constants);
local v15 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local l_getAppFeaturePolicies_0 = v6.getAppFeaturePolicies;
local v17 = require(l_script_FirstAncestor_0.Utils.getDeepValue);
local v18 = require(l_script_FirstAncestor_0.Thunks.GetPostsByUserId);
local l_NavigateDown_0 = v3.Thunks.NavigateDown;
local v20 = require(script.Parent.ContentPostsCarousel);
return function(v21) --[[ Line: 31 ]] --[[ Name: ContentPostsContainer ]]
    -- upvalues: v10 (copy), v11 (copy), l_useDispatch_0 (copy), l_useLocalUserId_0 (copy), l_useState_0 (copy), l_useEffectOnMount_0 (copy), v18 (copy), v4 (copy), l_getAppFeaturePolicies_0 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy), v15 (copy), l_useSelector_0 (copy), v17 (copy), v14 (copy), v20 (copy)
    local v22 = v10();
    local l_profileUserId_0 = v11().profileUserId;
    local v24 = l_useDispatch_0();
    local v25 = l_useLocalUserId_0();
    local v26, v27 = l_useState_0(false);
    local v28 = l_profileUserId_0 == tostring(v25);
    l_useEffectOnMount_0(function() --[[ Line: 41 ]]
        -- upvalues: v24 (copy), v18 (ref), l_profileUserId_0 (copy)
        v24(v18(l_profileUserId_0));
    end);
    local v32 = v4.useCallback(function(v29, v30) --[[ Line: 45 ]]
        -- upvalues: l_getAppFeaturePolicies_0 (ref), v24 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref), l_profileUserId_0 (copy), v27 (copy), v18 (ref), v22 (copy), v15 (ref)
        if l_getAppFeaturePolicies_0().getEligibleForContentPostFeed() then
            v24(l_NavigateDown_0({
                name = l_AppPage_0.ContentFeed, 
                extraProps = {
                    userId = l_profileUserId_0, 
                    onNavigateBackCallback = function(v31) --[[ Line: 51 ]] --[[ Name: onNavigateBackCallback ]]
                        -- upvalues: v27 (ref), v24 (ref), v18 (ref), l_profileUserId_0 (ref)
                        v27(v31);
                        v24(v18(l_profileUserId_0));
                    end, 
                    postId = v29
                }
            }, nil));
            v22.fireAnalyticsEvent(v15.ProfileContentPostOpened, {
                creatorUserId = l_profileUserId_0, 
                postId = v29, 
                postPosition = v30
            });
        end;
    end, {
        l_profileUserId_0
    });
    local v34 = l_useSelector_0(function(v33) --[[ Line: 66 ]]
        -- upvalues: v17 (ref), v14 (ref), l_profileUserId_0 (copy)
        return v17(v33, (("%*.ContentPosts.byUserId.%*.posts"):format(v14.RODUX_KEY, l_profileUserId_0))) or {};
    end);
    local v36 = l_useSelector_0(function(v35) --[[ Line: 70 ]]
        -- upvalues: v17 (ref), v14 (ref)
        return v17(v35, (("%*.Games.byGameId"):format(v14.RODUX_KEY))) or {};
    end);
    if not v26 and (v28 or #v34 > 0) then
        return (v4.createElement(v20, {
            gameInfoByIds = v36, 
            layoutOrder = v21.layoutOrder, 
            openFeed = v32, 
            posts = v34
        }));
    else
        return nil;
    end;
end;