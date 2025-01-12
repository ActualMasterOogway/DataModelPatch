local l_Parent_0 = script.Parent.Parent.Parent;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Roact_0 = require(l_CorePackages_0.Workspace.Packages.PurchasePromptDeps).Roact;
local v4 = require(l_CorePackages_0.InGameServices.MouseIconOverrideService);
local v5 = require(l_Parent_0.Actions.SetGamepadEnabled);
local v6 = require(l_Parent_0.Enums.PromptState);
local v7 = require(l_Parent_0.connectToStore);
local v8 = require(script.Parent.ExternalEventConnection);
local v9 = {
    [Enum.UserInputType.Gamepad1] = true, 
    [Enum.UserInputType.Gamepad2] = true, 
    [Enum.UserInputType.Gamepad3] = true, 
    [Enum.UserInputType.Gamepad4] = true
};
local v10 = l_Roact_0.Component:extend("InputTypeManager");
v10.init = function(v11) --[[ Line: 31 ]] --[[ Name: init ]]
    -- upvalues: v9 (copy)
    local l_setGamepadEnabled_0 = v11.props.setGamepadEnabled;
    v11.dispatchOnChange = function(v13) --[[ Line: 34 ]]
        -- upvalues: v9 (ref), l_setGamepadEnabled_0 (copy)
        local v14 = nil;
        v14 = v9[v13] and true or false;
        l_setGamepadEnabled_0(v14);
    end;
    v11.cursorOverridden = false;
end;
v10.render = function(v15) --[[ Line: 48 ]] --[[ Name: render ]]
    -- upvalues: l_Roact_0 (copy), v8 (copy), l_UserInputService_0 (copy)
    return l_Roact_0.createElement(v8, {
        event = l_UserInputService_0.LastInputTypeChanged, 
        callback = v15.dispatchOnChange
    });
end;
v10.didUpdate = function(v16, v17, _) --[[ Line: 55 ]] --[[ Name: didUpdate ]]
    -- upvalues: v6 (copy), v4 (copy)
    local v19 = false;
    if v17.promptState == v6.None then
        v19 = v16.props.promptState ~= v6.None;
    end;
    local v20 = false;
    if v17.promptState ~= v6.None then
        v20 = v16.props.promptState == v6.None;
    end;
    local v21 = v16.props.promptState ~= v6.None;
    local v22 = v16.props.gamepadEnabled and Enum.OverrideMouseIconBehavior.ForceHide or Enum.OverrideMouseIconBehavior.ForceShow;
    if v21 and v17.gamepadEnabled ~= v16.props.gamepadEnabled then
        if v16.cursorOverridden then
            v4.pop("PurchasePromptOverrideKey");
        end;
        v4.push("PurchasePromptOverrideKey", v22);
        v16.cursorOverridden = true;
        return;
    elseif v19 then
        v4.push("PurchasePromptOverrideKey", v22);
        v16.cursorOverridden = true;
        return;
    else
        if v20 then
            v4.pop("PurchasePromptOverrideKey");
            v16.cursorOverridden = false;
        end;
        return;
    end;
end;
return (v7(function(v23) --[[ Line: 82 ]] --[[ Name: mapStateToProps ]]
    return {
        promptState = v23.promptState, 
        gamepadEnabled = v23.gamepadEnabled
    };
end, function(v24) --[[ Line: 89 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v5 (copy)
    return {
        setGamepadEnabled = function(v25) --[[ Line: 91 ]] --[[ Name: setGamepadEnabled ]]
            -- upvalues: v24 (copy), v5 (ref)
            v24(v5(v25));
        end
    };
end)(v10));