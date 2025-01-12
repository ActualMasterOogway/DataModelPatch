local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameTile");
local v1 = require(l_script_FirstAncestor_0.Footer.CoPlayFooter);
local v2 = require(l_script_FirstAncestor_0.Footer.usePlayerCountText);
local _ = require(l_script_FirstAncestor_0.GameTileTypes);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v5 = require(l_Parent_0.React);
local v6 = require(l_Parent_0.UIBlox);
local l_useStyle_0 = v6.Core.Style.useStyle;
local l_StyledTextLabel_0 = v6.App.Text.StyledTextLabel;
local l_StatGroup_0 = v6.App.Indicator.StatGroup;
local l_TextFooter_0 = v6.App.Tile.ExperienceTileMetadata.TextFooter;
local l_CoPlayFooter_0 = v6.App.Tile.ExperienceTileMetadata.CoPlayFooter;
local l_SocialProofFooter_0 = v6.App.Tile.ExperienceTileMetadata.SocialProofFooter;
local l_TooltipOrientation_0 = v6.App.Dialog.Enum.TooltipOrientation;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_Colors_0 = require(l_Parent_0.Style).Colors;
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local l_SponsoredTooltipHover_0 = require(l_Parent_0.Ads).SponsoredTooltipHover;
local v18 = UDim2.fromScale(1, 1);
return function(v19) --[[ Line: 25 ]]
    -- upvalues: v2 (copy), l_useStyle_0 (copy), l_useDesignTokens_0 (copy), l_useLocalization_0 (copy), v5 (copy), l_StyledTextLabel_0 (copy), l_SponsoredTooltipHover_0 (copy), l_TooltipOrientation_0 (copy), v18 (copy), l_CoPlayFooter_0 (copy), l_Colors_0 (copy), v1 (copy), l_TextFooter_0 (copy), l_SocialProofFooter_0 (copy), l_StatGroup_0 (copy)
    local v20 = v19.isSponsored and v19.isShowSponsoredLabel;
    local l_isStatsOnly_0 = v19.isStatsOnly;
    local l_isPlayable_0 = v19.isPlayable;
    local l_requiresPurchase_0 = v19.requiresPurchase;
    local v24 = v19.rating or "";
    local v25 = v19.playingCount or 0;
    local l_coPlayFriends_0 = v19.coPlayFriends;
    local l_showAgeRating_0 = v19.showAgeRating;
    local l_ageRatingTextLabel_0 = v19.ageRatingTextLabel;
    local l_useExperienceTileMetadata_0 = v19.useExperienceTileMetadata;
    local l_onActivateSponsoredTooltip_0 = v19.onActivateSponsoredTooltip;
    local v31 = v2(v25);
    local v32 = l_useStyle_0();
    local l_Font_0 = v32.Font;
    local l_Theme_0 = v32.Theme;
    local l_Global_0 = l_useDesignTokens_0().Global;
    local v36 = l_useLocalization_0({
        sponsoredText = "Feature.GamePage.Label.Sponsored", 
        notPlayableText = "Feature.ExperienceDetails.Label.NotPlayable", 
        ageRatingText = l_ageRatingTextLabel_0 or nil, 
        friendsText = l_useExperienceTileMetadata_0 and "CommonUI.Features.Label.Friends" or nil
    });
    if not l_isStatsOnly_0 then
        if v20 then
            local v37 = v5.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0
            }, {
                Layout = v5.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    Padding = UDim.new(0, 4)
                }), 
                SponsoredText = v5.createElement(l_StyledTextLabel_0, {
                    colorStyle = l_Theme_0.TextEmphasis, 
                    fontStyle = l_Font_0.CaptionHeader, 
                    textXAlignment = Enum.TextXAlignment.Center, 
                    textYAlignment = Enum.TextYAlignment.Center, 
                    automaticSize = Enum.AutomaticSize.X, 
                    size = UDim2.new(0, 0, 1, 0), 
                    lineHeight = 1, 
                    text = v36.sponsoredText, 
                    textTruncate = Enum.TextTruncate.AtEnd, 
                    richText = false, 
                    layoutOrder = 1
                }), 
                SponsoredTooltip = v5.createElement(l_SponsoredTooltipHover_0, {
                    tooltipOrientation = l_TooltipOrientation_0.Bottom, 
                    onActivateTooltip = l_onActivateSponsoredTooltip_0, 
                    size = UDim2.new(0, 16, 0, 16), 
                    color = l_Theme_0.TextEmphasis.Color, 
                    layoutOrder = 2
                })
            });
            if l_useExperienceTileMetadata_0 then
                return (v5.createElement("Frame", {
                    Size = UDim2.fromScale(1, 1), 
                    BackgroundColor3 = v32.Tokens.Semantic.Color.Ui.Default.Color3, 
                    BackgroundTransparency = v32.Tokens.Semantic.Color.Ui.Default.Transparency, 
                    BorderSizePixel = 0
                }, {
                    Layout = v5.createElement("UIListLayout", {
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        FillDirection = Enum.FillDirection.Horizontal, 
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        Padding = UDim.new(0, 4)
                    }), 
                    Text = v5.createElement("TextLabel", {
                        Size = UDim2.new(0, 0, 1, 0), 
                        AutomaticSize = Enum.AutomaticSize.X, 
                        BackgroundTransparency = 1, 
                        BorderSizePixel = 0, 
                        Text = v36.sponsoredText, 
                        TextXAlignment = Enum.TextXAlignment.Center, 
                        TextYAlignment = Enum.TextYAlignment.Center, 
                        Font = v32.Font.CaptionHeader.Font, 
                        TextSize = v32.Font.BaseSize * v32.Font.CaptionHeader.RelativeSize, 
                        TextColor3 = v32.Tokens.Semantic.Color.Text.Emphasis.Color3, 
                        TextTransparency = v32.Tokens.Semantic.Color.Text.Emphasis.Transparency, 
                        LayoutOrder = 1
                    }), 
                    SponsoredTooltip = v5.createElement(l_SponsoredTooltipHover_0, {
                        tooltipOrientation = l_TooltipOrientation_0.Bottom, 
                        onActivateTooltip = l_onActivateSponsoredTooltip_0, 
                        size = UDim2.new(0, 16, 0, 16), 
                        color = v32.Tokens.Semantic.Color.Text.Emphasis.Color3, 
                        layoutOrder = 2
                    })
                }, {
                    UICorner = v5.createElement("UICorner", {
                        CornerRadius = UDim.new(0, v32.Tokens.Semantic.Radius.Small)
                    })
                }));
            else
                return v5.createElement("Frame", {
                    Size = v19.size or v18, 
                    Position = v19.position, 
                    AnchorPoint = v19.anchorPoint, 
                    LayoutOrder = v19.layoutOrder, 
                    BackgroundTransparency = l_Theme_0.UIDefault.Transparency, 
                    BackgroundColor3 = l_Theme_0.UIDefault.Color
                }, {
                    UICorner = v5.createElement("UICorner", {
                        CornerRadius = UDim.new(0, 4)
                    }), 
                    SponsoredLabel = v37
                });
            end;
        elseif l_coPlayFriends_0 and next(l_coPlayFriends_0) then
            if l_useExperienceTileMetadata_0 then
                return v5.createElement(l_CoPlayFooter_0, {
                    users = l_coPlayFriends_0, 
                    labelText = v36.friendsText, 
                    showEmphasisBorder = true, 
                    faceGroupCount = 2, 
                    styleProps = {
                        faceWidth = l_Global_0.Size_250, 
                        faceHeight = l_Global_0.Size_250, 
                        faceGroupGap = -l_Global_0.Space_75, 
                        containerGap = l_Global_0.Space_50, 
                        badgeBorderWidth = 3, 
                        badgeHeight = l_Global_0.Size_250, 
                        fontStyle = v32.Font.CaptionHeader, 
                        badgeSpacingLeading = l_Global_0.Space_50, 
                        badgeSpacingTrailing = l_Global_0.Space_50, 
                        badgeBackgroundColor = {
                            Color = l_Colors_0.Smoke, 
                            Transparency = 0
                        }, 
                        badgeContentColor = {
                            Color = l_Colors_0.White, 
                            Transparency = 0
                        }
                    }
                });
            else
                local v38 = v5.createElement(v1, {
                    friends = l_coPlayFriends_0
                });
                return v5.createElement("Frame", {
                    Size = v19.size or v18, 
                    Position = v19.position, 
                    AnchorPoint = v19.anchorPoint, 
                    LayoutOrder = v19.layoutOrder, 
                    BackgroundTransparency = 1
                }, {
                    CoPlayFooter = v38
                });
            end;
        elseif l_showAgeRating_0 then
            local v39 = if v19.localizedAgeRatingTextLabel then v19.localizedAgeRatingTextLabel else v36.ageRatingText;
            if l_useExperienceTileMetadata_0 then
                return v5.createElement(l_TextFooter_0, {
                    text = v39
                });
            else
                return v5.createElement("Frame", {
                    Size = v19.size or v18, 
                    Position = v19.position, 
                    AnchorPoint = v19.anchorPoint, 
                    LayoutOrder = v19.layoutOrder, 
                    BackgroundTransparency = 1
                }, {
                    UIPadding = v5.createElement("UIPadding", {
                        PaddingTop = UDim.new(0, 2), 
                        PaddingRight = UDim.new(0, 0), 
                        PaddingBottom = UDim.new(0, 2), 
                        PaddingLeft = UDim.new(0, 0)
                    }), 
                    AgeRatingLabel = v5.createElement(l_StyledTextLabel_0, {
                        colorStyle = l_Theme_0.TextEmphasis, 
                        fontStyle = l_Font_0.CaptionHeader, 
                        textXAlignment = Enum.TextXAlignment.Left, 
                        textYAlignment = Enum.TextYAlignment.Center, 
                        size = UDim2.new(1, 0, 2, 0), 
                        lineHeight = 1, 
                        text = v39, 
                        textTruncate = Enum.TextTruncate.AtEnd, 
                        richText = false
                    })
                });
            end;
        elseif v19.showFriendActivity and not l_useExperienceTileMetadata_0 then
            local l_Font_1 = l_Font_0.Body.Font;
            local v41 = l_Font_0.BaseSize * l_Font_0.Body.RelativeSize;
            return v5.createElement("TextLabel", {
                Size = v19.size or v18, 
                TextColor3 = l_Theme_0.TextMuted.Color, 
                Font = l_Font_1, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                Text = v19.friendActivityTitle, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                TextSize = v41, 
                TextTransparency = l_Theme_0.TextMuted.Transparency, 
                BackgroundTransparency = 1
            });
        elseif l_isPlayable_0 == false and not l_requiresPurchase_0 then
            if l_useExperienceTileMetadata_0 then
                return v5.createElement(l_TextFooter_0, {
                    text = v36.notPlayableText
                });
            else
                return v5.createElement("Frame", {
                    Size = v19.size or v18, 
                    Position = v19.position, 
                    AnchorPoint = v19.anchorPoint, 
                    LayoutOrder = v19.layoutOrder, 
                    BackgroundTransparency = 1
                }, {
                    UICorner = v5.createElement("UICorner", {
                        CornerRadius = UDim.new(0, 4)
                    }), 
                    PlayabilityLabel = v5.createElement(l_StyledTextLabel_0, {
                        colorStyle = l_Theme_0.TextMuted, 
                        fontStyle = l_Font_0.CaptionHeader, 
                        textXAlignment = Enum.TextXAlignment.Left, 
                        textYAlignment = Enum.TextYAlignment.Center, 
                        size = UDim2.new(1, 0, 1, 0), 
                        lineHeight = 1, 
                        text = v36.notPlayableText, 
                        textTruncate = Enum.TextTruncate.AtEnd, 
                        richText = false
                    })
                });
            end;
        end;
    end;
    if l_useExperienceTileMetadata_0 then
        return v5.createElement(l_SocialProofFooter_0, {
            ratingText = v24, 
            playingText = v31
        });
    else
        local v42 = v5.createElement(l_StatGroup_0, {
            ratingText = v24, 
            playingText = v31
        });
        return v5.createElement("Frame", {
            Size = v19.size or v18, 
            Position = v19.position, 
            AnchorPoint = v19.anchorPoint, 
            LayoutOrder = v19.layoutOrder, 
            BackgroundTransparency = 1
        }, {
            ExperienceStats = v42
        });
    end;
end;