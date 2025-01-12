local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_SocialService_0 = game:GetService("SocialService");
local v3 = require(l_CorePackages_0.Packages.React);
local l_PeekView_0 = require(l_CorePackages_0.Workspace.Packages.PeekView).PeekView;
local l_PeekViewState_0 = require(l_CorePackages_0.Workspace.Packages.PeekView).PeekViewState;
local l_Signal_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Signal;
local l_Sounds_0 = require(l_CorePackages_0.Workspace.Packages.SoundManager).Sounds;
local l_SoundGroups_0 = require(l_CorePackages_0.Workspace.Packages.SoundManager).SoundGroups;
local l_SoundManager_0 = require(l_CorePackages_0.Workspace.Packages.SoundManager).SoundManager;
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v11 = require(l_RobloxGui_0.Modules.RobloxTranslator);
local l_ContactList_0 = l_RobloxGui_0.Modules.ContactList;
local v13 = require(l_ContactList_0.dependencies);
local l_dependencyArray_0 = v13.Hooks.dependencyArray;
local l_useSelector_0 = v13.Hooks.useSelector;
local l_useDispatch_0 = v13.Hooks.useDispatch;
local l_useStyle_0 = v13.UIBlox.Core.Style.useStyle;
local v18 = require(l_ContactList_0.Analytics.useAnalytics);
local v19 = require(l_ContactList_0.Analytics.EventNamesEnum);
local v20 = require(l_ContactList_0.Components.ContactListHeader);
local v21 = require(l_ContactList_0.Components.CallHistory.CallHistoryContainer);
local v22 = require(l_ContactList_0.Components.FriendList.FriendListContainer);
local v23 = require(l_ContactList_0.Components.ContactListSearchBar);
local v24 = require(l_ContactList_0.Actions.SetCurrentPage);
local v25 = require(l_ContactList_0.Actions.SetCurrentTag);
local v26 = require(l_ContactList_0.Actions.OpenOrUpdateDialog);
local v27 = require(l_ContactList_0.Enums.Pages);
local v28 = require(l_ContactList_0.Parent.TopBar.Constants);
local l_LocalPlayer_0 = game:GetService("Players").LocalPlayer;
local l_CurrentCamera_0 = workspace.CurrentCamera;
local l_game_EngineFeature_0 = game:GetEngineFeature("EnableSocialServiceIrisInvite");
local l_game_EngineFeature_1 = game:GetEngineFeature("EnableSocialServiceCallingRename");
local v33 = 12 + v28.TopBarHeight;
return function() --[[ Line: 64 ]] --[[ Name: ContactListContainer ]]
    -- upvalues: v18 (copy), l_useStyle_0 (copy), l_useDispatch_0 (copy), v3 (copy), l_CurrentCamera_0 (copy), v33 (copy), l_Signal_0 (copy), l_useSelector_0 (copy), l_game_EngineFeature_0 (copy), l_SocialService_0 (copy), l_LocalPlayer_0 (copy), v25 (copy), v19 (copy), v27 (copy), v24 (copy), l_SoundManager_0 (copy), l_Sounds_0 (copy), l_SoundGroups_0 (copy), v26 (copy), v11 (copy), l_game_EngineFeature_1 (copy), l_dependencyArray_0 (copy), l_PeekViewState_0 (copy), v21 (copy), v22 (copy), v20 (copy), v23 (copy), l_PeekView_0 (copy)
    local v34 = v18();
    local l_Theme_0 = l_useStyle_0().Theme;
    local v36 = l_useDispatch_0();
    local v37 = v3.useRef(nil);
    local v38, v39 = v3.useState(0);
    local v40, v41 = v3.useState(l_CurrentCamera_0.ViewportSize.X < 640);
    local v42, v43 = v3.useState("");
    local v44, v45 = v3.useState(l_CurrentCamera_0.ViewportSize.Y - v33);
    local v46, v47 = v3.useState(nil);
    local v48 = v3.useRef(l_Signal_0.new());
    local v50 = v3.useCallback(function(v49) --[[ Line: 86 ]]
        return v49.Navigation.currentPage;
    end, {});
    local v51 = l_useSelector_0(v50);
    if l_game_EngineFeature_0 then
        v3.useEffect(function() --[[ Line: 92 ]]
            -- upvalues: l_SocialService_0 (ref), l_LocalPlayer_0 (ref), v36 (copy), v25 (ref), v34 (copy), v19 (ref), v51 (copy), v27 (ref), v24 (ref), l_SoundManager_0 (ref), l_Sounds_0 (ref), l_SoundGroups_0 (ref), v26 (ref), v11 (ref), l_game_EngineFeature_1 (ref), v39 (copy), v38 (copy)
            local v56 = l_SocialService_0.PromptIrisInviteRequested:Connect(function(v52, v53) --[[ Line: 94 ]]
                -- upvalues: l_LocalPlayer_0 (ref), v36 (ref), v25 (ref), v34 (ref), v19 (ref), v51 (ref), v27 (ref), v24 (ref), l_SoundManager_0 (ref), l_Sounds_0 (ref), l_SoundGroups_0 (ref), v26 (ref), v11 (ref), l_SocialService_0 (ref)
                if l_LocalPlayer_0 and l_LocalPlayer_0.UserId == v52.UserId then
                    local l_UserInputService_0 = game:GetService("UserInputService");
                    local l_l_UserInputService_0_Platform_0 = l_UserInputService_0:GetPlatform();
                    if not l_UserInputService_0.VREnabled and (l_l_UserInputService_0_Platform_0 == Enum.Platform.Windows or l_l_UserInputService_0_Platform_0 == Enum.Platform.UWP or l_l_UserInputService_0_Platform_0 == Enum.Platform.OSX or l_l_UserInputService_0_Platform_0 == Enum.Platform.IOS or l_l_UserInputService_0_Platform_0 == Enum.Platform.Android) then
                        v36(v25(v53));
                        v34.fireEvent(v19.PhoneBookNavigate, {
                            eventTimestampMs = os.time() * 1000, 
                            startingPage = v51, 
                            destinationPage = v27.CallHistory
                        });
                        v36(v24(v27.CallHistory));
                        l_SoundManager_0:PlaySound(l_Sounds_0.Swipe.Name, {
                            Volume = 0.5
                        }, l_SoundGroups_0.Iris);
                        return;
                    else
                        v36(v26(v11:FormatByKey("Feature.Call.Error.Label.OhNo"), v11:FormatByKey("Feature.Call.Error.Description.DeviceNotSupported"), function() --[[ Line: 122 ]]
                            -- upvalues: l_SocialService_0 (ref), l_LocalPlayer_0 (ref)
                            l_SocialService_0:InvokeIrisInvitePromptClosed(l_LocalPlayer_0);
                        end));
                    end;
                end;
            end);
            local _ = nil;
            local v59 = (if l_game_EngineFeature_1 then l_SocialService_0.PhoneBookPromptClosed else game:GetService("SocialService").IrisInvitePromptClosed):Connect(function(v58) --[[ Line: 141 ]]
                -- upvalues: l_LocalPlayer_0 (ref), v34 (ref), v19 (ref), v51 (ref), v36 (ref), v24 (ref), v39 (ref), v38 (ref)
                if l_LocalPlayer_0 and l_LocalPlayer_0.UserId == v58.UserId then
                    v34.fireEvent(v19.PhoneBookNavigate, {
                        eventTimestampMs = os.time() * 1000, 
                        startingPage = tostring(v51), 
                        destinationPage = nil
                    });
                    v36(v24(nil));
                    v39(v38 + 1);
                end;
            end);
            return function() --[[ Line: 154 ]]
                -- upvalues: v56 (copy), v59 (copy)
                v56:Disconnect();
                v59:Disconnect();
            end;
        end, l_dependencyArray_0(v38, v51));
    end;
    local v60 = v3.useCallback(function() --[[ Line: 161 ]]
        -- upvalues: v40 (copy), v37 (copy), l_SoundManager_0 (ref), l_Sounds_0 (ref), l_SoundGroups_0 (ref), v33 (ref), l_SocialService_0 (ref), l_LocalPlayer_0 (ref), v48 (copy)
        if not v40 and v37.current then
            l_SoundManager_0:PlaySound(l_Sounds_0.Swipe.Name, {
                Volume = 0.5
            }, l_SoundGroups_0.Iris);
            pcall(function() --[[ Line: 164 ]]
                -- upvalues: v37 (ref), v33 (ref), l_SocialService_0 (ref), l_LocalPlayer_0 (ref)
                v37.current:TweenPosition(UDim2.new(0, -376, 0, v33), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.3, true, function() --[[ Line: 171 ]]
                    -- upvalues: l_SocialService_0 (ref), l_LocalPlayer_0 (ref)
                    l_SocialService_0:InvokeIrisInvitePromptClosed(l_LocalPlayer_0);
                end);
            end);
            return;
        else
            if v48 and v48.current then
                v48.current:fire();
            end;
            return;
        end;
    end, {
        v40
    });
    local v62 = v3.useCallback(function(v61) --[[ Line: 183 ]]
        -- upvalues: v43 (copy)
        v43(v61);
    end, {});
    v3.useEffect(function() --[[ Line: 188 ]]
        -- upvalues: l_CurrentCamera_0 (ref), v41 (copy), v45 (copy), v33 (ref)
        local v63 = l_CurrentCamera_0:GetPropertyChangedSignal("ViewportSize"):Connect(function() --[[ Line: 189 ]]
            -- upvalues: l_CurrentCamera_0 (ref), v41 (ref), v45 (ref), v33 (ref)
            if l_CurrentCamera_0.ViewportSize.X < 640 then
                v41(true);
            else
                v41(false);
            end;
            v45(l_CurrentCamera_0.ViewportSize.Y - v33);
        end);
        return function() --[[ Line: 199 ]]
            -- upvalues: v63 (copy)
            v63:Disconnect();
        end;
    end, {});
    v3.useEffect(function() --[[ Line: 204 ]]
        -- upvalues: v51 (copy), v40 (copy), v37 (copy), v33 (ref), v43 (copy)
        if v51 and not v40 and v37.current then
            pcall(function() --[[ Line: 206 ]]
                -- upvalues: v37 (ref), v33 (ref)
                v37.current:TweenPosition(UDim2.new(0, 12, 0, v33), Enum.EasingDirection.In, Enum.EasingStyle.Quad, 0.3, true);
            end);
        end;
        v43("");
    end, {
        v40, 
        v51
    });
    local v66 = v3.useCallback(function(v64, _) --[[ Line: 221 ]]
        -- upvalues: l_PeekViewState_0 (ref), l_LocalPlayer_0 (ref), l_game_EngineFeature_0 (ref), l_SocialService_0 (ref), l_SoundManager_0 (ref), l_Sounds_0 (ref), l_SoundGroups_0 (ref), v47 (copy)
        if v64 == l_PeekViewState_0.Closed then
            if l_LocalPlayer_0 and l_game_EngineFeature_0 then
                l_SocialService_0:InvokeIrisInvitePromptClosed(l_LocalPlayer_0);
            end;
            l_SoundManager_0:PlaySound(l_Sounds_0.Swipe.Name, {
                Volume = 0.5
            }, l_SoundGroups_0.Iris);
        end;
        v47(v64);
    end, {});
    local v67 = v3.useCallback(function() --[[ Line: 233 ]]
        -- upvalues: v34 (copy), v19 (ref), v51 (copy), v27 (ref), v36 (copy), v24 (ref), v47 (copy), l_PeekViewState_0 (ref)
        v34.fireEvent(v19.PhoneBookSearchClicked, {
            eventTimestampMs = os.time() * 1000
        });
        if v51 ~= v27.FriendList then
            v34.fireEvent(v19.PhoneBookNavigate, {
                eventTimestampMs = os.time() * 1000, 
                startingPage = v51, 
                destinationPage = v27.FriendList
            });
        end;
        v36(v24(v27.FriendList));
        v47(l_PeekViewState_0.Full);
    end, {
        v51
    });
    local v69 = v3.useMemo(function() --[[ Line: 248 ]]
        -- upvalues: v51 (copy), v27 (ref), v3 (ref), v21 (ref), v60 (copy), v40 (copy), v46 (copy), l_PeekViewState_0 (ref), v42 (copy), v22 (ref), v44 (copy), v33 (ref), l_Theme_0 (copy), v37 (copy), v20 (ref), v23 (ref), v62 (copy), v67 (copy)
        local v68 = nil;
        if v51 == v27.CallHistory then
            v68 = v3.createElement(v21, {
                dismissCallback = v60, 
                isSmallScreen = v40, 
                scrollingEnabled = not v40 or v46 == l_PeekViewState_0.Full, 
                searchText = v42
            });
        elseif v51 == v27.FriendList then
            v68 = v3.createElement(v22, {
                dismissCallback = v60, 
                isSmallScreen = v40, 
                scrollingEnabled = not v40 or v46 == l_PeekViewState_0.Full, 
                searchText = v42
            });
        end;
        return v3.createElement("ImageButton", {
            Size = if v40 then UDim2.new(1, 0, 0, v44 - 25) else UDim2.new(0, 376, 1, -v33), 
            Position = if v40 then UDim2.new(0, 0, 0, 0) else UDim2.new(0, -376, 0, v33), 
            AutoButtonColor = false, 
            BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
            ref = v37
        }, {
            UICorner = v3.createElement("UICorner", {
                CornerRadius = UDim.new(0, 12)
            }), 
            UIPadding = v3.createElement("UIPadding", {
                PaddingTop = if v40 then UDim.new(0, 0) else UDim.new(0, 8)
            }), 
            Layout = v3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 8)
            }), 
            Header = v3.createElement(v20, {
                currentPage = v51, 
                headerHeight = 36, 
                layoutOrder = 1, 
                dismissCallback = v60
            }), 
            SearchBar = v3.createElement(v23, {
                layoutOrder = 2, 
                onSearchChanged = v62, 
                searchBarHeight = 36, 
                searchText = v42, 
                onFocused = v67
            }), 
            ContentContainer = v3.createElement("Frame", {
                BackgroundTransparency = 1, 
                LayoutOrder = 3, 
                Size = UDim2.new(1, 0, 1, -88)
            }, v68)
        });
    end, l_dependencyArray_0(v44, v51, v60, v46, v40, v42));
    local v70 = {};
    if v40 then
        v70["Content" .. tostring(v38)] = v3.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, -v33), 
            Position = UDim2.fromOffset(0, v33), 
            BackgroundTransparency = 1
        }, {
            v3.createElement(l_PeekView_0, {
                briefViewContentHeight = UDim.new(0.6, 0), 
                canDragFullViewToBrief = true, 
                closeSignal = v48.current, 
                elasticBehavior = Enum.ElasticBehavior.Never, 
                peekViewState = v46, 
                viewStateChanged = v66
            }, {
                Content = v69
            })
        });
    else
        v70.Content = v69;
    end;
    if v51 then
        return (v3.createElement("TextButton", {
            Size = UDim2.fromScale(1, 1), 
            BackgroundTransparency = 1, 
            Text = "", 
            [v3.Event.Activated] = function() --[[ Line: 348 ]]
                -- upvalues: v60 (copy)
                v60();
            end
        }, v70));
    else
        return nil;
    end;
end;