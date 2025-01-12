local l_Parent_0 = script:FindFirstAncestor("RobloxAppNavigationCore").Parent;
local v1 = require(l_Parent_0.React);
local l_RobloxSwitchView_0 = require(l_Parent_0.RoactNavigation).RobloxSwitchView;
local l_useUiModeInfo_0 = require(l_Parent_0.RobloxAppHooks).useUiModeInfo;
local l_UiMode_0 = require(l_Parent_0.RobloxAppEnums).UiMode;
local l_TenFootUiSwitchView_0 = require(l_Parent_0.TenFootUiShell).Views.TenFootUiSwitchView;
local _ = require(l_Parent_0.Navigation);
local v7 = require(script.Parent.AppSwitchView);
local l_FFlagEnableRnCustomAppViews_0 = require(l_Parent_0.SharedFlags).FFlagEnableRnCustomAppViews;
return function(v9) --[[ Line: 18 ]] --[[ Name: AdaptiveSwitchView ]]
    -- upvalues: l_useUiModeInfo_0 (copy), l_UiMode_0 (copy), v1 (copy), l_TenFootUiSwitchView_0 (copy), l_FFlagEnableRnCustomAppViews_0 (copy), v7 (copy), l_RobloxSwitchView_0 (copy)
    if l_useUiModeInfo_0().uiMode == l_UiMode_0.TenFoot then
        return v1.createElement(l_TenFootUiSwitchView_0, v9);
    elseif l_FFlagEnableRnCustomAppViews_0 then
        return v1.createElement(v7, v9);
    else
        return v1.createElement(l_RobloxSwitchView_0, v9);
    end;
end;