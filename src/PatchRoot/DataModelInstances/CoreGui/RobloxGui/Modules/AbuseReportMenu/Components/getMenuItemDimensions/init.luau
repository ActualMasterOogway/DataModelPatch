local l_script_FirstAncestor_0 = script:FindFirstAncestor("AbuseReportMenu");
local l_GuiService_0 = game:GetService("GuiService");
local v2 = require(l_script_FirstAncestor_0.Components.Constants);
getMenuItemDimensions = function(v3) --[[ Line: 5 ]] --[[ Name: getMenuItemDimensions ]]
    -- upvalues: v2 (copy), l_GuiService_0 (copy)
    if v3 < v2.SmallLayoutThreshold then
        return {
            LeftWidth = v2.LeftContainerWidthSmall, 
            RightWidth = v2.RightContainerWidthSmall, 
            TextSize = v2.FieldLabelSizeSmall
        };
    elseif l_GuiService_0:IsTenFootInterface() then
        return {
            LeftWidth = v2.LeftContainerWidthConsole, 
            RightWidth = v2.RightContainerWidthConsole, 
            TextSize = v2.FieldLabelSizeConsole
        };
    else
        return {
            LeftWidth = v2.LeftContainerWidth, 
            RightWidth = v2.RightContainerWidth, 
            TextSize = v2.FieldLabelSize
        };
    end;
end;
return getMenuItemDimensions;