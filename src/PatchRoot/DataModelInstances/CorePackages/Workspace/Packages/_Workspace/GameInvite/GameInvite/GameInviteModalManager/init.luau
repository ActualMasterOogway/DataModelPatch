local l_Players_0 = game:GetService("Players");
local l_SocialService_0 = game:GetService("SocialService");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameInvite");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_utils_0 = l_script_FirstAncestor_0.utils;
local _ = require(l_script_FirstAncestor_0.gameInviteModalType);
local v7 = require(l_Parent_0.Cryo);
local v8 = require(l_script_FirstAncestor_0.analytics.GameInviteAnalyticsManager);
local v9 = require(l_utils_0.getCustomizedInvitePromptParams);
local v10 = require(l_utils_0.getCanSendAndCanCustomizeInvites);
local l_isTriggerDDI_0 = require(l_utils_0.gameInviteModalHelper).isTriggerDDI;
game:DefineFastFlag("GameInviteModalAnalyticsEmptyEventContextFix", false);
local v12 = {};
v12.__index = v12;
v12.new = function() --[[ Line: 22 ]] --[[ Name: new ]]
    -- upvalues: v12 (copy)
    return (setmetatable({}, v12));
end;
v12.ToggleGameInviteModalEvent = Instance.new("BindableEvent");
v12.isModalOpen = false;
v12.openTrigger = nil;
v12.customParams = nil;
v12.placeId = nil;
v12.openModal = function(v13, v14, v15) --[[ Line: 36 ]] --[[ Name: openModal ]]
    -- upvalues: l_isTriggerDDI_0 (copy), v9 (copy), v10 (copy), v7 (copy), v8 (copy), l_ContextActionService_0 (copy)
    if not v13.isModalOpen then
        v13.isModalOpen = true;
        v13.openTrigger = v14.trigger;
        v13.placeId = v14.rootPlaceId or tostring(game.PlaceId);
        local v16 = false;
        local v17 = false;
        local v18 = false;
        if l_isTriggerDDI_0(v14.trigger) then
            v13.ToggleGameInviteModalEvent:Fire(true, true, v14);
            local v19 = v9(v15, v14.trigger, v10);
            v13.customParams = v19;
            if v19 then
                local v20 = false;
                if v19.launchData ~= nil then
                    v20 = v19.launchData ~= "";
                end;
                v16 = v20;
                v20 = false;
                if v19.promptMessage ~= nil then
                    v20 = v19.promptMessage ~= "";
                end;
                v17 = v20;
                v20 = false;
                if v19.inviteMessageId ~= nil then
                    v20 = v19.inviteMessageId ~= "";
                end;
                v18 = v20;
                v13.ToggleGameInviteModalEvent:Fire(true, false, v7.Dictionary.join(v14, v19));
                if game:GetFastFlag("GameInviteModalAnalyticsEmptyEventContextFix") then
                    v8:sendGameInviteModalEvent(v14.trigger, {
                        action_type = v8.ActionType.ModalOpen, 
                        is_launch_data_provided = v16, 
                        is_prompt_customized = v17, 
                        is_invite_message_id_provided = v18, 
                        place_id = v14.rootPlaceId
                    });
                end;
            else
                v13:closeModal();
            end;
        else
            v13.ToggleGameInviteModalEvent:Fire(true, false, v14);
            if game:GetFastFlag("GameInviteModalAnalyticsEmptyEventContextFix") then
                v8:sendGameInviteModalEvent(v14.trigger, {
                    action_type = v8.ActionType.ModalOpen, 
                    is_launch_data_provided = v16, 
                    is_prompt_customized = v17, 
                    is_invite_message_id_provided = v18, 
                    place_id = v14.rootPlaceId
                });
            end;
        end;
        if not game:GetFastFlag("GameInviteModalAnalyticsEmptyEventContextFix") then
            v8:sendGameInviteModalEvent(v14.trigger, {
                action_type = v8.ActionType.ModalOpen, 
                is_launch_data_provided = v16, 
                is_prompt_customized = v17, 
                is_invite_message_id_provided = v18, 
                place_id = v14.rootPlaceId
            });
        end;
        l_ContextActionService_0:BindCoreAction("hideGameInviteModal", function(_, v22) --[[ Line: 94 ]]
            -- upvalues: v13 (copy)
            if v22 == Enum.UserInputState.Begin then
                v13:closeModal();
            end;
        end, false, Enum.KeyCode.ButtonB, Enum.KeyCode.Backspace);
        return;
    else
        if l_isTriggerDDI_0(v14.trigger) then
            v13:invokeGameInvitePromptClosed();
        end;
        return;
    end;
end;
v12.closeModal = function(v23, v24) --[[ Line: 107 ]] --[[ Name: closeModal ]]
    -- upvalues: l_isTriggerDDI_0 (copy), v8 (copy), l_ContextActionService_0 (copy)
    if v23.isModalOpen then
        local v25 = false;
        local v26 = false;
        local v27 = false;
        if l_isTriggerDDI_0(v23.openTrigger) then
            if v23.customParams then
                local v28 = false;
                if v23.customParams.launchData ~= nil then
                    v28 = v23.customParams.launchData ~= "";
                end;
                v25 = v28;
                v28 = false;
                if v23.customParams.promptMessage ~= nil then
                    v28 = v23.customParams.promptMessage ~= "";
                end;
                v26 = v28;
                v28 = false;
                if v23.customParams.inviteMessageId ~= nil then
                    v28 = v23.customParams.inviteMessageId ~= "";
                end;
                v27 = v28;
            end;
            v23:invokeGameInvitePromptClosed();
        end;
        v8:sendGameInviteModalEvent(v23.openTrigger, {
            action_type = v8.ActionType.ModalClose, 
            is_launch_data_provided = v25, 
            is_prompt_customized = v26, 
            is_invite_message_id_provided = v27, 
            max_recipient_row_number = v24, 
            place_id = v23.placeId
        });
        l_ContextActionService_0:UnbindCoreAction("hideGameInviteModal");
        v23.isModalOpen = false;
        v23.openTrigger = nil;
        v23.placeId = nil;
    end;
    v23.ToggleGameInviteModalEvent:Fire(false);
end;
v12.isGameModalOpen = function(v29) --[[ Line: 141 ]] --[[ Name: isGameModalOpen ]]
    return v29.isModalOpen;
end;
v12.invokeGameInvitePromptClosed = function(_) --[[ Line: 145 ]] --[[ Name: invokeGameInvitePromptClosed ]]
    -- upvalues: l_SocialService_0 (copy), l_Players_0 (copy)
    if l_SocialService_0 and l_Players_0.LocalPlayer then
        l_SocialService_0:InvokeGameInvitePromptClosed(l_Players_0.LocalPlayer, {});
    end;
end;
return v12.new();