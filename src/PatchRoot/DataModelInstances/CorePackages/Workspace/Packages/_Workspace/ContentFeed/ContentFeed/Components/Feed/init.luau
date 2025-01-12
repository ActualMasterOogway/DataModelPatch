local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.CapturesCommon);
local v3 = require(l_Parent_1.Foundation);
local v4 = require(l_Parent_1.LuaSocialLibrariesDeps);
local v5 = require(l_Parent_1.React);
local v6 = require(l_Parent_1.RoactUtils);
local v7 = require(l_Parent_1.RobloxAppHooks);
local v8 = require(l_Parent_0.Analytics.EventNames);
local v9 = require(l_Parent_0.App.FeedContext);
local v10 = require(l_Parent_0.Enums.FeedDirectionType);
local v11 = require(l_Parent_0.Components.FeedItem);
local v12 = require(l_Parent_0.Components.FeedItemPlaceholder);
local v13 = require(l_Parent_0.Components.FeedItemPostsNotFound);
local v14 = require(l_Parent_0.Components.FeedTopBar);
local l_getDeepValue_0 = v4.SocialLibraries.config({}).Dictionary.getDeepValue;
local v16 = require(l_Parent_0.Utils.getFeedPostElements);
local v17 = require(l_Parent_0.Utils.getIsPlaceholder);
local v18 = require(l_Parent_0.Utils.getPostIndex);
local v19 = require(l_Parent_0.Components.InspectOverlay);
local _ = require(l_Parent_0.Enums.NavigationType);
local v21 = require(l_Parent_0.Enums.PlaceholderType);
local v22 = require(l_Parent_0.Thunks.RetrievePosts);
local v23 = require(l_Parent_0.Enums.SortOrderType);
local _ = require(l_Parent_0.Types);
local l_View_0 = v3.View;
local v26 = require(l_Parent_0.Hooks.useAnalytics);
local l_useDispatch_0 = v6.Hooks.RoactRodux.useDispatch;
local l_useEffect_0 = v5.useEffect;
local v29 = require(l_Parent_0.Hooks.useFeedMotionController);
local v30 = require(l_Parent_0.Hooks.useGuiInset);
local l_useScreenSize_0 = v7.useScreenSize;
local l_useSelector_0 = v6.Hooks.RoactRodux.useSelector;
local l_useState_0 = v5.useState;
local v34 = require(l_Parent_0.Flags.FFlagContentFeedFixOffsetForPartyBanner);
local l_FFlagContentFeedPinchToZoomEnabled_0 = v2.Flags.FFlagContentFeedPinchToZoomEnabled;
local v36 = require(l_Parent_0.Flags.FIntContentFeedZoomEventThrottle);
local v37 = require(l_Parent_0.Flags.FIntContentPostFetchThreshold);
local v38 = Color3.fromRGB(0, 0, 0);
local function v49(v39, v40, v41, v42, v43, v44, v45) --[[ Line: 54 ]]
    -- upvalues: v21 (copy), v5 (copy), v13 (copy), v12 (copy), v11 (copy)
    local v46 = {};
    if v44 then
        v46[v21.PostsNotFound] = v5.createElement(v13, {
            layoutOrder = 1, 
            screenSizeYWithInsets = v40
        });
        return v46;
    elseif #v39 == 0 or v43 == nil then
        v46[v21.PostsNotLoaded] = v5.createElement(v12, {
            layoutOrder = 1, 
            screenSizeYWithInsets = v40
        });
        return v46;
    else
        if v41 then
            v46[v21.NextPostsLoading] = v5.createElement(v12, {
                layoutOrder = 0, 
                screenSizeYWithInsets = v40
            });
        end;
        for v47 = 1, #v39 do
            local v48 = v39[v47];
            v46[v48.postId] = v5.createElement(v11, {
                additionalInfo = v48.additionalInfo, 
                caption = v48.caption, 
                creatorUserId = v48.creatorUserId, 
                currentPostId = v45, 
                layoutOrder = v47, 
                placeId = v48.experienceContext.placeId, 
                postId = v48.postId, 
                screenshotMetadata = v48.screenshotMetadata, 
                screenSizeYWithInsets = v40, 
                universeId = v48.experienceContext.experienceId, 
                uploadedAtTimestamp = v48.uploadedAtTimestamp
            });
        end;
        if v42 then
            v46[v21.PreviousPostsLoading] = v5.createElement(v12, {
                layoutOrder = #v39 + 1, 
                screenSizeYWithInsets = v40
            });
        end;
        return v46;
    end;
end;
local function v56(v50, v51) --[[ Line: 116 ]]
    -- upvalues: v16 (copy), v34 (copy)
    local v52 = v16(v50);
    for _, v54 in pairs(v52) do
        local l_Name_0 = v54.Name;
        if math.abs(v54.AbsolutePosition.Y + if v34 then v51 else 0) < 5 then
            return l_Name_0;
        end;
    end;
    return nil;
