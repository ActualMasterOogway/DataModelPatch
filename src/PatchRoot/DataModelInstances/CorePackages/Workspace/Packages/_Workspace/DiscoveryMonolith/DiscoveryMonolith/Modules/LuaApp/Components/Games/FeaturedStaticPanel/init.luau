local l_script_FirstAncestor_0 = script:FindFirstAncestor("DiscoveryMonolith");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local l_useStyle_0 = v3.Core.Style.useStyle;
local l_useTextSizeOffset_0 = v3.Core.Style.useTextSizeOffset;
local v6 = require(l_Parent_0.Dash);
local v7 = require(l_Parent_0.GameTile);
local l_GridTileTextFooter_0 = v7.GridTileTextFooter;
local l_ExperienceFooter_0 = v7.ExperienceFooter;
local l_FFlagLuaAppEmphasisOfficial_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppEmphasisOfficial;
local l_FFlagLuaAppFiatPaidAccess_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppFiatPaidAccess;
local l_Modules_0 = l_script_FirstAncestor_0.Modules;
local v13 = require(l_Modules_0.LuaApp.Components.Common.ItemTileCreatorName);
return function(v14) --[[ Line: 40 ]]
    -- upvalues: l_useStyle_0 (copy), l_useTextSizeOffset_0 (copy), v2 (copy), v6 (copy), l_FFlagLuaAppEmphasisOfficial_0 (copy), l_GridTileTextFooter_0 (copy), l_FFlagLuaAppFiatPaidAccess_0 (copy), l_ExperienceFooter_0 (copy), v13 (copy)
    local v15 = l_useStyle_0();
    local l_Font_0 = v15.Font;
    local l_Theme_0 = v15.Theme;
    local v18 = l_useTextSizeOffset_0();
    local v19 = v14.padding or 0;
    local v20 = math.ceil(l_Font_0.BaseSize * l_Font_0.Header2.RelativeSize);
    local v21, v22 = v2.useState(v20);
    v2.useEffect(function() --[[ Line: 50 ]]
        -- upvalues: v22 (copy), v20 (copy), v18 (copy)
        v22(v20 + v18);
    end, {
        v20, 
        v18
    });
    local v23 = v6.join(v14.footerData, {
        size = UDim2.new(0, 132, 0, v20), 
        layoutOrder = 2, 
        isStatsOnly = true
    });
    local v24 = nil;
    if l_FFlagLuaAppEmphasisOfficial_0 and v14.licenseDescription then
        v24 = v2.createElement(l_GridTileTextFooter_0, {
            text = v14.licenseDescription, 
            useLargerFont = true, 
            LayoutOrder = 2
        });
    elseif l_FFlagLuaAppFiatPaidAccess_0 and v14.paidAccessDescription then
        v24 = v2.createElement(l_GridTileTextFooter_0, {
            text = v14.paidAccessDescription, 
            useLargerFont = true, 
            LayoutOrder = 2
        });
    else
        v2.createElement(l_ExperienceFooter_0, v23);
    end;
    return v2.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        ClipsDescendants = true
    }, {
        UIPadding = v2.createElement("UIPadding", {
            PaddingTop = UDim.new(0, v19), 
            PaddingLeft = if v14.hasBackground then UDim.new(0, v19) else nil, 
            PaddingRight = if v14.hasBackground then UDim.new(0, v19) else nil, 
            PaddingBottom = if v14.hasBackground then UDim.new(0, v19) else nil
        }), 
        Layout = v2.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Vertical, 
            Padding = UDim.new(0, v19)
        }), 
        Title = if v14.title and string.len(v14.title) > 0 then v2.createElement("TextLabel", {
            Size = UDim2.new(1, 0, 0, v21), 
            BackgroundTransparency = 1, 
            Text = v14.title, 
            Font = l_Font_0.Header2.Font, 
            TextSize = v20, 
            TextTransparency = l_Theme_0.TextEmphasis.Transparency, 
            TextColor3 = l_Theme_0.TextEmphasis.Color, 
            TextWrapped = true, 
            TextTruncate = Enum.TextTruncate.AtEnd, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Top, 
            LayoutOrder = 1
        }) else nil, 
        Footer = v24, 
        CreatorName = if v14.creatorName then v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, v21), 
            BackgroundTransparency = 1, 
            LayoutOrder = 3
        }, {
            Text = v2.createElement(v13, {
                name = v14.creatorName, 
                hasVerifiedBadge = v14.creatorVerified, 
                creatorId = v14.creatorId
            })
        }) else nil, 
        Description = if v14.description and string.len(v14.description) > 0 then v2.createElement("TextLabel", {
            Size = UDim2.new(1, 0, 0, v21 * 3), 
            BackgroundTransparency = 1, 
            Text = v14.description, 
            Font = l_Font_0.Body.Font, 
            TextSize = l_Font_0.BaseSize * l_Font_0.Body.RelativeSize, 
            TextTransparency = l_Theme_0.TextDefault.Transparency, 
            TextColor3 = l_Theme_0.TextDefault.Color, 
            TextWrapped = true, 
            TextTruncate = Enum.TextTruncate.AtEnd, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Top, 
            LayoutOrder = 4
        }, {
            UITextSizeConstraint = v2.createElement("UITextSizeConstraint", {
                MaxTextSize = v15.Tokens.Global.FontSize_300
            })
        }) else nil
    });
end;