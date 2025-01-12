local l_Parent_0 = script:FindFirstAncestor("GameTile").Parent;
local v1 = require(l_Parent_0.RobloxAppEnums);
local l_CentralOverlayType_0 = v1.CentralOverlayType;
local l_AppPage_0 = v1.AppPage;
local l_DeviceType_0 = v1.DeviceType;
local l_SetCentralOverlay_0 = require(l_Parent_0.CentralOverlay).Actions.SetCentralOverlay;
local l_NavigateDown_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateDown;
local l_getDeviceType_0 = require(l_Parent_0.AppCommonLib).getDeviceType;
return function() --[[ Line: 12 ]]
    -- upvalues: l_getDeviceType_0 (copy), l_DeviceType_0 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy), l_SetCentralOverlay_0 (copy), l_CentralOverlayType_0 (copy)
    return function(v8) --[[ Line: 13 ]]
        -- upvalues: l_getDeviceType_0 (ref), l_DeviceType_0 (ref), l_NavigateDown_0 (ref), l_AppPage_0 (ref), l_SetCentralOverlay_0 (ref), l_CentralOverlayType_0 (ref)
        local _ = nil;
        local v10 = l_getDeviceType_0(v8:getState().DeviceOrientation);
        local v11 = true;
        if v10 ~= l_DeviceType_0.Phone then
            v11 = v10 == l_DeviceType_0.Tablet;
        end;
        if v11 then
            v8:dispatch(l_NavigateDown_0({
                name = l_AppPage_0.SponsoredTooltipPeekView
            }));
            return;
        else
            v8:dispatch(l_SetCentralOverlay_0(l_CentralOverlayType_0.SponsoredTooltip));
            return;
        end;
    end;
end;