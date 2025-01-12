local l_Parent_0 = script.Parent.Parent;
local l_context_0 = l_Parent_0.context;
local l_Hooks_0 = l_Parent_0.Hooks;
local l_utils_0 = l_Parent_0.utils;
local v4 = require(l_Parent_0.dependencies);
local l_React_0 = v4.React;
local l_UIBlox_0 = v4.UIBlox;
local l_useLocalization_0 = v4.Localization.Hooks.useLocalization;
local l_Colors_0 = l_UIBlox_0.App.Style.Colors;
local l_useStyle_0 = l_UIBlox_0.Core.Style.useStyle;
local v10 = require(l_Parent_0.type);
local l_ButtonStack_0 = l_UIBlox_0.App.Button.ButtonStack;
local l_ButtonType_0 = l_UIBlox_0.App.Button.Enum.ButtonType;
local v13 = require(l_Parent_0.constants);
local l_DefaultContentPadding_0 = v13.DefaultContentPadding;
local l_DefaultButtonHeight_0 = v13.DefaultButtonHeight;
local l_getTimerFromCardData_0 = require(l_utils_0.toastNotificationHelper).getTimerFromCardData;
local v17 = require(l_context_0.useNotificationCardState);
local v18 = require(l_context_0.useNotificationCardData);
local v19 = require(l_Hooks_0.useTimeRemainingMap);
local v20 = game:DefineFastFlag("EnableToastTimerLocalization", false);
local function _(v21) --[[ Line: 29 ]]
    -- upvalues: v10 (copy), l_ButtonType_0 (copy)
    if v21 == v10.SENDERButtonStyleEnum.Growth then
        return l_ButtonType_0.PrimaryContextual;
    elseif v21 == v10.SENDERButtonStyleEnum.Primary then
        return l_ButtonType_0.PrimarySystem;
    elseif v21 == v10.SENDERButtonStyleEnum.Secondary then
        return l_ButtonType_0.Secondary;
    elseif v21 == v10.SENDERButtonStyleEnum.Alert then
        return l_ButtonType_0.Alert;
    else
        return l_ButtonType_0.Secondary;
    end;
end;
local function v27(v23, v24, _, v26) --[[ Line: 50 ]]
    -- upvalues: v20 (copy), l_Colors_0 (copy)
    if v20 and v26 then
        return string.format("%s <font color='#%s' transparency='%f'>(%d%s)</font>", v23.label.text, l_Colors_0.White:ToHex(), 0.3, v24, v26.secondsAbbreviated);
    else
        return string.format("%s <font color='#%s' transparency='%f'>(%ds)</font>", v23.label.text, l_Colors_0.White:ToHex(), 0.3, v24);
    end;
end;
local function v43(v28, v29, v30) --[[ Line: 76 ]]
    -- upvalues: l_useStyle_0 (copy), v18 (copy), l_getTimerFromCardData_0 (copy), v19 (copy), v20 (copy), v27 (copy), v10 (copy), l_ButtonType_0 (copy)
    local v31 = l_useStyle_0();
    local v32 = v18();
    local v33 = nil;
    local v34 = {};
    for _, v36 in ipairs(v28) do
        if v36.timer and v36.timer.showTimeOnElement then
            v34[v36.timer.showTimeOnElement] = l_getTimerFromCardData_0(v32, v36.timer.showTimeOnElement);
        end;
    end;
    v33 = v19(v34, v32);
    local v37 = {};
    if v28 then
        for _, v39 in ipairs(v28) do
            local v40 = nil;
            v40 = if v39 and v39.timer and v39.timer.showTimeOnElement then if v20 then v27(v39, v33[v39.timer.showTimeOnElement], v31.Theme, v29) else v27(v39, v33[v39.timer.showTimeOnElement], v31.Theme) else v39 and v39.label and v39.label.text or "";
            local v41 = {};
            local l_buttonStyle_0 = v39.buttonStyle;
            v41.buttonType = if l_buttonStyle_0 == v10.SENDERButtonStyleEnum.Growth then l_ButtonType_0.PrimaryContextual else if l_buttonStyle_0 == v10.SENDERButtonStyleEnum.Primary then l_ButtonType_0.PrimarySystem else if l_buttonStyle_0 == v10.SENDERButtonStyleEnum.Secondary then l_ButtonType_0.Secondary else if l_buttonStyle_0 == v10.SENDERButtonStyleEnum.Alert then l_ButtonType_0.Alert else l_ButtonType_0.Secondary;
            v41.props = {
                text = v40, 
                onActivated = function() --[[ Line: 115 ]] --[[ Name: onActivated ]]
                    -- upvalues: v30 (copy), v39 (copy)
                    if v30 then
                        v30(v39);
                    end;
                end, 
                buttonTextOverride = {
                    RichText = true
                }
            };
            table.insert(v37, v41);
        end;
    end;
    return v37;
end;
return function() --[[ Line: 131 ]]
    -- upvalues: v17 (copy), v18 (copy), v20 (copy), l_useLocalization_0 (copy), v43 (copy), l_React_0 (copy), l_ButtonStack_0 (copy), l_DefaultButtonHeight_0 (copy), l_DefaultContentPadding_0 (copy)
    local v44 = v17("button");
    local l_handleActions_0 = v18().handleActions;
    local v46 = if v20 then l_useLocalization_0({
        secondsAbbreviated = "Feature.Notifications.Label.SecondsAbbreviated"
    }) else nil;
    local v47 = v43(v44, v46, l_handleActions_0);
    if #v47 > 0 then
        return (l_React_0.createElement("Frame", {
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            LayoutOrder = 2, 
            Size = UDim2.new(1, 0, 0, 0)
        }, {
            ActionButtons = v47 and l_React_0.createElement(l_ButtonStack_0, {
                buttonHeight = l_DefaultButtonHeight_0, 
                buttons = v47, 
                marginBetween = l_DefaultContentPadding_0
            })
        }));
    else
        return nil;
    end;
end;