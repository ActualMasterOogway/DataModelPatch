local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_AddFriends_0 = l_script_FirstAncestor_0.AddFriends;
local v3 = require(l_AddFriends_0.dependencies);
local l_Roact_0 = v3.Roact;
local v5 = require(l_Parent_0.React);
local v6 = require(l_Parent_0.Cryo);
local l_RoactRodux_0 = v3.RoactRodux;
local l_t_0 = v3.t;
local l_Dash_0 = v3.Dash;
local l_UIBlox_0 = v3.UIBlox;
local l_Promise_0 = v3.Promise;
local l_UniversalAppPolicy_0 = v3.UniversalAppPolicy;
local l_GridMetrics_0 = l_UIBlox_0.App.Grid.GridMetrics;
local l_getPageMargin_0 = l_UIBlox_0.App.Container.getPageMargin;
local l_useSelectionCursor_0 = l_UIBlox_0.App.SelectionImage.useSelectionCursor;
local l_CursorKind_0 = l_UIBlox_0.App.SelectionImage.CursorKind;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local l_withStyle_0 = l_UIBlox_0.Style.withStyle;
local l_withLocalization_0 = v3.withLocalization;
local l_getDeepValue_0 = v3.SocialLibraries.Dictionary.getDeepValue;
local l_DiscoverabilityAnalytics_0 = v3.DiscoverabilityAnalytics;
local l_VerticalScrollViewWithMargin_0 = l_UIBlox_0.App.Container.VerticalScrollViewWithMargin;
local l_RefreshScrollingFrame_0 = v3.SocialLibraries.Components.RefreshScrollingFrame;
local v24 = require(script.Parent.AddFriendsTile);
local v25 = require(script.Parent.AddFriendsContactImporterBanner);
local v26 = require(script.Parent.AddFriendsGenericBanner);
local v27 = require(script.Parent.AddFriendsSectionHeaderFrame);
local v28 = require(script.Parent.AddFriendsEmptyState);
local l_UserSearchBarButton_0 = v3.SocialCommon.Components.UserSearchBar.UserSearchBarButton;
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local l_useUiModeInfo_0 = require(l_Parent_0.RobloxAppHooks).useUiModeInfo;
local l_UiMode_0 = require(l_Parent_0.RobloxAppEnums).UiMode;
local v33 = require(l_Parent_0.FocusNavigationUtils);
local l_FocusNavigationEventNameEnum_0 = v33.FocusNavigationEventNameEnum;
local l_useLastInputMode_0 = v33.useLastInputMode;
local v36 = require(l_Parent_0.ReactFocusNavigation);
local v37 = require(l_Parent_0.InputHandlers);
local l_useFocusGuiObject_0 = v3.useFocusGuiObject;
local l_Sources_0 = require(l_Parent_0.SocialLuaAnalytics).Analytics.Enums.Sources;
local v40 = require(l_Parent_0.RobloxAppHooks);
local l_PermissionsProtocol_0 = require(l_Parent_0.PermissionsProtocol).PermissionsProtocol;
local l_useScreenSize_0 = v40.useScreenSize;
local l_useLocalUserId_0 = v40.useLocalUserId;
local l_UpdateContactImporterModalLogic_0 = require(l_Parent_0.SocialModalsCommon).Actions.UpdateContactImporterModalLogic;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local v46 = require(l_script_FirstAncestor_0.EnumScreens);
local v47 = require(l_script_FirstAncestor_0.Common.TextKeys);
local v48 = require(l_script_FirstAncestor_0.Components.ShowMoreWrapper);
local v49 = require(l_script_FirstAncestor_0.Enums.ShowMoreSectionTypeEnum);
local v50 = require(l_script_FirstAncestor_0.Common.Constants);
local l_TextKeys_0 = require(l_Parent_0.ContactImporter).TextKeys;
local l_useAnimatedScrollToSelection_0 = require(l_Parent_0.RobloxAppHooks).useAnimatedScrollToSelection;
local v53 = require(l_AddFriends_0.Redux.AddFriendsSelector);
local v54 = require(l_script_FirstAncestor_0.Flags.getFFlagUpdateContactImportModalLogic);
local v55 = require(l_script_FirstAncestor_0.Flags.getFIntAddFriendsVisibleRecRows);
local v56 = require(l_script_FirstAncestor_0.Flags.FFlagEnableAddFriendsPageSearchBar);
local l_getFFlagDiscoverabilityOverlayAmpUpsellFixEnabled_0 = require(l_Parent_0.SharedFlags).getFFlagDiscoverabilityOverlayAmpUpsellFixEnabled;
local v58 = require(l_script_FirstAncestor_0.Flags.FFlagFixJumpingEmptyPage);
local v59 = require(l_script_FirstAncestor_0.Flags.FFlagAddFriendsComponentsTransparent);
local l_FFlagAddFriendsMigrateAnalytics_0 = require(l_Parent_0.SharedFlags).FFlagAddFriendsMigrateAnalytics;
local l_FFlagAddFriendsSeparateReducers_0 = require(l_Parent_0.SharedFlags).FFlagAddFriendsSeparateReducers;
local v62 = game:DefineFastFlag("FixAddFriendsSearchKeybind", false);
local v63 = require(script.Parent.AddFriendsContentFrame);
local v64 = l_Roact_0.PureComponent:extend("AddFriendsPage");
local v65 = v55();
local function v66() --[[ Line: 90 ]]

