local l_GuiService_0 = game:GetService("GuiService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local v3 = require(l_CorePackages_0.Packages.InGameMenuDependencies);
local l_Roact_0 = v3.Roact;
local l_RoactRodux_0 = v3.RoactRodux;
local l_t_0 = v3.t;
local l_Images_0 = v3.UIBlox.App.ImageSet.Images;
local l_Parent_0 = script.Parent.Parent;
local v9 = require(l_Parent_0.Localization.withLocalization);
local v10 = require(l_Parent_0.Actions.CloseNativeClosePrompt);
local v11 = require(l_Parent_0.Utility.LeaveGame);
local v12 = require(script.Parent.EducationalPopupDialog);
local v13 = require(l_Parent_0.Utility.SendAnalytics);
local l_l_GuiService_0_NotificationTypeList_0 = l_GuiService_0:GetNotificationTypeList();
local v15 = {
    EventContext = "educational_popup", 
    ConfirmName = "educational_confirmed", 
    CancelName = "educational_close_app", 
    DismissName = "educational_dismiss_prompt"
};
local v16 = l_Roact_0.PureComponent:extend("EducationalPopup");
v16.validateProps = l_t_0.strictInterface({
    screenSize = l_t_0.Vector2, 
    onDismiss = l_t_0.callback, 
    onConfirm = l_t_0.callback, 
    isClosingApp = l_t_0.boolean
});
v16.init = function(v17) --[[ Line: 39 ]] --[[ Name: init ]]
    -- upvalues: v13 (copy), v15 (copy), l_GuiService_0 (copy), l_l_GuiService_0_NotificationTypeList_0 (copy)
    v17.onCancel = function() --[[ Line: 40 ]]
        -- upvalues: v13 (ref), v15 (ref), l_GuiService_0 (ref), l_l_GuiService_0_NotificationTypeList_0 (ref)
        v13(v15.EventContext, v15.CancelName, {});
        l_GuiService_0:BroadcastNotification("", l_l_GuiService_0_NotificationTypeList_0.NATIVE_EXIT);
    end;
end;
v16.render = function(v18) --[[ Line: 46 ]] --[[ Name: render ]]
    -- upvalues: v9 (copy), l_Roact_0 (copy), v12 (copy), l_Images_0 (copy)
    return v9({
        title = "CoreScripts.InGameMenu.ExitModal.Title", 
        subtitle = "CoreScripts.InGameMenu.ExitModal.Subtitle", 
        bodyTextOpenMenu = "CoreScripts.InGameMenu.ExitModal.BodyTextOpenMenu", 
        bodyTextClickHome = "CoreScripts.InGameMenu.ExitModal.BodyTextClickHome", 
        actionExit = "CoreScripts.InGameMenu.ExitModal.ActionExit", 
        actionHome = "CoreScripts.InGameMenu.ExitModal.ActionHome"
    })(function(v19) --[[ Line: 54 ]]
        -- upvalues: l_Roact_0 (ref), v12 (ref), l_Images_0 (ref), v18 (copy)
        return l_Roact_0.createElement(v12, {
            bodyContents = {
                {
                    text = v19.bodyTextOpenMenu, 
                    isSystemMenuIcon = true
                }, 
                {
                    icon = l_Images_0["icons/menu/home_off"], 
                    text = v19.bodyTextClickHome
                }
            }, 
            cancelText = v19.actionExit, 
            confirmText = v19.actionHome, 
            titleBackgroundImageProps = {
                image = "rbxasset://textures/ui/LuaApp/graphic/Auth/GridBackground.jpg", 
                imageHeight = 200, 
                text = "<font face=\"GothamBlack\" size=\"42\">" .. v19.title .. "</font><font size=\"4\"><br /></font><br />" .. v19.subtitle
            }, 
            screenSize = v18.props.screenSize, 
            onDismiss = v18.props.onDismiss, 
            onCancel = v18.onCancel, 
            onConfirm = v18.props.onConfirm, 
            blurBackground = true, 
            visible = v18.props.isClosingApp
        });
    end);
end;
v16.didUpdate = function(v20) --[[ Line: 86 ]] --[[ Name: didUpdate ]]
    -- upvalues: l_GuiService_0 (copy)
    local l_isClosingApp_0 = v20.props.isClosingApp;
    l_GuiService_0:SetMenuIsOpen(l_isClosingApp_0, "EducationalPopup");
end;
return l_RoactRodux_0.UNSTABLE_connect2(function(v22, _) --[[ Line: 91 ]]
    return {
        isClosingApp = v22.nativeClosePrompt.closingApp, 
        screenSize = v22.screenSize
    };
end, function(v24) --[[ Line: 96 ]]
    -- upvalues: v10 (copy), l_RbxAnalyticsService_0 (copy), v13 (copy), v15 (copy), v11 (copy)
    return {
        onDismiss = function() --[[ Line: 98 ]] --[[ Name: onDismiss ]]
            -- upvalues: v24 (copy), v10 (ref), l_RbxAnalyticsService_0 (ref), v13 (ref), v15 (ref)
            v24(v10());
            l_RbxAnalyticsService_0:ReportCounter("EducationalPopup_Dismiss", 1);
            v13(v15.EventContext, v15.DismissName, {});
        end, 
        onConfirm = function() --[[ Line: 103 ]] --[[ Name: onConfirm ]]
            -- upvalues: l_RbxAnalyticsService_0 (ref), v13 (ref), v15 (ref), v11 (ref)
            l_RbxAnalyticsService_0:ReportCounter("EducationalPopup_Confirm", 1);
            v13(v15.EventContext, v15.ConfirmName, {});
            v11();
        end
    };
end)(v16);