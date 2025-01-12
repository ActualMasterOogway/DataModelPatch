if game:DefineFastFlag("AppChatUseNewSelectChatMembers2", false) then
    return require(script.Parent.SelectChatMembers2);
else
    local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
    local l_Parent_0 = l_script_FirstAncestor_0.Parent;
    local v2 = require(l_script_FirstAncestor_0.SocialLibraries);
    local v3 = require(l_Parent_0.Roact);
    local v4 = require(l_Parent_0.UIBlox);
    local l_UserModel_0 = require(l_Parent_0.UserLib).Models.UserModel;
    local v6 = require(script.Parent.UserCellWithCheckbox);
    local l_AvatarCircle_0 = v2.Components.AvatarCircle;
    local l_FilteredScrollingList_0 = v2.Components.FilteredScrollingList;
    local v9 = require(script.Parent.SelectedMembersBar);
    local _ = function(v10, v11) --[[ Line: 23 ]] --[[ Name: isUserSelected ]]
        for _, v13 in ipairs(v10) do
            if v13.id == v11 then
                return true;
            end;
        end;
        return false;
    end;
    local v15 = v3.PureComponent:extend("SelectChatMembers");
    v15.defaultProps = {
        topBarHeight = 88, 
        entryHeight = 48, 
        friendEntries = {}, 
        selectedUsers = {}, 
        onlinePresenceText = "Online", 
        offlinePresenceText = "Offline", 
        sortComparator = nil, 
        filterPredicate = nil, 
        onEntryActivated = nil, 
        isDebugEnabled = false, 
        LayoutOrder = nil
    };
    v15.init = function(v16) --[[ Line: 52 ]] --[[ Name: init ]]
        -- upvalues: v4 (copy), v3 (copy), l_AvatarCircle_0 (copy), l_UserModel_0 (copy), v6 (copy)
        v16.renderSelectedMembersBarEntry = function(v17) --[[ Line: 53 ]]
            -- upvalues: v4 (ref), v3 (ref), l_AvatarCircle_0 (ref), v16 (copy)
            return v4.Style.withStyle(function(v18) --[[ Line: 54 ]]
                -- upvalues: v3 (ref), l_AvatarCircle_0 (ref), v17 (copy), v16 (ref)
                return v3.createElement("Frame", {
                    Size = UDim2.new(1, 0, 1, 0), 
                    BackgroundTransparency = 1
                }, {
                    layout = v3.createElement("UIListLayout", {
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        VerticalAlignment = Enum.VerticalAlignment.Top, 
                        Padding = UDim.new(0, 2)
                    }), 
                    avatarCircle = v3.createElement(l_AvatarCircle_0, {
                        thumbnails = {
                            v17.thumbnail
                        }, 
                        onActivated = function() --[[ Line: 70 ]] --[[ Name: onActivated ]]
                            -- upvalues: v16 (ref), v17 (ref)
                            v16.props.onEntryActivated(v17);
                        end, 
                        circleColor3 = v18.Theme.BackgroundMuted.Color, 
                        circleInteriorBackgroundColor3 = v18.Theme.PlaceHolder.Color, 
                        circleInteriorBackgroundTransparency = v18.Theme.PlaceHolder.Transparency, 
                        presenceImage = v17.presenceImage, 
                        showNewPresenceImage = true, 
                        presenceImageColor3 = v18.Theme.OnlineStatus.Color, 
                        presenceImageTransparency = v18.Theme.OnlineStatus.Transparency
                    }), 
                    displayName = v3.createElement("TextLabel", {
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(1, 0, 0, 15), 
                        TextSize = v18.Font.Footer.RelativeSize * v18.Font.BaseSize, 
                        TextColor3 = v18.Theme.TextEmphasis.Color, 
                        TextTransparency = v18.Theme.TextEmphasis.Transparency, 
                        Font = v18.Font.Footer.Font, 
                        Text = v17.displayName, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextTruncate = Enum.TextTruncate.AtEnd
                    })
                });
            end);
        end;
        v16.renderEntry = function(v19) --[[ Line: 98 ]]
            -- upvalues: v16 (copy), l_UserModel_0 (ref), v4 (ref), v3 (ref), v6 (ref)
            local v20 = false;
            local v21 = nil;
            v21 = v16.props.offlinePresenceText;
            if v19.presence == l_UserModel_0.PresenceType.ONLINE then
                v21 = v16.props.onlinePresenceText;
            elseif v19.presence == l_UserModel_0.PresenceType.OFFLINE then
                v21 = v16.props.offlinePresenceText;
            elseif v19.presence == l_UserModel_0.PresenceType.IN_GAME or v19.presence == l_UserModel_0.PresenceType.IN_STUDIO then
                v21 = v19.presenceText;
            end;
            local v22 = nil;
            local l_selectedUsers_0 = v16.props.selectedUsers;
            local l_id_0 = v19.id;
            local v25;
            for _, v27 in ipairs(l_selectedUsers_0) do
                if v27.id == l_id_0 then
                    v25 = true;
                    v20 = true;
                end;
                if v20 then
                    break;
                end;
            end;
            if not v20 then
                v25 = false;
            end;
            v20 = false;
            v22 = v25 and true or false;
            return v4.Style.withStyle(function(v28) --[[ Line: 122 ]]
                -- upvalues: v3 (ref), v16 (ref), v19 (copy), v6 (ref), v21 (ref), v22 (ref)
                return v3.createElement("Folder", nil, {
                    userIdValue = v16.props.isDebugEnabled and v3.createElement("StringValue", {
                        Value = v19.id
                    }), 
                    userCell = v3.createElement(v6, {
                        style = v28, 
                        user = v19, 
                        secondaryTitleText = v19.alias, 
                        subTitleText = v21, 
                        isCheckboxActivated = v22, 
                        onActivated = v16.props.onEntryActivated
                    })
                });
            end);
        end;
    end;
    v15.render = function(v29) --[[ Line: 140 ]] --[[ Name: render ]]
        -- upvalues: v4 (copy), v3 (copy), v9 (copy), l_FilteredScrollingList_0 (copy)
        return v4.Style.withStyle(function(v30) --[[ Line: 141 ]]
            -- upvalues: v3 (ref), v29 (copy), v9 (ref), l_FilteredScrollingList_0 (ref)
            local l_Theme_0 = v30.Theme;
            local l_Font_0 = v30.Font;
            return v3.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = l_Theme_0.BackgroundDefault.Transparency, 
                BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
                LayoutOrder = v29.props.LayoutOrder, 
                ClipsDescendants = true
            }, {
                layout = v3.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, 12)
                }), 
                selectedMembersBar = v3.createElement(v9, {
                    barBackgroundColor3 = l_Theme_0.BackgroundMuted.Color, 
                    barBackgroundTransparency = l_Theme_0.BackgroundMuted.Transparency, 
                    selectedUsers = v29.props.selectedUsers, 
                    maxSize = v29.props.maxSelections, 
                    LayoutOrder = 1, 
                    renderEntry = v29.renderSelectedMembersBarEntry
                }), 
                friendsListContainer = v3.createElement("Frame", {
                    Size = UDim2.new(1, 0, 1, -99), 
                    BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
                    BackgroundTransparency = l_Theme_0.BackgroundDefault.Transparency, 
                    BorderSizePixel = 0, 
                    LayoutOrder = 2
                }, {
                    friendsList = v3.createElement(l_FilteredScrollingList_0, {
                        searchIconImage = "rbxasset://textures/ui/LuaChatV2/common_search.png", 
                        searchIconColor3 = l_Theme_0.IconDefault.Color, 
                        searchDividerTransparency = 1, 
                        searchDividerHeight = 0, 
                        searchBackgroundColor3 = l_Theme_0.BackgroundMuted.Color, 
                        searchInputTextColor3 = l_Theme_0.TextDefault.Color, 
                        searchInputTextSize = l_Font_0.Body.RelativeSize * l_Font_0.BaseSize, 
                        searchInputTextFont = l_Font_0.Body.Font, 
                        searchPlaceholderText = v29.props.searchFriendsText, 
                        searchPlaceholderTextTransparency = l_Theme_0.TextDefault.Transparency, 
                        searchPlaceholderTextColor3 = l_Theme_0.TextDefault.Color, 
                        searchClearIconColor3 = l_Theme_0.ContextualPrimaryContent.Color, 
                        searchClearIcon = "rbxasset://textures/ui/LuaChat/icons/ic-clear-solid.png", 
                        scrollBarImageTransparency = v30.Theme.UIDefault.Transparency, 
                        scrollBarImageColor3 = v30.Theme.UIDefault.Color, 
                        entries = v29.props.friendEntries, 
                        renderEntry = v29.renderEntry, 
                        entryHeight = v29.props.entryHeight, 
                        sortComparator = v29.props.sortComparator, 
                        filterPredicate = v29.props.filterPredicate, 
                        extraProps = {
                            selectedUserIds = v29.props.selectedUsers, 
                            user = v29.props.user
                        }
                    })
                })
            });
        end);
    end;
    return v15;
end;