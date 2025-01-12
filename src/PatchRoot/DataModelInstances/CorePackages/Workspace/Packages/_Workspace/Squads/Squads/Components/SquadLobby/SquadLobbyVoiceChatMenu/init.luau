local l_script_FirstAncestor_0 = script:FindFirstAncestor("Squads");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_CrossExperienceVoice_0 = v1.CrossExperienceVoice;
local l_Foundation_0 = v1.Foundation;
local l_React_0 = v1.React;
local l_UIBlox_0 = v1.UIBlox;
local l_GameSettings_0 = UserSettings().GameSettings;
local l_game_EngineFeature_0 = game:GetEngineFeature("PartyVoiceVolume");
local l_ContextualSlider_0 = l_UIBlox_0.App.Slider.ContextualSlider;
local l_CrossExperienceVoiceManager_0 = l_CrossExperienceVoice_0.CrossExperienceVoiceManager;
local l_PresenceType_0 = v1.RoduxPresence.Enums.PresenceType;
local l_ImageSetLabel_0 = l_UIBlox_0.Core.ImageSet.ImageSetLabel;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local l_dependencyArray_0 = v1.Hooks.dependencyArray;
local l_useEnableAudioFocusToggle_0 = v1.Hooks.useEnableAudioFocusToggle;
local l_useIsVoiceFocused_0 = l_CrossExperienceVoice_0.Hooks.useIsVoiceFocused;
local l_useLocalUserId_0 = v1.Hooks.useLocalUserId;
local l_useSelector_0 = v1.Hooks.useSelector;
local l_useTokens_0 = l_Foundation_0.Hooks.useTokens;
local l_useLocalization_0 = v1.Hooks.useLocalization;
local l_SquadExternalContractContext_0 = v1.SquadsCore.SquadExternalContractProvider.SquadExternalContractContext;
local l_useCurrentSquadParentChannelId_0 = v1.SquadsCore.Hooks.useCurrentSquadParentChannelId;
local v22 = l_Images_0["component_assets/circle_24_stroke_1"];
local v23 = l_Images_0["component_assets/circle_16"];
local function v26(v24) --[[ Line: 49 ]]
    -- upvalues: l_useTokens_0 (copy), l_React_0 (copy), l_Foundation_0 (copy), l_ContextualSlider_0 (copy)
    local v25 = l_useTokens_0();
    return l_React_0.createElement(l_Foundation_0.View, {
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        padding = {
            top = UDim.new(0, v25.Padding.Small), 
            bottom = UDim.new(0, v25.Padding.Small)
        }, 
        layout = {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, v25.Gap.Small)
        }, 
        LayoutOrder = v24.LayoutOrder
    }, {
        Label = l_React_0.createElement(l_Foundation_0.Text, {
            AutomaticSize = Enum.AutomaticSize.XY, 
            fontStyle = v25.Typography.LabelMedium, 
            textStyle = v25.Color.Content.Emphasis, 
            TextTruncate = Enum.TextTruncate.AtEnd, 
            TextWrapped = false, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            LayoutOrder = 1, 
            Text = v24.labelText
        }), 
        SliderWrapper = l_React_0.createElement(l_Foundation_0.View, {
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            LayoutOrder = 2
        }, {
            Slider = l_React_0.createElement(l_ContextualSlider_0, {
                width = UDim.new(1, 0), 
                stepInterval = 0.1, 
                min = 0, 
                max = 1, 
                value = v24.sliderValue, 
                onValueChanged = v24.onValueChanged
            })
        })
    });
