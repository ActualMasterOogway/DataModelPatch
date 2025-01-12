local l_script_FirstAncestor_0 = script:FindFirstAncestor("ReactSceneUnderstanding");
local v1 = require(l_script_FirstAncestor_0.Parent.React);
local v2 = require(l_script_FirstAncestor_0.Parent.ReactUtils);
local v3 = require(l_script_FirstAncestor_0.SceneAnalysisContext);
local v4 = require(l_script_FirstAncestor_0.enums);
local v5 = require(l_script_FirstAncestor_0.useCameraState);
local v6 = require(l_script_FirstAncestor_0.audio.sortByAudibleVolume);
local v7 = require(l_script_FirstAncestor_0.audio.useAllSounds);
local v8 = require(l_script_FirstAncestor_0.useTimedLoop);
local v9 = {
    TimePosition = true, 
    TimeLength = true
};
local l_useCallback_0 = v1.useCallback;
local l_useEffect_0 = v1.useEffect;
local l_usePrevious_0 = v2.usePrevious;
return function() --[[ Line: 45 ]] --[[ Name: useAudibleSounds ]]
    -- upvalues: v3 (copy), v7 (copy), v5 (copy), l_usePrevious_0 (copy), l_useCallback_0 (copy), v6 (copy), v9 (copy), v8 (copy), l_useEffect_0 (copy), v4 (copy)
    local v13 = v3.use();
    local v14 = v7();
    local v15 = v5();
    local v16 = l_usePrevious_0(v15);
    local v17 = l_useCallback_0(function() --[[ Line: 51 ]]
        -- upvalues: v13 (copy), v6 (ref), v14 (copy)
        v13.setAudibleSounds(v6(v14));
    end, {
        v14, 
        v13.setAudibleSounds
    });
    local v19 = l_useCallback_0(function(v18) --[[ Line: 55 ]]
        -- upvalues: v9 (ref), v17 (copy)
        if not v9[v18] then
            v17();
        end;
    end, {
        v17
    });
    v8(1, function() --[[ Line: 61 ]]
        -- upvalues: v17 (copy)
        v17();
    end);
    l_useEffect_0(function() --[[ Line: 65 ]]
        -- upvalues: v13 (copy), v14 (copy), v17 (copy)
        if #v13.audibleSounds == 0 and #v14 > 0 then
            v17();
        end;
    end, {
        #v13.audibleSounds, 
        #v14, 
        v17
    });
    l_useEffect_0(function() --[[ Line: 71 ]]
        -- upvalues: v14 (copy), v19 (copy)
        local v20 = {};
        for _, v22 in v14 do
            table.insert(v20, v22.Changed:Connect(v19));
        end;
        return function() --[[ Line: 78 ]]
            -- upvalues: v20 (copy)
            for _, v24 in v20 do
                v24:Disconnect();
            end;
        end;
    end, {
        v14, 
        v19
    });
    l_useEffect_0(function() --[[ Line: 85 ]]
        -- upvalues: v15 (copy), v16 (copy), v4 (ref), v17 (copy)
        if v15 ~= v16 and v15 == v4.CameraState.Idle then
            v17();
        end;
    end, {
        v15, 
        v16, 
        v17
    });
    return v13.audibleSounds;
end;