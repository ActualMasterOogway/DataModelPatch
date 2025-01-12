local l_script_FirstAncestor_0 = script:FindFirstAncestor("Songbird");
local l_useEffect_0 = require(l_script_FirstAncestor_0.Parent.React).useEffect;
return function(v2, v3) --[[ Line: 7 ]] --[[ Name: useSpatialSound ]]
    -- upvalues: l_useEffect_0 (copy)
    l_useEffect_0(function() --[[ Line: 8 ]]
        -- upvalues: v3 (copy), v2 (copy)
        local v4 = {};
        if v3 then
            local l_CurrentCamera_0 = workspace.CurrentCamera;
            assert(l_CurrentCamera_0, "No CurrentCamera");
            local l_Sound_0 = Instance.new("Sound");
            l_Sound_0.Name = ("Sound_%*"):format(v2);
            l_Sound_0.SoundId = ("rbxassetid://%*"):format(v2);
            l_Sound_0.Looped = true;
            table.insert(v4, l_Sound_0);
            local l_Part_0 = Instance.new("Part");
            l_Part_0.Name = ("PluginSoundEmitter_%*"):format(v2);
            l_Part_0.Position = l_CurrentCamera_0.CFrame.Position;
            l_Part_0.Anchored = true;
            table.insert(v4, l_Part_0);
            l_Sound_0.Parent = l_Part_0;
            l_Part_0.Parent = v3.current;
            l_Sound_0:Play();
        end;
        return function() --[[ Line: 33 ]]
            -- upvalues: v4 (copy)
            for _, v9 in v4 do
                v9:Destroy();
            end;
        end;
    end, {
        v2, 
        v3
    });
end;