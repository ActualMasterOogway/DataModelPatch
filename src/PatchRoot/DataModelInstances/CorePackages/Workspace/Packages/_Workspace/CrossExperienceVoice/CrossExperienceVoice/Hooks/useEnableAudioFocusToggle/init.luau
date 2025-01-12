local l_game_EngineFeature_0 = game:GetEngineFeature("AudioFocusManagement");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("CrossExperienceVoice");
local v2 = require(l_script_FirstAncestor_0.dependencies);
local l_React_0 = v2.React;
local l_Cryo_0 = v2.Cryo;
return function() --[[ Line: 12 ]] --[[ Name: useEnableAudioFocusToggle ]]
    -- upvalues: l_React_0 (copy), l_Cryo_0 (copy), l_game_EngineFeature_0 (copy)
    local v5, v6 = l_React_0.useState({});
    local v9 = l_React_0.useCallback(function(v7) --[[ Line: 15 ]]
        -- upvalues: v5 (copy), l_Cryo_0 (ref), v6 (copy)
        if not v5[v7] then
            local v8 = l_Cryo_0.Dictionary.join(v5, {
                [v7] = true
            });
            v6(v8);
        end;
    end, {
        v5
    });
    local v12 = l_React_0.useCallback(function(v10) --[[ Line: 24 ]]
        -- upvalues: v5 (copy), l_Cryo_0 (ref), v6 (copy)
        if v5[v10] then
            local v11 = l_Cryo_0.Dictionary.join(v5, {
                [v10] = nil
            });
            v6(v11);
        end;
    end, {
        v5
    });
    l_React_0.useEffect(function() --[[ Line: 33 ]]
        -- upvalues: l_game_EngineFeature_0 (ref), v6 (copy), v9 (copy), v12 (copy)
        if not l_game_EngineFeature_0 then
            return;
        else
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 38 ]]
                return game:GetService("AudioFocusService");
            end);
            if not l_status_0 or not l_result_0 then
                return;
            else
                local v15 = {};
                local l_l_result_0_RegisteredContexts_0 = l_result_0:GetRegisteredContexts();
                for v17, _ in pairs(l_l_result_0_RegisteredContexts_0) do
                    v15[v17] = true;
                end;
                v6(v15);
                local v19 = l_result_0.OnContextRegistered:Connect(v9);
                local v20 = l_result_0.OnContextUnregistered:Connect(v12);
                return function() --[[ Line: 55 ]]
                    -- upvalues: v19 (copy), v20 (copy)
                    if v19 then
                        v19:Disconnect();
                    end;
                    if v20 then
                        v20:Disconnect();
                    end;
                end;
            end;
        end;
    end, {});
    return v5[1] and v5[2];
end;