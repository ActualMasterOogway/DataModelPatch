local l_game_EngineFeature_0 = game:GetEngineFeature("CompositorAnimateScript");
local l_Players_0 = game:GetService("Players");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
if not l_LocalPlayer_0 then
    l_Players_0:GetPropertyChangedSignal("LocalPlayer"):Wait();
    l_LocalPlayer_0 = l_Players_0.LocalPlayer;
end;
local v3 = {
    Value = false, 
    ChangedEvent = Instance.new("BindableEvent")
};
local function v6(v4) --[[ Line: 17 ]] --[[ Name: getAnimateScript ]]
    -- upvalues: l_game_EngineFeature_0 (copy)
    if not v4 then
        return nil;
    else
        local l_Animate_0 = v4:FindFirstChild("Animate");
        if l_Animate_0 and l_Animate_0:IsA("LocalScript") then
            return l_Animate_0;
        elseif l_Animate_0 and l_Animate_0:IsA("Script") and l_Animate_0.RunContext == Enum.RunContext.Client then
            return l_Animate_0;
        elseif l_game_EngineFeature_0 and l_Animate_0 and l_Animate_0:IsA("Actor") then
            return l_Animate_0;
        else
            return nil;
        end;
    end;
end;
local function _(v7) --[[ Line: 36 ]] --[[ Name: getPlayEmoteBindable ]]
    -- upvalues: v6 (copy)
    local v8 = v6(v7);
    if not v8 then
        return nil;
    else
        local l_PlayEmote_0 = v8:FindFirstChild("PlayEmote");
        if l_PlayEmote_0 and l_PlayEmote_0:IsA("BindableFunction") then
            return l_PlayEmote_0;
        else
            return nil;
        end;
    end;
end;
local function _(v11) --[[ Line: 50 ]] --[[ Name: getCanPlayEmotes ]]
    -- upvalues: v6 (copy)
    local v12 = v6(v11);
    local v13;
    if not v12 then
        v13 = nil;
    else
        local l_PlayEmote_1 = v12:FindFirstChild("PlayEmote");
        v13 = if l_PlayEmote_1 and l_PlayEmote_1:IsA("BindableFunction") then l_PlayEmote_1 else nil;
    end;
    return v13 ~= nil;
end;
local v16 = nil;
local v17 = nil;
local v18 = nil;
local function _() --[[ Line: 57 ]] --[[ Name: disconnectListeners ]]
    -- upvalues: v16 (ref), v17 (ref), v18 (ref)
    if v16 then
        v16:Disconnect();
        v16 = nil;
    end;
    if v17 then
        v17:Disconnect();
        v17 = nil;
    end;
    if v18 then
        v18:Disconnect();
        v18 = nil;
    end;
end;
local v20 = nil;
local function _(v21) --[[ Line: 76 ]] --[[ Name: checkUpdate ]]
    -- upvalues: v6 (copy), v3 (copy), v20 (ref)
    local v22 = v6(v21);
    local v23;
    if not v22 then
        v23 = nil;
    else
        local l_PlayEmote_2 = v22:FindFirstChild("PlayEmote");
        v23 = if l_PlayEmote_2 and l_PlayEmote_2:IsA("BindableFunction") then l_PlayEmote_2 else nil;
    end;
    local v25 = v23 ~= nil;
    if v3.Value ~= v25 then
        v3.Value = v25;
        v3.ChangedEvent:Fire(v25);
    end;
    v20(v25, v21);
end;
local function _(v27) --[[ Line: 87 ]] --[[ Name: connectAnimateAddedListener ]]
    -- upvalues: v6 (copy), v3 (copy), v20 (ref), v16 (ref), l_game_EngineFeature_0 (copy)
    if v6(v27) then
        local v28 = v6(v27);
        local v29;
        if not v28 then
            v29 = nil;
        else
            local l_PlayEmote_3 = v28:FindFirstChild("PlayEmote");
            v29 = if l_PlayEmote_3 and l_PlayEmote_3:IsA("BindableFunction") then l_PlayEmote_3 else nil;
        end;
        local v31 = v29 ~= nil;
        if v3.Value ~= v31 then
            v3.Value = v31;
            v3.ChangedEvent:Fire(v31);
        end;
        v20(v31, v27);
        return;
    else
        v16 = v27.ChildAdded:Connect(function(v32) --[[ Line: 94 ]]
            -- upvalues: l_game_EngineFeature_0 (ref), v27 (copy), v6 (ref), v3 (ref), v20 (ref)
            if (v32:IsA("LocalScript") or v32:IsA("Script") and v32.RunContext == Enum.RunContext.Client or l_game_EngineFeature_0 and v32:IsA("Actor")) and v32.Name == "Animate" then
                local l_v27_0 = v27;
                local v34 = v6(l_v27_0);
                local v35;
                if not v34 then
                    v35 = nil;
                else
                    local l_PlayEmote_4 = v34:FindFirstChild("PlayEmote");
                    v35 = if l_PlayEmote_4 and l_PlayEmote_4:IsA("BindableFunction") then l_PlayEmote_4 else nil;
                end;
                local v37 = v35 ~= nil;
                if v3.Value ~= v37 then
                    v3.Value = v37;
                    v3.ChangedEvent:Fire(v37);
                end;
                v20(v37, l_v27_0);
            end;
        end);
        return;
    end;
