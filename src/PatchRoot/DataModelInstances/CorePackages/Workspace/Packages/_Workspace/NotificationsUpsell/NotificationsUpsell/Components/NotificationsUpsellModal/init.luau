local l_GuiService_0 = game:GetService("GuiService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Parent_0 = script.Parent.Parent.Parent;
local l_Players_0 = game:GetService("Players");
local v4 = require(l_Parent_0.React);
local v5 = require(l_Parent_0.ReactRoblox);
local v6 = require(l_Parent_0.UIBlox);
local l_Images_0 = v6.App.ImageSet.Images;
local v8 = require(l_Parent_0.NotificationModalsManager);
local l_useState_0 = v4.useState;
local l_useCallback_0 = v4.useCallback;
local l_useEffect_0 = v4.useEffect;
local l_useRef_0 = v4.useRef;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v14 = game:DefineFastFlag("EnableConsoleAutoFocusForUEN", false);
local v15 = game:DefineFastFlag("NotificationsUpsellLocalPlayerFromServiceFix", false);
local l_InteractiveAlert_0 = v6.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v6.App.Button.Enum.ButtonType;
local v18 = require(l_Parent_0.HttpRequest);
local v19 = v18.config({
    requestFunction = v18.requestFunctions.HttpRbxApi
});
local v20 = require(script.Parent.Parent.Requests.FollowingsPostFollow);
local l_sendEventDeferred_0 = require(l_Parent_0.NotificationsCommon).sendEventDeferred;
local v22 = require(script.Parent.Parent.Analytics.ModalEventConstants);
local v23 = require(script.Parent.Parent.Util.RichTextEscape);
return function(v24) --[[ Line: 37 ]]
    -- upvalues: l_useLocalization_0 (copy), l_useCallback_0 (copy), l_sendEventDeferred_0 (copy), v22 (copy), v15 (copy), l_Players_0 (copy), v20 (copy), v19 (copy), v8 (copy), l_Images_0 (copy), l_useState_0 (copy), l_useRef_0 (copy), v14 (copy), l_useEffect_0 (copy), l_UserInputService_0 (copy), l_GuiService_0 (copy), v4 (copy), v5 (copy), l_InteractiveAlert_0 (copy), v23 (copy), l_ButtonType_0 (copy)
    local v25 = l_useLocalization_0({
        Cancel = "CommonUI.Controls.Action.Cancel", 
        Yes = "CommonUI.Controls.Action.Yes", 
        Heading = "Feature.Notifications.Heading.TurnOnNotifications", 
        ReceiveUpdates = "Feature.Notifications.Label.ReceiveActivityUpdates", 
        ReceiveUpdatesForExperience = "Feature.Notifications.Label.GetUpdatesFromExperience", 
        NotificationsEnabledForExperience = "Feature.Notifications.Response.NotificationsEnabledForExperience", 
        NotificationsEnabled = "Feature.Notifications.Response.NotificationsEnabled", 
        SomethingWentWrong = "Feature.Call.Error.Description.Generic"
    });
    local v26 = l_useCallback_0(function() --[[ Line: 50 ]]
        -- upvalues: l_sendEventDeferred_0 (ref), v22 (ref), v24 (copy)
        l_sendEventDeferred_0(v22.ModalContext, v22.OptInEventName, {
            [v22.ActionType] = v22.Clicked, 
            [v22.Button] = v22.Cancel, 
            [v22.UniverseId] = v24.ExperienceId
        });
        v24.CloseModal();
    end, {
        v24.CloseModal, 
        v24.ExperienceId
    });
    local v28 = l_useCallback_0(function() --[[ Line: 59 ]]
        -- upvalues: l_sendEventDeferred_0 (ref), v22 (ref), v24 (copy), v15 (ref), l_Players_0 (ref), v20 (ref), v19 (ref), v8 (ref), l_Images_0 (ref), v25 (copy)
        l_sendEventDeferred_0(v22.ModalContext, v22.OptInEventName, {
            [v22.ActionType] = v22.Clicked, 
            [v22.Button] = v22.Confirm, 
            [v22.UniverseId] = v24.ExperienceId
        });
        local v27 = if v15 then l_Players_0 and l_Players_0.LocalPlayer else game.Players.LocalPlayer;
        if v24.ExperienceId ~= "0" and v27 then
            l_sendEventDeferred_0(v22.ModalContext, v22.OptInEventName, {
                [v22.ActionType] = v22.BackendRequested, 
                [v22.UniverseId] = v24.ExperienceId
            });
            v20(v19, tostring(v27.UserId), (tostring(v24.ExperienceId))):andThen(function() --[[ Line: 74 ]]
                -- upvalues: l_sendEventDeferred_0 (ref), v22 (ref), v24 (ref), v8 (ref), l_Images_0 (ref), v25 (ref)
                l_sendEventDeferred_0(v22.ModalContext, v22.OptInEventName, {
                    [v22.ActionType] = v22.BackendSuccess, 
                    [v22.UniverseId] = v24.ExperienceId
                });
                v8.SetUIBloxToast({
                    iconImage = l_Images_0["icons/common/notificationOn"], 
                    toastTitle = if v24.ExperienceName then v25.NotificationsEnabledForExperience:gsub("{experienceName}", v24.ExperienceName) else v25.NotificationsEnabled
                });
            end, function() --[[ Line: 89 ]]
                -- upvalues: l_sendEventDeferred_0 (ref), v22 (ref), v24 (ref), v8 (ref), l_Images_0 (ref), v25 (ref)
                l_sendEventDeferred_0(v22.ModalContext, v22.OptInEventName, {
                    [v22.ActionType] = v22.BackendFailed, 
                    [v22.UniverseId] = v24.ExperienceId
                });
                v8.SetUIBloxToast({
                    iconImage = l_Images_0["icons/status/alert"], 
                    toastTitle = v25.SomethingWentWrong
                });
            end);
        end;
        v24.CloseModal();
    end, {
        v24.CloseModal, 
        v24.ExperienceId, 
        v25
    });
    local v29, v30 = l_useState_0(Vector2.new(800, 600));
    local v32 = l_useCallback_0(function(v31) --[[ Line: 111 ]]
        -- upvalues: v30 (copy)
        v30(v31.AbsoluteSize);
    end, {
        v30
    });
    local v33 = l_useRef_0(nil);
    if v14 then
        l_useEffect_0(function() --[[ Line: 117 ]]
            -- upvalues: l_UserInputService_0 (ref), v33 (copy), l_GuiService_0 (ref)
            if l_UserInputService_0.GamepadEnabled then
                task.delay(0.3, function() --[[ Line: 121 ]]
                    -- upvalues: v33 (ref), l_GuiService_0 (ref)
                    local v34 = v33.current and v33.current:FindFirstChild("Buttons", true);
                    local v35 = v34 and v34:FindFirstChild("2");
                    if v35 then
                        l_GuiService_0.SelectedCoreObject = v35;
                    end;
                end);
            end;
        end, {});
    end;
    return v4.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        ref = v33, 
        [v5.Change.AbsoluteSize] = v32
    }, {
        ConfirmationPrompt = v4.createElement(l_InteractiveAlert_0, {
            screenSize = v29, 
            title = v25.Heading, 
            bodyText = if v24.ExperienceName then string.gsub(v25.ReceiveUpdatesForExperience, "{experienceName}", "\n<b>" .. v23(v24.ExperienceName) .. "</b>") else v25.ReceiveUpdates, 
            richText = true, 
            buttonStackInfo = {
                buttons = {
                    {
                        props = {
                            onActivated = v26, 
                            text = v25.Cancel
                        }, 
                        isDefaultChild = true
                    }, 
                    {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        props = {
                            onActivated = v28, 
                            text = v25.Yes
                        }, 
                        isDefaultChild = false
                    }
                }
            }
        })
    });
end;