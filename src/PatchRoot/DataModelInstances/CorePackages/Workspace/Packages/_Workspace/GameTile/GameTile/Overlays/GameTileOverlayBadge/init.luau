local l_Parent_0 = script:FindFirstAncestor("GameTile").Parent;
local v1 = require(l_Parent_0.Foundation);
local l_GetTextSize_0 = require(l_Parent_0.Style).GetTextSize;
local l_Icon_0 = v1.Icon;
local l_IconSize_0 = v1.Enums.IconSize;
local v5 = require(l_Parent_0.React);
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local l_useTokens_0 = v1.Hooks.useTokens;
local v8 = {};
return v5.memo(function(v9) --[[ Line: 25 ]] --[[ Name: GameTileOverlayBadge ]]
    -- upvalues: v8 (copy), l_useTokens_0 (copy), v5 (copy), l_GetTextSize_0 (copy), l_dependencyArray_0 (copy), l_Icon_0 (copy), l_IconSize_0 (copy)
    local v10 = v9.icons or v8;
    local v11 = v9.text or "";
    local v12 = #v10 > 0;
    local v13 = #v11 > 0;
    local v14 = l_useTokens_0();
    local l_White_90_0 = v14.Color.Extended.White.White_90;
    local l_Emphasis_0 = v14.LightMode.Content.Emphasis;
    local v17 = if not not v13 or #v10 > 1 then v14.Size.Size_200 else v14.Size.Size_150;
    local l_Size_150_0 = v14.Size.Size_150;
    local l_XSmall_0 = v14.Padding.XSmall;
    local l_TitleSmall_0 = v14.Typography.TitleSmall;
    local l_Size_400_0 = v14.Size.Size_400;
    local v22 = v5.useMemo(function() --[[ Line: 43 ]]
        -- upvalues: v13 (copy), l_GetTextSize_0 (ref), v11 (copy), l_TitleSmall_0 (copy)
        if v13 then
            return (l_GetTextSize_0(v11, l_TitleSmall_0.FontSize, l_TitleSmall_0.Font, Vector2.new(1e999, 1e999)));
        else
            return (Vector2.new(0, 0));
        end;
    end, l_dependencyArray_0(v11, v13, l_TitleSmall_0.FontSize, l_TitleSmall_0.Font));
    if not v13 and not v12 then
        return nil;
    else
        local v23 = {
            Padding = v5.createElement("UIPadding", {
                PaddingTop = UDim.new(0, l_Size_150_0), 
                PaddingLeft = UDim.new(0, v17), 
                PaddingBottom = UDim.new(0, l_Size_150_0), 
                PaddingRight = UDim.new(0, v17)
            }), 
            Layout = v5.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, l_XSmall_0)
            })
        };
        local v24 = 0;
        for v25, v26 in v10 do
            v23[("Icon%*"):format(v25)] = v5.createElement(l_Icon_0, {
                LayoutOrder = v25, 
                name = v26, 
                size = l_IconSize_0.Small, 
                style = l_Emphasis_0
            });
            v24 = v24 + (l_Size_400_0 + l_XSmall_0);
        end;
        if v13 then
            v23.BadgeText = v5.createElement("TextLabel", {
                LayoutOrder = #v10 + 1, 
                BackgroundTransparency = 1, 
                Size = UDim2.fromOffset(v22.X, v22.Y), 
                Text = v11, 
                TextColor3 = l_Emphasis_0.Color3, 
                Font = l_TitleSmall_0.Font, 
                TextSize = l_TitleSmall_0.FontSize, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                TextWrapped = false, 
                TextTruncate = Enum.TextTruncate.AtEnd
            }, {
                UISizeConstraint = v5.createElement("UISizeConstraint", {
                    MaxSize = v9.maxWidthBinding:map(function(v27) --[[ Line: 97 ]]
                        -- upvalues: v17 (copy), v24 (ref)
                        local v28 = v27 - 2 * v17 - v24;
                        if v28 > 0 then
                            return (Vector2.new(v28, 1e999));
                        else
                            return nil;
                        end;
                    end)
                })
            });
        end;
        return v5.createElement("Frame", {
            BackgroundColor3 = l_White_90_0.Color3, 
            BackgroundTransparency = l_White_90_0.Transparency, 
            Position = v9.Position, 
            AnchorPoint = v9.AnchorPoint, 
            AutomaticSize = Enum.AutomaticSize.XY
        }, {
            Corner = v5.createElement("UICorner", {
                CornerRadius = UDim.new(1, 0)
            }), 
            BadgeContent = v5.createElement("Frame", {
                BackgroundTransparency = 1, 
                AutomaticSize = Enum.AutomaticSize.XY
            }, v23)
        });
    end;
end);