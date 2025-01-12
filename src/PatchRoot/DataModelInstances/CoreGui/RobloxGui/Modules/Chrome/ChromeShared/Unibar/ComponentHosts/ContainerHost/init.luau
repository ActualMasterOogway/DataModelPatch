local l_script_FirstAncestor_0 = script:FindFirstAncestor("ChromeShared");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_script_FirstAncestor_0.Unibar.Constants);
local _ = require(l_script_FirstAncestor_0.Service.Types);
return function(v5) --[[ Line: 18 ]]
    -- upvalues: v2 (copy), v3 (copy)
    return v2.createElement("Frame", {
        Size = UDim2.new(0, v5.containerWidthSlots * v3.ICON_CELL_WIDTH, 1, 0), 
        LayoutOrder = v5.integration.order, 
        BackgroundTransparency = 1, 
        Position = v5.position, 
        Visible = v5.visible, 
        ZIndex = v5.integration.order
    }, {
        Padding = v2.createElement("UIPadding", {
            PaddingTop = v3.CONTAINER_PADDING_TOP_BOTTOM, 
            PaddingRight = v3.CONTAINER_PADDING_LEFT_RIGHT, 
            PaddingBottom = v3.CONTAINER_PADDING_TOP_BOTTOM, 
            PaddingLeft = v3.CONTAINER_PADDING_LEFT_RIGHT
        }), 
        IntegrationContainer = if v5.integration.integration and v5.integration.integration.components.Container then v5.integration.integration.components.Container(v5.integration) else nil
    });
end;