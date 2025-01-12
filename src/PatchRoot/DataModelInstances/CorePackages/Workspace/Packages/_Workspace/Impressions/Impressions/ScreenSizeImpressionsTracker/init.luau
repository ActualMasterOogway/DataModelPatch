local l_Parent_0 = script:FindFirstAncestor("Impressions").Parent;
local v1 = require(l_Parent_0.React);
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local v3 = require(script.Parent.ImpressionsTracker);
return function(v4) --[[ Line: 28 ]]
    -- upvalues: l_useSelector_0 (copy), v1 (copy), v3 (copy)
    local v6 = l_useSelector_0(function(v5) --[[ Line: 29 ]]
        return v5.ScreenSize;
    end);
    local v8 = l_useSelector_0(function(v7) --[[ Line: 32 ]]
        return v7.TopBar.topBarHeight;
    end);
    local v10 = l_useSelector_0(function(v9) --[[ Line: 35 ]]
        return v9.GlobalGuiInset;
    end);
    local v11 = v1.useMemo(function() --[[ Line: 38 ]]
        -- upvalues: v8 (copy), v6 (copy), v10 (copy)
        return {
            min = Vector2.new(0, v8), 
            max = Vector2.new(v6.X, v6.Y - v10.bottom)
        };
    end, {
        v8, 
        v6, 
        v10
    });
    return v1.createElement(v3, {
        pageContext = v4.pageContext, 
        parentRef = v4.parentRef, 
        impressionsTag = v4.impressionsTag, 
        scrollViewPositionChangedSignal = v4.scrollViewPositionChangedSignal, 
        sendImpressions = v4.sendImpressions, 
        dataUpdatedTimestamp = v4.dataUpdatedTimestamp, 
        viewPortBounds = v11
    });
end;