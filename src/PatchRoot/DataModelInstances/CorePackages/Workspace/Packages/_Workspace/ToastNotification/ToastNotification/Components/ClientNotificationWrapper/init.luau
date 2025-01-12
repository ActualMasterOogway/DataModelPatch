local l_HttpService_0 = game:GetService("HttpService");
local l_GuiService_0 = game:GetService("GuiService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v5 = require(l_Parent_1.React);
local v6 = require(l_Parent_1.RoactUtils);
local v7 = require(l_Parent_1.ReactUtils);
local v8 = require(l_Parent_1.Foundation);
local l_Toast_0 = v8.Toast;
local l_KeyLabel_0 = v8.KeyLabel;
local l_View_0 = v8.View;
local l_InputTypeConstants_0 = require(l_Parent_1.InputType).InputTypeConstants;
local l_useInputType_0 = v6.Hooks.useInputType;
local l_EventConnection_0 = v7.EventConnection;
local l_useFocusGuiObject_0 = require(l_Parent_1.ReactFocusNavigation).useFocusGuiObject;
local v16 = require(l_Parent_0.constants);
return v5.memo(v5.forwardRef(function(v17, _) --[[ Line: 30 ]] --[[ Name: ClientNotificationWrapper ]]
    -- upvalues: v5 (copy), l_useInputType_0 (copy), l_useFocusGuiObject_0 (copy), l_HttpService_0 (copy), l_GuiService_0 (copy), l_View_0 (copy), l_Toast_0 (copy), l_InputTypeConstants_0 (copy), l_EventConnection_0 (copy), l_UserInputService_0 (copy), l_KeyLabel_0 (copy), v16 (copy)
    local v19 = v5.useRef(nil);
    local v20, v21 = v5.useBinding(false);
    local v22, v23 = v5.useBinding(Enum.SelectionBehavior.Escape);
    local v24 = l_useInputType_0();
    local v25 = l_useFocusGuiObject_0();
    local v26 = l_HttpService_0:JSONDecode(v17.notificationInfo);
    local v27 = {};
    if v26.Buttons then
        for v28, v29 in ipairs(v26.Buttons) do
            table.insert(v27, {
                text = v29.Text, 
                variant = v29.ButtonType, 
                onActivated = function() --[[ Line: 45 ]] --[[ Name: onActivated ]]
                    -- upvalues: l_GuiService_0 (ref), v17 (copy), v28 (copy)
                    l_GuiService_0:OnNotificationInteraction(v17.notificationId, v28 - 1);
                end
            });
        end;
    end;
    return v5.createElement(l_View_0, {
        tag = "auto-xy", 
        SelectionGroup = v20, 
        SelectionBehaviorUp = v22, 
        SelectionBehaviorDown = v22, 
        SelectionBehaviorLeft = v22, 
        SelectionBehaviorRight = v22, 
        ref = v19
    }, {
        Toast = v5.createElement(l_Toast_0, {
            title = v26.Title, 
            text = v26.Text, 
            icon = v26.Icon, 
            actions = v27
        }), 
        KeyLabelView = if v24 == l_InputTypeConstants_0.Gamepad and #v27 > 0 then v5.createElement(l_View_0, {
            tag = "size-1400-1400 padding-medium anchor-top-right position-top-right"
        }, {
            EventConnection = v5.createElement(l_EventConnection_0, {
                event = l_UserInputService_0.InputBegan, 
                callback = function(v30) --[[ Line: 75 ]] --[[ Name: callback ]]
                    -- upvalues: v25 (copy), v17 (copy)
                    if v30.KeyCode == Enum.KeyCode.ButtonB then
                        v25(nil);
                        v17.onPause(false);
                    end;
                end
            }), 
            KeyLabel = v5.createElement(l_KeyLabel_0, {
                Size = UDim2.fromScale(1, 1), 
                keyCode = Enum.KeyCode.ButtonStart, 
                holdBehavior = {
                    holdTime = v16.MenuButtonPressHoldTime, 
                    resetTime = v16.MenuButtonPressResetTime, 
                    onBeginHold = function() --[[ Line: 88 ]] --[[ Name: onBeginHold ]]
                        -- upvalues: v17 (copy)
                        v17.onPause(true);
                    end, 
                    onEndHold = function(v31) --[[ Line: 91 ]] --[[ Name: onEndHold ]]
                        -- upvalues: v27 (copy), v17 (copy), v21 (copy), v23 (copy), v25 (copy), v19 (copy)
                        if v31 then
                            if #v27 == 1 then
                                v17.onPause(false);
                                v27[1].onActivated();
                                return;
                            else
                                v21(true);
                                v23(Enum.SelectionBehavior.Stop);
                                v25(v19.current);
                                return;
                            end;
                        else
                            v17.onPause(false);
                            return;
                        end;
                    end
                }
            })
        }) else nil
    });
end));