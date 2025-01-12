local l_CorePackages_0 = game:GetService("CorePackages");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_GuiService_0 = game:GetService("GuiService");
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Packages.RoactRodux);
local l_Parent_0 = script.Parent.Parent.Parent;
local v6 = require(l_Parent_0.Actions.SetPlayerListVisibility);
local v7 = v3.PureComponent:extend("ContextActionsBinder");
local v8 = {
    Enum.UserInputType.Gamepad1, 
    Enum.UserInputType.Gamepad2, 
    Enum.UserInputType.Gamepad3, 
    Enum.UserInputType.Gamepad4, 
    Enum.UserInputType.Gamepad5, 
    Enum.UserInputType.Gamepad6, 
    Enum.UserInputType.Gamepad7, 
    Enum.UserInputType.Gamepad8
};
v7.init = function(v9) --[[ Line: 30 ]] --[[ Name: init ]]
    v9.boundPlayerListActions = false;
end;
v7.bindActions = function(v10) --[[ Line: 34 ]] --[[ Name: bindActions ]]
    -- upvalues: l_ContextActionService_0 (copy), l_GuiService_0 (copy), v8 (copy)
    l_ContextActionService_0:BindCoreAction("RbxPlayerListToggle", function(_, v12, _) --[[ Line: 35 ]]
        -- upvalues: l_GuiService_0 (ref), v10 (copy)
        if l_GuiService_0.MenuIsOpen then
            return Enum.ContextActionResult.Pass;
        elseif v12 ~= Enum.UserInputState.Begin then
            return Enum.ContextActionResult.Pass;
        else
            v10.props.setVisibility(not v10.props.displayOptions.isVisible);
            return Enum.ContextActionResult.Sink;
        end;
    end, false, Enum.KeyCode.Tab);
    l_ContextActionService_0:BindCoreAction("RbxPlayerListStopMovement", function(_, _, _) --[[ Line: 46 ]]
        -- upvalues: v10 (copy)
        if v10.props.displayOptions.isVisible and v10.props.displayOptions.isTenFootInterface then
            return Enum.ContextActionResult.Sink;
        else
            return Enum.ContextActionResult.Pass;
        end;
    end, false, unpack(v8));
    l_ContextActionService_0:BindCoreAction("RbxPlayerListGamepadClose", function(_, v18, _) --[[ Line: 52 ]]
        -- upvalues: v10 (copy)
        if v18 ~= Enum.UserInputState.Begin then
            return Enum.ContextActionResult.Pass;
        elseif v10.props.displayOptions.isVisible and v10.props.displayOptions.isTenFootInterface then
            v10.props.setVisibility(false);
            return Enum.ContextActionResult.Sink;
        else
            return Enum.ContextActionResult.Pass;
        end;
    end, false, Enum.KeyCode.ButtonB, Enum.KeyCode.ButtonStart);
    v10.boundPlayerListActions = true;
end;
v7.unbindActions = function(v20) --[[ Line: 65 ]] --[[ Name: unbindActions ]]
    -- upvalues: l_ContextActionService_0 (copy)
    l_ContextActionService_0:UnbindCoreAction("RbxPlayerListToggle");
    l_ContextActionService_0:UnbindCoreAction("RbxPlayerListStopMovement");
    l_ContextActionService_0:UnbindCoreAction("RbxPlayerListGamepadClose");
    v20.boundPlayerListActions = false;
end;
v7.didMount = function(v21) --[[ Line: 72 ]] --[[ Name: didMount ]]
    v21:bindActions();
end;
v7.render = function(_) --[[ Line: 76 ]] --[[ Name: render ]]
    return nil;
end;
v7.willUnmount = function(v23) --[[ Line: 80 ]] --[[ Name: willUnmount ]]
    if v23.boundPlayerListActions then
        v23:unbindActions();
    end;
end;
return v4.connect(function(v24) --[[ Line: 86 ]] --[[ Name: mapStateToProps ]]
    return {
        displayOptions = v24.displayOptions
    };
end, function(v25) --[[ Line: 92 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v6 (copy)
    return {
        setVisibility = function(v26) --[[ Line: 94 ]] --[[ Name: setVisibility ]]
            -- upvalues: v25 (copy), v6 (ref)
            return v25(v6(v26));
        end
    };
end)(v7);