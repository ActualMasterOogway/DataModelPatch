local l_script_FirstAncestor_0 = script:FindFirstAncestor("TenFootUiShell");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.SceneManagement);
local v4 = require(l_Parent_0.FocusNavigationUtils);
local l_FocusNavigableSurfaceRegistry_0 = v4.FocusNavigableSurfaceRegistry;
local l_useRegisterFocusNavigableSurface_0 = l_FocusNavigableSurfaceRegistry_0.useRegisterFocusNavigableSurface;
local l_useDeRegisterFocusNavigableSurface_0 = l_FocusNavigableSurfaceRegistry_0.useDeRegisterFocusNavigableSurface;
local l_useFocusNavigableSurfaceRegistryConnection_0 = v4.useFocusNavigableSurfaceRegistryConnection;
local l_FocusNavigableSurfaceIdentifierEnum_0 = v4.FocusNavigableSurfaceIdentifierEnum;
local v10 = require(l_script_FirstAncestor_0.Hooks.useRootFocusNavigationBindings);
local v11 = require(l_script_FirstAncestor_0.ReactNavigationExtend.Views.Constants);
local l_SurfaceGuiWithAdornee_new_0 = v3.SurfaceGuiWithAdornee_new;
local l_useCameraFacingGeometry_0 = v3.useCameraFacingGeometry;
local l_FFlagFocusRegistryConnectionRefactor_0 = require(l_Parent_0.SharedFlags).FFlagFocusRegistryConnectionRefactor;
local function _(v15) --[[ Line: 19 ]] --[[ Name: getAdorneeSizeFromScreenSize ]]
    -- upvalues: v11 (copy)
    return function(v16) --[[ Line: 20 ]]
        -- upvalues: v15 (copy), v11 (ref)
        return (Vector3.new(v16.X, v16.Y * v15, v11.ADORNEE_DEPTH));
    end;
end;
local v18 = 1;
local l_v18_0 = v18 --[[ copy: 17 -> 24 ]];
local function v21(v20) --[[ Line: 20 ]]
    -- upvalues: l_v18_0 (copy), v11 (copy)
    return (Vector3.new(v20.X, v20.Y * l_v18_0, v11.ADORNEE_DEPTH));
end;
local l_TOP_BAR_HEIGHT_RATIO_0 = v11.TOP_BAR_HEIGHT_RATIO;
local l_l_TOP_BAR_HEIGHT_RATIO_0_0 = l_TOP_BAR_HEIGHT_RATIO_0 --[[ copy: 18 -> 25 ]];
v18 = function(v24) --[[ Line: 20 ]]
    -- upvalues: l_l_TOP_BAR_HEIGHT_RATIO_0_0 (copy), v11 (copy)
    return (Vector3.new(v24.X, v24.Y * l_l_TOP_BAR_HEIGHT_RATIO_0_0, v11.ADORNEE_DEPTH));
end;
local l_CONTROLLER_BAR_HEIGHT_RATIO_0 = v11.CONTROLLER_BAR_HEIGHT_RATIO;
local l_l_CONTROLLER_BAR_HEIGHT_RATIO_0_0 = l_CONTROLLER_BAR_HEIGHT_RATIO_0 --[[ copy: 19 -> 26 ]];
l_TOP_BAR_HEIGHT_RATIO_0 = function(v27) --[[ Line: 20 ]]
    -- upvalues: l_l_CONTROLLER_BAR_HEIGHT_RATIO_0_0 (copy), v11 (copy)
    return (Vector3.new(v27.X, v27.Y * l_l_CONTROLLER_BAR_HEIGHT_RATIO_0_0, v11.ADORNEE_DEPTH));
end;
l_CONTROLLER_BAR_HEIGHT_RATIO_0 = function(v28) --[[ Line: 35 ]] --[[ Name: getGlobalNavCFrame ]]
    -- upvalues: v11 (copy)
    local l_Y_0 = v28.viewportFillDimensions.Y;
    local l_cFrame_0 = v28.cFrame;
    local v31 = l_Y_0 * v11.TOP_BAR_HEIGHT_RATIO;
    return l_cFrame_0 * CFrame.new(0, l_Y_0 / 2 - v31 / 2, 0);
end;
local function v36(v32) --[[ Line: 43 ]] --[[ Name: getControllerBarCFrame ]]
    -- upvalues: v11 (copy)
    local l_Y_1 = v32.viewportFillDimensions.Y;
    local l_cFrame_1 = v32.cFrame;
    local v35 = l_Y_1 * v11.CONTROLLER_BAR_HEIGHT_RATIO;
    return l_cFrame_1 * CFrame.new(0, v35 / 2 - l_Y_1 / 2, 0);
end;
local function v39(v37) --[[ Line: 57 ]] --[[ Name: RootViewSurface ]]
    -- upvalues: l_useCameraFacingGeometry_0 (copy), v11 (copy), v2 (copy), l_SurfaceGuiWithAdornee_new_0 (copy), v21 (copy)
    local v38 = l_useCameraFacingGeometry_0(v11.DEFAULT_SCREEN_DISTANCE_TO_CAMERA);
    return v2.createElement(l_SurfaceGuiWithAdornee_new_0, {
        name = "RootViewSurface", 
        adorneeSize = v38.viewportFillDimensions:map(v21), 
        adorneeCFrame = v38.cFrame, 
        adorneeParent = v37.adorneeParent, 
        isVisible = true, 
        canvasSize = v11.FULLSCREEN_CANVAS_SIZE, 
        surfaceGuiParent = v37.surfaceGuiParent
    }, v37.content);
