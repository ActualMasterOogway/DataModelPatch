local l_Parent_0 = script:FindFirstAncestor("SocialCards").Parent;
local v1 = require(l_Parent_0.Foundation);
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Squads);
local v4 = require(l_Parent_0.SquadsCore);
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local l_useCurrentSquadId_0 = v4.Hooks.useCurrentSquadId;
local l_useCurrentSquadParentChannelId_0 = v4.Hooks.useCurrentSquadParentChannelId;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local l_leaveSquad_0 = v4.Thunks.leaveSquad;
local l_SquadButtonClickIntentionEnum_0 = v3.Enums.SquadButtonClickIntentionEnum;
local l_SquadButtonSourceEnum_0 = v3.Enums.SquadButtonSourceEnum;
local l_EventNames_0 = v4.Analytics.EventNames;
local l_SquadExternalContractContext_0 = v4.SquadExternalContractProvider.SquadExternalContractContext;
local l_SquadPromptType_0 = v4.Enums.SquadPromptType;
local l_useTokens_0 = v1.Hooks.useTokens;
local l_GetFFlagEnableSquadEntrypointsSettingsFix_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableSquadEntrypointsSettingsFix;
return function(v19) --[[ Line: 33 ]] --[[ Name: SquadEndedCard ]]
    -- upvalues: l_useDispatch_0 (copy), l_useLocalization_0 (copy), l_useNavigation_0 (copy), l_useTokens_0 (copy), l_useCurrentSquadId_0 (copy), l_useCurrentSquadParentChannelId_0 (copy), v2 (copy), l_SquadExternalContractContext_0 (copy), l_GetFFlagEnableSquadEntrypointsSettingsFix_0 (copy), l_dependencyArray_0 (copy), l_SquadButtonClickIntentionEnum_0 (copy), l_EventNames_0 (copy), l_SquadButtonSourceEnum_0 (copy), v1 (copy), l_leaveSquad_0 (copy), l_SquadPromptType_0 (copy)
    local v20 = l_useDispatch_0();
    local v21 = l_useLocalization_0({
        partyEnded = "Feature.Squads.Label.PartyEndedText", 
        tapToStartNewParty = "Feature.Squads.Action.TapToStartNewParty"
    });
    local v22 = l_useNavigation_0();
    local v23 = l_useTokens_0();
    local v24 = l_useCurrentSquadId_0();
    local v25 = l_useCurrentSquadParentChannelId_0();
    local v26 = v2.useContext(l_SquadExternalContractContext_0);
    local v27 = v26.useParentChannelHasGroupUp(v19.conversationId);
    local v28 = nil;
    if l_GetFFlagEnableSquadEntrypointsSettingsFix_0() then
        v28 = v26.useParentChannelHasSquadAccess(v19.conversationId);
    end;
    local v29 = v2.useMemo(function() --[[ Line: 52 ]]
        -- upvalues: v25 (copy), v19 (copy)
        return v25 == v19.conversationId;
    end, l_dependencyArray_0(v25, v19.conversationId));
    local v30 = v2.useMemo(function() --[[ Line: 56 ]]
        -- upvalues: v29 (copy), l_SquadButtonClickIntentionEnum_0 (ref), v27 (copy)
        if v29 then
            return l_SquadButtonClickIntentionEnum_0.View;
        elseif v27 then
            return l_SquadButtonClickIntentionEnum_0.Join;
        else
            return l_SquadButtonClickIntentionEnum_0.Create;
        end;
    end, l_dependencyArray_0(v29, v27));
    local v31 = v2.useCallback(function() --[[ Line: 67 ]]
        -- upvalues: v26 (copy), l_EventNames_0 (ref), v19 (copy), l_SquadButtonSourceEnum_0 (ref), v24 (copy), v30 (copy)
        v26.fireSquadAnalytics(l_EventNames_0.EnterSquadButtonPressed, {
            conversationId = v19.conversationId, 
            squadButtonSource = l_SquadButtonSourceEnum_0.PartyEndedCard, 
            squadId = v24, 
            squadLocation = v19.squadLocation, 
            userIntention = v30
        });
    end, l_dependencyArray_0(v30, v24, v19.conversationId, v19.squadLocation, v26.fireSquadAnalytics));
    return v2.createElement(v1.View, {
        AutomaticSize = Enum.AutomaticSize.Y, 
        Size = UDim2.fromScale(1, 0), 
        backgroundStyle = v23.Color.Shift.Shift_200, 
        cornerRadius = UDim.new(0, v23.Radius.Large), 
        layout = {
            FillDirection = Enum.FillDirection.Vertical, 
            Padding = UDim.new(0, v23.Gap.XSmall), 
            SortOrder = Enum.SortOrder.LayoutOrder
        }, 
        onActivated = l_GetFFlagEnableSquadEntrypointsSettingsFix_0() and v28 and function() --[[ Line: 96 ]]
            -- upvalues: v31 (copy), v24 (copy), v19 (copy), v25 (copy), v20 (copy), l_leaveSquad_0 (ref), l_SquadPromptType_0 (ref), v26 (copy), v22 (copy)
            v31();
            if v24 and v19.conversationId ~= v25 then
                v20(l_leaveSquad_0(l_SquadPromptType_0.JoinAnotherSquad, v26.setSquadPrompt, function() --[[ Line: 99 ]]
                    -- upvalues: v22 (ref), v19 (ref)
                    v22.navigate("SquadLobby", {
                        conversationId = v19.conversationId
                    });
                end));
                return;
            else
                v22.navigate("SquadLobby", {
                    conversationId = v19.conversationId
                });
                return;
            end;
        end or (not l_GetFFlagEnableSquadEntrypointsSettingsFix_0() or v28) and function() --[[ Line: 107 ]]
            -- upvalues: v31 (copy), v24 (copy), v19 (copy), v25 (copy), v20 (copy), l_leaveSquad_0 (ref), l_SquadPromptType_0 (ref), v26 (copy), v22 (copy)
            v31();
            if v24 and v19.conversationId ~= v25 then
                v20(l_leaveSquad_0(l_SquadPromptType_0.JoinAnotherSquad, v26.setSquadPrompt, function() --[[ Line: 110 ]]
                    -- upvalues: v22 (ref), v19 (ref)
                    v22.navigate("SquadLobby", {
                        conversationId = v19.conversationId
                    });
                end));
                return;
            else
                v22.navigate("SquadLobby", {
                    conversationId = v19.conversationId
                });
                return;
            end;
        end or nil, 
        padding = {
            bottom = UDim.new(0, v23.Padding.Medium), 
            left = UDim.new(0, v23.Padding.Large), 
            right = UDim.new(0, v23.Padding.Large), 
            top = UDim.new(0, v23.Padding.Medium)
        }
    }, {
        Title = v2.createElement(v1.Text, {
            AutomaticSize = Enum.AutomaticSize.XY, 
            backgroundStyle = v23.Color.None, 
            fontStyle = v23.Typography.TitleMedium, 
            LayoutOrder = 1, 
            Text = v21.partyEnded, 
            textStyle = v23.Color.Content.Emphasis, 
            TextTruncate = Enum.TextTruncate.AtEnd
        }), 
        Status = if l_GetFFlagEnableSquadEntrypointsSettingsFix_0() and v28 then v2.createElement(v1.Text, {
            AutomaticSize = Enum.AutomaticSize.XY, 
            backgroundStyle = v23.Color.None, 
            fontStyle = v23.Typography.LabelSmall, 
            LayoutOrder = 2, 
            Text = v21.tapToStartNewParty, 
            textStyle = v23.Color.Content.Muted, 
            TextTruncate = Enum.TextTruncate.AtEnd
        }) else if not l_GetFFlagEnableSquadEntrypointsSettingsFix_0() or v28 then v2.createElement(v1.Text, {
            AutomaticSize = Enum.AutomaticSize.XY, 
            backgroundStyle = v23.Color.None, 
            fontStyle = v23.Typography.LabelSmall, 
            LayoutOrder = 2, 
            Text = v21.tapToStartNewParty, 
            textStyle = v23.Color.Content.Muted, 
            TextTruncate = Enum.TextTruncate.AtEnd
        }) else nil
    });
end;