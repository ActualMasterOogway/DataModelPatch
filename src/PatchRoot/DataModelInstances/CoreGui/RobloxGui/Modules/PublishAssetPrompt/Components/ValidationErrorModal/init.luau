local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Packages.UIBlox);
local l_ButtonType_0 = v2.App.Button.Enum.ButtonType;
local l_InteractiveAlert_0 = v2.App.Dialog.Alert.InteractiveAlert;
local l_Overlay_0 = v2.App.Dialog.Overlay;
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v7 = require(l_RobloxGui_0.Modules.RobloxTranslator);
local v8 = v2.App.ImageSet.Images["icons/controls/keys/xboxA"];
local v9 = require(l_CorePackages_0.Workspace.Packages.RoactUtils);
local l_useIsGamepad_0 = v9.Hooks.useIsGamepad;
local l_useDispatch_0 = v9.Hooks.RoactRodux.useDispatch;
local v12 = require(l_CorePackages_0.Packages.React);
local l_Parent_0 = script.Parent.Parent;
local v14 = require(l_Parent_0.Actions.CloseOpenPrompt);
return function(v15) --[[ Line: 31 ]]
    -- upvalues: l_useIsGamepad_0 (copy), l_useDispatch_0 (copy), v14 (copy), v12 (copy), l_Overlay_0 (copy), l_InteractiveAlert_0 (copy), l_ButtonType_0 (copy), v7 (copy), v8 (copy)
    local v16 = l_useIsGamepad_0();
    local v17 = l_useDispatch_0();
    local function v18() --[[ Line: 35 ]]
        -- upvalues: v17 (copy), v14 (ref)
        v17(v14());
    end;
    return v12.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.fromScale(1, 1), 
        ZIndex = 3
    }, {
        Overlay = v12.createElement(l_Overlay_0, {
            showGradient = false, 
            ZIndex = 3
        }), 
        InteractiveAlertWrapper = v12.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(1, 1), 
            ZIndex = 4
        }, {
            InteractiveAlert = v12.createElement(l_InteractiveAlert_0, {
                title = "Something Went Wrong", 
                bodyText = "Your creation could not be created due to an error. A report has been sent to the developer of this experience.", 
                screenSize = v15.screenSize, 
                buttonStackInfo = {
                    buttons = {
                        {
                            buttonType = l_ButtonType_0.PrimarySystem, 
                            props = {
                                onActivated = v18, 
                                text = v7:FormatByKey("InGame.CommonUI.Button.Ok"), 
                                inputIcon = v16 and v8 or nil
                            }
                        }
                    }
                }
            })
        })
    });
end;