end;
local function v31(v27) --[[ Line: 101 ]]
    -- upvalues: l_useTokens_0 (copy), l_React_0 (copy), l_Foundation_0 (copy), l_ImageSetLabel_0 (copy), v22 (copy), v23 (copy)
    local v28 = l_useTokens_0();
    local l_Color3_0 = v28.Color.Content.Emphasis.Color3;
    local l_Transparency_0 = v28.Color.Content.Emphasis.Transparency;
    return l_React_0.createElement(l_Foundation_0.View, {
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        padding = Vector2.new(v28.Padding.Large, v28.Padding.XSmall), 
        layout = {
            FillDirection = Enum.FillDirection.Horizontal, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            Padding = UDim.new(0, v28.Gap.Large)
        }, 
        LayoutOrder = v27.LayoutOrder, 
        onActivated = v27.onActivated
    }, {
        Icon = l_React_0.createElement(l_ImageSetLabel_0, {
            Size = UDim2.fromOffset(24, 24), 
            BackgroundTransparency = 1, 
            Image = v27.icon, 
            ImageColor3 = l_Color3_0, 
            ImageTransparency = l_Transparency_0, 
            LayoutOrder = 1
        }), 
        Label = l_React_0.createElement(l_Foundation_0.Text, {
            AutomaticSize = Enum.AutomaticSize.XY, 
            flexItem = {
                FlexMode = Enum.UIFlexMode.Fill
            }, 
            fontStyle = v28.Typography.LabelMedium, 
            textStyle = v28.Color.Content.Emphasis, 
            TextTruncate = Enum.TextTruncate.AtEnd, 
            TextWrapped = false, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            LayoutOrder = 2, 
            Text = v27.labelText
        }), 
        RadioButtonContainer = l_React_0.createElement(l_Foundation_0.View, {
            Size = UDim2.new(0, 0, 0, 40), 
            AutomaticSize = Enum.AutomaticSize.X, 
            layout = {
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }, 
            LayoutOrder = 3
        }, {
            DefaultIcon = l_React_0.createElement(l_ImageSetLabel_0, {
                BackgroundTransparency = 1, 
                Image = v22, 
                Size = UDim2.new(0, 24, 0, 24), 
                ImageColor3 = l_Color3_0, 
                ImageTransparency = l_Transparency_0, 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.new(0.5, 0, 0.5, 0)
            }, {
                SelectedIcon = v27.isSelected and l_React_0.createElement(l_ImageSetLabel_0, {
                    BackgroundTransparency = 1, 
                    Image = v23, 
                    Size = UDim2.new(0, 16, 0, 16), 
                    ImageColor3 = l_Color3_0, 
                    ImageTransparency = l_Transparency_0, 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Position = UDim2.new(0.5, 0, 0.5, 0)
                })
            })
        })
    });