end;
local function _(v39, v40) --[[ Line: 106 ]] --[[ Name: connectPlayEmoteAddedListener ]]
    -- upvalues: v6 (copy), v3 (copy), v20 (ref), v17 (ref)
    local v41 = v6(v39);
    local v42;
    if not v41 then
        v42 = nil;
    else
        local l_PlayEmote_5 = v41:FindFirstChild("PlayEmote");
        v42 = if l_PlayEmote_5 and l_PlayEmote_5:IsA("BindableFunction") then l_PlayEmote_5 else nil;
    end;
    if v42 then
        local v44 = v6(v39);
        local v45;
        if not v44 then
            v45 = nil;
        else
            local l_PlayEmote_6 = v44:FindFirstChild("PlayEmote");
            v45 = if l_PlayEmote_6 and l_PlayEmote_6:IsA("BindableFunction") then l_PlayEmote_6 else nil;
        end;
        v41 = v45 ~= nil;
        if v3.Value ~= v41 then
            v3.Value = v41;
            v3.ChangedEvent:Fire(v41);
        end;
        v20(v41, v39);
        return;
    else
        v17 = v40.ChildAdded:Connect(function(v47) --[[ Line: 113 ]]
            -- upvalues: v39 (copy), v6 (ref), v3 (ref), v20 (ref)
            if v47:IsA("BindableFunction") and v47.Name == "PlayEmote" then
                local l_v39_0 = v39;
                local v49 = v6(l_v39_0);
                local v50;
                if not v49 then
                    v50 = nil;
                else
                    local l_PlayEmote_7 = v49:FindFirstChild("PlayEmote");
                    v50 = if l_PlayEmote_7 and l_PlayEmote_7:IsA("BindableFunction") then l_PlayEmote_7 else nil;
                end;
                local v52 = v50 ~= nil;
                if v3.Value ~= v52 then
                    v3.Value = v52;
                    v3.ChangedEvent:Fire(v52);
                end;
                v20(v52, l_v39_0);
            end;
        end);
        return;
    end;
end;
local _ = function(v54) --[[ Line: 120 ]] --[[ Name: connectPlayEmoteRemovedListener ]]
    -- upvalues: v6 (copy), v3 (copy), v20 (ref), v18 (ref)
    local v55 = v6(v54);
    local v56;
    if not v55 then
        v56 = nil;
    else
        local l_PlayEmote_8 = v55:FindFirstChild("PlayEmote");
        v56 = if l_PlayEmote_8 and l_PlayEmote_8:IsA("BindableFunction") then l_PlayEmote_8 else nil;
    end;
    if not v56 then
        local v58 = v6(v54);
        local v59;
        if not v58 then
            v59 = nil;
        else
            local l_PlayEmote_9 = v58:FindFirstChild("PlayEmote");
            v59 = if l_PlayEmote_9 and l_PlayEmote_9:IsA("BindableFunction") then l_PlayEmote_9 else nil;
        end;
        v55 = v59 ~= nil;
        if v3.Value ~= v55 then
            v3.Value = v55;
            v3.ChangedEvent:Fire(v55);
        end;
        v20(v55, v54);
        return;
    else
        v18 = v56.AncestryChanged:Connect(function(_, v62) --[[ Line: 127 ]]
            -- upvalues: v56 (copy), v54 (copy), v6 (ref), v3 (ref), v20 (ref)
            if not v62 or not v56:IsDescendantOf(v54) then
                local l_v54_0 = v54;
                local v64 = v6(l_v54_0);
                local v65;
                if not v64 then
                    v65 = nil;
                else
                    local l_PlayEmote_10 = v64:FindFirstChild("PlayEmote");
                    v65 = if l_PlayEmote_10 and l_PlayEmote_10:IsA("BindableFunction") then l_PlayEmote_10 else nil;
                end;
                local v67 = v65 ~= nil;
                if v3.Value ~= v67 then
                    v3.Value = v67;
                    v3.ChangedEvent:Fire(v67);
                end;
                v20(v67, l_v54_0);
            end;
        end);
        return;
    end;
