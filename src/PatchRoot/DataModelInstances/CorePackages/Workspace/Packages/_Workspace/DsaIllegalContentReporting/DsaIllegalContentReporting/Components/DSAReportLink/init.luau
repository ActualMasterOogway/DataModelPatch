local l_script_FirstAncestor_0 = script:FindFirstAncestor("DsaIllegalContentReporting");
local l_HttpService_0 = game:GetService("HttpService");
local l_GuiService_0 = game:GetService("GuiService");
local v3 = require(l_script_FirstAncestor_0.Utility.Constants);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v5 = require(l_Parent_0.UIBlox);
local v6 = require(l_Parent_0.React);
local l_StyleProviderWithDefaultTheme_0 = require(l_Parent_0.Style).StyleProviderWithDefaultTheme;
local l_StyledTextLabel_0 = v5.App.Text.StyledTextLabel;
local l_LinkButton_0 = v5.App.Button.LinkButton;
local l_useStyle_0 = v5.Core.Style.useStyle;
local v11 = {
    OPEN_CUSTOM_WEBVIEW = 20
};
local l_GetFFlagDSAReadOnlyLinkForConsole_0 = require(l_Parent_0.SharedFlags).GetFFlagDSAReadOnlyLinkForConsole;
DSAReportLink = function() --[[ Line: 23 ]] --[[ Name: DSAReportLink ]]
    -- upvalues: l_useStyle_0 (copy), l_GuiService_0 (copy), l_GetFFlagDSAReadOnlyLinkForConsole_0 (copy), v6 (copy), l_StyledTextLabel_0 (copy), v3 (copy), l_LinkButton_0 (copy), l_HttpService_0 (copy), v11 (copy)
    local v13 = l_useStyle_0();
    local v14 = l_GuiService_0:IsTenFootInterface();
    local v16 = if l_GetFFlagDSAReadOnlyLinkForConsole_0() and v14 then v6.createElement(l_StyledTextLabel_0, {
        layoutOrder = 2, 
        size = UDim2.new(0, 500, 0, 60), 
        lineHeight = 1, 
        text = v3.READONLY_LINK_TEXT, 
        textXAlignment = Enum.TextXAlignment.Center, 
        textYAlignment = Enum.TextYAlignment.Center, 
        fontStyle = v13.Font.Body, 
        colorStyle = v13.Theme.TextEmphasis, 
        fluidSizing = true, 
        richText = false
    }) else v6.createElement(l_LinkButton_0, {
        fontStyle = v14 and "CaptionBody" or "Footer", 
        size = UDim2.new(0, 100, 0, 20), 
        text = v3.REPORT_LINK_TEXT, 
        layoutOrder = 2, 
        onActivated = function() --[[ Line: 47 ]] --[[ Name: onActivated ]]
            -- upvalues: l_HttpService_0 (ref), v3 (ref), l_GuiService_0 (ref), v11 (ref)
            local v15 = l_HttpService_0:JSONEncode({
                title = v3.HELP_PAGE_TITLE, 
                presentationStyle = nil, 
                visible = true, 
                url = v3.DSA_REPORT_LINK
            });
            l_GuiService_0:BroadcastNotification(v15, v11.OPEN_CUSTOM_WEBVIEW);
        end
    });
    return v6.createElement("Frame", {
        Size = UDim2.fromScale(1, 1), 
        BackgroundTransparency = 1
    }, {
        Layout = v6.createElement("UIListLayout", {
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        Padding = v6.createElement("UIPadding", {
            PaddingTop = UDim.new(0, 16)
        }), 
        Divider = v6.createElement("Frame", {
            BackgroundColor3 = v13.Theme.Divider.Color, 
            BackgroundTransparency = v13.Theme.Divider.Transparency, 
            BorderSizePixel = 0, 
            Size = UDim2.new(1, 0, 0, 1), 
            Position = UDim2.new(0, 0, 1, 0), 
            AnchorPoint = Vector2.new(0, 1), 
            LayoutOrder = 0
        }), 
        Link = v16
    });
end;
WrapperContainer = function() --[[ Line: 83 ]] --[[ Name: WrapperContainer ]]
    -- upvalues: v6 (copy), l_StyleProviderWithDefaultTheme_0 (copy)
    return v6.createElement(l_StyleProviderWithDefaultTheme_0, {
        withDarkTheme = true
    }, {
        Button = v6.createElement(DSAReportLink)
    });
end;
return WrapperContainer;