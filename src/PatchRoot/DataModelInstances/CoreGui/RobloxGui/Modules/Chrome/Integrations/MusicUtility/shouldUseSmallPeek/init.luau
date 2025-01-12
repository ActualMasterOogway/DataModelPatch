local l_script_FirstAncestor_0 = script:FindFirstAncestor("Chrome");
local v1 = require(l_script_FirstAncestor_0.ChromeShared.Service.ViewportUtil);
return function() --[[ Line: 7 ]] --[[ Name: shouldUseSmallPeek ]]
    -- upvalues: v1 (copy)
    local v2 = v1.isSmallTouchScreen();
    return v1.mobileDevice:get() and v2;
end;