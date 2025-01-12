local l_Parent_0 = script:FindFirstAncestor("ExpChatShared").Parent;
local v1 = require(l_Parent_0.Rodux);
local l_GetFFlagReenableTextChatForTenFootInterfaces_0 = require(l_Parent_0.SharedFlags).GetFFlagReenableTextChatForTenFootInterfaces;
return v1.makeActionCreator(script.Name, function(v3) --[[ Line: 15 ]]
    -- upvalues: l_GetFFlagReenableTextChatForTenFootInterfaces_0 (copy)
    return {
        team = v3.team, 
        isChatCoreGuiEnabled = v3.isChatCoreGuiEnabled == nil or v3.isChatCoreGuiEnabled, 
        isTouchEnabled = v3.isTouchEnabled, 
        isGamepadConnected = if l_GetFFlagReenableTextChatForTenFootInterfaces_0() then v3.isGamepadConnected else nil
    };
end);