local l_script_FirstAncestor_0 = script:FindFirstAncestor("ChatLineReporting");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.ExpChatShared);
local l_RBXMuteCommand_0 = require(l_Parent_0.ExpChatShared).Commands.RBXMuteCommand;
local l_UserMuted_0 = require(l_Parent_0.ExpChatShared).Actions.UserMuted;
local v5 = require(l_script_FirstAncestor_0.Common.Constants);
local l_GetFFlagAddMuteErrorStates_0 = require(l_Parent_0.SharedFlags).GetFFlagAddMuteErrorStates;
mutePlayer = function(v7, v8) --[[ Line: 13 ]] --[[ Name: mutePlayer ]]
    -- upvalues: v2 (copy), l_GetFFlagAddMuteErrorStates_0 (copy), v5 (copy), l_UserMuted_0 (copy), l_RBXMuteCommand_0 (copy)
    local l_context_0 = v2.context;
    local v10 = nil;
    if l_GetFFlagAddMuteErrorStates_0() then
        if v7.username == "" then
            return {
                key = v5.ErrorDoesNotExistKey, 
                args = {
                    RBX_NAME = v7.displayName
                }, 
                metadata = "Roblox.Mute.Error.PlayerNotFound"
            };
        elseif tonumber(v7.userId) == v8.UserId then
            return {
                key = v5.ErrorSelfMuteKey, 
                args = {
                    RBX_NAME = v7.displayName
                }, 
                metadata = "Roblox.Mute.Error.CannotMuteSelf"
            };
        elseif tonumber(v7.userId) and l_context_0.store then
            l_context_0.store:dispatch(l_UserMuted_0(v7.userId));
            return {
                key = v5.SuccessfulMuteKey, 
                args = {
                    RBX_NAME = v7.displayName
                }, 
                metadata = "Roblox.Mute.Info.Success"
            };
        else
            return v10;
        end;
    else
        return l_RBXMuteCommand_0.clientRun(l_context_0.store, v8.UserId, "/mute " .. v7.displayName);
    end;
end;
return mutePlayer;