local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_CoreGui_0 = game:GetService("CoreGui");
local v3 = require(l_CorePackages_0.Packages.UIBlox);
local l_ButtonType_0 = v3.App.Button.Enum.ButtonType;
local l_InteractiveAlert_0 = v3.App.Dialog.Alert.InteractiveAlert;
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v7 = require(l_RobloxGui_0.Modules.RobloxTranslator);
local v8 = v3.App.ImageSet.Images["icons/controls/keys/xboxA"];
local v9 = require(l_CorePackages_0.Packages.Roact);
local v10 = require(l_CorePackages_0.Packages.RoactRodux);
local v11 = require(l_CorePackages_0.Packages.t);
local v12 = require(l_CorePackages_0.Workspace.Packages.InputType);
local l_getInputGroup_0 = require(l_CorePackages_0.Workspace.Packages.InputType).getInputGroup;
local l_Parent_0 = script.Parent.Parent;
local v15 = require(l_Parent_0.Thunks.CloseResultModal);
local l_Parent_1 = script.Parent.Parent;
local v17 = require(l_Parent_1.GetFFlagValidateDescription);
local v18 = v9.PureComponent:extend("ResultModal");
v18.validateProps = v11.strictInterface({
    screenSize = v11.Vector2, 
    resultModalType = v11.enum(Enum.PromptPublishAssetResult), 
    closeResultModal = v11.callback
});
local function _(v19) --[[ Line: 40 ]] --[[ Name: isGamepadInput ]]
    -- upvalues: l_getInputGroup_0 (copy), v12 (copy)
    return l_getInputGroup_0(v19) == v12.InputTypeConstants.Gamepad;
end;
v18.init = function(v21) --[[ Line: 45 ]] --[[ Name: init ]]
    -- upvalues: l_UserInputService_0 (copy), l_getInputGroup_0 (copy), v12 (copy)
    local v22 = {};
    local l_l_UserInputService_0_LastInputType_0 = l_UserInputService_0:GetLastInputType();
    v22.isGamepad = l_getInputGroup_0(l_l_UserInputService_0_LastInputType_0) == v12.InputTypeConstants.Gamepad;
    v21:setState(v22);
end;
v18.getLocalizedStringForResultPrompt = function(_, v25) --[[ Line: 51 ]] --[[ Name: getLocalizedStringForResultPrompt ]]
    -- upvalues: v7 (copy)
    if v25 == Enum.PromptPublishAssetResult.Success then
        return v7:FormatByKey("CoreScripts.PublishAssetPrompt.PublishSuccessMessage");
    elseif v25 == Enum.PromptPublishAssetResult.UploadFailed then
        return v7:FormatByKey("CoreScripts.PublishAssetPrompt.PublishFailed");
    elseif v25 == Enum.PromptPublishAssetResult.NoUserInput then
        return v7:FormatByKey("CoreScripts.PublishAssetPrompt.NoUserInput");
    else
        return v7:FormatByKey("CoreScripts.PublishAssetPrompt.UndefinedError", {
            RESULT_TYPE = tostring(v25)
        });
    end;
end;
v18.getLocalizedTitleForResultPrompt = function(_, v27) --[[ Line: 66 ]] --[[ Name: getLocalizedTitleForResultPrompt ]]
    -- upvalues: v7 (copy)
    if v27 == Enum.PromptPublishAssetResult.Success then
        return v7:FormatByKey("CoreScripts.PublishAssetPrompt.PublishSuccessTitle");
    else
        return v7:FormatByKey("CoreScripts.PublishAssetPrompt.PublishFailedTitle");
    end;
end;
v18.render = function(v28) --[[ Line: 74 ]] --[[ Name: render ]]
    -- upvalues: v9 (copy), l_InteractiveAlert_0 (copy), l_ButtonType_0 (copy), v17 (copy), v7 (copy), v8 (copy)
    return v9.createElement(l_InteractiveAlert_0, {
        title = v28:getLocalizedTitleForResultPrompt(v28.props.resultModalType), 
        bodyText = v28:getLocalizedStringForResultPrompt(v28.props.resultModalType), 
        screenSize = v28.props.screenSize, 
        buttonStackInfo = {
            buttons = {
                {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        onActivated = v28.props.closeResultModal, 
                        text = if v17() then v7:FormatByKey("CoreScripts.PublishAssetPrompt.ResultModalOk") else v7:FormatByKey("InGame.CommonUI.Button.Ok"), 
                        inputIcon = v28.state.isGamepad and v8 or nil
                    }
                }
            }
        }
    });
end;
return v10.connect(function(v29) --[[ Line: 96 ]] --[[ Name: mapStateToProps ]]
    return {
        resultModalType = v29.promptRequest.resultModalType
    };
end, function(v30) --[[ Line: 102 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v15 (copy)
    return {
        closeResultModal = function() --[[ Line: 104 ]] --[[ Name: closeResultModal ]]
            -- upvalues: v30 (copy), v15 (ref)
            return v30(v15);
        end
    };
end)(v18);