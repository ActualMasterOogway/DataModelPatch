local l_script_FirstAncestor_0 = script:FindFirstAncestor("EditProfile");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local l_InteractiveAlert_0 = v3.App.Dialog.Alert.InteractiveAlert;
local l_useScreenSize_0 = require(l_Parent_0.RobloxAppHooks).useScreenSize;
local v6 = require(l_script_FirstAncestor_0.Common.TextKeys);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_ButtonType_0 = v3.App.Button.Enum.ButtonType;
local l_FFlagRealNamesInDisplayNameExperimentEnabled_0 = require(l_Parent_0.SharedFlags).FFlagRealNamesInDisplayNameExperimentEnabled;
local v10 = require(l_script_FirstAncestor_0.Hooks.useDisplayNameText);
return function(v11) --[[ Line: 19 ]] --[[ Name: EditDisplayNameErrorModal ]]
    -- upvalues: l_useScreenSize_0 (copy), l_FFlagRealNamesInDisplayNameExperimentEnabled_0 (copy), v10 (copy), l_useLocalization_0 (copy), v6 (copy), v2 (copy), l_InteractiveAlert_0 (copy), l_ButtonType_0 (copy)
    local v12 = l_useScreenSize_0();
    local v13 = nil;
    if l_FFlagRealNamesInDisplayNameExperimentEnabled_0 then
        v13 = v10();
    end;
    local v14 = l_useLocalization_0({
        title = if l_FFlagRealNamesInDisplayNameExperimentEnabled_0 then nil else v6.EditDisplayName, 
        description = if l_FFlagRealNamesInDisplayNameExperimentEnabled_0 then nil else v6.DisplayNameRecently, 
        OK = v6.OK
    });
    return v2.createElement(l_InteractiveAlert_0, {
        screenSize = v12, 
        title = if l_FFlagRealNamesInDisplayNameExperimentEnabled_0 then v13.displayNameEditMessage else v14.title, 
        bodyText = if l_FFlagRealNamesInDisplayNameExperimentEnabled_0 then v13.displayNameCoolDownMessage else v14.description, 
        buttonStackInfo = {
            buttons = {
                {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        onActivated = function() --[[ Line: 31 ]] --[[ Name: onClose ]]
                            -- upvalues: v11 (copy)
                            v11.navigation.goBack();
                        end, 
                        text = v14.OK
                    }
                }
            }
        }
    });
end;