local l_Parent_0 = script:FindFirstAncestor("PeekView").Parent;
local v1 = require(l_Parent_0.Cryo);
local v2 = require(l_Parent_0.React);
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_useRouteName_0 = require(l_Parent_0.Navigation).useRouteName;
local l_AppEventIngestService_0 = require(l_Parent_0.RoactServiceTags).AppEventIngestService;
local l_useStyle_0 = require(l_Parent_0.UIBlox).Core.Style.useStyle;
local v7 = require(script.Parent.PeekView);
local v8 = require(script.Parent.PeekViewState);
local v9 = require(script.Parent.analytics.peekViewDismissedEvent);
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_FFlagEDPContextRedesign_0 = require(l_Parent_0.SharedFlags).FFlagEDPContextRedesign;
local l_GetFFlagFixPeekViewBottomInset_0 = require(l_Parent_0.SharedFlags).GetFFlagFixPeekViewBottomInset;
local l_FFlagEDPContextMediaUpdates_0 = require(l_Parent_0.SharedFlags).FFlagEDPContextMediaUpdates;
return function(v14) --[[ Line: 53 ]] --[[ Name: PeekViewWithTopBar ]]
    -- upvalues: l_useRoactService_0 (copy), l_AppEventIngestService_0 (copy), l_useRouteName_0 (copy), l_useStyle_0 (copy), v2 (copy), v8 (copy), v9 (copy), v1 (copy), l_useSelector_0 (copy), l_GetFFlagFixPeekViewBottomInset_0 (copy), l_FFlagEDPContextRedesign_0 (copy), l_FFlagEDPContextMediaUpdates_0 (copy), v7 (copy)
    local v15 = l_useRoactService_0(l_AppEventIngestService_0);
    local v16 = l_useRouteName_0();
    local v17 = l_useStyle_0();
    local l_onClosed_0 = v14.onClosed;
    local l_onViewStateChanged_0 = v14.onViewStateChanged;
    local v24 = v2.useCallback(function(v20, v21, v22) --[[ Line: 60 ]]
        -- upvalues: v8 (ref), l_onClosed_0 (copy), v15 (copy), v14 (copy), v9 (ref), v1 (ref), v16 (copy), l_onViewStateChanged_0 (copy)
        if v20 == v8.Closed then
            if l_onClosed_0 then
                l_onClosed_0();
            end;
            if v22.dismissMethod and v15 then
                local v23 = v14.viewChangedEventMeta or {};
                v9.logEvent(v15, "PeekView", v1.Dictionary.join(v23, v22, {
                    page = v16
                }));
            end;
        end;
        if l_onViewStateChanged_0 then
            l_onViewStateChanged_0(v20, v21);
        end;
    end, {
        l_onClosed_0, 
        l_onViewStateChanged_0, 
        v14.viewChangedEventMeta, 
        v15, 
        v16
    });
    local v26 = l_useSelector_0(function(v25) --[[ Line: 83 ]]
        -- upvalues: l_GetFFlagFixPeekViewBottomInset_0 (ref)
        if l_GetFFlagFixPeekViewBottomInset_0() then
            return v25.GlobalGuiInset or {
                bottom = 0
            };
        else
            return nil;
        end;
    end);
    local v27, v28 = v2.useBinding(0);
    local v29 = nil;
    local v30 = nil;
    local v31 = nil;
    local v32 = nil;
    local v33 = nil;
    if l_FFlagEDPContextRedesign_0 then
        local v34, v35 = v2.useBinding(0);
        v29 = v34;
        v30 = v35;
        v34, v35 = v2.useBinding(0);
        v31 = v34;
        v32 = v35;
        v33 = v2.joinBindings({
            position = v29, 
            offset = v14.solidifyTopBarOffset, 
            frameSize = v31
        });
    end;
    local v37 = l_FFlagEDPContextRedesign_0 and v14.isDetailsPageContextRedesignEnabled and function(v36) --[[ Line: 105 ]]
        -- upvalues: v32 (ref)
        v32(v36.AbsoluteSize.Y);
    end or nil;
    local v39 = l_FFlagEDPContextRedesign_0 and v14.isDetailsPageContextRedesignEnabled and function(v38) --[[ Line: 112 ]]
        -- upvalues: v28 (copy), v14 (copy)
        v28(v38);
        if v14.transitionPercentCallback then
            v14.transitionPercentCallback(v38);
        end;
    end or nil;
    return v2.createElement("Frame", {
        Position = UDim2.fromOffset(0, 0), 
        Size = UDim2.new(v14.viewWidth or UDim.new(1, 0), UDim.new(1, 0)), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0
    }, {
        PeekViewTopBar = v2.createElement("CanvasGroup", {
            Position = if l_FFlagEDPContextRedesign_0 and v14.isDetailsPageContextRedesignEnabled and v14.stickyTopBar then v33:map(function(v40) --[[ Line: 130 ]]
                local v41 = nil;
                v41 = if v40.position < v40.frameSize then v40.frameSize - v40.position else 0;
                return UDim2.new(0, 0, 0, v41);
            end) else UDim2.new(0, 0, 0, 0), 
            Size = UDim2.new(1, 0, 0, v14.topBarHeight), 
            BackgroundColor3 = v17.Theme.BackgroundDefault.Color, 
            Active = if l_FFlagEDPContextRedesign_0 and v14.isDetailsPageContextRedesignEnabled then if v14.solidifyTopBarOffset then v33:map(function(v42) --[[ Line: 145 ]]
                return v42.position > v42.offset + v42.frameSize;
            end) else false else nil, 
            BackgroundTransparency = if l_FFlagEDPContextRedesign_0 and v14.isDetailsPageContextRedesignEnabled then if v14.solidifyTopBarOffset then v33:map(function(v43) --[[ Line: 153 ]]
                if v43.position > v43.offset + v43.frameSize then
                    return 0;
                else
                    return 1;
                end;
            end) else l_FFlagEDPContextMediaUpdates_0 and 0 or 1 else nil, 
            BorderColor3 = if l_FFlagEDPContextRedesign_0 and v14.isDetailsPageContextRedesignEnabled then v17.Tokens.Semantic.Color.Common.Placeholder.Color3 else nil, 
            GroupTransparency = l_FFlagEDPContextRedesign_0 and v14.isDetailsPageContextRedesignEnabled and v14.stickyTopBar and 0 or v27:map(function(v44) --[[ Line: 166 ]]
                return 1 - v44;
            end), 
            ZIndex = 2
        }, {
            PeekViewTopBarInner = v14.topBarSlot
        }), 
        PeekViewContainer = v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            Position = UDim2.new(0, 0, 0, 0), 
            BackgroundTransparency = 1, 
            ClipsDescendants = true
        }, {
            PeekView = v2.createElement(v7, {
                hasScrim = true, 
                fullViewContentHeight = v14.fullViewContentHeight, 
                briefViewContentHeight = v14.briefViewContentHeight, 
                bottomDockedContainerHeight = v14.bottomDockedContainerHeight, 
                bottomDockedContainerContent = {
                    PeekViewBottomBar = v14.bottomBarSlot
                }, 
                mountAsFullView = v14.mountAsFullView, 
                mountAnimation = v14.mountAnimation, 
                viewStateChanged = v24, 
                briefToFullTransitionPercent = if l_FFlagEDPContextRedesign_0 and v14.isDetailsPageContextRedesignEnabled then v39 else v28, 
                peekHeaderPositionYChange = if l_FFlagEDPContextRedesign_0 and v14.isDetailsPageContextRedesignEnabled then v30 else nil, 
                onScrollingFrameSizeChanged = if l_FFlagEDPContextRedesign_0 and v14.isDetailsPageContextRedesignEnabled then v37 else nil, 
                overlayDragger = if l_FFlagEDPContextRedesign_0 and v14.isDetailsPageContextRedesignEnabled then v14.overlayDragger else nil, 
                isDetailsPageContextRedesignEnabled = if l_FFlagEDPContextRedesign_0 then v14.isDetailsPageContextRedesignEnabled else nil
            }, {
                UIListLayout = v2.createElement("UIListLayout", {
                    Padding = UDim.new(0, 0), 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    VerticalAlignment = Enum.VerticalAlignment.Top
                }), 
                Content = v14.contentSlot
            })
        }), 
        BottomInsetBackground = if l_GetFFlagFixPeekViewBottomInset_0() and v26.bottom > 0 then v2.createElement("Frame", {
            BackgroundColor3 = v17.Theme.BackgroundDefault.Color, 
            BackgroundTransparency = v17.Theme.BackgroundDefault.Transparency, 
            BorderSizePixel = 0, 
            Position = UDim2.new(0, 0, 1, 0), 
            Size = UDim2.new(1, 0, 0, v26.bottom), 
            ZIndex = 3
        }) else nil
    });
end;