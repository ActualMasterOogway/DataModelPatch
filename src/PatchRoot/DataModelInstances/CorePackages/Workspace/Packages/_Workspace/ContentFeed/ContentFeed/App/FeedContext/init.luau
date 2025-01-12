local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.CapturesCommon);
local v2 = require(l_Parent_0.Dash);
local v3 = require(l_Parent_0.React);
local l_FFlagContentFeedPinchToZoomEnabled_0 = v1.Flags.FFlagContentFeedPinchToZoomEnabled;
return v3.createContext({
    fireAnalyticsEvent = v2.noop, 
    isZooming = not l_FFlagContentFeedPinchToZoomEnabled_0 and nil, 
    navigateBack = v2.noop, 
    navigateToItemDetailPage = v2.noop, 
    navigateToReportPage = v2.noop, 
    setIsZooming = if l_FFlagContentFeedPinchToZoomEnabled_0 then v2.noop else nil
});