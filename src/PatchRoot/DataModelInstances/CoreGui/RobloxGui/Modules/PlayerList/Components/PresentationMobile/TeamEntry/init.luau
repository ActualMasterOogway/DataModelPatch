local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local l_withStyle_0 = require(l_CorePackages_0.Packages.UIBlox).Style.withStyle;
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v6 = require(l_RobloxGui_0.Modules.GameTranslator);
local l_Connection_0 = script.Parent.Parent.Connection;
local l_WithLayoutValues_0 = require(l_Connection_0.LayoutValues).WithLayoutValues;
local v9 = require(script.Parent.StatEntry);
local v10 = v2.PureComponent:extend("TeamEntry");
v10.render = function(v11) --[[ Line: 23 ]] --[[ Name: render ]]
    -- upvalues: l_WithLayoutValues_0 (copy), l_withStyle_0 (copy), v6 (copy), l_CoreGui_0 (copy), v2 (copy), v9 (copy)
    return l_WithLayoutValues_0(function(v12) --[[ Line: 24 ]]
        -- upvalues: l_withStyle_0 (ref), v11 (copy), v6 (ref), l_CoreGui_0 (ref), v2 (ref), v9 (ref)
        return l_withStyle_0(function(v13) --[[ Line: 25 ]]
            -- upvalues: v11 (ref), v6 (ref), l_CoreGui_0 (ref), v12 (copy), v2 (ref), v9 (ref)
            local v14 = nil;
            local v15 = nil;
            if v11.props.teamName then
                v14 = v6:TranslateGameText(l_CoreGui_0, v11.props.teamName);
                v15 = v11.props.teamColor.Color;
            else
                v14 = v12.NeutralTeamName;
                v15 = v12.NeutralTeamColor.Color;
            end;
            local l_Settings_0 = v13.Settings;
            local l_TextEmphasis_0 = v13.Theme.TextEmphasis;
            local v18 = v13.Font.CaptionHeader.RelativeSize * v13.Font.BaseSize;
            local l_Font_0 = v13.Font.CaptionHeader.Font;
            local v20 = {
                UIListLayout = v2.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    VerticalAlignment = Enum.VerticalAlignment.Center
                }), 
                NameFrame = v2.createElement("TextLabel", {
                    Size = UDim2.new(0, v12.PlayerNameSizeXMobile, 1, 0), 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    Font = l_Font_0, 
                    TextSize = v18, 
                    LayoutOrder = 0, 
                    TextColor3 = l_TextEmphasis_0.Color, 
                    TextStrokeTransparency = l_TextEmphasis_0.StrokeTransparency, 
                    TextStrokeColor3 = l_TextEmphasis_0.StrokeColor, 
                    BackgroundTransparency = 1, 
                    Text = v14, 
                    TextTruncate = Enum.TextTruncate.AtEnd
                }, {
                    UIPadding = v2.createElement("UIPadding", {
                        PaddingLeft = UDim.new(0, v12.TeamEntryTextPaddingMobile)
                    })
                })
            };
            for v21, v22 in ipairs(v11.props.gameStats) do
                if v12.MaxLeaderstats >= v21 then
                    v20["GameStat_" .. v22.name] = v2.createElement(v9, {
                        statValue = v11.props.leaderstats[v22.name], 
                        isTitleEntry = false, 
                        isTeamEntry = true, 
                        textStyle = l_TextEmphasis_0, 
                        layoutOrder = v21
                    });
                else
                    break;
                end;
            end;
            return v2.createElement("Frame", {
                LayoutOrder = v11.props.layoutOrder, 
                Size = UDim2.new(1, 0, 0, v12.TeamEntrySizeY), 
                Position = v11.props.Position, 
                BackgroundTransparency = l_Settings_0.PreferredTransparency * 0.5, 
                BackgroundColor3 = v15, 
                BorderSizePixel = 0
            }, v20);
        end);
    end);
end;
return v3.connect(function(v23) --[[ Line: 93 ]] --[[ Name: mapStateToProps ]]
    return {
        isSmallTouchDevice = v23.displayOptions.isSmallTouchDevice
    };
end, nil)(v10);