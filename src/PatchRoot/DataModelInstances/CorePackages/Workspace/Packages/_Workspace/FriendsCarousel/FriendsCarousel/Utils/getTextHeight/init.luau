local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsCarousel");
local l_Text_0 = require(l_script_FirstAncestor_0.dependencies).Text;
return function(v2, v3, v4) --[[ Line: 5 ]]
    -- upvalues: l_Text_0 (copy)
    return l_Text_0.GetTextHeight(v2 or "", v3, v4);
end;