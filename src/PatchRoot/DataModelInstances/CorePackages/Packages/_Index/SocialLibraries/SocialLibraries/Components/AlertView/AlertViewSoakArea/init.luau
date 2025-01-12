local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialLibraries");
local l_Roact_0 = require(l_script_FirstAncestor_0.dependencies).Roact;
local v2 = l_Roact_0.PureComponent:extend("AlertViewSoakArea");
v2.defaultProps = {
    Visible = true, 
    BackgroundTransparency = 0.75, 
    BackgroundColor3 = Color3.fromRGB(255, 0, 255)
};
v2.render = function(v3) --[[ Line: 12 ]] --[[ Name: render ]]
    -- upvalues: l_Roact_0 (copy)
    return l_Roact_0.createElement("ImageButton", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = v3.props.BackgroundTransparency, 
        BackgroundColor3 = v3.props.BackgroundColor3, 
        Active = true, 
        AutoButtonColor = false, 
        Visible = v3.props.Visible
    }, v3.props[l_Roact_0.Children]);
end;
return v2;