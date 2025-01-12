local l_script_FirstAncestor_0 = script:FindFirstAncestor("DiscoveryMonolith");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local l_useStyle_0 = v3.Core.Style.useStyle;
local l_useTextSizeOffset_0 = v3.Core.Style.useTextSizeOffset;
local v6 = require(l_Parent_0.Dash);
local l_ExperienceFooter_0 = require(l_Parent_0.GameTile).ExperienceFooter;
local l_FFlagLuaAppEmphasisOfficial_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppEmphasisOfficial;
local l_FFlagLuaAppFiatPaidAccess_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppFiatPaidAccess;
local l_Modules_0 = l_script_FirstAncestor_0.Modules;
local v11 = require(l_Modules_0.LuaApp.Components.Common.ItemTileCreatorName);
return function(v12) --[[ Line: 52 ]]
    -- upvalues: l_useStyle_0 (copy), l_useTextSizeOffset_0 (copy), l_FFlagLuaAppEmphasisOfficial_0 (copy), l_FFlagLuaAppFiatPaidAccess_0 (copy), v2 (copy), v6 (copy), l_ExperienceFooter_0 (copy), v11 (copy)
    local v13 = l_useStyle_0();
    local l_Font_0 = v13.Font;
    local l_Theme_0 = v13.Theme;
    local v16 = l_useTextSizeOffset_0();
    local v17 = nil;
    local v18 = nil;
    if l_FFlagLuaAppEmphasisOfficial_0 or l_FFlagLuaAppFiatPaidAccess_0 then
        local v19, v20 = v2.useState(2);
        v17 = v19;
        v18 = v20;
    else
        v17 = math.max(v12.contentRows or 1, 2);
    end;
    local v21 = math.max(0, v17 - 2);
    local v22 = v17 > 3;
    local v23 = v17 == 2;
    local v24 = v12.padding or 0;
    local v25 = math.ceil(l_Font_0.BaseSize * l_Font_0.Header2.RelativeSize);
    local v26, v27 = v2.useState(v25);
    v2.useEffect(function() --[[ Line: 75 ]]
        -- upvalues: v27 (copy), v25 (copy), v16 (copy)
        v27(v25 + v16);
    end, {
        v25, 
        v16
    });
    local v28 = nil;
    local v29 = nil;
    if l_FFlagLuaAppEmphasisOfficial_0 or l_FFlagLuaAppFiatPaidAccess_0 then
        v28 = v26;
        v29 = v2.useCallback(function(v30) --[[ Line: 83 ]]
            -- upvalues: v28 (ref), v24 (copy), v18 (ref)
            if v30 and v28 > 0 then
                local l_AbsoluteSize_0 = v30.AbsoluteSize;
                local l_X_0 = l_AbsoluteSize_0.X;
                local v33 = math.floor((l_AbsoluteSize_0.Y - v24 - math.max(v24, 8) - l_X_0 - 48) / (v28 + 8));
                v18(v33);
            end;
        end, {
            v24, 
            v28
        });
    end;
    local v34 = v6.join(v12.footerData, {
        size = UDim2.new(0, 132, 0, v26), 
        position = if not not v22 or v23 then UDim2.new(1, 0, 0, 0) else nil, 
        anchorPoint = if not not v22 or v23 then Vector2.new(1, 0) else nil, 
        isStatsOnly = true
    });
    local v35 = v2.createElement(l_ExperienceFooter_0, v34);
    return v2.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        ClipsDescendants = true, 
        ref = if not not l_FFlagLuaAppEmphasisOfficial_0 or l_FFlagLuaAppFiatPaidAccess_0 then v29 else nil, 
        [v2.Change.AbsoluteSize] = if not not l_FFlagLuaAppEmphasisOfficial_0 or l_FFlagLuaAppFiatPaidAccess_0 then v29 else nil
    }, {
        UIPadding = v2.createElement("UIPadding", {
            PaddingLeft = if v12.hasBackground then UDim.new(0, v24) else nil, 
            PaddingRight = UDim.new(0, v24), 
            PaddingTop = UDim.new(0, (math.max(v24, 8))), 
            PaddingBottom = UDim.new(0, v24)
        }), 
        Layout = v2.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Vertical, 
            Padding = UDim.new(0, 8)
        }), 
        TitleFrame = v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, v26), 
            BackgroundTransparency = 1, 
            LayoutOrder = 1
        }, {
            UIListLayout = v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            Title = if v12.title and string.len(v12.title) > 0 then v2.createElement("TextLabel", {
                Size = UDim2.new(1, v22 and -132 or 0, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1, 
                Text = v12.title, 
                Font = l_Font_0.Header2.Font, 
                TextSize = v25, 
                TextTransparency = l_Theme_0.TextEmphasis.Transparency, 
                TextColor3 = l_Theme_0.TextEmphasis.Color, 
                TextWrapped = true, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Top, 
                LayoutOrder = -1
            }) else nil, 
            InlineFooter = if v22 then v35 else nil
        }), 
        LicenseDescription = if l_FFlagLuaAppEmphasisOfficial_0 and v12.licenseDescription then v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, v28), 
            BackgroundTransparency = 1, 
            LayoutOrder = 2
        }, {
            LicenseDescription = v2.createElement("TextLabel", {
                Size = UDim2.new(1, 0, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1, 
                Text = v12.licenseDescription, 
                Font = l_Font_0.Body.Font, 
                TextSize = v25, 
                TextTransparency = l_Theme_0.TextEmphasis.Transparency, 
                TextColor3 = l_Theme_0.TextEmphasis.Color, 
                TextWrapped = true, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Top
            })
        }) else nil, 
        PaidAccessDescription = if not (l_FFlagLuaAppFiatPaidAccess_0 and v12.paidAccessDescription) or l_FFlagLuaAppEmphasisOfficial_0 and v12.licenseDescription then nil else v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, v28), 
            BackgroundTransparency = 1, 
            LayoutOrder = 2
        }, {
            PaidAccessDescription = v2.createElement("TextLabel", {
                Size = UDim2.new(1, 0, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1, 
                Text = v12.paidAccessDescription, 
                Font = l_Font_0.Body.Font, 
                TextSize = v25, 
                TextTransparency = l_Theme_0.TextEmphasis.Transparency, 
                TextColor3 = l_Theme_0.TextEmphasis.Color, 
                TextWrapped = true, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Top
            })
        }), 
        SubtitleFrame = v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, v26), 
            BackgroundTransparency = 1, 
            LayoutOrder = (not not l_FFlagLuaAppEmphasisOfficial_0 or l_FFlagLuaAppFiatPaidAccess_0) and 3 or 2
        }, {
            CreatorName = if v12.creatorName then v2.createElement("Frame", {
                Size = UDim2.new(1, v23 and -132 or 0, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1
            }, {
                Text = v2.createElement(v11, {
                    name = v12.creatorName, 
                    hasVerifiedBadge = v12.creatorVerified, 
                    creatorId = v12.creatorId
                })
            }) else nil, 
            InlineFooter = if v23 then v35 else nil
        }), 
        BodyFrame = if v21 > 0 then v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, v26 * v21), 
            BackgroundTransparency = 1, 
            ClipsDescendants = true, 
            LayoutOrder = (not not l_FFlagLuaAppEmphasisOfficial_0 or l_FFlagLuaAppFiatPaidAccess_0) and 4 or 3
        }, {
            ExperienceInfo = if v21 > 1 then v2.createElement("TextLabel", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1, 
                Text = v12.description, 
                Font = l_Font_0.Body.Font, 
                TextSize = l_Font_0.BaseSize * l_Font_0.Body.RelativeSize, 
                TextTransparency = l_Theme_0.TextDefault.Transparency, 
                TextColor3 = l_Theme_0.TextDefault.Color, 
                TextWrapped = true, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Top
            }, {
                UITextSizeConstraint = v2.createElement("UITextSizeConstraint", {
                    MaxTextSize = v13.Tokens.Global.FontSize_300
                })
            }) else v35
        }) else nil
    });
end;