end;
v64.validateProps = l_t_0.strictInterface({
    friendRecommendations = l_t_0.table, 
    friendRecommendationsCount = l_t_0.integer, 
    friendRecommendationsSessionId = l_t_0.optional(l_t_0.string), 
    friendRequests = l_t_0.table, 
    friendRequestsCount = l_t_0.integer, 
    screenSize = l_t_0.Vector2, 
    refreshPage = l_t_0.callback, 
    visibleRows = l_t_0.integer, 
    amIFollowingUser = l_t_0.callback, 
    isUserFollowingMe = l_t_0.callback, 
    getFriendshipRequestSentFromExperience = l_t_0.callback, 
    handleNavigateDownToViewUserProfile = l_t_0.optional(l_t_0.callback), 
    handleOpenLearnMoreLink = l_t_0.optional(l_Dash_0.isCallable), 
    handleOpenPhoneVerificationLinkWebview = l_t_0.optional(l_Dash_0.isCallable), 
    handleAcceptFriendRequest = l_t_0.optional(l_t_0.callback), 
    handleDeclineFriendRequest = l_t_0.optional(l_t_0.callback), 
    handleRequestFriendship = l_t_0.optional(l_t_0.callback), 
    handleIgnoreAllFriendsRequests = l_t_0.optional(l_t_0.callback), 
    openPlayerContextualMenu = l_t_0.optional(l_t_0.callback), 
    isPlayerContextualMenuEnabled = l_t_0.optional(l_t_0.boolean), 
    handleLoadMoreRequests = l_t_0.optional(l_t_0.callback), 
    contactImporterAndPYMKEnabled = l_t_0.optional(l_t_0.boolean), 
    contactImporterExperimentVariant = l_t_0.optional(l_t_0.string), 
    navigation = l_t_0.optional(l_t_0.table), 
    navigateToLuaAppPages = l_t_0.optional(l_t_0.table), 
    localUserId = l_t_0.optional(l_t_0.string), 
    shouldShowContactImporterFeature = l_t_0.optional(l_t_0.boolean), 
    shouldShowContactImporterUpsellModal = l_t_0.optional(l_t_0.boolean), 
    fireContactImporterAnalyticsEvents = l_t_0.callback, 
    fireContactImporterSeenEvent = l_t_0.callback, 
    contactImporterWarningSeen = l_t_0.optional(l_t_0.callback), 
    isPhoneVerified = l_t_0.optional(l_t_0.boolean), 
    isDiscoverabilityUnset = l_t_0.optional(l_t_0.boolean), 
    getUserSettingsMetadata = l_t_0.optional(l_t_0.callback), 
    handleShowToastForTests = l_t_0.optional(l_Dash_0.isCallable), 
    showTooltip = l_t_0.optional(l_t_0.boolean), 
    setScreenTopBar = l_t_0.optional(l_Dash_0.isCallable), 
    addFriendsPageSearchbarEnabled = l_t_0.optional(l_t_0.boolean), 
    originSourceType = l_t_0.optional(l_t_0.table), 
    showNewAddFriendsPageVariant = l_t_0.optional(l_t_0.boolean), 
    fireProfileQRCodeBannerSeenEvent = l_t_0.optional(l_t_0.callback), 
    fireProfileQRCodeBannerPressedEvent = l_t_0.optional(l_t_0.callback), 
    hasOSPermissions = l_t_0.optional(l_t_0.boolean), 
    openProfilePeekView = l_t_0.optional(l_t_0.callback), 
    fireSearchbarPressedEvent = l_t_0.optional(l_t_0.callback), 
    canUploadContacts = l_t_0.optional(l_t_0.boolean), 
    shouldShowPYMKSection = l_t_0.boolean, 
    analytics = if l_FFlagAddFriendsMigrateAnalytics_0 then nil else l_t_0.table, 
    BackgroundColor = l_t_0.optional(l_t_0.Color3), 
    BackgroundTransparency = l_t_0.optional(l_t_0.integer), 
    eventHandlerRef = l_t_0.optional(l_t_0.callback), 
    getItemMetrics = l_t_0.optional(l_t_0.callback), 
    itemMargin = l_t_0.optional(l_t_0.integer), 
    pagePaddingTop = l_t_0.optional(l_t_0.integer), 
    focusGuiObject = l_t_0.optional(l_t_0.callback), 
    shouldShowBanner = l_t_0.optional(l_t_0.boolean), 
    canvasPositionBinding = l_t_0.optional(l_t_0.table), 
    onSelectionChanged = l_t_0.optional(l_t_0.callback), 
    ScrollingEnabled = l_t_0.optional(l_t_0.boolean), 
    hasBottomWhitespace = l_t_0.boolean, 
    safeAreaMargin = l_t_0.Vector2, 
    globalGuiInset = l_t_0.table, 
    enableProfileQrCode = l_t_0.boolean, 
    pymkEnabledForConsole = l_t_0.optional(l_t_0.boolean), 
    hideContactImporterModal = l_t_0.callback, 
    shouldHideContactImporterUpsell = l_t_0.boolean, 
    checkOrRequestPermissions = l_t_0.callback, 
    bannerSectionPaddingBottom = l_t_0.optional(l_t_0.number), 
    fireOnShowMore = if l_FFlagAddFriendsMigrateAnalytics_0 then l_t_0.callback else nil
});
v64.defaultProps = {
    handleNavigateDownToViewUserProfile = v66, 
    handleAcceptFriendRequest = v66, 
    handleDeclineFriendRequest = v66, 
    handleRequestFriendship = v66, 
    handleIgnoreAllFriendsRequests = v66, 
    handleLoadMoreRequests = nil, 
    handleOpenLearnMoreLink = v66, 
    handleOpenPhoneVerificationLinkWebview = v66, 
    handleShowToastForTests = nil, 
    getItemMetrics = l_GridMetrics_0.getMediumMetrics, 
    itemMargin = 12, 
    pagePaddingTop = 0
};
v64.init = function(v67) --[[ Line: 179 ]] --[[ Name: init ]]
    -- upvalues: l_Roact_0 (copy), v24 (copy), v46 (copy), v54 (copy), l_getFFlagDiscoverabilityOverlayAmpUpsellFixEnabled_0 (copy), l_DiscoverabilityAnalytics_0 (copy), l_Promise_0 (copy), v56 (copy), l_Sources_0 (copy)
    local v68 = false;
    v67.state = {
        shouldShowContactImporterModal = v67.props.shouldShowContactImporterUpsellModal, 
        selectedIndexAfterShowMore = nil
    };
    v67.renderAddFriendsTile = function(v69, v70, v71, v72) --[[ Line: 186 ]]
        -- upvalues: v67 (copy), v68 (ref), l_Roact_0 (ref), v24 (ref)
        local v73 = false;
        local v74 = v67.props.originSourceType[v69.id] == "PhoneContactImporter";
        v73 = v67.props.showTooltip and not v68 and v74;
        if v74 then
            v68 = true;
        end;
        return l_Roact_0.createElement(v24, {
            layoutOrder = v72, 
            position = v72, 
            user = v69, 
            size = Vector2.new(v70, v71), 
            isFriendRequest = not v69.isRecommendation or false, 
            isRecommendation = v69.isRecommendation, 
            amIFollowingUser = v67.props.amIFollowingUser(v69), 
            isUserFollowingMe = v67.props.isUserFollowingMe(v69), 
            sentFromExperienceName = v67.props.getFriendshipRequestSentFromExperience(v69), 
            handleNavigateDownToViewUserProfile = v67.props.handleNavigateDownToViewUserProfile, 
            handleAcceptFriendRequest = v67.props.handleAcceptFriendRequest, 
            handleDeclineFriendRequest = v67.props.handleDeclineFriendRequest, 
            handleRequestFriendship = v67.props.handleRequestFriendship, 
            openPlayerContextualMenu = v67.props.openPlayerContextualMenu, 
            contactImporterWarningSeen = v67.props.contactImporterWarningSeen, 
            showTooltip = v73, 
            navigation = v67.props.navigation, 
            isPlayerContextualMenuEnabled = v67.props.isPlayerContextualMenuEnabled, 
            selected = v72 == v67.state.selectedIndexAfterShowMore, 
            focusGuiObject = v67.props.focusGuiObject
        });
    end;
    v67.showContactImporterBanner = function(v75) --[[ Line: 218 ]]
        return v75.contactImporterAndPYMKEnabled;
    end;
    v67.shouldRenderShowMoreFriendRequests = function(v76) --[[ Line: 222 ]]
        -- upvalues: v67 (copy)
        return v76 < v67.props.friendRequestsCount;
    end;
    v67.shouldRenderShowMoreFriendRecommendations = function(v77) --[[ Line: 226 ]]
        -- upvalues: v67 (copy)
        return v77 < v67.props.friendRecommendationCount;
    end;
    v67.showToastForContactsUpload = function(v78) --[[ Line: 230 ]]
        -- upvalues: v67 (copy), v46 (ref)
        if v67.props.navigation then
            v67.props.navigation.navigate(v46.GenericToast, {
                toastProps = {
                    toastContent = {
                        toastTitle = v78
                    }
                }
            });
        end;
    end;
    v67.openContactImporter = function() --[[ Line: 240 ]]
        -- upvalues: v67 (copy), v54 (ref), v46 (ref), l_getFFlagDiscoverabilityOverlayAmpUpsellFixEnabled_0 (ref), l_DiscoverabilityAnalytics_0 (ref), l_Promise_0 (ref)
        v67.props.fireContactImporterAnalyticsEvents();
        v67.props.contactImporterWarningSeen();
        local _ = nil;
        if if v54() then v67.state.shouldShowContactImporterModal else not v67.props.hasOSPermissions or not v67.props.canUploadContacts or v67.state.shouldShowContactImporterModal then
            local v80 = {
                isFromAddFriendsPage = true, 
                openLearnMoreLink = v67.props.handleOpenLearnMoreLink, 
                showToast = v67.props.handleShowToastForTests or v67.showToastForContactsUpload, 
                diagService = v67.props.diagService, 
                eventIngestService = v67.props.eventIngestService, 
                isDiscoverabilityUnset = v67.props.isDiscoverabilityUnset, 
                isPhoneVerified = v67.props.isPhoneVerified, 
                openAmpUpsell = v67.props.navigateToLuaAppPages[v46.AmpWizardContainer]
            };
            v67.props.navigation.navigate(v46.ContactImporter, v80);
            return;
        else
            local v81 = {
                isFromAddFriendsPage = true, 
                openLearnMoreLink = v67.props.handleOpenLearnMoreLink, 
                bypassFetchContacts = true, 
                diagService = v67.props.diagService, 
                eventIngestService = v67.props.eventIngestService, 
                isPhoneVerified = v67.props.isPhoneVerified, 
                openAmpUpsell = v67.props.navigateToLuaAppPages[v46.AmpWizardContainer], 
                showToast = if l_getFFlagDiscoverabilityOverlayAmpUpsellFixEnabled_0() then v67.props.handleShowToastForTests or v67.showToastForContactsUpload else nil
            };
            if v67.props.isDiscoverabilityUnset and v67.props.isPhoneVerified then
                v67.props.getUserSettingsMetadata():andThen(function() --[[ Line: 283 ]]
                    -- upvalues: v67 (ref), v46 (ref), l_DiscoverabilityAnalytics_0 (ref)
                    v67.props.navigation.navigate(v46.DiscoverabilityOverlay, {
                        showToast = v67.showToastForContactsUpload, 
                        openLearnMoreLink = v67.props.handleOpenLearnMoreLink, 
                        diagService = v67.props.diagService, 
                        eventIngestService = v67.props.eventIngestService, 
                        entryPoint = l_DiscoverabilityAnalytics_0.EntryPoints.AddFriends
                    });
                end):catch(function() --[[ Line: 292 ]]
                    -- upvalues: l_Promise_0 (ref)
                    return l_Promise_0.reject();
                end);
                return;
            else
                v67.props.navigation.navigate(v46.ContactsList, v81);
                return;
            end;
        end;
    end;
    v67.onSearchbarActivated = v67.props.addFriendsPageSearchbarEnabled and v56 and function() --[[ Line: 303 ]]
        -- upvalues: l_Sources_0 (ref), v67 (copy), v46 (ref)
        local v82 = {
            searchText = "", 
            shouldShowUserSearchLandingPage = true, 
            userSearchSource = l_Sources_0.AddFriendsPage
        };
        v67.props.navigation.navigate(v46.SearchFriends, v82);
        v67.props.setScreenTopBar(v46.FriendsLanding, {
            shouldRenderCenter = true, 
            shouldAutoFocusCenter = true
        });
        v67.props.fireSearchbarPressedEvent();
    end or nil;
    v67.openProfileQRCodePage = v67.props.showNewAddFriendsPageVariant and function() --[[ Line: 319 ]]
        -- upvalues: v67 (copy), v46 (ref)
        v67.props.fireProfileQRCodeBannerPressedEvent();
        v67.props.navigateToLuaAppPages[v46.ProfileQRCode]();
    end or nil;
    v67.handleShowMore = function(v83) --[[ Line: 325 ]]
        -- upvalues: v67 (copy)
        v67:setState({
            selectedIndexAfterShowMore = v67.props.visibleRows * v83 + 1
        });
        if v67.props.handleLoadMoreRequests then
            v67.props.handleLoadMoreRequests(v83);
        end;
    end;
