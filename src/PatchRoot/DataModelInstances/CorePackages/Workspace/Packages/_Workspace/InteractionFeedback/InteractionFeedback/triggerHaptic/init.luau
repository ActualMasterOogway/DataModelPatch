local l_HapticService_0 = game:GetService("HapticService");
local v1 = game:DefineFastFlag("UseNewHapticServiceInUA", false);
local v2 = {};
local v3 = {};
local v4 = {};
local v5 = {
    [Enum.HapticEffectType.UIClick] = {
        duration = math.clamp(game:DefineFastInt("HapticClickEffectDuration", 5), 0, 100) / 100, 
        intensity = math.clamp(game:DefineFastInt("HapticClickEffectIntensity", 50), 0, 100) / 100
    }
};
return function(v6, v7) --[[ Line: 15 ]] --[[ Name: triggerHaptic ]]
    -- upvalues: v1 (copy), v4 (copy), v5 (copy), l_HapticService_0 (copy), v2 (copy), v3 (copy)
    if v1 then
        if not v4[v6] then
            v4[v6] = Instance.new("HapticEffect");
            v4[v6].Parent = workspace;
            v4[v6].Type = v6;
        end;
        v4[v6]:Play();
        return;
    else
        local v8 = v5[v6];
        if not v8 then
            error("Haptic effect not found for Enum.HapticEffectType." .. v6.Name);
        end;
        for _, v10 in ipairs(v7) do
            l_HapticService_0:SetMotor(Enum.UserInputType.Gamepad1, v10, v8.intensity);
            v2[v10] = os.clock();
            v3[v10] = game:GetService("RunService").Heartbeat:Connect(function() --[[ Line: 32 ]]
                -- upvalues: v2 (ref), v10 (copy), v8 (copy), l_HapticService_0 (ref), v3 (ref)
                if not v2[v10] then
                    return;
                else
                    if os.clock() - v2[v10] > v8.duration then
                        l_HapticService_0:SetMotor(Enum.UserInputType.Gamepad1, v10, 0);
                        v3[v10]:Disconnect();
                        v3[v10] = nil;
                        v2[v10] = nil;
                    end;
                    return;
                end;
            end);
        end;
        return;
    end;
end;