local l_Parent_0 = script:FindFirstAncestor("Impressions").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.AppCommonLib);
local l_useRouteName_0 = require(l_Parent_0.Navigation).useRouteName;
local l_Signal_0 = v2.Signal;
local v5 = require(script.Parent.ImpressionsDetector);
local v6 = require(script.Parent.ImpressionsVisualizer);
return function(v7) --[[ Line: 27 ]]
    -- upvalues: v1 (copy), l_Signal_0 (copy), v6 (copy), l_useRouteName_0 (copy), v5 (copy)
    local v8 = v1.useRef({});
    local v9 = v1.useRef(l_Signal_0.new());
    local v10 = nil;
    v10 = v1.useRef(nil);
    if v10.current == nil then
        v10.current = v6.new(v7.impressionsTag);
    end;
    assert(v10.current, "impressionsVisualizer should always be truthy; check needed for lint");
    local v11, v12 = v1.useState({});
    local v13, v14 = v1.useState(v7.dataUpdatedTimestamp);
    local v15 = l_useRouteName_0();
    local v16 = v1.useRef(v7.impressionsTag);
    local l_viewPortBounds_0 = v7.viewPortBounds;
    v1.useEffect(function() --[[ Line: 44 ]]
        -- upvalues: v16 (copy), v7 (copy), v14 (copy), v8 (copy), v10 (ref)
        if v16.current ~= v7.impressionsTag then
            v16.current = v7.impressionsTag;
            v14(v7.dataUpdatedTimestamp);
            v8.current = {};
            v10.current:onClearAllImpressions();
            v10.current:setImpressionsTag(v7.impressionsTag);
        end;
    end, {
        v7.impressionsTag
    });
    v1.useEffect(function() --[[ Line: 54 ]]
        -- upvalues: v9 (copy), v7 (copy)
        v9.current:fire();
        local v18 = nil;
        if v7.scrollViewPositionChangedSignal then
            v18 = v7.scrollViewPositionChangedSignal:connect(function() --[[ Line: 58 ]]
                -- upvalues: v9 (ref)
                v9.current:fire();
            end);
        end;
        return function() --[[ Line: 63 ]]
            -- upvalues: v18 (ref)
            if v18 ~= nil then
                v18:disconnect();
            end;
        end;
    end, {
        v7.scrollViewPositionChangedSignal
    });
    v1.useEffect(function() --[[ Line: 70 ]]
        -- upvalues: v15 (copy), v7 (copy), v9 (copy), v13 (copy), v14 (copy), v8 (copy), v10 (ref)
        if v15 == v7.pageContext then
            v9.current:fire();
            if v7.dataUpdatedTimestamp ~= v13 then
                v14(v7.dataUpdatedTimestamp);
                v8.current = {};
                v10.current:onClearAllImpressions();
            end;
        end;
    end, {
        v15, 
        v7.pageContext, 
        v7.dataUpdatedTimestamp, 
        v13, 
        l_viewPortBounds_0
    });
    v1.useEffect(function() --[[ Line: 89 ]]
        -- upvalues: v11 (copy), v7 (copy), v10 (ref), v12 (copy)
        if v11 ~= nil and #v11 > 0 then
            v7.sendImpressions(v11);
            v10.current:onSendImpressions(v11);
            v12({});
        end;
    end, {
        v11
    });
    v1.useEffect(function() --[[ Line: 97 ]]
        -- upvalues: v10 (ref)
        return function() --[[ Line: 98 ]]
            -- upvalues: v10 (ref)
            v10.current:destroy();
        end;
    end, {});
    local v20 = v1.useCallback(function(v19) --[[ Line: 103 ]]
        -- upvalues: v8 (copy)
        if v8.current[v19] ~= nil then
            return false;
        else
            v8.current[v19] = true;
            return true;
        end;
    end, {});
    local v22 = v1.useCallback(function(v21) --[[ Line: 112 ]]
        -- upvalues: v12 (copy)
        if not v21 or #v21 == 0 then
            return;
        else
            v12(v21);
            return;
        end;
    end, {});
    return v1.createElement(v5, {
        parentRef = v7.parentRef, 
        viewPortBounds = l_viewPortBounds_0, 
        onRequestImpressionsSignal = v9.current, 
        filterImpressionFunc = v20, 
        onImpressionsDetected = v22, 
        impressionsTag = v7.impressionsTag
    });
end;