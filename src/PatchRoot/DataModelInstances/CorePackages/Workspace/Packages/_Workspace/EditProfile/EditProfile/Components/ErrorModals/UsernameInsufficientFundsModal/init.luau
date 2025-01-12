local l_script_FirstAncestor_0 = script:FindFirstAncestor("EditProfile");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local v4 = require(l_Parent_0.RoactUtils);
local v5 = require(l_Parent_0.NavigationRodux);
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_NavigateDown_0 = v5.Thunks.NavigateDown;
local l_InteractiveAlert_0 = v3.App.Dialog.Alert.InteractiveAlert;
local l_useScreenSize_0 = require(l_Parent_0.RobloxAppHooks).useScreenSize;
local v10 = require(l_script_FirstAncestor_0.Common.TextKeys);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_ButtonType_0 = v3.App.Button.Enum.ButtonType;
local l_useDispatch_0 = v4.Hooks.RoactRodux.useDispatch;
local v14 = utf8.char(57346);
return function(v15) --[[ Line: 25 ]] --[[ Name: EditDisplayNameErrorModal ]]
    -- upvalues: l_useScreenSize_0 (copy), l_useLocalization_0 (copy), v10 (copy), v14 (copy), l_useDispatch_0 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy), v2 (copy), l_InteractiveAlert_0 (copy), l_ButtonType_0 (copy)
    local v16 = l_useScreenSize_0();
    local v17 = v15.navigation.getParam("robux");
    local v18 = l_useLocalization_0({
        cancelButtonText = v10.CancelButtonText, 
        buy = v10.Buy, 
        insufficientFunds = v10.InsufficientFunds, 
        message = {
            v10.InsufficientFundsMessage; 
            icon = v14, 
            rbx = v17
        }
    });
    local function v19() --[[ Line: 35 ]] --[[ Name: onClose ]]
        -- upvalues: v15 (copy)
        v15.navigation.goBack();
    end;
    local v20 = l_useDispatch_0();
    local function v21() --[[ Line: 40 ]]
        -- upvalues: v20 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref)
        v20(l_NavigateDown_0({
            {
                name = l_AppPage_0.PurchaseRobux
            }
        }));
    end;
    return v2.createElement(l_InteractiveAlert_0, {
        screenSize = v16, 
        title = v18.insufficientFunds, 
        bodyText = v18.message, 
        buttonStackInfo = {
            buttons = {
                {
                    buttonType = l_ButtonType_0.Secondary, 
                    props = {
                        onActivated = v19, 
                        text = v18.cancelButtonText
                    }
                }, 
                {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        onActivated = v21, 
                        text = v18.buy
                    }
                }
            }
        }
    });
end;