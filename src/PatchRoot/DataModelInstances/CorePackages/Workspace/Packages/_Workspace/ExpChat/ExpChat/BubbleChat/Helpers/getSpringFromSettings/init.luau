local l_Parent_0 = script:FindFirstAncestor("ExpChat").Parent;
local v1 = require(l_Parent_0.Otter);
local v2 = game:DefineFastFlag("LegacyBubbleChatAnimationFix", false);
return function(v3, v4) --[[ Line: 8 ]] --[[ Name: getSpringFromSettings ]]
    -- upvalues: v2 (copy), v1 (copy)
    local v5 = nil;
    v5 = if v4 == "size" then v3.SizeAnimation else v3.TransparencyAnimation;
    if v2 then
        if v5.Enabled == false then
            return v1.instant;
        end;
    elseif not v5.Enabled then
        return v1.instant;
    end;
    local v6 = {
        dampingRatio = v5.SpringDampingRatio, 
        frequency = v5.SpringFrequency
    };
    return function(v7) --[[ Line: 32 ]]
        -- upvalues: v1 (ref), v6 (copy)
        return v1.spring(v7, v6);
    end;
end;