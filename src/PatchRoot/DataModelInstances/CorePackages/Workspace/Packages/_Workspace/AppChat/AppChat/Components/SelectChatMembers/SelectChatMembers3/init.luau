local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_createNextOrder_0 = require(l_Parent_0.ReactUtils).createNextOrder;
local v4 = require(l_script_FirstAncestor_0.Components.Common.Frame);
local v5 = require(l_script_FirstAncestor_0.Components.Common.UIListLayout);
local l_useStyle_0 = require(l_Parent_0.UIBlox).Core.Style.useStyle;
local l_List_0 = require(l_Parent_0.Cryo).List;
local v8 = require(l_Parent_0.UIBlox);
local l_TextField_0 = v8.App.Input.TextField;
local l_Images_0 = v8.App.ImageSet.Images;
local v11 = require(l_script_FirstAncestor_0.Http.NetworkingFriends);
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useLocalUserId_0 = require(l_Parent_0.RobloxAppHooks).useLocalUserId;
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v16 = require(l_Parent_0.Cryo);
local v17 = require(l_Parent_0.UserProfiles);
local l_useUserProfilesFetch_0 = v17.Hooks.useUserProfilesFetch;
local v19 = require(script.Parent.Utils.isUserInConversation);
local v20 = require(l_Parent_0.LuauPolyfill);
local l_clearTimeout_0 = v20.clearTimeout;
local l_setTimeout_0 = v20.setTimeout;
local l_UserModel_0 = require(l_Parent_0.UserLib).Models.UserModel;
local v24 = require(script.Parent.UserCellWithCheckbox);
local v25 = require(l_script_FirstAncestor_0.Components.Cells.AvatarCircle);
local v26 = require(script.Parent.PaginatedChatMembers);
local v27 = require(script.Parent.SelectedMembersBar);
local v28 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatEnableGroupChatSettings);
local function _(v29, v30) --[[ Line: 37 ]] --[[ Name: isUserSelected ]]
    -- upvalues: l_List_0 (copy)
    return l_List_0.findWhere(v29, function(v31) --[[ Line: 38 ]]
        -- upvalues: v30 (copy)
        return v31.id == v30;
    end) ~= nil;
