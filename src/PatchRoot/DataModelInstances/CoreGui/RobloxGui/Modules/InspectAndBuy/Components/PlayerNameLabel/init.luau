local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_Players_0 = game:GetService("Players");
local l_Parent_0 = script.Parent.Parent;
local v4 = require(l_CorePackages_0.Packages.Roact);
local v5 = require(l_CorePackages_0.Packages.RoactRodux);
local l_AppFonts_0 = require(l_CorePackages_0.Workspace.Packages.Style).AppFonts;
local v7 = require(l_Parent_0.Colors);
local v8 = require(l_CoreGui_0.RobloxGui.Modules.RobloxTranslator);
local v9 = require(l_CorePackages_0.Workspace.Packages.VerifiedBadges);
local v10 = require(l_CorePackages_0.Workspace.Packages.UserLib);
local v11 = require(l_Parent_0.Components.InspectAndBuyContext);
local v12 = v4.PureComponent:extend("PlayerNameLabel");
local l_verified_0 = v9.emoji.verified;
v12.render = function(v14) --[[ Line: 22 ]] --[[ Name: render ]]
    -- upvalues: l_Players_0 (copy), v10 (copy), v8 (copy), l_verified_0 (copy), v4 (copy), v11 (copy), v7 (copy), l_AppFonts_0 (copy)
    local l_locale_0 = v14.props.locale;
    local l_view_0 = v14.props.view;
    local l_playerName_0 = v14.props.playerName;
    local v18 = tonumber(v14.props.playerId);
    local v19 = v18 and l_Players_0:GetPlayerByUserId(v18);
    local v20 = if v19 then v10.Utils.isPlayerVerified(v19) else false;
    local v21 = nil;
    v21 = l_playerName_0 == "" and "" or if v20 then v8:FormatByKeyForLocale("InGame.InspectMenu.Label.VerifiedAvatar", l_locale_0, {
        PLAYER_NAME = l_playerName_0, 
        VERIFIED_BADGE = l_verified_0
    }) else v8:FormatByKeyForLocale("InGame.InspectMenu.Label.Avatar", l_locale_0, {
        PLAYER_NAME = l_playerName_0
    });
    return v4.createElement(v11.Consumer, {
        render = function(v22) --[[ Line: 44 ]] --[[ Name: render ]]
            -- upvalues: l_view_0 (copy), v4 (ref), v7 (ref), v21 (ref), l_AppFonts_0 (ref)
            local v23 = v22[l_view_0];
            local v24 = v23.AvatarHeadShotSize + v23.BorderPaddingSize * 2 + 10;
            return v4.createElement("TextLabel", {
                Size = UDim2.new(1, -v24, 0, v23.TopSizeY), 
                BackgroundTransparency = 1, 
                TextColor3 = v7.White, 
                TextScaled = true, 
                Text = v21, 
                TextSize = 36, 
                Font = l_AppFonts_0.default:getBlack(), 
                TextXAlignment = Enum.TextXAlignment.Left, 
                LayoutOrder = 2
            }, {
                TextSizeConstraint = v4.createElement("UITextSizeConstraint", {
                    MaxTextSize = 36
                })
            });
        end
    });
end;
return v5.UNSTABLE_connect2(function(v25, _) --[[ Line: 67 ]]
    return {
        view = v25.view, 
        playerName = v25.playerName, 
        playerId = v25.playerId, 
        locale = v25.locale
    };
end)(v12);