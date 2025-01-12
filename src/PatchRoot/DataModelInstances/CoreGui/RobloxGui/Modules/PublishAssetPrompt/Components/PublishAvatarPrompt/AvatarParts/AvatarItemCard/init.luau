local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local l_useStyle_0 = require(l_CorePackages_0.Packages.UIBlox).Core.Style.useStyle;
local v3 = require(script.Parent.AvatarPartViewport);
local v4 = require(script.Parent.Parent.Parent.Parent.FFlagAppendBodyPartToTitle);
return function(v5) --[[ Line: 25 ]] --[[ Name: AvatarItemCard ]]
    -- upvalues: l_useStyle_0 (copy), v4 (copy), v1 (copy), v3 (copy)
    local v6 = l_useStyle_0();
    local l_Font_0 = v6.Font;
    local l_Theme_0 = v6.Theme;
    local l_asset_0 = v5.asset;
    local l_CaptionHeader_0 = l_Font_0.CaptionHeader;
    local l_Color_0 = l_Theme_0.TextEmphasis.Color;
    local v12 = true;
    if typeof(l_asset_0) ~= "table" then
        v12 = l_asset_0:IsA("MeshPart") or l_asset_0:IsA("Accessory");
    end;
    assert(v12, "Assert that asset is a table, MeshPart, or Accessory");
    local l_bodyName_0 = v5.bodyName;
    v12 = v5.partName;
    local v14 = if v4 then l_bodyName_0 and v12 else v5.titleText;
    local v15 = nil;
    if v4 and l_bodyName_0 and v12 then
        assert(l_bodyName_0, "bodyName is nil");
        assert(v12, "partName is nil");
        v15 = l_bodyName_0 .. "'s " .. v12;
    else
        v15 = v5.titleText;
    end;
    return v1.createElement("Frame", {
        Size = UDim2.fromScale(1, 1), 
        LayoutOrder = v5.LayoutOrder, 
        BackgroundTransparency = 1
    }, {
        UIListLayout = v1.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 5)
        }), 
        AvatarPartViewport = v1.createElement(v3, {
            asset = l_asset_0, 
            LayoutOrder = 1, 
            viewportSize = v5.viewportSize
        }), 
        TitleText = v14 and v1.createElement("TextLabel", {
            LayoutOrder = 2, 
            BackgroundTransparency = 1, 
            Text = v15, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Top, 
            Size = UDim2.new(1, 0, 0, 50), 
            TextColor3 = l_Color_0, 
            TextWrapped = true, 
            Font = l_CaptionHeader_0.Font, 
            TextSize = l_CaptionHeader_0.RelativeSize * l_Font_0.BaseSize, 
            TextTruncate = Enum.TextTruncate.AtEnd
        })
    });
end;