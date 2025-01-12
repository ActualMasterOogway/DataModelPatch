local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local l_withStyle_0 = require(l_CorePackages_0.Packages.UIBlox).Style.withStyle;
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v6 = require(l_RobloxGui_0.Modules.GameTranslator);
local l_Connection_0 = script.Parent.Parent.Connection;
local l_WithLayoutValues_0 = require(l_Connection_0.LayoutValues).WithLayoutValues;
local v9 = require(script.Parent.EntryFrame);
local v10 = require(script.Parent.StatEntry);
local v11 = require(script.Parent.CellExtender);
local v12 = v2.PureComponent:extend("TeamEntry");
v12.render = function(v13) --[[ Line: 25 ]] --[[ Name: render ]]
    -- upvalues: l_WithLayoutValues_0 (copy), l_withStyle_0 (copy), v6 (copy), l_CoreGui_0 (copy), v2 (copy), v9 (copy), v10 (copy), v11 (copy)
    return l_WithLayoutValues_0(function(v14) --[[ Line: 26 ]]
        -- upvalues: l_withStyle_0 (ref), v13 (copy), v6 (ref), l_CoreGui_0 (ref), v2 (ref), v9 (ref), v10 (ref), v11 (ref)
        return l_withStyle_0(function(v15) --[[ Line: 27 ]]
            -- upvalues: v14 (copy), v13 (ref), v6 (ref), l_CoreGui_0 (ref), v2 (ref), v9 (ref), v10 (ref), v11 (ref)
            local l_NeutralTeamName_0 = v14.NeutralTeamName;
            local l_Color_0 = v14.NeutralTeamColor.Color;
            if v13.props.teamName then
                l_NeutralTeamName_0 = v6:TranslateGameText(l_CoreGui_0, v13.props.teamName);
                l_Color_0 = v13.props.teamColor.Color;
            end;
            local v18 = nil;
            v18 = if not v14.IsTenFoot then if v13.props.teamColor then {
                Color = v13.props.teamColor.Color, 
                Transparency = v14.TeamEntryBackgroundTransparency * v15.Settings.PreferredTransparency
            } else v15.Theme.Divider else {
                Color = l_Color_0, 
                Transparency = v14.BackgroundStyle.Default.Transparency
            };
            local v19 = {
                Transparency = 1, 
                Color = Color3.new(1, 1, 1)
            };
            local v20 = nil;
            v20 = if v14.IsTenFoot then v14.DefaultTextStyle else v15.Theme.TextEmphasis;
            local l_entrySize_0 = v13.props.entrySize;
            local v22 = nil;
            local v23 = nil;
            if not v14.IsTenFoot then
                v22 = v15.Font.CaptionHeader.RelativeSize * v15.Font.BaseSize;
                v23 = v15.Font.CaptionHeader.Font;
            else
                v22 = v14.PlayerNameTextSize;
                v23 = v14.TeamEntryFont;
            end;
            local v24 = {};
            local v25 = nil;
            if v14.IsTenFoot then
                v25 = UDim.new(0, v14.PlayerEntryPadding);
            end;
            v24.Layout = v2.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Horizontal, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                Padding = v25
            });
            v24.NameFrame = v2.createElement("Frame", {
                LayoutOrder = 0, 
                Size = UDim2.new(0, l_entrySize_0, 0, v14.TeamEntrySizeY), 
                BackgroundTransparency = 1
            }, {
                Shadow = v2.createElement("ImageLabel", {
                    BackgroundTransparency = 1, 
                    Image = v14.ShadowImage, 
                    Position = UDim2.new(0, -v14.ShadowSize, 0, 0), 
                    Size = UDim2.new(1, v14.ShadowSize * 2, 1, v14.ShadowSize), 
                    ScaleType = Enum.ScaleType.Slice, 
                    SliceCenter = v14.ShadowSliceRect, 
                    Visible = v14.IsTenFoot
                }), 
                BGFrame = v2.createElement(v9, {
                    sizeX = l_entrySize_0, 
                    sizeY = v14.TeamEntrySizeY, 
                    isTeamFrame = true, 
                    backgroundStyle = v18, 
                    overlayStyle = v19, 
                    doubleOverlay = false
                }, {
                    TeamName = v2.createElement("TextLabel", {
                        Position = UDim2.new(0, 0, 0, 0), 
                        Size = UDim2.new(1, 0, 1, 0), 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        Font = v23, 
                        TextSize = v22, 
                        TextColor3 = v20.Color, 
                        TextStrokeTransparency = v20.StrokeTransparency, 
                        TextStrokeColor3 = v20.StrokeColor, 
                        BackgroundTransparency = 1, 
                        Text = l_NeutralTeamName_0, 
                        TextTruncate = Enum.TextTruncate.AtEnd
                    }, {
                        v2.createElement("UIPadding", {
                            PaddingLeft = UDim.new(0, v14.TeamEntryTextPadding)
                        })
                    })
                })
            });
            local l_MaxLeaderstats_0 = v14.MaxLeaderstats;
            if v13.props.isSmallTouchDevice then
                l_MaxLeaderstats_0 = v14.MaxLeaderstatsSmallScreen;
            end;
            for v27, v28 in ipairs(v13.props.gameStats) do
                if l_MaxLeaderstats_0 >= v27 then
                    v24["gameStat_" .. v28.name] = v2.createElement(v10, {
                        statName = v28.name, 
                        statValue = v13.props.leaderstats[v28.name], 
                        isTitleEntry = false, 
                        isTeamEntry = true, 
                        layoutOrder = v27, 
                        backgroundStyle = v18, 
                        overlayStyle = v19, 
                        doubleOverlay = false, 
                        textStyle = v20
                    });
                else
                    break;
                end;
            end;
            if not v14.IsTenFoot then
                v24.BackgroundExtender = v2.createElement(v11, {
                    layoutOrder = 100, 
                    size = UDim2.new(0, v14.ExtraContainerPadding, 1, 0), 
                    backgroundStyle = v18, 
                    overlayStyle = v19, 
                    doubleOverlay = false
                });
            end;
            return v2.createFragment(v24);
        end);
    end);
end;
return v3.UNSTABLE_connect2(function(v29) --[[ Line: 169 ]] --[[ Name: mapStateToProps ]]
    return {
        isSmallTouchDevice = v29.displayOptions.isSmallTouchDevice
    };
end, nil)(v12);