local l_Players_0 = game:GetService("Players");
local l_RunService_0 = game:GetService("RunService");
local l_AtomicBinding_0 = require(script:WaitForChild("AtomicBinding"));
local function _(v3) --[[ Line: 9 ]] --[[ Name: loadFlag ]]
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 10 ]]
        -- upvalues: v3 (copy)
        return UserSettings():IsUserFeatureEnabled(v3);
    end);
    return l_status_0 and l_result_0;
end;
local l_pcall_0 = pcall;
local v8 = "UserSoundsUseRelativeVelocity2";
local l_v8_0 = v8 --[[ copy: 7 -> 23 ]];
local v10;
l_pcall_0, v10 = l_pcall_0(function() --[[ Line: 10 ]]
    -- upvalues: l_v8_0 (copy)
    return UserSettings():IsUserFeatureEnabled(l_v8_0);
end);
local v11 = l_pcall_0 and v10;
v10 = pcall;
local v12 = "UserFixFreeFallingSound";
local l_v12_0 = v12 --[[ copy: 8 -> 24 ]];
v10, v8 = v10(function() --[[ Line: 10 ]]
    -- upvalues: l_v12_0 (copy)
    return UserSettings():IsUserFeatureEnabled(l_v12_0);
end);
l_pcall_0 = v10 and v8;
v10 = {
    Climbing = {
        SoundId = "rbxasset://sounds/action_footsteps_plastic.mp3", 
        Looped = true
    }, 
    Died = {
        SoundId = "rbxasset://sounds/uuhhh.mp3"
    }, 
    FreeFalling = {
        SoundId = l_pcall_0 and "rbxasset://sounds/action_falling.ogg" or "rbxasset://sounds/action_falling.mp3", 
        Looped = true
    }, 
    GettingUp = {
        SoundId = "rbxasset://sounds/action_get_up.mp3"
    }, 
    Jumping = {
        SoundId = "rbxasset://sounds/action_jump.mp3"
    }, 
    Landing = {
        SoundId = "rbxasset://sounds/action_jump_land.mp3"
    }, 
    Running = {
        SoundId = "rbxasset://sounds/action_footsteps_plastic.mp3", 
        Looped = true, 
        Pitch = 1.85
    }, 
    Splash = {
        SoundId = "rbxasset://sounds/impact_water.mp3"
    }, 
    Swimming = {
        SoundId = "rbxasset://sounds/action_swim.mp3", 
        Looped = true, 
        Pitch = 1.6
    }
};
v8 = function(v14, v15, v16, v17, v18) --[[ Line: 58 ]] --[[ Name: map ]]
    return (v14 - v15) * (v18 - v17) / (v16 - v15) + v17;
end;
v12 = function(v19, v20) --[[ Line: 62 ]] --[[ Name: getRelativeVelocity ]]
    if not v19 then
        return v20;
    else
        local v21 = v19.ActiveController and (v19.ActiveController:IsA("GroundController") and v19.GroundSensor or v19.ActiveController:IsA("ClimbController") and v19.ClimbSensor);
        if v21 and v21.SensedPart then
            return v20 - v21.SensedPart:GetVelocityAtPosition(v19.RootPart.Position);
        else
            return v20;
        end;
    end;
end;
local function _(v22) --[[ Line: 79 ]] --[[ Name: playSound ]]
    v22.TimePosition = 0;
    v22.Playing = true;
end;
local function _(v24) --[[ Line: 84 ]] --[[ Name: shallowCopy ]]
    local v25 = {};
    for v26, v27 in pairs(v24) do
        v25[v26] = v27;
    end;
    return v25;
