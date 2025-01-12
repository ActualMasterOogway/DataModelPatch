local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Roact);
local v3 = require(l_Parent_0.UIBlox);
local v4 = require(l_Parent_0.SharedFlags);
local l_RoactAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).RoactAppPolicy;
local l_Panel3D_0 = v3.Core.VR.Panel3D;
local l_useIsFPSAtTarget_0 = require(l_Parent_0.SplashScreenManager).useIsFPSAtTarget;
local v8 = require(script.Parent.AppPanel3D);
local v9 = require(script.Parent.RoundedCornersFrame);
local l_Object_0 = require(l_Parent_0.LuauPolyfill).Object;
local l_GetFFlagEnableVRWrapperTransparency_0 = v4.GetFFlagEnableVRWrapperTransparency;
local l_GetFFlagAdjustVRFloor_0 = v4.GetFFlagAdjustVRFloor;
local l_ROUNDED_CORNER_RADIUS_0 = require(script.Parent.Constants).ROUNDED_CORNER_RADIUS;
local v14 = nil;
v14 = l_GetFFlagAdjustVRFloor_0() and function(v15) --[[ Line: 40 ]]
    -- upvalues: l_useIsFPSAtTarget_0 (copy), l_Object_0 (copy), v1 (copy), v8 (copy), v2 (copy)
    local v16 = l_useIsFPSAtTarget_0();
    local v17 = l_Object_0.assign({}, v15.vrProps, {
        hidden = v15.vrProps.hidden or not v16
    });
    if v15.use3DPanels then
        return v1.createElement(v8, v17, v15[v2.Children]);
    else
        return v1.createElement(v15.component, v15.props, v15[v2.Children]);
    end;
end or function(v18) --[[ Line: 50 ]]
    -- upvalues: l_useIsFPSAtTarget_0 (copy), l_Object_0 (copy), v2 (copy), v9 (copy), l_ROUNDED_CORNER_RADIUS_0 (copy), l_GetFFlagEnableVRWrapperTransparency_0 (copy), v1 (copy), l_Panel3D_0 (copy)
    local v19 = l_useIsFPSAtTarget_0();
    local v20 = l_Object_0.assign({}, v18.vrProps, {
        hidden = v18.vrProps.hidden or not v19
    });
    if v18.use3DPanels then
        local v21 = nil;
        v21 = if v20.roundedCornersFrameColor then {
            RoundedFrame = v2.createElement(v9, {
                cornerRadius = l_ROUNDED_CORNER_RADIUS_0 / (384 / (v20.virtualScreenSize.X / v20.partSize.X)), 
                backgroundColor = v20.roundedCornersFrameColor, 
                backgroundTransparency = if l_GetFFlagEnableVRWrapperTransparency_0() then v20.backgroundTransparency or 0 else 0
            }, v18[v2.Children])
        } else v18[v2.Children];
        return v1.createElement(l_Panel3D_0, v20, v21);
    else
        return v1.createElement(v18.component, v18.props, v18[v2.Children]);
    end;
end;
return (l_RoactAppPolicy_0.connect(function(v22) --[[ Line: 76 ]]
    return {
        use3DPanels = v22.getUse3DPanels()
    };
end)(v14));