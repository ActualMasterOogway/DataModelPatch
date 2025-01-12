local l_Players_0 = game:GetService("Players");
local l_TextChatService_0 = game:GetService("TextChatService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v4 = require(l_Parent_0.Promise);
local l_List_0 = require(l_Parent_0.llama).List;
local v6 = require(l_Parent_0.ExpChatShared);
local l_Analytics_0 = v6.Analytics;
local v8 = require(script.Parent.Logger);
local v9 = require(l_script_FirstAncestor_0.Config);
local l_autoCastCommand_0 = v6.Commands.autoCastCommand;
local l_RBXWhisperCommand_0 = v6.Commands.Whisper.RBXWhisperCommand;
local l_ChatInputBarResetTargetChannel_0 = v6.Actions.ChatInputBarResetTargetChannel;
local v13 = require(l_script_FirstAncestor_0.Actions.UserInteraction);
local v14 = require(l_script_FirstAncestor_0.Actions.ChatTranslationGlobalToggled);
local v15 = require(l_script_FirstAncestor_0.Actions.ChatTranslationMessageToggled);
local v16 = require(l_script_FirstAncestor_0.Flags.getFFlagChatTranslationUIEnabled);
return function(v17) --[[ Line: 23 ]]
    -- upvalues: l_Players_0 (copy), l_autoCastCommand_0 (copy), l_RBXWhisperCommand_0 (copy), v4 (copy), v8 (copy), v16 (copy), v14 (copy), l_Analytics_0 (copy), v15 (copy), l_ChatInputBarResetTargetChannel_0 (copy), v13 (copy), l_TextChatService_0 (copy), l_List_0 (copy), v9 (copy)
    return {
        activateWhisperMode = function(v18) --[[ Line: 25 ]] --[[ Name: activateWhisperMode ]]
            -- upvalues: l_Players_0 (ref), l_autoCastCommand_0 (ref), l_RBXWhisperCommand_0 (ref), v4 (ref), v8 (ref)
            local l_l_Players_0_PlayerByUserId_0 = l_Players_0:GetPlayerByUserId(v18);
            local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
            if not l_l_Players_0_PlayerByUserId_0 then
                return;
            elseif l_l_Players_0_PlayerByUserId_0 == l_LocalPlayer_0 then
                return;
            else
                assert(l_LocalPlayer_0, "Players.LocalPlayer should be non-nil");
                local l_Name_0 = l_l_Players_0_PlayerByUserId_0.Name;
                local v22 = {
                    l_autoCastCommand_0(l_RBXWhisperCommand_0, l_LocalPlayer_0.UserId, "/w @" .. l_Name_0)
                };
                v4.any(v22):catch(function(v23) --[[ Line: 41 ]]
                    -- upvalues: v8 (ref)
                    v8:debug("Could not send autoCastCommand. Error: {}", v23);
                end);
                return;
            end;
        end, 
        onToggleTranslation = v16() and function(v24) --[[ Line: 47 ]]
            -- upvalues: v17 (copy), v14 (ref)
            v17(v14(v24));
        end or nil, 
        onToggleIndividualTranslation = v16() and function(v25, v26) --[[ Line: 53 ]]
            -- upvalues: l_Players_0 (ref), l_Analytics_0 (ref), v17 (copy), v15 (ref)
            local v27 = {
                useTranslation = v25, 
                senderUserId = if l_Players_0.LocalPlayer then l_Players_0.LocalPlayer.UserId else nil, 
                localeId = if l_Players_0.LocalPlayer then l_Players_0.LocalPlayer.LocaleId else nil
            };
            l_Analytics_0.FireClientAnalyticsWithEventName("MessageTranslationToggled", v27);
            v17(v15(v25, v26));
        end or nil, 
        resetTargetChannel = function() --[[ Line: 66 ]] --[[ Name: resetTargetChannel ]]
            -- upvalues: v17 (copy), l_ChatInputBarResetTargetChannel_0 (ref)
            v17(l_ChatInputBarResetTargetChannel_0());
        end, 
        onHovered = function() --[[ Line: 70 ]] --[[ Name: onHovered ]]
            -- upvalues: v17 (copy), v13 (ref)
            v17(v13("hover"));
        end, 
        onUnhovered = function() --[[ Line: 74 ]] --[[ Name: onUnhovered ]]
            -- upvalues: v17 (copy), v13 (ref)
            v17(v13("unhover"));
        end, 
        onSendChat = function(v28) --[[ Line: 78 ]] --[[ Name: onSendChat ]]
            -- upvalues: l_TextChatService_0 (ref), v8 (ref), v4 (ref), l_List_0 (ref), l_Players_0 (ref), v9 (ref), l_Analytics_0 (ref)
            local l_ChatInputBarConfiguration_0 = l_TextChatService_0:FindFirstChildOfClass("ChatInputBarConfiguration");
            local v30 = nil;
            if l_ChatInputBarConfiguration_0 then
                v30 = l_ChatInputBarConfiguration_0.TargetTextChannel;
            end;
            v8:debug("onSendChat: {} to {}", v28, if v30 then v30.Name else "nil");
            if v30 then
                v4.try(function() --[[ Line: 87 ]]
                    -- upvalues: v30 (ref), v28 (copy), l_List_0 (ref), l_Players_0 (ref), v9 (ref), l_Analytics_0 (ref)
                    v30:SendAsync(v28);
                    local v32 = l_List_0.count(v30:GetChildren(), function(v31) --[[ Line: 90 ]]
                        return v31:IsA("TextSource");
                    end);
                    local v33 = {
                        channelName = v30.Name, 
                        senderUserId = if l_Players_0.LocalPlayer then l_Players_0.LocalPlayer.UserId else nil, 
                        numParticipants = v32, 
                        isDefaultChannel = v9[v30.Name] and "true" or "false"
                    };
                    l_Analytics_0.FireClientAnalyticsWithEventName("LuaMessageSent", v33);
                end):catch(function(v34) --[[ Line: 102 ]]
                    warn(v34.error);
                end);
            else
                v8:warning("TargetTextChannel was nil!");
            end;
        end
    };
end;