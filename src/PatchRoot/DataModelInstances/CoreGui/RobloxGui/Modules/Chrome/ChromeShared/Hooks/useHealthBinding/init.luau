local l_Players_0 = game:GetService("Players");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
useHealthBinding = function() --[[ Line: 5 ]] --[[ Name: useHealthBinding ]]
    -- upvalues: v2 (copy), l_Players_0 (copy)
    local v3, v4 = v2.useBinding(0);
    v2.useEffect(function() --[[ Line: 8 ]]
        -- upvalues: l_Players_0 (ref), v4 (copy)
        local v5 = nil;
        local v6 = nil;
        local v7 = nil;
        local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
        while not l_LocalPlayer_0 do
            l_Players_0:GetPropertyChangedSignal("LocalPlayer"):Wait();
            l_LocalPlayer_0 = l_Players_0.LocalPlayer;
        end;
        local l_l_LocalPlayer_0_0 = l_LocalPlayer_0;
        local function v11() --[[ Line: 20 ]] --[[ Name: updateHealthValue ]]
            -- upvalues: v5 (ref), v4 (ref)
            local v10 = 0;
            if v5 and v5.MaxHealth > 0 then
                v10 = v5.Health / v5.MaxHealth;
            end;
            v4(v10);
        end;
        local function _() --[[ Line: 28 ]] --[[ Name: unobserveHumanoid ]]
            -- upvalues: v7 (ref), v6 (ref)
            if v7 then
                v7:Disconnect();
                v7 = nil;
            end;
            if v6 then
                v6:Disconnect();
                v6 = nil;
            end;
        end;
        local function v13() --[[ Line: 39 ]] --[[ Name: observeHumanoid ]]
            -- upvalues: v7 (ref), v6 (ref), l_l_LocalPlayer_0_0 (copy), v5 (ref), v11 (copy), v13 (copy), v4 (ref)
            if v7 then
                v7:Disconnect();
                v7 = nil;
            end;
            if v6 then
                v6:Disconnect();
                v6 = nil;
            end;
            local l_Character_0 = l_l_LocalPlayer_0_0.Character;
            if l_Character_0 then
                v5 = l_Character_0:FindFirstChildOfClass("Humanoid");
                if v5 then
                    v6 = v5.HealthChanged:Connect(v11);
                else
                    v7 = l_Character_0.ChildAdded:Connect(function(v15) --[[ Line: 47 ]]
                        -- upvalues: v13 (ref)
                        if v15:IsA("Humanoid") then
                            v13();
                        end;
                    end);
                end;
            end;
            local v16 = 0;
            if v5 and v5.MaxHealth > 0 then
                v16 = v5.Health / v5.MaxHealth;
            end;
            v4(v16);
        end;
        local v17 = l_l_LocalPlayer_0_0.CharacterAdded:Connect(v13);
        local v18 = l_l_LocalPlayer_0_0.CharacterRemoving:Connect(v13);
        v13();
        return function() --[[ Line: 61 ]]
            -- upvalues: v17 (copy), v18 (copy), v7 (ref), v6 (ref)
            v17:Disconnect();
            v18:Disconnect();
            if v7 then
                v7:Disconnect();
                v7 = nil;
            end;
            if v6 then
                v6:Disconnect();
                v6 = nil;
            end;
        end;
    end, {});
    return v3;
end;
return useHealthBinding;