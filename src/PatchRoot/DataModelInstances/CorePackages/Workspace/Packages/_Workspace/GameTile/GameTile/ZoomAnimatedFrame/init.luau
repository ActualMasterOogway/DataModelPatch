local l_Parent_0 = script:FindFirstAncestor("GameTile").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Otter);
ZoomAnimatedFrame = function(v3) --[[ Line: 18 ]] --[[ Name: ZoomAnimatedFrame ]]
    -- upvalues: v1 (copy), v2 (copy)
    local l_isZoomEnabled_0 = v3.isZoomEnabled;
    local v5 = v1.useRef(nil);
    if v5.current == nil then
        v5.current = v2.createSingleMotor(0);
    end;
    assert(v5.current, "zoomMotorRef should always exist; assert only needed for the linter");
    local v6, v7 = v1.useBinding(0);
    v1.useEffect(function() --[[ Line: 30 ]]
        -- upvalues: v5 (copy), v7 (copy)
        v5.current:onStep(v7);
    end, {});
    v1.useEffect(function() --[[ Line: 35 ]]
        -- upvalues: v5 (copy), v2 (ref), l_isZoomEnabled_0 (copy), v3 (copy)
        v5.current:setGoal(v2.spring(l_isZoomEnabled_0 and 1 or 0, {
            frequency = v3.reducedMotion and 200 or 6.5
        }));
    end, {
        l_isZoomEnabled_0
    });
    return v1.createElement("Frame", {
        Position = v6:map(function(v8) --[[ Line: 43 ]]
            -- upvalues: v3 (copy)
            local v9 = v8 > 0.9 and 1 or v8;
            local v10 = if v3.reducedMotion then 12 + v3.expansionOffsetX / 2 else 0;
            return UDim2.fromOffset(-v3.expansionOffsetX * v9 / 2, -v3.expansionOffsetTop * v9 - v10 * v9);
        end), 
        Size = v6:map(function(v11) --[[ Line: 56 ]]
            -- upvalues: v3 (copy)
            local v12 = v11 > 0.9 and 1 or v11;
            local v13 = if v3.reducedMotion then 12 + v3.expansionOffsetX else 0;
            return UDim2.new(1, v3.expansionOffsetX * v12, 1, v3.expansionOffsetTop * v12 + v3.expansionOffsetBottom * v12 + v13 * v12);
        end), 
        BackgroundTransparency = 1
    }, v3.children);
end;
return ZoomAnimatedFrame;