end;
local v152 = l_AtomicBinding_0.new({
    humanoid = "Humanoid", 
    rootPart = "HumanoidRootPart"
}, function(v29) --[[ Line: 92 ]] --[[ Name: initializeSoundSystem ]]
    -- upvalues: v11 (copy), v10 (copy), l_pcall_0 (copy), v12 (copy), l_RunService_0 (copy)
    local _ = v29.player;
    local l_humanoid_0 = v29.humanoid;
    local l_rootPart_0 = v29.rootPart;
    local v33 = nil;
    if v11 then
        v33 = l_humanoid_0.Parent:FindFirstChild("ControllerManager");
    end;
    local v34 = {};
    for v35, v36 in pairs(v10) do
        local l_Sound_0 = Instance.new("Sound");
        l_Sound_0.Name = v35;
        l_Sound_0.Archivable = false;
        l_Sound_0.RollOffMinDistance = 5;
        l_Sound_0.RollOffMaxDistance = 150;
        l_Sound_0.Volume = 0.65;
        for v38, v39 in pairs(v36) do
            l_Sound_0[v38] = v39;
        end;
        l_Sound_0.Parent = l_rootPart_0;
        v34[v35] = l_Sound_0;
    end;
    local v40 = {};
    local function _(v41) --[[ Line: 126 ]] --[[ Name: stopPlayingLoopedSounds ]]
        -- upvalues: v40 (copy)
        local l_pairs_0 = pairs;
        local l_v40_0 = v40;
        local v44 = {};
        for v45, v46 in pairs(l_v40_0) do
            v44[v45] = v46;
        end;
        for v47 in l_pairs_0(v44) do
            if v47 ~= v41 then
                v47.Playing = false;
                v40[v47] = nil;
            end;
        end;
    end;
    local v123 = {
        [Enum.HumanoidStateType.FallingDown] = function() --[[ Line: 137 ]]
            -- upvalues: v40 (copy)
            local l_pairs_1 = pairs;
            local l_v40_1 = v40;
            local v51 = {};
            for v52, v53 in pairs(l_v40_1) do
                v51[v52] = v53;
            end;
            for v54 in l_pairs_1(v51) do
                if v54 ~= nil then
                    v54.Playing = false;
                    v40[v54] = nil;
                end;
            end;
        end, 
        [Enum.HumanoidStateType.GettingUp] = function() --[[ Line: 141 ]]
            -- upvalues: v40 (copy), v34 (copy)
            local l_pairs_2 = pairs;
            local l_v40_2 = v40;
            local v57 = {};
            for v58, v59 in pairs(l_v40_2) do
                v57[v58] = v59;
            end;
            for v60 in l_pairs_2(v57) do
                if v60 ~= nil then
                    v60.Playing = false;
                    v40[v60] = nil;
                end;
            end;
            l_pairs_2 = v34.GettingUp;
            l_pairs_2.TimePosition = 0;
            l_pairs_2.Playing = true;
        end, 
        [Enum.HumanoidStateType.Jumping] = function() --[[ Line: 146 ]]
            -- upvalues: v40 (copy), v34 (copy)
            local l_pairs_3 = pairs;
            local l_v40_3 = v40;
            local v63 = {};
            for v64, v65 in pairs(l_v40_3) do
                v63[v64] = v65;
            end;
            for v66 in l_pairs_3(v63) do
                if v66 ~= nil then
                    v66.Playing = false;
                    v40[v66] = nil;
                end;
            end;
            l_pairs_3 = v34.Jumping;
            l_pairs_3.TimePosition = 0;
            l_pairs_3.Playing = true;
        end, 
        [Enum.HumanoidStateType.Swimming] = function() --[[ Line: 151 ]]
            -- upvalues: l_rootPart_0 (copy), v34 (copy), v40 (copy)
            local v67 = math.abs(l_rootPart_0.AssemblyLinearVelocity.Y);
            if v67 > 0.1 then
                v34.Splash.Volume = math.clamp((v67 - 100) * 0.72 / 250 + 0.28, 0, 1);
                local l_Splash_0 = v34.Splash;
                l_Splash_0.TimePosition = 0;
                l_Splash_0.Playing = true;
            end;
            local l_Swimming_0 = v34.Swimming;
            local l_pairs_4 = pairs;
            local l_v40_4 = v40;
            local v72 = {};
            for v73, v74 in pairs(l_v40_4) do
                v72[v73] = v74;
            end;
            for v75 in l_pairs_4(v72) do
                if v75 ~= l_Swimming_0 then
                    v75.Playing = false;
                    v40[v75] = nil;
                end;
            end;
            v34.Swimming.Playing = true;
            v40[v34.Swimming] = true;
        end, 
        [Enum.HumanoidStateType.Freefall] = function() --[[ Line: 162 ]]
            -- upvalues: v34 (copy), v40 (copy), l_pcall_0 (ref)
            v34.FreeFalling.Volume = 0;
            local l_FreeFalling_0 = v34.FreeFalling;
            local l_pairs_5 = pairs;
            local l_v40_5 = v40;
            local v79 = {};
            for v80, v81 in pairs(l_v40_5) do
                v79[v80] = v81;
            end;
            for v82 in l_pairs_5(v79) do
                if v82 ~= l_FreeFalling_0 then
                    v82.Playing = false;
                    v40[v82] = nil;
                end;
            end;
            if l_pcall_0 then
                v34.FreeFalling.Looped = true;
                v34.FreeFalling.PlaybackRegionsEnabled = true;
                v34.FreeFalling.LoopRegion = NumberRange.new(2, 9);
                l_FreeFalling_0 = v34.FreeFalling;
                l_FreeFalling_0.TimePosition = 0;
                l_FreeFalling_0.Playing = true;
            end;
            v40[v34.FreeFalling] = true;
        end, 
        [Enum.HumanoidStateType.Landed] = function() --[[ Line: 174 ]]
            -- upvalues: v40 (copy), l_rootPart_0 (copy), v34 (copy)
            local l_pairs_6 = pairs;
            local l_v40_6 = v40;
            local v85 = {};
            for v86, v87 in pairs(l_v40_6) do
                v85[v86] = v87;
            end;
            for v88 in l_pairs_6(v85) do
                if v88 ~= nil then
                    v88.Playing = false;
                    v40[v88] = nil;
                end;
            end;
            l_pairs_6 = math.abs(l_rootPart_0.AssemblyLinearVelocity.Y);
            if l_pairs_6 > 75 then
                v34.Landing.Volume = math.clamp((l_pairs_6 - 50) * 1 / 50 + 0, 0, 1);
                local l_Landing_0 = v34.Landing;
                l_Landing_0.TimePosition = 0;
                l_Landing_0.Playing = true;
            end;
        end, 
        [Enum.HumanoidStateType.Running] = function() --[[ Line: 183 ]]
            -- upvalues: v34 (copy), v40 (copy)
            local l_Running_0 = v34.Running;
            local l_pairs_7 = pairs;
            local l_v40_7 = v40;
            local v93 = {};
            for v94, v95 in pairs(l_v40_7) do
                v93[v94] = v95;
            end;
            for v96 in l_pairs_7(v93) do
                if v96 ~= l_Running_0 then
                    v96.Playing = false;
                    v40[v96] = nil;
                end;
            end;
            v34.Running.Playing = true;
            v40[v34.Running] = true;
        end, 
        [Enum.HumanoidStateType.Climbing] = function() --[[ Line: 189 ]]
            -- upvalues: v34 (copy), l_rootPart_0 (copy), v11 (ref), v12 (ref), v33 (ref), v40 (copy)
            local l_Climbing_0 = v34.Climbing;
            local l_AssemblyLinearVelocity_0 = l_rootPart_0.AssemblyLinearVelocity;
            if math.abs((if v11 then v12(v33, l_AssemblyLinearVelocity_0) else l_AssemblyLinearVelocity_0).Y) > 0.1 then
                l_Climbing_0.Playing = true;
                local l_pairs_8 = pairs;
                local l_v40_8 = v40;
                local v101 = {};
                for v102, v103 in pairs(l_v40_8) do
                    v101[v102] = v103;
                end;
                for v104 in l_pairs_8(v101) do
                    if v104 ~= l_Climbing_0 then
                        v104.Playing = false;
                        v40[v104] = nil;
                    end;
                end;
            else
                local l_pairs_9 = pairs;
                local l_v40_9 = v40;
                local v107 = {};
                for v108, v109 in pairs(l_v40_9) do
                    v107[v108] = v109;
                end;
                for v110 in l_pairs_9(v107) do
                    if v110 ~= nil then
                        v110.Playing = false;
                        v40[v110] = nil;
                    end;
                end;
            end;
            v40[l_Climbing_0] = true;
        end, 
        [Enum.HumanoidStateType.Seated] = function() --[[ Line: 202 ]]
            -- upvalues: v40 (copy)
            local l_pairs_10 = pairs;
            local l_v40_10 = v40;
            local v113 = {};
            for v114, v115 in pairs(l_v40_10) do
                v113[v114] = v115;
            end;
            for v116 in l_pairs_10(v113) do
                if v116 ~= nil then
                    v116.Playing = false;
                    v40[v116] = nil;
                end;
            end;
        end, 
        [Enum.HumanoidStateType.Dead] = function() --[[ Line: 206 ]]
            -- upvalues: v40 (copy), v34 (copy)
            local l_pairs_11 = pairs;
            local l_v40_11 = v40;
            local v119 = {};
            for v120, v121 in pairs(l_v40_11) do
                v119[v120] = v121;
            end;
            for v122 in l_pairs_11(v119) do
                if v122 ~= nil then
                    v122.Playing = false;
                    v40[v122] = nil;
                end;
            end;
            l_pairs_11 = v34.Died;
            l_pairs_11.TimePosition = 0;
            l_pairs_11.Playing = true;
        end
    };
    local v134 = {
        [v34.Climbing] = function(_, v125, v126) --[[ Line: 214 ]]
            -- upvalues: v11 (ref), v12 (ref), v33 (ref)
            v125.Playing = (if v11 then v12(v33, v126) else v126).Magnitude > 0.1;
        end, 
        [v34.FreeFalling] = function(v127, v128, v129) --[[ Line: 219 ]]
            if v129.Magnitude > 75 then
                v128.Volume = math.clamp(v128.Volume + 0.9 * v127, 0, 1);
                return;
            else
                v128.Volume = 0;
                return;
            end;
        end, 
        [v34.Running] = function(_, v131, v132) --[[ Line: 227 ]]
            -- upvalues: l_humanoid_0 (copy)
            local v133 = false;
            if v132.Magnitude > 0.5 then
                v133 = l_humanoid_0.MoveDirection.Magnitude > 0.5;
            end;
            v131.Playing = v133;
        end
    };
    local v135 = {
        [Enum.HumanoidStateType.RunningNoPhysics] = Enum.HumanoidStateType.Running
    };
    local v136 = v135[l_humanoid_0:GetState()] or l_humanoid_0:GetState();
    local function _(v137) --[[ Line: 239 ]] --[[ Name: transitionTo ]]
        -- upvalues: v123 (copy), v136 (ref)
        local v138 = v123[v137];
        if v138 then
            v138();
        end;
        v136 = v137;
    end;
    local l_v136_0 = v136;
    local v141 = v123[l_v136_0];
    if v141 then
        v141();
    end;
    v136 = l_v136_0;
    l_v136_0 = l_humanoid_0.StateChanged:Connect(function(_, v143) --[[ Line: 251 ]]
        -- upvalues: v135 (copy), v136 (ref), v123 (copy)
        v143 = v135[v143] or v143;
        if v143 ~= v136 then
            local l_v143_0 = v143;
            local v145 = v123[l_v143_0];
            if v145 then
                v145();
            end;
            v136 = l_v143_0;
        end;
    end);
    v141 = l_RunService_0.Stepped:Connect(function(_, v147) --[[ Line: 259 ]]
        -- upvalues: v40 (copy), v134 (copy), l_rootPart_0 (copy)
        for v148 in pairs(v40) do
            local v149 = v134[v148];
            if v149 then
                v149(v147, v148, l_rootPart_0.AssemblyLinearVelocity);
            end;
        end;
    end);
    return function() --[[ Line: 270 ]] --[[ Name: terminate ]]
        -- upvalues: l_v136_0 (copy), v141 (copy), v34 (copy)
        l_v136_0:Disconnect();
        v141:Disconnect();
        for _, v151 in pairs(v34) do
            v151:Destroy();
        end;
        table.clear(v34);
    end;
end);
local v153 = {};
local function v155(v154) --[[ Line: 293 ]] --[[ Name: characterAdded ]]
    -- upvalues: v152 (copy)
    v152:bindRoot(v154);