end;
v20 = function(v69, v70) --[[ Line: 134 ]]
    -- upvalues: v16 (ref), v17 (ref), v18 (ref), v6 (copy), v3 (copy), v20 (ref), l_game_EngineFeature_0 (copy)
    if v16 then
        v16:Disconnect();
        v16 = nil;
    end;
    if v17 then
        v17:Disconnect();
        v17 = nil;
    end;
    if v18 then
        v18:Disconnect();
        v18 = nil;
    end;
    if not v70 then
        return;
    elseif v69 then
        local v71 = v6(v70);
        local v72;
        if not v71 then
            v72 = nil;
        else
            local l_PlayEmote_11 = v71:FindFirstChild("PlayEmote");
            v72 = if l_PlayEmote_11 and l_PlayEmote_11:IsA("BindableFunction") then l_PlayEmote_11 else nil;
        end;
        if not v72 then
            local v74 = v6(v70);
            local v75;
            if not v74 then
                v75 = nil;
            else
                local l_PlayEmote_12 = v74:FindFirstChild("PlayEmote");
                v75 = if l_PlayEmote_12 and l_PlayEmote_12:IsA("BindableFunction") then l_PlayEmote_12 else nil;
            end;
            v71 = v75 ~= nil;
            if v3.Value ~= v71 then
                v3.Value = v71;
                v3.ChangedEvent:Fire(v71);
            end;
            v20(v71, v70);
            return;
        else
            v18 = v72.AncestryChanged:Connect(function(_, v78) --[[ Line: 127 ]]
                -- upvalues: v72 (copy), v70 (copy), v6 (ref), v3 (ref), v20 (ref)
                if not v78 or not v72:IsDescendantOf(v70) then
                    local l_v70_0 = v70;
                    local v80 = v6(l_v70_0);
                    local v81;
                    if not v80 then
                        v81 = nil;
                    else
                        local l_PlayEmote_13 = v80:FindFirstChild("PlayEmote");
                        v81 = if l_PlayEmote_13 and l_PlayEmote_13:IsA("BindableFunction") then l_PlayEmote_13 else nil;
                    end;
                    local v83 = v81 ~= nil;
                    if v3.Value ~= v83 then
                        v3.Value = v83;
                        v3.ChangedEvent:Fire(v83);
                    end;
                    v20(v83, l_v70_0);
                end;
            end);
            return;
        end;
    else
        local v84 = v6(v70);
        if v84 then
            local v85 = v6(v70);
            local v86;
            if not v85 then
                v86 = nil;
            else
                local l_PlayEmote_14 = v85:FindFirstChild("PlayEmote");
                v86 = if l_PlayEmote_14 and l_PlayEmote_14:IsA("BindableFunction") then l_PlayEmote_14 else nil;
            end;
            if v86 then
                local v88 = v6(v70);
                local v89;
                if not v88 then
                    v89 = nil;
                else
                    local l_PlayEmote_15 = v88:FindFirstChild("PlayEmote");
                    v89 = if l_PlayEmote_15 and l_PlayEmote_15:IsA("BindableFunction") then l_PlayEmote_15 else nil;
                end;
                v85 = v89 ~= nil;
                if v3.Value ~= v85 then
                    v3.Value = v85;
                    v3.ChangedEvent:Fire(v85);
                end;
                v20(v85, v70);
                return;
            else
                v17 = v84.ChildAdded:Connect(function(v91) --[[ Line: 113 ]]
                    -- upvalues: v70 (copy), v6 (ref), v3 (ref), v20 (ref)
                    if v91:IsA("BindableFunction") and v91.Name == "PlayEmote" then
                        local l_v70_1 = v70;
                        local v93 = v6(l_v70_1);
                        local v94;
                        if not v93 then
                            v94 = nil;
                        else
                            local l_PlayEmote_16 = v93:FindFirstChild("PlayEmote");
                            v94 = if l_PlayEmote_16 and l_PlayEmote_16:IsA("BindableFunction") then l_PlayEmote_16 else nil;
                        end;
                        local v96 = v94 ~= nil;
                        if v3.Value ~= v96 then
                            v3.Value = v96;
                            v3.ChangedEvent:Fire(v96);
                        end;
                        v20(v96, l_v70_1);
                    end;
                end);
                return;
            end;
        elseif v6(v70) then
            local v97 = v6(v70);
            local v98;
            if not v97 then
                v98 = nil;
            else
                local l_PlayEmote_17 = v97:FindFirstChild("PlayEmote");
                v98 = if l_PlayEmote_17 and l_PlayEmote_17:IsA("BindableFunction") then l_PlayEmote_17 else nil;
            end;
            local v100 = v98 ~= nil;
            if v3.Value ~= v100 then
                v3.Value = v100;
                v3.ChangedEvent:Fire(v100);
            end;
            v20(v100, v70);
            return;
        else
            v16 = v70.ChildAdded:Connect(function(v101) --[[ Line: 94 ]]
                -- upvalues: l_game_EngineFeature_0 (ref), v70 (copy), v6 (ref), v3 (ref), v20 (ref)
                if (v101:IsA("LocalScript") or v101:IsA("Script") and v101.RunContext == Enum.RunContext.Client or l_game_EngineFeature_0 and v101:IsA("Actor")) and v101.Name == "Animate" then
                    local l_v70_2 = v70;
                    local v103 = v6(l_v70_2);
                    local v104;
                    if not v103 then
                        v104 = nil;
                    else
                        local l_PlayEmote_18 = v103:FindFirstChild("PlayEmote");
                        v104 = if l_PlayEmote_18 and l_PlayEmote_18:IsA("BindableFunction") then l_PlayEmote_18 else nil;
                    end;
                    local v106 = v104 ~= nil;
                    if v3.Value ~= v106 then
                        v3.Value = v106;
                        v3.ChangedEvent:Fire(v106);
                    end;
                    v20(v106, l_v70_2);
                end;
            end);
            return;
        end;
    end;
