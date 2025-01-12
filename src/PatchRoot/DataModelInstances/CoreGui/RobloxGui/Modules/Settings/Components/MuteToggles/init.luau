local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.Packages.Roact);
local v5 = require(l_CorePackages_0.Packages.Cryo);
local v6 = require(l_CorePackages_0.Packages.Promise);
local v7 = require(l_CorePackages_0.Packages.t);
local v8 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local l_default_0 = require(l_Modules_0.VoiceChat.VoiceChatServiceManager).default;
local v11 = require(l_CorePackages_0.Workspace.Packages.CoreScriptsInitializer).CoreLogger:new(script.Name);
local v12 = require(l_Modules_0.VoiceChat.Constants);
local v13 = require(l_CorePackages_0.Packages.UIBlox);
local l_useStyle_0 = v13.Core.Style.useStyle;
local l_StyledTextLabel_0 = v13.App.Text.StyledTextLabel;
local l_Images_0 = v13.App.ImageSet.Images;
local l_ImageSetLabel_0 = v13.Core.ImageSet.ImageSetLabel;
local l_ExternalEventConnection_0 = v13.Utility.ExternalEventConnection;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local v20 = require(l_Modules_0.Settings.Components.DropdownMenu);
local v21 = require(l_RobloxGui_0.Modules.Flags.FFlagMuteNonFriendsEvent);
local v22 = require(l_RobloxGui_0.Modules.Settings.Flags.GetFFlagUseFriendsPropsInMuteToggles);
local v23 = require(l_RobloxGui_0.Modules.Settings.Flags.GetFFlagRetryMutingNonFriends);
local v24 = l_Images_0["icons/controls/headphoneDeafen"];
local v25 = {
    PlayerJoined = "playerJoined", 
    PlayerLeft = "playerLeft", 
    PlayerFriended = "playerFriended", 
    PlayerUnfriended = "playerUnfriended"
};
local v26 = {
    Nobody = 1, 
    Everyone = 2
};
local v27 = {
    Nobody = 1, 
    NonFriends = 2, 
    Everyone = 3
};
local v28 = v8.wrap(v7.strictInterface({
    Players = v7.union(v7.instanceOf("Players"), v7.interface({
        GetPlayers = v7.callback, 
        GetFriendsAsync = v7.callback, 
        LocalPlayer = v7.union(v7.instanceOf("Player"), v7.interface({
            UserId = v7.number, 
            FriendStatusChanged = v7.RBXScriptSignal
        }))
    })), 
    initialTogglesState = v7.boolean, 
    playersFriends = v7.table
}));
return function(v29) --[[ Line: 87 ]] --[[ Name: MuteToggles ]]
    -- upvalues: v28 (copy), l_useLocalization_0 (copy), l_useStyle_0 (copy), v3 (copy), v22 (copy), v26 (copy), l_default_0 (copy), v12 (copy), v5 (copy), v21 (copy), v27 (copy), v23 (copy), v25 (copy), v6 (copy), v11 (copy), v4 (copy), l_ImageSetLabel_0 (copy), v24 (copy), l_StyledTextLabel_0 (copy), v20 (copy), l_ExternalEventConnection_0 (copy)
    assert(v28(v29));
    local l_Players_0 = v29.Players;
    local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    local l_initialTogglesState_0 = v29.initialTogglesState;
    local v33 = l_useLocalization_0({
        muteLabel = "Feature.SettingsHub.Label.Mute", 
        nobodyLabel = "Feature.SettingsHub.Action.NobodyToggle", 
        nonFriendsLabel = "Feature.SettingsHub.Action.NonfriendsToggle", 
        everyoneLabel = "Feature.SettingsHub.Action.EveryoneToggle"
    });
    local v34 = v33.muteLabel == "" and "Mute" or v33.muteLabel;
    local v35 = v33.nobodyLabel == "" and "Nobody" or v33.nobodyLabel;
    local v36 = v33.nonFriendsLabel == "" and "Non-friends" or v33.nonFriendsLabel;
    local v37 = v33.everyoneLabel == "" and "Everyone" or v33.everyoneLabel;
    local v38 = l_useStyle_0();
    local l_SubHeader1_0 = v38.Font.SubHeader1;
    local v40, v41 = v3.useState(not v22());
    local v42, v43 = v3.useState(false);
    local v44, v45 = v3.useState(false);
    local v46, v47 = v3.useState({});
    local v48, v49 = v3.useState(if not l_initialTogglesState_0 then v26.Nobody else v26.Everyone);
    local v50, v51 = v3.useState({});
    local v52 = nil;
    local v53 = nil;
    if v22() then
        local v54, v55 = v3.useState({
            v35, 
            v36, 
            v37
        });
        v52 = v54;
        v53 = v55;
    else
        local v56, v57 = v3.useState({
            v35, 
            v37
        });
        v52 = v56;
        v53 = v57;
    end;
    local v58 = v3.useCallback(function() --[[ Line: 121 ]]
        -- upvalues: l_default_0 (ref), v12 (ref)
        l_default_0:MuteAll(true, v12.VOICE_CONTEXT_TYPE.MUTE_TOGGLES);
    end);
    local v59 = v3.useCallback(function() --[[ Line: 125 ]]
        -- upvalues: l_default_0 (ref), v12 (ref)
        l_default_0:MuteAll(false, v12.VOICE_CONTEXT_TYPE.MUTE_TOGGLES);
    end);
    local v61 = v3.useCallback(function(v60) --[[ Line: 129 ]]
        -- upvalues: v5 (ref), l_default_0 (ref), v12 (ref), v21 (ref)
        if not v5.isEmpty(v60) then
            l_default_0:ToggleMuteSome(v60, true, v12.VOICE_GROUP_TYPE.NONFRIENDS, v12.VOICE_CONTEXT_TYPE.MUTE_TOGGLES);
        end;
        if v21 then
            l_default_0:FireMuteNonFriendsEvent();
        end;
    end);
    local v63 = v3.useCallback(function(v62) --[[ Line: 143 ]]
        -- upvalues: v5 (ref), l_default_0 (ref), v12 (ref)
        if not v5.isEmpty(v62) then
            l_default_0:ToggleMuteSome(v62, false, v12.VOICE_GROUP_TYPE.FRIENDS, v12.VOICE_CONTEXT_TYPE.MUTE_TOGGLES);
        end;
    end);
    local v70 = v3.useCallback(function(v64) --[[ Line: 154 ]]
        -- upvalues: v49 (copy), v27 (ref), v59 (copy), v40 (copy), v42 (copy), v22 (ref), v29 (copy), v50 (copy), v63 (copy), v61 (copy), v23 (ref), l_default_0 (ref), v58 (copy)
        v49(v64);
        if v64 == v27.Nobody then
            v59();
            return;
        else
            if v64 == v27.NonFriends and not v40 and not v42 then
                local v65 = if v22() then v29.playersFriends else v50;
                local v66 = {};
                local v67 = {};
                for v68, v69 in pairs(v65) do
                    table.insert(if v69 then v67 else v66, v68);
                end;
                v63(v67);
                v61(v66);
                if v23() then
                    task.delay(0.25, function() --[[ Line: 169 ]]
                        -- upvalues: l_default_0 (ref), v66 (copy), v67 (copy)
                        l_default_0:EnsureCorrectMuteState(v66, true);
                        l_default_0:EnsureCorrectMuteState(v67, false);
                    end);
                    return;
                end;
            else
                v58();
            end;
            return;
        end;
    end);
    local v73 = v3.useCallback(function(v71) --[[ Line: 179 ]]
        -- upvalues: v40 (copy), v42 (copy), v26 (ref), v27 (ref), v49 (copy)
        local v72 = if not not v40 or v42 then v26.Everyone else v27.Everyone;
        v49(if v71 then v72 else v27.Nobody);
    end);
    local v76 = v3.useCallback(function(v74, v75) --[[ Line: 189 ]]
        -- upvalues: v42 (copy), v48 (copy), v27 (ref), l_default_0 (ref)
        if not v42 and v48 == v27.NonFriends then
            l_default_0:ToggleMuteSome({
                v74
            }, v75);
        end;
    end);
    local v79 = v3.useCallback(function(v77) --[[ Line: 195 ]]
        -- upvalues: v50 (copy), v51 (copy), v5 (ref), v76 (copy)
        if not v50[v77] then
            v51(function(v78) --[[ Line: 199 ]]
                -- upvalues: v5 (ref), v77 (copy)
                return v5.Dictionary.join(v78, {
                    [v77] = false
                });
            end);
            v76(v77, true);
        end;
    end);
    local v82 = v3.useCallback(function(v80) --[[ Line: 217 ]]
        -- upvalues: v50 (copy), v51 (copy), v5 (ref)
        if not v50[v80] then
            v51(function(v81) --[[ Line: 219 ]]
                -- upvalues: v5 (ref), v80 (copy)
                return v5.Dictionary.join(v81, {
                    [v80] = v5.None
                });
            end);
        end;
    end);
    local v87 = v3.useCallback(function(v83, v84) --[[ Line: 227 ]]
        -- upvalues: v25 (ref), v50 (copy), v51 (copy), v5 (ref), v76 (copy)
        if v84 == v25.PlayerFriended then
            if not v50[v83] then
                v51(function(v85) --[[ Line: 232 ]]
                    -- upvalues: v5 (ref), v83 (copy)
                    return v5.Dictionary.join(v85, {
                        [v83] = true
                    });
                end);
            end;
            v76(v83, false);
            return;
        else
            if v84 == v25.PlayerUnfriended then
                if v50[v83] then
                    v51(function(v86) --[[ Line: 246 ]]
                        -- upvalues: v5 (ref), v83 (copy)
                        return v5.Dictionary.join(v86, {
                            [v83] = false
                        });
                    end);
                end;
                v76(v83, true);
            end;
            return;
        end;
    end);
    local v91 = v3.useCallback(function(v88, v89) --[[ Line: 259 ]]
        -- upvalues: v47 (copy), v5 (ref)
        v47(function(v90) --[[ Line: 260 ]]
            -- upvalues: v5 (ref), v88 (copy), v89 (copy)
            return v5.Dictionary.join(v90, {
                [#v90 + 1] = {
                    UserId = v88, 
                    Action = v89
                }
            });
        end);
    end);
    if not v22() then
        v3.useEffect(function() --[[ Line: 279 ]]
            -- upvalues: v40 (copy), v42 (copy), l_initialTogglesState_0 (copy), v48 (copy), v26 (ref), v49 (copy), v27 (ref)
            if not v40 and not v42 and (l_initialTogglesState_0 or v48 == v26.Everyone) then
                v49(v27.Everyone);
            end;
        end, {
            v40
        });
        v3.useEffect(function() --[[ Line: 287 ]]
            -- upvalues: v6 (ref), l_LocalPlayer_0 (copy), l_Players_0 (copy), v5 (ref), v51 (copy), v41 (copy), v53 (ref), v35 (copy), v36 (copy), v37 (copy), v43 (copy), v11 (ref)
            local _ = function() --[[ Line: 288 ]] --[[ Name: getUsersFriendsList ]]
                -- upvalues: v6 (ref), l_LocalPlayer_0 (ref), l_Players_0 (ref)
                return v6.new(function(v92, v93) --[[ Line: 289 ]]
                    -- upvalues: l_LocalPlayer_0 (ref), l_Players_0 (ref)
                    coroutine.wrap(function() --[[ Line: 290 ]]
                        -- upvalues: l_LocalPlayer_0 (ref), l_Players_0 (ref), v93 (copy), v92 (copy)
                        local l_status_0, l_result_0 = pcall(function() --[[ Line: 291 ]]
                            -- upvalues: l_LocalPlayer_0 (ref), l_Players_0 (ref)
                            if l_LocalPlayer_0 then
                                return (l_Players_0:GetFriendsAsync(l_LocalPlayer_0.UserId));
                            else
                                return nil;
                            end;
                        end);
                        if not l_status_0 then
                            v93("Error loading friends");
                            return;
                        else
                            local v96 = {};
                            if l_result_0 then
                                while true do
                                    for _, v98 in l_result_0:GetCurrentPage() do
                                        v96[v98.Id] = true;
                                    end;
                                    if not l_result_0.IsFinished then
                                        if not pcall(function() --[[ Line: 308 ]]
                                            -- upvalues: l_result_0 (copy)
                                            l_result_0:AdvanceToNextPageAsync();
                                        end) then
                                            v93("Error loading friends");
                                            return;
                                        end;
                                    else
                                        break;
                                    end;
                                end;
                            end;
                            v92(v96);
                            return;
                        end;
                    end)();
                end);
            end;
            local function v100(v101) --[[ Line: 326 ]] --[[ Name: getUsersFriendsListWithRetries ]]
                -- upvalues: v6 (ref), l_LocalPlayer_0 (ref), l_Players_0 (ref), v100 (copy)
                return v6.new(function(v102, v103) --[[ Line: 289 ]]
                    -- upvalues: l_LocalPlayer_0 (ref), l_Players_0 (ref)
                    coroutine.wrap(function() --[[ Line: 290 ]]
                        -- upvalues: l_LocalPlayer_0 (ref), l_Players_0 (ref), v103 (copy), v102 (copy)
                        local l_status_1, l_result_1 = pcall(function() --[[ Line: 291 ]]
                            -- upvalues: l_LocalPlayer_0 (ref), l_Players_0 (ref)
                            if l_LocalPlayer_0 then
                                return (l_Players_0:GetFriendsAsync(l_LocalPlayer_0.UserId));
                            else
                                return nil;
                            end;
                        end);
                        if not l_status_1 then
                            v103("Error loading friends");
                            return;
                        else
                            local v106 = {};
                            if l_result_1 then
                                while true do
                                    for _, v108 in l_result_1:GetCurrentPage() do
                                        v106[v108.Id] = true;
                                    end;
                                    if not l_result_1.IsFinished then
                                        if not pcall(function() --[[ Line: 308 ]]
                                            -- upvalues: l_result_1 (copy)
                                            l_result_1:AdvanceToNextPageAsync();
                                        end) then
                                            v103("Error loading friends");
                                            return;
                                        end;
                                    else
                                        break;
                                    end;
                                end;
                            end;
                            v102(v106);
                            return;
                        end;
                    end)();
                end):catch(function() --[[ Line: 327 ]]
                    -- upvalues: v101 (copy), v100 (ref), v6 (ref)
                    if v101 > 0 then
                        return (v100(v101 - 1));
                    else
                        return (v6.reject());
                    end;
                end);
            end;
            local v116 = v6.new(function(v109, v110) --[[ Line: 289 ]]
                -- upvalues: l_LocalPlayer_0 (ref), l_Players_0 (ref)
                coroutine.wrap(function() --[[ Line: 290 ]]
                    -- upvalues: l_LocalPlayer_0 (ref), l_Players_0 (ref), v110 (copy), v109 (copy)
                    local l_status_2, l_result_2 = pcall(function() --[[ Line: 291 ]]
                        -- upvalues: l_LocalPlayer_0 (ref), l_Players_0 (ref)
                        if l_LocalPlayer_0 then
                            return (l_Players_0:GetFriendsAsync(l_LocalPlayer_0.UserId));
                        else
                            return nil;
                        end;
                    end);
                    if not l_status_2 then
                        v110("Error loading friends");
                        return;
                    else
                        local v113 = {};
                        if l_result_2 then
                            while true do
                                for _, v115 in l_result_2:GetCurrentPage() do
                                    v113[v115.Id] = true;
                                end;
                                if not l_result_2.IsFinished then
                                    if not pcall(function() --[[ Line: 308 ]]
                                        -- upvalues: l_result_2 (copy)
                                        l_result_2:AdvanceToNextPageAsync();
                                    end) then
                                        v110("Error loading friends");
                                        return;
                                    end;
                                else
                                    break;
                                end;
                            end;
                        end;
                        v109(v113);
                        return;
                    end;
                end)();
            end);
            local v117 = 3;
            v116:catch(function() --[[ Line: 327 ]]
                -- upvalues: v117 (copy), v100 (copy), v6 (ref)
                if v117 > 0 then
                    return (v100(v117 - 1));
                else
                    return (v6.reject());
                end;
            end):andThen(function(v118) --[[ Line: 334 ]]
                -- upvalues: l_Players_0 (ref), l_LocalPlayer_0 (ref), v5 (ref), v51 (ref), v41 (ref), v53 (ref), v35 (ref), v36 (ref), v37 (ref)
                local v119 = {};
                for _, v121 in (l_Players_0:GetPlayers()) do
                    if l_LocalPlayer_0 and v121 and not v118[v121.UserId] then
                        v119[v121.UserId] = false;
                    end;
                end;
                local v122 = v5.Dictionary.join(v118, v119);
                v51(v122);
                v41(false);
                v53({
                    v35, 
                    v36, 
                    v37
                });
            end):catch(function() --[[ Line: 350 ]]
                -- upvalues: v41 (ref), v43 (ref), v11 (ref)
                v41(false);
                v43(true);
                v11:warning("MuteToggles: Failed to get list of friends from GetFriendsAsync");
            end);
        end, {});
        v3.useEffect(function() --[[ Line: 367 ]]
            -- upvalues: v40 (copy), v44 (copy), v5 (ref), v46 (copy), v45 (copy), v25 (ref), v79 (copy), v82 (copy), v87 (copy), v47 (copy)
            if not v40 and not v44 and not v5.isEmpty(v46) then
                v45(true);
                local v123 = v46[1];
                if v123.Action == v25.PlayerJoined then
                    v79(v123.UserId);
                elseif v123.Action == v25.PlayerLeft then
                    v82(v123.UserId);
                else
                    v87(v123.UserId, v123.Action);
                end;
                v47(function(v124) --[[ Line: 379 ]]
                    -- upvalues: v5 (ref)
                    return v5.List.removeIndex(v124, 1);
                end);
                v45(false);
            end;
        end, {
            v44, 
            v46, 
            v40
        });
    end;
    return v4.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 40), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        LayoutOrder = 1, 
        ZIndex = 3
    }, {
        UIListLayout = v4.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        UIPadding = v4.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, 12), 
            PaddingRight = UDim.new(0, 12)
        }), 
        MuteFrame = v4.createElement("Frame", {
            Size = UDim2.new(0.5, 0, 0, 40), 
            BorderSizePixel = 0, 
            LayoutOrder = 1, 
            BackgroundTransparency = 1
        }, {
            UIListLayout = v4.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            UIPadding = v4.createElement("UIPadding", {
                PaddingLeft = if v38.UIBloxThemeEnabled then UDim.new(0, 4) else UDim.new(0, -1)
            }), 
            ImageSetLabel = v4.createElement(l_ImageSetLabel_0, {
                Image = v24, 
                BackgroundTransparency = 1, 
                Size = UDim2.new(0, 38, 0, 38), 
                LayoutOrder = 1
            }), 
            TextFrame = v4.createElement("Frame", {
                Size = UDim2.new(0.6, 0, 0, 40), 
                BorderSizePixel = 0, 
                LayoutOrder = 2, 
                BackgroundTransparency = 1
            }, {
                UIPadding = v4.createElement("UIPadding", {
                    PaddingLeft = if v38.UIBloxThemeEnabled then UDim.new(0, 6) else UDim.new(0, 11)
                }), 
                TextLabel = v4.createElement(l_StyledTextLabel_0, {
                    text = v34, 
                    fontStyle = l_SubHeader1_0, 
                    textXAlignment = Enum.TextXAlignment.Left, 
                    colorStyle = {
                        Color = Color3.new(1, 1, 1), 
                        Transparency = 0
                    }, 
                    size = UDim2.new(1, 0, 0, 40)
                })
            })
        }), 
        DropdownMenu = v4.createElement(v20, {
            buttonSize = UDim2.new(0.5, 0, 0, 40), 
            dropdownList = v52, 
            selectedIndex = v48, 
            onSelection = v70, 
            layoutOrder = 2
        }), 
        MuteAllChangedEvent = if l_default_0.muteAllChanged then v4.createElement(l_ExternalEventConnection_0, {
            event = l_default_0.muteAllChanged.Event, 
            callback = v73
        }) else nil, 
        PlayerJoinedVoiceEvent = v4.createElement(l_ExternalEventConnection_0, {
            event = l_default_0.participantJoined.Event, 
            callback = function(_, v126) --[[ Line: 460 ]] --[[ Name: callback ]]
                -- upvalues: v22 (ref), v29 (copy), v76 (copy), v91 (copy), v25 (ref)
                if v22() then
                    if not v29.playersFriends[v126] then
                        v76(v126, true);
                        return;
                    end;
                else
                    v91(v126, v25.PlayerJoined);
                end;
            end
        }), 
        PlayerLeftVoiceEvent = if not v22() then v4.createElement(l_ExternalEventConnection_0, {
            event = l_default_0.participantLeft.Event, 
            callback = function(_, v128) --[[ Line: 473 ]] --[[ Name: callback ]]
                -- upvalues: v91 (copy), v25 (ref)
                v91(v128, v25.PlayerLeft);
            end
        }) else nil, 
        FriendStatusChangeEvent = if l_LocalPlayer_0 then v4.createElement(l_ExternalEventConnection_0, {
            event = l_LocalPlayer_0.FriendStatusChanged, 
            callback = function(v129, v130) --[[ Line: 481 ]] --[[ Name: callback ]]
                -- upvalues: v22 (ref), v76 (copy), v91 (copy), v25 (ref)
                if v130 == Enum.FriendStatus.Friend then
                    if v22() then
                        v76(v129.UserId, false);
                        return;
                    else
                        v91(v129.UserId, v25.PlayerFriended);
                        return;
                    end;
                elseif v22() then
                    v76(v129.UserId, true);
                    return;
                else
                    v91(v129.UserId, v25.PlayerUnfriended);
                    return;
                end;
            end
        }) else nil
    });
end;