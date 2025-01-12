local v0 = require(script.Parent.UIBlox.GetFFlagUIBloxUseNewHeaderBar);
game:DefineFastFlag("FixConnectTabSearchBarHeight", false);
return function() --[[ Line: 5 ]]
    -- upvalues: v0 (copy)
    return game:GetFastFlag("FixConnectTabSearchBarHeight") and v0();
end;