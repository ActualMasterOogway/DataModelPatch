local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.React);
local v3 = require(l_Parent_1.RoactUtils);
local v4 = require(l_Parent_1.CapturesCommon);
local v5 = require(l_Parent_0.App.FeedContext);
local v6 = require(l_Parent_1.Foundation);
local l_Icon_0 = v6.Icon;
local l_View_0 = v6.View;
local v9 = require(l_Parent_0.Analytics.EventNames);
local v10 = require(l_Parent_0.Hooks.useAnalytics);
local l_useDispatch_0 = v3.Hooks.RoactRodux.useDispatch;
local l_useTokens_0 = v6.Hooks.useTokens;
local v13 = require(l_Parent_0.Thunks.OpenInspectWithAssetIds);
local l_FFlagContentFeedPinchToZoomEnabled_0 = v4.Flags.FFlagContentFeedPinchToZoomEnabled;
local v15 = UDim2.fromOffset(1, 1);
return function(v16) --[[ Line: 33 ]]
    -- upvalues: v10 (copy), l_useDispatch_0 (copy), l_useTokens_0 (copy), l_FFlagContentFeedPinchToZoomEnabled_0 (copy), v2 (copy), v5 (copy), l_View_0 (copy), v9 (copy), v13 (copy), l_Icon_0 (copy), v15 (copy)
    local v17 = v10();
    local v18 = l_useDispatch_0();
    local v19 = l_useTokens_0();
    local v20 = nil;
    if l_FFlagContentFeedPinchToZoomEnabled_0 then
        v20 = v2.useContext(v5);
    end;
    return v2.createElement(l_View_0, {
        isDisabled = if l_FFlagContentFeedPinchToZoomEnabled_0 then v20.isZooming else nil, 
        LayoutOrder = v16.layoutOrder, 
        onActivated = function() --[[ Line: 46 ]] --[[ Name: onActivated ]]
            -- upvalues: v17 (copy), v9 (ref), v16 (copy), v18 (copy), v13 (ref)
            v17.fireEvent(v9.ContentFeedInspectCtaPressed, {
                postId = v16.postId
            });
            v18(v13(v16.avatarItemIds));
        end, 
        tag = "radius-medium auto-xy padding-small bg-action-subtle"
    }, {
        InspectIcon = v2.createElement(l_Icon_0, {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            name = "icons/menu/shopOn", 
            Position = UDim2.fromScale(0.5, 0.5), 
            style = v19.Color.ActionEmphasis.Foreground, 
            ZIndex = 2
        }), 
        InspectIconShadow = v2.createElement(l_Icon_0, {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            name = "icons/menu/shopOn", 
            Position = UDim2.fromScale(0.5, 0.5) + v15, 
            style = v19.Color.Common.Shadow, 
            ZIndex = 1
        })
    });
end;