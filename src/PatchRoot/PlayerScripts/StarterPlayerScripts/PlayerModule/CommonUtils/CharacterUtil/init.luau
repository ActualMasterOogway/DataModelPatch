local l_Players_0 = game:GetService("Players");
local l_Parent_0 = script.Parent;
local l_ConnectionUtil_0 = require(l_Parent_0:WaitForChild("ConnectionUtil"));
local v3 = {
    LOCAL_PLAYER = "LOCAL_PLAYER", 
    ON_LOCAL_PLAYER = "ON_LOCAL_PLAYER", 
    CHARACTER_ADDED = "CHARACTER_ADDED", 
    ON_CHARACTER = "ON_CHARACTER", 
    CHARACTER_CHILD_ADDED = "CHARACTER_CHILD_ADDED"
};
local v4 = {
    _connectionUtil = l_ConnectionUtil_0.new(), 
    _boundEvents = {}, 
    getLocalPlayer = function() --[[ Line: 53 ]] --[[ Name: getLocalPlayer ]]
        -- upvalues: l_Players_0 (copy)
        return l_Players_0.LocalPlayer;
    end
};
v4.onLocalPlayer = function(v5) --[[ Line: 57 ]] --[[ Name: onLocalPlayer ]]
    -- upvalues: v4 (copy), v3 (copy), l_Players_0 (copy)
    local v6 = v4.getLocalPlayer();
    if v6 then
        v5(v6);
    end;
    v4._connectionUtil:trackConnection(v3.LOCAL_PLAYER, l_Players_0:GetPropertyChangedSignal("LocalPlayer"):Connect(function() --[[ Line: 66 ]]
        -- upvalues: v4 (ref), v3 (ref)
        local v7 = v4.getLocalPlayer();
        assert(v7);
        v4._getOrCreateBoundEvent(v3.LOCAL_PLAYER):Fire(v7);
    end));
    return v4._getOrCreateBoundEvent(v3.LOCAL_PLAYER).Event:Connect(v5);
end;
v4.getCharacter = function() --[[ Line: 77 ]] --[[ Name: getCharacter ]]
    -- upvalues: v4 (copy)
    local v8 = v4.getLocalPlayer();
    if not v8 then
        return nil;
    else
        return v8.Character;
    end;
end;
v4.onCharacter = function(v9) --[[ Line: 85 ]] --[[ Name: onCharacter ]]
    -- upvalues: v4 (copy), v3 (copy)
    v4._connectionUtil:trackConnection(v3.ON_LOCAL_PLAYER, v4.onLocalPlayer(function(v10) --[[ Line: 89 ]]
        -- upvalues: v4 (ref), v9 (copy), v3 (ref)
        local v11 = v4.getCharacter();
        if v11 then
            v9(v11);
        end;
        v4._connectionUtil:trackConnection(v3.CHARACTER_ADDED, v10.CharacterAdded:Connect(function(v12) --[[ Line: 98 ]]
            -- upvalues: v4 (ref), v3 (ref)
            assert(v12);
            v4._getOrCreateBoundEvent(v3.CHARACTER_ADDED):Fire(v12);
        end));
    end));
    return v4._getOrCreateBoundEvent(v3.CHARACTER_ADDED).Event:Connect(v9);
end;
v4.getChild = function(v13, v14) --[[ Line: 110 ]] --[[ Name: getChild ]]
    -- upvalues: v4 (copy)
    local v15 = v4.getCharacter();
    if not v15 then
        return nil;
    else
        local l_v15_FirstChild_0 = v15:FindFirstChild(v13);
        if l_v15_FirstChild_0 and l_v15_FirstChild_0:IsA(v14) then
            return l_v15_FirstChild_0;
        else
            return nil;
        end;
    end;
end;
v4.onChild = function(v17, v18, v19) --[[ Line: 122 ]] --[[ Name: onChild ]]
    -- upvalues: v4 (copy), v3 (copy)
    v4._connectionUtil:trackConnection(v3.ON_CHARACTER, v4.onCharacter(function(v20) --[[ Line: 126 ]]
        -- upvalues: v4 (ref), v17 (copy), v18 (copy), v19 (copy), v3 (ref)
        local v21 = v4.getChild(v17, v18);
        if v21 then
            v19(v21);
        end;
        v4._connectionUtil:trackConnection(v3.CHARACTER_CHILD_ADDED, v20.ChildAdded:Connect(function(v22) --[[ Line: 135 ]]
            -- upvalues: v17 (ref), v18 (ref), v4 (ref), v3 (ref)
            if v22.Name == v17 and v22:IsA(v18) then
                v4._getOrCreateBoundEvent(v3.CHARACTER_CHILD_ADDED .. v17 .. v18):Fire(v22);
            end;
        end));
    end));
    return v4._getOrCreateBoundEvent(v3.CHARACTER_CHILD_ADDED .. v17 .. v18).Event:Connect(v19);
end;
v4._getOrCreateBoundEvent = function(v23) --[[ Line: 149 ]] --[[ Name: _getOrCreateBoundEvent ]]
    -- upvalues: v4 (copy)
    if not v4._boundEvents[v23] then
        v4._boundEvents[v23] = Instance.new("BindableEvent");
    end;
    return v4._boundEvents[v23];
end;
return v4;