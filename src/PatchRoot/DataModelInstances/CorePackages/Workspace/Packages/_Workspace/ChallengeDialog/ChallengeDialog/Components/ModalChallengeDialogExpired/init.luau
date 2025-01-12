local l_script_FirstAncestor_0 = script:FindFirstAncestor("ChallengeDialog");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local v4 = require(l_Parent_0.RoactRodux);
local v5 = require(l_Parent_0.HttpRequest);
local l_NavigateDown_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateDown;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v9 = require(l_script_FirstAncestor_0.Common.FullPageModalWrapper);
local v10 = require(l_script_FirstAncestor_0.Common.Lock);
local v11 = require(l_script_FirstAncestor_0.Common.ModalTextComponent);
local v12 = require(l_script_FirstAncestor_0.Common.ModalButtonConfig);
local v13 = require(l_script_FirstAncestor_0.Common.ModalFooter);
local v14 = require(l_script_FirstAncestor_0.Enum.ChallengeDialogAction);
local v15 = require(l_script_FirstAncestor_0.Enum.ChallengeDialogType);
local v16 = require(l_script_FirstAncestor_0.Thunks.FinishDialog);
local v17 = require(l_script_FirstAncestor_0.Analytics.EventService);
local v18 = require(l_script_FirstAncestor_0.Common.ModalTextSizes);
local l_ButtonType_0 = v3.App.Button.Enum.ButtonType;
local v20 = v5.config({
    requestFunction = v5.requestFunctions.RequestInternal
});
local v21 = {
    okay = "Authentication.TwoStepVerification.Action.Okay", 
    header = "Authentication.TwoStepVerification.Header.LoginAttemptExpired", 
    loginExpired = "Authentication.TwoStepVerification.Label.LoginExpired", 
    helpMessage = "Authentication.TwoStepVerification.Label.NeedHelpMessage"
};
return v4.connect(function(_, _) --[[ Line: 107 ]]
    return {};
end, function(v24) --[[ Line: 109 ]]
    -- upvalues: l_NavigateDown_0 (copy), v16 (copy)
    return {
        navigateToPage = function(v25) --[[ Line: 111 ]] --[[ Name: navigateToPage ]]
            -- upvalues: v24 (copy), l_NavigateDown_0 (ref)
            return v24(l_NavigateDown_0(v25));
        end, 
        finishDialog = function(v26, v27, v28) --[[ Line: 114 ]] --[[ Name: finishDialog ]]
            -- upvalues: v24 (copy), v16 (ref)
            return v24(v16(v26, v27, v28));
        end
    };
end)(function(v29) --[[ Line: 36 ]]
    -- upvalues: v2 (copy), l_useLocalization_0 (copy), v21 (copy), v20 (copy), v14 (copy), v17 (copy), v15 (copy), v9 (copy), v10 (copy), v11 (copy), v12 (copy), l_ButtonType_0 (copy), v13 (copy), v18 (copy), l_AppPage_0 (copy)
    local v30, v31 = v2.useState(false);
    local v32 = l_useLocalization_0(v21);
    local function v33() --[[ Line: 40 ]]
        -- upvalues: v31 (copy), v29 (copy), v20 (ref), v14 (ref)
        v31(true);
        v29.finishDialog(v20, {
            type = v29.dialogItem.type, 
            typeInternalId = v29.dialogItem.typeInternalId
        }, v14.Deny):await();
        v31(false);
        v29.closeModal();
    end;
    local function v34() --[[ Line: 52 ]]
        -- upvalues: v17 (ref), v15 (ref), v29 (copy), v33 (copy)
        v17.sendDialogAbandonedEvent(v15.toRawValue(v15.DIALOG_TYPE_APPROVAL_2SV_LOGIN), v29.dialogItem.typeInternalId);
        v33();
    end;
    return v2.createElement(v9, {
        title = v32.header, 
        closeModal = v34, 
        makeBodyFragment = function(v35) --[[ Line: 63 ]] --[[ Name: makeBodyFragment ]]
            -- upvalues: v2 (ref), v10 (ref), v11 (ref), v32 (copy)
            return v2.createElement(v2.Fragment, nil, {
                Lock = v2.createElement(v10, {
                    layoutOrder = 1
                }), 
                ChangeYourPassword = v2.createElement(v11, {
                    layoutOrder = 2, 
                    contentWidth = v35, 
                    useBold = true, 
                    useEmphasis = true, 
                    text = v32.loginExpired
                })
            });
        end, 
        buttonConfig = v12({
            {
                isDisabled = v30, 
                isLoading = v30, 
                onActivated = v33, 
                text = v32.okay, 
                type = l_ButtonType_0.PrimarySystem
            }
        }), 
        footerContent = v13(function(v36) --[[ Line: 86 ]]
            -- upvalues: v2 (ref), v11 (ref), v32 (copy), v18 (ref), v29 (copy), l_AppPage_0 (ref)
            return v2.createElement(v11, {
                BackgroundTransparency = 0, 
                layoutOrder = 1, 
                text = v32.helpMessage, 
                contentWidth = v36, 
                size = v18.Footer, 
                onActivated = function() --[[ Line: 93 ]] --[[ Name: onActivated ]]
                    -- upvalues: v29 (ref), l_AppPage_0 (ref)
                    v29.navigateToPage({
                        name = l_AppPage_0.GenericWebPage, 
                        detail = "https://en.help.roblox.com/hc/en-us/articles/212459863-Add-2-Step-Verification-to-Your-Account", 
                        extraProps = {
                            title = ""
                        }
                    });
                end
            });
        end)
    });
end);