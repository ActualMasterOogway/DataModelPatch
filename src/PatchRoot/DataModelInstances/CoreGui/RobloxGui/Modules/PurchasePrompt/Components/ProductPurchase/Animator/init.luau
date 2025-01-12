local _ = script.Parent.Parent.Parent;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Workspace.Packages.PurchasePromptDeps);
local l_Roact_0 = v2.Roact;
local l_Otter_0 = v2.Otter;
local l_t_0 = v2.t;
local v6 = l_Roact_0.Component:extend(script.Name);
local v7 = {
    dampingRatio = 1, 
    frequency = 1.6
};
v6.validateProps = l_t_0.interface({
    shouldShow = l_t_0.boolean, 
    onShown = l_t_0.optional(l_t_0.callback), 
    onHidden = l_t_0.optional(l_t_0.callback)
});
v6.init = function(v8) --[[ Line: 23 ]] --[[ Name: init ]]
    -- upvalues: l_Roact_0 (copy), l_Otter_0 (copy), v7 (copy)
    local v9, v10 = l_Roact_0.createBinding(1);
    v8.motor = l_Otter_0.createSingleMotor(1);
    v8.motor:start();
    v8.motor:onStep(v10);
    v8.animationProgress = v9;
    v8.motor:onComplete(function() --[[ Line: 32 ]]
        -- upvalues: v8 (copy)
        if v8.props.shouldShow then
            if v8.props.onShown then
                v8.props.onShown();
                return;
            end;
        elseif v8.props.onHidden then
            v8.props.onHidden();
        end;
    end);
    v8.motor:setGoal(l_Otter_0.spring(v8.props.shouldShow and 0 or 1, v7));
end;
v6.didUpdate = function(v11, v12, _) --[[ Line: 47 ]] --[[ Name: didUpdate ]]
    -- upvalues: l_Otter_0 (copy), v7 (copy)
    if v12.shouldShow ~= v11.props.shouldShow then
        v11.motor:setGoal(l_Otter_0.spring(v11.props.shouldShow and 0 or 1, v7));
    end;
end;
v6.render = function(v14) --[[ Line: 53 ]] --[[ Name: render ]]
    -- upvalues: l_Roact_0 (copy)
    return l_Roact_0.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BorderSizePixel = 0, 
        BackgroundTransparency = 1, 
        Position = v14.animationProgress:map(function(v15) --[[ Line: 58 ]]
            return UDim2.new(0, 0, -1 * v15, 0);
        end)
    }, v14.props[l_Roact_0.Children]);
end;
return v6;