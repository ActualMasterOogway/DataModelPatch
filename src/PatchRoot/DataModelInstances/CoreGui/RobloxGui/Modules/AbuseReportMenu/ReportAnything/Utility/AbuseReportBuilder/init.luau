local l_script_FirstAncestor_0 = script:FindFirstAncestor("AbuseReportMenu");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Workspace.Packages.TnSAvatarIdentification);
local v3 = require(l_CorePackages_0.Workspace.Packages.TnSAdIdentification);
local l_HttpService_0 = game:GetService("HttpService");
local l_getAvatarsForPoint_0 = v2.AvatarIdentification.getAvatarsForPoint;
local l_getAvatarsForRegion_0 = v2.AvatarIdentification.getAvatarsForRegion;
local l_getAdsForPoint_0 = v3.AdIdentification.getAdsForPoint;
local l_GetFFlagReportAnythingEnableAdReport_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagReportAnythingEnableAdReport;
local l_GetFFlagGetHumanoidDescription_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagGetHumanoidDescription;
local l_GetFFlagRAEnableCircleRegion_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagRAEnableCircleRegion;
local l_getHumanoidDescription_0 = require(l_script_FirstAncestor_0.ReportAnything.Utility.GetHumanoidDescription).getHumanoidDescription;
local _ = require(l_script_FirstAncestor_0.Components.Types);
local _ = require(l_script_FirstAncestor_0.ReportAnything.Utility.ReportAnythingAnalytics);
local v14 = {
    Variant = {
        CS = "ra/cs", 
        Sampling = "ra/sampling", 
        E1 = "ra/e1", 
        E2 = "ra/e2", 
        E3 = "ra/e3", 
        NM = "ra/nm", 
        Unknown = "ra/unknown"
    }
};
local function v19(v15) --[[ Line: 94 ]]
    local v16 = {};
    for _, v18 in ipairs(v15) do
        v16[#v16 + 1] = {
            v18.X, 
            v18.Y
        };
    end;
    return v16;
end;
local function v24(v20) --[[ Line: 102 ]]
    local v21 = {};
    for _, v23 in pairs(v20) do
        v21[#v21 + 1] = {
            assetId = v23.assetId, 
            distance = v23.distance, 
            boundingBox = {
                minX = v23.boundingBox.min.X, 
                minY = v23.boundingBox.min.Y, 
                maxX = v23.boundingBox.max.X, 
                maxY = v23.boundingBox.max.Y
            }, 
            adUnitName = v23.adUnitName, 
            encryptedAdTrackingData = v23.encryptedAdTrackingData, 
            encryptionMetadata = v23.encryptionMetadata
        };
    end;
    return v21;
end;
local function v29(v25) --[[ Line: 123 ]]
    -- upvalues: v19 (copy)
    local v26 = {};
    for v27, v28 in pairs(v25) do
        v26[#v26 + 1] = {
            userId = tostring(v27), 
            distance = v28.distance, 
            boundingBox = {
                minX = v28.boundingBox.min.X, 
                minY = v28.boundingBox.min.Y, 
                maxX = v28.boundingBox.max.X, 
                maxY = v28.boundingBox.max.Y
            }, 
            hitRate = v28.hitRate, 
            convexHull = v19(v28.convexHull)
        };
        if v28.pointProcessingStats ~= nil then
            v26[#v26].pointProcessingStats = {
                v28.pointProcessingStats.wasSkipped and 1 or 0, 
                v28.pointProcessingStats.total, 
                v28.pointProcessingStats.offScreenDiscardCount, 
                v28.pointProcessingStats.tooCloseDiscardCount
            };
        end;
    end;
    return v26;
