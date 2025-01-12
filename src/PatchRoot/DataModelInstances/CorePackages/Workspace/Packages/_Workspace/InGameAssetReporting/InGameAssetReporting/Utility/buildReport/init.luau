local l_script_FirstAncestor_0 = script:FindFirstAncestor("InGameAssetReporting");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_script_FirstAncestor_0.Analysis.SceneAnalysis);
local l_getHumanoidDescription_0 = require(l_Parent_0.GetHumanoidDescription).getHumanoidDescription;
local v4 = require(l_script_FirstAncestor_0.Flags.GetFFlagSelectInSceneUseEngineSignal);
local l_HttpService_0 = game:GetService("HttpService");
local v6 = {
    Variant = {
        IGARv1 = "IGARv1"
    }
};
transformTargetPlayers = function(v7, v8) --[[ Line: 37 ]] --[[ Name: transformTargetPlayers ]]
    -- upvalues: l_getHumanoidDescription_0 (copy)
    local v9 = {};
    if v8 == 0 then
        v8 = 1;
    end;
    for _, v11 in ipairs(v7) do
        local l_player_0 = v11.player;
        local l_count_0 = v11.count;
        local v14, v15 = l_getHumanoidDescription_0(l_player_0.UserId);
        table.insert(v9, {
            userId = l_player_0.UserId, 
            hitCount = l_count_0, 
            hitPercentage = l_count_0 / v8, 
            humanoidDescription = v14, 
            humanoidDescriptionStatus = v15
        });
    end;
    return v9;
end;
serializeTargetPlayersIntoTagValues = function(v16) --[[ Line: 59 ]] --[[ Name: serializeTargetPlayersIntoTagValues ]]
    -- upvalues: l_HttpService_0 (copy)
    local v17 = {};
    for _, v19 in ipairs(v16) do
        table.insert(v17, {
            data = l_HttpService_0:JSONEncode(v19)
        });
    end;
    return v17;
end;
local function v24(v20) --[[ Line: 69 ]]
    local v21 = {};
    for _, v23 in ipairs(v20) do
        v21[#v21 + 1] = {
            v23.X, 
            v23.Y
        };
    end;
    return v21;
end;
local function _(v25) --[[ Line: 77 ]]
    local l_extractedAssets_0 = v25.extractedAssets;
    local v27 = true;
    if #l_extractedAssets_0.Image <= 0 then
        v27 = true;
        if #l_extractedAssets_0.Mesh <= 0 then
            v27 = true;
            if #l_extractedAssets_0.Model <= 0 then
                v27 = #l_extractedAssets_0.Package > 0;
            end;
        end;
    end;
    return v27;
end;
buildReport = function(v29, v30, v31, v32, v33, v34, v35, v36) --[[ Line: 85 ]] --[[ Name: buildReport ]]
    -- upvalues: v6 (copy), l_HttpService_0 (copy), v24 (copy), v4 (copy)
    local v37 = {
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
                        data = tostring(v29)
                    }
                }
            }, 
            REPORTED_ABUSE_CATEGORY = {
                valueList = {
                    {
                        data = v32
                    }
                }
            }, 
            REPORTED_ABUSE_SURFACE = {
                valueList = {
                    {
                        data = v33
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
                        data = v34
                    }
                }
            }, 
            REPORTED_ABUSE_VECTOR = {
                valueList = {
                    {
                        data = v33 == "username" and "user_profile" or "multi"
                    }
                }
            }, 
            VARIANT = {
                valueList = {
                    {
                        data = v6.Variant.IGARv1
                    }
                }
            }, 
            IGAR_REPORT_TARGET_ASSETS = {
                valueList = {
                    {
                        data = l_HttpService_0:JSONEncode(v31.extractedAssets)
                    }
                }
            }, 
            IGAR_EXTRACTION_STATS = {
                valueList = {
                    {
                        data = l_HttpService_0:JSONEncode(v31.stats)
                    }
                }
            }, 
            IGAR_ANNOTATION_COORDINATES = {
                valueList = {
                    {
                        data = l_HttpService_0:JSONEncode((v24(v35)))
                    }
                }
            }
        }
    };
    if v4() and v36 then
        local l_extractedAssets_1 = v36.extractedAssets;
        local v39 = true;
        if #l_extractedAssets_1.Image <= 0 then
            v39 = true;
            if #l_extractedAssets_1.Mesh <= 0 then
                v39 = true;
                if #l_extractedAssets_1.Model <= 0 then
                    v39 = #l_extractedAssets_1.Package > 0;
                end;
            end;
        end;
        if v39 then
            v37.tags.IGAR_REPORT_TARGET_GUI_ASSETS = {
                valueList = {
                    {
                        data = l_HttpService_0:JSONEncode(v36.extractedAssets)
                    }
                }
            };
            v37.tags.IGAR_GUI_EXTRACTION_STATS = {
                valueList = {
                    {
                        data = l_HttpService_0:JSONEncode(v36.stats)
                    }
                }
            };
        end;
    end;
    if #v31.extractedPlayers > 0 then
        local v40 = transformTargetPlayers(v31.extractedPlayers, v31.stats.raycastCompletedCount);
        local v41 = serializeTargetPlayersIntoTagValues(v40);
        v37.tags.IGAR_REPORT_TARGET_PLAYERS = {
            valueList = v41
        };
        if v33 == "username" then
            v37.tags.REPORT_TARGET_USER_ID = {
                valueList = {
                    {
                        data = tostring(v40[1].userId)
                    }
                }
            };
        end;
    end;
    if v30 then
        v37.tags.SCREENSHOT_ID = {
            valueList = {
                {
                    data = v30
                }
            }
        };
    end;
    if v33 == "username" and #v31.extractedPlayers == 0 then
        return nil;
    else
        return l_HttpService_0:JSONEncode(v37);
    end;
end;
return buildReport;