local l_script_FirstAncestor_0 = script:FindFirstAncestor("ReactSceneUnderstanding");
local l_SoundService_0 = game:GetService("SoundService");
local v2 = require(l_script_FirstAncestor_0.Parent.Cryo);
local v3 = require(l_script_FirstAncestor_0.Parent.React);
local v4 = require(l_script_FirstAncestor_0.Parent.ReactUtils);
local v5 = require(l_script_FirstAncestor_0.flags.getFStringSceneAnalysisProcessingMode);
local l_useEffect_0 = v3.useEffect;
local l_useState_0 = v3.useState;
local l_useEventConnection_0 = v4.useEventConnection;
local function v13() --[[ Line: 15 ]] --[[ Name: getAllSounds ]]
    -- upvalues: v5 (copy), l_SoundService_0 (copy), v2 (copy)
    local v9 = v5();
    if v9 == "AudioInstances" then
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 25 ]]
            -- upvalues: l_SoundService_0 (ref)
            return l_SoundService_0:GetAudioInstances();
        end);
        if l_status_0 then
            return v2.List.filter(l_result_0, function(v12) --[[ Line: 30 ]]
                return v12:IsA("Sound");
            end);
        else
            return {};
        end;
    elseif v9 == "ClassCollections" then
        return {};
    else
        return {};
    end;
end;
return function() --[[ Line: 45 ]] --[[ Name: useAllSounds ]]
    -- upvalues: v5 (copy), l_useState_0 (copy), v13 (copy), l_useEventConnection_0 (copy), l_SoundService_0 (copy), v2 (copy), l_useEffect_0 (copy)
    local v14 = v5();
    local v15, v16 = l_useState_0(v13);
    if v14 == "AudioInstances" then
        l_useEventConnection_0(l_SoundService_0.AudioInstanceAdded, function(v17) --[[ Line: 51 ]]
            -- upvalues: v16 (copy), v2 (ref)
            if v17:IsA("Sound") then
                v16(function(v18) --[[ Line: 53 ]]
                    -- upvalues: v2 (ref), v17 (copy)
                    return v2.List.join(v18, {
                        v17
                    });
                end);
            end;
        end, {});
    end;
    l_useEffect_0(function() --[[ Line: 60 ]]
        -- upvalues: v15 (copy), v16 (copy), v13 (ref)
        local v19 = {};
        for _, v21 in v15 do
            table.insert(v19, v21.AncestryChanged:Connect(function() --[[ Line: 66 ]]
                -- upvalues: v21 (copy), v16 (ref), v13 (ref)
                if not v21:IsDescendantOf(game) then
                    v16(v13());
                end;
            end));
        end;
        return function() --[[ Line: 74 ]]
            -- upvalues: v19 (copy)
            for _, v23 in v19 do
                v23:Disconnect();
            end;
        end;
    end, {
        v15
    });
    return v15;
end;