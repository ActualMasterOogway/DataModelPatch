local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.t);
local v5 = require(l_CorePackages_0.Packages.Otter);
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v7 = require(l_RobloxGui_0.Modules.Common.PolicyService);
local l_Parent_0 = script.Parent.Parent.Parent;
local v9 = require(l_Parent_0.Constants);
local v10 = {
    frequency = 0.75, 
    dampingRatio = 1
};
local v11 = Color3.fromRGB(187, 0, 4);
local v12 = Color3.new(1, 1, 1);
local v13 = v2.PureComponent:extend("HurtOverlay");
v13.validateProps = v4.strictInterface({
    healthEnabled = v4.boolean, 
    health = v4.number, 
    maxHealth = v4.number, 
    isDead = v4.boolean
});
v13.init = function(v14) --[[ Line: 33 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy), v5 (copy)
    v14.state = {
        isAnimating = false
    };
    local v15, v16 = v2.createBinding(0);
    v14.animationBinding = v15;
    v14.animationBindingUpdate = v16;
    v14.positionBinding = v14.animationBinding:map(function(v17) --[[ Line: 40 ]]
        return UDim2.new(-10 * v17, 0, -10 * v17, 0);
    end);
    v14.sizeBinding = v14.animationBinding:map(function(v18) --[[ Line: 43 ]]
        return UDim2.new(1 + 19 * v18, 0, 1 + 19 * v18, 0);
    end);
    v14.motor = v5.createSingleMotor(0);
    v14.motor:onStep(function(v19) --[[ Line: 48 ]]
        -- upvalues: v14 (copy)
        v14.animationBindingUpdate(v19);
    end);
    v14.motor:onComplete(function() --[[ Line: 51 ]]
        -- upvalues: v14 (copy)
        v14:setState({
            isAnimating = false
        });
    end);
end;
v13.render = function(v20) --[[ Line: 58 ]] --[[ Name: render ]]
    -- upvalues: v11 (copy), v7 (copy), v12 (copy), v2 (copy)
    local v21 = v20.props.healthEnabled and v20.state.isAnimating;
    local l_v11_0 = v11;
    if v7:IsSubjectToChinaPolicies() then
        l_v11_0 = v12;
    end;
    return v2.createElement("ImageLabel", {
        Visible = v21, 
        BackgroundTransparency = 1, 
        Image = "rbxasset://textures/ui/TopBar/WhiteOverlayAsset.png", 
        ImageColor3 = l_v11_0, 
        Size = v20.sizeBinding, 
        Position = v20.positionBinding
    });
end;
v13.didUpdate = function(v23, v24, _) --[[ Line: 77 ]] --[[ Name: didUpdate ]]
    -- upvalues: v9 (copy), v5 (copy), v10 (copy)
    if v23.props.health < v24.health and (not v23.props.isDead or not v24.isDead) and (v24.health - v23.props.health) / v23.props.maxHealth >= v9.HealthPercentForOverlay then
        v23.motor:setGoal(v5.instant(0));
        v23.motor:step(0);
        v23.motor:setGoal(v5.spring(1, v10));
        v23.motor:start();
        v23:setState({
            isAnimating = true
        });
    end;
end;
return v3.UNSTABLE_connect2(function(v26) --[[ Line: 94 ]] --[[ Name: mapStateToProps ]]
    return {
        health = v26.health.currentHealth, 
        maxHealth = v26.health.maxHealth, 
        isDead = v26.health.isDead, 
        healthEnabled = v26.coreGuiEnabled[Enum.CoreGuiType.Health]
    };
end, nil)(v13);