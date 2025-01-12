local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_GuiService_0 = game:GetService("GuiService");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_IXPService_0 = game:GetService("IXPService");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_Localization_0 = require(l_CorePackages_0.Workspace.Packages.InExperienceLocales).Localization;
local l_LocalizationProvider_0 = require(l_CorePackages_0.Workspace.Packages.Localization).LocalizationProvider;
local l_DesignTokenProvider_0 = require(l_CorePackages_0.Workspace.Packages.Style).DesignTokenProvider;
local v9 = require(l_CorePackages_0.Workspace.Packages.CrossExperienceVoice);
local v10 = require(l_CorePackages_0.Packages.ReactSceneUnderstanding);
local v11 = require(l_CorePackages_0.Packages.Roact);
local v12 = require(l_CorePackages_0.Packages.Rodux);
local v13 = require(l_CorePackages_0.Packages.RoactRodux);
local l_Constants_0 = require(l_CorePackages_0.Packages.UIBlox).App.Style.Constants;
local l_UiModeStyleProvider_0 = require(l_CorePackages_0.Workspace.Packages.Style).UiModeStyleProvider;
local v16 = require(l_CorePackages_0.Workspace.Packages.Songbird);
local v17 = require(l_RobloxGui_0.Modules.VoiceChat.VoiceStateContext);
local v18 = require(l_RobloxGui_0.Modules.Settings.Utility);
local v19 = require(l_RobloxGui_0.Modules.TenFootInterface);
local v20 = require(l_RobloxGui_0.Modules.isNewInGameMenuEnabled);
local v21 = require(l_RobloxGui_0.Modules.Chrome.Enabled)();
local v22 = require(script.Constants);
local v23 = require(script.TokenMappers.MenuNavigationPromptTokenMapper);
local l_GetFFlagMountSceneAnalysisProvider_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagMountSceneAnalysisProvider;
local l_GetFFlagSongbirdUseReportAudioModal_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagSongbirdUseReportAudioModal;
if v21 and not v19:IsEnabled() then
    local l_l_GuiService_0_GuiInset_0, v27 = l_GuiService_0:GetGuiInset();
    l_GuiService_0:SetGlobalGuiInset(l_l_GuiService_0_GuiInset_0.X, v22.TopBarHeight, v27.X, v27.Y);
