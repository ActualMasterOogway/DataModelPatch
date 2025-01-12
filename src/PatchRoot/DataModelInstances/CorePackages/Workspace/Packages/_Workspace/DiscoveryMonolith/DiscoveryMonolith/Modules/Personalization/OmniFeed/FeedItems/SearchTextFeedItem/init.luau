local l_Parent_0 = script:FindFirstAncestor("DiscoveryMonolith").Parent;
local v1 = require(l_Parent_0.React);
local l_useStyle_0 = require(l_Parent_0.UIBlox).Core.Style.useStyle;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local v4 = require(l_Parent_0.DiscoveryUtils);
return function(v5) --[[ Line: 17 ]]
    -- upvalues: l_useStyle_0 (copy), l_useSelector_0 (copy), v1 (copy), v4 (copy)
    local v6 = l_useStyle_0();
    local l_Font_0 = v6.Font;
    local l_Font_1 = l_Font_0.Body.Font;
    local v9 = l_Font_0.BaseSize * l_Font_0.Header2.RelativeSize;
    local v11 = l_useSelector_0(function(v10) --[[ Line: 23 ]]
        return v10.ScreenSize;
    end);
    local v12, v13 = v1.useState(v11);
    local function v15(v14) --[[ Line: 28 ]]
        -- upvalues: v13 (copy)
        if v14 then
            v13(v14.AbsoluteSize);
        end;
    end;
    local v16 = v12.X and v4.getPageSideMargin(v12.X);
    local v21 = l_useSelector_0(function(v17) --[[ Line: 35 ]]
        -- upvalues: v5 (copy)
        local v18 = v17.Search.SearchesInGames[v5.searchUuid];
        if v18 and v18.entries then
            for _, v20 in v18.entries do
                if v20.topicId == v5.topicId then
                    return v20.name;
                end;
            end;
        end;
        return nil;
    end);
    return v1.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 32), 
        AutomaticSize = Enum.AutomaticSize.XY, 
        Position = UDim2.new(0, 0, 0, 0), 
        BackgroundTransparency = v6.Theme.BackgroundContrast.Transparency, 
        BackgroundColor3 = v6.Theme.BackgroundContrast.Color, 
        BorderSizePixel = 0, 
        [v1.Change.AbsoluteSize] = v15
    }, {
        Padding = v1.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, v16), 
            PaddingRight = UDim.new(0, v16), 
            PaddingTop = UDim.new(0, 16), 
            PaddingBottom = UDim.new(0, 16)
        }), 
        BannerText = v1.createElement("TextLabel", {
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            RichText = true, 
            Size = UDim2.new(1, 0, 0, 32), 
            Text = v21, 
            TextSize = v9, 
            Font = l_Font_1, 
            TextWrapped = true, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            TextColor3 = v6.Theme.TextEmphasis.Color
        })
    });
end;