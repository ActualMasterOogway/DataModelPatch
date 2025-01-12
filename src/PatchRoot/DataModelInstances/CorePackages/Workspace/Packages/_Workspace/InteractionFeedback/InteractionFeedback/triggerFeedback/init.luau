local l_Parent_0 = script:FindFirstAncestor("InteractionFeedback").Parent;
local v1 = require(l_Parent_0.SoundManager);
local l_SoundManager_0 = v1.SoundManager;
local l_Sounds_0 = v1.Sounds;
local l_SoundGroups_0 = v1.SoundGroups;
local _ = require(script.Parent.InteractionFeedbackContext);
local v6 = require(script.Parent.triggerHaptic);
l_SoundManager_0.init();
return function(v7, v8, v9, v10) --[[ Line: 16 ]] --[[ Name: triggerFeedback ]]
    -- upvalues: l_Sounds_0 (copy), l_SoundManager_0 (copy), l_SoundGroups_0 (copy), v6 (copy)
    if not v9 then
        error("No config table was provided to InteractionFeedbackManager. Something is wrong.");
    end;
    local v11 = v9[v7];
    if not v11 then
        return;
    else
        local v12 = v11[v8];
        if not v12 then
            return;
        else
            local l_Sound_0 = v12.Sound;
            if l_Sound_0 then
                local v14 = l_Sounds_0[l_Sound_0];
                if not v14 then
                    error("Sound " .. l_Sound_0 .. " not found in SoundManager given contextKey: " .. v7 .. " and interactionType: " .. tostring(v8) .. ". Please check the Sounds.lua file.");
                end;
                l_SoundManager_0:PlaySound(v14.Name, {}, l_SoundGroups_0.AppBackground);
            end;
            local l_Haptic_0 = v12.Haptic;
            if l_Haptic_0 then
                v6(l_Haptic_0, v10);
            end;
            return;
        end;
    end;
end;