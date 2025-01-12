local l_CorePackages_0 = game:GetService("CorePackages");
local l_Players_0 = game:GetService("Players");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.t);
local l_Parent_0 = script.Parent.Parent.Parent;
local v6 = require(l_Parent_0.Actions.SetIsDead);
local v7 = require(l_Parent_0.Actions.UpdateHealth);
local v8 = require(l_Parent_0.Parent.Common.EventConnection);
local v9 = require(l_Parent_0.Flags.GetFFlagFixHealthDesync);
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
while not l_LocalPlayer_0 do
    l_Players_0:GetPropertyChangedSignal("LocalPlayer"):Wait();
    l_LocalPlayer_0 = l_Players_0.LocalPlayer;
end;
local v11 = v2.PureComponent:extend("HealthConnector");
v11.validateProps = v4.strictInterface({
    setIsDead = v4.callback, 
    updateHealth = v4.callback
});
v11.init = function(v12) --[[ Line: 31 ]] --[[ Name: init ]]
    -- upvalues: v9 (copy), l_LocalPlayer_0 (ref)
    if v9() then
        v12:setState({
            character = nil, 
            humanoid = nil
        });
        return;
    else
        local l_Character_0 = l_LocalPlayer_0.Character;
        local v14 = nil;
        if l_Character_0 then
            v14 = l_Character_0:FindFirstChildOfClass("Humanoid");
        end;
        v12:setState({
            character = l_Character_0, 
            humanoid = v14
        });
        return;
    end;
end;
v11.didMount = function(v15) --[[ Line: 51 ]] --[[ Name: didMount ]]
    -- upvalues: v9 (copy), l_LocalPlayer_0 (ref)
    if v9() then
        local l_Character_1 = l_LocalPlayer_0.Character;
        local v17 = nil;
        if l_Character_1 then
            v17 = l_Character_1:FindFirstChildOfClass("Humanoid");
        end;
        v15:setState({
            character = l_Character_1, 
            humanoid = v17
        });
        return;
    else
        if v15.state.humanoid then
            v15.props.updateHealth(v15.state.humanoid.Health, v15.state.humanoid.MaxHealth);
        end;
        return;
    end;
end;
v11.render = function(v18) --[[ Line: 70 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v8 (copy), l_LocalPlayer_0 (ref)
    local v19 = {};
    if v18.state.humanoid then
        v19.HealthChangedConnection = v2.createElement(v8, {
            event = v18.state.humanoid.HealthChanged, 
            callback = function(_) --[[ Line: 76 ]] --[[ Name: callback ]]
                -- upvalues: v18 (copy)
                v18.props.updateHealth(v18.state.humanoid.Health, v18.state.humanoid.MaxHealth);
            end
        });
        v19.HumanoidDiedConnection = v2.createElement(v8, {
            event = v18.state.humanoid.Died, 
            callback = function() --[[ Line: 83 ]] --[[ Name: callback ]]
                -- upvalues: v18 (copy)
                v18.props.setIsDead(true);
            end
        });
    elseif v18.state.character then
        v19.ChildAddedConnection = v2.createElement(v8, {
            event = v18.state.character.ChildAdded, 
            callback = function(v21) --[[ Line: 90 ]] --[[ Name: callback ]]
                -- upvalues: v18 (copy)
                if v21:IsA("Humanoid") then
                    v18:setState({
                        humanoid = v21
                    });
                end;
            end
        });
    end;
    v19.CharacterAddedConnection = v2.createElement(v8, {
        event = l_LocalPlayer_0.CharacterAdded, 
        callback = function(v22) --[[ Line: 102 ]] --[[ Name: callback ]]
            -- upvalues: v18 (copy), v2 (ref)
            v18:setState({
                humanoid = v22:FindFirstChildOfClass("Humanoid") or v2.None, 
                character = v22
            });
            v18.props.setIsDead(false);
        end
    });
    v19.CharacterRemovingConnection = v2.createElement(v8, {
        event = l_LocalPlayer_0.CharacterRemoving, 
        callback = function() --[[ Line: 113 ]] --[[ Name: callback ]]
            -- upvalues: v18 (copy), v2 (ref)
            v18:setState({
                humanoid = v2.None, 
                character = v2.None
            });
        end
    });
    return v2.createFragment(v19);
end;
v11.didUpdate = function(v23, _, v25) --[[ Line: 124 ]] --[[ Name: didUpdate ]]
    if v23.state.humanoid == nil then
        v23.props.updateHealth(0, 0);
    elseif v23.state.humanoid ~= v25.humanoid then
        v23.props.setIsDead(false);
        v23.props.updateHealth(v23.state.humanoid.Health, v23.state.humanoid.MaxHealth);
    end;
    if v23.state.character and v23.state.character ~= v25.character then
        local l_Humanoid_0 = v23.state.character:FindFirstChildWhichIsA("Humanoid");
        if l_Humanoid_0 and l_Humanoid_0 ~= v23.state.humanoid then
            v23:setState({
                humanoid = l_Humanoid_0
            });
        end;
    end;
end;
return v3.UNSTABLE_connect2(nil, function(v27) --[[ Line: 142 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v6 (copy), v7 (copy)
    return {
        setIsDead = function(v28) --[[ Line: 144 ]] --[[ Name: setIsDead ]]
            -- upvalues: v27 (copy), v6 (ref)
            return v27(v6(v28));
        end, 
        updateHealth = function(v29, v30) --[[ Line: 148 ]] --[[ Name: updateHealth ]]
            -- upvalues: v27 (copy), v7 (ref)
            return v27(v7(v29, v30));
        end
    };
end)(v11);