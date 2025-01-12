local l_script_FirstAncestor_0 = script:FindFirstAncestor("CrossExperience");
local l_ExperienceService_0 = game:GetService("ExperienceService");
local l_HttpService_0 = game:GetService("HttpService");
local _ = require(l_script_FirstAncestor_0.Types);
local function v4() --[[ Line: 13 ]]

end;
local function v13(v5, v6, v7, v8) --[[ Line: 15 ]]
    -- upvalues: l_ExperienceService_0 (copy)
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 16 ]]
        -- upvalues: l_ExperienceService_0 (ref), v5 (copy), v6 (copy), v7 (copy), v8 (copy)
        l_ExperienceService_0:ExecuteCrossExperienceCall(v5, v6, function(v9) --[[ Line: 17 ]]
            -- upvalues: v7 (ref)
            if v7 then
                v7(v9);
            end;
        end, function(v10) --[[ Line: 21 ]]
            -- upvalues: v8 (ref)
            print("[CrossExperience] Error executing call", v10);
            if v8 then
                v8(v10);
            end;
        end);
    end);
    if not l_status_0 then
        print("[CrossExperience] Error executing call pcall", v5, l_result_0);
        if v8 then
            v8("[CrossExperience] Error executing call pcall");
        end;
    end;
end;
local function v18(v14, v15, v16, v17) --[[ Line: 38 ]]
    -- upvalues: v13 (copy)
    v13(v14.NOTIFY, v15, v16, v17);
end;
local function v23(v19, v20) --[[ Line: 47 ]]
    -- upvalues: v4 (copy), v13 (copy)
    local l_v4_0 = v4;
    local l_v4_1 = v4;
    v13(v19.NOTIFY, v20, l_v4_0, l_v4_1);
end;
local function v30(v24, v25, v26, _, v28) --[[ Line: 51 ]]
    -- upvalues: l_HttpService_0 (copy), v13 (copy)
    local v29 = l_HttpService_0:GenerateGUID(false);
    v13(v25.ADD_OBSERVER, {
        observerId = v29, 
        experienceType = v24
    }, v26, v28);
    return v29;
end;
local function v37(v31, v32, v33) --[[ Line: 67 ]]
    -- upvalues: v4 (copy), l_HttpService_0 (copy), v13 (copy)
    local _ = v4;
    local l_v4_3 = v4;
    local v36 = l_HttpService_0:GenerateGUID(false);
    v13(v32.ADD_OBSERVER, {
        observerId = v36, 
        experienceType = v31
    }, v33, l_v4_3);
    return v36;
end;
local function v43(v38, v39, v40, v41, v42) --[[ Line: 71 ]]
    -- upvalues: v13 (copy)
    v13(v39.REMOVE_OBSERVER, {
        observerId = v40, 
        experienceType = v38
    }, v41, v42);
end;
return {
    execute = v13, 
    notify = v23, 
    notifyWithCallbacks = v18, 
    addObserver = v37, 
    addObserverWithCallbacks = v30, 
    removeObserver = function(v44, v45, v46) --[[ Line: 85 ]]
        -- upvalues: v43 (copy), v4 (copy)
        return v43(v44, v45, v46, v4, v4);
    end, 
    removeObserverWithCallbacks = v43
};