end;
local function _(v107) --[[ Line: 154 ]] --[[ Name: onCharacterChanged ]]
    -- upvalues: v16 (ref), v17 (ref), v18 (ref), v6 (copy), v3 (copy), v20 (ref)
    if v16 then
        v16:Disconnect();
        v16 = nil;
    end;
    if v17 then
        v17:Disconnect();
        v17 = nil;
    end;
    if v18 then
        v18:Disconnect();
        v18 = nil;
    end;
    local v108 = v6(v107);
    local v109;
    if not v108 then
        v109 = nil;
    else
        local l_PlayEmote_19 = v108:FindFirstChild("PlayEmote");
        v109 = if l_PlayEmote_19 and l_PlayEmote_19:IsA("BindableFunction") then l_PlayEmote_19 else nil;
    end;
    local v111 = v109 ~= nil;
    if v3.Value ~= v111 then
        v3.Value = v111;
        v3.ChangedEvent:Fire(v111);
    end;
    v20(v111, v107);
end;
l_LocalPlayer_0:GetPropertyChangedSignal("Character"):Connect(function() --[[ Line: 159 ]]
    -- upvalues: l_LocalPlayer_0 (ref), v16 (ref), v17 (ref), v18 (ref), v6 (copy), v3 (copy), v20 (ref)
    local l_Character_0 = l_LocalPlayer_0.Character;
    if v16 then
        v16:Disconnect();
        v16 = nil;
    end;
    if v17 then
        v17:Disconnect();
        v17 = nil;
    end;
    if v18 then
        v18:Disconnect();
        v18 = nil;
    end;
    local v114 = v6(l_Character_0);
    local v115;
    if not v114 then
        v115 = nil;
    else
        local l_PlayEmote_20 = v114:FindFirstChild("PlayEmote");
        v115 = if l_PlayEmote_20 and l_PlayEmote_20:IsA("BindableFunction") then l_PlayEmote_20 else nil;
    end;
    local v117 = v115 ~= nil;
    if v3.Value ~= v117 then
        v3.Value = v117;
        v3.ChangedEvent:Fire(v117);
    end;
    v20(v117, l_Character_0);
end);
local l_Character_1 = l_LocalPlayer_0.Character;
if v16 then
    v16:Disconnect();
    v16 = nil;
end;
if v17 then
    v17:Disconnect();
    v17 = nil;
end;
if v18 then
    v18:Disconnect();
    v18 = nil;
end;
local v119 = v6(l_Character_1);
local v120;
if not v119 then
    v120 = nil;
else
    local l_PlayEmote_21 = v119:FindFirstChild("PlayEmote");
    v120 = if l_PlayEmote_21 and l_PlayEmote_21:IsA("BindableFunction") then l_PlayEmote_21 else nil;
end;
local v122 = v120 ~= nil;
if v3.Value ~= v122 then
    v3.Value = v122;
    v3.ChangedEvent:Fire(v122);
end;
v20(v122, l_Character_1);
return v3;