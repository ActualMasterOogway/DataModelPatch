local v0 = require(script.Parent.UIBlox.GetFFlagUIBloxUseNewHeaderBar);
game:DefineFastFlag("LuaAppUseAppHeaderBar", false);
return function() --[[ Line: 5 ]]
    -- upvalues: v0 (copy)
    return game:GetFastFlag("LuaAppUseAppHeaderBar") and v0();
end;