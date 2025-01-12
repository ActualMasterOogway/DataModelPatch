local l_CollectionService_0 = game:GetService("CollectionService");
local l_Parent_0 = script:FindFirstAncestor("Impressions").Parent;
local v2 = require(l_Parent_0.Roact);
local v3 = require(l_Parent_0.ArgCheck);
local v4 = require(l_Parent_0.t);
local l_withNavigationFocus_0 = require(l_Parent_0.RoactNavigation).withNavigationFocus;
local v6 = require(script.Parent.Constants);
local v7 = v2.PureComponent:extend("ImpressionsDetector");
v7.validateProps = v4.strictInterface({
    scanDebounceSeconds = v4.optional(v4.number), 
    viewFillPercent = v4.optional(v4.number), 
    parentRef = v4.optional(v4.table), 
    impressionsTag = v4.string, 
    onRequestImpressionsSignal = v4.table, 
    viewPortBounds = v4.strictInterface({
        min = v4.Vector2, 
        max = v4.Vector2
    }), 
    filterImpressionFunc = v4.optional(v4.callback), 
    onImpressionsDetected = v4.union(v4.callback, v4.table), 
    skipZeroSizes = v4.optional(v4.boolean), 
    isFocused = v4.boolean, 
    navigation = v4.table
});
v7.defaultProps = {
    scanDebounceSeconds = 1, 
    viewFillPercent = 0.25
};
v7.init = function(v8) --[[ Line: 42 ]] --[[ Name: init ]]
    v8.isMounted = false;
    v8.lastImpressionTick = nil;
    v8.nextImpressionTick = nil;
end;
v7._boundingBoxIntersectsView = function(v9, v10) --[[ Line: 48 ]] --[[ Name: _boundingBoxIntersectsView ]]
    -- upvalues: v3 (copy)
    if not v10 then
        return false;
    else
        local l_viewPortBounds_0 = v9.props.viewPortBounds;
        v3.assert(l_viewPortBounds_0 ~= nil);
        if not l_viewPortBounds_0 then
            return false;
        else
            local l_AbsoluteSize_0 = v10.AbsoluteSize;
            local l_AbsolutePosition_0 = v10.AbsolutePosition;
            local v14 = l_AbsolutePosition_0 + l_AbsoluteSize_0;
            local v15 = false;
            if v14.X > l_viewPortBounds_0.min.X then
                v15 = l_AbsolutePosition_0.X < l_viewPortBounds_0.max.X;
            end;
            local v16 = false;
            if v14.Y > l_viewPortBounds_0.min.Y then
                v16 = l_AbsolutePosition_0.Y < l_viewPortBounds_0.max.Y;
            end;
            if v15 and v16 then
                return true;
            else
                return false;
            end;
        end;
    end;
end;
v7._isInstanceVisible = function(v17, v18) --[[ Line: 73 ]] --[[ Name: _isInstanceVisible ]]
    -- upvalues: v3 (copy)
    if not v17:_boundingBoxIntersectsView(v18) then
        return false;
    else
        local l_viewPortBounds_1 = v17.props.viewPortBounds;
        v3.assert(l_viewPortBounds_1 ~= nil);
        local v20 = nil;
        local v21 = l_viewPortBounds_1.max - l_viewPortBounds_1.min;
        if v21.X <= 0 or v21.Y <= 0 then
            return false;
        else
            v20 = v21 * v17.props.viewFillPercent;
            v21 = v3.assert;
            local v22 = false;
            if v20.X > 0 then
                v22 = v20.Y > 0;
            end;
            v21(v22);
            if v20.X <= 0 or v20.Y <= 0 then
                return false;
            else
                v21 = v18.AbsolutePosition;
                v22 = v18.AbsoluteSize;
                if v17.props.skipZeroSizes and (v22.X == 0 or v22.Y == 0) then
                    return false;
                else
                    local v23 = v21 + v22 / 2;
                    local v24 = v21 + v22;
                    local v25 = false;
                    if v23.X > l_viewPortBounds_1.min.X then
                        v25 = v23.X < l_viewPortBounds_1.max.X;
                    end;
                    local v26 = false;
                    if v23.Y > l_viewPortBounds_1.min.Y then
                        v26 = v23.Y < l_viewPortBounds_1.max.Y;
                    end;
                    if v25 and v26 then
                        return true;
                    else
                        local v27 = v21:Max(l_viewPortBounds_1.min);
                        local v28 = v24:Min(l_viewPortBounds_1.max) - v27;
                        local v29 = v28.X >= v20.X;
                        if v26 and v29 then
                            return true;
                        else
                            local v30 = v28.Y >= v20.Y;
                            if v25 and v30 then
                                return true;
                            elseif v29 and v30 then
                                return true;
                            else
                                return false;
                            end;
                        end;
                    end;
                end;
            end;
        end;
    end;
