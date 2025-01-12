local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_CaptureService_0 = game:GetService("CaptureService");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_NotificationService_0 = game:GetService("NotificationService");
local l_Players_0 = game:GetService("Players");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_RobloxReplicatedStorage_0 = game:GetService("RobloxReplicatedStorage");
local l_StarterGui_0 = game:GetService("StarterGui");
local v10 = require(l_Parent_1.AppCommonLib);
local v11 = require(l_Parent_1.CapturesCommon);
local v12 = require(l_Parent_1.Dash);
local l_IXPServiceWrapper_0 = require(l_Parent_1.IXPServiceWrapper).IXPServiceWrapper;
local l_Localization_0 = require(l_Parent_1.RobloxAppLocales).Localization;
local l_LocalizationProvider_0 = require(l_Parent_1.Localization).LocalizationProvider;
local v16 = require(l_Parent_1.React);
local v17 = require(l_Parent_1.Roact);
local v18 = require(l_Parent_1.RoactRodux);
local v19 = require(l_Parent_1.Rodux);
local v20 = require(l_Parent_1.SocialStopwatch);
local v21 = require(l_Parent_1.Style);
local l_Signal_0 = v10.Signal;
local l_StyleProviderWithDefaultTheme_0 = v21.StyleProviderWithDefaultTheme;
local v24 = require(l_Parent_0.Event.Flags.FFlagCapturesAddShouldForceDisableKey);
local l_FFlagCapturesPostEnabledForAll_0 = require(l_Parent_1.SharedFlags).FFlagCapturesPostEnabledForAll;
local l_FFlagEnableOnPlatformSharingExperiment_0 = require(l_Parent_1.SharedFlags).FFlagEnableOnPlatformSharingExperiment;
local v27 = require(l_Parent_0.Flags.FStringOnPlatformSharingEnabledIXPTreatmentKey);
local l_FStringSocialCaptureTakenIXPLayer_0 = require(l_Parent_1.SharedFlags).FStringSocialCaptureTakenIXPLayer;
local v29 = require(l_Parent_0.Analytics.AnalyticsService);
local v30 = require(l_Parent_0.Components.CaptureManager.CaptureManagerScreen);
local v31 = require(l_Parent_0.Components.CoreUI.CaptureOverlay);
local v32 = require(l_Parent_0.Actions.CapturesActivated);
local v33 = require(l_Parent_0.Context.CapturesContext);
local v34 = require(l_Parent_0.Actions.CapturesCoreGuiDisabled);
local v35 = require(l_Parent_0.Actions.CapturesCoreGuiEnabled);
local v36 = require(l_Parent_0.Components.CoreUI.CapturesCoreUI);
local v37 = require(l_Parent_0.Actions.CapturesDeactivated);
local v38 = require(l_Parent_0.Components.CaptureService.CaptureServicePrompts);
local v39 = require(l_Parent_0.Components.CoreUI.CapturesPage);
local v40 = require(l_Parent_0.App.CapturesPolicy);
local v41 = require(l_Parent_0.Enums.CapturesToastType);
local v42 = require(l_Parent_0.Components.CapturesCarousel.CarouselScreen);
local v43 = require(l_Parent_0.Components.Composer.ComposerScreen);
local v44 = require(l_Parent_0.Constants);
local v45 = require(l_Parent_0.Analytics.EventNames);
local v46 = require(l_Parent_0.Utils.getDecodedJSON);
local v47 = require(l_Parent_0.Utils.getIsCapturePostable);
local v48 = require(l_Parent_0.Utils.getLocalUserId);
local v49 = require(l_Parent_0.Utils.getUserIdsFromString);
local v50 = require(l_Parent_0.installReducer);
local v51 = require(l_Parent_0.Actions.MenuClosed);
local v52 = require(l_Parent_0.Actions.MenuOpened);
local v53 = require(l_Parent_0.App.Networking);
local v54 = require(l_Parent_0.Utils.onToggleActivation);
local l_onViewportSizeChanged_0 = v11.Utils.onViewportSizeChanged;
local v56 = require(l_Parent_0.Enums.PostCreationNotificationType);
local v57 = require(l_Parent_0.Thunks.RetrieveCaptures);
local v58 = require(l_Parent_0.Event.Utils.ScreenshotsEventConfiguration);
local v59 = require(l_Parent_0.installReducer.ScreenSize);
local v60 = require(l_Parent_0.Actions.ScreenSizeChanged);
local v61 = require(l_Parent_0.installReducer.ServerType);
local v62 = require(l_Parent_0.Actions.ServerTypeDetected);
local v63 = require(l_Parent_0.Analytics.setupFireEvent);
local v64 = require(l_Parent_0.Thunks.TakeCapture);
local v65 = require(l_Parent_0.Actions.ToastTriggered);
local v66 = require(l_Parent_0.Enums.TriggerSourceType);
local _ = require(l_Parent_0.Types);
return {
    createApp = function(v68) --[[ Line: 105 ]] --[[ Name: createApp ]]
        -- upvalues: v12 (copy), v29 (copy), l_AppStorageService_0 (copy), l_CaptureService_0 (copy), l_LocalizationService_0 (copy), l_NotificationService_0 (copy), l_Players_0 (copy), l_RbxAnalyticsService_0 (copy), l_RobloxReplicatedStorage_0 (copy), l_StarterGui_0 (copy), v63 (copy), v44 (copy), v48 (copy), v19 (copy), v50 (copy), v53 (copy), v59 (copy), v61 (copy), v57 (copy), l_FFlagCapturesPostEnabledForAll_0 (copy), l_FFlagEnableOnPlatformSharingExperiment_0 (copy), l_IXPServiceWrapper_0 (copy), l_FStringSocialCaptureTakenIXPLayer_0 (copy), v27 (copy), v66 (copy), v20 (copy), v45 (copy), v40 (copy), v47 (copy), v65 (copy), v41 (copy), v49 (copy), v32 (copy), v37 (copy), v24 (copy), v58 (copy), v46 (copy), v56 (copy), v62 (copy), v51 (copy), v52 (copy), v64 (copy), v35 (copy), v34 (copy), l_Signal_0 (copy), l_onViewportSizeChanged_0 (copy), v60 (copy), v54 (copy), v17 (copy), v16 (copy), v18 (copy), l_StyleProviderWithDefaultTheme_0 (copy), l_LocalizationProvider_0 (copy), l_Localization_0 (copy), v33 (copy), v30 (copy), v43 (copy), v31 (copy), v42 (copy), v38 (copy), v36 (copy), v39 (copy)
        local v69 = {};
        local v70 = v12.join({
            AnalyticsService = v29, 
            AppStorageService = l_AppStorageService_0, 
            CaptureService = l_CaptureService_0, 
            LocalizationService = l_LocalizationService_0, 
            NotificationService = l_NotificationService_0, 
            Players = l_Players_0, 
            RbxAnalyticsService = l_RbxAnalyticsService_0, 
            RobloxReplicatedStorage = l_RobloxReplicatedStorage_0, 
            StarterGui = l_StarterGui_0
        }, v68);
        local v71 = v63({
            analytics = v70.AnalyticsService, 
            infoForAllEvents = {
                isUnder13 = if v70.Players.LocalPlayer then v70.Players.LocalPlayer:GetUnder13() else nil, 
                pid = tostring(game.PlaceId), 
                source = v44.AnalyticsSource, 
                uid = v48(v70.Players)
            }
        });
        local v72 = v19.combineReducers({
            [v44.RoduxKey] = v50(), 
            NetworkStatus = v53.RoduxNetworking.installReducer(), 
            ScreenSize = v59, 
            ServerType = v61, 
            ShareLinks = v53.RoduxShareLinks.installReducer()
        });
        v69._store = v19.Store.new(v72, {}, {
            v19.thunkMiddleware
        });
        v69._store:dispatch(v57());
        local function v74() --[[ Line: 142 ]] --[[ Name: waitForFlashOverlay ]]
            -- upvalues: v69 (copy), v44 (ref)
            if not v69._store:getState()[v44.RoduxKey].IsOverlayFlashActive then
                return;
            else
                local v73 = tick();
                while v69._store:getState()[v44.RoduxKey].IsOverlayFlashActive and tick() - v73 <= 1 do
                    task.wait();
                end;
                return;
            end;
        end;
        v69.isOnPlatformSharingVisibleToUser = l_FFlagCapturesPostEnabledForAll_0;
        task.spawn(function() --[[ Line: 159 ]]
            -- upvalues: l_FFlagEnableOnPlatformSharingExperiment_0 (ref), l_FFlagCapturesPostEnabledForAll_0 (ref), v48 (ref), v70 (copy), l_IXPServiceWrapper_0 (ref), l_FStringSocialCaptureTakenIXPLayer_0 (ref), v69 (copy), v27 (ref)
            if not l_FFlagEnableOnPlatformSharingExperiment_0 or l_FFlagCapturesPostEnabledForAll_0 then
                return;
            else
                local v75 = v48(v70.Players);
                if not v75 then
                    return;
                else
                    local v76 = tonumber(v75);
                    if not v76 then
                        return;
                    else
                        l_IXPServiceWrapper_0:InitializeAsync(v76, l_FStringSocialCaptureTakenIXPLayer_0);
                        local l_l_IXPServiceWrapper_0_LayerData_0 = l_IXPServiceWrapper_0:GetLayerData(l_FStringSocialCaptureTakenIXPLayer_0);
                        if not l_l_IXPServiceWrapper_0_LayerData_0 then
                            return;
                        else
                            v69.isOnPlatformSharingVisibleToUser = l_l_IXPServiceWrapper_0_LayerData_0[v27] or false;
                            return;
                        end;
                    end;
                end;
            end;
        end);
        v70.CaptureService.CaptureSavedInternal:Connect(function(v78, v79) --[[ Line: 184 ]]
            -- upvalues: v66 (ref), v20 (ref), v71 (copy), v45 (ref), v69 (copy), v57 (ref), v74 (copy), v40 (ref), v47 (ref), v65 (ref), v41 (ref)
            if v79 == v66.UserSave then
                local v80 = v20.Stopwatch.stop(v20.Events.CaptureTaken);
                v71(v45.CapturesEntrypointLatency, {
                    statValue = if v80 then v80.timeElapsed else nil
                });
            end;
            v69._store:dispatch(v57());
            v74();
            local v81 = v40.PolicyImplementation.read();
            local v82 = if v81 then v40.Mapper(v81).enableShareCaptureCTA() else false;
            if v79 == v66.PromptedShare then
                return;
            else
                if v69.isOnPlatformSharingVisibleToUser and v47(v78) then
                    v69._store:dispatch(v65(v41.CaptureTakenWithPostCTA, {
                        captureInfo = v78
                    }));
                elseif v82 then
                    v69._store:dispatch(v65(v41.CaptureTaken, {
                        captureInfo = v78
                    }));
                else
                    v69._store:dispatch(v65(v41.ViewCapture));
                end;
                v71(v45.CapturesShareToastViewed);
                return;
            end;
        end);
        v70.AppStorageService:WhenLoaded(function() --[[ Line: 215 ]]
            -- upvalues: v70 (copy), v44 (ref), v49 (ref), v48 (ref), v69 (copy), v32 (ref), v37 (ref), v24 (ref), v58 (ref), v71 (copy), v45 (ref)
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 216 ]]
                -- upvalues: v70 (ref), v44 (ref)
                return v70.AppStorageService:GetItem(v44.CapturesActiveLocalStorageKey);
            end);
            if l_status_0 and l_result_0 ~= "" then
                if v49(l_result_0)[v48(v70.Players) or ""] then
                    v69._store:dispatch(v32());
                else
                    v69._store:dispatch(v37());
                end;
            end;
            if v24 and v58.getShouldForceDisable(v70.AppStorageService, v48(v70.Players)) then
                v71(v45.ScreenshotsForceDisableOccurred, {
                    sessionId = v70.RbxAnalyticsService:GetSessionId(), 
                    universeId = game.GameId
                });
                task.delay(0.5, function() --[[ Line: 241 ]]
                    -- upvalues: v69 (ref), v37 (ref)
                    v69._store:dispatch(v37());
                end);
                return;
            else
                return;
            end;
        end);
        v70.NotificationService.RobloxEventReceived:Connect(function(v85) --[[ Line: 249 ]]
            -- upvalues: v69 (copy), v44 (ref), v46 (ref), v71 (copy), v45 (ref), v70 (copy), v56 (ref), v40 (ref), v65 (ref), v41 (ref)
            if not v69.isOnPlatformSharingVisibleToUser then
                return;
            else
                if v85.namespace == v44.PostCreationSignalRNamespace then
                    local v86 = v46(v85.detail);
                    if not v86 then
                        return;
                    else
                        v71(v45.PostConfirmationToastViewed, {
                            action = v86.Type, 
                            sessionId = v70.RbxAnalyticsService:GetSessionId(), 
                            status = v86.Type
                        });
                        if v86.Type == v56.Success then
                            local v87 = v40.PolicyImplementation.read();
                            if v87 and v40.Mapper(v87).enableShareCaptureCTA() then
                                v69._store:dispatch(v65(v41.PostSharedWithShareCTA, {
                                    postId = v86.PostId
                                }));
                                return;
                            else
                                v69._store:dispatch(v65(v41.PostShared));
                                return;
                            end;
                        elseif v86.Type == v56.Fail then
                            v69._store:dispatch(v65(v41.PostFailedGeneric));
                            return;
                        elseif v86.Type == v56.Moderated then
                            v69._store:dispatch(v65(v41.PostFailedModerated));
                        end;
                    end;
                end;
                return;
            end;
        end);
        task.spawn(function() --[[ Line: 281 ]]
            -- upvalues: v70 (copy), v69 (copy), v62 (ref)
            local l_status_1, l_result_1 = pcall(function() --[[ Line: 282 ]]
                -- upvalues: v70 (ref)
                return v70.RobloxReplicatedStorage:WaitForChild("GetServerType", 1e999):InvokeServer();
            end);
            if l_status_1 then
                v69._store:dispatch(v62(l_result_1));
            end;
        end);
        v69.closeMenu = function() --[[ Line: 291 ]]
            -- upvalues: v69 (copy), v51 (ref)
            v69._store:dispatch(v51());
        end;
        v69.openMenu = function() --[[ Line: 295 ]]
            -- upvalues: v69 (copy), v52 (ref)
            v69._store:dispatch(v52());
        end;
        v69.takeCapture = function() --[[ Line: 299 ]]
            -- upvalues: v69 (copy), v64 (ref)
            v69._store:dispatch(v64());
        end;
        v70.StarterGui.CoreGuiChangedSignal:Connect(function(v90, v91) --[[ Line: 303 ]]
            -- upvalues: v69 (copy), v35 (ref), v34 (ref)
            local v92 = true;
            if v90 ~= Enum.CoreGuiType.All then
                v92 = v90 == Enum.CoreGuiType.Captures;
            end;
            if not v92 then
                return;
            elseif v91 then
                v69._store:dispatch(v35());
                return;
            else
                v69._store:dispatch(v34());
                return;
            end;
        end);
        if v70.StarterGui:GetCoreGuiEnabled(Enum.CoreGuiType.Captures) then
            v69._store:dispatch(v35());
        else
            v69._store:dispatch(v34());
        end;
        v69.onIsActiveChanged = l_Signal_0.new();
        v69.getIsActive = function() --[[ Line: 325 ]]
            -- upvalues: v69 (copy), v44 (ref)
            return v69._store:getState()[v44.RoduxKey].IsActive or false;
        end;
        v69._store.changed:connect(function(v93, v94) --[[ Line: 329 ]]
            -- upvalues: v44 (ref), v70 (copy), v49 (ref), v48 (ref), v12 (ref), v69 (copy)
            local l_IsActive_0 = v94[v44.RoduxKey].IsActive;
            local l_IsActive_1 = v93[v44.RoduxKey].IsActive;
            if l_IsActive_1 ~= l_IsActive_0 then
                pcall(function() --[[ Line: 334 ]]
                    -- upvalues: v70 (ref), v44 (ref), v49 (ref), v48 (ref), l_IsActive_1 (copy), v12 (ref)
                    local l_Item_0 = v70.AppStorageService:GetItem(v44.CapturesActiveLocalStorageKey);
                    local v98 = v49(l_Item_0);
                    local v99 = v48(v70.Players) or "";
                    if l_IsActive_1 then
                        v98[v99] = true;
                    else
                        v98[v99] = nil;
                    end;
                    local v100 = table.concat(v12.keys(v98), ",");
                    v70.AppStorageService:SetItem(v44.CapturesActiveLocalStorageKey, v100);
                    v70.AppStorageService:Flush();
                end);
                v69.onIsActiveChanged:fire(l_IsActive_1);
            end;
        end);
        l_onViewportSizeChanged_0(function(v101) --[[ Line: 353 ]]
            -- upvalues: v69 (copy), v60 (ref)
            v69._store:dispatch(v60(v101));
        end);
        v69.onToggleActivationFromChrome = function(...) --[[ Line: 357 ]]
            -- upvalues: v69 (copy), v54 (ref), v71 (copy), v45 (ref)
            local function v102(...) --[[ Line: 358 ]]
                -- upvalues: v69 (ref)
                v69._store:dispatch(...);
            end;
            v54(v69.getIsActive(), nil, v71, v102, v45.CapturesActivatedChrome, v45.CapturesDeactivatedChrome);
        end;
        local function v106(v103, v104, v105) --[[ Line: 372 ]] --[[ Name: wrapWithProviders ]]
            -- upvalues: v17 (ref), v16 (ref), v18 (ref), v69 (copy), v40 (ref), l_StyleProviderWithDefaultTheme_0 (ref), l_LocalizationProvider_0 (ref), l_Localization_0 (ref), v70 (copy), v33 (ref)
            return v17.mount(v16.createElement(v18.StoreProvider, {
                store = v69._store
            }, {
                PolicyProvider = v17.createElement(v40.Provider, {
                    policy = {
                        v40.Mapper
                    }
                }, {
                    StyleProvider = v16.createElement(l_StyleProviderWithDefaultTheme_0, {
                        withDarkTheme = true
                    }, {
                        LocalizationProvider = v17.createElement(l_LocalizationProvider_0, {
                            localization = l_Localization_0.new(v70.LocalizationService.RobloxLocaleId)
                        }, {
                            ContextProvider = v17.createElement(v33.Provider, {
                                value = v104
                            }, {
                                Portal = v17.createElement(v17.Portal, {
                                    target = v103
                                }, v105)
                            })
                        })
                    })
                })
            }));
        end;
        local v107 = v40.PolicyImplementation.read();
        local v108 = if v107 then v40.Mapper(v107).eligibleForCapturesFeature() else false;
        local v109 = if v107 then v40.Mapper(v107).enableCapturesBulkManagement() else false;
        local v110 = {
            fireAnalyticsEvent = v71
        };
        v69.mountCaptureManager = function(v111) --[[ Line: 410 ]]
            -- upvalues: v109 (copy), v108 (copy), v71 (copy), v16 (ref), v30 (ref), v69 (copy), v106 (copy)
            if not v109 then
                return;
            elseif not v108 then
                return;
            else
                local v112 = {
                    fireAnalyticsEvent = v71
                };
                local v113 = {
                    CaptureManager = v16.createElement(v30)
                };
                v69._captureManagerHandle = v106(v111, v112, v113);
                return;
            end;
        end;
        v69.mountComposer = function(v114, _) --[[ Line: 428 ]]
            -- upvalues: v71 (copy), v16 (ref), v43 (ref), v69 (copy), v106 (copy)
            local v116 = {
                fireAnalyticsEvent = v71
            };
            local v117 = {
                Composer = v16.createElement(v43)
            };
            v69._composerHandle = v106(v114, v116, v117);
        end;
        v69.mountCaptureOverlay = function(v118) --[[ Line: 440 ]]
            -- upvalues: v108 (copy), v16 (ref), v31 (ref), v69 (copy), v106 (copy), v110 (copy)
            if not v108 then
                return;
            else
                local v119 = {
                    CaptureOverlay = v16.createElement(v31)
                };
                v69._captureOverlayHandle = v106(v118, v110, v119);
                return;
            end;
        end;
        v69.mountCarousel = function(v120) --[[ Line: 452 ]]
            -- upvalues: v108 (copy), v16 (ref), v42 (ref), v69 (copy), v106 (copy), v110 (copy)
            if not v108 then
                return;
            else
                local v121 = {
                    CarouselScreen = v16.createElement(v42)
                };
                v69._carouselHandle = v106(v120, v110, v121);
                return;
            end;
        end;
        v69.mountCoreUI = function(v122, v123) --[[ Line: 464 ]]
            -- upvalues: v108 (copy), v110 (copy), v71 (copy), v16 (ref), v38 (ref), v36 (ref), v69 (copy), v106 (copy)
            if not v108 then
                return;
            else
                local l_v110_0 = v110;
                l_v110_0 = {
                    fireAnalyticsEvent = v71, 
                    chromeEnabled = v123
                };
                local v125 = {
                    CaptureServicePrompts = v16.createElement(v38), 
                    CapturesCoreUI = v16.createElement(v36)
                };
                v69._coreUiHandle = v106(v122, l_v110_0, v125);
                return;
            end;
        end;
        v69.mountMenuPage = function(v126, v127, v128) --[[ Line: 484 ]]
            -- upvalues: v108 (copy), v71 (copy), v16 (ref), v39 (ref), v69 (copy), v106 (copy)
            if not v108 then
                return;
            else
                local v129 = {
                    chromeEnabled = v128, 
                    fireAnalyticsEvent = v71
                };
                local v130 = {
                    CapturesPage = v16.createElement(v39, {
                        closeSettingsMenu = v127
                    })
                };
                v69._menuPageHandle = v106(v126, v129, v130);
                return;
            end;
        end;
        return v69;
    end
};