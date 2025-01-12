local v0 = require(script.Parent.GetFFlagLuaAppEnableSquadPage);
game:SetFlagVersion("LuaAppEnablePlaySquadButton", 3);
return v0() and game:DefineFastFlag("LuaAppEnablePlaySquadButton", false);