end;
v64.didMount = function(v84) --[[ Line: 336 ]] --[[ Name: didMount ]]
    if v84.showContactImporterBanner(v84.props) then
        v84.props.fireContactImporterSeenEvent();
    end;
    if v84.props.showNewAddFriendsPageVariant and v84.props.enableProfileQrCode then
        v84.props.fireProfileQRCodeBannerSeenEvent();
    end;
end;
v64.didUpdate = function(v85, v86) --[[ Line: 348 ]] --[[ Name: didUpdate ]]
    if v85.showContactImporterBanner(v85.props) and not v85.showContactImporterBanner(v86) then
        v85.props.fireContactImporterSeenEvent();
    end;
    if v86.shouldShowContactImporterUpsellModal ~= v85.props.shouldShowContactImporterUpsellModal then
        v85:setState({
            shouldShowContactImporterModal = v85.props.shouldShowContactImporterUpsellModal
        });
    end;
end;
v64.render = function(v87) --[[ Line: 360 ]] --[[ Name: render ]]
    -- upvalues: l_getPageMargin_0 (copy), l_withLocalization_0 (copy), l_TextKeys_0 (copy), v47 (copy), l_withStyle_0 (copy), l_Roact_0 (copy), v26 (copy), l_Images_0 (copy), v25 (copy), v50 (copy), v58 (copy), v27 (copy), v59 (copy), v28 (copy), v48 (copy), l_FFlagAddFriendsMigrateAnalytics_0 (copy), v49 (copy), v63 (copy), l_RefreshScrollingFrame_0 (copy), l_VerticalScrollViewWithMargin_0 (copy), v56 (copy), v65 (copy), l_UserSearchBarButton_0 (copy)
    local l_getItemMetrics_0 = v87.props.getItemMetrics;
    local l_itemMargin_0 = v87.props.itemMargin;
    local l_pagePaddingTop_0 = v87.props.pagePaddingTop;
    local v91 = if v87.props.safeAreaMargin.X > 0 then v87.props.safeAreaMargin.X else l_getPageMargin_0(v87.props.screenSize.X);
    return l_withLocalization_0({
        friendRequestsText = "Feature.AddFriends.Label.FriendRequests", 
        buttonText = if v87.props.showNewAddFriendsPageVariant then nil else l_TextKeys_0.CONTACTS_LIST_TITLE, 
        bannerText = if v87.props.showNewAddFriendsPageVariant then nil else l_TextKeys_0.BANNER_TEXT, 
        contactImporterBannerTitle = if v87.props.showNewAddFriendsPageVariant then l_TextKeys_0.CONNECT_WITH_CONTACTS_TITLE else nil, 
        contactImporterBannerText = if v87.props.showNewAddFriendsPageVariant then l_TextKeys_0.CONNECT_WITH_CONTACTS_BODY else nil, 
        qrCodeBannerTitle = v87.props.showNewAddFriendsPageVariant and "Feature.AddFriends.Title.ShareQRCode" or nil, 
        qrCodeBannerText = v87.props.showNewAddFriendsPageVariant and "Feature.AddFriends.Label.ShareQRCode" or nil, 
        peopleYouMayKnow = v47.PEOPLE_YOU_MAY_KNOW
    })(function(v92) --[[ Line: 391 ]]
        -- upvalues: l_withStyle_0 (ref), v87 (copy), l_Roact_0 (ref), v26 (ref), l_Images_0 (ref), v25 (ref), v50 (ref), v58 (ref), v27 (ref), v59 (ref), v28 (ref), v48 (ref), l_FFlagAddFriendsMigrateAnalytics_0 (ref), v49 (ref), v63 (ref), l_itemMargin_0 (copy), l_getItemMetrics_0 (copy), v91 (copy), l_pagePaddingTop_0 (copy), l_RefreshScrollingFrame_0 (ref), l_VerticalScrollViewWithMargin_0 (ref), v56 (ref), v65 (ref), l_UserSearchBarButton_0 (ref)
        return l_withStyle_0(function(v93) --[[ Line: 392 ]]
            -- upvalues: v87 (ref), l_Roact_0 (ref), v26 (ref), l_Images_0 (ref), v92 (copy), v25 (ref), v50 (ref), v58 (ref), v27 (ref), v59 (ref), v28 (ref), v48 (ref), l_FFlagAddFriendsMigrateAnalytics_0 (ref), v49 (ref), v63 (ref), l_itemMargin_0 (ref), l_getItemMetrics_0 (ref), v91 (ref), l_pagePaddingTop_0 (ref), l_RefreshScrollingFrame_0 (ref), l_VerticalScrollViewWithMargin_0 (ref), v56 (ref), v65 (ref), l_UserSearchBarButton_0 (ref)
            local v94 = v87.props.friendRequestsCount > 0;
            local v95 = v94 and " (" .. v87.props.friendRequestsCount .. ")" or "";
            local v96 = true;
            if v87.props.shouldShowPYMKSection and not v94 and v87.props.friendRecommendationsCount > 0 then
                v96 = false;
            end;
            local v97 = nil;
            local v98 = nil;
            local v99 = nil;
            if v87.props.showNewAddFriendsPageVariant then
                v98 = if v87.showContactImporterBanner(v87.props) then l_Roact_0.createElement(v26, {
                    bannerIcon = l_Images_0["icons/graphic/contacts_large"], 
                    bannerTitle = v92.contactImporterBannerTitle, 
                    bannerText = v92.contactImporterBannerText, 
                    onActivated = v87.openContactImporter, 
                    hasInfoButton = false
                }) else nil;
                v99 = if v87.props.enableProfileQrCode then l_Roact_0.createElement(v26, {
                    bannerIcon = l_Images_0["icons/graphic/scanqr_large"], 
                    bannerTitle = v92.qrCodeBannerTitle, 
                    bannerText = v92.qrCodeBannerText, 
                    onActivated = v87.openProfileQRCodePage, 
                    hasInfoButton = false
                }) else nil;
            elseif v87.showContactImporterBanner(v87.props) then
                v97 = l_Roact_0.createElement(v25, {
                    bannerText = v92.bannerText, 
                    buttonText = v92.buttonText, 
                    onActivated = v87.openContactImporter, 
                    containerWidth = v87.props.screenSize.X
                });
            end;
            local l_TOP_BAR_HEIGHT_0 = v50.TOP_BAR_HEIGHT;
            if v87.props.showNewAddFriendsPageVariant then
                l_TOP_BAR_HEIGHT_0 = -155;
            end;
            local v101 = not v87.props.showNewAddFriendsPageVariant or v94;
            local v102 = if v58 then l_Roact_0.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, l_TOP_BAR_HEIGHT_0), 
                LayoutOrder = 2, 
                BackgroundTransparency = 1, 
                SelectionImageObject = v87.props.cursor
            }, {
                Layout = l_Roact_0.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, 0)
                }), 
                HeaderFrame = v101 and l_Roact_0.createElement(v27, {
                    layoutOrder = 1, 
                    title = v92.friendRequestsText
                }) or nil, 
                EmptyStateLayoutWrapper = l_Roact_0.createElement("Frame", {
                    Size = UDim2.fromScale(1, 1), 
                    BackgroundColor3 = if not v59 then v93.Theme.BackgroundDefault.Color else nil, 
                    BackgroundTransparency = v59 and 1 or nil, 
                    BorderSizePixel = 0, 
                    LayoutOrder = 2
                }, {
                    EmptyState = if v87.props.showNewAddFriendsPageVariant then l_Roact_0.createElement(v28, {
                        screenSize = v87.props.screenSize, 
                        showNewAddFriendsPageVariant = v87.props.showNewAddFriendsPageVariant
                    }) else l_Roact_0.createElement(v28)
                })
            }) else nil;
            local v103 = l_Roact_0.createElement(v48, {
                analytics = if l_FFlagAddFriendsMigrateAnalytics_0 then nil else v87.props.analytics, 
                sectionType = v49.FriendRequests, 
                friendRecommendationsSessionId = v87.props.friendRecommendationsSessionId, 
                listComponent = v63, 
                visibleRows = v87.props.visibleRows, 
                handleShowMore = v87.handleShowMore, 
                itemMargin = l_itemMargin_0, 
                getItemMetrics = l_getItemMetrics_0, 
                showContactImporterTooltip = v87.props.showContactImporterTooltip, 
                itemSize = l_getItemMetrics_0(v87.props.screenSize.X - 2 * v91, l_itemMargin_0).itemWidth, 
                friends = v87.props.friendRequests, 
                overrideRenderShowMore = v87.props.friendRequestsCount and v87.shouldRenderShowMoreFriendRequests or nil, 
                headerFrame = {
                    title = v92.friendRequestsText .. v95, 
                    iconVisible = v94
                }, 
                renderAddFriendsTile = v87.renderAddFriendsTile, 
                handleIgnoreAllFriendsRequests = v87.props.handleIgnoreAllFriendsRequests, 
                position = UDim2.new(0, 0, 0, 0), 
                layoutOrder = 2, 
                screenSize = Vector2.new(v87.props.screenSize.X - 2 * v91 - v87.props.globalGuiInset.left, v87.props.screenSize.Y), 
                showNewAddFriendsPageVariant = v87.props.showNewAddFriendsPageVariant, 
                spacingIfEmpty = v87.props.friendRecommendationsCount > 0 and 0 or nil, 
                fireOnShowMore = if l_FFlagAddFriendsMigrateAnalytics_0 then v87.props.fireOnShowMore else nil
            });
            local v104 = nil;
            v104 = if v58 then if v87.props.friendRequestsCount > 0 then v103 else v102 else v103;
            local l_createFragment_0 = l_Roact_0.createFragment;
            local v106 = {
                pagePadding = l_Roact_0.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, l_pagePaddingTop_0)
                })
            };
            local l_createElement_0 = l_Roact_0.createElement;
            local v108 = "Frame";
            local v109 = {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundColor3 = v87.props.BackgroundColor, 
                BackgroundTransparency = v87.props.BackgroundTransparency, 
                BorderSizePixel = 0, 
                [l_Roact_0.Ref] = v87.props.eventHandlerRef
            };
            local v110 = {};
            local l_createElement_1 = l_Roact_0.createElement;
            local v112 = "Frame";
            local v113 = {
                Size = UDim2.fromScale(1, 1), 
                LayoutOrder = 1, 
                BackgroundTransparency = 1
            };
            local v114 = {};
            local l_createElement_2 = l_Roact_0.createElement;
            local l_l_RefreshScrollingFrame_0_0 = l_RefreshScrollingFrame_0;
            local v117 = {
                ScrollingElement = l_VerticalScrollViewWithMargin_0
            };
            local v118 = {
                size = UDim2.new(1, 0, 1, if v87.props.addFriendsPageSearchbarEnabled and v56 then -2 * v50.TOP_BAR_HEIGHT else -v50.TOP_BAR_HEIGHT)
            };
            local v119 = true;
            if v87.props.friendRequestsCount <= 0 then
                v119 = v87.props.shouldShowPYMKSection and v87.props.friendRecommendationsCount > 0;
            end;
            v118.useAutomaticCanvasSize = v119;
            v118.canvasSizeY = UDim.new(1, 1);
            v118.paddingHorizontal = v91;
            v118.Selectable = false;
            v118.onSelectionChanged = v87.props.onSelectionChanged;
            v118.CanvasPosition = v87.props.canvasPositionBinding;
            v118.ScrollingEnabled = v87.props.ScrollingEnabled;
            v117.scrollingElementProps = v118;
            v117.refresh = v87.props.refreshPage;
            v114.ScrollView = l_createElement_2(l_l_RefreshScrollingFrame_0_0, v117, {
                layout = l_Roact_0.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center
                }), 
                UIPadding = if v87.props.showNewAddFriendsPageVariant then l_Roact_0.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, 8)
                }) else if v87.props.contactImporterAndPYMKEnabled then l_Roact_0.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, 4)
                }) else nil, 
                Banner = if v87.props.shouldShowBanner then v97 else nil, 
                BannerSection = if v87.props.showNewAddFriendsPageVariant then l_Roact_0.createElement("Frame", {
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    Size = UDim2.fromScale(1, 0), 
                    BackgroundTransparency = 1
                }, {
                    UISizeConstraint = l_Roact_0.createElement("UISizeConstraint", {
                        MaxSize = Vector2.new(640, 1e999)
                    }), 
                    BannerLayout = l_Roact_0.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Vertical, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        Padding = UDim.new(0, 12)
                    }), 
                    ContactImporterBanner = v98, 
                    QRCodeBanner = v99, 
                    UIPadding = l_Roact_0.createElement("UIPadding", {
                        PaddingBottom = UDim.new(0, v87.props.bannerSectionPaddingBottom)
                    })
                }) else nil, 
                pulldownSpacing = l_Roact_0.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 1), 
                    LayoutOrder = 1, 
                    BackgroundTransparency = 1
                }), 
                requestSection = v96 and v104, 
                recommendationSection = v87.props.shouldShowPYMKSection and v87.props.friendRecommendationsCount > 0 and l_Roact_0.createElement(v48, {
                    listComponent = v63, 
                    visibleRows = v65, 
                    itemMargin = l_itemMargin_0, 
                    getItemMetrics = l_getItemMetrics_0, 
                    itemSize = l_getItemMetrics_0(v87.props.screenSize.X - 2 * v91, l_itemMargin_0).itemWidth, 
                    friends = v87.props.friendRecommendations, 
                    headerFrame = {
                        title = v92.peopleYouMayKnow, 
                        iconVisible = false
                    }, 
                    renderAddFriendsTile = v87.renderAddFriendsTile, 
                    position = UDim2.new(0, 0, 0, 0), 
                    layoutOrder = 3, 
                    screenSize = Vector2.new(v87.props.screenSize.X - 2 * v91 - v87.props.globalGuiInset.left, v87.props.screenSize.Y), 
                    shouldShowPYMKSection = v87.props.shouldShowPYMKSection, 
                    fireOnShowMore = if l_FFlagAddFriendsMigrateAnalytics_0 then v87.props.fireOnShowMore else nil
                }), 
                BottomWhitespace = if v87.props.hasBottomWhitespace and v94 then l_Roact_0.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 3000), 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 1000
                }) else nil
            });
            v110.contentFrame = l_createElement_1(v112, v113, v114);
            v106.page = l_createElement_0(v108, v109, v110);
            l_createFragment_0 = l_createFragment_0(v106);
            if v87.props.addFriendsPageSearchbarEnabled and v56 then
                return l_Roact_0.createElement("Frame", {
                    Size = UDim2.new(1, 0, 1, 0), 
                    BackgroundColor3 = v87.props.BackgroundColor, 
                    BackgroundTransparency = v87.props.BackgroundTransparency
                }, {
                    UIListLayout = l_Roact_0.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Vertical, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center
                    }), 
                    SearchbarButton = l_Roact_0.createElement(l_UserSearchBarButton_0, {
                        onActivated = v87.onSearchbarActivated
                    }); 
                    l_createFragment_0
                });
            else
                return l_createFragment_0;
            end;
        end);
    end);
