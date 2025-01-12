local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Players_0 = game:GetService("Players");
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.Packages.Roact);
local l_GetFFlagIrisBlockUnfriendMenuFix_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagIrisBlockUnfriendMenuFix;
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_ContactList_0 = l_RobloxGui_0.Modules.ContactList;
local v8 = require(l_RobloxGui_0.Modules.PlayerList.Thunks.BlockPlayer);
local v9 = require(l_ContactList_0.dependencies);
local l_UnfriendTargetUserId_0 = v9.NetworkingFriends.UnfriendTargetUserId;
local l_UIBlox_0 = v9.UIBlox;
local l_useSelector_0 = v9.Hooks.useSelector;
local l_useDispatch_0 = v9.Hooks.useDispatch;
local l_useLocalization_0 = v9.Hooks.useLocalization;
local v15 = require(l_ContactList_0.Actions.CloseCFM);
local v16 = require(l_ContactList_0.Analytics.useAnalytics);
local v17 = require(l_ContactList_0.Analytics.EventNamesEnum);
local v18 = require(l_ContactList_0.Components.ContactListCommon.ConfigureFriendMenu);
local v19 = require(l_ContactList_0.Enums.FriendAction);
local v20 = require(l_ContactList_0.Actions.UpdateLastFriend);
local l_useStyle_0 = l_UIBlox_0.Core.Style.useStyle;
local l_withStyle_0 = l_UIBlox_0.Style.withStyle;
local l_InteractiveAlert_0 = l_UIBlox_0.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = l_UIBlox_0.App.Button.Enum.ButtonType;
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local v26 = l_LocalPlayer_0 and l_LocalPlayer_0.UserId or 0;
return function() --[[ Line: 45 ]] --[[ Name: PlayerMenuContainer ]]
    -- upvalues: v16 (copy), l_useStyle_0 (copy), l_useDispatch_0 (copy), l_useSelector_0 (copy), l_useLocalization_0 (copy), v3 (copy), v19 (copy), v8 (copy), v20 (copy), l_UnfriendTargetUserId_0 (copy), v26 (copy), v17 (copy), v18 (copy), l_withStyle_0 (copy), v4 (copy), l_InteractiveAlert_0 (copy), l_ButtonType_0 (copy), v15 (copy), l_CoreGui_0 (copy), l_GetFFlagIrisBlockUnfriendMenuFix_0 (copy)
    local v27 = v16();
    local l_Theme_0 = l_useStyle_0().Theme;
    local v29 = l_useDispatch_0();
    local v31 = l_useSelector_0(function(v30) --[[ Line: 52 ]]
        return v30.PlayerMenu.isOpen;
    end);
    local v33 = l_useSelector_0(function(v32) --[[ Line: 56 ]]
        return v32.PlayerMenu.friend;
    end);
    local v34 = l_useLocalization_0({
        blockTitle = {
            "Feature.Call.Label.Block"; 
            combinedName = v33.combinedName
        }, 
        blockAction = "Feature.Friends.Action.Block", 
        unfriendTitle = {
            "Feature.Call.Label.Unfriend"; 
            combinedName = v33.combinedName
        }, 
        unfriendAction = "Feature.Friends.Action.Unfriend", 
        cancelAction = "Feature.Friends.Label.Cancel", 
        confirmationDescription = {
            "Feature.SettingsHub.Message.BlockConfirmation"; 
            DISPLAY_NAME = v33.combinedName, 
            RBX_NAME = v33.userName
        }
    });
    local v35, v36 = v3.useState(v19.NoAction);
    local v37, v38 = v3.useState(Vector2.new(0, 0));
    local v39, v40 = v3.useState("");
    local v41, v42 = v3.useState("");
    local v46 = v3.useCallback(function() --[[ Line: 74 ]]
        -- upvalues: v35 (copy), v19 (ref), v29 (copy), v8 (ref), v33 (copy), v20 (ref), l_UnfriendTargetUserId_0 (ref), v26 (ref), v27 (copy), v17 (ref)
        if v35 == v19.Block then
            v29(v8({
                UserId = v33.userId
            }));
            v29(v20(v33.userId));
            return;
        else
            if v35 == v19.Unfriend then
                local v43 = l_UnfriendTargetUserId_0.API({
                    currentUserId = v26, 
                    targetUserId = v33.userId
                });
                v29(v43):andThen(function(_) --[[ Line: 86 ]]
                    -- upvalues: v27 (ref), v17 (ref), v33 (ref), v29 (ref), v20 (ref)
                    v27.fireEvent(v17.PhoneBookPlayerMenuUnfriendFinished, {
                        eventTimestampMs = os.time() * 1000, 
                        friendUserId = v33.userId, 
                        success = true
                    });
                    v29(v20(v33.userId));
                end):catch(function(_) --[[ Line: 94 ]]
                    -- upvalues: v27 (ref), v17 (ref), v33 (ref)
                    v27.fireEvent(v17.PhoneBookPlayerMenuUnfriendFinished, {
                        eventTimestampMs = os.time() * 1000, 
                        friendUserId = v33.userId, 
                        success = false
                    });
                end);
            end;
            return;
        end;
    end, {
        v35, 
        v33.userId
    });
    v3.useEffect(function() --[[ Line: 104 ]]
        -- upvalues: v35 (copy), v19 (ref), v40 (copy), v34 (copy), v42 (copy)
        if v35 == v19.Block then
            v40(v34.blockTitle);
            v42(v34.blockAction);
            return;
        else
            if v35 == v19.Unfriend then
                v40(v34.unfriendTitle);
                v42(v34.unfriendAction);
            end;
            return;
        end;
    end, {
        v35, 
        v33.combinedName, 
        v34.blockAction, 
        v34.blockTitle, 
        v34.unfriendAction, 
        v34.unfriendTitle
    });
    local v48 = v3.useCallback(function(v47) --[[ Line: 121 ]]
        -- upvalues: v36 (copy)
        v36(v47);
    end, {});
    local v49 = v3.useMemo(function() --[[ Line: 125 ]]
        -- upvalues: v3 (ref), v18 (ref), v48 (copy)
        return v3.createElement(v18, {
            initiateConfirmation = v48
        });
    end, {});
    local v51 = v3.useMemo(function() --[[ Line: 131 ]]
        -- upvalues: l_withStyle_0 (ref), v4 (ref), l_InteractiveAlert_0 (ref), v39 (copy), v34 (copy), l_ButtonType_0 (ref), v29 (copy), v15 (ref), v36 (copy), v19 (ref), v41 (copy), v46 (copy), v37 (copy)
        return l_withStyle_0(function(_) --[[ Line: 132 ]]
            -- upvalues: v4 (ref), l_InteractiveAlert_0 (ref), v39 (ref), v34 (ref), l_ButtonType_0 (ref), v29 (ref), v15 (ref), v36 (ref), v19 (ref), v41 (ref), v46 (ref), v37 (ref)
            return v4.createElement(l_InteractiveAlert_0, {
                title = v39, 
                bodyText = v34.confirmationDescription, 
                buttonStackInfo = {
                    buttons = {
                        {
                            buttonType = l_ButtonType_0.Secondary, 
                            props = {
                                text = v34.cancelAction, 
                                onActivated = function() --[[ Line: 142 ]] --[[ Name: onActivated ]]
                                    -- upvalues: v29 (ref), v15 (ref), v36 (ref), v19 (ref)
                                    v29(v15());
                                    v36(v19.NoAction);
                                end
                            }
                        }, 
                        {
                            buttonType = l_ButtonType_0.Alert, 
                            props = {
                                text = v41, 
                                onActivated = function() --[[ Line: 152 ]] --[[ Name: onActivated ]]
                                    -- upvalues: v46 (ref), v29 (ref), v15 (ref), v36 (ref), v19 (ref)
                                    v46();
                                    v29(v15());
                                    v36(v19.NoAction);
                                end
                            }
                        }
                    }
                }, 
                screenSize = v37
            });
        end);
    end, {
        v39, 
        v41, 
        v35, 
        v33.combinedName, 
        v33.userName, 
        v34.cancelAction, 
        v34.confirmationDescription
    });
    return v3.createElement(v4.Portal, {
        target = l_CoreGui_0
    }, {
        PlayerMenuScreen = v3.createElement("ScreenGui", {
            Enabled = v31, 
            IgnoreGuiInset = true, 
            ZIndexBehavior = if l_GetFFlagIrisBlockUnfriendMenuFix_0() then Enum.ZIndexBehavior.Sibling else nil, 
            DisplayOrder = 8, 
            [v3.Change.AbsoluteSize] = function(v52) --[[ Line: 182 ]]
                -- upvalues: v38 (copy)
                v38(v52.AbsoluteSize);
            end
        }, {
            Overlay = v3.createElement("TextButton", {
                AutoButtonColor = false, 
                BackgroundColor3 = l_Theme_0.Overlay.Color, 
                BackgroundTransparency = l_Theme_0.Overlay.Transparency, 
                BorderSizePixel = 0, 
                Size = UDim2.new(1, 0, 1, 0), 
                Text = "", 
                [v3.Event.Activated] = function() --[[ Line: 193 ]]
                    -- upvalues: v29 (copy), v15 (ref), v36 (copy), v19 (ref)
                    v29(v15());
                    v36(v19.NoAction);
                end
            }), 
            PlayerMenu = if v35 == v19.NoAction then v49 else v51
        })
    });
end;