local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.dependencies);
local l_HeaderBar_0 = v2.UIBlox.App.Bar.HeaderBar;
local l_useUiModeInfo_0 = require(l_Parent_0.RobloxAppHooks).useUiModeInfo;
local l_UiMode_0 = require(l_Parent_0.RobloxAppEnums).UiMode;
local v6 = require(l_script_FirstAncestor_0.Common.Constants);
local l_GetFFlagFixConnectTabSearchBarHeight_0 = v2.GetFFlagFixConnectTabSearchBarHeight;
local v8 = require(l_Parent_0.React);
return function(v9) --[[ Line: 16 ]] --[[ Name: FriendsLandingHeaderBarPresentational ]]
    -- upvalues: l_useUiModeInfo_0 (copy), l_UiMode_0 (copy), v8 (copy), v6 (copy), l_HeaderBar_0 (copy), l_GetFFlagFixConnectTabSearchBarHeight_0 (copy)
    if l_useUiModeInfo_0().uiMode == l_UiMode_0.TenFoot then
        return nil;
    else
        return v8.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, v6.TOP_BAR_HEIGHT), 
            LayoutOrder = -1, 
            ZIndex = 2
        }, {
            headerBar = v8.createElement(l_HeaderBar_0, {
                title = v9.title, 
                barHeight = v6.TOP_BAR_HEIGHT, 
                renderLeft = v9.renderLeft, 
                renderCenter = v9.renderCenter, 
                renderRight = v9.renderRight, 
                isSecondary = v9.isSecondary, 
                shouldHideSecondaryLeftItem = v9.shouldHideSecondaryLeftItem, 
                paddingTop = if l_GetFFlagFixConnectTabSearchBarHeight_0() then UDim.new(0, 0) else nil, 
                paddingBottom = if l_GetFFlagFixConnectTabSearchBarHeight_0() then UDim.new(0, 0) else nil
            })
        });
    end;
end;