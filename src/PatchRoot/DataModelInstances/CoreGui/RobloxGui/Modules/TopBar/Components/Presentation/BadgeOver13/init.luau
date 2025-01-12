game:DefineFastString("TopBarBadgeLearnMoreLink", "https://roblox.com/info/community-guidelines");
local l_GamepadService_0 = game:GetService("GamepadService");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local l_List_0 = require(l_CorePackages_0.Packages.Cryo).List;
local v4 = require(script.AnalyticsContext);
local l_ExternalEventConnection_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).ExternalEventConnection;
local v6 = require(script.openWebview);
local v7 = require(script.BadgeOver13);
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local v9 = require(l_RobloxGui_0.Modules.RobloxTranslator);
local l_GetFFlagFixChromeReferences_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagFixChromeReferences;
local l_Chrome_0 = script.Parent.Parent.Parent.Parent.Chrome;
local v12 = require(l_Chrome_0.Enabled);
local v13 = if l_GetFFlagFixChromeReferences_0() then if v12() then require(l_Chrome_0.Service) else nil else if v12 then require(l_Chrome_0.Service) else nil;
local v14 = {
    TextFilter = "InGame.CommonUI.Badge.Popup.TextFilterOnlyInfo", 
    Voice = "InGame.CommonUI.Badge.Popup.VoiceInfo"
};
return function(v15) --[[ Line: 33 ]]
    -- upvalues: v2 (copy), l_GamepadService_0 (copy), v13 (copy), l_Chrome_0 (copy), l_List_0 (copy), v14 (copy), v9 (copy), v4 (copy), v7 (copy), v6 (copy), l_ExternalEventConnection_0 (copy)
    local l_player_0 = v15.player;
    local l_VREnabled_0 = v15.VRService.VREnabled;
    local v18, v19 = v2.useState(l_GamepadService_0.GamepadCursorEnabled);
    local v20, v21 = v2.useState(l_player_0.UnfilteredChat);
    local v22, v23 = v2.useState(false);
    v2.useEffect(function() --[[ Line: 41 ]]
        -- upvalues: v15 (copy), v23 (copy)
        v15.voiceChatServiceManager:asyncInit():andThen(function() --[[ Line: 42 ]]
            -- upvalues: v23 (ref)
            v23(true);
        end):catch(function() --[[ Line: 44 ]]

        end);
    end, {});
    local v24 = true;
    if v13 then
        v24 = require(l_Chrome_0.ChromeShared.Hooks.useChromeMenuStatus)() == v13.MenuStatus.Closed;
    end;
    local v25 = (not (l_VREnabled_0 ~= false) or v18 == true) and (v20 == true or v22 == true) and v24;
    if v15.visibilityChanged then
        v15.visibilityChanged(v25);
    end;
    local v26 = {};
    if v20 then
        table.insert(v26, "TextFilter");
    end;
    if v22 then
        table.insert(v26, "Voice");
    end;
    local v28 = l_List_0.map(v26, function(v27) --[[ Line: 69 ]]
        -- upvalues: v14 (ref), v9 (ref)
        if v14[v27] then
            return v9:FormatByKey(v14[v27]);
        else
            return nil;
        end;
    end);
    table.insert(v28, v9:FormatByKey("InGame.CommonUI.Badge.Popup.CommunityStandards"));
    return v2.createElement(v4.Provider, {
        value = {
            fireEvent = function(v29, v30) --[[ Line: 81 ]] --[[ Name: fireEvent ]]
                -- upvalues: v15 (copy)
                v15.analytics.EventStream:setRBXEventStream("TopBarBadge", v29, v30);
            end
        }
    }, {
        app = v2.createElement(v2.Fragment, nil, {
            badge = v2.createElement(v7, {
                layoutOrder = v15.layoutOrder, 
                bodyText = v28, 
                linkText = v9:FormatByKey("InGame.CommonUI.Badge.Popup.LearnMoreLink"), 
                openWebview = v2.useCallback(function() --[[ Line: 91 ]]
                    -- upvalues: v6 (ref)
                    local l_game_FastString_0 = game:GetFastString("TopBarBadgeLearnMoreLink");
                    v6(l_game_FastString_0);
                end), 
                visible = v25, 
                analyticsCopyType = table.concat(v26, "+")
            }), 
            gamepadCursorEnabledListener = l_GamepadService_0 and v2.createElement(l_ExternalEventConnection_0, {
                event = l_GamepadService_0:GetPropertyChangedSignal("GamepadCursorEnabled"), 
                callback = function() --[[ Line: 100 ]] --[[ Name: callback ]]
                    -- upvalues: v19 (copy), l_GamepadService_0 (ref)
                    v19(l_GamepadService_0.GamepadCursorEnabled);
                end
            }), 
            unfilteredChatListener = v2.createElement(l_ExternalEventConnection_0, {
                event = l_player_0:GetPropertyChangedSignal("UnfilteredChat"), 
                callback = function() --[[ Line: 106 ]] --[[ Name: callback ]]
                    -- upvalues: v21 (copy), l_player_0 (copy)
                    v21(l_player_0.UnfilteredChat);
                end
            })
        })
    });
end;