end;
return function(v32) --[[ Line: 175 ]]
    -- upvalues: l_useTokens_0 (copy), l_useLocalUserId_0 (copy), l_useIsVoiceFocused_0 (copy), l_useEnableAudioFocusToggle_0 (copy), l_React_0 (copy), l_SquadExternalContractContext_0 (copy), l_useSelector_0 (copy), l_PresenceType_0 (copy), l_dependencyArray_0 (copy), l_useCurrentSquadParentChannelId_0 (copy), l_CrossExperienceVoiceManager_0 (copy), l_game_EngineFeature_0 (copy), l_GameSettings_0 (copy), l_useLocalization_0 (copy), l_Foundation_0 (copy), v26 (copy), v31 (copy), l_Images_0 (copy)
    local v33 = l_useTokens_0();
    local v34 = l_useLocalUserId_0();
    local v35 = l_useIsVoiceFocused_0();
    local v36 = l_useEnableAudioFocusToggle_0();
    local v37 = l_React_0.useContext(l_SquadExternalContractContext_0);
    local v39 = l_React_0.useCallback(function(v38) --[[ Line: 182 ]]
        -- upvalues: v34 (copy)
        return v38.Squad.Presence.byUserId[tostring(v34)];
    end, {
        v34
    });
    local v40 = l_useSelector_0(v39);
    local v41 = l_React_0.useMemo(function() --[[ Line: 187 ]]
        -- upvalues: v40 (copy), l_PresenceType_0 (ref)
        return v40 and v40.userPresenceType == l_PresenceType_0.InGame;
    end, l_dependencyArray_0(v40));
    local v42 = l_React_0.useMemo(function() --[[ Line: 191 ]]
        -- upvalues: v40 (copy), v41 (copy)
        if v40 and v41 then
            return v40.lastLocation;
        else
            return nil;
        end;
    end, l_dependencyArray_0(v40, v41));
    local v43 = l_useCurrentSquadParentChannelId_0();
    local v44 = v37.useParentChannelTitleSelector(v43 or "");
    local v45 = l_React_0.useCallback(function() --[[ Line: 199 ]]
        -- upvalues: l_CrossExperienceVoiceManager_0 (ref)
        l_CrossExperienceVoiceManager_0.default:toggleAudioFocus();
    end, {});
    local l_l_game_EngineFeature_0_0 = l_game_EngineFeature_0;
    local v47 = v41 or not l_l_game_EngineFeature_0_0;
    local v48 = l_l_game_EngineFeature_0_0 and v47;
    local v49 = v41 and (v36 or v32.forceEnableAudioFocusToggle);
    local v50, v51 = l_React_0.useState(if l_game_EngineFeature_0 then l_GameSettings_0.PartyVoiceVolume else 0);
    local v52, v53 = l_React_0.useState(l_GameSettings_0.MasterVolume);
    local v54 = l_useLocalization_0({
        volumeLabelText = "Feature.Squads.Label.Volume", 
        partyVolumeLabelText = "Feature.Squads.Label.PartyVolume", 
        experienceLabelText = "Feature.Squads.Label.Experience", 
        voiceChatsLabelText = "Feature.Squads.Label.VoiceChats", 
        partyLabelText = "Feature.Squads.Label.Party"
    });
    local v55 = if v48 then v54.partyLabelText else v54.partyVolumeLabelText;
    local v56 = if l_l_game_EngineFeature_0_0 then v54.experienceLabelText else v54.volumeLabelText;
    return l_React_0.createElement(l_Foundation_0.View, {
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        padding = Vector2.new(0, v33.Padding.Small), 
        cornerRadius = UDim.new(0, v33.Radius.Medium), 
        backgroundStyle = v33.Color.Surface.Surface_300, 
        layout = {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }
    }, {
        VolumeSection = l_React_0.createElement(l_Foundation_0.View, {
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            padding = Vector2.new(v33.Padding.Large, 0), 
            layout = {
                FillDirection = Enum.FillDirection.Vertical, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }, 
            LayoutOrder = 1
        }, {
            VolumeLabel = v48 and l_React_0.createElement(l_Foundation_0.Text, {
                AutomaticSize = Enum.AutomaticSize.XY, 
                fontStyle = v33.Typography.TitleSmall, 
                textStyle = v33.Color.Content.Muted, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                TextWrapped = false, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                LayoutOrder = 1, 
                padding = Vector2.new(0, v33.Padding.XSmall), 
                Text = v54.volumeLabelText
            }), 
            PartySliderGroup = l_l_game_EngineFeature_0_0 and l_React_0.createElement(v26, {
                LayoutOrder = 2, 
                labelText = v55, 
                sliderValue = v50, 
                onValueChanged = function(v57) --[[ Line: 263 ]] --[[ Name: onValueChanged ]]
                    -- upvalues: l_GameSettings_0 (ref), v51 (copy)
                    l_GameSettings_0.PartyVoiceVolume = v57;
                    v51(v57);
                end
            }), 
            ExperienceSliderGroup = v47 and l_React_0.createElement(v26, {
                LayoutOrder = 3, 
                labelText = v56, 
                sliderValue = v52, 
                onValueChanged = function(v58) --[[ Line: 272 ]] --[[ Name: onValueChanged ]]
                    -- upvalues: l_GameSettings_0 (ref), v53 (copy)
                    l_GameSettings_0.MasterVolume = v58;
                    v53(v58);
                end
            })
        }), 
        Divider = v49 and l_React_0.createElement(l_Foundation_0.View, {
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            LayoutOrder = 2, 
            padding = Vector2.new(0, v33.Padding.Small)
        }, {
            Divider = l_React_0.createElement(l_Foundation_0.View, {
                Size = UDim2.new(1, 0, 0, 1), 
                backgroundStyle = v33.Color.Stroke.Default
            })
        }), 
        VoiceChatSection = v49 and l_React_0.createElement(l_Foundation_0.View, {
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            layout = {
                FillDirection = Enum.FillDirection.Vertical, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }, 
            LayoutOrder = 3
        }, {
            VoiceChatLabel = l_React_0.createElement(l_Foundation_0.Text, {
                AutomaticSize = Enum.AutomaticSize.XY, 
                fontStyle = v33.Typography.TitleSmall, 
                textStyle = v33.Color.Content.Muted, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                TextWrapped = false, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                LayoutOrder = 1, 
                padding = Vector2.new(v33.Padding.Large, v33.Padding.XSmall), 
                Text = v54.voiceChatsLabelText
            }), 
            PartySelector = l_React_0.createElement(v31, {
                icon = l_Images_0["icons/menu/platformChatOff"], 
                LayoutOrder = 2, 
                labelText = v44 or "", 
                isSelected = v35, 
                onActivated = function() --[[ Line: 314 ]] --[[ Name: onActivated ]]
                    -- upvalues: v35 (copy), v45 (copy)
                    if not v35 then
                        v45();
                    end;
                end
            }), 
            ExperienceSelector = l_React_0.createElement(v31, {
                icon = l_Images_0["icons/menu/publicChatOff"], 
                LayoutOrder = 3, 
                labelText = v42 or "", 
                isSelected = not v35, 
                onActivated = function() --[[ Line: 325 ]] --[[ Name: onActivated ]]
                    -- upvalues: v35 (copy), v45 (copy)
                    if v35 then
                        v45();
                    end;
                end
            })
        })
    });
end;