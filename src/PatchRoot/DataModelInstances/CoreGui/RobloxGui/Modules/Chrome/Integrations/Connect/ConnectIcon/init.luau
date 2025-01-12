local l_script_FirstAncestor_0 = script:FindFirstAncestor("Chrome");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Cryo);
local v3 = require(l_CorePackages_0.Packages.Foundation);
local v4 = require(l_CorePackages_0.Packages.React);
local v5 = require(l_CorePackages_0.Packages.UIBlox);
local v6 = require(l_script_FirstAncestor_0.Integrations.CommonIcon);
local v7 = require(l_script_FirstAncestor_0.Integrations.CommonFtuxTooltip);
local v8 = require(l_script_FirstAncestor_0.ChromeShared.Unibar.Constants);
local v9 = require(l_script_FirstAncestor_0.ChromeShared.Service.ChromeUtils);
local v10 = require(l_script_FirstAncestor_0.ChromeShared.Hooks.useMappedSignal);
local v11 = require(l_script_FirstAncestor_0.Integrations.Party.usePartyIcon);
local l_dependencyArray_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.dependencyArray;
local l_MappedSignal_0 = v9.MappedSignal;
local l_useStyle_0 = v5.Core.Style.useStyle;
local l_useTokens_0 = v3.Hooks.useTokens;
local v16 = require(l_script_FirstAncestor_0.ChromeShared.Unibar.SubMenuContext);
local l_GetFFlagAnimateSubMenu_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagAnimateSubMenu;
local v18 = require(l_CorePackages_0.Workspace.Packages.AppChat);
local l_InExperienceAppChatModal_0 = v18.App.InExperienceAppChatModal;
local l_InExperienceAppChatExperimentation_0 = v18.App.InExperienceAppChatExperimentation;
local l_FFlagEnableUnibarFtuxTooltips_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableUnibarFtuxTooltips;
local v22 = require(l_script_FirstAncestor_0.Flags.GetFFlagAppChatInExpConnectIconRedesign);
local v23 = require(l_script_FirstAncestor_0.Flags.GetFStringConnectTooltipLocalStorageKey);
local v24 = require(l_script_FirstAncestor_0.Flags.GetFIntRobloxConnectFtuxShowDelayMs);
local v25 = require(l_script_FirstAncestor_0.Flags.GetFIntRobloxConnectFtuxDismissDelayMs);
local l_getAppChatNavbarItemConfig_0 = v18.Utils.getAppChatNavbarItemConfig;
local l_GetFFlagAppChatRebrandStringUpdates_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagAppChatRebrandStringUpdates;
local v28 = game:DefineFastFlag("ConnectIconUsesAppChatConfig", false);
local v29 = "icons/menu/platformChatOff";
local v30 = "icons/menu/platformChatOn";
if v28 then
    local v31 = l_getAppChatNavbarItemConfig_0();
    v29 = v31.icon.off;
    v30 = v31.icon.on;
