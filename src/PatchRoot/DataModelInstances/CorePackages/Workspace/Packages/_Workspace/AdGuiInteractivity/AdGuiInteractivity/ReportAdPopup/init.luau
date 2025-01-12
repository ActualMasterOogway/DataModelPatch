local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.React);
local v3 = require(l_Parent_1.Roact);
local l_AppStyleProvider_0 = require(l_Parent_1.UIBlox).App.Style.AppStyleProvider;
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_LocalizationProvider_0 = require(l_Parent_1.Localization).LocalizationProvider;
local l_Localization_0 = require(l_Parent_1.RobloxAppLocales).Localization;
local v8 = require(l_Parent_1.GenericAbuseReporting);
local l_DefaultTwoStepReportFlow_0 = v8.UXFlows.DefaultTwoStepReportFlow;
local l_Players_0 = game:GetService("Players");
local l_ScreenshotManager_0 = require(l_Parent_1.Screenshot).ScreenshotManager;
local l_HttpService_0 = game:GetService("HttpService");
local l_getAppFeaturePolicies_0 = require(l_Parent_1.UniversalAppPolicy).getAppFeaturePolicies;
local v14 = require(l_Parent_1.LoggingProtocol);
local l_default_0 = v14.default;
local v16 = require(l_Parent_0.ReportAdFooter);
local v17 = require(script.Parent.Flags);
local v18 = v17.GetEnableHideReportAdModalDuringScreenshot();
local v19 = v17.GetFFlagADS6383();
local v20 = if v19 then require(l_Parent_0.AdsInteractivityTelemetry) else nil;
local v21 = v8.Common.Flags.GetFFlagEnableCenterAndResizeAdReportModal();
local v22 = {
    {
        localizationKey = "CoreScripts.Ads.Label.InappropriateAd", 
        value = "ABUSE_CATEGORY_INAPPROPRIATE_AD"
    }
};
buildReport = function(v23, v24, v25, v26, v27) --[[ Line: 57 ]] --[[ Name: buildReport ]]
    -- upvalues: l_HttpService_0 (copy)
    local v28 = {
        tags = {
            ENTRY_POINT = {
                valueList = {
                    {
                        data = "in-experience"
                    }
                }
            }, 
            SUBMITTER_USER_ID = {
                valueList = {
                    {
                        data = tostring(v23)
                    }
                }
            }, 
            REPORTED_ABUSE_CATEGORY = {
                valueList = {
                    {
                        data = v25
                    }
                }
            }, 
            PLACE_ID = {
                valueList = {
                    {
                        data = tostring(game.PlaceId)
                    }
                }
            }, 
            REPORTER_COMMENT = {
                valueList = {
                    {
                        data = v26
                    }
                }
            }, 
            REPORTED_ABUSE_VECTOR = {
                valueList = {
                    {
                        data = "ad"
                    }
                }
            }, 
            SCREENSHOT_ID = {
                valueList = {
                    {
                        data = v24
                    }
                }
            }, 
            IDENTIFIED_ADS = {
                valueList = {
                    {
                        data = v27
                    }
                }
            }
        }
    };
    return l_HttpService_0:JSONEncode(v28);
end;
local function v35(v29) --[[ Line: 112 ]]
    local l_assetId_0 = v29.assetId;
    local l_adUnitName_0 = v29.adUnitName;
    local l_encryptedAdTrackingData_0 = v29.encryptedAdTrackingData;
    local l_encryptionMetadata_0 = v29.encryptionMetadata;
    local _ = nil;
    return {
        {
            assetId = l_assetId_0, 
            adUnitName = l_adUnitName_0, 
            encryptedAdTrackingData = l_encryptedAdTrackingData_0, 
            encryptionMetadata = l_encryptionMetadata_0
        }
    };
