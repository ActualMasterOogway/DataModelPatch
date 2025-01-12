local l_script_FirstAncestor_0 = script:FindFirstAncestor("Songbird");
local l_HttpService_0 = game:GetService("HttpService");
local l_Players_0 = game:GetService("Players");
local v3 = require(l_script_FirstAncestor_0.constants);
local v4 = require(l_script_FirstAncestor_0.logger);
local v5 = require(l_script_FirstAncestor_0.Parent.Cryo);
local v6 = require(l_script_FirstAncestor_0.Parent.Foundation);
local v7 = require(l_script_FirstAncestor_0.Parent.GenericAbuseReporting);
local v8 = require(l_script_FirstAncestor_0.Parent.React);
local l_DefaultTwoStepReportFlow_0 = v7.UXFlows.DefaultTwoStepReportFlow;
local l_GetFFlagSongbirdUseReportAudioModal_0 = require(l_script_FirstAncestor_0.Parent.SharedFlags).GetFFlagSongbirdUseReportAudioModal;
local v11 = require(l_script_FirstAncestor_0.Flags.getFFlagSongbirdFixMobileReportAudioPopup);
local v12 = require(l_script_FirstAncestor_0.Flags.getFFlagUpdateReportModalForAudio);
local v13 = require(l_script_FirstAncestor_0.Components.ReportAudioPopupContext);
local v14 = if v12() then {
    {
        localizationKey = "CoreScripts.TopBar.Label.InappropriateAudio", 
        value = "ABUSE_CATEGORY_INAPT_CONTENT"
    }
} else {
    {
        localizationKey = "CoreScripts.Ads.Label.InappropriateAd", 
        value = "ABUSE_CATEGORY_INAPPROPRIATE_AD"
    }
};
local v15 = {
    maxSize = v3.BIG_VECTOR, 
    onClose = function() --[[ Line: 36 ]] --[[ Name: onClose ]]

    end, 
    Players = l_Players_0
};
buildReport = function(v16, v17, v18, v19) --[[ Line: 52 ]] --[[ Name: buildReport ]]
    -- upvalues: v12 (copy), l_HttpService_0 (copy)
    if not v12() then
        return nil;
    else
        local v20 = {
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
                            data = tostring(v16)
                        }
                    }
                }, 
                REPORTED_ABUSE_CATEGORY = {
                    valueList = {
                        {
                            data = v17
                        }
                    }
                }, 
                REPORTER_COMMENT = {
                    valueList = {
                        {
                            data = v18
                        }
                    }
                }, 
                REPORT_TARGET_ASSET_ID = {
                    valueList = {
                        {
                            data = tostring(v19)
                        }
                    }
                }, 
                REPORTED_ABUSE_VECTOR = {
                    valueList = {
                        {
                            data = "audio"
                        }
                    }
                }, 
                VARIANT = {
                    valueList = {
                        {
                            data = "ChromeMusicWhatsPlaying"
                        }
                    }
                }
            }
        };
        return l_HttpService_0:JSONEncode(v20);
    end;
end;
return function(v21) --[[ Line: 105 ]] --[[ Name: ReportAudioPopup ]]
    -- upvalues: v5 (copy), v15 (copy), l_GetFFlagSongbirdUseReportAudioModal_0 (copy), v13 (copy), v12 (copy), l_Players_0 (copy), v4 (copy), v8 (copy), v6 (copy), v11 (copy), v3 (copy), l_DefaultTwoStepReportFlow_0 (copy), v14 (copy)
    local v22 = v5.Dictionary.join(v15, v21);
    local v23 = if l_GetFFlagSongbirdUseReportAudioModal_0() then v13.use() else nil;
    local function v24() --[[ Line: 109 ]]
        -- upvalues: v22 (copy), l_GetFFlagSongbirdUseReportAudioModal_0 (ref), v23 (copy)
        v22.onClose();
        if l_GetFFlagSongbirdUseReportAudioModal_0() then
            v23.setVisibility(false);
        end;
    end;
    local function v29(v25, v26) --[[ Line: 117 ]]
        -- upvalues: v12 (ref), v22 (copy), v23 (copy), l_Players_0 (ref), v4 (ref), l_GetFFlagSongbirdUseReportAudioModal_0 (ref)
        if v12() then
            local l_LocalPlayer_0 = v22.Players.LocalPlayer;
            if l_LocalPlayer_0 and v23.assetId then
                local v28 = buildReport(l_LocalPlayer_0.UserId, v25, v26, v23.assetId);
                if v28 then
                    l_Players_0:ReportAbuseV3(l_LocalPlayer_0, v28);
                    v4:info("Audio abuse report submitted for asset [" .. tostring(v23.assetId) .. "] with reason [" .. v25 .. "] and comment [" .. v26 .. "]");
                end;
            end;
        end;
        if not v12() then
            v4:info("Audio report submitted with reason [" .. v25 .. "] and comment [" .. v26 .. "]");
        end;
        if not l_GetFFlagSongbirdUseReportAudioModal_0() then
            v22.onClose();
        end;
        return true;
    end;
    if l_GetFFlagSongbirdUseReportAudioModal_0() and v23.isVisible then
        return (v8.createElement(v6.View, {
            tag = "size-full", 
            sizeConstraint = if v11() then nil else {
                MaxSize = v22.maxSize, 
                MinSize = v3.MIN_AUDIO_REPORTING_SIZE
            }
        }, {
            AbuseReportFlow = v8.createElement(l_DefaultTwoStepReportFlow_0, {
                analyticsContext = v3.AUDIO_ANALYTICS_CONTEXT, 
                onCloseProps = {
                    hasPreviousSteps = false, 
                    onAbandon = v24
                }, 
                onSubmitProps = {
                    hasNextSteps = false, 
                    onSubmit = v29
                }, 
                implSubmit = v29, 
                onAbandon = v24, 
                onComplete = v24, 
                reportCategories = v14, 
                reportCategoryDefaultKey = v14[1].value, 
                isReportCategoryReadonly = true, 
                localizationKeys = {
                    formTitle = v12() and "CoreScripts.TopBar.Label.ReportAudio" or "CoreScripts.Ads.Label.ReportAd"
                }
            })
        }));
    else
        return nil;
    end;
end;