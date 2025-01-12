local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Roact);
local v2 = require(l_Parent_0.UIBlox);
local l_Images_0 = v2.App.ImageSet.Images;
local l_ImageSetLabel_0 = v2.Core.ImageSet.ImageSetLabel;
local l_Interactable_0 = v2.Core.Control.Interactable;
local v6 = require(l_Parent_0.RobloxTranslator);
local v7 = v6:FormatByKey("CoreScripts.Ads.Label.WhyThisAd");
local v8 = v6:FormatByKey("CoreScripts.Ads.Label.ReportAd");
local v9 = l_Images_0["icons/actions/info"];
local v10 = l_Images_0["icons/actions/feedback"];
local function v12(v11) --[[ Line: 23 ]] --[[ Name: WhyThisAdRow ]]
    -- upvalues: v1 (copy), l_Interactable_0 (copy), l_ImageSetLabel_0 (copy), v9 (copy), v7 (copy)
    return v1.createElement(l_Interactable_0, {
        AutomaticSize = Enum.AutomaticSize.XY, 
        BackgroundTransparency = 1, 
        [v1.Event.Activated] = v11.onWhyThisAdActivated
    }, {
        UICorner = v1.createElement("UICorner", {
            CornerRadius = UDim.new(0, 10)
        }), 
        UIPadding = v1.createElement("UIPadding", {
            PaddingTop = UDim.new(0, 16), 
            PaddingBottom = UDim.new(0, 8), 
            PaddingLeft = UDim.new(0, 16), 
            PaddingRight = UDim.new(0, 48)
        }), 
        UIListLayout = v1.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            Padding = UDim.new(0, 16)
        }), 
        Icon = v1.createElement(l_ImageSetLabel_0, {
            Image = v9, 
            Size = UDim2.fromOffset(24, 24), 
            BackgroundTransparency = 1
        }), 
        TextLabel = v1.createElement("TextLabel", {
            Text = v7, 
            TextColor3 = Color3.new(1, 1, 1), 
            BackgroundTransparency = 1, 
            Font = Enum.Font.GothamMedium, 
            TextSize = 24, 
            TextScaled = false, 
            TextWrapped = true, 
            AutomaticSize = Enum.AutomaticSize.XY
        })
    });
end;
local function v14(v13) --[[ Line: 62 ]] --[[ Name: ReportAdRow ]]
    -- upvalues: v1 (copy), l_Interactable_0 (copy), l_ImageSetLabel_0 (copy), v10 (copy), v8 (copy)
    return v1.createElement(l_Interactable_0, {
        AutomaticSize = Enum.AutomaticSize.XY, 
        BackgroundTransparency = 1, 
        [v1.Event.Activated] = v13.onReportAdActivated
    }, {
        UICorner = v1.createElement("UICorner", {
            CornerRadius = UDim.new(0, 10)
        }), 
        UIPadding = v1.createElement("UIPadding", {
            PaddingTop = UDim.new(0, 8), 
            PaddingBottom = UDim.new(0, 16), 
            PaddingLeft = UDim.new(0, 16), 
            PaddingRight = UDim.new(0, 48)
        }), 
        UIListLayout = v1.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            Padding = UDim.new(0, 16)
        }), 
        Icon = v1.createElement(l_ImageSetLabel_0, {
            Image = v10, 
            Size = UDim2.fromOffset(24, 24), 
            BackgroundTransparency = 1
        }), 
        TextLabel = v1.createElement("TextLabel", {
            Text = v8, 
            TextColor3 = Color3.new(1, 1, 1), 
            BackgroundTransparency = 1, 
            Font = Enum.Font.GothamMedium, 
            TextSize = 24, 
            TextScaled = false, 
            TextWrapped = true, 
            AutomaticSize = Enum.AutomaticSize.XY
        })
    });
end;
AdDropdownMenu = function(v15) --[[ Line: 101 ]] --[[ Name: AdDropdownMenu ]]
    -- upvalues: v1 (copy), v12 (copy), v14 (copy)
    return v1.createElement("Frame", {
        Visible = v15.showDropDownMenu, 
        Position = UDim2.new(0.5, 0, 0.5, 0), 
        BackgroundColor3 = Color3.new(0, 0, 0), 
        BackgroundTransparency = v15.transparency, 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Size = UDim2.new(0.24, 0, 0.12, 0), 
        AutomaticSize = Enum.AutomaticSize.XY
    }, {
        UICorner = v1.createElement("UICorner", {
            CornerRadius = UDim.new(0, 10)
        }), 
        UIListLayout = v1.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Center
        }); 
        v12(v15), 
        v14(v15)
    });
end;
return AdDropdownMenu;