end;
local function v51(v40) --[[ Line: 71 ]] --[[ Name: GlobalNavBarSurface ]]
    -- upvalues: v2 (copy), v10 (copy), l_useCameraFacingGeometry_0 (copy), v11 (copy), v18 (copy), l_CONTROLLER_BAR_HEIGHT_RATIO_0 (copy), l_FFlagFocusRegistryConnectionRefactor_0 (copy), l_useFocusNavigableSurfaceRegistryConnection_0 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy), l_useRegisterFocusNavigableSurface_0 (copy), l_useDeRegisterFocusNavigableSurface_0 (copy), l_SurfaceGuiWithAdornee_new_0 (copy)
    local v41, v42 = v2.useState(nil);
    local v43 = v10(v42);
    local v44 = l_useCameraFacingGeometry_0(v11.DEFAULT_SCREEN_DISTANCE_TO_CAMERA);
    local v45 = v44.viewportFillDimensions:map(v18);
    local v46 = v2.joinBindings({
        viewportFillDimensions = v44.viewportFillDimensions, 
        cFrame = v44.cFrame
    }):map(l_CONTROLLER_BAR_HEIGHT_RATIO_0);
    if l_FFlagFocusRegistryConnectionRefactor_0 then
        l_useFocusNavigableSurfaceRegistryConnection_0(v41, l_FocusNavigableSurfaceIdentifierEnum_0.NavBar);
    else
        local v47 = l_useRegisterFocusNavigableSurface_0();
        local v48 = l_useDeRegisterFocusNavigableSurface_0();
        local l_v47_0 = v47 --[[ copy: 7 -> 9 ]];
        v2.useEffect(function() --[[ Line: 86 ]]
            -- upvalues: v41 (copy), l_v47_0 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (ref), v48 (copy)
            if v41 then
                l_v47_0(l_FocusNavigableSurfaceIdentifierEnum_0.NavBar, v41);
            end;
            return function() --[[ Line: 90 ]]
                -- upvalues: v48 (ref), l_FocusNavigableSurfaceIdentifierEnum_0 (ref)
                v48(l_FocusNavigableSurfaceIdentifierEnum_0.NavBar, nil);
            end;
        end, {
            v47, 
            v41
        });
    end;
    local v50 = v2.createElement("Frame", {
        ref = v43, 
        Position = UDim2.fromOffset(0, 0), 
        Size = UDim2.fromScale(1, 1), 
        BackgroundTransparency = 1
    }, v40.content);
    return v2.createElement(l_SurfaceGuiWithAdornee_new_0, {
        adorneeSize = v45, 
        adorneeCFrame = v46, 
        canvasSize = v11.TOP_BAR_CANVAS_SIZE, 
        isVisible = true, 
        name = "GlobalNavBarSurface", 
        adorneeParent = v40.adorneeParent, 
        surfaceGuiParent = v40.surfaceGuiParent
    }, v50);
end;
local function v56(v52) --[[ Line: 114 ]] --[[ Name: ControllerBarSurface ]]
    -- upvalues: l_useCameraFacingGeometry_0 (copy), v11 (copy), l_TOP_BAR_HEIGHT_RATIO_0 (copy), v2 (copy), v36 (copy), l_SurfaceGuiWithAdornee_new_0 (copy)
    local v53 = l_useCameraFacingGeometry_0(v11.DEFAULT_SCREEN_DISTANCE_TO_CAMERA - 1);
    local v54 = v53.viewportFillDimensions:map(l_TOP_BAR_HEIGHT_RATIO_0);
    local v55 = v2.joinBindings({
        viewportFillDimensions = v53.viewportFillDimensions, 
        cFrame = v53.cFrame
    }):map(v36);
    return v2.createElement(l_SurfaceGuiWithAdornee_new_0, {
        adorneeSize = v54, 
        adorneeCFrame = v55, 
        canvasSize = v11.CONTROLLER_BAR_CANVAS_SIZE, 
        isVisible = true, 
        name = "ControllerBarSurface", 
        adorneeParent = v52.adorneeParent, 
        surfaceGuiParent = v52.surfaceGuiParent
    }, v52.content);
end;
return function(v57) --[[ Line: 141 ]] --[[ Name: TenFootUiLayout ]]
    -- upvalues: v2 (copy), v39 (copy), v51 (copy), v56 (copy)
    return v2.createElement(v2.Fragment, nil, {
        RootViewSlot = if v57.rootViewSlot then v2.createElement(v39, {
            adorneeParent = v57.adorneeParent, 
            surfaceGuiParent = v57.surfaceGuiParent, 
            content = v57.rootViewSlot
        }) else nil, 
        GlobalNavBarSlot = if v57.globalNavSlot then v2.createElement(v51, {
            adorneeParent = v57.adorneeParent, 
            surfaceGuiParent = v57.surfaceGuiParent, 
            content = v57.globalNavSlot
        }) else nil, 
        ControllerBarSlot = if v57.controllerBarSlot then v2.createElement(v56, {
            adorneeParent = v57.adorneeParent, 
            surfaceGuiParent = v57.surfaceGuiParent, 
            content = v57.controllerBarSlot
        }) else nil
    });
end;