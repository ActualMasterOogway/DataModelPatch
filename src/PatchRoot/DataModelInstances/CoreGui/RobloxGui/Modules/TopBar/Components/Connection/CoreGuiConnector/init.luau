local l_CorePackages_0 = game:GetService("CorePackages");
local l_StarterGui_0 = game:GetService("StarterGui");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.t);
local l_Parent_0 = script.Parent.Parent.Parent;
local v6 = require(l_Parent_0.Actions.UpdateCoreGuiEnabled);
local v7 = require(l_Parent_0.Parent.Common.EventConnection);
local v8 = v2.PureComponent:extend("CoreGuiConnector");
v8.validateProps = v4.strictInterface({
    updateCoreGuiEnabled = v4.callback
});
v8.didMount = function(v9) --[[ Line: 22 ]] --[[ Name: didMount ]]
    -- upvalues: l_StarterGui_0 (copy)
    local l_EnumItems_0 = Enum.CoreGuiType:GetEnumItems();
    for _, v12 in ipairs(l_EnumItems_0) do
        if v12 ~= Enum.CoreGuiType.All then
            v9.props.updateCoreGuiEnabled(v12, l_StarterGui_0:GetCoreGuiEnabled(v12));
        end;
    end;
end;
v8.render = function(v13) --[[ Line: 31 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v7 (copy), l_StarterGui_0 (copy)
    return v2.createFragment({
        CoreGuiChangedConnection = v2.createElement(v7, {
            event = l_StarterGui_0.CoreGuiChangedSignal, 
            callback = function(v14, v15) --[[ Line: 35 ]] --[[ Name: callback ]]
                -- upvalues: v13 (copy)
                v13.props.updateCoreGuiEnabled(v14, v15);
            end
        })
    });
end;
return v3.UNSTABLE_connect2(nil, function(v16) --[[ Line: 42 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v6 (copy)
    return {
        updateCoreGuiEnabled = function(v17, v18) --[[ Line: 44 ]] --[[ Name: updateCoreGuiEnabled ]]
            -- upvalues: v16 (copy), v6 (ref)
            return v16(v6(v17, v18));
        end
    };
end)(v8);