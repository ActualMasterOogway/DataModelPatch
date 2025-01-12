local _ = script.Parent.Parent.Parent;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Roact_0 = require(l_CorePackages_0.Workspace.Packages.PurchasePromptDeps).Roact;
local v3 = l_Roact_0.Component:extend("ExternalEventConnection");
v3.init = function(v4) --[[ Line: 13 ]] --[[ Name: init ]]
    v4.connection = nil;
end;
v3.render = function(v5) --[[ Line: 30 ]] --[[ Name: render ]]
    -- upvalues: l_Roact_0 (copy)
    return l_Roact_0.oneChild(v5.props[l_Roact_0.Children]);
end;
v3.didMount = function(v6) --[[ Line: 34 ]] --[[ Name: didMount ]]
    v6.connection = v6.props.event:Connect(v6.props.callback);
end;
v3.didUpdate = function(v7, v8) --[[ Line: 41 ]] --[[ Name: didUpdate ]]
    if v7.props.event ~= v8.event or v7.props.callback ~= v8.callback then
        v7.connection:Disconnect();
        v7.connection = v7.props.event:Connect(v7.props.callback);
    end;
end;
v3.willUnmount = function(v9) --[[ Line: 49 ]] --[[ Name: willUnmount ]]
    if v9.connection then
        v9.connection:Disconnect();
        v9.connection = nil;
    end;
end;
return v3;