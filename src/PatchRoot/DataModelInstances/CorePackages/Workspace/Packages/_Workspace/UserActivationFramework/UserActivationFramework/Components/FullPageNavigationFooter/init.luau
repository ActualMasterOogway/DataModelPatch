local l_script_FirstAncestor_0 = script:FindFirstAncestor("UserActivationFramework");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local l_ButtonStack_0 = v3.App.Button.ButtonStack;
local l_ButtonType_0 = v3.App.Button.Enum.ButtonType;
local _ = require(l_script_FirstAncestor_0.Types);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v8 = require(l_script_FirstAncestor_0.Context.FullPageActivationFrameworkContext);
local v9 = require(l_script_FirstAncestor_0.Enums.ActivationFrameworkContextAction);
local v10 = require(l_script_FirstAncestor_0.Enums.NavigationAction);
local v11 = require(l_Parent_0.AuthAnalytics);
local l_EventStreamConstants_0 = v11.EventStreamConstants;
local l_authButtonClick_0 = v11.Events.authButtonClick;
local _ = require(l_script_FirstAncestor_0.Enums.PayloadKey);
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
return function(v16) --[[ Line: 25 ]] --[[ Name: FullPageNavigationFooter ]]
    -- upvalues: v2 (copy), v8 (copy), l_useDesignTokens_0 (copy), l_useLocalization_0 (copy), v9 (copy), v10 (copy), l_ButtonType_0 (copy), l_authButtonClick_0 (copy), l_EventStreamConstants_0 (copy), l_ButtonStack_0 (copy)
    local v17 = v2.useContext(v8);
    local l_primaryButton_0 = v16.primaryButton;
    local l_secondaryButton_0 = v16.secondaryButton;
    local l_updateActivationWorkflowAndNavigate_0 = v16.updateActivationWorkflowAndNavigate;
    local l_ActivationFramework_0 = l_useDesignTokens_0().LuaApps.ActivationFramework;
    local v22 = {};
    if l_primaryButton_0 then
        v22.primaryText = l_primaryButton_0.buttonTextKey;
    end;
    if l_secondaryButton_0 then
        v22.secondaryText = l_secondaryButton_0.buttonTextKey;
    end;
    local v23 = l_useLocalization_0(v22);
    local function _(v24) --[[ Line: 47 ]]
        -- upvalues: v17 (copy), v9 (ref), l_updateActivationWorkflowAndNavigate_0 (copy), v10 (ref)
        return function() --[[ Line: 48 ]]
            -- upvalues: v24 (copy), v17 (ref), v9 (ref), l_updateActivationWorkflowAndNavigate_0 (ref), v10 (ref)
            if v24 and not v17.activationFrameworkState.isLoading then
                v17.dispatch({
                    type = v9.SetIsLoading, 
                    data = {
                        isLoading = true
                    }
                });
                local v25 = v24.onButtonClicked();
                if v25 ~= nil then
                    v17.dispatch({
                        type = v9.SetMergePayload, 
                        data = {
                            payloadTable = v25
                        }
                    });
                    l_updateActivationWorkflowAndNavigate_0(v10.Next);
                end;
                v17.dispatch({
                    type = v9.SetIsLoading, 
                    data = {
                        isLoading = false
                    }
                });
            end;
        end;
    end;
    local l_l_primaryButton_0_0 = l_primaryButton_0;
    local l_l_l_primaryButton_0_0_0 = l_l_primaryButton_0_0 --[[ copy: 11 -> 13 ]];
    local function v30() --[[ Line: 48 ]]
        -- upvalues: l_l_l_primaryButton_0_0_0 (copy), v17 (copy), v9 (ref), l_updateActivationWorkflowAndNavigate_0 (copy), v10 (ref)
        if l_l_l_primaryButton_0_0_0 and not v17.activationFrameworkState.isLoading then
            v17.dispatch({
                type = v9.SetIsLoading, 
                data = {
                    isLoading = true
                }
            });
            local v29 = l_l_l_primaryButton_0_0_0.onButtonClicked();
            if v29 ~= nil then
                v17.dispatch({
                    type = v9.SetMergePayload, 
                    data = {
                        payloadTable = v29
                    }
                });
                l_updateActivationWorkflowAndNavigate_0(v10.Next);
            end;
            v17.dispatch({
                type = v9.SetIsLoading, 
                data = {
                    isLoading = false
                }
            });
        end;
    end;
    local l_l_secondaryButton_0_0 = l_secondaryButton_0;
    local l_l_l_secondaryButton_0_0_0 = l_l_secondaryButton_0_0 --[[ copy: 12 -> 14 ]];
    l_l_primaryButton_0_0 = function() --[[ Line: 48 ]]
        -- upvalues: l_l_l_secondaryButton_0_0_0 (copy), v17 (copy), v9 (ref), l_updateActivationWorkflowAndNavigate_0 (copy), v10 (ref)
        if l_l_l_secondaryButton_0_0_0 and not v17.activationFrameworkState.isLoading then
            v17.dispatch({
                type = v9.SetIsLoading, 
                data = {
                    isLoading = true
                }
            });
            local v33 = l_l_l_secondaryButton_0_0_0.onButtonClicked();
            if v33 ~= nil then
                v17.dispatch({
                    type = v9.SetMergePayload, 
                    data = {
                        payloadTable = v33
                    }
                });
                l_updateActivationWorkflowAndNavigate_0(v10.Next);
            end;
            v17.dispatch({
                type = v9.SetIsLoading, 
                data = {
                    isLoading = false
                }
            });
        end;
    end;
    l_l_secondaryButton_0_0 = {};
    if l_secondaryButton_0 and l_secondaryButton_0.shouldShowButton then
        table.insert(l_l_secondaryButton_0_0, {
            buttonType = l_ButtonType_0.PrimarySystem, 
            props = {
                text = v23.secondaryText, 
                onActivated = function() --[[ Line: 90 ]] --[[ Name: onActivated ]]
                    -- upvalues: l_authButtonClick_0 (ref), v17 (copy), l_EventStreamConstants_0 (ref), l_l_primaryButton_0_0 (copy)
                    l_authButtonClick_0(v17.activationFrameworkState.namespace, l_EventStreamConstants_0.Button.SecondaryButton, v17.activationFrameworkState.currentState);
                    l_l_primaryButton_0_0();
                end, 
                isDisabled = not l_secondaryButton_0.isButtonEnabled
            }
        });
    end;
    if l_primaryButton_0 and l_primaryButton_0.shouldShowButton then
        table.insert(l_l_secondaryButton_0_0, {
            buttonType = l_ButtonType_0.PrimaryContextual, 
            props = {
                text = v23.primaryText, 
                onActivated = function() --[[ Line: 112 ]] --[[ Name: onActivated ]]
                    -- upvalues: l_authButtonClick_0 (ref), v17 (copy), l_EventStreamConstants_0 (ref), v30 (copy)
                    l_authButtonClick_0(v17.activationFrameworkState.namespace, l_EventStreamConstants_0.Button.PrimaryButton, v17.activationFrameworkState.currentState);
                    v30();
                end, 
                isDisabled = not l_primaryButton_0.isButtonEnabled
            }
        });
    end;
    return v2.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0
    }, {
        ButtonStack = v2.createElement(l_ButtonStack_0, {
            buttons = l_l_secondaryButton_0_0, 
            buttonHeight = l_ActivationFramework_0.footerButtonHeightPx, 
            marginBetween = l_ActivationFramework_0.footerButtonMarginBetweenPx, 
            forcedFillDirection = Enum.FillDirection.Vertical
        })
    });
end;