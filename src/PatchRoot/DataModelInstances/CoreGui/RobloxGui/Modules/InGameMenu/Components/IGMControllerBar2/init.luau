local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Packages.InGameMenuDependencies);
local l_ControllerBar_0 = v2.UIBlox.App.Bar.ControllerBar;
local l_Parent_0 = script.Parent.Parent;
local l_Roact_0 = v2.Roact;
local l_t_0 = v2.t;
local l_RoactRodux_0 = v2.RoactRodux;
local v8 = require(l_Parent_0.Resources.Constants);
local v9 = require(l_Parent_0.Actions.IncrementControllerBar);
local v10 = require(l_Parent_0.Actions.DecrementControllerBar);
local v11 = l_Roact_0.PureComponent:extend("IGMControllerBar2");
v11.validateProps = l_t_0.strictInterface({
    rightHints = l_t_0.table, 
    leftHint = l_t_0.table, 
    incrementControllerBar = l_t_0.callback, 
    decrementControllerBar = l_t_0.callback
});
v11.init = function(v12) --[[ Line: 24 ]] --[[ Name: init ]]
    v12.props.incrementControllerBar();
end;
v11.willUnmount = function(v13) --[[ Line: 28 ]] --[[ Name: willUnmount ]]
    v13.props.decrementControllerBar();
end;
v11.render = function(v14) --[[ Line: 32 ]] --[[ Name: render ]]
    -- upvalues: l_Roact_0 (copy), l_CoreGui_0 (copy), v8 (copy), l_ControllerBar_0 (copy)
    return l_Roact_0.createElement(l_Roact_0.Portal, {
        target = l_CoreGui_0
    }, {
        IGMControllerBar = l_Roact_0.createElement("ScreenGui", {
            DisplayOrder = v8.DisplayOrder.ControllerBar
        }, {
            ControllerBar = l_Roact_0.createElement(l_ControllerBar_0, {
                rightHints = v14.props.rightHints, 
                leftHint = v14.props.leftHint
            })
        })
    });
end;
return l_RoactRodux_0.UNSTABLE_connect2(nil, function(v15) --[[ Line: 48 ]]
    -- upvalues: v9 (copy), v10 (copy)
    return {
        incrementControllerBar = function() --[[ Line: 50 ]] --[[ Name: incrementControllerBar ]]
            -- upvalues: v15 (copy), v9 (ref)
            v15(v9());
        end, 
        decrementControllerBar = function() --[[ Line: 53 ]] --[[ Name: decrementControllerBar ]]
            -- upvalues: v15 (copy), v10 (ref)
            v15(v10());
        end
    };
end)(v11);