end;
v7._calculateImpressions = function(v31) --[[ Line: 143 ]] --[[ Name: _calculateImpressions ]]
    -- upvalues: l_CollectionService_0 (copy), v6 (copy), v3 (copy)
    if not v31.isMounted then
        return;
    elseif not v31.props.isFocused then
        return;
    else
        v31.lastImpressionTick = tick();
        if v31.props.parentRef ~= nil then
            local l_current_0 = v31.props.parentRef.current;
            if l_current_0 == nil or not v31:_boundingBoxIntersectsView(l_current_0) then
                return;
            end;
        end;
        local l_impressionsTag_0 = v31.props.impressionsTag;
        local v34 = {};
        local l_l_CollectionService_0_Tagged_0 = l_CollectionService_0:GetTagged(l_impressionsTag_0);
        for _, v37 in ipairs(l_l_CollectionService_0_Tagged_0) do
            local l_v37_Attribute_0 = v37:GetAttribute(v6.ItemIndex);
            if l_v37_Attribute_0 and v37:IsA("GuiObject") and v31:_isInstanceVisible(v37) and (v31.props.filterImpressionFunc == nil or v31.props.filterImpressionFunc(l_v37_Attribute_0)) then
                table.insert(v34, l_v37_Attribute_0);
            end;
        end;
        if #v34 > 0 then
            v3.assert(v31.props.onImpressionsDetected ~= nil);
            v31.props.onImpressionsDetected(v34);
        end;
        return;
    end;
end;
v7._requestImpressions = function(v39) --[[ Line: 182 ]] --[[ Name: _requestImpressions ]]
    -- upvalues: v3 (copy)
    if not v39.isMounted then
        return;
    elseif not v39.props.isFocused then
        return;
    elseif v39.nextImpressionTick ~= nil then
        return;
    elseif not v39.props.impressionsTag then
        return;
    else
        local v40 = 0;
        if v39.lastImpressionTick ~= nil then
            v39.nextImpressionTick = v39.lastImpressionTick + v39.props.scanDebounceSeconds;
            v40 = v39.nextImpressionTick - tick();
        end;
        if v40 > 0 then
            task.delay(v40, function() --[[ Line: 205 ]]
                -- upvalues: v3 (ref), v39 (copy)
                local l_assert_0 = v3.assert;
                local v42 = false;
                if v39.nextImpressionTick ~= nil then
                    v42 = tick() > v39.nextImpressionTick;
                end;
                l_assert_0(v42);
                v39.nextImpressionTick = nil;
                v39:_calculateImpressions();
            end);
            return;
        else
            v39.nextImpressionTick = nil;
            v39:_calculateImpressions();
            return;
        end;
    end;
end;
v7.render = function(_) --[[ Line: 217 ]] --[[ Name: render ]]
    return nil;
end;
v7.didMount = function(v44) --[[ Line: 221 ]] --[[ Name: didMount ]]
    v44.isMounted = true;
    v44:_requestImpressions();
    if v44.props.onRequestImpressionsSignal then
        v44.onRequestImpressionsConnection = v44.props.onRequestImpressionsSignal:connect(function() --[[ Line: 225 ]]
            -- upvalues: v44 (copy)
            v44:_requestImpressions();
        end);
    end;
end;
v7.willUnmount = function(v45) --[[ Line: 231 ]] --[[ Name: willUnmount ]]
    v45.isMounted = false;
    if v45.onRequestImpressionsConnection ~= nil then
        v45.onRequestImpressionsConnection:disconnect();
        v45.onRequestImpressionsConnection = nil;
    end;
end;
v7.didUpdate = function(v46, _, _) --[[ Line: 239 ]] --[[ Name: didUpdate ]]
    v46:_requestImpressions();
end;
return (l_withNavigationFocus_0(v7));