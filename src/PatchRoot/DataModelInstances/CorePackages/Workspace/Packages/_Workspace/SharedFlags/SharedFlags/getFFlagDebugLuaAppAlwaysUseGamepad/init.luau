local l_RunService_0 = game:GetService("RunService");
local l_GuiService_0 = game:GetService("GuiService");
game:DefineFastFlag("DebugLuaAppAlwaysUseGamepad", false);
game:DefineFastInt("DebugLuaAppForceGamepad", 0);
return function() --[[ Line: 9 ]]
    -- upvalues: l_RunService_0 (copy), l_GuiService_0 (copy)
    return game:GetFastFlag("DebugLuaAppAlwaysUseGamepad") and l_RunService_0:IsStudio() and l_GuiService_0:IsTenFootInterface() or game:GetFastInt("DebugLuaAppForceGamepad") > 0;
end;