end;
local l_ICON_SIZE_0 = v8.ICON_SIZE;
local v33 = UDim2.fromOffset(10, 10);
local v34 = {
    integrationId = "", 
    shouldShowCustomBadge = true, 
    isSquadIndicatorEnabled = false
};
return function(v35) --[[ Line: 70 ]] --[[ Name: ConnectIcon ]]
    -- upvalues: v2 (copy), v34 (copy), l_useStyle_0 (copy), v4 (copy), l_InExperienceAppChatModal_0 (copy), l_dependencyArray_0 (copy), v22 (copy), l_useTokens_0 (copy), l_MappedSignal_0 (copy), l_FFlagEnableUnibarFtuxTooltips_0 (copy), l_InExperienceAppChatExperimentation_0 (copy), v7 (copy), l_GetFFlagAppChatRebrandStringUpdates_0 (copy), v23 (copy), v24 (copy), v25 (copy), v10 (copy), v11 (copy), l_ICON_SIZE_0 (copy), v30 (ref), v29 (ref), v16 (copy), l_GetFFlagAnimateSubMenu_0 (copy), v3 (copy), v6 (copy), v33 (copy)
    local v36 = v2.Dictionary.union(v34, v35);
    local v37 = l_useStyle_0();
    local v38, v39 = v4.useState(l_InExperienceAppChatModal_0.default.unreadCount);
    if v36.shouldShowCustomBadge then
        v4.useEffect(function() --[[ Line: 77 ]]
            -- upvalues: l_InExperienceAppChatModal_0 (ref), v39 (copy)
            local v41 = l_InExperienceAppChatModal_0.default.unreadCountSignal.Event:Connect(function(v40) --[[ Line: 78 ]]
                -- upvalues: v39 (ref)
                v39(v40);
            end);
            return function() --[[ Line: 81 ]]
                -- upvalues: v41 (copy)
                v41:Disconnect();
            end;
        end, {
            v39
        });
    else
        v38 = 0;
    end;
    local v42 = nil;
    local v43 = nil;
    local v44 = nil;
    if v36.isSquadIndicatorEnabled then
        local v45, v46 = v4.useState(l_InExperienceAppChatModal_0.default.currentSquadId);
        v42 = v45;
        v43 = v46;
    end;
    v4.useEffect(function() --[[ Line: 94 ]]
        -- upvalues: v36 (copy), l_InExperienceAppChatModal_0 (ref), v43 (ref)
        if v36.isSquadIndicatorEnabled then
            local v48 = l_InExperienceAppChatModal_0.default.currentSquadIdSignal.Event:Connect(function(v47) --[[ Line: 97 ]]
                -- upvalues: v43 (ref)
                v43(v47);
            end);
            return function() --[[ Line: 101 ]]
                -- upvalues: v48 (copy)
                v48:Disconnect();
            end;
        else
            return function() --[[ Line: 105 ]]

            end;
        end;
    end, l_dependencyArray_0(v36.isSquadIndicatorEnabled, v43));
    if v36.isSquadIndicatorEnabled then
        if v22() then
            local v49 = l_useTokens_0();
            if v42 ~= "" then
                v44 = v49.Color.System.Success;
            elseif v38 > 0 then
                v44 = v49.Color.System.Contrast;
            end;
        elseif v42 ~= "" then
            v44 = v37.Theme.OnlineStatus.Color;
        elseif v38 > 0 then
            v44 = v37.Theme.IconEmphasis.Color;
        end;
    end;
    local v50 = if v36.isSquadIndicatorEnabled then v44 else v38 > 0;
    local v52 = l_MappedSignal_0.new(l_InExperienceAppChatModal_0.default.visibilitySignal.Event, function(_) --[[ Line: 127 ]]
        -- upvalues: l_InExperienceAppChatModal_0 (ref)
        return l_InExperienceAppChatModal_0:getVisible();
    end);
    local v53 = if l_FFlagEnableUnibarFtuxTooltips_0 and l_InExperienceAppChatExperimentation_0.default.variant.ShowPlatformChatChromeUnibarEntryPoint then v7({
        isIconVisible = v36.isIconVisible, 
        headerKey = l_GetFFlagAppChatRebrandStringUpdates_0() and "CoreScripts.FTUX.Heading.CheckOutRobloxParty" or "CoreScripts.FTUX.Heading.CheckOutRobloxConnect", 
        bodyKey = l_GetFFlagAppChatRebrandStringUpdates_0() and "CoreScripts.FTUX.Label.PartyWithYourFriendsAnytime" or "CoreScripts.FTUX.Label.ChatWithYourFriendsAnytime", 
        localStorageKey = v23(), 
        showDelay = v24(), 
        dismissDelay = v25()
    }) else nil;
    if v22() then
        local v54 = l_useTokens_0();
        local v55 = v10(v52);
        local v56 = v11(l_ICON_SIZE_0, 24, if v55 then v30 else v29);
        local v57 = v4.useContext(v16);
        local function _(v58) --[[ Line: 156 ]] --[[ Name: getTransparency ]]
            -- upvalues: l_GetFFlagAnimateSubMenu_0 (ref), v57 (copy)
            if l_GetFFlagAnimateSubMenu_0() and v57 then
                return (v57:map(function(v59) --[[ Line: 158 ]]
                    -- upvalues: v58 (copy)
                    return v58 + (1 - v58) * (1 - v59);
                end));
            else
                return v58;
            end;
        end;
        local l_createElement_0 = v4.createElement;
        local l_View_0 = v3.View;
        local v63 = {
            Size = UDim2.new(0, l_ICON_SIZE_0, 0, l_ICON_SIZE_0)
        };
        local v64 = {};
        local l_createElement_1 = v4.createElement;
        local l_Image_0 = v3.Image;
        local v68 = {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.fromScale(0.5, 0.5), 
            Size = v56.size:map(function(v67) --[[ Line: 170 ]]
                return UDim2.fromOffset(v67, v67);
            end)
        };
        local v69;
        if v56.image.backgroundColor then
            v69 = {
                Color3 = v56.image.backgroundColor
            };
            local v70;
            if l_GetFFlagAnimateSubMenu_0() and v57 then
                local v71 = 0;
                v70 = v57:map(function(v72) --[[ Line: 158 ]]
                    -- upvalues: v71 (copy)
                    return v71 + (1 - v71) * (1 - v72);
                end);
            else
                v70 = 0;
            end;
            v69.Transparency = v70;
        else
            v69 = v54.Color.None;
        end;
        v68.backgroundStyle = v69;
        v68.cornerRadius = UDim.new(0, v54.Radius.Circle);
        v68.Image = v56.image.thumbnail;
        v69 = {
            Color3 = v54.Color.Content.Emphasis.Color3
        };
        local l_Transparency_0 = v54.Color.Content.Emphasis.Transparency;
        local l_l_Transparency_0_0 = l_Transparency_0 --[[ copy: 25 -> 28 ]];
        v69.Transparency = if l_GetFFlagAnimateSubMenu_0() and v57 then v57:map(function(v75) --[[ Line: 158 ]]
            -- upvalues: l_l_Transparency_0_0 (copy)
            return l_l_Transparency_0_0 + (1 - l_l_Transparency_0_0) * (1 - v75);
        end) else l_Transparency_0;
        v68.imageStyle = v69;
        v64.Icon = l_createElement_1(l_Image_0, v68);
        v64.Tooltip = v53;
        if v50 then
            l_createElement_1 = v4.createElement;
            l_Image_0 = v3.View;
            v68 = {
                Position = UDim2.new(1, -v54.Stroke.Thicker, 0, v54.Stroke.Thicker)
            };
            if v36.isSquadIndicatorEnabled then
                v69 = {
                    Color3 = v44.Color3
                };
                l_Transparency_0 = v44.Transparency;
                local l_l_Transparency_0_1 = l_Transparency_0 --[[ copy: 25 -> 30 ]];
                v69.Transparency = if l_GetFFlagAnimateSubMenu_0() and v57 then v57:map(function(v77) --[[ Line: 158 ]]
                    -- upvalues: l_l_Transparency_0_1 (copy)
                    return l_l_Transparency_0_1 + (1 - l_l_Transparency_0_1) * (1 - v77);
                end) else l_Transparency_0;
            else
                v69 = {
                    Color3 = v54.Color.System.Contrast.Color3
                };
                l_Transparency_0 = v54.Color.System.Contrast.Transparency;
                local l_l_Transparency_0_2 = l_Transparency_0 --[[ copy: 25 -> 29 ]];
                v69.Transparency = if l_GetFFlagAnimateSubMenu_0() and v57 then v57:map(function(v79) --[[ Line: 158 ]]
                    -- upvalues: l_l_Transparency_0_2 (copy)
                    return l_l_Transparency_0_2 + (1 - l_l_Transparency_0_2) * (1 - v79);
                end) else l_Transparency_0;
            end;
            v68.backgroundStyle = v69;
            v69 = {
                Color = v54.Color.Surface.Surface_0.Color3
            };
            l_Transparency_0 = v54.Color.Surface.Surface_0.Transparency;
            v69.Transparency = if l_GetFFlagAnimateSubMenu_0() and v57 then v57:map(function(v80) --[[ Line: 158 ]]
                -- upvalues: l_Transparency_0 (copy)
                return l_Transparency_0 + (1 - l_Transparency_0) * (1 - v80);
            end) else l_Transparency_0;
            v69.Thickness = v54.Stroke.Thicker;
            v68.stroke = v69;
            v68.tag = "anchor-top-right radius-circle size-200 stroke-thicker";
            v68.ZIndex = 2;
            l_createElement_1 = l_createElement_1(l_Image_0, v68);
        else
            l_createElement_1 = nil;
        end;
        v64.Badge = l_createElement_1;
        return l_createElement_0(l_View_0, v63, v64);
    else
        local v81 = v6(v29, v30, v52);
        local v82 = v4.useContext(v16);
        local function _() --[[ Line: 214 ]] --[[ Name: getTransparencyFix ]]
            -- upvalues: l_GetFFlagAnimateSubMenu_0 (ref), v82 (copy), v37 (copy)
            if l_GetFFlagAnimateSubMenu_0() and v82 then
                return (v82:map(function(v83) --[[ Line: 216 ]]
                    -- upvalues: v37 (ref)
                    return v37.Theme.IconEmphasis.Transparency + (1 - v37.Theme.IconEmphasis.Transparency) * (1 - v83);
                end));
            else
                return v37.Theme.IconEmphasis.Transparency;
            end;
        end;
        return v4.createElement("Frame", {
            Size = UDim2.new(0, l_ICON_SIZE_0, 0, l_ICON_SIZE_0), 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1
        }, {
            UICorner = v4.createElement("UICorner", {
                CornerRadius = UDim.new(1, 0)
            }), 
            Icon = v81, 
            Tooltip = v53, 
            Badge = if v50 then v4.createElement("Frame", {
                BackgroundColor3 = if v36.isSquadIndicatorEnabled then v44 else v37.Theme.IconEmphasis.Color, 
                Position = UDim2.new(1, -2, 0, 2), 
                AnchorPoint = Vector2.new(1, 0), 
                Size = v33, 
                Transparency = if l_GetFFlagAnimateSubMenu_0() and v82 then v82:map(function(v85) --[[ Line: 216 ]]
                    -- upvalues: v37 (copy)
                    return v37.Theme.IconEmphasis.Transparency + (1 - v37.Theme.IconEmphasis.Transparency) * (1 - v85);
                end) else v37.Theme.IconEmphasis.Transparency
            }, {
                UICorner = v4.createElement("UICorner", {
                    CornerRadius = UDim.new(1, 0)
                }), 
                UIStroke = v4.createElement("UIStroke", {
                    Color = v37.Tokens.Semantic.Color.Common.BadgeContent.Color3, 
                    Transparency = if l_GetFFlagAnimateSubMenu_0() and v82 then v82:map(function(v86) --[[ Line: 216 ]]
                        -- upvalues: v37 (copy)
                        return v37.Theme.IconEmphasis.Transparency + (1 - v37.Theme.IconEmphasis.Transparency) * (1 - v86);
                    end) else v37.Theme.IconEmphasis.Transparency, 
                    Thickness = 2
                })
            }) else nil
        });
    end;
end;