end;
ReportAdPopup = function(v36) --[[ Line: 129 ]] --[[ Name: ReportAdPopup ]]
    -- upvalues: v35 (copy), l_HttpService_0 (copy), l_getAppFeaturePolicies_0 (copy), l_default_0 (copy), v14 (copy), v17 (copy), v2 (copy), v18 (copy), l_ScreenshotManager_0 (copy), l_Players_0 (copy), v19 (copy), v20 (copy), v3 (copy), l_LocalizationProvider_0 (copy), l_Localization_0 (copy), l_LocalizationService_0 (copy), v21 (copy), l_AppStyleProvider_0 (copy), l_DefaultTwoStepReportFlow_0 (copy), v22 (copy), v16 (copy)
    local v37 = "";
    local v38 = v35(v36.adInfo);
    local v39 = l_HttpService_0:JSONEncode(v38);
    local v40 = true;
    local v41 = l_getAppFeaturePolicies_0();
    if v41 ~= nil then
        local v42 = v41.getShowIllegalContentReportingUI();
        local v43 = false;
        if v42 ~= nil then
            v43 = v42;
        end;
        v40 = v43;
    else
        l_default_0:logRobloxTelemetryEvent({
            eventName = "UniversalAppPolicyCallFailed", 
            backends = {
                v14.TelemetryBackends.Points
            }, 
            throttlingPercentage = v17.GetFIntUniversalAppPolicyFailureTelemetryThrottleHundredthsPercent(), 
            lastUpdated = {
                24, 
                8, 
                22
            }, 
            description = "Call to UniversalAppPolicy (GUAC) failed in Report Ad popup"
        }, nil, {
            assetId = v38[1].assetId, 
            encryptedAdTrackingData = v38[1].encryptedAdTrackingData, 
            encryptionMetadata = v38[1].encryptionMetadata
        });
    end;
    local v48 = v2.useCallback(function(v44, v45) --[[ Line: 159 ]]
        -- upvalues: v18 (ref), v36 (copy), l_ScreenshotManager_0 (ref), l_Players_0 (ref), v37 (ref), v39 (copy), v19 (ref), v20 (ref)
        if v18 then
            v36.onClose();
        end;
        l_ScreenshotManager_0:TakeScreenshotWithCallback(function(v46) --[[ Line: 163 ]]
            -- upvalues: l_Players_0 (ref), v37 (ref), v44 (copy), v45 (copy), v39 (ref), v19 (ref), v20 (ref)
            local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
            if l_LocalPlayer_0 ~= nil then
                v37 = buildReport(l_LocalPlayer_0.UserId, v46, v44, v45, v39);
                l_Players_0:ReportAbuseV3(l_LocalPlayer_0, v37);
                if v19 and v20 then
                    v20.logReportAdEvent("submit");
                end;
            end;
        end, nil);
        if v18 and v36.onOpen then
            v36.onOpen();
        end;
        return true;
    end, {});
    local v49 = v3.createElement(l_LocalizationProvider_0, {
        localization = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId)
    }, {
        v3.createElement("UIPadding", {
            PaddingBottom = UDim.new(0, v21 and 20 or 0)
        }), 
        v3.createElement(l_AppStyleProvider_0, {
            style = {
                themeName = "Dark", 
                fontName = "Gotham"
            }
        }, {
            AbuseReportFlow = v3.createElement(l_DefaultTwoStepReportFlow_0, {
                analyticsContext = "Ad", 
                onCloseProps = {
                    hasPreviousSteps = false, 
                    onAbandon = v19 and function() --[[ Line: 198 ]]
                        -- upvalues: v20 (ref), v36 (copy)
                        if v20 then
                            v20.logReportAdEvent("close");
                        end;
                        v36.onClose();
                    end or v36.onClose
                }, 
                onSubmitProps = {
                    hasNextSteps = false, 
                    onSubmit = v48
                }, 
                implSubmit = v48, 
                onAbandon = v19 and function() --[[ Line: 214 ]]
                    -- upvalues: v20 (ref), v36 (copy)
                    if v20 then
                        v20.logReportAdEvent("close");
                    end;
                    v36.onClose();
                end or v36.onClose, 
                onComplete = v36.onClose, 
                reportCategories = v22, 
                reportCategoryDefaultKey = v22[1].value, 
                isReportCategoryReadonly = true, 
                localizationKeys = {
                    formTitle = "CoreScripts.Ads.Label.ReportAd", 
                    completeTitle = "Feature.ReportAbuse.Title.SelectInSceneThankYou", 
                    completeDescription = "Feature.ReportAbuse.Label.SelectInSceneComplete"
                }, 
                scaleDialog = v21 and {
                    X = 0.8, 
                    Y = 1
                } or nil, 
                footerContent = function() --[[ Line: 236 ]] --[[ Name: footerContent ]]
                    -- upvalues: v40 (ref), v3 (ref), v16 (ref), v38 (copy)
                    if v40 then
                        return v3.createElement(v16, {
                            assetId = v38[1].assetId
                        });
                    else
                        return nil;
                    end;
                end
            })
        })
    });
    if v21 then
        return v3.createElement("ScreenGui", {
            ResetOnSpawn = false, 
            IgnoreGuiInset = true, 
            DisplayOrder = 1, 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
            AutoLocalize = false, 
            Enabled = v36.showReportAdPopup
        }, v3.createElement("Frame", {
            Position = UDim2.new(0, 0, 0, 0), 
            AnchorPoint = Vector2.new(0, 0), 
            Size = UDim2.new(1, 0, 1, 0), 
            AutomaticSize = Enum.AutomaticSize.XY, 
            BackgroundTransparency = 1
        }, {
            v3.createElement("Frame", {
                Position = UDim2.new(0.5, 0, 0.5, 0), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Size = UDim2.new(0.8, 0, 0.6, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1
            }, {
                v49
            })
        }));
    else
        return v3.createElement("ScreenGui", {
            ResetOnSpawn = false, 
            IgnoreGuiInset = true, 
            DisplayOrder = 1, 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
            AutoLocalize = false, 
            Enabled = v36.showReportAdPopup
        }, v3.createElement("Frame", {
            Position = UDim2.new(0.55, 0, 0.5, 0), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Size = UDim2.new(0, 0, 0.5, 0), 
            AutomaticSize = Enum.AutomaticSize.XY, 
            BackgroundTransparency = 1
        }, {
            v49
        }));
    end;
end;
return ReportAdPopup;