end;
local function v48(v30) --[[ Line: 153 ]]
    -- upvalues: l_GetFFlagRAEnableCircleRegion_0 (copy), l_getAvatarsForRegion_0 (copy), l_getAvatarsForPoint_0 (copy), l_GetFFlagReportAnythingEnableAdReport_0 (copy), l_getAdsForPoint_0 (copy)
    local v31 = {};
    local v32 = {};
    local v33 = {};
    local v34 = {};
    for _, v36 in ipairs(v30.annotationPoints) do
        local v37 = 1e999;
        local v38 = nil;
        local v39 = {};
        v39 = if l_GetFFlagRAEnableCircleRegion_0() then l_getAvatarsForRegion_0(v30.identificationResults.identifiedAvatars, v36, v30.annotationCircleRadius, v30.annotationAreaWidth, v30.annotationAreaHeight) else l_getAvatarsForPoint_0(v30.identificationResults.identifiedAvatars, v36);
        for v40, _ in pairs(v39) do
            local l_distance_0 = v30.identificationResults.identifiedAvatars[v40].distance;
            if l_distance_0 < v37 then
                v37 = l_distance_0;
                v38 = v40;
            end;
        end;
        local v43 = nil;
        if l_GetFFlagReportAnythingEnableAdReport_0() then
            local v44 = l_getAdsForPoint_0(v30.identificationResults.identifiedAds, v36);
            v37 = 1e999;
            for v45, _ in pairs(v44) do
                local l_distance_1 = v30.identificationResults.identifiedAds[v45].distance;
                if l_distance_1 < v37 then
                    v37 = l_distance_1;
                    v43 = v45;
                end;
            end;
        end;
        if v38 ~= nil and not v31[v38] then
            v31[v38] = true;
            v33[#v33 + 1] = v30.identificationResults.identifiedAvatars[v38].player;
        elseif l_GetFFlagReportAnythingEnableAdReport_0() and v43 ~= nil and not v32[v43] then
            v32[v43] = true;
            v34[#v34 + 1] = v30.identificationResults.identifiedAds[v43];
        end;
    end;
    return v33, v34;
end;
local function v58(v49, _, v51) --[[ Line: 218 ]]
    -- upvalues: l_GetFFlagReportAnythingEnableAdReport_0 (copy), l_HttpService_0 (copy), v29 (copy), v24 (copy), v19 (copy)
    local v52 = false;
    for _, _ in pairs(v49.identificationResults.identifiedAvatars) do
        v52 = true;
        break;
    end;
    local v55 = false;
    if l_GetFFlagReportAnythingEnableAdReport_0() then
        for _, _ in pairs(v49.identificationResults.identifiedAds) do
            v55 = true;
            break;
        end;
    end;
    if v52 then
        v51.tags.IDENTIFIED_AVATARS = {
            valueList = {
                {
                    data = l_HttpService_0:JSONEncode((v29(v49.identificationResults.identifiedAvatars)))
                }
            }
        };
    end;
    if v49.identificationResults.avatarIDStats then
        v51.tags.AVATAR_ID_STATS = {
            valueList = {
                {
                    data = l_HttpService_0:JSONEncode(v49.identificationResults.avatarIDStats)
                }
            }
        };
    end;
    if v55 and l_GetFFlagReportAnythingEnableAdReport_0() then
        v51.tags.IDENTIFIED_ADS = {
            valueList = {
                {
                    data = l_HttpService_0:JSONEncode((v24(v49.identificationResults.identifiedAds)))
                }
            }
        };
    end;
    if v49.identificationResults.adIDStats and l_GetFFlagReportAnythingEnableAdReport_0() then
        v51.tags.AD_ID_STATS = {
            valueList = {
                {
                    data = l_HttpService_0:JSONEncode(v49.identificationResults.adIDStats)
                }
            }
        };
    end;
    if #v49.screenshotId > 0 then
        v51.tags.SCREENSHOT_ID = {
            valueList = {
                {
                    data = v49.screenshotId
                }
            }
        };
    end;
    if #v49.annotationPoints > 0 then
        v51.tags.RA_ANNOTATION_POINTS = {
            valueList = {
                {
                    data = l_HttpService_0:JSONEncode((v19(v49.annotationPoints)))
                }
            }
        };
    end;
    v51.tags.RA_ANNOTATION_OPTION_SEEN = {
        valueList = {
            {
                data = tostring(v49.annotationOptionSeen)
            }
        }
    };
    v51.tags.RA_ANNOTATION_PAGE_SEEN = {
        valueList = {
            {
                data = tostring(v49.annotationPageSeen)
            }
        }
    };
end;
return {
    buildExperienceReportRequest = function(v59, v60, v61) --[[ Line: 314 ]]
        -- upvalues: v14 (copy), v48 (copy), v58 (copy), l_GetFFlagReportAnythingEnableAdReport_0 (copy), l_HttpService_0 (copy), v24 (copy)
        local v62 = {
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
                            data = tostring(v59.localUserId)
                        }
                    }
                }, 
                REPORTED_ABUSE_CATEGORY = {
                    valueList = {
                        {
                            data = v59.abuseReason
                        }
                    }
                }, 
                PLACE_ID = {
                    valueList = {
                        {
                            data = tostring(v59.placeId)
                        }
                    }
                }, 
                REPORTER_COMMENT = {
                    valueList = {
                        {
                            data = v59.abuseComment
                        }
                    }
                }, 
                REPORTED_ABUSE_VECTOR = {
                    valueList = {
                        {
                            data = "place"
                        }
                    }
                }, 
                IN_EXP_MENU_ENTRY_POINT = {
                    valueList = {
                        {
                            data = v59.menuEntryPoint
                        }
                    }
                }, 
                VARIANT = {
                    valueList = {
                        {
                            data = v59.variant or v14.Variant.CS
                        }
                    }
                }
            }
        };
        local _, v64 = v48(v60);
        v58(v60, v61, v62);
        if #v64 > 0 and l_GetFFlagReportAnythingEnableAdReport_0() then
            v62.tags.REPORT_TARGET_ADS = {
                valueList = {
                    {
                        data = l_HttpService_0:JSONEncode((v24(v64)))
                    }
                }
            };
        end;
        return l_HttpService_0:JSONEncode(v62);
    end, 
    buildOtherReportRequest = function(v65, v66, v67) --[[ Line: 393 ]]
        -- upvalues: v14 (copy), v48 (copy), v58 (copy), l_GetFFlagGetHumanoidDescription_0 (copy), l_getHumanoidDescription_0 (copy), l_HttpService_0 (copy)
        local v68 = {
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
                            data = tostring(v65.localUserId)
                        }
                    }
                }, 
                REPORTED_ABUSE_CATEGORY = {
                    valueList = {
                        {
                            data = v65.abuseReason
                        }
                    }
                }, 
                REPORTER_COMMENT = {
                    valueList = {
                        {
                            data = v65.abuseComment
                        }
                    }
                }, 
                REPORTED_ABUSE_VECTOR = {
                    valueList = {
                        {
                            data = "avatar"
                        }
                    }
                }, 
                IN_EXP_MENU_ENTRY_POINT = {
                    valueList = {
                        {
                            data = v65.menuEntryPoint
                        }
                    }
                }, 
                VARIANT = {
                    valueList = {
                        {
                            data = v65.variant or v14.Variant.Unknown
                        }
                    }
                }
            }
        };
        local v69, _ = v48(v66);
        v58(v66, v67, v68);
        if #v69 > 0 then
            local v71 = tostring(v69[1].UserId);
            local v72 = {};
            for _, v74 in ipairs(v69) do
                v72[#v72 + 1] = tostring(v74.UserId);
            end;
            if l_GetFFlagGetHumanoidDescription_0() then
                local v75, v76 = l_getHumanoidDescription_0(v69[1].UserId);
                v68.tags.REPORT_TARGET_HUMANOID_DESCRIPTION = {
                    valueList = {
                        {
                            data = l_HttpService_0:JSONEncode(v75)
                        }
                    }
                };
                v68.tags.REPORT_TARGET_HUMANOID_DESCRIPTION_STATUS = {
                    valueList = {
                        {
                            data = v76
                        }
                    }
                };
                local v77 = {};
                for _, v79 in ipairs(v69) do
                    local v80, v81 = l_getHumanoidDescription_0(v79.UserId);
                    v77[#v77 + 1] = {
                        humanoidDescription = v80, 
                        outputMessage = v81
                    };
                end;
                v68.tags.RA_ALL_ANNOTATED_HUMANOID_DESCRIPTIONS = {
                    valueList = {
                        {
                            data = l_HttpService_0:JSONEncode(v77)
                        }
                    }
                };
            end;
            v68.tags.REPORT_TARGET_USER_ID = {
                valueList = {
                    {
                        data = tostring(v71)
                    }
                }
            };
            v68.tags.RA_ALL_ANNOTATED_USER_IDS = {
                valueList = {
                    {
                        data = l_HttpService_0:JSONEncode(v72)
                    }
                }
            };
        elseif v65.formSelectedAbuserUserId then
            if l_GetFFlagGetHumanoidDescription_0() then
                local v82, v83 = l_getHumanoidDescription_0(v65.formSelectedAbuserUserId);
                v68.tags.REPORT_TARGET_HUMANOID_DESCRIPTION = {
                    valueList = {
                        {
                            data = l_HttpService_0:JSONEncode(v82)
                        }
                    }
                };
                v68.tags.REPORT_TARGET_HUMANOID_DESCRIPTION_STATUS = {
                    valueList = {
                        {
                            data = v83
                        }
                    }
                };
            end;
            v68.tags.REPORT_TARGET_USER_ID = {
                valueList = {
                    {
                        data = tostring(v65.formSelectedAbuserUserId)
                    }
                }
            };
        end;
        return l_HttpService_0:JSONEncode(v68);
    end, 
    interpretAnnotations = v48, 
    Constants = v14
};