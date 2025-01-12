local l_Parent_0 = script:FindFirstAncestor("FriendsCarousel").Parent;
local v1 = require(l_Parent_0.React);
local l_useThrottledCallback_0 = require(l_Parent_0.RoactUtils).Hooks.useThrottledCallback;
local v3 = game:DefineFastInt("FriendsCarouselRefreshThrottleInterval", 3);
return function(v4) --[[ Line: 18 ]] --[[ Name: RefreshCarouselWrapper ]]
    -- upvalues: v1 (copy), l_useThrottledCallback_0 (copy), v3 (copy)
    local v5, v6 = v1.useState(0);
    local v8 = l_useThrottledCallback_0(function() --[[ Line: 21 ]]
        -- upvalues: v4 (copy), v6 (copy)
        v4.refetchData();
        v6(function(v7) --[[ Line: 23 ]]
            return v7 + 1;
        end);
    end, v3);
    v1.useEffect(function() --[[ Line: 28 ]]
        -- upvalues: v4 (copy), v8 (copy)
        if not v4.refreshSignal then
            return;
        else
            v4.refreshSignal:connect(v8);
            return;
        end;
    end, {
        v4.refreshSignal
    });
    return v1.createElement("Frame", {
        key = v5, 
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1
    }, {
        component = v4.renderChildComponent()
    });
end;