local l_UserInputService_0 = game:GetService("UserInputService");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local _ = script.Parent.Parent:WaitForChild("CommonUtils");
local v3 = Vector3.new();
local l_BaseCharacterController_0 = require(script.Parent:WaitForChild("BaseCharacterController"));
local v5 = setmetatable({}, l_BaseCharacterController_0);
v5.__index = v5;
v5.new = function(v6) --[[ Line: 22 ]] --[[ Name: new ]]
    -- upvalues: l_BaseCharacterController_0 (copy), v5 (copy)
    local v7 = setmetatable(l_BaseCharacterController_0.new(), v5);
    v7.CONTROL_ACTION_PRIORITY = v6;
    v7.forwardValue = 0;
    v7.backwardValue = 0;
    v7.leftValue = 0;
    v7.rightValue = 0;
    v7.jumpEnabled = true;
    return v7;
end;
v5.Enable = function(v8, v9) --[[ Line: 37 ]] --[[ Name: Enable ]]
    -- upvalues: v3 (copy)
    if v9 == v8.enabled then
        return true;
    else
        v8.forwardValue = 0;
        v8.backwardValue = 0;
        v8.leftValue = 0;
        v8.rightValue = 0;
        v8.moveVector = v3;
        v8.jumpRequested = false;
        v8:UpdateJump();
        if v9 then
            v8:BindContextActions();
            v8:ConnectFocusEventListeners();
        else
            v8._connectionUtil:disconnectAll();
        end;
        v8.enabled = v9;
        return true;
    end;
end;
v5.UpdateMovement = function(v10, v11) --[[ Line: 64 ]] --[[ Name: UpdateMovement ]]
    -- upvalues: v3 (copy)
    if v11 == Enum.UserInputState.Cancel then
        v10.moveVector = v3;
        return;
    else
        v10.moveVector = Vector3.new(v10.leftValue + v10.rightValue, 0, v10.forwardValue + v10.backwardValue);
        return;
    end;
end;
v5.UpdateJump = function(v12) --[[ Line: 72 ]] --[[ Name: UpdateJump ]]
    v12.isJumping = v12.jumpRequested;
end;
v5.BindContextActions = function(v13) --[[ Line: 76 ]] --[[ Name: BindContextActions ]]
    -- upvalues: l_ContextActionService_0 (copy)
    local function v17(_, v15, _) --[[ Line: 82 ]]
        -- upvalues: v13 (copy)
        v13.forwardValue = v15 == Enum.UserInputState.Begin and -1 or 0;
        v13:UpdateMovement(v15);
        return Enum.ContextActionResult.Pass;
    end;
    local function v21(_, v19, _) --[[ Line: 88 ]]
        -- upvalues: v13 (copy)
        v13.backwardValue = v19 == Enum.UserInputState.Begin and 1 or 0;
        v13:UpdateMovement(v19);
        return Enum.ContextActionResult.Pass;
    end;
    local function v25(_, v23, _) --[[ Line: 94 ]]
        -- upvalues: v13 (copy)
        v13.leftValue = v23 == Enum.UserInputState.Begin and -1 or 0;
        v13:UpdateMovement(v23);
        return Enum.ContextActionResult.Pass;
    end;
    local function v29(_, v27, _) --[[ Line: 100 ]]
        -- upvalues: v13 (copy)
        v13.rightValue = v27 == Enum.UserInputState.Begin and 1 or 0;
        v13:UpdateMovement(v27);
        return Enum.ContextActionResult.Pass;
    end;
    local function v33(_, v31, _) --[[ Line: 106 ]]
        -- upvalues: v13 (copy)
        v13.jumpRequested = v13.jumpEnabled and v31 == Enum.UserInputState.Begin;
        v13:UpdateJump();
        return Enum.ContextActionResult.Pass;
    end;
    l_ContextActionService_0:BindActionAtPriority("moveForwardAction", v17, false, v13.CONTROL_ACTION_PRIORITY, Enum.PlayerActions.CharacterForward);
    l_ContextActionService_0:BindActionAtPriority("moveBackwardAction", v21, false, v13.CONTROL_ACTION_PRIORITY, Enum.PlayerActions.CharacterBackward);
    l_ContextActionService_0:BindActionAtPriority("moveLeftAction", v25, false, v13.CONTROL_ACTION_PRIORITY, Enum.PlayerActions.CharacterLeft);
    l_ContextActionService_0:BindActionAtPriority("moveRightAction", v29, false, v13.CONTROL_ACTION_PRIORITY, Enum.PlayerActions.CharacterRight);
    l_ContextActionService_0:BindActionAtPriority("jumpAction", v33, false, v13.CONTROL_ACTION_PRIORITY, Enum.PlayerActions.CharacterJump);
    v13._connectionUtil:trackBoundFunction("moveForwardAction", function() --[[ Line: 125 ]]
        -- upvalues: l_ContextActionService_0 (ref)
        l_ContextActionService_0:UnbindAction("moveForwardAction");
    end);
    v13._connectionUtil:trackBoundFunction("moveBackwardAction", function() --[[ Line: 126 ]]
        -- upvalues: l_ContextActionService_0 (ref)
        l_ContextActionService_0:UnbindAction("moveBackwardAction");
    end);
    v13._connectionUtil:trackBoundFunction("moveLeftAction", function() --[[ Line: 127 ]]
        -- upvalues: l_ContextActionService_0 (ref)
        l_ContextActionService_0:UnbindAction("moveLeftAction");
    end);
    v13._connectionUtil:trackBoundFunction("moveRightAction", function() --[[ Line: 128 ]]
        -- upvalues: l_ContextActionService_0 (ref)
        l_ContextActionService_0:UnbindAction("moveRightAction");
    end);
    v13._connectionUtil:trackBoundFunction("jumpAction", function() --[[ Line: 129 ]]
        -- upvalues: l_ContextActionService_0 (ref)
        l_ContextActionService_0:UnbindAction("jumpAction");
    end);
end;
v5.ConnectFocusEventListeners = function(v34) --[[ Line: 132 ]] --[[ Name: ConnectFocusEventListeners ]]
    -- upvalues: v3 (copy), l_UserInputService_0 (copy)
    local function v35() --[[ Line: 133 ]] --[[ Name: onFocusReleased ]]
        -- upvalues: v34 (copy), v3 (ref)
        v34.moveVector = v3;
        v34.forwardValue = 0;
        v34.backwardValue = 0;
        v34.leftValue = 0;
        v34.rightValue = 0;
        v34.jumpRequested = false;
        v34:UpdateJump();
    end;
    local function v37(_) --[[ Line: 143 ]] --[[ Name: onTextFocusGained ]]
        -- upvalues: v34 (copy)
        v34.jumpRequested = false;
        v34:UpdateJump();
    end;
    v34._connectionUtil:trackConnection("textBoxFocusReleased", l_UserInputService_0.TextBoxFocusReleased:Connect(v35));
    v34._connectionUtil:trackConnection("textBoxFocused", l_UserInputService_0.TextBoxFocused:Connect(v37));
    v34._connectionUtil:trackConnection("windowFocusReleased", l_UserInputService_0.WindowFocused:Connect(v35));
end;
return v5;