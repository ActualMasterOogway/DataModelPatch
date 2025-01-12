local l_script_FirstAncestor_0 = script:FindFirstAncestor("Squads");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local v2 = require(l_script_FirstAncestor_0.Common.Constants);
local v3 = require(l_script_FirstAncestor_0.Enums.SquadInviteSourceEnum);
local l_Cryo_0 = v1.Cryo;
local l_FriendsMenu_0 = v1.FriendsMenu;
local l_React_0 = v1.React;
local l_dependencyArray_0 = v1.Hooks.dependencyArray;
local l_NotificationModalsManager_0 = v1.NotificationModalsManager;
local l_SharedFlags_0 = v1.SharedFlags;
local l_Constants_0 = v1.SquadsCore.Common.Constants;
local l_SquadExternalContractContext_0 = v1.SquadsCore.SquadExternalContractProvider.SquadExternalContractContext;
local l_EventNames_0 = v1.SquadsCore.Analytics.EventNames;
local l_SquadPromptType_0 = v1.SquadsCore.Enums.SquadPromptType;
local l_UIBlox_0 = v1.UIBlox;
local l_useAppPolicy_0 = v1.Hooks.useAppPolicy;
local l_useNavigation_0 = v1.useNavigation;
local l_useDispatch_0 = v1.Hooks.useDispatch;
local l_useCurrentSquadSelector_0 = v1.Hooks.useCurrentSquadSelector;
local l_useLocalization_0 = v1.Hooks.useLocalization;
local l_useLocalUserId_0 = v1.Hooks.useLocalUserId;
local l_useStore_0 = v1.Hooks.useStore;
local l_FriendsMenuFriendsList_0 = l_FriendsMenu_0.FriendsMenuFriendsList;
local l_FriendsMenuContextWrapper_0 = l_FriendsMenu_0.FriendsMenuContextWrapper;
local l_FriendsMenuSearch_0 = l_FriendsMenu_0.FriendsMenuSearch;
local l_FriendMenuType_0 = l_FriendsMenu_0.FriendMenuType;
local l_SelectedUsersScroller_0 = l_FriendsMenu_0.SelectedUsersScroller;
local l_GetFFlagEnableFriendMenuMultiSelect_0 = l_SharedFlags_0.GetFFlagEnableFriendMenuMultiSelect;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local l_useStyle_0 = l_UIBlox_0.Core.Style.useStyle;
local v30 = require(script.Parent.SquadInviteFriendsButton);
local v31 = require(l_script_FirstAncestor_0.Thunks.inviteToSquad);
local function v32() --[[ Line: 48 ]]

