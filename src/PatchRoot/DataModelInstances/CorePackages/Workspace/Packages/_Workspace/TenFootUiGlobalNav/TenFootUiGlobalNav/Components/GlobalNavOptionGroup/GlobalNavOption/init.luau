local l_Parent_0 = script:FindFirstAncestor("TenFootUiGlobalNav").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.UIBlox);
local l_Interactable_0 = v2.Core.Control.Interactable;
local l_ControlState_0 = v2.Core.Control.Enum.ControlState;
local l_ImageSetLabel_0 = v2.Core.ImageSet.ImageSetLabel;
local l_useStyle_0 = v2.Core.Style.useStyle;
local l_IconSize_0 = v2.App.ImageSet.Enum.IconSize;
local l_getIconSize_0 = v2.App.ImageSet.getIconSize;
local l_useCursor_0 = v2.App.SelectionCursor.useCursor;
local l_GetFFlagLuaAppEnableFoundationColors_0 = require(l_Parent_0.SharedFlags).GetFFlagLuaAppEnableFoundationColors;
local function v15(v11, v12) --[[ Line: 15 ]] --[[ Name: getContentStyle ]]
    -- upvalues: l_GetFFlagLuaAppEnableFoundationColors_0 (copy), l_ControlState_0 (copy)
    local v13 = l_GetFFlagLuaAppEnableFoundationColors_0() and "IconEmphasis" or "SystemPrimaryDefault";
    local v14 = {
        Color = v12.Theme[v13].Color, 
        Transparency = v12.Theme[v13].Transparency
    };
    if v11 == l_ControlState_0.Disabled or v11 == l_ControlState_0.Pressed then
        v14.Transparency = 0.5 * v14.Transparency + 0.5;
    end;
    return v14;
end;
return function(v16) --[[ Line: 35 ]] --[[ Name: GlobalNavOption ]]
    -- upvalues: l_useStyle_0 (copy), l_useCursor_0 (copy), v1 (copy), l_ControlState_0 (copy), v15 (copy), l_getIconSize_0 (copy), l_IconSize_0 (copy), l_Interactable_0 (copy), l_ImageSetLabel_0 (copy)
    local v17 = l_useStyle_0();
    local v18 = l_useCursor_0(UDim.new(0.5, 0), 0);
    local v19, v20 = v1.useState(l_ControlState_0.Initialize);
    local v21 = v15(v19, v17);
    local v22 = l_getIconSize_0(l_IconSize_0.Medium, v17);
    local l_Size_150_0 = v17.Tokens.Global.Size_150;
    local l_Size_50_0 = v17.Tokens.Global.Size_50;
    local v25 = v22 + 2 * l_Size_150_0;
    local v26 = v22 + 2 * l_Size_50_0;
    return v1.createElement(l_Interactable_0, {
        AnchorPoint = Vector2.new(0, 0), 
        Position = UDim2.new(0, 0, 0, 0), 
        Size = UDim2.fromOffset(v25, v26), 
        onStateChanged = v20, 
        BackgroundTransparency = 1, 
        AutoButtonColor = false, 
        [v1.Event.Activated] = v16.onActivated, 
        SelectionImageObject = v18
    }, v1.createElement(l_ImageSetLabel_0, {
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Position = UDim2.fromScale(0.5, 0.5), 
        Size = UDim2.fromOffset(v22, v22), 
        BackgroundTransparency = 1, 
        Image = v16.icon, 
        ImageColor3 = v21.Color, 
        ImageTransparency = v21.Transparency
    }));
end;