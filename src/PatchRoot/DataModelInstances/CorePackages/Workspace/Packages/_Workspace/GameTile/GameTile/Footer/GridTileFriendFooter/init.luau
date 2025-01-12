local l_Parent_0 = script:FindFirstAncestor("GameTile").Parent;
local v1 = require(l_Parent_0.React);
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local l_Colors_0 = require(l_Parent_0.Style).Colors;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_Array_0 = require(l_Parent_0.LuauPolyfill).Array;
local v6 = require(l_Parent_0.UIBlox);
local l_useStyle_0 = v6.Core.Style.useStyle;
local l_CoPlayFooter_0 = v6.App.Tile.ExperienceTileMetadata.CoPlayFooter;
return {
    GridTileFriendFooter = function(v9) --[[ Line: 47 ]] --[[ Name: GridTileFriendFooter ]]
        -- upvalues: l_useStyle_0 (copy), l_useDesignTokens_0 (copy), l_useLocalization_0 (copy), v1 (copy), l_CoPlayFooter_0 (copy), l_Array_0 (copy), l_Colors_0 (copy)
        local v10 = if v9.useLargerFont then l_useStyle_0().Font.Body else l_useStyle_0().Font.CaptionHeader;
        local l_Global_0 = l_useDesignTokens_0().Global;
        local v12 = l_useLocalization_0({
            friendsSeparator = "Feature.GameDetails.Label.FriendsSeparator"
        });
        local l_Space_50_0 = l_Global_0.Space_50;
        if not v9.showOnlineBorder then
            l_Space_50_0 = l_Space_50_0 - 3;
        end;
        local l_createElement_0 = v1.createElement;
        local v15 = "Frame";
        local v16 = {
            Size = UDim2.new(1, 0, 0, l_Global_0.Space_250), 
            BackgroundTransparency = 1
        };
        local v17 = {};
        local l_createElement_1 = v1.createElement;
        local l_l_CoPlayFooter_0_0 = l_CoPlayFooter_0;
        local v20 = {};
        local l_friends_0 = v9.friends;
        local v22 = {};
        for v23 = 1, #l_friends_0 do
            v22[v23] = l_friends_0[v23].userId;
        end;
        v20.users = v22;
        l_friends_0 = v9.friends;
        v22 = v12.friendsSeparator;
        v20.labelText = l_Array_0.join(l_Array_0.map(l_friends_0, function(v24) --[[ Line: 40 ]]
            return v24.displayName;
        end), v22);
        v20.showEmphasisBorder = v9.showOnlineBorder;
        v20.faceGroupCount = 2;
        v20.styleProps = {
            faceWidth = l_Global_0.Size_250, 
            faceHeight = l_Global_0.Size_250, 
            faceGroupGap = -l_Global_0.Space_75, 
            containerGap = l_Space_50_0, 
            badgeBorderWidth = 3, 
            badgeHeight = l_Global_0.Size_250, 
            fontStyle = v10, 
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
        };
        v17.OnlineFriends = l_createElement_1(l_l_CoPlayFooter_0_0, v20);
        return l_createElement_0(v15, v16, v17);
    end, 
    getUserIdsForFacePile = function(v25) --[[ Line: 29 ]] --[[ Name: getUserIdsForFacePile ]]
        local v26 = {};
        for v27 = 1, #v25 do
            v26[v27] = v25[v27].userId;
        end;
        return v26;
    end, 
    getDisplayName = function(v28, v29) --[[ Line: 38 ]] --[[ Name: getDisplayName ]]
        -- upvalues: l_Array_0 (copy)
        return l_Array_0.join(l_Array_0.map(v28, function(v30) --[[ Line: 40 ]]
            return v30.displayName;
        end), v29);
    end
};