end;
local function v157(v156) --[[ Line: 297 ]] --[[ Name: characterRemoving ]]
    -- upvalues: v152 (copy)
    v152:unbindRoot(v156);
end;
local function v161(v158) --[[ Line: 301 ]] --[[ Name: playerAdded ]]
    -- upvalues: v153 (copy), v152 (copy), v155 (copy), v157 (copy)
    local v159 = v153[v158];
    if not v159 then
        v159 = {};
        v153[v158] = v159;
    end;
    if v158.Character then
        local l_Character_0 = v158.Character;
        v152:bindRoot(l_Character_0);
    end;
    table.insert(v159, v158.CharacterAdded:Connect(v155));
    table.insert(v159, v158.CharacterRemoving:Connect(v157));
end;
local function v167(v162) --[[ Line: 315 ]] --[[ Name: playerRemoving ]]
    -- upvalues: v153 (copy), v152 (copy)
    local v163 = v153[v162];
    if v163 then
        for _, v165 in ipairs(v163) do
            v165:Disconnect();
        end;
        v153[v162] = nil;
    end;
    if v162.Character then
        local l_Character_1 = v162.Character;
        v152:unbindRoot(l_Character_1);
    end;
end;
for _, v169 in ipairs(l_Players_0:GetPlayers()) do
    task.spawn(v161, v169);
end;
l_Players_0.PlayerAdded:Connect(v161);
l_Players_0.PlayerRemoving:Connect(v167);