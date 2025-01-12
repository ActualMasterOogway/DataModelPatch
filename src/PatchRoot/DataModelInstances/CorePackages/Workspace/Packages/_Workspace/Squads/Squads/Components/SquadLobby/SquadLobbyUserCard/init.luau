local l_script_FirstAncestor_0 = script:FindFirstAncestor("Squads");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_CrossExperienceVoice_0 = v1.CrossExperienceVoice;
local l_PresenceType_0 = v1.RoduxPresence.Enums.PresenceType;
local l_Foundation_0 = v1.Foundation;
local l_React_0 = v1.React;
local l_SharedFlags_0 = v1.SharedFlags;
local l_UIBlox_0 = v1.UIBlox;
local l_UserProfiles_0 = v1.UserProfiles;
local l_dependencyArray_0 = v1.Hooks.dependencyArray;
local l_getStandardSizeAvatarHeadShotRbxthumb_0 = v1.getStandardSizeAvatarHeadShotRbxthumb;
local l_useLocalization_0 = v1.Hooks.useLocalization;
local l_useSelector_0 = v1.Hooks.useSelector;
local l_useParticipant_0 = l_CrossExperienceVoice_0.Hooks.useParticipant;
local l_useIsVoiceConnected_0 = l_CrossExperienceVoice_0.Hooks.useIsVoiceConnected;
local l_useIsActiveParticipant_0 = l_CrossExperienceVoice_0.Hooks.useIsActiveParticipant;
local l_useAnimatedTransparency_0 = l_CrossExperienceVoice_0.Hooks.useAnimatedTransparency;
local l_useIsParticipantMuted_0 = l_CrossExperienceVoice_0.Hooks.useIsParticipantMuted;
local l_useIsVoiceConnecting_0 = l_CrossExperienceVoice_0.Hooks.useIsVoiceConnecting;
local l_useIsParticipantInOtherAudioContext_0 = l_CrossExperienceVoice_0.Hooks.useIsParticipantInOtherAudioContext;
local l_useTokens_0 = l_Foundation_0.Hooks.useTokens;
local l_useLocalUserId_0 = v1.Hooks.useLocalUserId;
local v22 = require(l_script_FirstAncestor_0.Hooks.useSquadUserDropdownMenuButtons);
local l_useIsLocalPlayerPartyVoiceEligible_0 = v1.SquadsCore.Hooks.useIsLocalPlayerPartyVoiceEligible;
local l_useIsUserPartyVoiceEligible_0 = v1.SquadsCore.Hooks.useIsUserPartyVoiceEligible;
local l_useIsCurrentSquadPartyVoiceEligible_0 = v1.SquadsCore.Hooks.useIsCurrentSquadPartyVoiceEligible;
local l_GetFFlagEnableCrossExpVoice_0 = l_SharedFlags_0.GetFFlagEnableCrossExpVoice;
local l_FFlagEnableSquadUserCardHoverFix_0 = l_SharedFlags_0.FFlagEnableSquadUserCardHoverFix;
local l_IconSize_0 = l_Foundation_0.Enums.IconSize;
local l_ImageSetLabel_0 = l_UIBlox_0.Core.ImageSet.ImageSetLabel;
local _ = require(l_script_FirstAncestor_0.Common.ModelTypes);
local v31 = game:DefineFastFlag("EnablePartyVoiceCrossContextIdValidation", false);
local v32 = game:DefineFastFlag("ApplyVoiceConnectingStatusInPartySheet", false);
local v33 = game:DefineFastInt("PartyVoiceActivityIndicatorDebounceMs", 100);
local v34 = game:DefineFastInt("PartyVoiceActivityIndicatorAnimationMs", 100);
return function(v35) --[[ Line: 69 ]]
    -- upvalues: l_useLocalization_0 (copy), l_useTokens_0 (copy), l_useAnimatedTransparency_0 (copy), v34 (copy), l_UserProfiles_0 (copy), l_getStandardSizeAvatarHeadShotRbxthumb_0 (copy), l_React_0 (copy), l_useSelector_0 (copy), l_PresenceType_0 (copy), l_useLocalUserId_0 (copy), l_GetFFlagEnableCrossExpVoice_0 (copy), l_useIsVoiceConnected_0 (copy), l_useParticipant_0 (copy), l_useIsVoiceConnecting_0 (copy), l_useIsActiveParticipant_0 (copy), l_useIsLocalPlayerPartyVoiceEligible_0 (copy), l_useIsUserPartyVoiceEligible_0 (copy), l_useIsCurrentSquadPartyVoiceEligible_0 (copy), l_useIsParticipantMuted_0 (copy), v31 (copy), l_useIsParticipantInOtherAudioContext_0 (copy), l_CrossExperienceVoice_0 (copy), v33 (copy), l_Foundation_0 (copy), l_IconSize_0 (copy), l_dependencyArray_0 (copy), v32 (copy), l_FFlagEnableSquadUserCardHoverFix_0 (copy), v22 (copy), l_ImageSetLabel_0 (copy)
    local v36 = l_useLocalization_0({
        inExperiencePresenceText = "Common.Presence.Label.InExperience", 
        onlinePresenceText = "Common.Presence.Label.Online", 
        connectingText = "Feature.Squads.Label.Connecting"
    });
    local v37 = l_useTokens_0();
    local v38, v39 = l_useAnimatedTransparency_0(1, v34, Enum.EasingStyle.Cubic);
    local v40 = l_UserProfiles_0.Hooks.useUserProfilesFetch({
        userIds = {
            (tostring(v35.user.userId))
        }, 
        query = l_UserProfiles_0.Queries.userProfilesCombinedNameByUserIds
    });
    local v41 = "";
    if v40.data then
        v41 = l_UserProfiles_0.Selectors.getCombinedNameFromId(v40.data, v35.user.userId);
    end;
    local v42 = l_getStandardSizeAvatarHeadShotRbxthumb_0((tostring(v35.user.userId)));
    local v44 = l_React_0.useCallback(function(v43) --[[ Line: 90 ]]
        -- upvalues: v35 (copy)
        return v43.Squad.Presence.byUserId[tostring(v35.user.userId)];
    end, {
        v35.user.userId
    });
    local v45 = l_useSelector_0(v44);
    local v46 = v45 and v45.userPresenceType == l_PresenceType_0.InGame;
    local v47 = nil;
    v47 = if v46 then if v45.lastLocation and v45.lastLocation ~= "" then v45.lastLocation else v36.inExperiencePresenceText else v36.onlinePresenceText;
    local l_isConnecting_0 = v35.isConnecting;
    local v49 = tonumber(l_useLocalUserId_0()) or 0;
    local v50 = v49 == v35.user.userId;
    local v51 = nil;
    local v52 = false;
    local v53 = false;
    local v54 = false;
    local v55 = false;
    local v56 = false;
    local v57 = false;
    local v58 = false;
    local v59 = false;
    local v60 = false;
    local v61 = false;
    if l_GetFFlagEnableCrossExpVoice_0() then
        v53 = l_useIsVoiceConnected_0();
        v51 = l_useParticipant_0(v35.user.userId);
        v61 = l_useIsVoiceConnecting_0() and v50;
        v52 = l_useIsActiveParticipant_0(v35.user.userId);
        v54 = l_useIsLocalPlayerPartyVoiceEligible_0();
        v55 = l_useIsUserPartyVoiceEligible_0(v35.user.userId);
        v56 = l_useIsCurrentSquadPartyVoiceEligible_0() == true;
        v60 = l_useIsParticipantMuted_0(v35.user.userId);
        if v31 then
            v59 = l_useIsParticipantInOtherAudioContext_0(v49, v35.user.userId) == true;
        end;
        v57 = v56 and v54 and v55 and (not v53 or not v51 or v59);
        v58 = v56 and v54 and not v55;
    end;
    local v63 = l_React_0.useMemo(function() --[[ Line: 143 ]]
        -- upvalues: l_CrossExperienceVoice_0 (ref), v39 (copy), v33 (ref)
        return l_CrossExperienceVoice_0.Utils.debounce(function(v62) --[[ Line: 144 ]]
            -- upvalues: v39 (ref)
            v39(v62);
        end, v33);
    end, {});
    l_React_0.useEffect(function() --[[ Line: 149 ]]
        -- upvalues: l_GetFFlagEnableCrossExpVoice_0 (ref), v52 (ref), v63 (copy), v39 (copy)
        if l_GetFFlagEnableCrossExpVoice_0() then
            if v52 then
                v63.cancel();
                v39(0);
                return;
            else
                v63.call(1);
            end;
        end;
    end, {
        v52
    });
    local v64 = l_React_0.useMemo(function() --[[ Line: 161 ]]
        -- upvalues: v41 (ref), l_React_0 (ref), v37 (copy), v35 (copy), l_Foundation_0 (ref), l_IconSize_0 (ref), v60 (ref), v57 (ref), v58 (ref)
        if v41 ~= "" then
            return (l_React_0.createElement("Frame", {
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = UDim2.fromScale(1, 0), 
                BackgroundTransparency = 1, 
                LayoutOrder = 1
            }, {
                UIListLayout = l_React_0.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal, 
                    Padding = UDim.new(0, v37.Gap.XSmall + 2), 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    VerticalAlignment = Enum.VerticalAlignment.Center
                }), 
                BlockedIcon = if v35.isBlocked then l_React_0.createElement(l_Foundation_0.Icon, {
                    LayoutOrder = 1, 
                    name = "icons/status/unavailable_small", 
                    size = l_IconSize_0.Small, 
                    style = v37.Color.Extended.Red.Red_800
                }) else nil, 
                MutedIcon = if v60 then l_React_0.createElement(l_Foundation_0.Icon, {
                    LayoutOrder = 2, 
                    name = "icons/controls/microphoneMute_small", 
                    size = l_IconSize_0.Small, 
                    style = v37.Color.Content.Emphasis
                }) else nil, 
                NotVoiceParticipantIcon = if v57 then l_React_0.createElement(l_Foundation_0.Icon, {
                    LayoutOrder = 3, 
                    name = "icons/controls/headphoneDeafen_small", 
                    size = l_IconSize_0.Small, 
                    style = v37.Color.Content.Emphasis
                }) else nil, 
                NotEligibleVoiceParticipant = if v58 then l_React_0.createElement(l_Foundation_0.Icon, {
                    LayoutOrder = 4, 
                    name = "icons/controls/headphoneDeafen_small", 
                    size = l_IconSize_0.Small, 
                    style = v37.Color.System.Warning
                }) else nil, 
                NameTextLabel = l_React_0.createElement(l_Foundation_0.Text, {
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    backgroundStyle = v37.Color.None, 
                    colorstyle = v37.Color.Content.Emphasis, 
                    fontStyle = v37.Typography.TitleMedium, 
                    LayoutOrder = 5, 
                    Text = v41, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextYAlignment = Enum.TextYAlignment.Center, 
                    TextTruncate = Enum.TextTruncate.AtEnd, 
                    TextWrapped = false
                }, {
                    UIFlexItem = l_React_0.createElement("UIFlexItem", {
                        FlexMode = Enum.UIFlexMode.Fill
                    })
                })
            }));
        else
            return nil;
        end;
    end, l_dependencyArray_0(v41, v60, v35.isBlocked, v37, v57, v58));
    local v65 = l_React_0.useMemo(function() --[[ Line: 236 ]]
        -- upvalues: l_React_0 (ref), v37 (copy), l_isConnecting_0 (copy), v32 (ref), v61 (ref), l_Foundation_0 (ref), l_IconSize_0 (ref), v46 (copy), v36 (copy), v47 (ref)
        return l_React_0.createElement("Frame", {
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.fromScale(1, 0), 
            BackgroundTransparency = 1, 
            LayoutOrder = 2
        }, {
            UIListLayout = l_React_0.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                Padding = UDim.new(0, v37.Gap.XSmall), 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }), 
            PresenceIcon = if not not l_isConnecting_0 or v32 and v61 then l_React_0.createElement(l_Foundation_0.View, {
                tag = "auto-xy"
            }, {
                LoadingIcon = l_React_0.createElement(l_Foundation_0.Loading, {
                    LayoutOrder = 1, 
                    size = l_IconSize_0.Small, 
                    Padding = v37.Padding.XSmall
                })
            }) else if v46 then l_React_0.createElement(l_Foundation_0.Icon, {
                LayoutOrder = 1, 
                name = "icons/common/play", 
                size = l_IconSize_0.Small, 
                style = v37.Color.Content.Emphasis
            }) else nil, 
            PresenceTextLabel = l_React_0.createElement(l_Foundation_0.Text, {
                AutomaticSize = Enum.AutomaticSize.Y, 
                backgroundStyle = v37.Color.None, 
                colorstyle = v37.Color.Content.Default, 
                fontStyle = v37.Typography.BodyMedium, 
                LayoutOrder = 2, 
                Text = if not not l_isConnecting_0 or v32 and v61 then v36.connectingText else v47, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                TextWrapped = false
            }, {
                UIFlexItem = l_React_0.createElement("UIFlexItem", {
                    FlexMode = Enum.UIFlexMode.Fill
                })
            })
        });
    end, l_dependencyArray_0(l_isConnecting_0, v61, v46, v36.connectingText, v47, v37));
    local v66 = nil;
    if l_FFlagEnableSquadUserCardHoverFix_0 then
        local v67 = #v22(v35.user.userId, v35.isInExperience) < 1;
        v66 = not v50 and not v67;
    else
        v66 = not v50;
    end;
    local v68 = l_React_0.useCallback(function() --[[ Line: 296 ]]
        -- upvalues: v35 (copy)
        if v35.onActivated then
            v35.onActivated((tostring(v35.user.userId)));
        end;
    end, l_dependencyArray_0(v35.onActivated, v35.user.userId));
    return l_React_0.createElement(l_Foundation_0.View, {
        LayoutOrder = v35.layoutOrder, 
        Size = v35.size, 
        backgroundStyle = v37.Color.Surface.Surface_200, 
        cornerRadius = UDim.new(0, v37.Radius.Medium), 
        isDisabled = l_isConnecting_0 or v32 and v61, 
        onActivated = if v35.onActivated and v66 then v68 else nil
    }, {
        AvatarImage = l_React_0.createElement(l_ImageSetLabel_0, {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.fromScale(0.5, 0.5), 
            Size = UDim2.fromOffset(96, 96), 
            BackgroundColor3 = v37.Color.Shift.Shift_300.Color3, 
            BackgroundTransparency = v37.Color.Shift.Shift_300.Transparency, 
            Image = v42, 
            ZIndex = 0
        }, {
            UICorner = l_React_0.createElement("UICorner", {
                CornerRadius = UDim.new(1, 0)
            })
        }), 
        GradientFrame = l_React_0.createElement("Frame", {
            Size = UDim2.fromScale(1, 0.5), 
            Position = UDim2.fromScale(0, 1), 
            AnchorPoint = Vector2.new(0, 1), 
            BackgroundColor3 = v37.Color.Surface.Surface_100.Color3, 
            BackgroundTransparency = v37.Color.Surface.Surface_100.Transparency, 
            ZIndex = 1
        }, {
            UICorner = l_React_0.createElement("UICorner", {
                CornerRadius = UDim.new(0, v37.Radius.Medium)
            }), 
            UIGradient = l_React_0.createElement("UIGradient", {
                Rotation = 90, 
                Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 1), 
                    NumberSequenceKeypoint.new(1, 0)
                })
            }, {})
        }), 
        InactiveOverlay = if not not l_isConnecting_0 or v57 or v32 and v61 then l_React_0.createElement(l_Foundation_0.View, {
            tag = "size-full radius-medium", 
            backgroundStyle = {
                Color3 = v37.Color.Surface.Surface_100.Color3, 
                Transparency = 0.25
            }
        }, {}) else nil, 
        TextContainer = l_React_0.createElement("Frame", {
            AutomaticSize = Enum.AutomaticSize.Y, 
            AnchorPoint = Vector2.new(0, 1), 
            Position = UDim2.fromScale(0, 1), 
            Size = UDim2.fromScale(1, 0), 
            BackgroundTransparency = 1, 
            ZIndex = 2
        }, {
            UIListLayout = l_React_0.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Bottom
            }), 
            UIPadding = l_React_0.createElement("UIPadding", {
                PaddingBottom = UDim.new(0, v37.Padding.Medium), 
                PaddingLeft = UDim.new(0, v37.Padding.Medium), 
                PaddingRight = UDim.new(0, v37.Padding.Medium), 
                PaddingTop = UDim.new(0, v37.Padding.Medium)
            }), 
            Name = v64, 
            Presence = if not v35.isBlocked then v65 else nil
        }), 
        ActiveBorder = l_React_0.createElement("Frame", {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            Size = UDim2.new(1, -8, 1, -8), 
            BackgroundTransparency = 1, 
            ZIndex = 4
        }, {
            UICorner = l_React_0.createElement("UICorner", {
                CornerRadius = UDim.new(0, v37.Radius.Medium - 4)
            }), 
            UIStroke = l_React_0.createElement("UIStroke", {
                Thickness = 4, 
                Color = v37.Color.Extended.Green.Green_800.Color3, 
                Transparency = v38
            })
        }), 
        DefaultBorder = l_React_0.createElement("Frame", {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            Size = UDim2.new(1, -2, 1, -2), 
            BackgroundTransparency = 1, 
            ZIndex = 3
        }, {
            UICorner = l_React_0.createElement("UICorner", {
                CornerRadius = UDim.new(0, v37.Radius.Medium - 1)
            }), 
            UIStroke = l_React_0.createElement("UIStroke", {
                Thickness = 1, 
                Color = v37.Color.Stroke.Default.Color3, 
                Transparency = v38:map(function(v69) --[[ Line: 410 ]]
                    -- upvalues: v37 (copy)
                    if v69 < 0.9 then
                        return 1;
                    else
                        return v37.Color.Stroke.Default.Transparency;
                    end;
                end)
            })
        })
    });
end;