end;
v64 = l_UniversalAppPolicy_0.connect(function(v120) --[[ Line: 679 ]]
    return {
        enableProfileQrCode = v120.getEnableProfileQrCode(), 
        shouldHideContactImporterUpsell = v120.getShouldHideContactImporterUpsell()
    };
end)(v64);
v64 = l_RoactRodux_0.connect(function(v121) --[[ Line: 686 ]]
    -- upvalues: l_FFlagAddFriendsSeparateReducers_0 (copy), v53 (copy), l_getDeepValue_0 (copy)
    return {
        originSourceType = if l_FFlagAddFriendsSeparateReducers_0 then v53(v121, "RequestsFromOriginSourceType") or {} else l_getDeepValue_0(v121, "FriendsLanding.RequestsFromOriginSourceType") or {}
    };
end, nil)(v64);
return function(v122) --[[ Line: 695 ]] --[[ Name: AddFriendsPageWrapper ]]
    -- upvalues: l_useDesignTokens_0 (copy), l_useUiModeInfo_0 (copy), v62 (copy), l_useLastInputMode_0 (copy), l_useFocusGuiObject_0 (copy), l_useScreenSize_0 (copy), l_useLocalUserId_0 (copy), l_useDispatch_0 (copy), l_PermissionsProtocol_0 (copy), l_UpdateContactImporterModalLogic_0 (copy), l_UiMode_0 (copy), v58 (copy), l_useSelectionCursor_0 (copy), l_CursorKind_0 (copy), v46 (copy), v5 (copy), l_Sources_0 (copy), v37 (copy), v36 (copy), l_FocusNavigationEventNameEnum_0 (copy), l_useAnimatedScrollToSelection_0 (copy), l_Roact_0 (copy), v64 (ref), v6 (copy), l_GridMetrics_0 (copy)
    local v123 = l_useDesignTokens_0();
    local v124 = l_useUiModeInfo_0();
    local v125 = if v62 then l_useLastInputMode_0() else nil;
    local v126 = l_useFocusGuiObject_0();
    local v127 = l_useScreenSize_0();
    local v128 = l_useLocalUserId_0();
    local v129 = l_useDispatch_0();
    local l_default_0 = l_PermissionsProtocol_0.default;
    local function v131() --[[ Line: 705 ]]
        -- upvalues: l_default_0 (copy), l_PermissionsProtocol_0 (ref)
        return l_default_0:checkOrRequestPermissions({
            l_PermissionsProtocol_0.Permissions.CONTACTS_ACCESS
        });
    end;
    local function v132() --[[ Line: 711 ]]
        -- upvalues: v129 (copy), l_UpdateContactImporterModalLogic_0 (ref)
        v129(l_UpdateContactImporterModalLogic_0({
            hasOSPermissions = true, 
            shouldShowContactImporterUpsellModal = false
        }));
    end;
    local v133 = v124.uiMode == l_UiMode_0.TenFoot;
    local v134 = if v62 then v125 == "Focus" else v133;
    local v135 = if v58 then l_useSelectionCursor_0(l_CursorKind_0.Invisible) else nil;
    if not v134 then
        v126 = nil;
    end;
    local v136 = nil;
    if v62 then
        if v133 then
            local v137 = v122.navigateToLuaAppPages[v46.SearchPage];
            local l_v137_0 = v137 --[[ copy: 15 -> 21 ]];
            v136 = v5.useCallback(function(v139) --[[ Line: 733 ]]
                -- upvalues: l_v137_0 (copy)
                v139:cancel();
                l_v137_0();
            end, {
                v137
            });
        else
            local v140 = v122.navigation ~= nil;
            v136 = v5.useCallback(function(v141) --[[ Line: 739 ]]
                -- upvalues: l_Sources_0 (ref), v122 (copy), v46 (ref)
                v141:cancel();
                local v142 = {
                    searchText = "", 
                    shouldShowUserSearchLandingPage = true, 
                    userSearchSource = l_Sources_0.AddFriendsPage
                };
                v122.navigation.navigate(v46.SearchFriends, v142);
                v122.setScreenTopBar(v46.FriendsLanding, {
                    shouldRenderCenter = true
                });
                v122.fireSearchbarPressedEvent();
            end, {
                v140
            });
        end;
    else
        v136 = function(v143) --[[ Line: 754 ]]
            -- upvalues: v122 (copy), v46 (ref)
            v143:cancel();
            v122.navigateToLuaAppPages[v46.SearchPage]();
        end;
    end;
    local v144 = v37.onRelease(v136);
    local v145 = v36.useEventHandler(l_FocusNavigationEventNameEnum_0.Search, v144);
    local l_ScrollAnimationConfig_0 = v123.LuaApps.App.Page.ScrollAnimationConfig;
    local v147, v148 = l_useAnimatedScrollToSelection_0(Enum.ScrollingDirection.Y, 0, v123.Global.Space_600, l_ScrollAnimationConfig_0);
    local v149 = not (v133 or v122.showNewAddFriendsPageVariant);
    return l_Roact_0.createElement(v64, v6.Dictionary.join(v122, {
        BackgroundColor = v123.LuaApps.App.Page.BackgroundColor, 
        BackgroundTransparency = v123.LuaApps.App.Page.BackgroundTransparency, 
        isPlayerContextualMenuEnabled = v133, 
        eventHandlerRef = v145, 
        getItemMetrics = if v133 then l_GridMetrics_0.makeCustomMetricsGetter(v123.LuaApps.FriendsLanding.AddFriendsPage.GridViewItemMetrics) else nil, 
        itemMargin = v123.LuaApps.FriendsLanding.AddFriendsPage.ItemMargin, 
        pagePaddingTop = v123.LuaApps.FriendsLanding.AddFriendsPage.PagePaddingTop, 
        safeAreaMargin = v123.LuaApps.App.Page.SafeAreaMargin, 
        focusGuiObject = v126, 
        shouldShowBanner = v149, 
        shouldShowPYMKSection = not v133 or if v122.pymkEnabledForConsole then v122.shouldShowPYMKSection else false, 
        showNewAddFriendsPageVariant = not v133 and v122.showNewAddFriendsPageVariant, 
        canvasPositionBinding = if v134 then v147 else nil, 
        onSelectionChanged = if v134 then v148 else nil, 
        ScrollingEnabled = not v133 and nil, 
        hasBottomWhitespace = v133, 
        cursor = v135, 
        screenSize = v127, 
        localUserId = v128, 
        checkOrRequestPermissions = v131, 
        hideContactImporterModal = v132, 
        bannerSectionPaddingBottom = v123.Global.Space_150
    }));
end;