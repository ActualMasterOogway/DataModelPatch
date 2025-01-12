local l_script_FirstAncestor_0 = script:FindFirstAncestor("AbuseReportMenu");
local l_GuiService_0 = game:GetService("GuiService");
local v2 = require(l_script_FirstAncestor_0.Components.Constants);
getMenuItemSizings = function() --[[ Line: 6 ]] --[[ Name: getMenuItemSizings ]]
    -- upvalues: l_GuiService_0 (copy), v2 (copy)
    if l_GuiService_0:IsTenFootInterface() then
        return {
            ItemPadding = v2.ReportMenuItemPaddingConsole, 
            TopPadding = v2.ReportMenuTopPaddingConsole, 
            TextOffset = v2.ReportMenuTextOffsetConsole, 
            DropdownTextSize = v2.ReportMenuDropdownTextSizeConsole, 
            FontStyle = v2.ReportMenuFontStyleConsole, 
            TextEntryRelativeSize = v2.ReportTextEntryFontRelativeSizeConsole, 
            ButtonSize = v2.ReportMenuButtonSizeConsole
        };
    else
        return {
            ItemPadding = v2.ReportMenuItemPadding, 
            TopPadding = v2.ReportMenuTopPadding, 
            TextOffset = v2.ReportMenuTextOffset, 
            DropdownTextSize = v2.ReportMenuDropdownTextSize, 
            FontStyle = v2.ReportMenuFontStyle, 
            TextEntryRelativeSize = v2.ReportTextEntryFontRelativeSize, 
            ButtonSize = v2.ReportMenuButtonSize
        };
    end;
end;
return getMenuItemSizings;