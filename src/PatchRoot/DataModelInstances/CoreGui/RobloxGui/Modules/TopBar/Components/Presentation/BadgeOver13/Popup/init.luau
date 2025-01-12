local l_TextService_0 = game:GetService("TextService");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local l_createElement_0 = v2.createElement;
local v4 = require(l_CorePackages_0.Packages.UIBlox);
local l_useStyle_0 = v4.Core.Style.useStyle;
local l_LinkButton_0 = v4.App.Button.LinkButton;
local _ = v4.Core.Control.Interactable;
local l_ControlState_0 = v4.Core.Control.Enum.ControlState;
local _ = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local l_List_0 = require(l_CorePackages_0.Packages.Cryo).List;
local v11 = require(script.Parent.useAnalytics);
local v12 = Vector2.new(8, 8);
local function v16(v13) --[[ Line: 19 ]] --[[ Name: Paragraph ]]
    -- upvalues: l_TextService_0 (copy), v12 (copy), l_createElement_0 (copy)
    local l_text_0 = v13.text;
    local l_l_TextService_0_TextSize_0 = l_TextService_0:GetTextSize(l_text_0, v13.textSize, v13.font, Vector2.new(300 - v12.X * 2, 1e999));
    return l_createElement_0("TextLabel", {
        AutomaticSize = Enum.AutomaticSize.X, 
        Size = UDim2.fromOffset(0, l_l_TextService_0_TextSize_0.Y), 
        BackgroundTransparency = 1, 
        Text = l_text_0, 
        TextWrapped = true, 
        TextXAlignment = Enum.TextXAlignment.Left, 
        TextYAlignment = Enum.TextYAlignment.Top, 
        Font = v13.font, 
        TextSize = v13.textSize, 
        TextColor3 = v13.textColor3, 
        TextTransparency = v13.textTransparency, 
        LayoutOrder = v13.layoutOrder
    });
end;
return function(v17) --[[ Line: 51 ]]
    -- upvalues: l_useStyle_0 (copy), v11 (copy), v2 (copy), l_createElement_0 (copy), v12 (copy), l_List_0 (copy), v16 (copy), l_LinkButton_0 (copy), l_ControlState_0 (copy)
    local v18 = l_useStyle_0();
    local l_Footer_0 = v18.Font.Footer;
    local l_bodyText_0 = v17.bodyText;
    local v21 = v11();
    v2.useEffect(function() --[[ Line: 57 ]]
        -- upvalues: v17 (copy), v21 (copy)
        if v17.visible then
            v21.fireEvent("popupImpression", {
                copyType = v17.analyticsCopyType
            });
        end;
    end, {
        v17.visible
    });
    return l_createElement_0("Frame", {
        Visible = v17.visible, 
        LayoutOrder = v17.layoutOrder, 
        Size = UDim2.fromOffset(300, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundColor3 = v18.Theme.BackgroundUIContrast.Color, 
        BackgroundTransparency = v18.Theme.BackgroundUIContrast.Transparency
    }, {
        layout = l_createElement_0("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 12)
        }), 
        padding = l_createElement_0("UIPadding", {
            PaddingTop = UDim.new(0, v12.Y), 
            PaddingBottom = UDim.new(0, v12.Y), 
            PaddingLeft = UDim.new(0, v12.X), 
            PaddingRight = UDim.new(0, v12.X)
        }), 
        shape = l_createElement_0("UICorner", {
            CornerRadius = UDim.new(0, 8)
        }), 
        body = l_createElement_0(v2.Fragment, nil, l_List_0.map(l_bodyText_0, function(v22, v23) --[[ Line: 90 ]]
            -- upvalues: l_createElement_0 (ref), v16 (ref), l_Footer_0 (copy), v18 (copy)
            return l_createElement_0(v16, {
                layoutOrder = v23, 
                text = v22, 
                font = l_Footer_0.Font, 
                textSize = v18.Font.BaseSize * l_Footer_0.RelativeSize, 
                textColor3 = v18.Theme.TextEmphasis.Color, 
                textTransparency = v18.Theme.TextEmphasis.Transparency
            });
        end)), 
        link = l_createElement_0(l_LinkButton_0, {
            text = v17.linkText, 
            fontStyle = "Footer", 
            layoutOrder = 100, 
            minPaddingX = 0, 
            minPaddingY = 8, 
            underlineAlwaysEnabled = true, 
            onActivated = v2.useCallback(function() --[[ Line: 108 ]]
                -- upvalues: v21 (copy), v17 (copy)
                v21.fireEvent("formInteraction", {
                    aType = "click", 
                    input = "learn_more"
                });
                v17.openWebview();
            end), 
            onStateChanged = v2.useCallback(function(_, v25) --[[ Line: 115 ]]
                -- upvalues: l_ControlState_0 (ref), v21 (copy)
                if v25 == l_ControlState_0.Hover then
                    v21.fireEvent("formInteraction", {
                        aType = "hover", 
                        input = "learn_more"
                    });
                end;
            end)
        })
    });
end;