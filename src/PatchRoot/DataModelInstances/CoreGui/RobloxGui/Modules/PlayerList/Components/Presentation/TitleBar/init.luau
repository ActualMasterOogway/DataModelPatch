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
local v11 = require(l_RobloxGui_0.Modules.Chrome.Enabled);
local v12 = v2.PureComponent:extend("TitleBar");
v12.validateProps = v4.strictInterface({
    Size = v4.UDim2, 
    LayoutOrder = v4.integer, 
    entrySize = v4.integer, 
    contentsVisible = v4.boolean, 
    backgroundTransparency = v4.union(v4.number, v4.table), 
    isSmallTouchDevice = v4.boolean, 
    gameStats = v4.array(v4.strictInterface({
        name = v4.string, 
        text = v4.string, 
        addId = v4.integer, 
        isPrimary = v4.boolean, 
        priority = v4.number
    }))
});
v12.render = function(v13) --[[ Line: 41 ]] --[[ Name: render ]]
    -- upvalues: l_WithLayoutValues_0 (copy), l_withStyle_0 (copy), v2 (copy), v10 (copy), v9 (copy), l_CoreGui_0 (copy), v11 (copy)
    return l_WithLayoutValues_0(function(v14) --[[ Line: 42 ]]
        -- upvalues: l_withStyle_0 (ref), v2 (ref), v13 (copy), v10 (ref), v9 (ref), l_CoreGui_0 (ref), v11 (ref)
        return l_withStyle_0(function(v15) --[[ Line: 43 ]]
            -- upvalues: v2 (ref), v13 (ref), v10 (ref), v14 (copy), v9 (ref), l_CoreGui_0 (ref), v11 (ref)
            local v16 = {
                layout = v2.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    VerticalAlignment = Enum.VerticalAlignment.Center
                })
            };
            local l_entrySize_0 = v13.props.entrySize;
            v16.playersHeader = v2.createElement("TextLabel", {
                LayoutOrder = 1, 
                Size = UDim2.new(0, l_entrySize_0, 1, 0), 
                Text = v10:FormatByKey("InGame.PlayerList.Players"), 
                BackgroundTransparency = 1, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                Font = v15.Font.Footer.Font, 
                TextSize = v15.Font.BaseSize * v15.Font.Footer.RelativeSize, 
                TextTransparency = v15.Theme.TextMuted.Transparency, 
                TextColor3 = v15.Theme.TextMuted.Color
            }, {
                Padding = v2.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, 15)
                })
            });
            local l_MaxLeaderstats_0 = v14.MaxLeaderstats;
            if v13.props.isSmallTouchDevice then
                l_MaxLeaderstats_0 = v14.MaxLeaderstatsSmallScreen;
            end;
            for v19, v20 in ipairs(v13.props.gameStats) do
                if l_MaxLeaderstats_0 >= v19 then
                    local v21 = v9:TranslateGameText(l_CoreGui_0, v20.name);
                    v16["stat_" .. v20.name] = v2.createElement("TextLabel", {
                        LayoutOrder = v19 + 1, 
                        Size = UDim2.new(0, v14.StatEntrySizeX, 1, 0), 
                        Text = v21, 
                        BackgroundTransparency = 1, 
                        TextXAlignment = Enum.TextXAlignment.Center, 
                        TextYAlignment = Enum.TextYAlignment.Center, 
                        Font = v15.Font.Footer.Font, 
                        TextSize = v15.Font.BaseSize * v15.Font.Footer.RelativeSize, 
                        TextTransparency = v15.Theme.TextMuted.Transparency, 
                        TextColor3 = v15.Theme.TextMuted.Color, 
                        TextTruncate = Enum.TextTruncate.AtEnd
                    });
                else
                    break;
                end;
            end;
            local v22 = if v11() then v15.Theme.BackgroundUIContrast.Color else v15.Theme.BackgroundContrast.Color;
            return v2.createElement("Frame", {
                Size = v13.props.Size, 
                LayoutOrder = v13.props.LayoutOrder, 
                BackgroundTransparency = v13.props.backgroundTransparency, 
                BackgroundColor3 = v22, 
                BorderSizePixel = 0
            }, {
                Divider = v2.createElement("Frame", {
                    Visible = v13.props.contentsVisible, 
                    Size = UDim2.new(1, 0, 0, 1), 
                    Position = UDim2.new(0, 0, 1, 0), 
                    AnchorPoint = Vector2.new(0, 1), 
                    BackgroundTransparency = v15.Theme.Divider.Transparency, 
                    BackgroundColor3 = v15.Theme.Divider.Color, 
                    BorderSizePixel = 0
                }), 
                ChildrenFrame = v2.createElement("Frame", {
                    Visible = v13.props.contentsVisible, 
                    BackgroundTransparency = 1, 
                    Position = UDim2.new(0, 0, 0, -2), 
                    Size = UDim2.new(1, 0, 1, 0)
                }, v16)
            });
        end);
    end);
end;
return v3.UNSTABLE_connect2(function(v23) --[[ Line: 127 ]] --[[ Name: mapStateToProps ]]
    return {
        isSmallTouchDevice = v23.displayOptions.isSmallTouchDevice
    };
end, nil)(v12);