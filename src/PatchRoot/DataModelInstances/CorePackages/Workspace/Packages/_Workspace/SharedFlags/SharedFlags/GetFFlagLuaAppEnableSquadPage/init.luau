game:SetFlagVersion("LuaAppEnableSquadPage", 4);
game:DefineFastFlag("LuaAppEnableSquadPage", false);
return function() --[[ Line: 6 ]]
    return game:GetFastFlag("LuaAppEnableSquadPage");
end;