local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.t);
local l_withStyle_0 = require(l_CorePackages_0.Packages.UIBlox).Style.withStyle;
local l_Connection_0 = script.Parent.Parent.Connection;
local l_WithLayoutValues_0 = require(l_Connection_0.LayoutValues).WithLayoutValues;
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v9 = require(l_RobloxGui_0.Modules.GameTranslator);
local v10 = require(l_RobloxGui_0.Modules.RobloxTranslator);
local v11 = v2.PureComponent:extend("TitleBar");
v11.validateProps = v4.strictInterface({
    Size = v4.UDim2, 
    Position = v4.optional(v4.UDim2), 
    LayoutOrder = v4.optional(v4.integer), 
    entrySize = v4.integer, 
    contentsVisible = v4.boolean, 
    isSmallTouchDevice = v4.boolean, 
    gameStats = v4.array(v4.strictInterface({
        name = v4.string, 
        text = v4.string, 
        addId = v4.integer, 
        isPrimary = v4.boolean, 
        priority = v4.number
    }))
});
v11.render = function(v12) --[[ Line: 40 ]] --[[ Name: render ]]
    -- upvalues: l_WithLayoutValues_0 (copy), l_withStyle_0 (copy), v2 (copy), v10 (copy), v9 (copy), l_CoreGui_0 (copy)
    return l_WithLayoutValues_0(function(v13) --[[ Line: 41 ]]
        -- upvalues: l_withStyle_0 (ref), v2 (ref), v10 (ref), v12 (copy), v9 (ref), l_CoreGui_0 (ref)
        return l_withStyle_0(function(v14) --[[ Line: 42 ]]
            -- upvalues: v2 (ref), v13 (copy), v10 (ref), v12 (ref), v9 (ref), l_CoreGui_0 (ref)
            local v15 = {
                UIListLayout = v2.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    VerticalAlignment = Enum.VerticalAlignment.Center
                }), 
                PlayersHeader = v2.createElement("TextLabel", {
                    LayoutOrder = 0, 
                    Size = UDim2.new(0, v13.PlayerNameSizeXMobile, 1, 0), 
                    Text = v10:FormatByKey("InGame.PlayerList.Players"), 
                    BackgroundTransparency = 1, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextYAlignment = Enum.TextYAlignment.Center, 
                    Font = v14.Font.Footer.Font, 
                    TextSize = v14.Font.BaseSize * v14.Font.Footer.RelativeSize, 
                    TextColor3 = v14.Theme.TextMuted.Color
                }, {
                    Padding = v2.createElement("UIPadding", {
                        PaddingLeft = UDim.new(0, 14)
                    })
                })
            };
            local l_MaxLeaderstats_0 = v13.MaxLeaderstats;
            for v17, v18 in ipairs(v12.props.gameStats) do
                if l_MaxLeaderstats_0 >= v17 then
                    local v19 = v9:TranslateGameText(l_CoreGui_0, v18.name);
                    v15["Stat_" .. v18.name] = v2.createElement("TextLabel", {
                        LayoutOrder = v17, 
                        Size = UDim2.new(0, v13.StatEntrySizeX, 1, 0), 
                        Text = v19, 
                        BackgroundTransparency = 1, 
                        TextXAlignment = Enum.TextXAlignment.Center, 
                        TextYAlignment = Enum.TextYAlignment.Center, 
                        Font = v14.Font.Footer.Font, 
                        TextSize = v14.Font.BaseSize * v14.Font.Footer.RelativeSize, 
                        TextTransparency = 0, 
                        TextColor3 = Color3.fromRGB(255, 255, 255), 
                        TextTruncate = Enum.TextTruncate.AtEnd
                    });
                else
                    break;
                end;
            end;
            return v2.createElement("Frame", {
                Size = v12.props.Size, 
                Position = v12.props.Position, 
                LayoutOrder = v12.props.LayoutOrder, 
                Visible = v12.props.contentsVisible, 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0
            }, v15);
        end);
    end);
end;
return v3.connect(function(v20) --[[ Line: 101 ]] --[[ Name: mapStateToProps ]]
    return {
        isSmallTouchDevice = v20.displayOptions.isSmallTouchDevice
    };
end, nil)(v11);