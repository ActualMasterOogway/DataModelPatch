local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserInputService_0 = game:GetService("UserInputService");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local l_Parent_0 = script.Parent.Parent.Parent;
local v5 = require(l_Parent_0.Actions.ClosePlayerDropDown);
local v6 = require(l_Parent_0.Actions.SetIsUsingGamepad);
local v7 = require(script.Parent.EventConnection);
local v8 = v2.PureComponent:extend("UserInputServiceConnector");
v8.render = function(v9) --[[ Line: 17 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v7 (copy), l_UserInputService_0 (copy)
    return v2.createFragment({
        InputBeganConnection = v2.createElement(v7, {
            event = l_UserInputService_0.InputBegan, 
            callback = function(v10, v11) --[[ Line: 21 ]] --[[ Name: callback ]]
                -- upvalues: v9 (copy)
                if v11 then
                    return;
                else
                    local l_UserInputType_0 = v10.UserInputType;
                    if l_UserInputType_0 == Enum.UserInputType.Touch or l_UserInputType_0 == Enum.UserInputType.MouseButton1 then
                        v9.props.closePlayerDropDown();
                    end;
                    return;
                end;
            end
        }), 
        LastInputTypeChangedConnection = v2.createElement(v7, {
            event = l_UserInputService_0.LastInputTypeChanged, 
            callback = function(v13) --[[ Line: 34 ]] --[[ Name: callback ]]
                -- upvalues: v9 (copy)
                local v14 = v13.Name:find("Gamepad");
                v9.props.setIsUsingGamepad(v14 ~= nil);
            end
        })
    });
end;
return v3.connect(nil, function(v15) --[[ Line: 42 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v5 (copy), v6 (copy)
    return {
        closePlayerDropDown = function() --[[ Line: 44 ]] --[[ Name: closePlayerDropDown ]]
            -- upvalues: v15 (copy), v5 (ref)
            return v15(v5());
        end, 
        setIsUsingGamepad = function(v16) --[[ Line: 48 ]] --[[ Name: setIsUsingGamepad ]]
            -- upvalues: v15 (copy), v6 (ref)
            return v15(v6(v16));
        end
    };
end)(v8);