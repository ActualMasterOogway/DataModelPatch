local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_HttpService_0 = game:GetService("HttpService");
local l_Players_0 = game:GetService("Players");
local l_TextService_0 = game:GetService("TextService");
local l_TweenService_0 = game:GetService("TweenService");
local l_Images_0 = require(l_CorePackages_0.Packages.InGameMenuDependencies).UIBlox.App.ImageSet.Images;
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local l_Create_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Create;
local v11 = require(l_Modules_0.Common.IXPServiceWrapper);
local v12 = require(l_CorePackages_0.Workspace.Packages.CoreScriptsInitializer).CoreLogger:new(script.Name);
local v13 = require(l_Modules_0.RobloxTranslator);
local l_default_0 = require(l_Modules_0.VoiceChat.VoiceChatServiceManager).default;
local v15 = require(l_Modules_0.VoiceChat.Constants);
local l_AppFonts_0 = require(l_CorePackages_0.Workspace.Packages.Style).AppFonts;
local v17 = require(l_Modules_0.Flags.GetFFlagVoiceUserAgencyEnableIXP);
local v18 = require(l_Modules_0.Flags.GetFStringVoiceUserAgencyIXPLayerName);
local v19 = game:DefineFastInt("VoiceUserAgencyAlertInitTimeOffset", 5);
local v20 = game:DefineFastInt("VoiceUserAgencyAlertStartTimeOffset", 3);
local v21 = game:DefineFastInt("VoiceUserAgencyAlertTimerDuration", 7);
local v22 = require(l_Modules_0.Flags.FFlagMuteNonFriendsEvent);
local v23 = require(l_Modules_0.Settings.Flags.GetFFlagShowMuteToggles);
local v24 = game:DefineFastFlag("VoiceUserAgencyAddMuteDecisionAnalytics", false);
local v25 = game:DefineFastFlag("VoiceUserAgencyAdjustDescriptionText", false);
local v26 = v13:FormatByKey("Feature.SettingsHub.Prompt.VoiceUserAgency.Remember");
local v27 = tostring(game.PlaceId);
local l_UserId_0 = l_Players_0.LocalPlayer.UserId;
local function v33() --[[ Line: 46 ]] --[[ Name: getAppStorageTable ]]
    -- upvalues: l_AppStorageService_0 (copy), l_HttpService_0 (copy)
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 47 ]]
        -- upvalues: l_AppStorageService_0 (ref)
        return l_AppStorageService_0:GetItem("VoiceUserAgencyPlaceIds");
    end);
    if l_status_0 then
        local l_status_1, l_result_1 = pcall(function() --[[ Line: 51 ]]
            -- upvalues: l_HttpService_0 (ref), l_result_0 (copy)
            return l_HttpService_0:JSONDecode(l_result_0);
        end);
        if l_status_1 then
            return l_result_1;
        end;
    end;
    return {};
end;
local v34 = false;
local _ = function() --[[ Line: 62 ]] --[[ Name: resetHistory ]]
    -- upvalues: v34 (ref), v33 (copy), v27 (copy), l_AppStorageService_0 (copy), l_HttpService_0 (copy), v12 (copy)
    if v34 then
        return;
    else
        local l_status_2, l_result_2 = pcall(function() --[[ Line: 66 ]]
            -- upvalues: v33 (ref), v27 (ref), l_AppStorageService_0 (ref), l_HttpService_0 (ref), v34 (ref)
            local v35 = v33();
            for v36, _ in v35 do
                if v36 == v27 then
                    v35[v36] = nil;
                    l_AppStorageService_0:SetItem("VoiceUserAgencyPlaceIds", l_HttpService_0:JSONEncode(v35));
                    l_AppStorageService_0:Flush();
                    v34 = true;
                    return;
                end;
            end;
        end);
        if not l_status_2 then
            v12:trace(l_result_2);
        end;
        return;
    end;
