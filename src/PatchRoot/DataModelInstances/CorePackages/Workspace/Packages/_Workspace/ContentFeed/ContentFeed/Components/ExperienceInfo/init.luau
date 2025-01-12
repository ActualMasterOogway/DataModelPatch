local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_ExperienceService_0 = require(l_Parent_1.ExperienceService).ExperienceService;
local v3 = require(l_Parent_1.React);
local v4 = require(l_Parent_1.RoactUtils);
local v5 = require(l_Parent_1.CapturesCommon);
local v6 = require(l_Parent_1.Foundation);
local v7 = require(l_Parent_1.Localization);
local v8 = require(l_Parent_1.LuaSocialLibrariesDeps);
local v9 = require(l_Parent_1.RobloxAppEnums);
local v10 = require(l_Parent_1.UIBlox);
local l_AppPage_0 = v9.AppPage;
local v12 = require(l_Parent_0.Constants);
local v13 = require(l_Parent_0.Analytics.EventNames);
local v14 = require(l_Parent_0.App.FeedContext);
local l_getDeepValue_0 = v8.SocialLibraries.config({}).Dictionary.getDeepValue;
local v16 = require(l_Parent_0.Utils.getExperienceThumbnailImage);
local l_LoadableImage_0 = v10.App.Loading.LoadableImage;
local v18 = require(l_Parent_0.App.Networking);
local l_PlayButtonStates_0 = require(l_Parent_1.GamePlayButton).PlayButtonStates;
local l_Icon_0 = v6.Icon;
local l_Skeleton_0 = v6.Skeleton;
local l_Text_0 = v6.Text;
local l_View_0 = v6.View;
local v24 = require(l_Parent_0.Hooks.useAnalytics);
local l_useLocalization_0 = v7.Hooks.useLocalization;
local l_usePlayButtonState_0 = require(l_Parent_1.GamePlayButton).usePlayButtonState;
local l_useNavigation_0 = require(l_Parent_1.Navigation).useNavigation;
local v28 = require(l_Parent_0.Hooks.useSafeZoneOffsets);
local l_useSelector_0 = v4.Hooks.RoactRodux.useSelector;
local l_useTokens_0 = v6.Hooks.useTokens;
local l_FFlagContentFeedPinchToZoomEnabled_0 = v5.Flags.FFlagContentFeedPinchToZoomEnabled;
return function(v32) --[[ Line: 56 ]]
    -- upvalues: l_useTokens_0 (copy), l_FFlagContentFeedPinchToZoomEnabled_0 (copy), v3 (copy), v14 (copy), l_useNavigation_0 (copy), v28 (copy), l_useSelector_0 (copy), l_getDeepValue_0 (copy), v24 (copy), l_usePlayButtonState_0 (copy), v18 (copy), l_PlayButtonStates_0 (copy), v13 (copy), l_AppPage_0 (copy), l_ExperienceService_0 (copy), v12 (copy), l_useLocalization_0 (copy), l_View_0 (copy), l_LoadableImage_0 (copy), v16 (copy), l_Text_0 (copy), l_Skeleton_0 (copy), l_Icon_0 (copy)
    local v33 = l_useTokens_0();
    local v34 = nil;
    if l_FFlagContentFeedPinchToZoomEnabled_0 then
        v34 = v3.useContext(v14);
    end;
    local v35 = l_useNavigation_0();
    local v36 = v28();
    local v38 = l_useSelector_0(function(v37) --[[ Line: 67 ]]
        -- upvalues: l_getDeepValue_0 (ref), v32 (copy)
        return l_getDeepValue_0(v37, "Games.byGameId." .. v32.universeId .. ".name");
    end);
    local v40 = l_useSelector_0(function(v39) --[[ Line: 71 ]]
        -- upvalues: l_getDeepValue_0 (ref), v32 (copy)
        return l_getDeepValue_0(v39, "Games.byGameId." .. v32.universeId .. ".rootPlaceId");
    end);
    local v44 = l_useSelector_0(function(v41) --[[ Line: 75 ]]
        -- upvalues: l_getDeepValue_0 (ref), v32 (copy)
        local v42 = l_getDeepValue_0(v41, "GameVotes." .. v32.universeId .. ".upVotes");
        local v43 = l_getDeepValue_0(v41, "GameVotes." .. v32.universeId .. ".downVotes");
        if not v42 or not v43 then
            return nil;
        else
            return (math.round(100 * v42 / (v42 + v43)));
        end;
    end);
    local v45 = v24();
    local v46 = l_usePlayButtonState_0(v18.ContentFeedNetworkImpl, (tostring(v32.universeId)));
    local v47 = "icons/common/play";
    if v46.playButtonState == l_PlayButtonStates_0.PaidAccess then
        v47 = "icons/common/robux";
    elseif v46.playButtonState ~= l_PlayButtonStates_0.Playable then
        v47 = "icons/actions/block";
    end;
    local v48 = v3.useCallback(function() --[[ Line: 97 ]]
        -- upvalues: l_FFlagContentFeedPinchToZoomEnabled_0 (ref), v34 (ref), v45 (copy), v13 (ref), v32 (copy), v46 (copy), l_PlayButtonStates_0 (ref), v35 (copy), l_AppPage_0 (ref), l_ExperienceService_0 (ref), v40 (copy), v12 (ref)
        if l_FFlagContentFeedPinchToZoomEnabled_0 and v34.isZooming then
            return;
        else
            v45.fireEvent(v13.ContentFeedPlayButtonPressed, {
                postId = v32.postId
            });
            if v46.playButtonState == l_PlayButtonStates_0.PaidAccess then
                v35.goBack();
                v35.navigate(l_AppPage_0.GameDetail, {
                    detail = tostring(v32.universeId), 
                    extraProps = {
                        mountAsFullView = true
                    }
                });
            end;
            if v46.playButtonState == l_PlayButtonStates_0.Playable then
                l_ExperienceService_0:LaunchExperience({
                    placeId = if v40 then v40 else v32.placeId
                }, v12.LaunchExperienceSource);
            end;
            return;
        end;
    end, {
        if l_FFlagContentFeedPinchToZoomEnabled_0 then v34.isZooming else nil, 
        v35, 
        v46.playButtonState, 
        v32.placeId, 
        v32.postId, 
        v32.universeId, 
        v40
    });
    local v49 = l_useLocalization_0({
        notRated = "Feature.ContentFeed.Label.NotRated", 
        ratingPercentage = {
            "Feature.ContentFeed.Label.Rating"; 
            rating = tostring(v44)
        }
    });
    local v50 = v44 ~= v44;
    local l_createElement_0 = v3.createElement;
    local l_l_View_0_0 = l_View_0;
    local v53 = {
        LayoutOrder = v32.layoutOrder, 
        tag = "bg-surface-100 auto-y size-full-0 row align-x-left align-y-center gap-small"
    };
    local v54 = {
        UIPadding = v3.createElement("UIPadding", {
            PaddingBottom = UDim.new(0, 20 + v36.bottom), 
            PaddingLeft = UDim.new(0, 20), 
            PaddingRight = UDim.new(0, 20), 
            PaddingTop = UDim.new(0, 20)
        }), 
        ExperienceThumbnail = v3.createElement(l_LoadableImage_0, {
            BackgroundTransparency = 1, 
            cornerRadius = UDim.new(0, v33.Radius.Medium), 
            Image = v16(v32.universeId, 150), 
            LayoutOrder = 1, 
            ScaleType = Enum.ScaleType.Fit, 
            Size = UDim2.fromOffset(40, 40), 
            useShimmerAnimationWhileLoading = true
        }), 
        ExperienceMetadata = v3.createElement(l_View_0, {
            LayoutOrder = 2, 
            tag = "auto-y bg-action-subtle grow col align-x-left align-y-center gap-xsmall"
        }, {
            ExperienceName = if v38 then v3.createElement(l_Text_0, {
                LayoutOrder = 1, 
                tag = "text-title-large content-action-emphasis text-truncate-end text-align-x-left text-align-y-top size-full-0 auto-y", 
                Text = v38
            }) else nil, 
            ExperienceNameShimmerPanel = if not v38 then v3.createElement(l_Skeleton_0, {
                LayoutOrder = 1, 
                Size = UDim2.fromOffset(160, 15)
            }) else nil, 
            ExperienceRating = if v44 then v3.createElement(l_Text_0, {
                LayoutOrder = 2, 
                tag = "text-body-medium content-default text-truncate-end text-align-x-left text-align-y-top size-full-0 auto-xy text-wrap", 
                Text = if v50 then v49.notRated else v49.ratingPercentage
            }) else nil, 
            ExperienceRatingShimmerPanel = if not v44 then v3.createElement(l_Skeleton_0, {
                LayoutOrder = 2, 
                Size = UDim2.fromOffset(160, 15)
            }) else nil
        })
    };
    local l_createElement_1 = v3.createElement;
    local l_l_View_0_1 = l_View_0;
    local v57 = {};
    local v58 = false;
    if v46.playButtonState ~= l_PlayButtonStates_0.Loading then
        v58 = false;
        if v46.playButtonState ~= l_PlayButtonStates_0.PaidAccess then
            v58 = v46.playButtonState ~= l_PlayButtonStates_0.Playable;
        end;
    end;
    v57.isDisabled = v58;
    v57.LayoutOrder = 3;
    v57.onActivated = v48;
    v57.tag = "bg-action-emphasis size-2000-1000 radius-medium";
    v54.JoinCTA = l_createElement_1(l_l_View_0_1, v57, {
        PlayIcon = v3.createElement(l_Icon_0, {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            name = v47, 
            Position = UDim2.fromScale(0.5, 0.5), 
            style = v33.Color.ActionEmphasis.Foreground
        })
    });
    return l_createElement_0(l_l_View_0_0, v53, v54);
end;