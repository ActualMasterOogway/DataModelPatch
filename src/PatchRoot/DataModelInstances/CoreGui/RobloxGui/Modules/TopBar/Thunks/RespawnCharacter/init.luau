local l_Players_0 = game:GetService("Players");
return function(v1) --[[ Line: 4 ]]
    -- upvalues: l_Players_0 (copy)
    local v2 = v1:getState();
    if v2.respawn.customCallback then
        v2.respawn.customCallback:Fire();
        return;
    else
        local l_Character_0 = l_Players_0.LocalPlayer.Character;
        if l_Character_0 ~= nil then
            local l_Humanoid_0 = l_Character_0:FindFirstChild("Humanoid");
            if l_Humanoid_0 ~= nil and l_Humanoid_0:IsA("Humanoid") then
                l_Humanoid_0.Health = 0;
            end;
        end;
        return;
    end;
end;