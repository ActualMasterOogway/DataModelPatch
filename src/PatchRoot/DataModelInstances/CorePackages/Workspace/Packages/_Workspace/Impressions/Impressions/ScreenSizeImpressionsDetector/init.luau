local l_Parent_0 = script:FindFirstAncestor("Impressions").Parent;
local v1 = require(l_Parent_0.Roact);
local v2 = require(l_Parent_0.RoactRodux);
local v3 = require(l_Parent_0.t);
local l_memoize_0 = require(l_Parent_0.AppCommonLib).memoize;
local v5 = require(script.Parent.ImpressionsDetector);
local v6 = v1.PureComponent:extend("ScreenSizeImpressionsDetector");
v6.validateProps = v3.strictInterface({
    impressionsTag = v3.string, 
    parentRef = v3.optional(v3.table), 
    onRequestImpressionsSignal = v3.table, 
    filterImpressionFunc = v3.optional(v3.callback), 
    onImpressionsDetected = v3.callback, 
    skipZeroSizes = v3.optional(v3.boolean), 
    screenSize = v3.Vector2, 
    globalGuiInset = v3.table, 
    topBarHeight = v3.number
});
local v10 = l_memoize_0(function(v7, v8, v9) --[[ Line: 26 ]]
    return {
        min = Vector2.new(0, v7), 
        max = Vector2.new(v8.X, v8.Y - v9.bottom)
    };
end);
v6.render = function(v11) --[[ Line: 33 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v5 (copy), v10 (copy)
    local l_screenSize_0 = v11.props.screenSize;
    local l_topBarHeight_0 = v11.props.topBarHeight;
    local l_globalGuiInset_0 = v11.props.globalGuiInset;
    return v1.createElement(v5, {
        parentRef = v11.props.parentRef, 
        impressionsTag = v11.props.impressionsTag, 
        onRequestImpressionsSignal = v11.props.onRequestImpressionsSignal, 
        viewPortBounds = v10(l_topBarHeight_0, l_screenSize_0, l_globalGuiInset_0), 
        filterImpressionFunc = v11.props.filterImpressionFunc, 
        onImpressionsDetected = v11.props.onImpressionsDetected, 
        skipZeroSizes = v11.props.skipZeroSizes
    });
end;
return (v2.connect(function(v15, _) --[[ Line: 49 ]]
    return {
        topBarHeight = v15.TopBar.topBarHeight, 
        globalGuiInset = v15.GlobalGuiInset, 
        screenSize = v15.ScreenSize
    };
end)(v6));