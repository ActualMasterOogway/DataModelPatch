local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.InputUi);
local v4 = require(l_Parent_0.SharedFlags);
local v5 = require(l_Parent_0.PeekView);
local v6 = require(l_Parent_0.RoactUtils);
local l_PeekViewWithTopBar_0 = v5.PeekViewWithTopBar;
local v8 = require(l_Parent_0.RoactAppExperiment);
local v9 = require(l_Parent_0.RobloxAppHooks);
local l_FormFactor_0 = require(l_Parent_0.FormFactor).Enums.FormFactor;
local l_useScreenSize_0 = v9.useScreenSize;
local l_useTopBarHeight_0 = v9.useTopBarHeight;
local l_useSelector_0 = v6.Hooks.RoactRodux.useSelector;
local v14 = require(l_script_FirstAncestor_0.Components.ProfileTopBar);
local v15 = require(l_script_FirstAncestor_0.Contexts.useProfileWrapperContext);
local l_getSafeAreaSize_0 = v3.getSafeAreaSize;
local v17 = require(l_script_FirstAncestor_0.Common.Constants);
local v18 = require(script.Parent.ProfileModalView);
local v19 = require(script.Parent.ProfilePeekViewDeprecated);
local v20 = require(l_script_FirstAncestor_0.Components.ProfilePlatformPage);
local l_GetFFlagPeekViewScrimEnabled_0 = v4.GetFFlagPeekViewScrimEnabled;
return (v8.connectUserLayer({
    "PlatformExcellence.QualityImprovement.App"
}, function(v22, _) --[[ Line: 124 ]]
    local v24 = v22["PlatformExcellence.QualityImprovement.App"];
    return {
        scrimEnabled = v24 and v24.peekViewScrimEnabled
    };
end)(function(v25) --[[ Line: 37 ]]
    -- upvalues: v15 (copy), l_useScreenSize_0 (copy), l_useTopBarHeight_0 (copy), v2 (copy), l_useSelector_0 (copy), l_FormFactor_0 (copy), v20 (copy), v14 (copy), l_getSafeAreaSize_0 (copy), v17 (copy), v18 (copy), l_GetFFlagPeekViewScrimEnabled_0 (copy), l_PeekViewWithTopBar_0 (copy), v19 (copy)
    local l_previousView_0 = v15().navigateTo.previousView;
    local v27 = l_useScreenSize_0();
    local v28 = l_useTopBarHeight_0();
    local v29 = v2.useCallback(function() --[[ Line: 45 ]]
        -- upvalues: l_previousView_0 (copy)
        l_previousView_0(false);
    end, {
        l_previousView_0
    });
    local v30 = v2.useCallback(function() --[[ Line: 50 ]]
        -- upvalues: l_previousView_0 (copy)
        l_previousView_0(true);
    end, {
        l_previousView_0
    });
    local v32 = l_useSelector_0(function(v31) --[[ Line: 55 ]]
        return v31.GlobalGuiInset;
    end);
    local v34 = l_useSelector_0(function(v33) --[[ Line: 58 ]]
        return v33.FormFactor;
    end) == l_FormFactor_0.WIDE;
    local v35 = v2.useCallback(function() --[[ Line: 64 ]]
        -- upvalues: v2 (ref), v20 (ref)
        return v2.createElement(v20, {});
    end, {});
    local v36 = v2.useCallback(function() --[[ Line: 68 ]]
        -- upvalues: v2 (ref), v14 (ref), v29 (copy)
        return v2.createElement(v14, {
            navigateBack = v29
        });
    end, {});
    local v37 = l_getSafeAreaSize_0(v27, v32);
    local v38 = math.min(v37.X.Offset, 640);
    local v39 = nil;
    v39 = if v37.Y.Offset - v28 < v17.PEEK_VIEW_OPEN_HEIGHT then UDim.new(1, 0) else UDim.new(0, v17.PEEK_VIEW_OPEN_HEIGHT);
    if v34 then
        return v2.createElement(v18, {
            renderContent = v35, 
            renderTopBar = v36, 
            topBarHeight = v28, 
            viewWidth = v38
        });
    elseif l_GetFFlagPeekViewScrimEnabled_0() or v25.scrimEnabled then
        return v2.createElement(l_PeekViewWithTopBar_0, {
            bottomDockedContainerHeight = 0, 
            briefViewContentHeight = v39, 
            contentSlot = v35(), 
            fullViewContentHeight = UDim.new(1, -v28), 
            mountAsFullView = false, 
            onClosed = v30, 
            onViewStateChanged = nil, 
            topBarHeight = v28, 
            topBarSlot = v36(), 
            viewWidth = UDim.new(0, v38)
        });
    else
        return v2.createElement(v19, {
            briefViewContentHeight = v39, 
            mountAsFullView = false, 
            onPeekViewClosed = v30, 
            renderContent = v35, 
            renderTopBar = v36, 
            topBarHeight = v28, 
            viewWidth = v38
        });
    end;
end));