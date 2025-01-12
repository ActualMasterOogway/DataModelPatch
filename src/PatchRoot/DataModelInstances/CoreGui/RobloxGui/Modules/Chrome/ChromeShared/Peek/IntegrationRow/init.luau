local l_script_FirstAncestor_0 = script:FindFirstAncestor("ChromeShared");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.UIBlox);
local v4 = require(l_script_FirstAncestor_0.Unibar.ComponentHosts.ContainerHost);
local v5 = require(l_script_FirstAncestor_0.Unibar.ComponentHosts.IconHost);
local _ = require(l_script_FirstAncestor_0.Service.Types);
local l_useStyle_0 = v3.Core.Style.useStyle;
return function(v8) --[[ Line: 18 ]] --[[ Name: IntegrationRow ]]
    -- upvalues: l_useStyle_0 (copy), v2 (copy), v4 (copy), v5 (copy)
    local v9 = l_useStyle_0();
    local v10 = {};
    for _, v12 in v8.integrations do
        local l_integration_0 = v12.integration;
        if l_integration_0.components.Container then
            local v14 = if l_integration_0.containerWidthSlots then l_integration_0.containerWidthSlots:get() else 0;
            v10[l_integration_0.id] = v2.createElement(v4, {
                visible = true, 
                integration = v12, 
                containerWidthSlots = v14
            });
        else
            v10[l_integration_0.id] = v2.createElement(v5, {
                visible = true, 
                integration = v12
            });
        end;
    end;
    return v2.createElement("Frame", {
        AutomaticSize = Enum.AutomaticSize.XY, 
        BackgroundTransparency = 1
    }, {
        Layout = v2.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            Padding = UDim.new(0, v9.Tokens.Global.Space_25)
        })
    }, v10);
end;