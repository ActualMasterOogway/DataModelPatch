local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Roact);
local l_Interactable_0 = require(l_Parent_0.UIBlox).Core.Control.Interactable;
local l_LinkingProtocol_0 = require(l_Parent_0.LinkingProtocol).LinkingProtocol;
local v4 = require(l_Parent_0.RobloxTranslator):FormatByKey("CoreScripts.Ads.Label.IllegalContentReportingLink");
local v5 = require(script.Parent.Flags).GetEnableUpdateAssetUrlInReportingForm() and "https://create.roblox.com/store/asset/" or "rbxassetid://";
ReportAdFooter = function(v6) --[[ Line: 23 ]] --[[ Name: ReportAdFooter ]]
    -- upvalues: l_LinkingProtocol_0 (copy), v5 (copy), v1 (copy), l_Interactable_0 (copy), v4 (copy)
    local l_default_0 = l_LinkingProtocol_0.default;
    local v8 = "https://www.roblox.com/illegal-content-reporting?contentURL=" .. v5 .. v6.assetId;
    return v1.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 48), 
        BackgroundTransparency = 1
    }, {
        UIListLayout = v1.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        UIPadding = v1.createElement("UIPadding", {
            PaddingTop = UDim.new(0, 16)
        }), 
        Border = v1.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 1), 
            BackgroundColor3 = Color3.fromRGB(255, 255, 255), 
            BackgroundTransparency = 0.8, 
            LayoutOrder = 1
        }), 
        InteractableText = v1.createElement(l_Interactable_0, {
            AutomaticSize = Enum.AutomaticSize.XY, 
            BackgroundTransparency = 1, 
            LayoutOrder = 2, 
            [v1.Event.Activated] = function() --[[ Line: 51 ]]
                -- upvalues: l_default_0 (copy), v8 (copy)
                l_default_0:openURL(v8);
            end
        }, {
            UIListLayout = v1.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            FooterText = v1.createElement("TextLabel", {
                Text = v4, 
                TextColor3 = Color3.fromRGB(82, 173, 244), 
                BackgroundTransparency = 1, 
                Font = Enum.Font.GothamBold, 
                TextSize = 16, 
                TextScaled = false, 
                TextWrapped = false, 
                AutomaticSize = Enum.AutomaticSize.XY, 
                AnchorPoint = Vector2.new(0.5, 0.5)
            }, {
                UIPadding = v1.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, 16)
                })
            })
        })
    });
end;
return ReportAdFooter;