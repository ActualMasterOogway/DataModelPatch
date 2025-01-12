local l_script_FirstAncestor_0 = script:FindFirstAncestor("AbuseReportMenu");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.UIBlox);
local v3 = require(l_CorePackages_0.Packages.React);
local l_AppFonts_0 = require(l_CorePackages_0.Workspace.Packages.Style).AppFonts;
local l_DropdownMenu_0 = v2.App.Menu.DropdownMenu;
local v6 = require(l_script_FirstAncestor_0.Components.MenuItems.ReportMenuItem);
local l_useStyle_0 = v2.Core.Style.useStyle;
local v8 = require(l_script_FirstAncestor_0.Utility.getMenuItemSizings);
local v9 = require(l_CorePackages_0.Packages.Cryo);
return function(v10) --[[ Line: 27 ]] --[[ Name: DropdownReportMenuItem ]]
    -- upvalues: l_useStyle_0 (copy), v8 (copy), v3 (copy), l_AppFonts_0 (copy), l_DropdownMenu_0 (copy), v9 (copy), v6 (copy)
    local l_Theme_0 = l_useStyle_0().Theme;
    local v12 = v8();
    local v14 = if v10.readonlyValue ~= nil then v3.createElement("TextLabel", {
        Text = v10.readonlyValue, 
        Font = l_AppFonts_0.default:getMedium(), 
        TextColor3 = l_Theme_0.TextEmphasis.Color, 
        TextTransparency = l_Theme_0.TextMuted.Transparency, 
        TextSize = v12.DropdownTextSize, 
        TextWrapped = true, 
        TextXAlignment = if v10.isSmallPortraitViewport then Enum.TextXAlignment.Left else Enum.TextXAlignment.Center, 
        AutomaticSize = Enum.AutomaticSize.Y, 
        Size = UDim2.new(1, 0, 0, v10.minHeight), 
        BackgroundTransparency = 1
    }) else v3.createElement(l_DropdownMenu_0, {
        placeholder = v10.placeholderText, 
        onChange = v10.onSelect, 
        height = UDim.new(0, 48), 
        screenSize = Vector2.new(2400, 1800), 
        errorState = false, 
        showDropShadow = true, 
        fixedListHeight = 180, 
        cellDatas = v9.List.map(v10.selections, function(v13) --[[ Line: 56 ]]
            return {
                text = v13
            };
        end)
    });
    return v3.createElement(v6, {
        label = v10.label, 
        layoutOrder = v10.layoutOrder, 
        rightComponent = v14, 
        menuContainerWidth = v10.menuContainerWidth, 
        isSmallPortraitViewport = v10.isSmallPortraitViewport
    });
end;