end;
local v28 = require(script.Components.TopBarApp);
local v29 = require(script.Reducer);
local v30 = require(script.TopBarAppPolicy);
local v31 = require(script.Actions.SetSmallTouchDevice);
local v32 = require(script.Actions.SetInspectMenuOpen);
local v33 = require(script.Actions.SetGamepadMenuOpen);
local v34 = require(script.Actions.SetGamepadNavigationDialogOpen);
local v35 = require(script.Actions.UpdateUnreadMessagesBadge);
local v36 = require(script.Thunks.GetCanChat);
local v37 = require(script.Thunks.GetGameName);
local v38 = require(script.registerSetCores);
local v39 = require(script.GlobalConfig);
local v40 = require(l_CorePackages_0.Packages.RoactAppExperiment);
local v41 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_FFlagAddMenuNavigationToggleDialog_0 = v41.FFlagAddMenuNavigationToggleDialog;
local v43 = require(script.Flags.FFlagGamepadNavigationDialogABTest);
local l_GetFFlagRemoveChromeRobloxGuiReferences_0 = v41.GetFFlagRemoveChromeRobloxGuiReferences;
local l_GetFFlagEnableCrossExpVoice_0 = v41.GetFFlagEnableCrossExpVoice;
local l_Component_0 = v9.Component;
local l_FTUX_0 = l_RobloxGui_0.Modules.FTUX;
local v48 = require(l_FTUX_0.Flags.GetFFlagEnableVRFTUXExperience);
local v49 = require(l_FTUX_0.Flags.GetFFlagDebugEnableVRFTUXExperienceInStudio);
local v50 = require(l_FTUX_0.Enums.PlatformEnum);
local v51 = require(l_FTUX_0.Utility.IsFTUXExperience);
local v52 = require(script.Parent.FTUX);
local l_isRunningInStudio_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).isRunningInStudio;
local v54 = {};
v54.__index = v54;
v54.new = function() --[[ Line: 85 ]] --[[ Name: new ]]
    -- upvalues: v54 (copy), v39 (copy), v11 (copy), v19 (copy), v21 (copy), l_GuiService_0 (copy), v22 (copy), v12 (copy), v29 (copy), v38 (copy), v36 (copy), v37 (copy), v49 (copy), l_isRunningInStudio_0 (copy), v52 (copy), v50 (copy), v48 (copy), v51 (copy), v20 (copy), l_RobloxGui_0 (copy), v31 (copy), v18 (copy), l_Constants_0 (copy), l_UiModeStyleProvider_0 (copy), v28 (copy), l_FFlagAddMenuNavigationToggleDialog_0 (copy), v43 (copy), l_DesignTokenProvider_0 (copy), v23 (copy), v13 (copy), v30 (copy), l_LocalizationProvider_0 (copy), l_Localization_0 (copy), l_LocalizationService_0 (copy), v40 (copy), l_IXPService_0 (copy), l_GetFFlagEnableCrossExpVoice_0 (copy), l_Component_0 (copy), l_GetFFlagMountSceneAnalysisProvider_0 (copy), v10 (copy), l_GetFFlagSongbirdUseReportAudioModal_0 (copy), v16 (copy), l_GetFFlagRemoveChromeRobloxGuiReferences_0 (copy), v17 (copy), l_CoreGui_0 (copy), v35 (copy)
    local v55 = setmetatable({}, v54);
    if v39.propValidation then
        v11.setGlobalConfig({
            propValidation = true
        });
    end;
    if v39.elementTracing then
        v11.setGlobalConfig({
            elementTracing = true
        });
    end;
    if not v19:IsEnabled() and not v21 then
        l_GuiService_0:SetGlobalGuiInset(0, v22.TopBarHeight, 0, 0);
    end;
    v55.store = v12.Store.new(v29, nil, {
        v12.thunkMiddleware
    });
    v38(v55.store);
    v55.store:dispatch(v36);
    v55.store:dispatch(v37);
    if v49() and l_isRunningInStudio_0() then
        v52.mountFtuxMenu(v50.QuestVR);
    end;
    if v48() and v51(v50.QuestVR) then
        v52.mountFtuxMenu(v50.QuestVR);
    end;
    if v20() then
        require(l_RobloxGui_0.Modules.InGameMenuInit).mountInGameMenu();
    end;
    coroutine.wrap(function() --[[ Line: 129 ]]
        -- upvalues: v55 (copy), v31 (ref), v18 (ref)
        v55.store:dispatch(v31(v18:IsSmallTouchScreen()));
    end)();
    local v56 = {
        themeName = l_Constants_0.ThemeName.Dark, 
        fontName = l_Constants_0.FontName.Gotham
    };
    local function v58(v57) --[[ Line: 138 ]] --[[ Name: wrapWithUiModeStyleProvider ]]
        -- upvalues: v11 (ref), l_UiModeStyleProvider_0 (ref), v56 (copy)
        return {
            UiModeStyleProvider = v11.createElement(l_UiModeStyleProvider_0, {
                style = v56
            }, v57)
        };
    end;
    local v59 = v11.createElement(v28);
    if l_FFlagAddMenuNavigationToggleDialog_0 or v43 then
        v59 = v11.createElement(l_DesignTokenProvider_0, {
            tokenMappers = {
                MenuNavigationPrompt = if v43 then v23 else nil
            }
        }, {
            TopBarApp = v59
        });
    end;
    v55.root = v11.createElement(v13.StoreProvider, {
        store = v55.store
    }, {
        PolicyProvider = v11.createElement(v30.Provider, {
            policy = {
                v30.Mapper
            }
        }, (v58({
            LocalizationProvider = v11.createElement(l_LocalizationProvider_0, {
                localization = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId)
            }, {
                ExperimentProvider = v11.createFragment({
                    RoactAppExperimentProvider = v11.createElement(v40.Provider, {
                        value = l_IXPService_0
                    }, {
                        TopBarApp = v59
                    }), 
                    CrossExperienceVoice = l_GetFFlagEnableCrossExpVoice_0() and v11.createElement(l_Component_0) or nil
                })
            })
        })))
    });
    if l_GetFFlagMountSceneAnalysisProvider_0() then
        v55.root = v11.createElement(v10.SceneAnalysisProvider, nil, v55.root);
    end;
    if l_GetFFlagSongbirdUseReportAudioModal_0() then
        v55.root = v11.createElement(v16.ReportAudioPopupContext.Provider, nil, v55.root);
    end;
    if l_GetFFlagRemoveChromeRobloxGuiReferences_0() then
        v55.root = v11.createElement(v17.Provider, nil, v55.root);
    end;
    v55.element = v11.mount(v55.root, l_CoreGui_0, "TopBar");
    game:GetService("TextChatService").MessageReceived:Connect(function() --[[ Line: 204 ]]
        -- upvalues: v55 (copy), v35 (ref)
        v55.store:dispatch(v35(1));
    end);
    if v43 then
        local l_UserInputService_0 = game:GetService("UserInputService");
        local v61 = nil;
        do
            local l_v61_0 = v61;
            local function v63() --[[ Line: 211 ]] --[[ Name: disconnectGamepadConnected ]]
                -- upvalues: l_v61_0 (ref)
                if l_v61_0 then
                    l_v61_0:Disconnect();
                    l_v61_0 = nil;
                end;
            end;
            if l_UserInputService_0:GetGamepadConnected(Enum.UserInputType.Gamepad1) then
                v55:setGamepadNavigationDialogOpen(true);
            else
                l_v61_0 = l_UserInputService_0.GamepadConnected:Connect(function() --[[ Line: 220 ]]
                    -- upvalues: v55 (copy), l_v61_0 (ref)
                    v55:setGamepadNavigationDialogOpen(true);
                    if l_v61_0 then
                        l_v61_0:Disconnect();
                        l_v61_0 = nil;
                    end;
                end);
            end;
            l_GuiService_0:GetPropertyChangedSignal("MenuIsOpen"):Connect(v63);
        end;
    end;
    return v55;
end;
v54.setInspectMenuOpen = function(v64, v65) --[[ Line: 232 ]] --[[ Name: setInspectMenuOpen ]]
    -- upvalues: v32 (copy)
    v64.store:dispatch(v32(v65));
end;
v54.setGamepadMenuOpen = function(v66, v67) --[[ Line: 236 ]] --[[ Name: setGamepadMenuOpen ]]
    -- upvalues: v33 (copy)
    v66.store:dispatch(v33(v67));
end;
v54.setGamepadNavigationDialogOpen = function(v68, v69) --[[ Line: 240 ]] --[[ Name: setGamepadNavigationDialogOpen ]]
    -- upvalues: v34 (copy)
    v68.store:dispatch(v34(v69));
end;
return v54.new();