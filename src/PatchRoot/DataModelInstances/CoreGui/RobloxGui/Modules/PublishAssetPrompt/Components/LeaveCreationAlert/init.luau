local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Packages.UIBlox);
local l_ButtonType_0 = v2.App.Button.Enum.ButtonType;
local l_InteractiveAlert_0 = v2.App.Dialog.Alert.InteractiveAlert;
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v6 = require(l_RobloxGui_0.Modules.RobloxTranslator);
local v7 = require(l_CorePackages_0.Packages.React);
return function(v8) --[[ Line: 21 ]] --[[ Name: LeaveCreationAlert ]]
    -- upvalues: v7 (copy), l_InteractiveAlert_0 (copy), v6 (copy), l_ButtonType_0 (copy)
    return v7.createElement(l_InteractiveAlert_0, {
        title = v6:FormatByKey("CoreScripts.PublishAvatarPrompt.LeaveCreationTitle"), 
        bodyText = v6:FormatByKey("CoreScripts.PublishCommon.UnsavedWarning"), 
        buttonStackInfo = {
            buttons = {
                {
                    props = {
                        onActivated = v8.closePrompt, 
                        text = v6:FormatByKey("CoreScripts.PublishCommon.Leave")
                    }, 
                    isDefaultChild = false
                }, 
                {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        onActivated = v8.cancelClosePrompt, 
                        text = v6:FormatByKey("CoreScripts.PublishCommon.Stay")
                    }, 
                    isDefaultChild = true
                }
            }
        }, 
        position = UDim2.fromScale(0.5, 0.5), 
        screenSize = v8.screenSize
    });
end;