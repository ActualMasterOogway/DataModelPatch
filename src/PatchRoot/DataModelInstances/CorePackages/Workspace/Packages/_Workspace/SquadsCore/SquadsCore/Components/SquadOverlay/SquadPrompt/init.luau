local l_script_FirstAncestor_0 = script:FindFirstAncestor("SquadsCore");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Components.SquadExternalContractProvider.SquadExternalContractContext);
local v3 = require(l_script_FirstAncestor_0.Enums.SquadPromptType);
local v4 = require(l_Parent_0.React);
local v5 = require(l_Parent_0.RobloxAppHooks);
local v6 = require(l_Parent_0.UIBlox);
local v7 = require(l_Parent_0.Cryo);
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useScreenSize_0 = v5.useScreenSize;
local l_ButtonType_0 = v6.App.Button.Enum.ButtonType;
local l_InteractiveAlert_0 = v6.App.Dialog.Alert.InteractiveAlert;
local v14 = {
    hideCancelButton = false
};
return function(v15) --[[ Line: 25 ]]
    -- upvalues: v7 (copy), v14 (copy), v4 (copy), v2 (copy), l_useDispatch_0 (copy), l_useScreenSize_0 (copy), l_dependencyArray_0 (copy), v3 (copy), l_useLocalization_0 (copy), l_ButtonType_0 (copy), l_InteractiveAlert_0 (copy)
    local v16 = v7.Dictionary.join(v14, v15);
    local v17 = v4.useContext(v2);
    local v18 = l_useDispatch_0();
    local v19 = if v16.screenSize then v16.screenSize else l_useScreenSize_0();
    local v20 = v4.useCallback(function() --[[ Line: 32 ]]
        -- upvalues: v18 (copy), v17 (copy), v16 (copy)
        v18(v17.closeSquadPrompt());
        if v16.onCancel then
            v16.onCancel();
        end;
    end, l_dependencyArray_0(v18, v16.onCancel, v17.closeSquadPrompt));
    local v21 = v4.useCallback(function() --[[ Line: 40 ]]
        -- upvalues: v18 (copy), v17 (copy), v16 (copy)
        v18(v17.closeSquadPrompt());
        if v16.onConfirm then
            v16.onConfirm();
        end;
    end, l_dependencyArray_0(v18, v16.onConfirm, v17.closeSquadPrompt));
    local v27 = v4.useCallback(function(v22) --[[ Line: 48 ]]
        -- upvalues: v3 (ref)
        local v23 = nil;
        local v24 = nil;
        local v25 = nil;
        local v26 = "CommonUI.Controls.Action.Cancel";
        if v22 == v3.AlreadyJoined then
            v23 = "Feature.Squads.Label.Error";
            v24 = "Feature.Squads.Description.AlreadyJoined";
            v25 = "Feature.Squads.Action.Ok";
        elseif v22 == v3.ConfirmInviteToSquad then
            v23 = "Feature.Squads.Label.InviteFriendsConfirmation";
            v24 = "Feature.Squads.Description.InviteFriendsToParty";
            v25 = "Feature.Squads.Action.Yes";
        elseif v22 == v3.AddFriends then
            v23 = "Feature.Squads.Label.AddFriends";
            v24 = "Feature.Squads.Description.AddFriends";
            v25 = "Feature.Squads.Action.Ok";
        elseif v22 == v3.FailedToJoin then
            v23 = "Feature.Squads.Label.FailedToJoin";
            v24 = "Feature.Squads.Description.FailedToJoin";
            v25 = "Feature.Squads.Action.Join";
        elseif v22 == v3.JoinAnotherSquad then
            v23 = "Feature.Squads.Label.JoinAnotherParty";
            v24 = "Feature.Squads.Description.JoinAnotherParty";
            v25 = "Feature.Squads.Action.Switch";
        elseif v22 == v3.SquadEnded then
            v23 = "Feature.Squads.Label.PartyEnded";
            v24 = "Feature.Squads.Description.PartyEnded";
            v25 = "Feature.Squads.Action.Start";
        elseif v22 == v3.SquadFull then
            v23 = "Feature.Squads.Label.PartyFull";
            v24 = "Feature.Squads.Description.PartyFull";
            v25 = "Feature.Squads.Action.Join";
        elseif v22 == v3.InvitedToExperience then
            v23 = "Feature.Squads.Label.InvitedToExperience";
            v24 = "Feature.Squads.Description.InvitedToExperience";
            v25 = "Feature.Squads.Action.Retry";
        elseif v22 == v3.RemoveFromChat then
            v23 = "Feature.Squads.Label.RemoveFromChat";
            v24 = "Feature.Squads.Description.RemoveFromChat";
            v25 = "Feature.Squads.Action.Remove";
        elseif v22 == v3.JoinWithLowMemory then
            v23 = "Feature.Squads.Label.LowMemory";
            v24 = "Feature.Squads.Description.JoinWithLowMemory";
            v25 = "Feature.Squads.Action.ContinueWithoutVoice";
            v26 = "Feature.Squads.Action.ConnectToVoice";
        elseif v22 == v3.ConnectVoiceWithLowMemory then
            v23 = "Feature.Squads.Label.LowMemory";
            v24 = "Feature.Squads.Description.ConnectVoiceWithLowMemory";
            v25 = "Feature.Squads.Action.ContinueWithoutVoice";
            v26 = "Feature.Squads.Action.ConnectToVoice";
        elseif v22 == v3.DisconnectVoiceDueToLowMemory then
            v23 = "Feature.Squads.Label.LowMemory";
            v24 = "Feature.Squads.Description.DisconnectVoiceDueToLowMemory";
            v25 = "Feature.Squads.Action.DisconnectFromVoice";
            v26 = "Feature.Chat.Action.Continue";
        else
            v23 = "Feature.Squads.Label.PartyOperationFailed";
            v24 = "Feature.Squads.Description.PleaseTryAgain";
            v25 = "Feature.Squads.Action.Ok";
        end;
        return {
            title = v23, 
            bodyText = v24, 
            confirmText = v25, 
            cancelButtonText = v26
        };
    end, {});
    local v28 = v4.useMemo(function() --[[ Line: 112 ]]
        -- upvalues: v27 (copy), v16 (copy)
        return v27(v16.promptType);
    end, l_dependencyArray_0(v16.promptType));
    local v29 = l_useLocalization_0({
        title = v28.title, 
        bodyText = v28.bodyText, 
        confirmText = v28.confirmText, 
        cancelButtonText = v28.cancelButtonText
    });
    local v31 = v4.useCallback(function() --[[ Line: 124 ]]
        -- upvalues: v16 (copy), v20 (copy), v29 (copy), l_ButtonType_0 (ref), v21 (copy)
        local v30 = {};
        if not v16.hideCancelButton then
            table.insert(v30, {
                props = {
                    onActivated = v20, 
                    text = v29.cancelButtonText
                }
            });
        end;
        table.insert(v30, {
            buttonType = l_ButtonType_0.PrimarySystem, 
            props = {
                onActivated = v21, 
                text = v29.confirmText
            }
        });
        return v30;
    end, l_dependencyArray_0(v29.cancelButtonText, v29.confirmText, v16.hideCancelButton, v21, v20));
    return v4.createElement(l_InteractiveAlert_0, {
        screenSize = v19, 
        title = v29.title, 
        bodyText = v29.bodyText, 
        buttonStackInfo = {
            buttons = v31()
        }
    });
end;