end;
local function v57() --[[ Line: 83 ]] --[[ Name: bindResetHistory ]]
    -- upvalues: l_default_0 (copy), v22 (copy), v34 (ref), v33 (copy), v27 (copy), l_AppStorageService_0 (copy), l_HttpService_0 (copy), v12 (copy)
    l_default_0.muteAllChanged.Event:Connect(function(_) --[[ Line: 85 ]]
        -- upvalues: v22 (ref), v34 (ref), v33 (ref), v27 (ref), l_AppStorageService_0 (ref), l_HttpService_0 (ref), v12 (ref)
        if v22 then
            if v34 then
                return;
            else
                local l_status_3, l_result_3 = pcall(function() --[[ Line: 66 ]]
                    -- upvalues: v33 (ref), v27 (ref), l_AppStorageService_0 (ref), l_HttpService_0 (ref), v34 (ref)
                    local v42 = v33();
                    for v43, _ in v42 do
                        if v43 == v27 then
                            v42[v43] = nil;
                            l_AppStorageService_0:SetItem("VoiceUserAgencyPlaceIds", l_HttpService_0:JSONEncode(v42));
                            l_AppStorageService_0:Flush();
                            v34 = true;
                            return;
                        end;
                    end;
                end);
                if not l_status_3 then
                    v12:trace(l_result_3);
                    return;
                end;
            end;
        elseif v34 then
            return;
        else
            local l_status_4, l_result_4 = pcall(function() --[[ Line: 92 ]]
                -- upvalues: v33 (ref), v27 (ref), l_AppStorageService_0 (ref), l_HttpService_0 (ref), v34 (ref)
                local v47 = v33();
                for v48, _ in v47 do
                    if v48 == v27 then
                        v47[v48] = nil;
                        l_AppStorageService_0:SetItem("VoiceUserAgencyPlaceIds", l_HttpService_0:JSONEncode(v47));
                        l_AppStorageService_0:Flush();
                        v34 = true;
                        return;
                    end;
                end;
            end);
            if not l_status_4 then
                v12:trace(l_result_4);
            end;
        end;
    end);
    if v22 then
        l_default_0.mutedNonFriends.Event:Connect(function() --[[ Line: 110 ]]
            -- upvalues: v34 (ref), v33 (ref), v27 (ref), l_AppStorageService_0 (ref), l_HttpService_0 (ref), v12 (ref)
            if v34 then
                return;
            else
                local l_status_5, l_result_5 = pcall(function() --[[ Line: 66 ]]
                    -- upvalues: v33 (ref), v27 (ref), l_AppStorageService_0 (ref), l_HttpService_0 (ref), v34 (ref)
                    local v52 = v33();
                    for v53, _ in v52 do
                        if v53 == v27 then
                            v52[v53] = nil;
                            l_AppStorageService_0:SetItem("VoiceUserAgencyPlaceIds", l_HttpService_0:JSONEncode(v52));
                            l_AppStorageService_0:Flush();
                            v34 = true;
                            return;
                        end;
                    end;
                end);
                if not l_status_5 then
                    v12:trace(l_result_5);
                end;
                return;
            end;
        end);
    end;
end;
local function v62(v58, v59, v60) --[[ Line: 116 ]] --[[ Name: removeUserAgencyPrompt ]]
    -- upvalues: v33 (copy), v27 (copy), l_AppStorageService_0 (copy), l_HttpService_0 (copy), v24 (copy), l_RbxAnalyticsService_0 (copy), l_UserId_0 (copy), l_default_0 (copy), v23 (copy), v57 (copy)
    v58:Destroy();
    if v59 then
        local v61 = v33();
        v61[v27] = v60;
        l_AppStorageService_0:SetItem("VoiceUserAgencyPlaceIds", l_HttpService_0:JSONEncode(v61));
        l_AppStorageService_0:Flush();
    end;
    if v24 then
        l_RbxAnalyticsService_0:SendEventDeferred("client", "voiceChat", "SelectJoinWithVoice", {
            userId = l_UserId_0, 
            voiceSessionId = l_default_0:getService():GetSessionId(), 
            voiceExperienceId = l_default_0:getService():GetVoiceExperienceId(), 
            isMuteAll = v60, 
            isRememberSetting = v59
        });
    end;
    if v23() then
        l_default_0:FireUserAgencySelectedEvent(v60);
    end;
    v57();
