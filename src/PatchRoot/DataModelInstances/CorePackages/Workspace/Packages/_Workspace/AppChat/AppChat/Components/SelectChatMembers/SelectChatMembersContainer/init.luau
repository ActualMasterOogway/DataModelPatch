local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_script_FirstAncestor_0.types);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.React);
local v5 = require(l_Parent_0.Promise);
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local l_memo_0 = v4.memo;
local l_useCallback_0 = v4.useCallback;
local l_useEffect_0 = v4.useEffect;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useState_0 = v4.useState;
local l_useStyle_0 = require(l_Parent_0.UIBlox).Core.Style.useStyle;
local l_usePrevious_0 = require(l_Parent_0.RoactUtils).Hooks.usePrevious;
local v15 = require(l_Parent_0.UserProfiles);
local l_useUserProfilesFetch_0 = v15.Hooks.useUserProfilesFetch;
local v17 = require(script.Parent.Utils.searchFilterPredicate);
local v18 = require(script.Parent.Utils.sortComparator);
local v19 = require(script.Parent.Utils.selectFriends);
local v20 = require(script.Parent.Utils.isUserInConversation);
local v21 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatUsePaginatedFriends);
local v22 = require(script.Parent.useFetchPaginatedFriends);
local v23 = if v21() then require(script.Parent.SelectChatMembers3) else require(script.Parent.SelectChatMembers);
local v24 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatEnableGroupChatSettings);
local l_GetFFlagAppChatRebrandStringUpdates_0 = require(l_Parent_0.SharedFlags).GetFFlagAppChatRebrandStringUpdates;
local v29 = {
    topBarHeight = 64, 
    minSelections = 1, 
    maxSelections = 5, 
    maxConversationSize = 5, 
    canOnlyCreateOneToOneChat = false, 
    filterPredicate = v17, 
    sortComparator = v18, 
    conversation = {
        participants = {}
    }, 
    navigateToToast = function(_) --[[ Line: 76 ]] --[[ Name: navigateToToast ]]

    end, 
    selectedUsersChanged = function(_, _) --[[ Line: 77 ]] --[[ Name: selectedUsersChanged ]]

    end
};
SelectChatMembersContainer = function(v30) --[[ Line: 81 ]] --[[ Name: SelectChatMembersContainer ]]
    -- upvalues: v3 (copy), v29 (copy), l_useState_0 (copy), l_useLocalization_0 (copy), l_GetFFlagAppChatRebrandStringUpdates_0 (copy), v4 (copy), v21 (copy), v22 (copy), l_useUserProfilesFetch_0 (copy), v15 (copy), v20 (copy), l_useSelector_0 (copy), l_useCallback_0 (copy), v19 (copy), l_dependencyArray_0 (copy), v5 (copy), l_usePrevious_0 (copy), l_useEffect_0 (copy), l_useStyle_0 (copy), v24 (copy), v23 (copy)
    local v31 = v3.Dictionary.join(v29, v30);
    local v32, v33 = l_useState_0({});
    local v34 = l_useLocalization_0({
        systemButtonText = v31.systemButtonText, 
        pageHeaderText = v31.pageHeaderText, 
        searchFriendsText = "Feature.Friends.Label.SearchFriends", 
        offlinePresenceText = "Common.Presence.Label.Offline", 
        onlinePresenceText = "Common.Presence.Label.Online", 
        networkErrorText = "Feature.Chat.Response.NetworkError", 
        tooManyFriendsText = {
            l_GetFFlagAppChatRebrandStringUpdates_0() and "Feature.Chat.Message.PartyGroupLimitToastText" or "Feature.Chat.Message.ToastText"; 
            friendNum = 5
        }, 
        tooManyFriendsTextSingular = l_GetFFlagAppChatRebrandStringUpdates_0() and "Feature.Chat.Message.PartyGroupLimitSingular" or "Feature.Chat.Message.ChatGroupLimitSingular"
    });
    local v35, v36 = v4.useState({});
    local v37 = nil;
    local v38 = nil;
    if v21() then
        local v39 = nil;
        local v40, v41, v42 = v22();
        v39 = v40;
        v37 = v41;
        v38 = v42;
        v40 = v3.List.map(v39, function(v43) --[[ Line: 108 ]]
            return v43.id;
        end);
        v41 = l_useUserProfilesFetch_0({
            userIds = v40, 
            query = v15.Queries.userProfilesCombinedNameAndUsernameByUserIds
        });
        local l_v41_0 = v41 --[[ copy: 11 -> 18 ]];
        do
            local l_v39_0 = v39;
            v4.useEffect(function() --[[ Line: 116 ]]
                -- upvalues: l_v41_0 (copy), v36 (copy), v3 (ref), l_v39_0 (ref), v20 (ref), v31 (copy), v15 (ref)
                if l_v41_0.data then
                    v36(v3.List.filterMap(l_v39_0, function(v46) --[[ Line: 118 ]]
                        -- upvalues: v20 (ref), v31 (ref), v3 (ref), v15 (ref), l_v41_0 (ref)
                        if not v20(v46.id, v31.conversation) then
                            return v3.Dictionary.join(v46, {
                                displayName = v15.Selectors.getCombinedNameFromId(l_v41_0.data, v46.id), 
                                username = v15.Selectors.getUsernameFromId(l_v41_0.data, v46.id)
                            });
                        else
                            return nil;
                        end;
                    end));
                end;
            end, {
                v41.data, 
                v31.conversation
            });
        end;
    else
        v35 = l_useSelector_0(l_useCallback_0(function(v47) --[[ Line: 135 ]]
            -- upvalues: v19 (ref), v31 (copy)
            return v19(v47, v31.conversation);
        end, l_dependencyArray_0(v31.conversation)));
    end;
    local v49 = l_useCallback_0(function(v48) --[[ Line: 140 ]]
        -- upvalues: v32 (copy), v31 (copy), v5 (ref), v3 (ref)
        if v32 and #v32 == v31.maxSelections then
            return v5.reject();
        else
            return v5.resolve(v3.List.join(v32, {
                v48
            }));
        end;
    end, l_dependencyArray_0(v32, v31.maxSelections));
    local v52 = l_useCallback_0(function(v50) --[[ Line: 148 ]]
        -- upvalues: v5 (ref), v3 (ref), v32 (copy)
        return v5.resolve(v3.List.filter(v32, function(v51) --[[ Line: 149 ]]
            -- upvalues: v50 (copy)
            return v51.id ~= v50;
        end));
    end, l_dependencyArray_0(v32));
    local v56 = l_useCallback_0(function(v53) --[[ Line: 154 ]]
        -- upvalues: v32 (copy)
        for _, v55 in pairs(v32) do
            if v55.id == v53.id then
                return true;
            end;
        end;
        return false;
    end, l_dependencyArray_0(v32));
    local function _(v57) --[[ Line: 164 ]]
        -- upvalues: v56 (copy), v52 (copy), v49 (copy)
        if v56(v57) then
            return v52(v57.id);
        else
            return v49(v57);
        end;
    end;
    local function v60(v59) --[[ Line: 172 ]]
        -- upvalues: v31 (copy)
        v31.navigateToToast({
            toastProps = {
                toastContent = {
                    toastTitle = v59
                }
            }
        });
    end;
    local v61 = l_usePrevious_0(v32);
    l_useEffect_0(function() --[[ Line: 184 ]]
        -- upvalues: v32 (copy), v61 (copy), v31 (copy)
        if v32 ~= v61 then
            v31.selectedUsersChanged(v32, v31.minSelections);
        end;
    end, l_dependencyArray_0(v32));
    local v62 = l_useStyle_0();
    local function v63() --[[ Line: 192 ]]
        -- upvalues: v37 (ref), v38 (ref)
        if v37 and not v38 then
            v37();
        end;
    end;
    local v66 = v3.Dictionary.join(v31, v34, {
        onEntryActivated = function(v64) --[[ Line: 201 ]] --[[ Name: onEntryActivated ]]
            -- upvalues: v56 (copy), v52 (copy), v49 (copy), v33 (copy), v60 (copy), v24 (ref), v31 (copy), v34 (copy)
            (if v56(v64) then v52(v64.id) else v49(v64)):andThen(function(v65) --[[ Line: 203 ]]
                -- upvalues: v33 (ref)
                v33(v65);
            end):catch(function() --[[ Line: 206 ]]
                -- upvalues: v60 (ref), v24 (ref), v31 (ref), v34 (ref)
                v60(if v24() and v31.canOnlyCreateOneToOneChat then v34.tooManyFriendsTextSingular else v34.tooManyFriendsText);
            end);
        end, 
        selectedUsers = v32, 
        friendEntries = v35, 
        shouldShowSelectChatMembersBar = not v31.canOnlyCreateOneToOneChat, 
        fetchMoreFriends = v63
    });
    return v4.createElement("ImageButton", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 0, 
        BackgroundColor3 = v62.Theme.BackgroundUIDefault.Color, 
        BorderSizePixel = 0, 
        Active = true, 
        AutoButtonColor = false
    }, {
        content = v4.createElement(v23, v66)
    });
end;
return l_memo_0(SelectChatMembersContainer);