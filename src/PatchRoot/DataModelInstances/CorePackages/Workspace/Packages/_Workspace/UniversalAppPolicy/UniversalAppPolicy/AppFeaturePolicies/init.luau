local l_UserInputService_0 = game:GetService("UserInputService");
local l_Parent_0 = script.Parent.Parent;
local l_Placements_0 = require(l_Parent_0.AppSystemBar).Enum.Placements;
local l_isSpatial_0 = require(l_Parent_0.AppCommonLib).isSpatial;
local l_IsVRAppBuild_0 = require(l_Parent_0.AppCommonLib).IsVRAppBuild;
local v5 = require(l_Parent_0.Cryo);
local l_Constants_0 = require(l_Parent_0.Style).Constants;
local v7 = v5.Dictionary.values(l_Constants_0.ThemeName);
local v8 = require(script.Parent.Enum.CrossPlayCapabilities);
local v9 = require(script.Parent.Enum.MorePageLayout);
local v10 = require(l_Parent_0.SharedFlags);
local l_isSubjectToDesktopPolicies_0 = v10.isSubjectToDesktopPolicies;
local l_GetFFlagEnableSwapToSourceButton_0 = v10.GetFFlagEnableSwapToSourceButton;
local l_GetFFlagEnableTopBarVRPolicyOverride_0 = v10.GetFFlagEnableTopBarVRPolicyOverride;
local l_isRunningInStudio_0 = require(l_Parent_0.AppCommonLib).isRunningInStudio;
local l_GetFFlagUseVoiceExitBetaLanguage_0 = v10.GetFFlagUseVoiceExitBetaLanguage;
local l_GetFFlagDisableCDLQrCodeForMaquettes_0 = v10.GetFFlagDisableCDLQrCodeForMaquettes;
local l_GetFFlagUseEnablePremiumUserFeaturesAppPolicy_0 = v10.GetFFlagUseEnablePremiumUserFeaturesAppPolicy;
local l_GetFFlagLuafiedReportEntryPoints_0 = v10.GetFFlagLuafiedReportEntryPoints;
local l_GetFFlagEnableAbuseReport10ft_0 = v10.GetFFlagEnableAbuseReport10ft;
local l_FFlagRealNamesInDisplayNameExperimentEnabled_0 = v10.FFlagRealNamesInDisplayNameExperimentEnabled;
local l_GetFFlagUseExternalBrowserForAgeGuidelines10ft_0 = v10.GetFFlagUseExternalBrowserForAgeGuidelines10ft;
local l_GetFFlagContactsToastPolicyEnabled_0 = v10.GetFFlagContactsToastPolicyEnabled;
local l_GetFFlagEnableGateNotificationPreferencesTab_0 = v10.GetFFlagEnableGateNotificationPreferencesTab;
local l_FFlagLuaAppHomeVngAppUpsell_0 = v10.FFlagLuaAppHomeVngAppUpsell;
local l_FFlagFriendRequestNicknames_0 = v10.FFlagFriendRequestNicknames;
local l_GetFFlagDisableResellingCollectiblesForCompliance_0 = v10.GetFFlagDisableResellingCollectiblesForCompliance;
local l_GetFFlagMakeMorePageUniversal_0 = v10.GetFFlagMakeMorePageUniversal;
local l_GetFFlagAXToggleContinuousLoad_0 = v10.GetFFlagAXToggleContinuousLoad;
local l_FFlagRenamePaymentsToSpendingTab_0 = v10.FFlagRenamePaymentsToSpendingTab;
local l_FFlagRenamePrivacyToPrivacyContentMaturityTab_0 = v10.FFlagRenamePrivacyToPrivacyContentMaturityTab;
local l_GetFFlagAppNavRemoveUseBottomBar_0 = v10.GetFFlagAppNavRemoveUseBottomBar;
local l_GetFFlagAXToggleAggregateLikesFavoritesCount_0 = v10.GetFFlagAXToggleAggregateLikesFavoritesCount;
local l_FFlagLuaAppParentUpsellPolicy_0 = v10.FFlagLuaAppParentUpsellPolicy;
local l_GetFFlagSelfieViewUseNewErrorBody_0 = v10.GetFFlagSelfieViewUseNewErrorBody;
local l_FFlagRenameParentEmailForVerificationUpsell_0 = v10.FFlagRenameParentEmailForVerificationUpsell;
local l_GetFFlagSeamlessVoiceConsentToastPolicy_0 = v10.GetFFlagSeamlessVoiceConsentToastPolicy;
local l_GetFFlagEnableMultiPageSignup_0 = v10.GetFFlagEnableMultiPageSignup;
local l_GetFIntExclusiveFallbackExclusiveUnderageCutoffForMultiPageSignup_0 = v10.GetFIntExclusiveFallbackExclusiveUnderageCutoffForMultiPageSignup;
local l_FFlagHideAggregateLikeCountsOnEdp_0 = v10.FFlagHideAggregateLikeCountsOnEdp;
local l_GetFFlagAppNavUpdateUse3DPanels_0 = v10.GetFFlagAppNavUpdateUse3DPanels;
local v41 = game:DefineFastFlag("UseGUACforDUARPolicy", false);
local v42 = game:DefineFastFlag("LuaAppEnableRecommendedCarouselForDesktop", false);
local v43 = game:DefineFastFlag("DisableWebViewSupportInStudio", false);
local v44 = game:DefineFastFlag("DebugUseLegacyCrossPlayApi", false);
local v45 = game:DefineFastString("DebugOverrideCrossPlaySettingsKey", "");
local v46 = game:DefineFastString("DebugOverrideCrossPlayQueryParam", "");
local v47 = game:DefineFastFlag("DebugCrossPlaySystemUi", false);
local v48 = game:DefineFastString("DebugOverrideCrossPlayUri", "");
game:DefineFastFlag("BehaviorCollectionControlEnabled", false);
game:DefineFastFlag("LuaAppPromotionalEmailsCheckboxEnabledInAppPolicy", false);
local l_GetFFlagNotificationsComplianceShouldRestrictStream_0 = v10.GetFFlagNotificationsComplianceShouldRestrictStream;
return function(v50) --[[ Line: 67 ]] --[[ Name: AppFeaturePolicies ]]
    -- upvalues: l_IsVRAppBuild_0 (copy), v42 (copy), v41 (copy), l_isSubjectToDesktopPolicies_0 (copy), l_GetFFlagEnableSwapToSourceButton_0 (copy), l_GetFFlagMakeMorePageUniversal_0 (copy), l_GetFFlagAppNavRemoveUseBottomBar_0 (copy), l_Placements_0 (copy), l_GetFFlagEnableTopBarVRPolicyOverride_0 (copy), l_GetFFlagAppNavUpdateUse3DPanels_0 (copy), l_isSpatial_0 (copy), l_isRunningInStudio_0 (copy), v43 (copy), l_GetFFlagLuafiedReportEntryPoints_0 (copy), l_GetFFlagEnableAbuseReport10ft_0 (copy), l_GetFFlagUseVoiceExitBetaLanguage_0 (copy), l_GetFFlagSeamlessVoiceConsentToastPolicy_0 (copy), l_GetFFlagDisableCDLQrCodeForMaquettes_0 (copy), v5 (copy), v7 (copy), v44 (copy), v47 (copy), v48 (copy), v8 (copy), v45 (copy), v46 (copy), v9 (copy), l_FFlagRealNamesInDisplayNameExperimentEnabled_0 (copy), l_GetFFlagUseEnablePremiumUserFeaturesAppPolicy_0 (copy), l_GetFFlagUseExternalBrowserForAgeGuidelines10ft_0 (copy), l_GetFFlagContactsToastPolicyEnabled_0 (copy), l_GetFFlagEnableGateNotificationPreferencesTab_0 (copy), l_UserInputService_0 (copy), l_FFlagLuaAppHomeVngAppUpsell_0 (copy), l_FFlagFriendRequestNicknames_0 (copy), l_FFlagLuaAppParentUpsellPolicy_0 (copy), l_FFlagRenamePaymentsToSpendingTab_0 (copy), l_FFlagRenamePrivacyToPrivacyContentMaturityTab_0 (copy), l_GetFFlagNotificationsComplianceShouldRestrictStream_0 (copy), l_GetFFlagDisableResellingCollectiblesForCompliance_0 (copy), l_GetFFlagAXToggleContinuousLoad_0 (copy), l_GetFFlagAXToggleAggregateLikesFavoritesCount_0 (copy), l_FFlagHideAggregateLikeCountsOnEdp_0 (copy), l_GetFFlagSelfieViewUseNewErrorBody_0 (copy), l_FFlagRenameParentEmailForVerificationUpsell_0 (copy), l_GetFFlagEnableMultiPageSignup_0 (copy), l_GetFIntExclusiveFallbackExclusiveUnderageCutoffForMultiPageSignup_0 (copy)
    local function _(v51, v52) --[[ Line: 68 ]] --[[ Name: getVRDefaultPolicy ]]
        -- upvalues: v50 (copy), l_IsVRAppBuild_0 (ref)
        if v50[v51] ~= nil then
            return v50[v51];
        elseif l_IsVRAppBuild_0() then
            return v52;
        else
            return not v52;
        end;
    end;
    return {
        getFriendFinder = function() --[[ Line: 79 ]] --[[ Name: getFriendFinder ]]
            -- upvalues: v50 (copy)
            return v50.FriendFinder or false;
        end, 
        getGameDetailsMorePage = function() --[[ Line: 82 ]] --[[ Name: getGameDetailsMorePage ]]
            -- upvalues: v50 (copy)
            return v50.GameDetailsMorePage or false;
        end, 
        getGameDetailsSubtitle = function() --[[ Line: 85 ]] --[[ Name: getGameDetailsSubtitle ]]
            -- upvalues: v50 (copy)
            return v50.GameDetailsSubtitle or false;
        end, 
        getShowGlobalCounters = function() --[[ Line: 88 ]] --[[ Name: getShowGlobalCounters ]]
            -- upvalues: v50 (copy)
            return v50.GameDetailsShowGlobalCounters or false;
        end, 
        getGameDetailsPlayWithFriends = function() --[[ Line: 91 ]] --[[ Name: getGameDetailsPlayWithFriends ]]
            -- upvalues: v50 (copy)
            return v50.GameDetailsPlayWithFriends or false;
        end, 
        getGameInfoList = function() --[[ Line: 94 ]] --[[ Name: getGameInfoList ]]
            -- upvalues: v50 (copy)
            return v50.GameInfoList or false;
        end, 
        getGamePlaysAndRatings = function() --[[ Line: 97 ]] --[[ Name: getGamePlaysAndRatings ]]
            -- upvalues: v50 (copy)
            return v50.GamePlaysAndRatings or false;
        end, 
        getNotifications = function() --[[ Line: 100 ]] --[[ Name: getNotifications ]]
            -- upvalues: v50 (copy)
            return v50.Notifications or false;
        end, 
        getRecommendedGames = function() --[[ Line: 103 ]] --[[ Name: getRecommendedGames ]]
            -- upvalues: v42 (ref), v50 (copy), v41 (ref), l_isSubjectToDesktopPolicies_0 (ref)
            if v42 then
                return v50.RecommendedGames or false;
            elseif not v41 and l_isSubjectToDesktopPolicies_0() then
                return false;
            else
                return v50.RecommendedGames or false;
            end;
        end, 
        getSearchBar = function() --[[ Line: 115 ]] --[[ Name: getSearchBar ]]
            -- upvalues: v50 (copy)
            return v50.SearchBar or false;
        end, 
        getSwapToSourceButton = function() --[[ Line: 118 ]] --[[ Name: getSwapToSourceButton ]]
            -- upvalues: l_GetFFlagEnableSwapToSourceButton_0 (ref), v50 (copy)
            return l_GetFFlagEnableSwapToSourceButton_0() or v50.SwapToSourceButton or false;
        end, 
        getGiftCardsEnabled = if l_GetFFlagMakeMorePageUniversal_0() then nil else function() --[[ Line: 123 ]]
            -- upvalues: v50 (copy)
            return v50.GiftCardsEnabled or false;
        end, 
        getOfficialStoreEnabled = if l_GetFFlagMakeMorePageUniversal_0() then nil else function() --[[ Line: 128 ]]
            -- upvalues: v50 (copy)
            return v50.OfficialStoreEnabled or false;
        end, 
        getMorePageType = if l_GetFFlagMakeMorePageUniversal_0() then nil else function() --[[ Line: 133 ]]
            -- upvalues: v50 (copy)
            return v50.MorePageType or "SimplifiedMore";
        end, 
        getMorePageContent = l_GetFFlagMakeMorePageUniversal_0() and function() --[[ Line: 137 ]]
            -- upvalues: v50 (copy)
            return v50.MorePageContent;
        end or nil, 
        getAboutPageType = function() --[[ Line: 141 ]] --[[ Name: getAboutPageType ]]
            -- upvalues: v50 (copy)
            return v50.AboutPageType or "CJVAbout";
        end, 
        getSettingsPageType = function() --[[ Line: 144 ]] --[[ Name: getSettingsPageType ]]
            -- upvalues: v50 (copy)
            return v50.SettingsPageType or "Settings";
        end, 
        getSocialLinks = function() --[[ Line: 147 ]] --[[ Name: getSocialLinks ]]
            -- upvalues: v50 (copy)
            return v50.SocialLinks or false;
        end, 
        getSocialGroupLinks = function() --[[ Line: 150 ]] --[[ Name: getSocialGroupLinks ]]
            -- upvalues: v50 (copy)
            return v50.SocialGroupLinks or false;
        end, 
        getCommunityLinksEnabled = function() --[[ Line: 153 ]] --[[ Name: getCommunityLinksEnabled ]]
            -- upvalues: v50 (copy)
            return v50.CommunityLinksEnabled or false;
        end, 
        getGameInfoShowBadges = function() --[[ Line: 156 ]] --[[ Name: getGameInfoShowBadges ]]
            -- upvalues: v50 (copy)
            return v50.GameInfoShowBadges or false;
        end, 
        getGameInfoShowCreated = function() --[[ Line: 159 ]] --[[ Name: getGameInfoShowCreated ]]
            -- upvalues: v50 (copy)
            return v50.GameInfoShowCreated or false;
        end, 
        getGameInfoShowGamepasses = function() --[[ Line: 162 ]] --[[ Name: getGameInfoShowGamepasses ]]
            -- upvalues: v50 (copy)
            return v50.GameInfoShowGamepasses or false;
        end, 
        getGameInfoShowGenre = function() --[[ Line: 165 ]] --[[ Name: getGameInfoShowGenre ]]
            -- upvalues: v50 (copy)
            return v50.GameInfoShowGenre or false;
        end, 
        getGameInfoShowSubgenre = function() --[[ Line: 168 ]] --[[ Name: getGameInfoShowSubgenre ]]
            -- upvalues: v50 (copy)
            return v50.GameInfoShowSubgenre or false;
        end, 
        getGameInfoShowMaxPlayers = function() --[[ Line: 171 ]] --[[ Name: getGameInfoShowMaxPlayers ]]
            -- upvalues: v50 (copy)
            return v50.GameInfoShowMaxPlayers or false;
        end, 
        getGameInfoShowServers = function() --[[ Line: 174 ]] --[[ Name: getGameInfoShowServers ]]
            -- upvalues: v50 (copy)
            return v50.GameInfoShowServers or false;
        end, 
        getGameInfoShowUpdated = function() --[[ Line: 177 ]] --[[ Name: getGameInfoShowUpdated ]]
            -- upvalues: v50 (copy)
            return v50.GameInfoShowUpdated or false;
        end, 
        getGameInfoShowAgeRecommendation = function() --[[ Line: 180 ]] --[[ Name: getGameInfoShowAgeRecommendation ]]
            -- upvalues: v50 (copy)
            if v50.GameInfoShowAgeRecommendation == nil then
                return true;
            else
                return v50.GameInfoShowAgeRecommendation;
            end;
        end, 
        getGameInfoShowVoiceAndChatFeatures = function() --[[ Line: 186 ]] --[[ Name: getGameInfoShowVoiceAndChatFeatures ]]
            -- upvalues: v50 (copy)
            if v50.GameInfoShowVoiceAndChatFeatures == nil then
                return true;
            else
                return v50.GameInfoShowVoiceAndChatFeatures;
            end;
        end, 
        getInExperienceCanNavigateHome = function() --[[ Line: 192 ]] --[[ Name: getInExperienceCanNavigateHome ]]
            -- upvalues: v50 (copy)
            if v50.InExperienceCanNavigateHome == nil then
                return true;
            else
                return v50.InExperienceCanNavigateHome;
            end;
        end, 
        getInExperienceCanListPeopleInSameServer = function() --[[ Line: 198 ]] --[[ Name: getInExperienceCanListPeopleInSameServer ]]
            -- upvalues: v50 (copy)
            if v50.InExperienceCanListPeopleInSameServer == nil then
                return true;
            else
                return v50.InExperienceCanListPeopleInSameServer;
            end;
        end, 
        getInExperienceCanDisplayPeoplesUsernames = function() --[[ Line: 204 ]] --[[ Name: getInExperienceCanDisplayPeoplesUsernames ]]
            -- upvalues: v50 (copy)
            if v50.InExperienceCanDisplayPeoplesUsernames == nil then
                return true;
            else
                return v50.InExperienceCanDisplayPeoplesUsernames;
            end;
        end, 
        getInExperienceCanViewEducationalPopup = function() --[[ Line: 210 ]] --[[ Name: getInExperienceCanViewEducationalPopup ]]
            -- upvalues: v50 (copy)
            if v50.InExperienceCanViewEducationalPopup == nil then
                return true;
            else
                return v50.InExperienceCanViewEducationalPopup;
            end;
        end, 
        getInExperienceCanViewPlayerDropdownInLeaderboard = function() --[[ Line: 216 ]] --[[ Name: getInExperienceCanViewPlayerDropdownInLeaderboard ]]
            -- upvalues: v50 (copy)
            if v50.InExperienceCanViewPlayerDropdownInLeaderboard == nil then
                return true;
            else
                return v50.InExperienceCanViewPlayerDropdownInLeaderboard;
            end;
        end, 
        getSiteMessageBanner = function() --[[ Line: 222 ]] --[[ Name: getSiteMessageBanner ]]
            -- upvalues: v50 (copy)
            return v50.SiteMessageBanner or false;
        end, 
        getAlertRateLimit = function() --[[ Line: 225 ]] --[[ Name: getAlertRateLimit ]]
            -- upvalues: v50 (copy)
            return v50.AlertRateLimit or 300;
        end, 
        getSearchAutoComplete = function() --[[ Line: 229 ]] --[[ Name: getSearchAutoComplete ]]
            -- upvalues: v50 (copy)
            return v50.SearchAutoComplete or false;
        end, 
        getUseBottomBar = if l_GetFFlagAppNavRemoveUseBottomBar_0() then nil else function() --[[ Line: 234 ]]
            -- upvalues: v50 (copy)
            if v50.UseBottomBar == nil then
                return true;
            else
                return v50.UseBottomBar;
            end;
        end, 
        getSystemBarPlacement = function() --[[ Line: 240 ]] --[[ Name: getSystemBarPlacement ]]
            -- upvalues: l_IsVRAppBuild_0 (ref), l_Placements_0 (ref), v41 (ref), l_isSubjectToDesktopPolicies_0 (ref), v50 (copy)
            if l_IsVRAppBuild_0() then
                return l_Placements_0.VR;
            elseif not v41 and l_isSubjectToDesktopPolicies_0() then
                return l_Placements_0.Left;
            elseif l_Placements_0[v50.SystemBarPlacement] ~= nil then
                return v50.SystemBarPlacement;
            else
                return l_Placements_0.Bottom;
            end;
        end, 
        getShowStudioCTA = function() --[[ Line: 254 ]] --[[ Name: getShowStudioCTA ]]
            -- upvalues: v50 (copy)
            return v50.ShowStudioCTA or false;
        end, 
        getUseOmniRecommendation = function() --[[ Line: 257 ]] --[[ Name: getUseOmniRecommendation ]]
            -- upvalues: v50 (copy)
            if v50.UseOmniRecommendation == nil then
                return true;
            else
                return v50.UseOmniRecommendation;
            end;
        end, 
        getUseWidthBasedFormFactorRule = function() --[[ Line: 265 ]] --[[ Name: getUseWidthBasedFormFactorRule ]]
            -- upvalues: v50 (copy)
            return v50.UseWidthBasedFormFactorRule or false;
        end, 
        getShowYouTubeAgeAlert = function() --[[ Line: 268 ]] --[[ Name: getShowYouTubeAgeAlert ]]
            -- upvalues: v50 (copy)
            if v50.ShowYouTubeAgeAlert == nil then
                return true;
            else
                return v50.ShowYouTubeAgeAlert;
            end;
        end, 
        getShowVideoThumbnails = function() --[[ Line: 274 ]] --[[ Name: getShowVideoThumbnails ]]
            -- upvalues: v50 (copy)
            return v50.ShowVideoThumbnails or false;
        end, 
        getHomeIcon = function() --[[ Line: 277 ]] --[[ Name: getHomeIcon ]]
            -- upvalues: v50 (copy)
            return v50.HomeIcon or "LuaApp/icons/ic-roblox-close";
        end, 
        getGameInfoListShowRNVDeveloper = function() --[[ Line: 280 ]] --[[ Name: getGameInfoListShowRNVDeveloper ]]
            -- upvalues: v50 (copy)
            return v50.GameInfoListShowRNVDeveloper or false;
        end, 
        getGameInfoListDeveloper = function() --[[ Line: 283 ]] --[[ Name: getGameInfoListDeveloper ]]
            -- upvalues: v50 (copy)
            return v50.GameInfoListDeveloper or false;
        end, 
        getShowDisplayName = function() --[[ Line: 286 ]] --[[ Name: getShowDisplayName ]]
            -- upvalues: v50 (copy)
            if v50.ShowDisplayName == nil then
                return true;
            else
                return v50.ShowDisplayName;
            end;
        end, 
        getShowAlias = function() --[[ Line: 292 ]] --[[ Name: getShowAlias ]]
            -- upvalues: v50 (copy)
            if v50.ShowUserAlias == nil then
                return true;
            else
                return v50.ShowUserAlias;
            end;
        end, 
        getCatalogReportingDisabled = function() --[[ Line: 298 ]] --[[ Name: getCatalogReportingDisabled ]]
            -- upvalues: v50 (copy)
            return v50.CatalogReportingDisabled or false;
        end, 
        getGameReportingDisabled = function() --[[ Line: 301 ]] --[[ Name: getGameReportingDisabled ]]
            -- upvalues: v50 (copy)
            return v50.GameReportingDisabled or false;
        end, 
        getGamesPageCreationCenterTitle = function() --[[ Line: 304 ]] --[[ Name: getGamesPageCreationCenterTitle ]]
            -- upvalues: v50 (copy)
            return v50.GamesPageCreationCenterTitle or false;
        end, 
        shouldUseExternalBrowserForDisclaimerLinks = function() --[[ Line: 307 ]] --[[ Name: shouldUseExternalBrowserForDisclaimerLinks ]]
            -- upvalues: v50 (copy)
            return v50.UseExternalBrowserForDisclaimerLinks or false;
        end, 
        shouldUseExternalBrowserForMorePageItem = function() --[[ Line: 310 ]] --[[ Name: shouldUseExternalBrowserForMorePageItem ]]
            -- upvalues: v50 (copy)
            return v50.UseExternalBrowserForMoreLinks or false;
        end, 
        getFullscreenTitleBarEnabled = function() --[[ Line: 313 ]] --[[ Name: getFullscreenTitleBarEnabled ]]
            -- upvalues: v50 (copy)
            return v50.FullscreenTitleBarEnabled or false;
        end, 
        getShowExitFullscreenToast = function() --[[ Line: 316 ]] --[[ Name: getShowExitFullscreenToast ]]
            -- upvalues: v50 (copy)
            if v50.ExitFullscreenToastEnabled == nil then
                return false;
            else
                return v50.ExitFullscreenToastEnabled;
            end;
        end, 
        getCatalogShow3dView = function() --[[ Line: 319 ]] --[[ Name: getCatalogShow3dView ]]
            -- upvalues: v50 (copy)
            return v50.CatalogShow3dView or false;
        end, 
        getItemDetailsFullView = function() --[[ Line: 322 ]] --[[ Name: getItemDetailsFullView ]]
            -- upvalues: v50 (copy)
            return v50.ItemDetailsFullView or false;
        end, 
        getCatalogCommunityCreations = function() --[[ Line: 325 ]] --[[ Name: getCatalogCommunityCreations ]]
            -- upvalues: v50 (copy)
            return v50.CatalogCommunityCreations or false;
        end, 
        getCatalogPremiumCategory = function() --[[ Line: 328 ]] --[[ Name: getCatalogPremiumCategory ]]
            -- upvalues: v50 (copy)
            return v50.CatalogPremiumCategory or false;
        end, 
        getShowCatalogPremiumContent = function() --[[ Line: 331 ]] --[[ Name: getShowCatalogPremiumContent ]]
            -- upvalues: v50 (copy)
            return v50.CatalogPremiumContent or false;
        end, 
        getRobloxCreatedItemsCreatedByLuobu = function() --[[ Line: 334 ]] --[[ Name: getRobloxCreatedItemsCreatedByLuobu ]]
            -- upvalues: v50 (copy)
            if v50.RobloxCreatedItemsCreatedByLuobu == nil then
                return true;
            else
                return v50.RobloxCreatedItemsCreatedByLuobu;
            end;
        end, 
        getHomePageFriendSection = function() --[[ Line: 340 ]] --[[ Name: getHomePageFriendSection ]]
            -- upvalues: v50 (copy)
            return v50.HomePageFriendSection or false;
        end, 
        getHomePageProfileLink = function() --[[ Line: 343 ]] --[[ Name: getHomePageProfileLink ]]
            -- upvalues: v50 (copy)
            return v50.HomePageProfileLink or false;
        end, 
        getPurchasePromptIncludingWarning = function() --[[ Line: 346 ]] --[[ Name: getPurchasePromptIncludingWarning ]]
            -- upvalues: v50 (copy)
            if v50.PurchasePromptIncludingWarning == nil then
                return true;
            else
                return v50.PurchasePromptIncludingWarning;
            end;
        end, 
        getCheckUserAgreementsUpdatedOnLogin = function() --[[ Line: 352 ]] --[[ Name: getCheckUserAgreementsUpdatedOnLogin ]]
            -- upvalues: v50 (copy)
            if v50.CheckUserAgreementsUpdatedOnLogin == nil then
                return true;
            else
                return v50.CheckUserAgreementsUpdatedOnLogin;
            end;
        end, 
        getAddUserAgreementIdsToSignupRequest = function() --[[ Line: 358 ]] --[[ Name: getAddUserAgreementIdsToSignupRequest ]]
            -- upvalues: v50 (copy)
            return v50.AddUserAgreementIdsToSignupRequest or false;
        end, 
        RequireExplicitVoiceConsent = function() --[[ Line: 361 ]] --[[ Name: RequireExplicitVoiceConsent ]]
            -- upvalues: v50 (copy)
            return v50.RequireExplicitVoiceConsent or false;
        end, 
        getRequireExplicitAvatarVideoConsent = function() --[[ Line: 364 ]] --[[ Name: getRequireExplicitAvatarVideoConsent ]]
            -- upvalues: v50 (copy)
            return v50.RequireExplicitAvatarVideoConsent or false;
        end, 
        getShowVoiceUpsellV2 = function() --[[ Line: 367 ]] --[[ Name: getShowVoiceUpsellV2 ]]
            -- upvalues: v50 (copy)
            return v50.ShowVoiceUpsellV2 or false;
        end, 
        getShouldShowGroupsTile = function() --[[ Line: 370 ]] --[[ Name: getShouldShowGroupsTile ]]
            -- upvalues: v50 (copy)
            return v50.ShouldShowGroupsTile or false;
        end, 
        useLuobuAuthentication = function() --[[ Line: 373 ]] --[[ Name: useLuobuAuthentication ]]
            -- upvalues: v50 (copy)
            return v50.UseLuobuAuthentication or false;
        end, 
        useMSDKWebAuthentication = function() --[[ Line: 376 ]] --[[ Name: useMSDKWebAuthentication ]]
            -- upvalues: v50 (copy)
            return v50.UseMSDKWebAuthentication or false;
        end, 
        getQrFriendingEnabled = function() --[[ Line: 379 ]] --[[ Name: getQrFriendingEnabled ]]
            -- upvalues: v50 (copy)
            return v50.QrFriendingEnabled or false;
        end, 
        getShouldShowCameraPermissionInAgreementsPrompt = function() --[[ Line: 382 ]] --[[ Name: getShouldShowCameraPermissionInAgreementsPrompt ]]
            -- upvalues: v50 (copy)
            return v50.ShouldShowCameraPermissionInAgreementsPrompt or false;
        end, 
        getExperienceInviteShareLinkEnabled = function() --[[ Line: 385 ]] --[[ Name: getExperienceInviteShareLinkEnabled ]]
            -- upvalues: v50 (copy)
            return v50.ExperienceInviteShareLinkEnabled or false;
        end, 
        getCsatSurveyRestrictTextInput = function() --[[ Line: 388 ]] --[[ Name: getCsatSurveyRestrictTextInput ]]
            -- upvalues: v50 (copy)
            return v50.CsatSurveyRestrictTextInput or false;
        end, 
        useGridPageLayout = function() --[[ Line: 391 ]] --[[ Name: useGridPageLayout ]]
            -- upvalues: l_IsVRAppBuild_0 (ref), v50 (copy), l_isSubjectToDesktopPolicies_0 (ref)
            if l_IsVRAppBuild_0() then
                if v50.UseGridPageLayout ~= nil then
                    return v50.UseGridPageLayout;
                elseif l_IsVRAppBuild_0() then
                    return true;
                else
                    return false;
                end;
            elseif v50.UseGridPageLayout == nil then
                return l_isSubjectToDesktopPolicies_0();
            else
                return v50.UseGridPageLayout;
            end;
        end, 
        usePhoneSearchDiscoverEntry = function() --[[ Line: 402 ]] --[[ Name: usePhoneSearchDiscoverEntry ]]
            -- upvalues: v50 (copy), l_isSubjectToDesktopPolicies_0 (ref)
            if v50.UsePhoneSearchDiscoverEntry == nil then
                return not l_isSubjectToDesktopPolicies_0();
            else
                return v50.UsePhoneSearchDiscoverEntry;
            end;
        end, 
        getShouldSystemBarUsuallyBePresent = function() --[[ Line: 409 ]] --[[ Name: getShouldSystemBarUsuallyBePresent ]]
            -- upvalues: l_GetFFlagEnableTopBarVRPolicyOverride_0 (ref), l_IsVRAppBuild_0 (ref), v50 (copy)
            if l_GetFFlagEnableTopBarVRPolicyOverride_0() and l_IsVRAppBuild_0() then
                if v50.ShouldSystemBarUsuallyBePresentForVR ~= nil then
                    return v50.ShouldSystemBarUsuallyBePresentForVR;
                elseif l_IsVRAppBuild_0() then
                    return true;
                else
                    return false;
                end;
            else
                return v50.ShouldSystemBarUsuallyBePresent or false;
            end;
        end, 
        getContactImporterEnabled = function() --[[ Line: 418 ]] --[[ Name: getContactImporterEnabled ]]
            -- upvalues: l_isSubjectToDesktopPolicies_0 (ref), v50 (copy)
            if l_isSubjectToDesktopPolicies_0() then
                return false;
            else
                return v50.ContactImporterEnabled or false;
            end;
        end, 
        getUse3DPanels = function() --[[ Line: 426 ]] --[[ Name: getUse3DPanels ]]
            -- upvalues: l_GetFFlagAppNavUpdateUse3DPanels_0 (ref), v50 (copy), l_isSpatial_0 (ref), l_IsVRAppBuild_0 (ref)
            if l_GetFFlagAppNavUpdateUse3DPanels_0() then
                if v50.Use3DPanels ~= nil then
                    return v50.Use3DPanels;
                else
                    return l_isSpatial_0();
                end;
            elseif v50.Use3DPanels ~= nil then
                return v50.Use3DPanels;
            elseif l_IsVRAppBuild_0() then
                return true;
            else
                return false;
            end;
        end, 
        getUseVRFTUXPanel = function() --[[ Line: 437 ]] --[[ Name: getUseVRFTUXPanel ]]
            -- upvalues: v50 (copy), l_IsVRAppBuild_0 (ref)
            if v50.UseVRFTUXPanel ~= nil then
                return v50.UseVRFTUXPanel;
            elseif l_IsVRAppBuild_0() then
                return true;
            else
                return false;
            end;
        end, 
        getWebViewSupport = function() --[[ Line: 440 ]] --[[ Name: getWebViewSupport ]]
            -- upvalues: l_isRunningInStudio_0 (ref), v43 (ref), v50 (copy), l_IsVRAppBuild_0 (ref)
            if l_isRunningInStudio_0() then
                if v43 then
                    return false;
                else
                    return true;
                end;
            elseif v50.EnableWebViewSupport ~= nil then
                return v50.EnableWebViewSupport;
            elseif l_IsVRAppBuild_0() then
                return false;
            else
                return true;
            end;
        end, 
        getUseLuafiedReportFlow = function() --[[ Line: 451 ]] --[[ Name: getUseLuafiedReportFlow ]]
            -- upvalues: l_IsVRAppBuild_0 (ref), l_GetFFlagLuafiedReportEntryPoints_0 (ref), v50 (copy), l_GetFFlagEnableAbuseReport10ft_0 (ref)
            if l_IsVRAppBuild_0() and l_GetFFlagLuafiedReportEntryPoints_0() then
                if v50.UseLuafiedReportFlow ~= nil then
                    return v50.UseLuafiedReportFlow;
                elseif l_IsVRAppBuild_0() then
                    return true;
                else
                    return false;
                end;
            elseif l_GetFFlagEnableAbuseReport10ft_0() then
                return v50.UseLuafiedReportFlow or false;
            else
                return nil;
            end;
        end, 
        getThrottleFramerate = function() --[[ Line: 460 ]] --[[ Name: getThrottleFramerate ]]
            -- upvalues: v50 (copy), l_IsVRAppBuild_0 (ref)
            if v50.ThrottleFramerate ~= nil then
                return v50.ThrottleFramerate;
            elseif l_IsVRAppBuild_0() then
                return false;
            else
                return true;
            end;
        end, 
        getUseRoundedCorners = function() --[[ Line: 463 ]] --[[ Name: getUseRoundedCorners ]]
            -- upvalues: l_IsVRAppBuild_0 (ref), v50 (copy)
            if l_IsVRAppBuild_0() then
                if v50.UseRoundedCorners ~= nil then
                    return v50.UseRoundedCorners;
                elseif l_IsVRAppBuild_0() then
                    return true;
                else
                    return false;
                end;
            else
                return false;
            end;
        end, 
        getGameInfoShowChatFeatures = function() --[[ Line: 470 ]] --[[ Name: getGameInfoShowChatFeatures ]]
            -- upvalues: l_GetFFlagUseVoiceExitBetaLanguage_0 (ref), v50 (copy)
            if l_GetFFlagUseVoiceExitBetaLanguage_0() then
                return v50.GameInfoShowChatFeatures or false;
            else
                return false;
            end;
        end, 
        getDisplayCheckboxInVoiceConsent = function() --[[ Line: 476 ]] --[[ Name: getDisplayCheckboxInVoiceConsent ]]
            -- upvalues: l_GetFFlagSeamlessVoiceConsentToastPolicy_0 (ref), v50 (copy)
            if l_GetFFlagSeamlessVoiceConsentToastPolicy_0() then
                return v50.DisplayCheckboxInVoiceConsent or false;
            else
                return false;
            end;
        end, 
        getAllowCameraMovements = function() --[[ Line: 482 ]] --[[ Name: getAllowCameraMovements ]]
            -- upvalues: v50 (copy), l_IsVRAppBuild_0 (ref)
            if v50.AllowCameraMovements ~= nil then
                return v50.AllowCameraMovements;
            elseif l_IsVRAppBuild_0() then
                return false;
            else
                return true;
            end;
        end, 
        getShouldSkipAvatarLandingPage = function() --[[ Line: 485 ]] --[[ Name: getShouldSkipAvatarLandingPage ]]
            -- upvalues: v50 (copy), l_IsVRAppBuild_0 (ref)
            if v50.ShouldSkipAvatarLandingPage ~= nil then
                return v50.ShouldSkipAvatarLandingPage;
            elseif l_IsVRAppBuild_0() then
                return true;
            else
                return false;
            end;
        end, 
        getShowPassesOnExperienceDetails = function() --[[ Line: 488 ]] --[[ Name: getShowPassesOnExperienceDetails ]]
            -- upvalues: v50 (copy)
            return v50.ShowPassesOnExperienceDetails or false;
        end, 
        getDisableCDLQrCodeForMaquettes = function() --[[ Line: 491 ]] --[[ Name: getDisableCDLQrCodeForMaquettes ]]
            -- upvalues: l_GetFFlagDisableCDLQrCodeForMaquettes_0 (ref), v50 (copy)
            if l_GetFFlagDisableCDLQrCodeForMaquettes_0() then
                return v50.DisableCDLQrCodeForMaquettes;
            else
                return false;
            end;
        end, 
        getDisableIAPEntryPoint = function() --[[ Line: 498 ]] --[[ Name: getDisableIAPEntryPoint ]]
            -- upvalues: v50 (copy)
            return v50.DisableIAPEntryPoint or false;
        end, 
        getEnforceAgeRestrictedLogin = function() --[[ Line: 501 ]] --[[ Name: getEnforceAgeRestrictedLogin ]]
            -- upvalues: v50 (copy)
            return v50.EnforceAgeRestrictedLogin or false;
        end, 
        getUrlAuthRoutes = function() --[[ Line: 504 ]] --[[ Name: getUrlAuthRoutes ]]
            -- upvalues: v50 (copy)
            local v54 = v50.Routes or {};
            if v54 then
                return v54.auth or {};
            else
                return {};
            end;
        end, 
        getShowDisconnectButton = function() --[[ Line: 513 ]] --[[ Name: getShowDisconnectButton ]]
            -- upvalues: v50 (copy)
            return v50.ShowDisconnectButton or false;
        end, 
        getUseSingleSignOn = function() --[[ Line: 516 ]] --[[ Name: getUseSingleSignOn ]]
            -- upvalues: l_isRunningInStudio_0 (ref), v50 (copy)
            if l_isRunningInStudio_0() then
                return false;
            else
                return v50.UseSingleSignOn or false;
            end;
        end, 
        getGridCarouselSeeAllTilesEnabled = function() --[[ Line: 523 ]] --[[ Name: getGridCarouselSeeAllTilesEnabled ]]
            -- upvalues: v50 (copy)
            return v50.UseGridCarouselSeeAllTiles or false;
        end, 
        getSearchWithoutNavigatingEnabled = function() --[[ Line: 526 ]] --[[ Name: getSearchWithoutNavigatingEnabled ]]
            -- upvalues: v50 (copy)
            return v50.SingleSearchPageNoNavigation or false;
        end, 
        getGameListCategoryScrollListEnabled = function() --[[ Line: 529 ]] --[[ Name: getGameListCategoryScrollListEnabled ]]
            -- upvalues: v50 (copy)
            return v50.GetGamesListCategoryTabs or false;
        end, 
        getForceTheme = function() --[[ Line: 532 ]] --[[ Name: getForceTheme ]]
            -- upvalues: v5 (ref), v7 (ref), v50 (copy)
            local v56 = v5.List.map(v7, function(v55) --[[ Line: 533 ]]
                return v55:lower();
            end);
            if v50.ForceTheme and v5.List.find(v56, v50.ForceTheme:lower()) then
                return v50.ForceTheme;
            else
                return nil;
            end;
        end, 
        enableExperienceDetailsPanel = function() --[[ Line: 542 ]] --[[ Name: enableExperienceDetailsPanel ]]
            -- upvalues: v50 (copy)
            return v50.EnableExperienceDetailsPanel or false;
        end, 
        getDisableRegularLogin = function() --[[ Line: 545 ]] --[[ Name: getDisableRegularLogin ]]
            -- upvalues: v50 (copy)
            return not v50.EnableWebViewSupport and (not v50.EnableRegularLoginWithoutWebViewSupport or false);
        end, 
        getAllowPlatformAccountSwitching = function() --[[ Line: 548 ]] --[[ Name: getAllowPlatformAccountSwitching ]]
            -- upvalues: v50 (copy)
            return v50.AllowPlatformAccountSwitching or false;
        end, 
        useLegacyCrossPlayApi = function() --[[ Line: 551 ]] --[[ Name: useLegacyCrossPlayApi ]]
            -- upvalues: v44 (ref), v50 (copy)
            return v44 or v50.useLegacyCrossPlayApi or false;
        end, 
        useCrossPlaySystemUi = function() --[[ Line: 554 ]] --[[ Name: useCrossPlaySystemUi ]]
            -- upvalues: v47 (ref), v50 (copy)
            return v47 or v50.useCrossPlaySystemUi or false;
        end, 
        getCrossPlayUri = function() --[[ Line: 557 ]] --[[ Name: getCrossPlayUri ]]
            -- upvalues: v48 (ref), v50 (copy)
            if v48 ~= "" then
                return v48;
            else
                return v50.crossPlayUri or "";
            end;
        end, 
        getCrossPlayCapabilities = function() --[[ Line: 564 ]] --[[ Name: getCrossPlayCapabilities ]]
            -- upvalues: v5 (ref), v50 (copy), v8 (ref)
            return v5.List.foldLeft(v50.crossPlayCapabilities or {}, function(v57, v58) --[[ Line: 565 ]]
                -- upvalues: v5 (ref), v8 (ref)
                if v5.List.find(v57, v58) then
                    return v57;
                else
                    return v5.List.join(v57, {
                        v8[v58]
                    });
                end;
            end, {});
        end, 
        getCrossPlaySettingsKey = function() --[[ Line: 575 ]] --[[ Name: getCrossPlaySettingsKey ]]
            -- upvalues: v45 (ref), v50 (copy)
            if v45 ~= "" then
                return v45;
            else
                return v50.crossPlaySettingsKey or "";
            end;
        end, 
        getCrossPlayQueryParam = function() --[[ Line: 582 ]] --[[ Name: getCrossPlayQueryParam ]]
            -- upvalues: v46 (ref), v50 (copy)
            if v46 ~= "" then
                return v46;
            else
                return v50.crossPlayQueryParam or "";
            end;
        end, 
        getPromotionalEmailsCheckboxEnabled = function() --[[ Line: 589 ]] --[[ Name: getPromotionalEmailsCheckboxEnabled ]]
            -- upvalues: v50 (copy)
            if game:GetFastFlag("LuaAppPromotionalEmailsCheckboxEnabledInAppPolicy") then
                return v50.PromotionalEmailsCheckboxEnabled or false;
            else
                return false;
            end;
        end, 
        getPromotionalEmailsOptInByDefault = function() --[[ Line: 596 ]] --[[ Name: getPromotionalEmailsOptInByDefault ]]
            -- upvalues: v50 (copy)
            if game:GetFastFlag("LuaAppPromotionalEmailsCheckboxEnabledInAppPolicy") then
                return v50.PromotionalEmailsOptInByDefault or false;
            else
                return false;
            end;
        end, 
        getMorePageLayout = if l_GetFFlagMakeMorePageUniversal_0() then nil else function() --[[ Line: 605 ]]
            -- upvalues: v9 (ref), v50 (copy)
            return v9[v50.MorePageLayout] or v9.Grid;
        end, 
        getSupportsOverscan = function() --[[ Line: 608 ]] --[[ Name: getSupportsOverscan ]]
            -- upvalues: v50 (copy)
            return v50.SupportsOverscan or false;
        end, 
        getPlatformDisplayName = function() --[[ Line: 611 ]] --[[ Name: getPlatformDisplayName ]]
            -- upvalues: v50 (copy)
            return v50.platformDisplayName or "";
        end, 
        getPlatformAccountName = function() --[[ Line: 614 ]] --[[ Name: getPlatformAccountName ]]
            -- upvalues: v50 (copy)
            return v50.platformAccountName or nil;
        end, 
        getSupportsProfileSwitching = function() --[[ Line: 617 ]] --[[ Name: getSupportsProfileSwitching ]]
            -- upvalues: v50 (copy)
            return v50.supportsProfileSwitching or false;
        end, 
        getMountAllOmniFeedItems = function() --[[ Line: 620 ]] --[[ Name: getMountAllOmniFeedItems ]]
            -- upvalues: v50 (copy)
            return v50.mountAllOmniFeedItems or false;
        end, 
        getFriendCodeQrCodeScannerEnabled = function() --[[ Line: 623 ]] --[[ Name: getFriendCodeQrCodeScannerEnabled ]]
            -- upvalues: v50 (copy)
            return v50.FriendCodeQrCodeScannerEnabled or false;
        end, 
        getInviteFriendsDisabled = function() --[[ Line: 626 ]] --[[ Name: getInviteFriendsDisabled ]]
            -- upvalues: v50 (copy)
            return v50.InviteFriendsDisabled or false;
        end, 
        getRealNamesInDisplayNamesEnabled = function() --[[ Line: 629 ]] --[[ Name: getRealNamesInDisplayNamesEnabled ]]
            -- upvalues: l_FFlagRealNamesInDisplayNameExperimentEnabled_0 (ref), v50 (copy)
            if l_FFlagRealNamesInDisplayNameExperimentEnabled_0 then
                return v50.RealNamesInDisplayNamesEnabled or false;
            else
                return nil;
            end;
        end, 
        getProfileShareLinkEnabled = function() --[[ Line: 636 ]] --[[ Name: getProfileShareLinkEnabled ]]
            -- upvalues: v50 (copy)
            return v50.ProfileShareLinkEnabled;
        end, 
        getProfileCopyLinkEnabled = function() --[[ Line: 639 ]] --[[ Name: getProfileCopyLinkEnabled ]]
            -- upvalues: v50 (copy)
            return v50.ProfileCopyLinkEnabled;
        end, 
        getEnablePremiumUserFeatures = function() --[[ Line: 642 ]] --[[ Name: getEnablePremiumUserFeatures ]]
            -- upvalues: l_GetFFlagUseEnablePremiumUserFeaturesAppPolicy_0 (ref), v50 (copy)
            if l_GetFFlagUseEnablePremiumUserFeaturesAppPolicy_0() then
                return v50.EnablePremiumUserFeatures or false;
            else
                return nil;
            end;
        end, 
        getEnableDualLogin = function() --[[ Line: 648 ]] --[[ Name: getEnableDualLogin ]]
            -- upvalues: v50 (copy)
            return v50.enableDualLogin or false;
        end, 
        getUseExternalBrowserForAgeGuidelines = function() --[[ Line: 652 ]] --[[ Name: getUseExternalBrowserForAgeGuidelines ]]
            -- upvalues: l_GetFFlagUseExternalBrowserForAgeGuidelines10ft_0 (ref), v50 (copy)
            if l_GetFFlagUseExternalBrowserForAgeGuidelines10ft_0() then
                return v50.UseExternalBrowserForAgeGuidelines or false;
            else
                return nil;
            end;
        end, 
        getEnableHomePageAgeBlock = function() --[[ Line: 659 ]] --[[ Name: getEnableHomePageAgeBlock ]]
            -- upvalues: v50 (copy)
            return v50.EnableHomePageAgeBlock or false;
        end, 
        getEnableUAppAccessBlock = function() --[[ Line: 662 ]] --[[ Name: getEnableUAppAccessBlock ]]
            -- upvalues: v50 (copy)
            return v50.EnableUAppAccessBlock or false;
        end, 
        getUAppBlockPageTextMapKey = function() --[[ Line: 665 ]] --[[ Name: getUAppBlockPageTextMapKey ]]
            -- upvalues: v50 (copy)
            return v50.UAppBlockPageTextMapKey or nil;
        end, 
        getUAppBlockPageShouldDisableLogOut = function() --[[ Line: 668 ]] --[[ Name: getUAppBlockPageShouldDisableLogOut ]]
            -- upvalues: v50 (copy)
            return v50.UAppBlockPageShouldDisableLogOut or nil;
        end, 
        getContactsToastEnabled = function() --[[ Line: 671 ]] --[[ Name: getContactsToastEnabled ]]
            -- upvalues: l_GetFFlagContactsToastPolicyEnabled_0 (ref), v50 (copy)
            if l_GetFFlagContactsToastPolicyEnabled_0() then
                return v50.ContactsToastEnabled or false;
            else
                return nil;
            end;
        end, 
        getEnableProfileQrCode = function() --[[ Line: 678 ]] --[[ Name: getEnableProfileQrCode ]]
            -- upvalues: v50 (copy)
            return v50.EnableProfileQrCode or false;
        end, 
        getShowVNGLoginWithExistingAccountQuickLoginButton = function() --[[ Line: 681 ]] --[[ Name: getShowVNGLoginWithExistingAccountQuickLoginButton ]]
            -- upvalues: v50 (copy)
            return v50.ShowVNGLoginWithExistingAccountQuickLoginButton or false;
        end, 
        getShowVNGAge12Badge = function() --[[ Line: 684 ]] --[[ Name: getShowVNGAge12Badge ]]
            -- upvalues: v50 (copy)
            return v50.ShowVNGAge12Badge or false;
        end, 
        getUseVNGUserAgreementPopup = function() --[[ Line: 687 ]] --[[ Name: getUseVNGUserAgreementPopup ]]
            -- upvalues: v50 (copy)
            return v50.UseVNGUserAgreementPopup or false;
        end, 
        getRedirectBuyRobuxToVNG = function() --[[ Line: 690 ]] --[[ Name: getRedirectBuyRobuxToVNG ]]
            -- upvalues: v50 (copy)
            return v50.RedirectBuyRobuxToVNG or false;
        end, 
        getShowVNGTosForRobuxUpsell = function() --[[ Line: 693 ]] --[[ Name: getShowVNGTosForRobuxUpsell ]]
            -- upvalues: v50 (copy)
            return v50.ShowVNGTosForRobuxUpsell or false;
        end, 
        getBlockVNGU12SignUpOnClientSide = function() --[[ Line: 696 ]] --[[ Name: getBlockVNGU12SignUpOnClientSide ]]
            -- upvalues: v50 (copy)
            return v50.BlockVNGU12SignUpOnClientSide or false;
        end, 
        getDisablePremiumEntryPoint = if l_GetFFlagMakeMorePageUniversal_0() then nil else function() --[[ Line: 701 ]]
            -- upvalues: v50 (copy)
            return v50.DisablePremiumEntryPoint or false;
        end, 
        getVerifiedSignupCountry = function() --[[ Line: 704 ]] --[[ Name: getVerifiedSignupCountry ]]
            -- upvalues: v50 (copy)
            return v50.verifiedSignupCountry or false;
        end, 
        getParentalConsentAgreementId = function() --[[ Line: 708 ]] --[[ Name: getParentalConsentAgreementId ]]
            -- upvalues: v50 (copy)
            return v50.parentalConsentAgreementId or "";
        end, 
        getIsStrictComplianceEnabled = function() --[[ Line: 712 ]] --[[ Name: getIsStrictComplianceEnabled ]]
            -- upvalues: v50 (copy)
            return v50.isStrictComplianceEnabled or false;
        end, 
        getUseKoreaKISAUserAgreementPopup = function() --[[ Line: 716 ]] --[[ Name: getUseKoreaKISAUserAgreementPopup ]]
            -- upvalues: v50 (copy)
            return v50.useKoreaKISAUserAgreementPopup or false;
        end, 
        getEnableNotificationPreferencesPage = function() --[[ Line: 720 ]] --[[ Name: getEnableNotificationPreferencesPage ]]
            -- upvalues: l_GetFFlagEnableGateNotificationPreferencesTab_0 (ref), v50 (copy)
            if l_GetFFlagEnableGateNotificationPreferencesTab_0() then
                return v50.EnableNotificationPreferencesPage or false;
            else
                return nil;
            end;
        end, 
        getVNGFormRequired = function() --[[ Line: 727 ]] --[[ Name: getVNGFormRequired ]]
            -- upvalues: v50 (copy)
            return v50.VNGFormRequired or false;
        end, 
        getUpsellVoiceForPhoneVerification = function() --[[ Line: 730 ]] --[[ Name: getUpsellVoiceForPhoneVerification ]]
            -- upvalues: v50 (copy)
            return v50.UpsellVoiceForPhoneVerification or false;
        end, 
        getIsLinkedVRModeAvailable = function() --[[ Line: 733 ]] --[[ Name: getIsLinkedVRModeAvailable ]]
            -- upvalues: l_UserInputService_0 (ref)
            local l_l_UserInputService_0_Platform_0 = l_UserInputService_0:GetPlatform();
            local v60 = true;
            if l_l_UserInputService_0_Platform_0 ~= Enum.Platform.Windows then
                v60 = l_l_UserInputService_0_Platform_0 == Enum.Platform.UWP;
            end;
            return v60;
        end, 
        getShouldShowPhoneUpsell = function() --[[ Line: 737 ]] --[[ Name: getShouldShowPhoneUpsell ]]
            -- upvalues: v50 (copy)
            return v50.ShouldShowPhoneUpsell or false;
        end, 
        getTermsOfUseLink = function() --[[ Line: 740 ]] --[[ Name: getTermsOfUseLink ]]
            -- upvalues: v50 (copy)
            return v50.TermsOfUseLink or "";
        end, 
        getPrivacyPolicyLink = function() --[[ Line: 743 ]] --[[ Name: getPrivacyPolicyLink ]]
            -- upvalues: v50 (copy)
            return v50.PrivacyPolicyLink or "";
        end, 
        getVngAppUpsell = function() --[[ Line: 746 ]] --[[ Name: getVngAppUpsell ]]
            -- upvalues: l_FFlagLuaAppHomeVngAppUpsell_0 (ref), v50 (copy)
            if l_FFlagLuaAppHomeVngAppUpsell_0 then
                return v50.VngAppUpsell or false;
            else
                return false;
            end;
        end, 
        getShouldHideContactImporterUpsell = function() --[[ Line: 753 ]] --[[ Name: getShouldHideContactImporterUpsell ]]
            -- upvalues: v50 (copy)
            return v50.ShouldHideContactImporterUpsell or false;
        end, 
        getFriendRequestNicknamesEnabled = function() --[[ Line: 756 ]] --[[ Name: getFriendRequestNicknamesEnabled ]]
            -- upvalues: l_FFlagFriendRequestNicknames_0 (ref), v50 (copy)
            if l_FFlagFriendRequestNicknames_0 then
                return v50.FriendRequestNicknamesEnabled or false;
            else
                return false;
            end;
        end, 
        getShouldShowVpcPlayButtonUpsells = l_FFlagLuaAppParentUpsellPolicy_0 and function() --[[ Line: 764 ]]
            -- upvalues: v50 (copy)
            return v50.shouldShowVpcPlayButtonUpsells or false;
        end or nil, 
        getRenamePaymentsToSpendingTab = function() --[[ Line: 768 ]] --[[ Name: getRenamePaymentsToSpendingTab ]]
            -- upvalues: l_FFlagRenamePaymentsToSpendingTab_0 (ref), v50 (copy)
            if l_FFlagRenamePaymentsToSpendingTab_0 then
                return v50.renamePaymentsToSpendingTab or false;
            else
                return false;
            end;
        end, 
        getRenamePrivacyToPrivacyContentMaturityTab = function() --[[ Line: 775 ]] --[[ Name: getRenamePrivacyToPrivacyContentMaturityTab ]]
            -- upvalues: l_FFlagRenamePrivacyToPrivacyContentMaturityTab_0 (ref), v50 (copy)
            if l_FFlagRenamePrivacyToPrivacyContentMaturityTab_0 then
                return v50.renamePrivacyToPrivacyContentMaturityTab or false;
            else
                return false;
            end;
        end, 
        getNotificationsCanReceiveStream = function() --[[ Line: 784 ]] --[[ Name: getNotificationsCanReceiveStream ]]
            -- upvalues: l_GetFFlagNotificationsComplianceShouldRestrictStream_0 (ref), v50 (copy)
            if l_GetFFlagNotificationsComplianceShouldRestrictStream_0() then
                return v50.notificationsCanAccessStream or false;
            else
                return nil;
            end;
        end, 
        getNotificationsCanReceivePush = function() --[[ Line: 791 ]] --[[ Name: getNotificationsCanReceivePush ]]
            -- upvalues: v50 (copy)
            return v50.notificationsCanAccessPush or false;
        end, 
        getPushNotificationsUpsell = function() --[[ Line: 794 ]] --[[ Name: getPushNotificationsUpsell ]]
            -- upvalues: v50 (copy)
            return v50.ShouldShowPushNotificationsUpsell or false;
        end, 
        getDisableResellingCollectiblesForCompliance = function() --[[ Line: 797 ]] --[[ Name: getDisableResellingCollectiblesForCompliance ]]
            -- upvalues: l_GetFFlagDisableResellingCollectiblesForCompliance_0 (ref), v50 (copy)
            if l_GetFFlagDisableResellingCollectiblesForCompliance_0() then
                return v50.DisableResellingCollectiblesForCompliance or false;
            else
                return nil;
            end;
        end, 
        getShowIllegalContentReportingUI = function() --[[ Line: 804 ]] --[[ Name: getShowIllegalContentReportingUI ]]
            -- upvalues: v50 (copy)
            return v50.ShowIllegalContentReportingUI or false;
        end, 
        getEligibleForContentPostFeed = function() --[[ Line: 807 ]] --[[ Name: getEligibleForContentPostFeed ]]
            -- upvalues: v50 (copy)
            return v50.EligibleForContentPostFeed or false;
        end, 
        getEligibleForExternalContentSharing = function() --[[ Line: 810 ]] --[[ Name: getEligibleForExternalContentSharing ]]
            -- upvalues: v50 (copy)
            return v50.EligibleForExternalContentSharing or false;
        end, 
        getEnableContinuousLoad = function() --[[ Line: 813 ]] --[[ Name: getEnableContinuousLoad ]]
            -- upvalues: l_GetFFlagAXToggleContinuousLoad_0 (ref), v50 (copy)
            if l_GetFFlagAXToggleContinuousLoad_0() then
                return v50.EnableContinuousLoad or false;
            else
                return nil;
            end;
        end, 
        getEnableAggregateLikesFavoritesCount = function() --[[ Line: 820 ]] --[[ Name: getEnableAggregateLikesFavoritesCount ]]
            -- upvalues: l_GetFFlagAXToggleAggregateLikesFavoritesCount_0 (ref), l_FFlagHideAggregateLikeCountsOnEdp_0 (ref), v50 (copy)
            if l_GetFFlagAXToggleAggregateLikesFavoritesCount_0() or l_FFlagHideAggregateLikeCountsOnEdp_0 then
                return v50.EnableAggregateLikesFavoritesCount or false;
            else
                return nil;
            end;
        end, 
        getShowUpdatedCameraPath = function() --[[ Line: 827 ]] --[[ Name: getShowUpdatedCameraPath ]]
            -- upvalues: l_GetFFlagSelfieViewUseNewErrorBody_0 (ref), v50 (copy)
            if l_GetFFlagSelfieViewUseNewErrorBody_0() then
                return v50.showUpdatedCameraPath or false;
            else
                return nil;
            end;
        end, 
        getRenameParentEmailForVerificationUpsell = function() --[[ Line: 834 ]] --[[ Name: getRenameParentEmailForVerificationUpsell ]]
            -- upvalues: l_FFlagRenameParentEmailForVerificationUpsell_0 (ref), v50 (copy)
            if l_FFlagRenameParentEmailForVerificationUpsell_0() then
                return v50.renameParentEmailForVerificationUpsell or false;
            else
                return false;
            end;
        end, 
        getKeystrokeCollectionEnabled = function() --[[ Line: 841 ]] --[[ Name: getKeystrokeCollectionEnabled ]]
            -- upvalues: v50 (copy)
            if game:GetFastFlag("BehaviorCollectionControlEnabled") then
                return v50.EnableKeystrokeCollection or false;
            else
                return false;
            end;
        end, 
        getCanUsePlatformChat = function() --[[ Line: 849 ]] --[[ Name: getCanUsePlatformChat ]]
            -- upvalues: v50 (copy)
            return v50.CanUsePlatformChat or false;
        end, 
        getCanSeeChatTab = function() --[[ Line: 853 ]] --[[ Name: getCanSeeChatTab ]]
            -- upvalues: v50 (copy)
            return v50.CanSeeChatTab or false;
        end, 
        getShowDisclaimerLinkForUnderageSignupsOnAllSignupPages = function() --[[ Line: 857 ]] --[[ Name: getShowDisclaimerLinkForUnderageSignupsOnAllSignupPages ]]
            -- upvalues: l_GetFFlagEnableMultiPageSignup_0 (ref), v50 (copy)
            if not l_GetFFlagEnableMultiPageSignup_0() then
                return true;
            elseif v50.ShowTermsAndPrivacyPolicyLinksForAllPagesU13Signup == nil then
                return true;
            else
                return v50.ShowTermsAndPrivacyPolicyLinksForAllPagesU13Signup;
            end;
        end, 
        getAgeCutoffForShowDisclaimerLinkForUnderageSignupsOnAllSignupPages = function() --[[ Line: 866 ]] --[[ Name: getAgeCutoffForShowDisclaimerLinkForUnderageSignupsOnAllSignupPages ]]
            -- upvalues: l_GetFIntExclusiveFallbackExclusiveUnderageCutoffForMultiPageSignup_0 (ref), l_GetFFlagEnableMultiPageSignup_0 (ref), v50 (copy)
            local v61 = l_GetFIntExclusiveFallbackExclusiveUnderageCutoffForMultiPageSignup_0();
            if not l_GetFFlagEnableMultiPageSignup_0() then
                return v61;
            elseif v50.AgeCutoffForShowDisclaimerLinkForUnderageSignupsOnAllSignupPages == nil then
                return v61;
            else
                return v50.AgeCutoffForShowDisclaimerLinkForUnderageSignupsOnAllSignupPages;
            end;
        end
    };
end;