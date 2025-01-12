local l_script_FirstAncestor_0 = script:FindFirstAncestor("ChatLineReporting");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.ExpChatShared);
local l_ButtonType_0 = require(l_Parent_0.UIBlox).App.Button.Enum.ButtonType;
local l_ReportCompleteDialog_0 = require(l_Parent_0.GenericAbuseReporting).Components.ReportCompleteDialog;
local l_LocalPlayer_0 = game:GetService("Players").LocalPlayer;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v8 = require(l_script_FirstAncestor_0.Common.Constants);
local v9 = require(l_script_FirstAncestor_0.Common.getDisplayNameFromUserId);
local v10 = require(l_script_FirstAncestor_0.Common.getPlayer);
local v11 = require(l_script_FirstAncestor_0.Common.mutePlayer);
local v12 = require(l_script_FirstAncestor_0.Common.sendSystemMessage);
local l_GetFFlagEnableChatLineReportingMute_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableChatLineReportingMute;
local v14 = game:DefineFastFlag("ChatLineReportMuteSendSystemMessage", false);
return function(v15) --[[ Line: 42 ]] --[[ Name: ChatLineReportCompleteModal ]]
    -- upvalues: v3 (copy), l_useLocalization_0 (copy), v10 (copy), v9 (copy), l_ButtonType_0 (copy), v2 (copy), l_ReportCompleteDialog_0 (copy), l_LocalPlayer_0 (copy), l_GetFFlagEnableChatLineReportingMute_0 (copy), v11 (copy), v14 (copy), v8 (copy), v12 (copy)
    local l_context_0 = v3.context;
    local v17 = l_useLocalization_0(v15.localizationKeys);
    local v18 = nil;
    if l_context_0.store then
        v18 = v10(l_context_0.store:getState().Players.byUserId, v15.selectedMessage.userId);
        if v18 == nil then
            v18 = {
                displayName = v9(v15.selectedMessage.userId), 
                userId = v15.selectedMessage.userId, 
                username = ""
            };
        end;
    end;
    local v19 = l_useLocalization_0({
        completeMute = {
            "Feature.ReportAbuse.Action.TextMute"; 
            name = v18 and v18.displayName or ""
        }, 
        systemMuteMessage = {
            "Feature.ReportAbuse.Message.UserTextMutedSystem"; 
            name = v18 and v18.displayName or ""
        }
    });
    local v20 = {
        buttonType = l_ButtonType_0.PrimarySystem, 
        props = {
            onActivated = function() --[[ Line: 69 ]] --[[ Name: onActivated ]]
                -- upvalues: v15 (copy)
                v15.onDismiss(nil, "");
            end, 
            text = v17.completeClose
        }
    };
    return v2.createElement(l_ReportCompleteDialog_0, {
        buttonStackInfo = {
            forceFillDirection = Enum.FillDirection.Vertical, 
            buttons = if l_LocalPlayer_0 and l_GetFFlagEnableChatLineReportingMute_0() then {
                {
                    buttonType = l_ButtonType_0.Secondary, 
                    props = {
                        onActivated = function() --[[ Line: 84 ]] --[[ Name: onActivated ]]
                            -- upvalues: v11 (ref), v18 (ref), l_LocalPlayer_0 (ref), v14 (ref), v8 (ref), v12 (ref), v19 (copy), v15 (copy)
                            local v21 = v11(v18, l_LocalPlayer_0);
                            if v14 and v21 and v21.key == v8.SuccessfulMuteKey then
                                v12(v19.systemMuteMessage);
                            end;
                            v15.onDismiss(v21);
                        end, 
                        text = v19.completeMute
                    }
                }, 
                v20
            } else {
                v20
            }
        }, 
        localizationKeys = v15.localizationKeys, 
        onDismiss = function() --[[ Line: 103 ]] --[[ Name: onDismiss ]]
            -- upvalues: v15 (copy)
            v15.onDismiss(nil, "");
        end
    });
end;