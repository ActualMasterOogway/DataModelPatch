local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_GuiService_0 = game:GetService("GuiService");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_default_0 = require(l_RobloxGui_0.Modules.VoiceChat.VoiceChatServiceManager).default;
local v7 = require(l_RobloxGui_0.Modules.VoiceChat.Constants);
local v8 = require(l_CorePackages_0.Packages.Roact);
local v9 = require(l_CorePackages_0.Packages.React);
local v10 = require(l_CorePackages_0.Packages.UIBlox);
local l_StyledTextLabel_0 = v10.App.Text.StyledTextLabel;
local l_Button_0 = v10.App.Button.Button;
local l_ButtonStack_0 = v10.App.Button.ButtonStack;
local l_ButtonType_0 = v10.App.Button.Enum.ButtonType;
local l_useStyle_0 = v10.Core.Style.useStyle;
local l_PhoneLegalDisclaimer_0 = require(l_CorePackages_0.Workspace.Packages.PhoneUpsell).PhoneLegalDisclaimer;
local l_InGameContainer_0 = require(l_CorePackages_0.Workspace.Packages.PhoneUpsell).InGameContainer;
local l_PostPhoneUpsellDisplayed_0 = require(l_CorePackages_0.Workspace.Packages.PhoneUpsell).Http.Requests.PostPhoneUpsellDisplayed;
local l_PhoneUpsellController_0 = require(l_CorePackages_0.Workspace.Packages.PhoneUpsell).PhoneUpsellController;
local l_Constants_0 = require(l_CorePackages_0.Workspace.Packages.PhoneUpsell).Constants;
local l_RoactNetworking_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).RoactNetworking;
local l_useAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).useAppPolicy;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local l_useRoactService_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useRoactService;
local l_useInputType_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.useInputType;
local l_InputTypeConstants_0 = require(l_CorePackages_0.Workspace.Packages.InputType).InputTypeConstants;
local l_useEventConnection_0 = require(l_CorePackages_0.Packages.ReactUtils).useEventConnection;
local l_getPlatformTarget_0 = require(l_CorePackages_0.Workspace.Packages.Analytics).getPlatformTarget;
local l_EventStreamConstants_0 = require(l_CorePackages_0.Workspace.Packages.AuthAnalytics).EventStreamConstants;
local v30 = require(l_RobloxGui_0.Modules.Settings.leaveGame);
local l_GetFFlagAddMorePhoneUpsellEvents_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagAddMorePhoneUpsellEvents;
l_RobloxGui_0:WaitForChild("Modules"):WaitForChild("TenFootInterface");
local l_Constants_1 = require(l_RobloxGui_0.Modules:WaitForChild("InGameMenu"):WaitForChild("Resources"):WaitForChild("Constants"));
local v33 = {
    Incomplete = "Incomplete", 
    Completed = "Completed", 
    CompletedAndClosed = "CompletedAndClosed"
};
local v34 = nil;
v34 = (function() --[[ Line: 57 ]] --[[ Name: Initialize ]]
    -- upvalues: l_RobloxGui_0 (copy), l_RbxAnalyticsService_0 (copy), l_Constants_1 (copy), l_useStyle_0 (copy), l_useLocalization_0 (copy), v7 (copy), l_useAppPolicy_0 (copy), v9 (copy), l_StyledTextLabel_0 (copy), l_Button_0 (copy), l_ButtonType_0 (copy), l_GetFFlagAddMorePhoneUpsellEvents_0 (copy), l_getPlatformTarget_0 (copy), l_EventStreamConstants_0 (copy), l_PhoneUpsellController_0 (copy), l_default_0 (copy), l_PhoneLegalDisclaimer_0 (copy), l_Constants_0 (copy), v33 (copy), l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), l_useInputType_0 (copy), l_InputTypeConstants_0 (copy), l_GuiService_0 (copy), l_ContextActionService_0 (copy), l_PostPhoneUpsellDisplayed_0 (copy), l_useEventConnection_0 (copy), l_ButtonStack_0 (copy), v30 (copy), l_InGameContainer_0 (copy), v8 (copy)
    local l_NewPage_0 = require(l_RobloxGui_0.Modules.Settings.SettingsPageFactory):CreateNewPage();
    l_NewPage_0.DontLeaveFunc = function(v36) --[[ Line: 61 ]]
        -- upvalues: l_NewPage_0 (copy), l_RbxAnalyticsService_0 (ref), l_Constants_1 (ref)
        if l_NewPage_0.HubRef then
            l_NewPage_0.HubRef:PopMenu(v36, true);
        end;
        l_RbxAnalyticsService_0:SetRBXEventStream(l_Constants_1.AnalyticsTargetName, l_Constants_1.AnalyticsInGameMenuName, l_Constants_1.AnalyticsLeaveGameName, {
            confirmed = l_Constants_1.AnalyticsCancelledName, 
            universeid = tostring(game.GameId), 
            source = l_Constants_1.AnalyticsLeaveGameSource
        });
    end;
    l_NewPage_0.DontLeaveFromHotkey = function(_, v38, v39) --[[ Line: 77 ]]
        -- upvalues: l_NewPage_0 (copy)
        if v38 == Enum.UserInputState.Begin then
            local v40 = true;
            if v39.UserInputType ~= Enum.UserInputType.Gamepad1 then
                v40 = true;
                if v39.UserInputType ~= Enum.UserInputType.Gamepad2 then
                    v40 = true;
                    if v39.UserInputType ~= Enum.UserInputType.Gamepad3 then
                        v40 = v39.UserInputType == Enum.UserInputType.Gamepad4;
                    end;
                end;
            end;
            l_NewPage_0.DontLeaveFunc(v40);
        end;
    end;
    l_NewPage_0.DontLeaveFromButton = function(v41) --[[ Line: 87 ]]
        -- upvalues: l_NewPage_0 (copy)
        l_NewPage_0.DontLeaveFunc(v41);
    end;
    l_NewPage_0.TabHeader = nil;
    l_NewPage_0.Page.Name = "LeaveGameUpsellPage";
    l_NewPage_0.ShouldShowBottomBar = false;
    l_NewPage_0.ShouldShowHubBar = false;
    l_NewPage_0.DisableTopPadding = true;
    l_NewPage_0.UpsellComponent = function(v42) --[[ Line: 100 ]]
        -- upvalues: l_NewPage_0 (copy), l_useStyle_0 (ref), l_useLocalization_0 (ref), v7 (ref), l_useAppPolicy_0 (ref), v9 (ref), l_StyledTextLabel_0 (ref), l_Button_0 (ref), l_ButtonType_0 (ref), l_GetFFlagAddMorePhoneUpsellEvents_0 (ref), l_RbxAnalyticsService_0 (ref), l_getPlatformTarget_0 (ref), l_EventStreamConstants_0 (ref), l_PhoneUpsellController_0 (ref), l_default_0 (ref), l_PhoneLegalDisclaimer_0 (ref), l_Constants_0 (ref)
        local l_upsellType_0 = l_NewPage_0.upsellType;
        local v44 = l_useStyle_0();
        local v45 = l_useLocalization_0({
            headerKey = l_upsellType_0 == v7.PHONE_UPSELL_VALUE_PROP.VoiceChat and "Feature.VerificationUpsell.Heading.UnlockVoiceChat" or "Feature.VerificationUpsell.Heading.DontLoseAccess", 
            bodyKey = l_upsellType_0 == v7.PHONE_UPSELL_VALUE_PROP.VoiceChat and "Feature.VerificationUpsell.Description.UnlockVoiceChatBody" or "Feature.VerificationUpsell.Description.RecoverAccountEasily", 
            voiceConsent = "Feature.VerificationUpsell.Description.VoiceLegalConsent2", 
            voiceDisclaimer = "Feature.VerificationUpsell.Description.VoiceLegalDisclaimer2", 
            button = "Feature.VerificationUpsell.Action.AddPhoneNumber", 
            termsOfUse = "Feature.VerificationUpsell.Action.SMSTerms", 
            privacyPolicy = "Feature.VerificationUpsell.Action.Privacy"
        });
        v45.voiceDisclaimer = v45.voiceDisclaimer:gsub("{buttonText}", v45.button);
        local v48 = l_useAppPolicy_0(function(v46) --[[ Line: 117 ]]
            -- upvalues: l_upsellType_0 (copy), v7 (ref)
            local v47 = false;
            if l_upsellType_0 == v7.PHONE_UPSELL_VALUE_PROP.VoiceChat then
                v47 = v46.RequireExplicitVoiceConsent();
            end;
            return v47;
        end);
        local v49, v50 = v9.useState(false);
        return v9.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            LayoutOrder = v42.LayoutOrder
        }, {
            ListLayout = v9.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 12)
            }), 
            Header = v9.createElement(l_StyledTextLabel_0, {
                text = v45.headerKey, 
                fontStyle = v44.Font.Header2, 
                colorStyle = v44.Theme.TextEmphasis, 
                layoutOrder = 1
            }), 
            Body = v9.createElement(l_StyledTextLabel_0, {
                text = v45.bodyKey, 
                textWrapped = true, 
                size = UDim2.new(1, 0, 0, 0), 
                automaticSize = Enum.AutomaticSize.Y, 
                fontStyle = v44.Font.Body, 
                lineHeight = 1.1, 
                colorStyle = v44.Theme.TextDefault, 
                layoutOrder = 2
            }), 
            Button = v9.createElement(l_Button_0, {
                buttonType = l_ButtonType_0.Secondary, 
                size = UDim2.new(1, 0, 0, v44.Tokens.Global.Size_600), 
                layoutOrder = 3, 
                text = v45.button, 
                onActivated = function() --[[ Line: 155 ]] --[[ Name: onActivated ]]
                    -- upvalues: l_NewPage_0 (ref), l_GetFFlagAddMorePhoneUpsellEvents_0 (ref), l_RbxAnalyticsService_0 (ref), l_getPlatformTarget_0 (ref), v42 (copy), l_EventStreamConstants_0 (ref), l_PhoneUpsellController_0 (ref), l_default_0 (ref), l_upsellType_0 (copy), v7 (ref)
                    l_NewPage_0.HubRef:SetVisibility(false, true);
                    if l_GetFFlagAddMorePhoneUpsellEvents_0() then
                        l_RbxAnalyticsService_0:SendEventDeferred(l_getPlatformTarget_0(), "verificationUpsell", "modalAction", {
                            origin = v42.origin, 
                            btn = l_EventStreamConstants_0.Button.Continue, 
                            section = v42.section
                        });
                    end;
                    l_PhoneUpsellController_0.openPhoneUpsell({
                        origin = v42.origin, 
                        eventContext = "verificationUpsell", 
                        onSuccessBeforeToast = function() --[[ Line: 167 ]] --[[ Name: onSuccessBeforeToast ]]
                            -- upvalues: l_default_0 (ref), v42 (ref), l_NewPage_0 (ref)
                            l_default_0:DisablePhoneVerificationUpsell();
                            v42.onUpsellComplete();
                            l_NewPage_0.HubRef:SetVisibility(true, false);
                            l_NewPage_0.HubRef:SwitchToPage(l_NewPage_0.HubRef.LeaveGameUpsellPage, true);
                        end, 
                        onSuccess = function() --[[ Line: 173 ]] --[[ Name: onSuccess ]]
                            -- upvalues: l_upsellType_0 (ref), v7 (ref), l_default_0 (ref), v42 (ref)
                            if l_upsellType_0 == v7.PHONE_UPSELL_VALUE_PROP.VoiceChat then
                                l_default_0:EnableVoice();
                                v42.setVoiceEnabled(true);
                            end;
                        end
                    });
                end, 
                isDisabled = v48 and not v49
            }), 
            PhoneLegalDisclaimer = v9.createElement(l_PhoneLegalDisclaimer_0, {
                legalText = if v48 then v45.voiceConsent else v45.voiceDisclaimer, 
                termsOfUse = v45.termsOfUse, 
                privacyPolicy = v45.privacyPolicy, 
                showLegalText = l_upsellType_0 == v7.PHONE_UPSELL_VALUE_PROP.VoiceChat, 
                showLegalButtons = true, 
                showLegalTextCheckbox = v48, 
                legalTextChecked = v49, 
                setLegalTextChecked = function() --[[ Line: 193 ]] --[[ Name: setLegalTextChecked ]]
                    -- upvalues: v50 (copy), v49 (copy)
                    v50(not v49);
                end, 
                onTermsOfUseClick = function() --[[ Line: 196 ]] --[[ Name: onTermsOfUseClick ]]
                    -- upvalues: l_GetFFlagAddMorePhoneUpsellEvents_0 (ref), l_RbxAnalyticsService_0 (ref), l_getPlatformTarget_0 (ref), v42 (copy), l_Constants_0 (ref)
                    if l_GetFFlagAddMorePhoneUpsellEvents_0() then
                        l_RbxAnalyticsService_0:SendEventDeferred(l_getPlatformTarget_0(), "verificationUpsell", "modalAction", {
                            origin = v42.origin, 
                            field = "termsOfService", 
                            section = v42.section
                        });
                    end;
                    v42.showWebpage(l_Constants_0.TERMS_OF_SERVICE_URL);
                end, 
                onPrivacyPolicyClick = function() --[[ Line: 207 ]] --[[ Name: onPrivacyPolicyClick ]]
                    -- upvalues: l_GetFFlagAddMorePhoneUpsellEvents_0 (ref), l_RbxAnalyticsService_0 (ref), l_getPlatformTarget_0 (ref), v42 (copy), l_Constants_0 (ref)
                    if l_GetFFlagAddMorePhoneUpsellEvents_0() then
                        l_RbxAnalyticsService_0:SendEventDeferred(l_getPlatformTarget_0(), "verificationUpsell", "modalAction", {
                            origin = v42.origin, 
                            field = "privacyPolicy", 
                            section = v42.section
                        });
                    end;
                    v42.showWebpage(l_Constants_0.PRIVACY_POLICY_URL);
                end, 
                LayoutOrder = 4
            })
        });
    end;
    l_NewPage_0.LeaveGameComponent = function(v51) --[[ Line: 223 ]]
        -- upvalues: l_useStyle_0 (ref), l_useLocalization_0 (ref), v9 (ref), v33 (ref), l_NewPage_0 (copy), v7 (ref), l_GetFFlagAddMorePhoneUpsellEvents_0 (ref), l_useRoactService_0 (ref), l_RoactNetworking_0 (ref), l_useInputType_0 (ref), l_InputTypeConstants_0 (ref), l_GuiService_0 (ref), l_ContextActionService_0 (ref), l_PostPhoneUpsellDisplayed_0 (ref), l_RbxAnalyticsService_0 (ref), l_getPlatformTarget_0 (ref), l_EventStreamConstants_0 (ref), l_useEventConnection_0 (ref), l_RobloxGui_0 (ref), l_ButtonStack_0 (ref), l_ButtonType_0 (ref), l_default_0 (ref), v30 (ref)
        local v52 = l_useStyle_0();
        local v53 = l_useLocalization_0({
            confirmLeave = "Feature.VerificationUpsell.Action.ConfirmLeave", 
            dontLeave = "Feature.VerificationUpsell.Action.DontLeave", 
            returnWithVoice = "Feature.VerificationUpsell.Action.ReturnWithVoice"
        });
        local v54, v55 = v9.useState(v33.Incomplete);
        local v56 = v54 == v33.Incomplete;
        local l_upsellType_1 = l_NewPage_0.upsellType;
        local v58 = l_upsellType_1 == v7.PHONE_UPSELL_VALUE_PROP.VoiceChat and "exitConfirmationScreenVoice" or "exitConfirmationScreenSecurity";
        local v59 = if l_GetFFlagAddMorePhoneUpsellEvents_0() then v54 == v33.Incomplete and "entry" or "verifyPhoneSuccess" else nil;
        local v60 = v9.useRef(nil);
        local v61, v62 = v9.useState(false);
        local v63 = l_useRoactService_0(l_RoactNetworking_0);
        local v64 = l_useInputType_0();
        local function v66() --[[ Line: 246 ]]
            -- upvalues: v64 (copy), l_InputTypeConstants_0 (ref), l_GuiService_0 (ref), v60 (copy), l_ContextActionService_0 (ref), l_NewPage_0 (ref), l_PostPhoneUpsellDisplayed_0 (ref), v63 (copy), v7 (ref), l_GetFFlagAddMorePhoneUpsellEvents_0 (ref), l_RbxAnalyticsService_0 (ref), l_getPlatformTarget_0 (ref), v51 (copy), l_EventStreamConstants_0 (ref)
            if v64 ~= l_InputTypeConstants_0.Touch then
                l_GuiService_0.SelectedCoreObject = v60.current;
            end;
            l_ContextActionService_0:BindCoreAction("LeaveGameCancelAction", l_NewPage_0.DontLeaveFromHotkey, false, Enum.KeyCode.ButtonB);
            if not l_NewPage_0.postSent then
                l_PostPhoneUpsellDisplayed_0(v63, v7.EXIT_CONFIRMATION_PHONE_UPSELL_IXP_LAYER, os.time(), true, true):catch(function(_) --[[ Line: 265 ]]

                end);
                if l_GetFFlagAddMorePhoneUpsellEvents_0() then
                    l_RbxAnalyticsService_0:SendEventDeferred(l_getPlatformTarget_0(), "verificationUpsell", "modalAction", {
                        origin = v51.origin, 
                        aType = l_EventStreamConstants_0.ActionType.Shown, 
                        section = v51.section
                    });
                end;
                l_NewPage_0.postSent = true;
            end;
        end;
        local function v67() --[[ Line: 280 ]]
            -- upvalues: l_ContextActionService_0 (ref), v54 (copy), v33 (ref), v55 (copy)
            l_ContextActionService_0:UnbindCoreAction("LeaveGameCancelAction");
            if v54 == v33.Completed then
                v55(v33.CompletedAndClosed);
            end;
        end;
        l_useEventConnection_0(l_NewPage_0.Displayed.Event, v66);
        l_useEventConnection_0(l_NewPage_0.Hidden.Event, v67);
        local v68 = (not (l_RobloxGui_0.AbsoluteSize.Y >= 500) or l_RobloxGui_0.AbsoluteSize.X < 500) and 0 or 200;
        return v9.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 0), 
            Position = UDim2.new(0, 0, 0, v68), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1
        }, {
            ListLayout = v9.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            LeaveGame = v9.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 0), 
                BackgroundTransparency = 1, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                LayoutOrder = 1
            }, {
                ListLayout = v9.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    Padding = UDim.new(0, v52.Tokens.Global.Space_300), 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                LeaveGameButtons = v9.createElement(l_ButtonStack_0, {
                    buttons = {
                        {
                            buttonType = l_ButtonType_0.PrimarySystem, 
                            isDefaultChild = true, 
                            props = {
                                layoutOrder = 1, 
                                text = v53.confirmLeave, 
                                onActivated = function() --[[ Line: 324 ]] --[[ Name: onActivated ]]
                                    -- upvalues: v61 (copy), v54 (copy), v33 (ref), l_upsellType_1 (copy), v7 (ref), l_default_0 (ref), v62 (copy), l_GetFFlagAddMorePhoneUpsellEvents_0 (ref), l_RbxAnalyticsService_0 (ref), l_getPlatformTarget_0 (ref), v58 (copy), v59 (copy), v30 (ref)
                                    if not v61 and (v54 == v33.Completed or v54 == v33.CompletedAndClosed) and l_upsellType_1 == v7.PHONE_UPSELL_VALUE_PROP.VoiceChat then
                                        l_default_0:EnableVoice();
                                        v62(true);
                                    end;
                                    if l_GetFFlagAddMorePhoneUpsellEvents_0() then
                                        l_RbxAnalyticsService_0:SendEventDeferred(l_getPlatformTarget_0(), "verificationUpsell", "formInteraction", {
                                            origin = v58, 
                                            btn = "confirmLeave", 
                                            section = v59
                                        });
                                    end;
                                    v30(false);
                                end, 
                                buttonRef = v60
                            }
                        }, 
                        {
                            buttonType = l_ButtonType_0.Secondary, 
                            props = {
                                layoutOrder = 2, 
                                text = if v54 == v33.Completed and l_upsellType_1 == v7.PHONE_UPSELL_VALUE_PROP.VoiceChat then v53.returnWithVoice else v53.dontLeave, 
                                onActivated = function() --[[ Line: 355 ]] --[[ Name: onActivated ]]
                                    -- upvalues: l_GetFFlagAddMorePhoneUpsellEvents_0 (ref), v54 (copy), v33 (ref), l_upsellType_1 (copy), v7 (ref), l_RbxAnalyticsService_0 (ref), l_getPlatformTarget_0 (ref), v58 (copy), v59 (copy), l_EventStreamConstants_0 (ref), l_NewPage_0 (ref)
                                    if l_GetFFlagAddMorePhoneUpsellEvents_0() then
                                        if v54 == v33.Completed and l_upsellType_1 == v7.PHONE_UPSELL_VALUE_PROP.VoiceChat then
                                            l_RbxAnalyticsService_0:SendEventDeferred(l_getPlatformTarget_0(), "verificationUpsell", "formInteraction", {
                                                origin = v58, 
                                                btn = "returnWithVoice", 
                                                section = v59
                                            });
                                        elseif v54 == v33.Incomplete then
                                            l_RbxAnalyticsService_0:SendEventDeferred(l_getPlatformTarget_0(), "verificationUpsell", "modalAction", {
                                                origin = v58, 
                                                aType = l_EventStreamConstants_0.ActionType.Dismiss, 
                                                section = v59
                                            });
                                        end;
                                    end;
                                    l_NewPage_0.DontLeaveFromButton();
                                end
                            }
                        }
                    }, 
                    buttonHeight = v52.Tokens.Global.Size_600, 
                    disableGamepadRefs = true, 
                    isRoactGamepadEnabled = false
                })
            }), 
            TopSpacer = v9.createElement("Frame", {
                BackgroundTransparency = 1, 
                LayoutOrder = 2, 
                Size = UDim2.new(1, 0, 0, v52.Tokens.Global.Space_300)
            }), 
            UpsellComponents = if v56 then v9.createElement(v9.Fragment, {}, {
                Divider = v9.createElement("Frame", {
                    LayoutOrder = 3, 
                    BackgroundColor3 = v52.Tokens.Semantic.Color.Common.Divider.Color3, 
                    BackgroundTransparency = v52.Tokens.Semantic.Color.Common.Divider.Transparency, 
                    BorderSizePixel = 0, 
                    Size = UDim2.new(1, 0, 0, 1)
                }), 
                BottomSpacer = v9.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    LayoutOrder = 4, 
                    Size = UDim2.new(1, 0, 0, v52.Tokens.Global.Space_300)
                }), 
                Upsell = v9.createElement(l_NewPage_0.UpsellComponent, {
                    origin = v58, 
                    section = v59, 
                    LayoutOrder = 5, 
                    showWebpage = v51.showWebpage, 
                    onUpsellComplete = function() --[[ Line: 414 ]] --[[ Name: onUpsellComplete ]]
                        -- upvalues: v55 (copy), v33 (ref)
                        v55(v33.Completed);
                    end, 
                    setVoiceEnabled = v62
                })
            }) else nil
        });
    end;
    local v69 = v9.createElement(l_InGameContainer_0, {}, v9.createElement(l_NewPage_0.LeaveGameComponent, {
        showWebpage = function() --[[ Line: 427 ]] --[[ Name: showWebpage ]]

        end
    }, {}));
    l_NewPage_0.handle = v8.mount(v69, l_NewPage_0.Page, "LeaveGameUpsell");
    l_NewPage_0.Page.Size = UDim2.new(1, 0, 0, 0);
    l_NewPage_0.Page.AutomaticSize = Enum.AutomaticSize.Y;
    return l_NewPage_0;
end)();
v34.SetUpsellProp = function(v70, v71) --[[ Line: 441 ]] --[[ Name: SetUpsellProp ]]
    -- upvalues: v7 (copy), v8 (copy), v9 (copy), l_InGameContainer_0 (copy)
    if v71 == v7.PHONE_UPSELL_VALUE_PROP.None then
        return;
    else
        v70.upsellType = v71;
        v70.handle = v8.update(v70.handle, v9.createElement(l_InGameContainer_0, {}, v9.createElement(v70.LeaveGameComponent, {
            showWebpage = function() --[[ Line: 454 ]] --[[ Name: showWebpage ]]

            end
        }, {})));
        return;
    end;
end;
return v34;