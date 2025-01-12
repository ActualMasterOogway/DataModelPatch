local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Packages.Rodux);
local v5 = require(l_CorePackages_0.Packages.RoactRodux);
local v6 = require(l_CorePackages_0.Packages.t);
local _ = require(l_CorePackages_0.Packages.UIBlox);
local v8 = require(script.Dependencies);
local l_Localization_0 = v8.Localization;
local v10 = require(v8.LocalizationProvider);
local v11 = require(v8.playerInterface);
local v12 = require(script.Resources.Constants);
local v13 = require(script.GlobalConfig);
local v14 = require(script.Reducers);
local v15 = require(script.Components.TrustAndSafetyApp);
local v16 = require(script.TrustAndSafetyAppPolicy);
local _ = require(script.Actions.OpenReportDialog);
local _ = require(script.Actions.OpenReportMenu);
local v19 = require(script.Actions.BeginReportFlow);
local v20 = require(script.Actions.SetVoiceReportingFlow);
local v21 = require(script.Thunks.IdentifyAvatars);
local v22 = require(script.Utility.SessionUtility);
local v23 = require(script.Utility.ScreenshotHookManager);
local v24 = require(script.Thunks.FetchPlaceInfo);
local v25 = require(script.Flags.GetFFlagEnableNewVoiceReportFlows);
local v26 = require(script.Flags.GetFFlagReportAnythingScreenshot);
local v40 = {
    getInstance = function(v27) --[[ Line: 37 ]] --[[ Name: getInstance ]]
        if not v27._initialized then
            v27:initialize();
            v27._initialized = true;
        end;
        return v27;
    end, 
    initialize = function(v28) --[[ Line: 46 ]] --[[ Name: initialize ]]
        -- upvalues: v13 (copy), v3 (copy), v24 (copy), v5 (copy), v16 (copy), v10 (copy), v15 (copy), l_CoreGui_0 (copy)
        if v13.propValidation then
            v3.setGlobalConfig({
                propValidation = true
            });
        end;
        if v13.elementTracing then
            v3.setGlobalConfig({
                elementTracing = true
            });
        end;
        v28.store = v28:createStore();
        v28.store:dispatch(v24(game.GameId));
        v28.localization = v28:createLocalization();
        v28.root = v3.createElement(v5.StoreProvider, {
            store = v28.store
        }, {
            PolicyProvider = v3.createElement(v16.Provider, {
                policy = {
                    v16.Mapper
                }
            }, {
                LocalizationProvider = v3.createElement(v10, {
                    localization = v28.localization
                }, {
                    TrustAndSafety = v3.createElement(v15)
                })
            })
        });
        v28.element = v3.mount(v28.root, l_CoreGui_0, "TrustAndSafety");
    end, 
    createStore = function(_) --[[ Line: 80 ]] --[[ Name: createStore ]]
        -- upvalues: v14 (copy), v4 (copy), v13 (copy)
        local l_v14_0 = v14;
        local v31 = {
            v4.thunkMiddleware
        };
        if v13.logStore then
            table.insert(v31, v4.loggerMiddleware);
        end;
        return v4.Store.new(l_v14_0, nil, v31);
    end, 
    createLocalization = function(_) --[[ Line: 91 ]] --[[ Name: createLocalization ]]
        -- upvalues: l_LocalizationService_0 (copy), l_Localization_0 (copy)
        local l_RobloxLocaleId_0 = l_LocalizationService_0.RobloxLocaleId;
        local v34 = l_Localization_0.new(l_RobloxLocaleId_0);
        l_LocalizationService_0:GetPropertyChangedSignal("RobloxLocaleId"):Connect(function() --[[ Line: 95 ]]
            -- upvalues: l_LocalizationService_0 (ref), v34 (copy)
            local l_RobloxLocaleId_1 = l_LocalizationService_0.RobloxLocaleId;
            v34:SetLocale(l_RobloxLocaleId_1);
        end);
        return v34;
    end, 
    openReportDialog = function(v36, v37, v38) --[[ Line: 103 ]] --[[ Name: openReportDialog ]]
        -- upvalues: v20 (copy), v25 (copy), v26 (copy), v21 (copy), v19 (copy)
        v36.store:dispatch(v20(v25()));
        if v26() then
            v36.store:dispatch(v21());
        end;
        v36.store:dispatch(v19(v37, v38));
    end, 
    openReportMenu = function(v39) --[[ Line: 111 ]] --[[ Name: openReportMenu ]]
        -- upvalues: v20 (copy), v25 (copy), v26 (copy), v21 (copy), v19 (copy)
        v39.store:dispatch(v20(v25()));
        if v26() then
            v39.store:dispatch(v21());
        end;
        v39.store:dispatch(v19());
    end
};
return {
    openReportDialogForPlayer = function(v41, v42) --[[ Line: 120 ]] --[[ Name: openReportDialogForPlayer ]]
        -- upvalues: v11 (copy), v6 (copy), v22 (copy), v40 (copy), v12 (copy)
        assert(v11(v41) and v6.instanceIsA("Player")(v41));
        v22.startAbuseReportSession(v42);
        v40:getInstance():openReportDialog(v12.ReportType.Player, v41);
    end, 
    openReportDialogForPlace = function(v43) --[[ Line: 125 ]] --[[ Name: openReportDialogForPlace ]]
        -- upvalues: v22 (copy), v40 (copy), v12 (copy)
        v22.startAbuseReportSession(v43);
        v40:getInstance():openReportDialog(v12.ReportType.Place);
    end, 
    openReportMenu = function(v44) --[[ Line: 129 ]] --[[ Name: openReportMenu ]]
        -- upvalues: v22 (copy), v40 (copy)
        v22.startAbuseReportSession(v44);
        v40:getInstance():openReportMenu();
    end, 
    setPreReportScreenshotHook = function(v45) --[[ Line: 133 ]] --[[ Name: setPreReportScreenshotHook ]]
        -- upvalues: v23 (copy)
        v23.setPreScreenshotHook(v45);
    end, 
    setPostReportScreenshotHook = function(v46) --[[ Line: 136 ]] --[[ Name: setPostReportScreenshotHook ]]
        -- upvalues: v23 (copy)
        v23.setPostScreenshotHook(v46);
    end
};