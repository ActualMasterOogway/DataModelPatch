local l_Parent_0 = script:FindFirstAncestor("ProfileQRCode").Parent;
local v1 = require(l_Parent_0.React);
local l_ShimmerPanel_0 = require(l_Parent_0.UIBlox).App.Loading.ShimmerPanel;
return function() --[[ Line: 10 ]]
    -- upvalues: v1 (copy), l_ShimmerPanel_0 (copy)
    return v1.createElement(l_ShimmerPanel_0, {
        Size = UDim2.new(1, 0, 1, 0), 
        cornerRadius = UDim.new(0.05, 0)
    });
end;