local v0 = require(script.Parent.UIBlox.GetFFlagUIBloxSupportControlStateSelectedForTooltipHover);
game:DefineFastFlag("TenFootUiSupportSortHeaderTooltip2", false);
return function() --[[ Line: 6 ]]
    -- upvalues: v0 (copy)
    return v0() and game:GetFastFlag("TenFootUiSupportSortHeaderTooltip2");
end;