end;
local v33 = game:DefineFastInt("AppChatSelectChatMembersDebounceTime", 250);
return function(v34) --[[ Line: 77 ]] --[[ Name: SelectChatMembers ]]
    -- upvalues: l_useLocalization_0 (copy), l_useStyle_0 (copy), l_createNextOrder_0 (copy), l_useDispatch_0 (copy), l_useLocalUserId_0 (copy), v2 (copy), l_setTimeout_0 (copy), v33 (copy), l_useUserProfilesFetch_0 (copy), v17 (copy), v11 (copy), l_List_0 (copy), v16 (copy), v19 (copy), l_dependencyArray_0 (copy), l_clearTimeout_0 (copy), v5 (copy), v25 (copy), v24 (copy), v28 (copy), l_UserModel_0 (copy), v4 (copy), v27 (copy), l_TextField_0 (copy), l_Images_0 (copy), v26 (copy)
    local v35 = l_useLocalization_0({
        suggested = "Feature.Friends.Label.Suggested"
    });
    local v36 = l_useStyle_0();
    local l_Theme_0 = v36.Theme;
    local l_Font_0 = v36.Font;
    local v39 = l_createNextOrder_0();
    local v40 = l_useDispatch_0();
    local v41 = l_useLocalUserId_0();
    local v42 = v2.useRef(l_setTimeout_0(function() --[[ Line: 89 ]]

    end, v33));
    local v43 = v2.useRef("");
    local v44, v45 = v2.useState({});
    local v46 = l_useUserProfilesFetch_0({
        userIds = v44, 
        query = v17.Queries.userProfilesCombinedNameAndUsernameByUserIds
    });
    local v54 = v2.useCallback(function(v47) --[[ Line: 98 ]]
        -- upvalues: v40 (copy), v11 (ref), v41 (copy), l_List_0 (ref), v45 (copy), v16 (ref), v34 (copy), v19 (ref)
        v40(v11.SearchFriendsByQuery.API(v41, {
            query = v47, 
            limit = 20
        })):andThen(function(v48) --[[ Line: 103 ]]
            -- upvalues: l_List_0 (ref), v45 (ref), v16 (ref), v34 (ref), v19 (ref)
            local v50 = l_List_0.map(v48.responseBody.PageItems, function(v49) --[[ Line: 104 ]]
                return (tostring(v49.id));
            end);
            v45(v16.List.filter(v50, function(v51) --[[ Line: 107 ]]
                -- upvalues: v34 (ref), v19 (ref)
                local v52 = v34.conversation or {
                    participants = {}
                };
                return not v19(v51, v52);
            end));
        end):catch(function(v53) --[[ Line: 114 ]]
            print("error", v53);
        end);
    end, l_dependencyArray_0(v40, v41, v34.conversation));
    local v56 = v2.useCallback(function(v55) --[[ Line: 119 ]]
        -- upvalues: l_clearTimeout_0 (ref), v42 (copy), v43 (copy), l_setTimeout_0 (ref), v54 (copy), v45 (copy), v33 (ref)
        l_clearTimeout_0(v42.current);
        v43.current = v55;
        v42.current = l_setTimeout_0(function() --[[ Line: 122 ]]
            -- upvalues: v55 (copy), v54 (ref), v45 (ref)
            if v55 ~= "" then
                v54(v55);
                return;
            else
                v45({});
                return;
            end;
        end, v33);
    end);
    local v58 = v2.useCallback(function(v57) --[[ Line: 131 ]]
        -- upvalues: v2 (ref), v5 (ref), v25 (ref), v34 (copy), l_Theme_0 (copy), l_Font_0 (copy)
        return v2.createElement("Frame", {
            Size = UDim2.fromScale(1, 1), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0
        }, {
            layout = v2.createElement(v5, {
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Top
            }), 
            avatarCircle = v2.createElement(v25, {
                thumbnails = {
                    v57.thumbnail
                }, 
                onActivated = function() --[[ Line: 143 ]] --[[ Name: onActivated ]]
                    -- upvalues: v34 (ref), v57 (copy)
                    v34.onEntryActivated(v57);
                end, 
                circleColor3 = l_Theme_0.BackgroundDefault.Color, 
                circleInteriorBackgroundColor3 = l_Theme_0.PlaceHolder.Color, 
                circleInteriorBackgroundTransparency = l_Theme_0.PlaceHolder.Transparency, 
                presenceImage = v57.presenceImage or "", 
                showNewPresenceImage = true, 
                presenceImageColor3 = l_Theme_0.OnlineStatus.Color, 
                presenceImageTransparency = l_Theme_0.OnlineStatus.Transparency
            }), 
            displayName = v2.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 0, 15), 
                TextSize = l_Font_0.Footer.RelativeSize * l_Font_0.BaseSize, 
                TextColor3 = l_Theme_0.TextEmphasis.Color, 
                TextTransparency = l_Theme_0.TextEmphasis.Transparency, 
                Font = l_Font_0.Footer.Font, 
                Text = v57.displayName, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextTruncate = Enum.TextTruncate.AtEnd
            })
        });
    end, l_dependencyArray_0(v34.onEntryActivated, l_Theme_0, l_Font_0));
    local v75 = v2.useCallback(function(v59) --[[ Line: 168 ]]
        -- upvalues: v2 (ref), v34 (copy), v24 (ref), v36 (copy), l_List_0 (ref)
        local l_item_0 = v59.item;
        local l_createElement_0 = v2.createElement;
        local v62 = "Folder";
        local v63 = nil;
        local v64 = {
            userIdValue = v34.isDebugEnabled and v2.createElement("StringValue", {
                Value = l_item_0.id
            })
        };
        local l_createElement_1 = v2.createElement;
        local v66 = "Frame";
        local v67 = {
            Size = UDim2.new(1, 0, 0, 48), 
            BackgroundTransparency = 1
        };
        local v68 = {};
        local l_createElement_2 = v2.createElement;
        local l_v24_0 = v24;
        local v71 = {
            style = v36, 
            user = l_item_0, 
            subTitleText = "@" .. (l_item_0.username or "")
        };
        local l_selectedUsers_0 = v34.selectedUsers;
        local l_id_0 = l_item_0.id;
        v71.isCheckboxActivated = l_List_0.findWhere(l_selectedUsers_0, function(v74) --[[ Line: 38 ]]
            -- upvalues: l_id_0 (copy)
            return v74.id == l_id_0;
        end) ~= nil;
        v71.onActivated = v34.onEntryActivated;
        v68.cellContent = l_createElement_2(l_v24_0, v71);
        v64.userCell = l_createElement_1(v66, v67, v68);
        return l_createElement_0(v62, v63, v64);
    end, l_dependencyArray_0(v34.onEntryActivated, v34.selectedUsers, v34.isDebugEnabled, v36));
    local v92 = v2.useCallback(function(v76) --[[ Line: 191 ]]
        -- upvalues: v2 (ref), v34 (copy), v24 (ref), v36 (copy), l_List_0 (ref)
        local l_item_1 = v76.item;
        local l_createElement_3 = v2.createElement;
        local v79 = "Folder";
        local v80 = nil;
        local v81 = {
            userIdValue = v34.isDebugEnabled and v2.createElement("StringValue", {
                Value = l_item_1.id
            })
        };
        local l_createElement_4 = v2.createElement;
        local v83 = "Frame";
        local v84 = {
            Size = UDim2.new(1, 0, 0, 48), 
            BackgroundTransparency = 1
        };
        local v85 = {};
        local l_createElement_5 = v2.createElement;
        local l_v24_1 = v24;
        local v88 = {
            style = v36, 
            user = l_item_1, 
            secondaryTitleText = l_item_1.alias, 
            subTitleText = l_item_1.presenceText
        };
        local l_selectedUsers_1 = v34.selectedUsers;
        local l_id_1 = l_item_1.id;
        v88.isCheckboxActivated = l_List_0.findWhere(l_selectedUsers_1, function(v91) --[[ Line: 38 ]]
            -- upvalues: l_id_1 (copy)
            return v91.id == l_id_1;
        end) ~= nil;
        v88.onActivated = v34.onEntryActivated;
        v85.cellContent = l_createElement_5(l_v24_1, v88);
        v81.userCell = l_createElement_4(v83, v84, v85);
        return l_createElement_3(v79, v80, v81);
    end, {
        v34.selectedUsers, 
        v34.onEntryActivated, 
        v34.isDebugEnabled, 
        v36
    });
    local v93 = not v28() or v34.shouldShowSelectChatMembersBar;
    local v94 = v93 and 88 or 0;
    local v95 = #v44 == 0;
    local v99 = v2.useMemo(function() --[[ Line: 226 ]]
        -- upvalues: v46 (copy), v95 (copy), v44 (copy), v17 (ref), l_UserModel_0 (ref)
        local v96 = {};
        if v46.data and not v95 then
            for _, v98 in v44 do
                table.insert(v96, {
                    id = v98, 
                    displayName = v46.data and v17.Selectors.getCombinedNameFromId(v46.data, v98), 
                    username = v46.data and v17.Selectors.getUsernameFromId(v46.data, v98), 
                    thumbnail = ("rbxthumb://type=AvatarHeadShot&id=%*&w=150&h=150"):format(v98), 
                    presence = l_UserModel_0.PresenceType.OFFLINE
                });
            end;
        end;
        return v96;
    end, l_dependencyArray_0(v44, v46.data, v95));
    return v2.createElement(v4, {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = l_Theme_0.BackgroundDefault.Transparency, 
        BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
        LayoutOrder = v34.layoutOrder, 
        ClipsDescendants = true
    }, {
        layout = v2.createElement(v5, {
            Padding = UDim.new(12, 0)
        }), 
        selectedMembersBar = if v93 then v2.createElement(v27, {
            barBackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
            barBackgroundTransparency = l_Theme_0.BackgroundDefault.Transparency, 
            selectedUsers = v34.selectedUsers, 
            maxSize = v34.maxSelections, 
            renderEntry = v58, 
            LayoutOrder = v39()
        }) else nil, 
        searchBoxFrame = v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 60), 
            BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
            BackgroundTransparency = l_Theme_0.BackgroundDefault.Transparency, 
            LayoutOrder = v39()
        }, {
            searchBoxInnerFrame = v2.createElement("Frame", {
                Size = UDim2.new(1, -24, 1, 0), 
                AnchorPoint = Vector2.new(0.5, 0), 
                Position = UDim2.fromScale(0.5, 0), 
                BackgroundTransparency = 1
            }, {
                searchBox = v2.createElement(l_TextField_0, {
                    placeholder = v34.searchFriendsText, 
                    text = "", 
                    iconLeading = l_Images_0["icons/common/search_small"], 
                    onChange = v56, 
                    width = UDim.new(1, 0), 
                    LayoutOrder = 2
                })
            })
        }), 
        friendsListContainer = v2.createElement(v4, {
            Size = UDim2.new(1, 0, 1, -60 - v94), 
            BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
            BackgroundTransparency = l_Theme_0.BackgroundDefault.Transparency, 
            LayoutOrder = v39()
        }, {
            friendsList = if v43.current == "" then v2.createElement(v26, {
                renderItem = v92, 
                data = v34.friendEntries, 
                fetchMoreFriends = v34.fetchMoreFriends, 
                headerText = v35.suggested
            }) else v2.createElement(v26, {
                renderItem = v75, 
                data = v99
            })
        })
    });
end;