end;
local function _(v57, v58) --[[ Line: 133 ]]
    -- upvalues: v37 (copy)
    for v59 = 1, math.min(#v57, v37) do
        if v57[v59].postId == v58 then
            return true;
        end;
    end;
    return false;
end;
local function _(v61, v62) --[[ Line: 143 ]]
    -- upvalues: v37 (copy)
    for v63 = math.max(1, #v61 - (v37 - 1)), #v61 do
        if v61[v63].postId == v62 then
            return true;
        end;
    end;
    return false;
end;
return function(v65) --[[ Line: 153 ]]
    -- upvalues: v34 (copy), v30 (copy), l_useScreenSize_0 (copy), v5 (copy), v9 (copy), v26 (copy), l_useDispatch_0 (copy), l_useState_0 (copy), l_useSelector_0 (copy), l_getDeepValue_0 (copy), l_useEffect_0 (copy), v18 (copy), v21 (copy), v29 (copy), v8 (copy), l_FFlagContentFeedPinchToZoomEnabled_0 (copy), v36 (copy), v56 (copy), v10 (copy), v37 (copy), v22 (copy), v23 (copy), v17 (copy), v49 (copy), v14 (copy), l_View_0 (copy), v38 (copy), v19 (copy)
    local v66 = false;
    local v67 = false;
    local v68 = nil;
    if v34 then
        v68 = v30();
    end;
    local v69 = Vector2.new(0, 0);
    local v70 = l_useScreenSize_0();
    local v71 = v70.Y + 2 * v69.Y;
    local v72 = v5.useContext(v9);
    local v73 = v26();
    local v74 = l_useDispatch_0();
    local v75, v76 = l_useState_0({});
    local v82 = l_useSelector_0(function(v77) --[[ Line: 169 ]]
        -- upvalues: l_getDeepValue_0 (ref), v65 (copy), v75 (copy)
        local v78 = {};
        local v79 = l_getDeepValue_0(v77, "ContentSharing.byUserId." .. v65.creatorUserId .. ".posts") or {};
        for _, v81 in pairs(v79) do
            if not table.find(v75, v81.postId) then
                table.insert(v78, v81);
            end;
        end;
        return v78;
    end);
    local v83, v84 = l_useState_0(nil);
    local v86 = l_useSelector_0(function(v85) --[[ Line: 183 ]]
        return v85.ContentFeed.Inspect.IsOpen;
    end);
    l_useEffect_0(function() --[[ Line: 187 ]]
        -- upvalues: v18 (ref), v82 (copy), v65 (copy), v84 (copy)
        local v87 = v18(v82, v65.initialPostId);
        if #v82 == 0 or v87 == nil then
            return;
        else
            v84(v87 - 1);
            return;
        end;
    end, {
        v82, 
        v65.initialPostId
    });
    local v89 = l_useSelector_0(function(v88) --[[ Line: 196 ]]
        -- upvalues: l_getDeepValue_0 (ref), v65 (copy)
        return l_getDeepValue_0(v88, "ContentSharing.byUserId." .. v65.creatorUserId .. ".nextTimeCursor");
    end);
    local v91 = l_useSelector_0(function(v90) --[[ Line: 200 ]]
        -- upvalues: l_getDeepValue_0 (ref), v65 (copy)
        return l_getDeepValue_0(v90, "ContentSharing.byUserId." .. v65.creatorUserId .. ".previousTimeCursor");
    end);
    local v92, v93 = l_useState_0(if #v82 ~= 0 then v65.initialPostId else v21.PostsNotLoaded);
    local v94 = true;
    if #v82 ~= 0 then
        v94 = v89 ~= nil and v92 == v21.NextPostsLoading or v89 == nil and v92 == v82[1].postId or v92 == v21.PostsNotLoaded or v92 == v21.PostsNotFound;
    end;
    local v95 = true;
    if #v82 ~= 0 then
        v95 = v91 ~= nil and v92 == v21.PreviousPostsLoading or v91 == nil and v92 == v82[#v82].postId or v92 == v21.PostsNotLoaded or v92 == v21.PostsNotFound;
    end;
    local v96 = #v82;
    local v97, v98, v99 = v29(v94, v95, v96, v86);
    l_useEffect_0(function() --[[ Line: 222 ]]
        -- upvalues: v73 (copy), v8 (ref), v92 (copy)
        v73.fireEvent(v8.ContentFeedPostViewed, {
            postId = v92
        });
    end, {
        v73.fireEvent, 
        v92
    });
    l_useEffect_0(function() --[[ Line: 228 ]]
        -- upvalues: l_FFlagContentFeedPinchToZoomEnabled_0 (ref), v72 (copy), v36 (ref), v73 (copy), v8 (ref), v92 (copy)
        if not l_FFlagContentFeedPinchToZoomEnabled_0 then
            return;
        else
            if v72.isZooming and math.random() < 1 / v36 then
                v73.fireEvent(v8.ContentFeedZoomOccurred, {
                    postId = v92
                });
            end;
            return;
        end;
    end, {
        v73.fireEvent, 
        v92, 
        v72.isZooming
    });
    l_useEffect_0(function() --[[ Line: 240 ]]
        -- upvalues: v34 (ref), v56 (ref), v97 (copy), v68 (ref), v93 (copy)
        local v100 = nil;
        v100 = if v34 then v56(v97, v68.top) else v56(v97);
        if v100 then
            v93(v100);
        end;
    end, {
        v82, 
        if v34 then v68.top else nil
    });
    local v105 = v5.useCallback(function() --[[ Line: 253 ]]
        -- upvalues: v34 (ref), v56 (ref), v97 (copy), v68 (ref), v93 (copy), v75 (copy), v92 (copy), v82 (copy), v72 (copy), v99 (copy), v10 (ref), v76 (copy)
        local v101 = nil;
        v101 = if v34 then v56(v97, v68.top) else v56(v97);
        if v101 then
            v93(v101);
        end;
        local v102 = {};
        for _, v104 in pairs(v75) do
            table.insert(v102, v104);
        end;
        table.insert(v102, v92);
        if #v82 == 1 then
            v72.navigateBack(true);
        elseif v92 ~= v82[1].postId then
            v99(v10.Up);
            task.wait(0.1);
        end;
        v76(v102);
    end, {
        v82, 
        v72.navigateBack, 
        if v34 then v68.top else nil, 
        v98, 
        v75, 
        v83, 
        v99
    });
    l_useEffect_0(function() --[[ Line: 290 ]]
        -- upvalues: v98 (copy), v34 (ref), v56 (ref), v97 (copy), v68 (ref), v93 (copy)
        local v108 = v98:connect(function(_) --[[ Line: 292 ]]
            -- upvalues: v34 (ref), v56 (ref), v97 (ref), v68 (ref), v93 (ref)
            local v107 = nil;
            v107 = if v34 then v56(v97, v68.top) else v56(v97);
            if v107 then
                v93(v107);
            end;
        end);
        return function() --[[ Line: 305 ]]
            -- upvalues: v108 (copy)
            v108:disconnect();
        end;
    end, {
        v82, 
        v92, 
        if v34 then v68.top else nil, 
        v98, 
        v89, 
        v91
    });
    local v109;
    for v110 = 1, math.min(#v82, v37) do
        if v82[v110].postId == v92 then
            v109 = true;
            v66 = true;
        end;
        if v66 then
            break;
        end;
    end;
    if not v66 then
        v109 = false;
    end;
    v66 = false;
    local v111;
    for v112 = math.max(1, #v82 - (v37 - 1)), #v82 do
        if v82[v112].postId == v92 then
            v111 = true;
            v67 = true;
        end;
        if v67 then
            break;
        end;
    end;
    if not v67 then
        v111 = false;
    end;
    v67 = false;
    l_useEffect_0(function() --[[ Line: 323 ]]
        -- upvalues: v109 (copy), v89 (copy), v74 (copy), v22 (ref), v65 (copy), v23 (ref), v111 (copy), v91 (copy)
        if v109 and v89 then
            assert(v89 ~= nil, "nextTimeCursor should not be nil");
            v74(v22(v65.creatorUserId, v89, v23.Ascending));
        end;
        if v111 and v91 then
            assert(v91 ~= nil, "previousTimeCursor should not be nil");
            v74(v22(v65.creatorUserId, v91, v23.Descending));
        end;
    end, {
        v74, 
        v109, 
        v111, 
        v89, 
        v91, 
        v22
    });
    local v113 = v17(v92);
    local v114 = 0;
    if v89 then
        v114 = v114 + 1;
    end;
    v114 = v114 + (v83 == nil and 0 or v83);
    local v115 = -v70.Y * v114 - if v34 then v68.top else 0;
    local v116 = v49(v82, v71, v89, v91, v83, v65.initialPostsCallFailed, if l_FFlagContentFeedPinchToZoomEnabled_0 then v92 else nil);
    return v5.createElement(v5.Fragment, {}, {
        TopBar = v5.createElement(v14, {
            creatorId = v65.creatorUserId, 
            isPlaceholderPost = v113, 
            postId = v92, 
            removePostTransition = v105, 
            ZIndex = l_FFlagContentFeedPinchToZoomEnabled_0 and 3 or 2
        }), 
        FeedContainer = v5.createElement(l_View_0, {
            tag = "size-full-full bg-surface-200"
        }, {
            ContentFeed = v5.createElement(l_View_0, {
                Position = UDim2.fromOffset(0, if v34 then v115 else -v70.Y * v114), 
                ref = v97, 
                Size = UDim2.new(1, 0, 0, #v82 * v71), 
                tag = "bg-action-subtle no-clip col align-x-center"
            }, v116)
        }), 
        ShadowBlock = if v86 then v5.createElement("Frame", {
            Active = false, 
            BackgroundColor3 = v38, 
            BackgroundTransparency = 0.5, 
            BorderSizePixel = 0, 
            Position = UDim2.fromOffset(0, 0), 
            Size = UDim2.fromScale(1, 1), 
            ZIndex = 3
        }) else nil, 
        InspectOverlay = if v86 then v5.createElement(v19, {
            postId = v92
        }) else nil
    });
end;