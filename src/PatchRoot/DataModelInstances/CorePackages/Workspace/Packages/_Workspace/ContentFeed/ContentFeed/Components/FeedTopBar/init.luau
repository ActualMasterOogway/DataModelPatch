local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Players_0 = game:GetService("Players");
local v3 = require(l_Parent_1.CapturesCommon);
local v4 = require(l_Parent_1.Foundation);
local v5 = require(l_Parent_1.Localization);
local v6 = require(l_Parent_1.Otter);
local v7 = require(l_Parent_1.React);
local v8 = require(l_Parent_1.ReactOtter);
local v9 = require(l_Parent_1.RoactUtils);
local v10 = require(l_Parent_1.RobloxAppHooks);
local v11 = require(l_Parent_1.UIBlox);
local v12 = require(l_Parent_0.Components.FeedHeader);
local l_View_0 = v4.View;
local l_ContextualMenu_0 = v11.App.Menu.ContextualMenu;
local v15 = require(l_Parent_0.Analytics.EventNames);
local v16 = require(l_Parent_0.App.FeedContext);
local l_Images_0 = v11.App.ImageSet.Images;
local l_MenuDirection_0 = v11.App.Menu.MenuDirection;
local v19 = require(l_Parent_0.Thunks.RemovePost);
local v20 = require(l_Parent_0.Hooks.useAnalytics);
local l_useAnimatedBinding_0 = v8.useAnimatedBinding;
local l_useDispatch_0 = v9.Hooks.RoactRodux.useDispatch;
local l_useLocalization_0 = v5.Hooks.useLocalization;
local v24 = require(l_Parent_0.Hooks.useSafeZoneOffsets);
local l_useScreenSize_0 = v10.useScreenSize;
local l_useTokens_0 = v4.Hooks.useTokens;
local l_FFlagContentFeedPinchToZoomEnabled_0 = v3.Flags.FFlagContentFeedPinchToZoomEnabled;
local v28 = {
    motorCallback = v6.instant, 
    open = {
        targetValue = 1
    }, 
    close = {
        targetValue = 0
    }
};
return function(v29) --[[ Line: 60 ]]
    -- upvalues: l_Players_0 (copy), v7 (copy), v16 (copy), l_useLocalization_0 (copy), v20 (copy), l_useDispatch_0 (copy), l_useTokens_0 (copy), l_useScreenSize_0 (copy), v24 (copy), l_FFlagContentFeedPinchToZoomEnabled_0 (copy), l_useAnimatedBinding_0 (copy), v8 (copy), v15 (copy), v19 (copy), l_Images_0 (copy), l_View_0 (copy), l_ContextualMenu_0 (copy), l_MenuDirection_0 (copy), v28 (copy), v12 (copy)
    local v30 = if l_Players_0 and l_Players_0.LocalPlayer then tostring(l_Players_0.LocalPlayer.UserId) else "";
    local v31 = v7.useContext(v16);
    local v32 = l_useLocalization_0({
        removePost = "Feature.ContentFeed.Action.Delete", 
        report = "Feature.ContentFeed.Action.Report"
    });
    local v33 = v20();
    local v34 = l_useDispatch_0();
    local v35 = l_useTokens_0();
    local v36 = l_useScreenSize_0();
    local v37 = v24();
    local v38, v39 = v7.useState(false);
    local v40 = nil;
    local v41 = nil;
    if l_FFlagContentFeedPinchToZoomEnabled_0 then
        local v42, v43 = l_useAnimatedBinding_0(0);
        v40 = v42;
        v41 = v43;
        v7.useEffect(function() --[[ Line: 81 ]]
            -- upvalues: v31 (copy), v41 (ref), v8 (ref)
            if v31.isZooming then
                v41(v8.spring(1, {
                    dampingRatio = 1, 
                    frequency = 4
                }));
                return;
            else
                v41(v8.spring(0, {
                    dampingRatio = 1, 
                    frequency = 4
                }));
                return;
            end;
        end, {
            v31.isZooming
        });
    end;
    local v44 = v7.useCallback(function() --[[ Line: 96 ]]
        -- upvalues: v39 (copy)
        v39(false);
    end, {});
    local v45 = v7.useCallback(function() --[[ Line: 100 ]]
        -- upvalues: l_FFlagContentFeedPinchToZoomEnabled_0 (ref), v31 (copy), v33 (copy), v15 (ref), v29 (copy)
        if l_FFlagContentFeedPinchToZoomEnabled_0 and v31.isZooming then
            return;
        else
            v33.fireEvent(v15.ContentFeedExitCtaPressed, {
                postId = v29.postId
            });
            v31.navigateBack(false);
            return;
        end;
    end, {
        v33.fireEvent, 
        v31.isZooming, 
        v31.navigateBack
    });
    local v46 = v7.useCallback(function() --[[ Line: 111 ]]
        -- upvalues: l_FFlagContentFeedPinchToZoomEnabled_0 (ref), v31 (copy), v33 (copy), v15 (ref), v29 (copy), v39 (copy), v38 (copy)
        if l_FFlagContentFeedPinchToZoomEnabled_0 and v31.isZooming then
            return;
        else
            v33.fireEvent(v15.ContentFeedMoreMenuButtonPressed, {
                postId = v29.postId
            });
            v39(not v38);
            return;
        end;
    end, {
        v33.fireEvent, 
        v31.isZooming, 
        v38, 
        v29.postId
    });
    local v47 = v7.useCallback(function() --[[ Line: 122 ]]
        -- upvalues: v33 (copy), v15 (ref), v29 (copy), v31 (copy), v39 (copy)
        v33.fireEvent(v15.ContentFeedReportCtaPressed, {
            postId = v29.postId
        });
        v31.navigateToReportPage(v29.postId);
        v39(false);
    end, {
        v33.fireEvent, 
        v31.navigateToReportPage, 
        v29.postId
    });
    local v48 = v7.useCallback(function() --[[ Line: 130 ]]
        -- upvalues: v33 (copy), v15 (ref), v29 (copy), v34 (copy), v19 (ref), v39 (copy)
        v33.fireEvent(v15.ContentFeedDeleteCtaPressed, {
            postId = v29.postId
        });
        v34(v19(v29.postId));
        v29.removePostTransition();
        v39(false);
    end, {
        v33.fireEvent, 
        v29.postId, 
        v29.removePostTransition
    });
    local v49 = {};
    if v29.creatorId ~= v30 then
        table.insert(v49, {
            icon = l_Images_0["icons/actions/feedback"], 
            onActivated = v47, 
            text = v32.report
        });
    end;
    if v29.creatorId == v30 then
        table.insert(v49, {
            icon = l_Images_0["icons/actions/edit/delete"], 
            onActivated = v48, 
            text = v32.removePost
        });
    end;
    return v7.createElement(l_View_0, {
        GroupTransparency = if l_FFlagContentFeedPinchToZoomEnabled_0 and v31.isZooming then v40:map(function(v50) --[[ Line: 159 ]]
            return v50;
        end) else nil, 
        Position = UDim2.fromOffset(0, v37.top), 
        Size = UDim2.new(1, 0, 0, 56), 
        tag = "bg-action-subtle", 
        ZIndex = v29.ZIndex
    }, {
        GradientBackdrop = v7.createElement(l_View_0, {
            Position = UDim2.fromOffset(0, -v37.top), 
            Size = UDim2.new(1, 0, 1, v37.top), 
            tag = "col size-full-full bg-contrast", 
            ZIndex = 0
        }, {
            UIGradient = v7.createElement("UIGradient", {
                Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, v35.Color.OverMedia.OverMedia_0.Color3), 
                    ColorSequenceKeypoint.new(1, v35.Color.OverMedia.OverMedia_0.Color3)
                }), 
                Rotation = 90, 
                Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 0.5), 
                    NumberSequenceKeypoint.new(1, 1)
                })
            })
        }), 
        ContextualMenu = v7.createElement(l_ContextualMenu_0, {
            buttonProps = v49, 
            closeBackgroundVisible = false, 
            horizontalAlignment = Enum.HorizontalAlignment.Right, 
            menuDirection = l_MenuDirection_0.Down, 
            motorOverrideOptions = v28, 
            onDismiss = v44, 
            open = v38, 
            openPositionX = UDim.new(0, -12), 
            openPositionY = UDim.new(0, 56), 
            screenSize = v36, 
            zIndex = 2
        }), 
        FeedHeader = v7.createElement(v12, {
            isContextualMenuOpen = v38, 
            isPlaceholderPost = v29.isPlaceholderPost, 
            onBackActivated = v45, 
            onMoreActivated = v46, 
            ZIndex = 1
        })
    });
end;