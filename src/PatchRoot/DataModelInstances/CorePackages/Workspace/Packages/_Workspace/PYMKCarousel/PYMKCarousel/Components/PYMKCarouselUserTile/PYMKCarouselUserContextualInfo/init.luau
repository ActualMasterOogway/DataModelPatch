local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_0.dependencies);
local v3 = require(l_Parent_1.SocialCommon);
local l_Roact_0 = v2.Roact;
local l_React_0 = v2.React;
local l_useSelector_0 = v2.Hooks.useSelector;
local l_useLocalization_0 = v2.Hooks.useLocalization;
local l_RoduxFriends_0 = v2.RoduxFriends;
local l_SocialLibraries_0 = v2.SocialLibraries;
local l_getRecommendationDisplayContext_0 = l_SocialLibraries_0.User.getRecommendationDisplayContext;
local l_getDeepValue_0 = l_SocialLibraries_0.Dictionary.getDeepValue;
local v12 = require(l_Parent_0.Common.TextKeys);
local l_CarouselUserContextualInfo_0 = v3.Components.CarouselUserTile.CarouselUserContextualInfo;
local l_RecommendationContextType_0 = l_RoduxFriends_0.Enums.RecommendationContextType;
local function v18(v15) --[[ Line: 32 ]]
    -- upvalues: l_useLocalization_0 (copy)
    local v16 = l_useLocalization_0({
        contextualText = v15.textKey
    });
    local v17 = if v15.textKey then v16.contextualText else v15.text;
    if v15.formatter then
        return (v15.formatter(v17));
    else
        return v17;
    end;
end;
return function(v19) --[[ Line: 41 ]]
    -- upvalues: l_useSelector_0 (copy), l_RoduxFriends_0 (copy), l_getDeepValue_0 (copy), l_React_0 (copy), l_getRecommendationDisplayContext_0 (copy), v12 (copy), l_RecommendationContextType_0 (copy), v18 (copy), l_Roact_0 (copy), l_CarouselUserContextualInfo_0 (copy)
    local v20 = tostring(v19.userId);
    local v22 = l_useSelector_0(function(v21) --[[ Line: 43 ]]
        return (tostring(v21.LocalUserId));
    end);
    local v24 = l_useSelector_0(function(v23) --[[ Line: 47 ]]
        -- upvalues: l_RoduxFriends_0 (ref), v22 (copy), v20 (copy)
        return l_RoduxFriends_0.Selectors.selectRecommendationsForUserId(v23)(v22)[v20] or {};
    end);
    local v26 = l_useSelector_0(function(v25) --[[ Line: 51 ]]
        -- upvalues: l_getDeepValue_0 (ref), v20 (copy)
        return l_getDeepValue_0(v25, string.format("PYMKCarousel.Friends.recommendations.hasIncomingFriendRequest.%s", v20)) or false;
    end);
    local v27 = l_React_0.useCallback(l_getRecommendationDisplayContext_0(v24), {
        v24
    });
    local l_label_0 = v27.label;
    if v26 then
        l_label_0 = {
            textKey = v12.FriendRequestContext
        };
    end;
    if v19.contextType == l_RecommendationContextType_0.Contacts then
        l_label_0 = {
            textKey = v12.FromContacts
        };
    end;
    local v29 = if v26 then nil else v27.icon;
    local v30 = l_React_0.useCallback(v18(l_label_0), {
        l_label_0
    });
    return l_Roact_0.createElement(l_CarouselUserContextualInfo_0, {
        label = {
            text = v30, 
            font = l_label_0.font, 
            colorStyle = l_label_0.colorStyle
        }, 
        icon = v29, 
        lineWidth = v19.lineWidth
    });
end;