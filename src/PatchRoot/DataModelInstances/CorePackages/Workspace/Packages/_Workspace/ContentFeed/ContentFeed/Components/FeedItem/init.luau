local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.CapturesCommon);
local v3 = require(l_Parent_1.Foundation);
local v4 = require(l_Parent_1.GameVotesRodux);
local v5 = require(l_Parent_1.React);
local v6 = require(l_Parent_1.RoactUtils);
local v7 = require(l_Parent_1.UIBlox);
local l_FetchGameVotes_0 = v4.GameVotes.FetchGameVotes;
local l_LoadableImage_0 = v7.App.Loading.LoadableImage;
local l_LoadingStrategy_0 = v7.App.Loading.Enum.LoadingStrategy;
local l_BlurDirection_0 = v2.Enums.BlurDirection;
local v12 = require(l_Parent_0.Analytics.EventNames);
local v13 = require(l_Parent_0.Components.ExperienceInfo);
local v14 = require(l_Parent_0.App.FeedContext);
local v15 = require(l_Parent_0.Components.FeedItemPostsNotFound);
local v16 = require(l_Parent_0.Components.FeedOverlay);
local l_ImageBlurEffect_0 = v2.Components.ImageBlurEffect;
local v18 = require(l_Parent_0.App.Networking);
local _ = require(l_Parent_0.Types);
local l_View_0 = v3.View;
local v21 = require(l_Parent_0.Hooks.useAnalytics);
local l_useCallback_0 = v5.useCallback;
local l_useDispatch_0 = v6.Hooks.RoactRodux.useDispatch;
local l_useEffect_0 = v5.useEffect;
local v25 = require(l_Parent_0.Hooks.useFeedZoomController);
local l_useRef_0 = v5.useRef;
local l_useSelector_0 = v6.Hooks.RoactRodux.useSelector;
local l_useState_0 = v5.useState;
local l_FFlagContentFeedPinchToZoomEnabled_0 = v2.Flags.FFlagContentFeedPinchToZoomEnabled;
return function(v30) --[[ Line: 54 ]]
    -- upvalues: v5 (copy), v14 (copy), v21 (copy), l_useDispatch_0 (copy), l_useRef_0 (copy), l_useState_0 (copy), l_useSelector_0 (copy), l_useEffect_0 (copy), v18 (copy), l_FetchGameVotes_0 (copy), l_FFlagContentFeedPinchToZoomEnabled_0 (copy), l_useCallback_0 (copy), v25 (copy), l_LoadableImage_0 (copy), l_LoadingStrategy_0 (copy), v12 (copy), v15 (copy), l_ImageBlurEffect_0 (copy), l_BlurDirection_0 (copy), l_View_0 (copy), v16 (copy), v13 (copy)
    local l_isZooming_0 = v5.useContext(v14).isZooming;
    local v32 = v21();
    local v33 = l_useDispatch_0();
    local v34 = l_useRef_0(os.clock());
    local v35 = l_useRef_0(false);
    local v36 = l_useRef_0(false);
    local v37, v38 = l_useState_0(0);
    local v40 = l_useSelector_0(function(v39) --[[ Line: 67 ]]
        return v39.ContentFeed.Inspect.IsOpen;
    end);
    l_useEffect_0(function() --[[ Line: 71 ]]
        -- upvalues: v33 (copy), v18 (ref), v30 (copy)
        v33(v18.NetworkingUsers.GetUserV2FromUserId.API((tostring(v30.creatorUserId)))):catch(function() --[[ Line: 72 ]]

        end);
    end, {
        v33, 
        v30.creatorUserId
    });
    l_useEffect_0(function() --[[ Line: 77 ]]
        -- upvalues: v33 (copy), l_FetchGameVotes_0 (ref), v18 (ref), v30 (copy)
        v33(l_FetchGameVotes_0.Fetch(v18.ContentFeedNetworkImpl, (tostring(v30.universeId)))):catch(function() --[[ Line: 78 ]]

        end);
    end, {
        v33, 
        v30.universeId
    });
    local v41 = nil;
    local v42 = nil;
    local v43 = nil;
    local v44 = nil;
    local v45 = nil;
    local v46 = nil;
    local v47 = nil;
    local v48 = nil;
    local v49 = nil;
    local v50 = nil;
    local v51 = nil;
    local v52 = nil;
    if l_FFlagContentFeedPinchToZoomEnabled_0 then
        v48 = v30.postId == v30.currentPostId;
        local v57, v58, v59, v60 = l_useCallback_0(function() --[[ Line: 89 ]]
            -- upvalues: v30 (copy), v37 (copy)
            local v53 = Vector2.new(v30.screenshotMetadata.width, v30.screenshotMetadata.height);
            local v54 = v53.X / v53.Y;
            local v55 = v30.screenSizeYWithInsets * 0.33;
            local v56 = v37 / v54;
            if v56 < v55 then
                v56 = v55;
            elseif v30.screenSizeYWithInsets < v56 then
                v56 = v30.screenSizeYWithInsets;
            end;
            return v56, v53, v56 < v30.screenSizeYWithInsets / 2, (v30.screenSizeYWithInsets - v56) / 2;
        end, {
            v30.screenshotMetadata.width, 
            v30.screenshotMetadata.height, 
            v30.screenSizeYWithInsets, 
            v37
        })();
        v49 = v57;
        v50 = v58;
        v51 = v59;
        v52 = v60;
        v57 = v25(v48, v30.screenSizeYWithInsets, v49, v37, v40);
        v47 = v57.imageContainerRef;
        v41 = v57.imageFinalScale;
        v45 = v57.initialZoomFocusPosition;
        v43 = v57.nonImageTransparency;
        v46 = v57.zoomAverageDelta;
        v44 = v57.zoomEndTransition;
        v42 = v57.zoomEndTransitionActive;
    else
        v50 = Vector2.new(v30.screenshotMetadata.width, v30.screenshotMetadata.height);
        local v61 = v50.X / v50.Y;
        local v62 = v30.screenSizeYWithInsets * 0.33;
        v49 = v37 / v61;
        if v49 < v62 then
            v49 = v62;
        elseif v30.screenSizeYWithInsets < v49 then
            v49 = v30.screenSizeYWithInsets;
        end;
        v51 = v49 < v30.screenSizeYWithInsets / 2;
        v52 = (v30.screenSizeYWithInsets - v49) / 2;
    end;
    local v63 = v5.createElement(l_LoadableImage_0, {
        AnchorPoint = Vector2.new(0.5, 0.5), 
        BackgroundTransparency = 1, 
        Image = v30.screenshotMetadata.fullSizeUrl, 
        loadingStrategy = l_LoadingStrategy_0.Eager, 
        onLoaded = function() --[[ Line: 144 ]] --[[ Name: onLoaded ]]
            -- upvalues: v35 (copy), v32 (copy), v12 (ref), v34 (copy)
            if not v35.current then
                v32.fireEvent(v12.ContentFeedImageLatency, {
                    statValue = os.clock() - v34.current
                });
                v35.current = true;
            end;
        end, 
        renderOnFailed = function() --[[ Line: 152 ]] --[[ Name: renderOnFailed ]]
            -- upvalues: v36 (copy), v32 (copy), v12 (ref), v30 (copy), v5 (ref), v15 (ref)
            if not v36.current then
                v32.fireEvent(v12.ContentFeedImageLoadFailed, {
                    postId = v30.postId
                });
                v36.current = true;
            end;
            return v5.createElement(v15, {
                layoutOrder = 1, 
                screenSizeYWithInsets = v30.screenSizeYWithInsets
            });
        end, 
        Position = UDim2.fromScale(0.5, 0.5), 
        ScaleType = Enum.ScaleType.Crop, 
        Size = if l_FFlagContentFeedPinchToZoomEnabled_0 then UDim2.fromScale(1, 1) else UDim2.new(1, 0, 0, v49), 
        useShimmerAnimationWhileLoading = true, 
        ZIndex = 1
    });
    return v5.createElement("Frame", {
        BackgroundTransparency = 1, 
        LayoutOrder = v30.layoutOrder, 
        Size = UDim2.new(1, 0, 0, v30.screenSizeYWithInsets), 
        [v5.Change.AbsoluteSize] = function(v64) --[[ Line: 175 ]]
            -- upvalues: v38 (copy)
            v38(v64.AbsoluteSize.X);
        end, 
        ZIndex = if not l_FFlagContentFeedPinchToZoomEnabled_0 then nil else v48 and 2 or 1
    }, {
        TopBlur = if v51 then v5.createElement(l_ImageBlurEffect_0, {
            AnchorPoint = Vector2.new(0.5, 1), 
            direction = l_BlurDirection_0.Up, 
            image = v30.screenshotMetadata.fullSizeUrl, 
            imageSize = v50, 
            Position = UDim2.new(0.5, 0, 0.5, -v49 / 2), 
            Size = UDim2.new(1, 0, 0, v52), 
            transparencyBinding = if l_FFlagContentFeedPinchToZoomEnabled_0 and v48 then v43 else nil, 
            ZIndex = l_FFlagContentFeedPinchToZoomEnabled_0 and l_isZooming_0 and v48 and -3 or 0
        }) else nil, 
        ContentFeedImageContainer = if l_FFlagContentFeedPinchToZoomEnabled_0 then v5.createElement(l_View_0, {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = if v42 and v45.current then v44:map(function(v65) --[[ Line: 199 ]]
                -- upvalues: v41 (ref), v45 (ref), v46 (ref), v37 (copy), v30 (copy)
                local v66 = v41.current / (1 + (v41.current - 1) * v65);
                return UDim2.new(0.5, (0.5 - (v45.current.X - v46.current.X) / v37) * v37 * (v66 - 1), 0.5, (0.5 - (v45.current.Y - v46.current.Y) / v30.screenSizeYWithInsets) * v30.screenSizeYWithInsets * (v66 - 1));
            end) else UDim2.fromScale(0.5, 0.5), 
            ref = v47, 
            Size = if v42 then v44:map(function(v67) --[[ Line: 221 ]]
                -- upvalues: v41 (ref), v49 (ref)
                local v68 = v41.current / (1 + (v41.current - 1) * v67);
                return UDim2.new(v68, 0, 0, v49 * v68);
            end) else UDim2.new(1, 0, 0, v49), 
            ZIndex = 1
        }, {
            ContentFeedImage = v63
        }) else nil, 
        ContentFeedImage = if not l_FFlagContentFeedPinchToZoomEnabled_0 then v63 else nil, 
        BottomBlur = if v51 then v5.createElement(l_ImageBlurEffect_0, {
            AnchorPoint = Vector2.new(0.5, 0), 
            direction = l_BlurDirection_0.Down, 
            image = v30.screenshotMetadata.fullSizeUrl, 
            imageSize = v50, 
            Position = UDim2.new(0.5, 0, 0.5, v49 / 2), 
            Size = UDim2.new(1, 0, 0, v52), 
            transparencyBinding = if l_FFlagContentFeedPinchToZoomEnabled_0 and v48 then v43 else nil, 
            ZIndex = l_FFlagContentFeedPinchToZoomEnabled_0 and l_isZooming_0 and v48 and -3 or 0
        }) else nil, 
        BottomBar = v5.createElement(l_View_0, {
            GroupTransparency = if l_FFlagContentFeedPinchToZoomEnabled_0 then v43:map(function(v69) --[[ Line: 253 ]]
                return v69;
            end) else nil, 
            tag = "auto-y anchor-bottom-center position-bottom-center bg-action-subtle size-full-0 col align-x-left align-y-bottom", 
            ZIndex = 2
        }, {
            Overlay = v5.createElement(v16, {
                additionalInfo = v30.additionalInfo, 
                caption = v30.caption, 
                creatorUserId = v30.creatorUserId, 
                postId = v30.postId, 
                uploadedAtTimestamp = v30.uploadedAtTimestamp
            }), 
            ExperienceInfo = v5.createElement(v13, {
                layoutOrder = 2, 
                placeId = v30.placeId, 
                postId = v30.postId, 
                universeId = v30.universeId
            })
        })
    });
end;