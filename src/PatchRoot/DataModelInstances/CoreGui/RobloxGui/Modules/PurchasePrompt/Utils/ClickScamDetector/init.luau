local _ = script.Parent.Parent;
local l_UserInputService_0 = game:GetService("UserInputService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Cryo_0 = require(l_CorePackages_0.Workspace.Packages.PurchasePromptDeps).Cryo;
local v4 = {};
v4.__index = v4;
v4.new = function(v5) --[[ Line: 25 ]] --[[ Name: new ]]
    -- upvalues: l_Cryo_0 (copy), v4 (copy), l_UserInputService_0 (copy)
    v5 = l_Cryo_0.Dictionary.join({
        clickSpeedThreshold = 3, 
        clickTimeWindow = 1, 
        initialDelay = 1, 
        buttonInput = nil
    }, v5 or {});
    local v6 = {
        _inputConnection = nil, 
        _clickCount = 0, 
        _startTime = tick(), 
        _options = v5
    };
    setmetatable(v6, v4);
    v6._inputConnection = l_UserInputService_0.InputBegan:Connect(function(v7) --[[ Line: 50 ]]
        -- upvalues: v6 (copy)
        v6:_onInput(v7);
    end);
    return v6;
end;
v4._onInput = function(v8, v9) --[[ Line: 63 ]] --[[ Name: _onInput ]]
    local l_UserInputType_0 = v9.UserInputType;
    local v11 = false;
    if v8._options.buttonInput ~= nil then
        v11 = v9.KeyCode == v8._options.buttonInput;
    end;
    local v12 = true;
    if l_UserInputType_0 ~= Enum.UserInputType.MouseButton1 then
        v12 = l_UserInputType_0 == Enum.UserInputType.Touch;
    end;
    if v11 or v12 then
        v8._clickCount = v8._clickCount + 1;
        delay(v8._options.clickTimeWindow, function() --[[ Line: 73 ]]
            -- upvalues: v8 (copy)
            v8._clickCount = v8._clickCount - 1;
        end);
    end;
end;
v4.isClickValid = function(v13) --[[ Line: 83 ]] --[[ Name: isClickValid ]]
    -- upvalues: l_UserInputService_0 (copy)
    if l_UserInputService_0.MouseBehavior == Enum.MouseBehavior.LockCurrentPosition then
        return false;
    elseif tick() - v13._startTime < v13._options.initialDelay then
        return false;
    else
        return v13._clickCount / v13._options.clickTimeWindow < v13._options.clickSpeedThreshold;
    end;
end;
v4.destroy = function(v14) --[[ Line: 105 ]] --[[ Name: destroy ]]
    v14._inputConnection:Disconnect();
end;
return v4;