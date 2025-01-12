local l_RunService_0 = game:GetService("RunService");
while not l_RunService_0:IsRunning() do
    wait();
end;
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxReplicatedStorage_0 = game:GetService("RobloxReplicatedStorage");
local l_ScriptContext_0 = game:GetService("ScriptContext");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_GetFFlagDisplayServerChannel_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagDisplayServerChannel;
local l_getFFlagExpChatAlwaysRunTCS_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).getFFlagExpChatAlwaysRunTCS;
local v8 = l_CoreGui_0:WaitForChild("RobloxGui", 1e999);
assert(v8 ~= nil, "RobloxGui should exist");
local v9 = require(v8.Modules.Server.ServerUtil);
if v9.getFFlagServerCoreScriptSourceCode() then
    v9.initSourceCodeFolder();
end;
if game:DefineFastFlag("OpenCloudCoreScriptLuaEnabled", false) then
    l_ScriptContext_0:AddCoreScriptLocal("ServerCoreScripts/OpenCloud/OpenCloudV2", script.Parent);
end;
if game:DefineFastFlag("OpenCloudClientLibraryCoreScriptEnabled", false) then
    l_ScriptContext_0:AddCoreScriptLocal("ServerCoreScripts/OpenCloud/OpenCloudClientLibraryCoreScript", script.Parent);
end;
l_ScriptContext_0:AddCoreScriptLocal("ServerCoreScripts/ServerInGameMenu", script.Parent);
l_ScriptContext_0:AddCoreScriptLocal("ServerCoreScripts/ServerSocialScript", script.Parent);
l_ScriptContext_0:AddCoreScriptLocal("ServerCoreScripts/ServerLeaderstats", script.Parent);
l_ScriptContext_0:AddCoreScriptLocal("ServerCoreScripts/PlayerRagdollRigCreator", script.Parent);
game:DefineFastFlag("DebugFreeCameraForAdmins", true);
local v10 = nil;
local v11 = require(v8.Modules.Common.Flags.FFlagEnableForkedChatAnalytics);
if v11 then
    v10 = require(v8.Modules.Server.SendChatAnalytics);
end;
l_ScriptContext_0:AddCoreScriptLocal("ServerCoreScripts/ServerDialog", script.Parent);
local l_RemoteFunction_0 = Instance.new("RemoteFunction");
l_RemoteFunction_0.Name = "GetServerVersion";
l_RemoteFunction_0.Parent = l_RobloxReplicatedStorage_0;
local v13 = nil;
if l_GetFFlagDisplayServerChannel_0() then
    v13 = Instance.new("RemoteFunction");
    v13.Name = "GetServerChannel";
    v13.Parent = l_RobloxReplicatedStorage_0;
end;
local function v17() --[[ Line: 76 ]] --[[ Name: getServerVersion ]]
    -- upvalues: l_RunService_0 (copy)
    local l_l_RunService_0_RobloxVersion_0 = l_RunService_0:GetRobloxVersion();
    local v15 = nil;
    v15 = l_l_RunService_0_RobloxVersion_0 == "?" and "DEBUG_SERVER" or l_RunService_0:IsStudio() and "ROBLOX Studio" or l_l_RunService_0_RobloxVersion_0;
    if not l_RunService_0:IsStudio() then
        local l_ClientGitHash_0 = l_RunService_0.ClientGitHash;
        return string.format("%s (%.6s)", v15, l_ClientGitHash_0);
    else
        return v15;
    end;
end;
local function v18() --[[ Line: 97 ]] --[[ Name: getServerChannel ]]
    -- upvalues: l_RunService_0 (copy)
    return l_RunService_0:GetRobloxClientChannel();
end;
l_RemoteFunction_0.OnServerInvoke = v17;
if l_GetFFlagDisplayServerChannel_0() then
    v13.OnServerInvoke = v18;
end;
local v19 = game:DefineFastFlag("EnableTenFootInterfaceCheckForLegacyChat", false);
if (function() --[[ Line: 108 ]] --[[ Name: shouldLoadLuaChat ]]
    -- upvalues: v19 (copy)
    if v19 then
        return game:GetService("Chat").LoadDefaultChat and game:GetService("TextChatService").ChatVersion == Enum.ChatVersion.LegacyChatService and not game:GetService("GuiService"):IsTenFootInterface();
    else
        return game:GetService("Chat").LoadDefaultChat and game:GetService("TextChatService").ChatVersion == Enum.ChatVersion.LegacyChatService;
    end;
end)() then
    require(game:GetService("CoreGui").RobloxGui.Modules.Server.ClientChat.ChatWindowInstaller)();
    require(game:GetService("CoreGui").RobloxGui.Modules.Server.ServerChat.ChatServiceInstaller)();
elseif v11 then
    v10("NoLoadDefaultChat");
end;
if game:GetFastFlag("DebugFreeCameraForAdmins") then
    require(game:GetService("CoreGui").RobloxGui.Modules.Server.FreeCamera.FreeCameraInstaller)();
end;
require(game:GetService("CoreGui").RobloxGui.Modules.Server.ServerSound.SoundDispatcherInstaller)();
require(game:GetService("CoreGui").RobloxGui.Modules.Server.UGCValidation.UGCValidationFunctionInstaller)();
local l_ChatVersion_0 = game:GetService("TextChatService").ChatVersion;
if l_getFFlagExpChatAlwaysRunTCS_0() or l_ChatVersion_0 == Enum.ChatVersion.TextChatService then
    require(l_CorePackages_0.Workspace.Packages.ExpChatServer).mountServerApp({});
end;
if l_RunService_0:IsStudio() == false then
    l_RbxAnalyticsService_0:ReportCounter(l_ChatVersion_0 == Enum.ChatVersion.TextChatService and "textChatServiceChatVersionTextChatService" or "textChatServiceChatVersionLegacy", 1);
end;
if game:DefineFastFlag("VersionedFlags_Dev", false) then
    l_ScriptContext_0:AddCoreScriptLocal("ServerCoreScripts/VersionedFlagTest", script.Parent);
end;
if require(v8.Modules.Common.Flags.GetFFlagContactListEnabled)() then
    l_ScriptContext_0:AddCoreScriptLocal("ServerCoreScripts/ServerContactList", script.Parent);
end;
l_ScriptContext_0:AddCoreScriptLocal("ServerCoreScripts/PlayerViewCapability", script.Parent);
if require(v8.Modules.Common.Flags.GetFFlagEnableVoiceDefaultServerScript)() then
    l_ScriptContext_0:AddCoreScriptLocal("ServerCoreScripts/VoiceDefault", script.Parent);
end;
require(game:GetService("CoreGui").RobloxGui.Modules.Server.VR.VRAvatarGesturesServer).new();