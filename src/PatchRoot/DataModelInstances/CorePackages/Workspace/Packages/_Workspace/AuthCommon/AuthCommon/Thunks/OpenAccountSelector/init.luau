local l_Parent_0 = script:FindFirstAncestor("AuthCommon").Parent;
local l_CentralOverlayType_0 = require(l_Parent_0.RobloxAppEnums).CentralOverlayType;
local l_SetCentralOverlay_0 = require(l_Parent_0.CentralOverlay).Actions.SetCentralOverlay;
local l_NavigateDown_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateDown;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
return function(v5, v6) --[[ Line: 9 ]]
    -- upvalues: l_NavigateDown_0 (copy), l_AppPage_0 (copy), l_SetCentralOverlay_0 (copy), l_CentralOverlayType_0 (copy)
    return function(v7) --[[ Line: 10 ]]
        -- upvalues: v6 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref), v5 (copy), l_SetCentralOverlay_0 (ref), l_CentralOverlayType_0 (ref)
        if v6 then
            v7:dispatch(l_NavigateDown_0({
                name = l_AppPage_0.AccountSelectorPeekView, 
                extraProps = v5
            }));
            return;
        else
            v7:dispatch(l_SetCentralOverlay_0(l_CentralOverlayType_0.AccountSelector, v5));
            return;
        end;
    end;
end;