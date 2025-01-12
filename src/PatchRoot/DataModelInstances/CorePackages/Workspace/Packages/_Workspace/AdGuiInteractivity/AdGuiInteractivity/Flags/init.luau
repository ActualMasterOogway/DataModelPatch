game:DefineFastString("AdsVolumeOffImageLua", "rbxassetid://14986179621");
game:DefineFastString("AdsVolumeOnImageLua", "rbxassetid://14986178697");
game:DefineFastString("AdsEnterFullscreenImageLua", "rbxassetid://14986182327");
game:DefineFastString("AdsExitFullscreenImageLua", "rbxassetid://14986181606");
game:DefineFastString("AdsEudsaPromptActiveImageLua", "rbxassetid://16017622465");
game:DefineFastString("AdsEudsaPromptInactiveImageLua", "rbxassetid://16040129720");
game:DefineFastString("AdGuiPlayButtonImageLua", "rbxassetid://16639542545");
game:DefineFastString("AdGuiPauseButtonImageLua", "rbxassetid://16639540538");
game:DefineFastString("AdGuiCloseButtonImageLua", "rbxassetid://16639540023");
game:DefineFastFlag("AdGuiEnableLivePreviewWatermark", false);
game:DefineFastString("AdGuiLivePreviewWatermark", "rbxassetid://18539441909");
game:DefineFastString("AdGuiLivePreviewWatermarkV2", "rbxassetid://18641531344");
game:DefineFastString("LivePreviewPlaceId", "-1");
game:DefineFastFlag("UseV2LivePreviewWatermark", false);
game:DefineFastFlag("EnableReportAdDropdown5", false);
game:DefineFastInt("UniversalAppPolicyFailureTelemetryThrottleHundredthsPercent", 10000);
game:DefineFastFlag("EnableHideReportAdModalDuringScreenshot2", false);
game:DefineFastFlag("EnableAdGuiUiBloxImages", false);
game:DefineFastFlag("EnableUpdateAssetUrlInReportingForm", false);
game:DefineFastFlag("ADS6383", false);
game:DefineFastFlag("EnableCenterAndResizeAdReportModal", false);
return {
    GetFStringAdsVolumeOffImageLua = function() --[[ Line: 24 ]] --[[ Name: GetFStringAdsVolumeOffImageLua ]]
        return game:GetFastString("AdsVolumeOffImageLua");
    end, 
    GetFStringAdsVolumeOnImageLua = function() --[[ Line: 27 ]] --[[ Name: GetFStringAdsVolumeOnImageLua ]]
        return game:GetFastString("AdsVolumeOnImageLua");
    end, 
    GetFStringAdsEnterFullscreenImageLua = function() --[[ Line: 30 ]] --[[ Name: GetFStringAdsEnterFullscreenImageLua ]]
        return game:GetFastString("AdsEnterFullscreenImageLua");
    end, 
    GetFStringAdsExitFullscreenImageLua = function() --[[ Line: 33 ]] --[[ Name: GetFStringAdsExitFullscreenImageLua ]]
        return game:GetFastString("AdsExitFullscreenImageLua");
    end, 
    GetFStringAdsEudsaPromptActiveImageLua = function() --[[ Line: 36 ]] --[[ Name: GetFStringAdsEudsaPromptActiveImageLua ]]
        return game:GetFastString("AdsEudsaPromptActiveImageLua");
    end, 
    GetFStringAdsEudsaPromptInactiveImageLua = function() --[[ Line: 39 ]] --[[ Name: GetFStringAdsEudsaPromptInactiveImageLua ]]
        return game:GetFastString("AdsEudsaPromptInactiveImageLua");
    end, 
    GetFStringAdGuiPlayButtonImageLua = function() --[[ Line: 42 ]] --[[ Name: GetFStringAdGuiPlayButtonImageLua ]]
        return game:GetFastString("AdGuiPlayButtonImageLua");
    end, 
    GetFStringAdGuiPauseButtonImageLua = function() --[[ Line: 45 ]] --[[ Name: GetFStringAdGuiPauseButtonImageLua ]]
        return game:GetFastString("AdGuiPauseButtonImageLua");
    end, 
    GetFStringAdGuiCloseButtonImageLua = function() --[[ Line: 48 ]] --[[ Name: GetFStringAdGuiCloseButtonImageLua ]]
        return game:GetFastString("AdGuiCloseButtonImageLua");
    end, 
    GetFFlagAdGuiEnableWatermark = function() --[[ Line: 51 ]] --[[ Name: GetFFlagAdGuiEnableWatermark ]]
        return game:GetFastFlag("AdGuiEnableLivePreviewWatermark");
    end, 
    GetFStringAdGuiLivePreviewWatermark = function() --[[ Line: 54 ]] --[[ Name: GetFStringAdGuiLivePreviewWatermark ]]
        return game:GetFastString("AdGuiLivePreviewWatermark");
    end, 
    GetFStringLivePreviewPlaceId = function() --[[ Line: 57 ]] --[[ Name: GetFStringLivePreviewPlaceId ]]
        return game:GetFastString("LivePreviewPlaceId");
    end, 
    GetFFlagUseV2LivePreviewWatermark = function() --[[ Line: 60 ]] --[[ Name: GetFFlagUseV2LivePreviewWatermark ]]
        return game:GetFastFlag("UseV2LivePreviewWatermark");
    end, 
    GetFStringAdGuiLivePreviewWatermarkV2 = function() --[[ Line: 63 ]] --[[ Name: GetFStringAdGuiLivePreviewWatermarkV2 ]]
        return game:GetFastString("AdGuiLivePreviewWatermarkV2");
    end, 
    GetFFlagEnableReportAdDropdown = function() --[[ Line: 66 ]] --[[ Name: GetFFlagEnableReportAdDropdown ]]
        return game:GetFastFlag("EnableReportAdDropdown5");
    end, 
    GetFIntUniversalAppPolicyFailureTelemetryThrottleHundredthsPercent = function() --[[ Line: 69 ]] --[[ Name: GetFIntUniversalAppPolicyFailureTelemetryThrottleHundredthsPercent ]]
        return game:GetFastInt("UniversalAppPolicyFailureTelemetryThrottleHundredthsPercent");
    end, 
    GetEnableHideReportAdModalDuringScreenshot = function() --[[ Line: 72 ]] --[[ Name: GetEnableHideReportAdModalDuringScreenshot ]]
        return game:GetFastFlag("EnableHideReportAdModalDuringScreenshot2");
    end, 
    GetEnableAdGuiUiBloxImages = function() --[[ Line: 75 ]] --[[ Name: GetEnableAdGuiUiBloxImages ]]
        return game:GetFastFlag("EnableAdGuiUiBloxImages");
    end, 
    GetEnableUpdateAssetUrlInReportingForm = function() --[[ Line: 78 ]] --[[ Name: GetEnableUpdateAssetUrlInReportingForm ]]
        return game:GetFastFlag("EnableUpdateAssetUrlInReportingForm");
    end, 
    GetFFlagADS6383 = function() --[[ Line: 81 ]] --[[ Name: GetFFlagADS6383 ]]
        return game:GetFastFlag("ADS6383");
    end, 
    GetFFlagEnableCenterAndResizeAdReportModal = function() --[[ Line: 84 ]] --[[ Name: GetFFlagEnableCenterAndResizeAdReportModal ]]
        return game:GetFastFlag("EnableCenterAndResizeAdReportModal");
    end
};