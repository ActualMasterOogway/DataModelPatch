local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialLibraries");
local l_UserModel_0 = require(l_script_FirstAncestor_0.dependencies).UserModel;
return {
    [l_UserModel_0.PresenceType.OFFLINE] = "", 
    [l_UserModel_0.PresenceType.ONLINE] = "rbxasset://textures/ui/LuaChat/graphic/gr-indicator-online-14x14.png", 
    [l_UserModel_0.PresenceType.IN_GAME] = "rbxasset://textures/ui/LuaChat/graphic/gr-indicator-ingame-14x14.png", 
    [l_UserModel_0.PresenceType.IN_STUDIO] = "rbxasset://textures/ui/LuaChat/graphic/gr-indicator-instudio-14x14.png"
};