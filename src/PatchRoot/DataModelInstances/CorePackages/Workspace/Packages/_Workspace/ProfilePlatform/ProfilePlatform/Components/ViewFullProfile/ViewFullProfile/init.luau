local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.RoactUtils);
local v4 = require(l_Parent_0.SharedFlags);
local l_dependencyArray_0 = v3.Hooks.dependencyArray;
local l_useDispatch_0 = v3.Hooks.RoactRodux.useDispatch;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_NavigateDownToViewUserProfile_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateDownToViewUserProfile;
local v9 = require(l_script_FirstAncestor_0.Common.Constants);
local v10 = require(l_Parent_0.UIBlox);
local l_HorizontalPageMargin_0 = v10.App.Container.HorizontalPageMargin;
local l_Button_0 = v10.App.Button.Button;
local l_ButtonType_0 = v10.App.Button.Enum.ButtonType;
local v14 = require(l_script_FirstAncestor_0.Common.Enums);
local v15 = require(l_script_FirstAncestor_0.Contexts.useProfileWrapperContext);
local v16 = require(l_script_FirstAncestor_0.Contexts.useProfileAnalyticsContext);
local v17 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local v18 = require(l_script_FirstAncestor_0.Common.TextKeys);
local l_FFlagProfilePlatformRemainingLogging_0 = v4.FFlagProfilePlatformRemainingLogging;
local v20 = require(l_script_FirstAncestor_0.Flags.FFlagProfilePlatformQuickLinkMobileUITweak);
local v21 = require(l_script_FirstAncestor_0.Utils.getDeepValue);
local l_useSelector_0 = v3.Hooks.RoactRodux.useSelector;
ViewFullProfile = function(v23) --[[ Line: 34 ]] --[[ Name: ViewFullProfile ]]
    -- upvalues: v15 (copy), v16 (copy), l_useDispatch_0 (copy), l_useLocalization_0 (copy), v18 (copy), v2 (copy), v17 (copy), v14 (copy), l_FFlagProfilePlatformRemainingLogging_0 (copy), l_NavigateDownToViewUserProfile_0 (copy), l_dependencyArray_0 (copy), l_useSelector_0 (copy), v21 (copy), v9 (copy), l_HorizontalPageMargin_0 (copy), v20 (copy), l_Button_0 (copy), l_ButtonType_0 (copy)
    local v24 = v15();
    local l_profileUserId_0 = v24.profileUserId;
    local v26 = v16();
    local v27 = l_useDispatch_0();
    local v28 = l_useLocalization_0({
        viewFullProfileLabel = v18.ViewFullProfile
    });
    local v29 = v2.useCallback(function() --[[ Line: 44 ]]
        -- upvalues: v26 (copy), v17 (ref), v24 (copy), v14 (ref), l_FFlagProfilePlatformRemainingLogging_0 (ref), v27 (copy), l_NavigateDownToViewUserProfile_0 (ref), l_profileUserId_0 (copy)
        v26.fireAnalyticsEvent(v17.ViewPlayerProfileButton, {
            absolutePosition = v24.sourceInfo.homepageCarouselAbsolutePosition, 
            isHomePageCarousel = v24.sourceInfo.source == v14.Sources.HomepageFriendsCarousel, 
            source = v24.sourceInfo.source, 
            isRecommendation = if l_FFlagProfilePlatformRemainingLogging_0 then v24.sourceInfo.isRecommendation else nil, 
            recommendationContextType = if l_FFlagProfilePlatformRemainingLogging_0 then v24.sourceInfo.recommendationContextType else nil, 
            recommendationRank = if l_FFlagProfilePlatformRemainingLogging_0 then v24.sourceInfo.recommendationRank else nil, 
            recommendationSessionId = if l_FFlagProfilePlatformRemainingLogging_0 then v24.sourceInfo.recommendationSessionId else nil
        });
        v27(l_NavigateDownToViewUserProfile_0(l_profileUserId_0));
    end, l_dependencyArray_0(v27, l_profileUserId_0, v26, v24));
    local v31 = l_useSelector_0(function(v30) --[[ Line: 65 ]]
        -- upvalues: v21 (ref), v9 (ref), l_profileUserId_0 (copy), v14 (ref)
        return v21(v30, (("%*.Users.%*.components.%*"):format(v9.RODUX_KEY, l_profileUserId_0, v14.Components.QuickLinks))) or nil;
    end) ~= nil;
    return v2.createElement(l_HorizontalPageMargin_0, {
        size = UDim2.fromScale(1, 0), 
        backgroundTransparency = 1, 
        layoutOrder = v23.layoutOrder, 
        useAutomaticSizing = true
    }, {
        ViewFullProfileFrame = v2.createElement("Frame", {
            Size = UDim2.fromScale(1, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            LayoutOrder = v23.layoutOrder
        }, {
            UIPadding = v2.createElement("UIPadding", {
                PaddingTop = UDim.new(0, v20 and v31 and 0 or v9.ADDITIONAL_PADDING)
            }), 
            ViewFullProfile = v2.createElement(l_Button_0, {
                buttonType = l_ButtonType_0.Secondary, 
                size = UDim2.new(1, 0, 0, v9.CTA_BUTTON_HEIGHT), 
                onActivated = v29, 
                text = v28.viewFullProfileLabel
            })
        })
    });
end;
return ViewFullProfile;