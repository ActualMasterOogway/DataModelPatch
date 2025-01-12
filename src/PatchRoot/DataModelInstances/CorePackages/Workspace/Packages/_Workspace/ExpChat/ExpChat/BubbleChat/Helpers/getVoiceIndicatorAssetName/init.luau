local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local v1 = require(l_script_FirstAncestor_0.Flags.getFFlagEnableShimmeringIcon);
local v2 = require(l_script_FirstAncestor_0.Flags.GetFFlagExpChatEnableVoiceReverseNudge);
return function(v3, v4, v5, v6) --[[ Line: 5 ]]
    -- upvalues: v1 (copy), v2 (copy)
    local v7 = nil;
    if v1() and v3 == "Connecting" then
        return "icons/controls/voice/" .. v5 .. "_0_dark";
    elseif v3 == "Muted" or v3 == "LOCAL_MUTED" then
        return "icons/controls/voice/" .. v5 .. "_off_light";
    elseif v3 == "Inactive" or v3 == "Connecting" then
        return "icons/controls/voice/" .. v5 .. "_0_light";
    else
        if v3 == "Talking" then
            local v8 = 20 * math.floor(0.5 + 5 * v4);
            v7 = "icons/controls/voice/" .. v5 .. "_" .. tostring(v8) .. "_light";
            if v2() then
                return "icons/controls/voice/" .. (v6 and "red_" or "") .. v5 .. "_" .. tostring(v8) .. "_light";
            end;
        else
            v7 = "icons/controls/voice/" .. v5 .. "_error_light";
        end;
        return v7;
    end;
end;