end;
local v33 = {
    participants = {}
};
return function(v34) --[[ Line: 54 ]] --[[ Name: SquadInviteFriends ]]
    -- upvalues: l_Cryo_0 (copy), v33 (copy), l_React_0 (copy), l_SquadExternalContractContext_0 (copy), l_useDispatch_0 (copy), l_useNavigation_0 (copy), l_useStore_0 (copy), l_useStyle_0 (copy), l_useAppPolicy_0 (copy), l_useLocalUserId_0 (copy), l_dependencyArray_0 (copy), l_useCurrentSquadSelector_0 (copy), l_useLocalization_0 (copy), v3 (copy), l_EventNames_0 (copy), l_NotificationModalsManager_0 (copy), l_Images_0 (copy), v31 (copy), l_SquadPromptType_0 (copy), l_Constants_0 (copy), l_FriendsMenuContextWrapper_0 (copy), v32 (copy), v2 (copy), l_FriendsMenuSearch_0 (copy), l_SelectedUsersScroller_0 (copy), l_FriendsMenuFriendsList_0 (copy), l_GetFFlagEnableFriendMenuMultiSelect_0 (copy), l_FriendMenuType_0 (copy), v30 (copy)
    local v35 = l_Cryo_0.Dictionary.join(v33, v34);
    local v36 = l_React_0.useContext(l_SquadExternalContractContext_0);
    local v37 = l_useDispatch_0();
    local v38 = l_useNavigation_0();
    local v39 = l_useStore_0();
    local l_Theme_0 = l_useStyle_0().Theme;
    local v41, v42 = l_React_0.useState(0);
    local v44 = l_React_0.useCallback(function(v43) --[[ Line: 66 ]]
        return v43.getCanUsePlatformChat();
    end, {});
    local v45 = l_useAppPolicy_0(v44);
    local v46 = l_useLocalUserId_0();
    local v47 = l_React_0.useMemo(function() --[[ Line: 73 ]]
        -- upvalues: l_Cryo_0 (ref), v35 (copy)
        return l_Cryo_0.List.toSet(v35.participants);
    end, l_dependencyArray_0(v35.participants));
    local v49 = l_React_0.useCallback(function(v48) --[[ Line: 77 ]]
        -- upvalues: v42 (copy)
        v42(v48.AbsoluteSize.Y);
    end, l_dependencyArray_0(v42));
    local v50 = l_useCurrentSquadSelector_0();
    local v51 = if v50 and v50.parentChannelId then v50.parentChannelId else "";
    local v52 = v36.useGetConversationFromId(v51);
    local v53 = l_useLocalization_0({
        youAddedMoreThanTwoToChat = "Feature.Squads.Description.YouAddedMoreThanTwoToChat", 
        youAddedToChat = "Feature.Squads.Description.YouAddedToChat", 
        youAddedTwoToChat = "Feature.Squads.Description.YouAddedTwoToChat"
    });
    local v56 = l_React_0.useCallback(function(v54) --[[ Line: 93 ]]
        -- upvalues: l_Cryo_0 (ref), v51 (copy), v3 (ref), v36 (copy), l_EventNames_0 (ref)
        local v55 = l_Cryo_0.Dictionary.union({
            parentChannelId = v51, 
            source = v3.SourceSquadInvitePage
        }, v54);
        v36.fireSquadAnalytics(l_EventNames_0.SquadInvite, v55);
    end, l_dependencyArray_0(v51, v36.fireSquadAnalytics));
    local v62 = l_React_0.useCallback(function(v57) --[[ Line: 105 ]]
        -- upvalues: l_Cryo_0 (ref), v53 (copy), l_NotificationModalsManager_0 (ref), l_Images_0 (ref)
        local v58 = l_Cryo_0.Dictionary.keys(v57);
        local l_displayName_0 = v57[v58[1]].displayName;
        local v60 = nil;
        if #v58 > 2 then
            v60 = v53.youAddedMoreThanTwoToChat:gsub("{(.-)}", {
                username = l_displayName_0, 
                userCountMinusOne = tostring(#v58 - 1)
            });
        elseif #v58 == 2 then
            local l_displayName_1 = v57[v58[2]].displayName;
            v60 = v53.youAddedTwoToChat:gsub("{(.-)}", {
                username1 = l_displayName_0, 
                username2 = l_displayName_1
            });
        else
            v60 = v53.youAddedToChat:gsub("{(.-)}", {
                username = l_displayName_0
            });
        end;
        l_NotificationModalsManager_0.SetUIBloxToast({
            iconImage = l_Images_0["icons/actions/friends/friendAdd"], 
            toastTitle = v60
        });
    end, {
        v53.youAddedMoreThanTwoToChat, 
        v53.youAddedToChat, 
        v53.youAddedTwoToChat
    });
    local v68 = l_React_0.useCallback(function(v63) --[[ Line: 133 ]]
        -- upvalues: v50 (copy), v52 (copy), l_Cryo_0 (ref), v36 (copy), v37 (copy), v31 (ref), v46 (copy), v56 (copy), v62 (copy), v38 (copy), v39 (copy), l_SquadPromptType_0 (ref), l_Constants_0 (ref), v45 (copy)
        if not v50 or not v52 then
            return;
        else
            local v64 = l_Cryo_0.Dictionary.keys(v63);
            local function v67() --[[ Line: 140 ]]
                -- upvalues: v36 (ref), v37 (ref), v52 (ref), v64 (copy), v31 (ref), v50 (ref), v46 (ref), v56 (ref), v62 (ref), v63 (copy), v38 (ref), v39 (ref), l_SquadPromptType_0 (ref)
                v36.inviteToParentChannel(v37, v52, v64):andThen(function(v65) --[[ Line: 143 ]]
                    -- upvalues: v52 (ref), v37 (ref), v31 (ref), v50 (ref), v46 (ref), v64 (ref), v56 (ref), v62 (ref), v63 (ref), v38 (ref)
                    local v66 = v65 ~= v52.id;
                    v37(v31(v50.squadId, v65, v46, v64, v56, v66));
                    v62(v63);
                    v38.pop();
                end, function() --[[ Line: 157 ]]
                    -- upvalues: v36 (ref), v39 (ref), l_SquadPromptType_0 (ref)
                    v36.setSquadPrompt(v39, {
                        hideCancelButton = true, 
                        promptType = l_SquadPromptType_0.Error
                    });
                end);
            end;
            if v52.type == l_Constants_0.CONVERSATION_CHANNEL_GROUP_TYPE and v45 then
                v36.setSquadPrompt(v39, {
                    hideCancelButton = false, 
                    promptType = l_SquadPromptType_0.ConfirmInviteToSquad, 
                    onConfirm = function() --[[ Line: 169 ]] --[[ Name: onConfirm ]]
                        -- upvalues: v67 (copy)
                        v67();
                    end
                });
                return;
            else
                v67();
                return;
            end;
        end;
    end, l_dependencyArray_0(v50, v37, v38, v52, v56, v62, v36.setSquadPrompt, v36.inviteToParentChannel, v39));
    return l_React_0.createElement(l_FriendsMenuContextWrapper_0, {
        inviteSingleFriend = v32, 
        inviteMultiFriends = v68, 
        isLoadingCustomParams = false, 
        excludedFriendsSet = v47, 
        selectionLimit = v2.SQUAD_PARTICIPANT_LIMIT - #v35.participants
    }, {
        ContainerFrame = l_React_0.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, -52), 
            BackgroundTransparency = 1, 
            BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
            BorderSizePixel = 0
        }, {
            VerticalLayout = l_React_0.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                Padding = UDim.new(0, 16), 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            SearchSelectFrame = l_React_0.createElement("Frame", {
                Size = UDim2.fromScale(1, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1, 
                LayoutOrder = 0, 
                [l_React_0.Change.AbsoluteSize] = v49
            }, {
                Padding = l_React_0.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, 24), 
                    PaddingRight = UDim.new(0, 24), 
                    PaddingTop = UDim.new(0, 12)
                }), 
                VerticalLayout = l_React_0.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    Padding = UDim.new(0, 16), 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                FriendsMenuSearch = l_React_0.createElement(l_FriendsMenuSearch_0, {
                    layoutOrder = 0, 
                    size = UDim2.new(1, 0, 0, 36), 
                    focusElement = false
                }), 
                SelectedUsersScroller = l_React_0.createElement(l_SelectedUsersScroller_0, {
                    layoutOrder = 1, 
                    selectionLimit = v2.SQUAD_PARTICIPANT_LIMIT - #v35.participants
                })
            }), 
            FriendsList = l_React_0.createElement(l_FriendsMenuFriendsList_0, {
                size = UDim2.new(1, 0, 1, -v41 - 16), 
                layoutOrder = 1, 
                parentComponentName = v2.SQUAD_INVITE_PARENT_COMPONENT, 
                menuType = if l_GetFFlagEnableFriendMenuMultiSelect_0() then l_FriendMenuType_0.MultiSelect else nil, 
                isFullRowActivatable = true, 
                backgroundTransparency = 1
            })
        }), 
        FriendsListButtonFrame = l_React_0.createElement("Frame", {
            AnchorPoint = Vector2.new(0, 1), 
            Position = UDim2.fromScale(0, 1), 
            Size = UDim2.new(1, 0, 0, 52), 
            BackgroundTransparency = 1, 
            BackgroundColor3 = l_Theme_0.BackgroundContrast.Color, 
            BorderSizePixel = 0
        }, {
            Padding = l_React_0.createElement("UIPadding", {
                PaddingRight = UDim.new(0, 12), 
                PaddingLeft = UDim.new(0, 12), 
                PaddingBottom = UDim.new(0, 8), 
                PaddingTop = UDim.new(0, 8)
            }), 
            Button = l_React_0.createElement(v30)
        })
    });
end;