end;
local function v84() --[[ Line: 143 ]] --[[ Name: showUserAgencyPrompt ]]
    -- upvalues: v17 (copy), v11 (copy), v18 (copy), v33 (copy), v27 (copy), v12 (copy), l_default_0 (copy), v15 (copy), v23 (copy), v57 (copy), l_RbxAnalyticsService_0 (copy), l_UserId_0 (copy), l_CoreGui_0 (copy), l_Create_0 (copy), l_AppFonts_0 (copy), v13 (copy), v62 (copy), v21 (copy), l_TweenService_0 (copy), l_Images_0 (copy), v26 (copy), l_TextService_0 (copy), v25 (copy), v20 (copy)
    local v63 = false;
    local v64 = false;
    if v17() then
        local l_status_6, l_result_6 = pcall(function() --[[ Line: 149 ]]
            -- upvalues: v11 (ref), v18 (ref)
            return v11:GetLayerData(v18());
        end);
        if not l_status_6 then
            return;
        elseif not l_result_6 then
            return;
        elseif not l_result_6.VoiceUserAgencyEnabled then
            return;
        end;
    end;
    local l_status_7, l_result_7 = pcall(function() --[[ Line: 168 ]]
        -- upvalues: v33 (ref), v27 (ref)
        local v67 = v33();
        for v68, v69 in pairs(v67) do
            if v68 == v27 and v69 ~= nil then
                return v69;
            end;
        end;
    end);
    if not l_status_7 then
        v12:trace(l_result_7);
        return;
    elseif l_result_7 ~= nil then
        l_default_0:MuteAll(l_result_7, v15.VOICE_CONTEXT_TYPE.USER_AGENCY);
        if v23() then
            l_default_0:FireUserAgencySelectedEvent(l_result_7);
        end;
        v57();
        l_RbxAnalyticsService_0:SendEventDeferred("client", "voiceChat", "JoinWithVoice", {
            userId = l_UserId_0, 
            voiceSessionId = l_default_0:getService():GetSessionId(), 
            voiceExperienceId = l_default_0:getService():GetVoiceExperienceId(), 
            isMutedAll = l_result_7
        });
        return;
    else
        local l_ScreenGui_0 = Instance.new("ScreenGui");
        l_ScreenGui_0.Name = "VoiceUserAgency";
        l_ScreenGui_0.ResetOnSpawn = false;
        l_ScreenGui_0.DisplayOrder = -1;
        l_ScreenGui_0.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
        l_ScreenGui_0.Parent = l_CoreGui_0;
        local v73 = l_Create_0("TextButton")({
            Name = "MuteAllButton", 
            BorderSizePixel = 0, 
            Size = UDim2.new(0.5, -6, 0, 36), 
            Font = l_AppFonts_0.default:getDefault(), 
            Text = v13:FormatByKey("Feature.SettingsHub.Prompt.VoiceUserAgency.JoinMuted"), 
            TextSize = 16, 
            BackgroundColor3 = Color3.fromRGB(57, 59, 61), 
            TextColor3 = Color3.fromRGB(178, 178, 178), 
            LayoutOrder = 1; 
            l_Create_0("UICorner")({
                CornerRadius = UDim.new(0, 8)
            }), 
            l_Create_0("UIStroke")({
                Thickness = 1, 
                ApplyStrokeMode = Enum.ApplyStrokeMode.Border, 
                Color = Color3.fromRGB(178, 178, 178)
            })
        });
        v73.Activated:Connect(function() --[[ Line: 224 ]]
            -- upvalues: v63 (ref), l_default_0 (ref), v15 (ref), v62 (ref), l_ScreenGui_0 (copy), v64 (ref)
            v63 = true;
            l_default_0:MuteAll(v63, v15.VOICE_CONTEXT_TYPE.USER_AGENCY);
            v62(l_ScreenGui_0, v64, v63);
        end);
        local v74 = l_Create_0("TextButton")({
            Name = "UnmuteAllButton", 
            BorderSizePixel = 0, 
            Size = UDim2.new(0.5, -6, 0, 36), 
            Font = l_AppFonts_0.default:getDefault(), 
            Text = v13:FormatByKey("Feature.SettingsHub.Prompt.VoiceUserAgency.JoinUnmuted"), 
            TextSize = 16, 
            BackgroundColor3 = Color3.fromRGB(255, 255, 255), 
            TextColor3 = Color3.fromRGB(57, 59, 61), 
            LayoutOrder = 2; 
            l_Create_0("UICorner")({
                CornerRadius = UDim.new(0, 8)
            })
        });
        v74.Activated:Connect(function() --[[ Line: 245 ]]
            -- upvalues: v63 (ref), l_default_0 (ref), v15 (ref), v62 (ref), l_ScreenGui_0 (copy), v64 (ref)
            v63 = false;
            l_default_0:MuteAll(v63, v15.VOICE_CONTEXT_TYPE.USER_AGENCY);
            v62(l_ScreenGui_0, v64, v63);
        end);
        local v75 = l_Create_0("Frame")({
            Name = "TimerBar", 
            BorderSizePixel = 0, 
            Size = UDim2.new(0, 0, 1, 0), 
            BackgroundColor3 = Color3.fromRGB(255, 255, 255), 
            BackgroundTransparency = 0
        });
        local v76 = {
            Size = UDim2.fromScale(1, 1)
        };
        local v77 = TweenInfo.new(v21, Enum.EasingStyle.Sine);
        local v78 = l_TweenService_0:Create(v75, v77, v76);
        v78.Completed:Connect(function(v79) --[[ Line: 262 ]]
            -- upvalues: v62 (ref), l_ScreenGui_0 (copy), v64 (ref), v63 (ref)
            if v79 == Enum.PlaybackState.Completed then
                v62(l_ScreenGui_0, v64, v63);
            end;
        end);
        local v80 = l_Create_0("ImageLabel")({
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1, 
            Image = l_Images_0["icons/status/success_small"].Image, 
            ImageRectOffset = l_Images_0["icons/status/success_small"].ImageRectOffset, 
            ImageRectSize = l_Images_0["icons/status/success_small"].ImageRectSize
        });
        local v81 = l_Create_0("ImageButton")({
            Size = UDim2.new(0, 14, 0, 14), 
            BackgroundTransparency = 1, 
            Image = l_Images_0["squircles/hollow"].Image, 
            ImageRectOffset = l_Images_0["squircles/hollow"].ImageRectOffset, 
            ImageRectSize = l_Images_0["squircles/hollow"].ImageRectSize
        });
        v80.Visible = false;
        v80.Parent = v81;
        v81.Activated:Connect(function() --[[ Line: 284 ]]
            -- upvalues: v80 (copy), v64 (ref), v78 (copy), l_RbxAnalyticsService_0 (ref), l_UserId_0 (ref), l_default_0 (ref)
            v80.Visible = not v80.Visible;
            v64 = v80.Visible;
            v78:Pause();
            l_RbxAnalyticsService_0:SendEventDeferred("client", "voiceChat", "RememberJoinWithVoice", {
                userId = l_UserId_0, 
                voiceSessionId = l_default_0:getService():GetSessionId(), 
                voiceExperienceId = l_default_0:getService():GetVoiceExperienceId(), 
                shouldRememberStatus = v64
            });
        end);
        local v82 = l_Create_0("TextLabel")({
            Name = "CheckboxTextLabel", 
            Font = l_AppFonts_0.default:getDefault(), 
            Text = v26, 
            TextColor3 = Color3.fromRGB(190, 190, 190), 
            TextSize = 16, 
            TextWrapped = true, 
            Size = UDim2.new(0, 350, 0, 24), 
            BackgroundTransparency = 1, 
            TextTransparency = 0, 
            LayoutOrder = 2
        });
        local l_l_TextService_0_TextSize_0 = l_TextService_0:GetTextSize(v26, 16, l_AppFonts_0.default:getDefault(), Vector2.new(350, 24));
        v82.Size = UDim2.new(0, l_l_TextService_0_TextSize_0.X + 10, 0, 24);
        l_Create_0("Frame")({
            Name = "VoiceUserAgencyFrame", 
            AnchorPoint = Vector2.new(0.5, 0), 
            Size = UDim2.new(0.9, 0, 1, 0), 
            Position = UDim2.new(0.5, 0, 0, 4), 
            BackgroundColor3 = Color3.fromRGB(57, 59, 61), 
            BorderSizePixel = 0; 
            l_Create_0("UICorner")({
                CornerRadius = UDim.new(0, 8)
            }), 
            l_Create_0("UISizeConstraint")({
                MaxSize = Vector2.new(400, 216)
            }), 
            l_Create_0("UIPadding")({
                PaddingTop = UDim.new(0, 24), 
                PaddingLeft = UDim.new(0, 24), 
                PaddingRight = UDim.new(0, 24), 
                PaddingBottom = UDim.new(0, 24)
            }), 
            l_Create_0("UIListLayout")({
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            l_Create_0("TextLabel")({
                Name = "Title", 
                Font = l_AppFonts_0.default:getBold(), 
                Text = v13:FormatByKey("Feature.SettingsHub.Prompt.VoiceUserAgency.JoinUnmuted.Title"), 
                TextSize = 20, 
                TextWrapped = true, 
                Size = UDim2.new(1, 0, 0, 22), 
                BackgroundTransparency = 1, 
                TextColor3 = Color3.fromRGB(255, 255, 255), 
                TextTransparency = 0, 
                LayoutOrder = 1
            }), 
            l_Create_0("TextLabel")({
                Name = "Lower", 
                Font = l_AppFonts_0.default:getDefault(), 
                Text = v25 and v13:FormatByKey("Feature.SettingsHub.Prompt.VoiceUserAgency.JoinUnmuted.Description") or v13:FormatByKey("Feature.SettingsHub.VoiceUserAgency.JoinUnmuted.Description"), 
                TextColor3 = Color3.fromRGB(190, 190, 190), 
                TextSize = 16, 
                TextWrapped = true, 
                Size = UDim2.new(1, 0, 0, 60), 
                BackgroundTransparency = 1, 
                TextTransparency = 0, 
                LayoutOrder = 2
            }), 
            l_Create_0("Frame")({
                Name = "TimerFrame", 
                BorderSizePixel = 0, 
                BackgroundColor3 = Color3.fromRGB(0, 0, 0), 
                Size = UDim2.new(1, 48, 0, 3), 
                BackgroundTransparency = 0, 
                LayoutOrder = 3; 
                v75
            }), 
            l_Create_0("Frame")({
                Name = "ButtonsContainer", 
                BorderSizePixel = 0, 
                Size = UDim2.new(1, 0, 0, 62), 
                BackgroundTransparency = 1, 
                LayoutOrder = 4; 
                l_Create_0("UIListLayout")({
                    FillDirection = Enum.FillDirection.Horizontal, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, 12)
                }), 
                v74, 
                v73
            }), 
            l_Create_0("Frame")({
                Name = "CheckboxContainer", 
                BorderSizePixel = 0, 
                Size = UDim2.new(1, 0, 0, 28), 
                BackgroundTransparency = 1, 
                LayoutOrder = 5; 
                l_Create_0("UIListLayout")({
                    FillDirection = Enum.FillDirection.Horizontal, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, 8)
                }), 
                v81, 
                v82
            })
        }).Parent = l_ScreenGui_0;
        task.delay(v20, function() --[[ Line: 425 ]]
            -- upvalues: l_RbxAnalyticsService_0 (ref), l_UserId_0 (ref), l_default_0 (ref), v78 (copy)
            l_RbxAnalyticsService_0:SendEventDeferred("client", "voiceChat", "ShowJoinWithVoice", {
                userId = l_UserId_0, 
                voiceSessionId = l_default_0:getService():GetSessionId(), 
                voiceExperienceId = l_default_0:getService():GetVoiceExperienceId()
            });
            v78:Play();
        end);
        return;
    end;
end;
task.delay(v19, function() --[[ Line: 438 ]]
    -- upvalues: l_default_0 (copy), v84 (copy), v12 (copy)
    l_default_0:asyncInit():andThen(function() --[[ Line: 440 ]]
        -- upvalues: v84 (ref)
        v84();
    end):catch(function() --[[ Line: 443 ]]
        -- upvalues: v12 (ref)
        v12:trace("VoiceChatServiceManager did not initialize for VoiceUserAgency");
    end);
end);