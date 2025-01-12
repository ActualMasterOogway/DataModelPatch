local l_Parent_0 = script:FindFirstAncestor("DiscoveryMonolith").Parent;
local l_Symbol_0 = require(l_Parent_0.AppCommonLib).Symbol;
local v2 = require(l_Parent_0.t);
local v3 = l_Symbol_0.named("OmniFeedProps");
return {
    interface = v2.strictInterface({
        feedItemPosition = v2.number, 
        scrollViewPositionChangedSignal = v2.table, 
        refreshSignal = v2.table, 
        appPage = v2.string, 
        verticalScrollingFrameRef = v2.table
    }), 
    key = v3, 
    new = function(v4, v5, v6, v7, v8) --[[ Line: 17 ]]
        return {
            feedItemPosition = v4, 
            scrollViewPositionChangedSignal = v5, 
            refreshSignal = v6, 
            appPage = v7, 
            verticalScrollingFrameRef = v8
        };
    end
};