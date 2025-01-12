local v0 = require(script.Responsive);
local v1 = require(script.Parent.React);
local v2 = require(script.CommonConfigs.StandardBreakpoints);
local v3 = require(script.Context.ContainerRef);
local v4 = require(script.FindFirstAncestorWithTag);
local v5 = require(script.Hooks.useResponsiveImpl);
local v6 = require(script.InputMode);
local v7 = require(script.HardwareSafeAreaInsets);
local v8 = require(script.Hooks.useDeviceInsets);
local v9 = require(script.Hooks.useIsSpatial);
local v10 = require(script.Hooks.useLastInput);
local v11 = require(script.Hooks.usePreferredInput);
local v12 = require(script.getVirtualResolutionScale);
breakpointCompare = function(v13, v14) --[[ Line: 20 ]] --[[ Name: breakpointCompare ]]
    -- upvalues: v2 (copy), v0 (copy)
    local l_keyIndex_0 = v2.keyIndex;
    if v13 == v0.DefaultKey or v14 == v0.DefaultKey or l_keyIndex_0[v13] == nil or l_keyIndex_0[v14] == nil then
        return false;
    else
        return l_keyIndex_0[v13] >= l_keyIndex_0[v14];
    end;
end;
ResponsiveProvider = function(v16) --[[ Line: 28 ]] --[[ Name: ResponsiveProvider ]]
    -- upvalues: v1 (copy), v3 (copy)
    local v17 = v1.useRef(nil);
    return v1.createElement(v3.Provider, {
        value = v17
    }, v16.children);
end;
return {
    HardwareSafeAreaInsets = v7, 
    useDeviceInsets = v8, 
    Keys = v2.Enum, 
    Input = v6.Enum, 
    BreakpointConfig = v2, 
    DefaultKey = v0.DefaultKey, 
    ContainerRef = v3, 
    ResponsiveProvider = ResponsiveProvider, 
    FindFirstAncestorWithTag = v4, 
    useBreakpointX = v5, 
    useBreakpointXOrLarger = function(v18) --[[ Line: 46 ]] --[[ Name: useBreakpointXOrLarger ]]
        -- upvalues: v5 (copy)
        return v5(function(v19) --[[ Line: 47 ]]
            -- upvalues: v18 (copy)
            return breakpointCompare(v19, v18);
        end, nil);
    end, 
    useBreakpointXOrSmaller = function(v20) --[[ Line: 51 ]] --[[ Name: useBreakpointXOrSmaller ]]
        -- upvalues: v5 (copy)
        return v5(function(v21) --[[ Line: 52 ]]
            -- upvalues: v20 (copy)
            return breakpointCompare(v20, v21);
        end, nil);
    end, 
    useBreakpointY = function() --[[ Line: 56 ]] --[[ Name: useBreakpointY ]]
        -- upvalues: v5 (copy)
        return v5(nil, nil, "Y");
    end, 
    useBreakpointYOrLarger = function(v22) --[[ Line: 59 ]] --[[ Name: useBreakpointYOrLarger ]]
        -- upvalues: v5 (copy)
        return v5(function(v23) --[[ Line: 60 ]]
            -- upvalues: v22 (copy)
            return breakpointCompare(v23, v22);
        end, nil, "Y");
    end, 
    useBreakpointYOrSmaller = function(v24) --[[ Line: 64 ]] --[[ Name: useBreakpointYOrSmaller ]]
        -- upvalues: v5 (copy)
        return v5(function(v25) --[[ Line: 65 ]]
            -- upvalues: v24 (copy)
            return breakpointCompare(v24, v25);
        end, nil, "Y");
    end, 
    useOrientation = function() --[[ Line: 69 ]] --[[ Name: useOrientation ]]
        -- upvalues: v5 (copy)
        return v5(nil, nil, "Orientation");
    end, 
    useResponsive = function(v26) --[[ Line: 72 ]] --[[ Name: useResponsive ]]
        -- upvalues: v5 (copy)
        return v5(nil, v26);
    end, 
    usePreferredInput = v11, 
    useLastInput = v10, 
    useIsSpatial = v9, 
    bindContainer = v0.bindContainer, 
    ["jest.config"] = script["jest.config"], 
    getVirtualResolutionScale = v12
};