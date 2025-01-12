local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialTab");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.SharedFlags);
local v3 = require(l_script_FirstAncestor_0.dependencies);
local v4 = require(l_script_FirstAncestor_0.Analytics);
local v5 = require(l_script_FirstAncestor_0.SocialTabContext);
local v6 = require(l_script_FirstAncestor_0.ContextUtils.compose);
local l_llama_0 = v3.llama;
local l_Roact_0 = v3.Roact;
local l_RoactRodux_0 = v3.RoactRodux;
local l_withLocalization_0 = v3.withLocalization;
local l_UniversalAppPolicy_0 = v3.UniversalAppPolicy;
local l_SelfViewProfileDiscoverabilityUpsellIXP_0 = v3.SelfViewProfileDiscoverabilityUpsellIXP;
local v13 = require(script.mapStateToProps);
local v14 = require(script.mapDispatchToProps);
local v15 = require(script.Parent.SocialTabPage);
local v16 = require(l_script_FirstAncestor_0.UserCarousel);
local v17 = l_Roact_0.PureComponent:extend("SocialTabContainer");
local l_GetFFlagHideConnectPageWebViewItemsForVR_0 = v3.GetFFlagHideConnectPageWebViewItemsForVR;
local l_GetFFlagUseCommunitiesTranslation_0 = v2.GetFFlagUseCommunitiesTranslation;
v17.defaultProps = {};
v17.init = function(v20) --[[ Line: 28 ]] --[[ Name: init ]]
    -- upvalues: l_GetFFlagUseCommunitiesTranslation_0 (copy)
    v20.localization = {
        socialText = "Feature.SocialTab.Label.Connect", 
        chatsText = "Feature.SocialTab.Label.Chats", 
        groupsText = l_GetFFlagUseCommunitiesTranslation_0() and "Feature.SocialTab.Label.Groups" or "CommonUI.Features.Label.sGroups"
    };
end;
v17.didMount = function(v21) --[[ Line: 38 ]] --[[ Name: didMount ]]
    v21.props.fetchFriendsRequestsCount();
end;
v17.render = function(v22) --[[ Line: 42 ]] --[[ Name: render ]]
    -- upvalues: l_withLocalization_0 (copy), v4 (copy), v5 (copy), l_Roact_0 (copy), v15 (copy), l_llama_0 (copy), v16 (copy), l_SelfViewProfileDiscoverabilityUpsellIXP_0 (copy)
    return l_withLocalization_0(v22.localization)(function(v23) --[[ Line: 43 ]]
        -- upvalues: v4 (ref), v5 (ref), l_Roact_0 (ref), v15 (ref), l_llama_0 (ref), v22 (copy), v16 (ref), l_SelfViewProfileDiscoverabilityUpsellIXP_0 (ref)
        return v4.with(function(v24) --[[ Line: 44 ]]
            -- upvalues: v5 (ref), l_Roact_0 (ref), v15 (ref), l_llama_0 (ref), v22 (ref), v16 (ref), l_SelfViewProfileDiscoverabilityUpsellIXP_0 (ref), v23 (copy)
            return v5.with(function(v25) --[[ Line: 45 ]]
                -- upvalues: l_Roact_0 (ref), v15 (ref), l_llama_0 (ref), v22 (ref), v24 (copy), v16 (ref), l_SelfViewProfileDiscoverabilityUpsellIXP_0 (ref), v23 (ref)
                return l_Roact_0.createElement(v15, l_llama_0.Dictionary.join(v22.props, {
                    analytics = v24, 
                    navigateToLuaAppPages = v25.navigateToLuaAppPages, 
                    renderUserCarousel = v16.render, 
                    wideMode = v25.wideMode, 
                    navigatingFromSocialTabEvent = v25.setNavigatingFromSocialTabEvent, 
                    isLuaProfilePageEnabled = v25.isLuaProfilePageEnabled, 
                    luaAddFriendsPageEnabled = v25.luaAddFriendsPageEnabled and true or false, 
                    closeCentralOverlay = if l_SelfViewProfileDiscoverabilityUpsellIXP_0.SetupEnabled() then v25.closeCentralOverlay else nil, 
                    openLearnMoreLink = if l_SelfViewProfileDiscoverabilityUpsellIXP_0.SetupEnabled() then v25.openLearnMoreLink else nil, 
                    showToast = if l_SelfViewProfileDiscoverabilityUpsellIXP_0.SetupEnabled() then v25.showToast else nil, 
                    discoverabilityUpsellOnProfileSelfViewEnabled = if l_SelfViewProfileDiscoverabilityUpsellIXP_0.SetupEnabled() then v25.discoverabilityUpsellOnProfileSelfViewEnabled else nil
                }, v23));
            end);
        end);
    end);
end;
return v6(l_RoactRodux_0.connect(v13, v14), l_UniversalAppPolicy_0.connect(function(v26) --[[ Line: 78 ]]
    -- upvalues: l_GetFFlagHideConnectPageWebViewItemsForVR_0 (copy)
    local v27 = v26.getChatHeaderNotifications();
    local v28 = if l_GetFFlagHideConnectPageWebViewItemsForVR_0() then not v26.getWebViewSupport() else nil;
    return {
        enableDisplayNamePolicy = v26.getShowDisplayName(), 
        shouldShowGroupsTilePolicy = v26.getShouldShowGroupsTile(), 
        enableNotificationsPolicy = v27, 
        disableWebViewSupport = v28
    };
end))(v17);