local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_GuiService_0 = game:GetService("GuiService");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v5 = require(l_CorePackages_0.Packages.InGameMenuDependencies);
local l_Roact_0 = v5.Roact;
local l_RoactRodux_0 = v5.RoactRodux;
local l_UIBlox_0 = v5.UIBlox;
local l_GetFFlagEnableUISoundAndHaptics_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableUISoundAndHaptics;
local l_FeedbackManagerInjectionContextProvider_0 = require(l_CorePackages_0.Workspace.Packages.InteractionFeedback).FeedbackManagerInjectionContextProvider;
local l_AppInteractionFeedbackProvider_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppInteractionFeedbackConfig).AppInteractionFeedbackProvider;
local l_Localization_0 = require(l_CorePackages_0.Workspace.Packages.InExperienceLocales).Localization;
local l_LocalizationProvider_0 = require(l_CorePackages_0.Workspace.Packages.Localization).LocalizationProvider;
local l_SelectionCursorProvider_0 = l_UIBlox_0.App.SelectionImage.SelectionCursorProvider;
local v15 = require(l_RobloxGui_0.Modules.Common.renderWithCoreScriptsStyleProvider);
local v16 = require(script.SetupFunctions.bindMenuActions);
local v17 = require(script.SetupFunctions.registerSetCores);
local v18 = require(script.SetupFunctions.requestGameNameAndDescription);
local v19 = require(script.createStore);
local v20 = require(script.Components.App);
local v21 = require(script.Components.Connection.FocusHandlerUtils.FocusHandlerContextProvider);
local v22 = require(l_RobloxGui_0.Modules.VoiceChat.initVoiceChatStore);
local v23 = require(l_RobloxGui_0.Modules.TrustAndSafety);
local v24 = require(script.Actions.SetLocaleId);
local v25 = require(script.Actions.SetInspectMenuEnabled);
local v26 = require(script.Actions.SetCurrentPage);
local v27 = require(script.Actions.SetScreenSize);
local v28 = require(script.Actions.SetMenuIconTooltipOpen);
local v29 = require(script.Actions.SetRespawning);
local v30 = require(script.Thunks.OpenMenu);
local v31 = require(script.Thunks.CloseMenu);
local v32 = require(script.InGameMenuPolicy);
local v33 = require(script.GlobalConfig);
local v34 = require(script.Resources.Constants);
local v35 = require(script.Flags.GetFFlagIGMGamepadSelectionHistory);
local l_BindableEvent_0 = Instance.new("BindableEvent");
local l_BindableEvent_1 = Instance.new("BindableEvent");
local v38 = v19();
return {
    mountInGameMenu = function() --[[ Line: 58 ]] --[[ Name: mountInGameMenu ]]
        -- upvalues: v17 (copy), v38 (copy), v16 (copy), v18 (copy), v33 (copy), l_Roact_0 (copy), l_BindableEvent_0 (copy), l_BindableEvent_1 (copy), l_Localization_0 (copy), l_LocalizationService_0 (copy), v24 (copy), v25 (copy), l_GuiService_0 (copy), v22 (copy), v15 (copy), l_LocalizationProvider_0 (copy), l_SelectionCursorProvider_0 (copy), v35 (copy), v21 (copy), v20 (copy), l_GetFFlagEnableUISoundAndHaptics_0 (copy), l_AppInteractionFeedbackProvider_0 (copy), l_FeedbackManagerInjectionContextProvider_0 (copy), v34 (copy), v27 (copy), l_RoactRodux_0 (copy), v32 (copy), l_CoreGui_0 (copy)
        v17(v38);
        v16(v38);
        v18(v38);
        if v33.propValidation then
            l_Roact_0.setGlobalConfig({
                propValidation = true
            });
        end;
        if v33.elementTracing then
            l_Roact_0.setGlobalConfig({
                elementTracing = true
            });
        end;
        v38.changed:connect(function(v39, v40) --[[ Line: 74 ]]
            -- upvalues: l_BindableEvent_0 (ref), l_BindableEvent_1 (ref)
            if v39.isMenuOpen ~= v40.isMenuOpen then
                l_BindableEvent_0:Fire(v39.isMenuOpen);
            end;
            local l_enabled_0 = v39.respawn.enabled;
            local l_enabled_1 = v40.respawn.enabled;
            local l_customCallback_0 = v39.respawn.customCallback;
            local l_customCallback_1 = v40.respawn.customCallback;
            if l_enabled_0 ~= l_enabled_1 and l_customCallback_0 ~= l_customCallback_1 then
                l_BindableEvent_1:Fire(l_enabled_0, l_customCallback_0);
            end;
        end);
        local v45 = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId);
        v38:dispatch(v24(l_LocalizationService_0.RobloxLocaleId));
        l_LocalizationService_0:GetPropertyChangedSignal("RobloxLocaleId"):Connect(function() --[[ Line: 92 ]]
            -- upvalues: v45 (copy), l_LocalizationService_0 (ref), v38 (ref), v24 (ref)
            v45:SetLocale(l_LocalizationService_0.RobloxLocaleId);
            v38:dispatch(v24(l_LocalizationService_0.RobloxLocaleId));
        end);
        v38:dispatch(v25(l_GuiService_0:GetInspectMenuEnabled()));
        l_GuiService_0.InspectMenuEnabledChangedSignal:Connect(function(v46) --[[ Line: 98 ]]
            -- upvalues: v38 (ref), v25 (ref)
            v38:dispatch(v25(v46));
        end);
        v22(v38);
        local v47 = v15({
            LocalizationProvider = l_Roact_0.createElement(l_LocalizationProvider_0, {
                localization = v45
            }, {
                CursorProvider = l_Roact_0.createElement(l_SelectionCursorProvider_0, {}, {
                    FocusHandlerContextProvider = v35() and l_Roact_0.createElement(v21, {}, {
                        InGameMenu = l_Roact_0.createElement(v20)
                    }) or nil, 
                    InGameMenu = not v35() and l_Roact_0.createElement(v20) or nil
                })
            })
        });
        if l_GetFFlagEnableUISoundAndHaptics_0() then
            v47 = l_Roact_0.createElement(l_AppInteractionFeedbackProvider_0, {}, {
                tree = l_Roact_0.createElement(l_FeedbackManagerInjectionContextProvider_0, nil, {
                    tree = v47
                })
            });
        end;
        local v49 = l_Roact_0.createElement("ScreenGui", {
            ResetOnSpawn = false, 
            IgnoreGuiInset = true, 
            DisplayOrder = v34.DisplayOrder.RootMenu, 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
            AutoLocalize = false, 
            [l_Roact_0.Change.AbsoluteSize] = function(v48) --[[ Line: 132 ]]
                -- upvalues: v38 (ref), v27 (ref)
                v38:dispatch(v27(v48.AbsoluteSize));
            end
        }, {
            StoreProvider = l_Roact_0.createElement(l_RoactRodux_0.StoreProvider, {
                store = v38
            }, {
                PolicyProvider = l_Roact_0.createElement(v32.Provider, {
                    policy = {
                        v32.Mapper
                    }
                }, {
                    ThemeProvider = v47
                })
            })
        });
        l_Roact_0.mount(v49, l_CoreGui_0, "InGameMenu");
    end, 
    openInGameMenu = function(v50) --[[ Line: 149 ]] --[[ Name: openInGameMenu ]]
        -- upvalues: v38 (copy), v30 (copy), v34 (copy)
        v38:dispatch(v30(v34.AnalyticsMenuOpenTypes.TopbarButton, v50));
    end, 
    closeInGameMenu = function() --[[ Line: 153 ]] --[[ Name: closeInGameMenu ]]
        -- upvalues: v31 (copy), v38 (copy)
        v31(v38);
    end, 
    openReportDialog = function(v51, v52) --[[ Line: 157 ]] --[[ Name: openReportDialog ]]
        -- upvalues: v38 (copy), v30 (copy), v34 (copy), v23 (copy)
        v38:dispatch(v30(v34.AnalyticsMenuOpenTypes.ReportAbuseTriggered, v34.ReportDialogKey));
        local v53 = if v52 ~= nil then v52 else v34.AnalyticsInGameMenuName;
        v23.openReportDialogForPlayer(v51, v53);
    end, 
    openGameSettingsPage = function() --[[ Line: 163 ]] --[[ Name: openGameSettingsPage ]]
        -- upvalues: v38 (copy), v30 (copy), v34 (copy), v26 (copy)
        v38:dispatch(v30(v34.AnalyticsMenuOpenTypes.SettingsTriggered));
        v38:dispatch(v26("GameSettings"));
    end, 
    openGameLeavePage = function() --[[ Line: 168 ]] --[[ Name: openGameLeavePage ]]
        -- upvalues: v38 (copy), v30 (copy), v34 (copy), v26 (copy)
        v38:dispatch(v30(v34.AnalyticsMenuOpenTypes.GamepadLeaveGame));
        v38:dispatch(v26(v34.LeaveGamePromptPageKey));
    end, 
    openCharacterResetPage = function() --[[ Line: 173 ]] --[[ Name: openCharacterResetPage ]]
        -- upvalues: v38 (copy), v30 (copy), v34 (copy), v26 (copy), v29 (copy)
        v38:dispatch(v30(v34.AnalyticsMenuOpenTypes.GamepadResetCharacter));
        v38:dispatch(v26(v34.MainPagePageKey));
        v38:dispatch(v29(true));
    end, 
    openPlayersPage = function() --[[ Line: 179 ]] --[[ Name: openPlayersPage ]]
        -- upvalues: v38 (copy), v30 (copy), v34 (copy), v26 (copy)
        v38:dispatch(v30(v34.AnalyticsMenuOpenTypes.PlayersTriggered));
        v38:dispatch(v26("Players"));
    end, 
    getOpenChangedEvent = function() --[[ Line: 184 ]] --[[ Name: getOpenChangedEvent ]]
        -- upvalues: l_BindableEvent_0 (copy)
        return l_BindableEvent_0;
    end, 
    getOpen = function() --[[ Line: 188 ]] --[[ Name: getOpen ]]
        -- upvalues: v38 (copy)
        return v38:getState().isMenuOpen;
    end, 
    getRespawnBehaviour = function() --[[ Line: 192 ]] --[[ Name: getRespawnBehaviour ]]
        -- upvalues: v38 (copy)
        local v54 = v38:getState();
        return v54.respawn.enabled, v54.respawn.customCallback;
    end, 
    getRespawnBehaviourChangedEvent = function() --[[ Line: 197 ]] --[[ Name: getRespawnBehaviourChangedEvent ]]
        -- upvalues: l_BindableEvent_1 (copy)
        return l_BindableEvent_1;
    end, 
    setMenuIconTooltipOpen = function(v55) --[[ Line: 201 ]] --[[ Name: setMenuIconTooltipOpen ]]
        -- upvalues: v38 (copy), v28 (copy)
        v38:dispatch(v28(v55));
    end
};