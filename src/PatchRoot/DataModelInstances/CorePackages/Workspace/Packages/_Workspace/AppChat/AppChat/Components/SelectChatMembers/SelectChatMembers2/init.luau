local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_createNextOrder_0 = require(l_Parent_0.ReactUtils).createNextOrder;
local v4 = require(l_script_FirstAncestor_0.SocialLibraries);
local v5 = require(l_script_FirstAncestor_0.Components.Common.Frame);
local v6 = require(l_script_FirstAncestor_0.Components.Common.UIListLayout);
local l_useStyle_0 = require(l_Parent_0.UIBlox).Core.Style.useStyle;
local l_List_0 = require(l_Parent_0.Cryo).List;
local l_UserModel_0 = require(l_Parent_0.UserLib).Models.UserModel;
local v10 = require(script.Parent.UserCellWithCheckbox);
local v11 = require(l_script_FirstAncestor_0.Components.Cells.AvatarCircle);
local l_FilteredScrollingList_0 = v4.Components.FilteredScrollingList;
local v13 = require(script.Parent.SelectedMembersBar);
local v14 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatEnableGroupChatSettings);
local function _(v15, v16) --[[ Line: 20 ]] --[[ Name: isUserSelected ]]
    -- upvalues: l_List_0 (copy)
    return l_List_0.findWhere(v15, function(v17) --[[ Line: 21 ]]
        -- upvalues: v16 (copy)
        return v17.id == v16;
    end) ~= nil;
end;
return function(v19) --[[ Line: 55 ]] --[[ Name: SelectChatMembers ]]
    -- upvalues: l_useStyle_0 (copy), l_createNextOrder_0 (copy), v2 (copy), v6 (copy), v11 (copy), l_UserModel_0 (copy), v10 (copy), l_List_0 (copy), v14 (copy), v5 (copy), v13 (copy), l_FilteredScrollingList_0 (copy)
    local v20 = l_useStyle_0();
    local l_Theme_0 = v20.Theme;
    local l_Font_0 = v20.Font;
    local v23 = l_createNextOrder_0();
    local v25 = v2.useCallback(function(v24) --[[ Line: 61 ]]
        -- upvalues: v2 (ref), v6 (ref), v11 (ref), v19 (copy), v20 (copy)
        return v2.createElement("ImageButton", {
            Size = UDim2.fromScale(1, 1), 
            BorderSizePixel = 0
        }, {
            layout = v2.createElement(v6, {
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Top
            }), 
            avatarCircle = v2.createElement(v11, {
                thumbnails = {
                    v24.thumbnail
                }, 
                onActivated = function() --[[ Line: 72 ]] --[[ Name: onActivated ]]
                    -- upvalues: v19 (ref), v24 (copy)
                    v19.onEntryActivated(v24);
                end, 
                circleColor3 = v20.Theme.BackgroundMuted.Color, 
                circleInteriorBackgroundColor3 = v20.Theme.PlaceHolder.Color, 
                circleInteriorBackgroundTransparency = v20.Theme.PlaceHolder.Transparency, 
                presenceImage = v24.presenceImage or "", 
                showNewPresenceImage = true, 
                presenceImageColor3 = v20.Theme.OnlineStatus.Color, 
                presenceImageTransparency = v20.Theme.OnlineStatus.Transparency
            }), 
            displayName = v2.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 0, 15), 
                TextSize = v20.Font.Footer.RelativeSize * v20.Font.BaseSize, 
                TextColor3 = v20.Theme.TextEmphasis.Color, 
                TextTransparency = v20.Theme.TextEmphasis.Transparency, 
                Font = v20.Font.Footer.Font, 
                Text = v24.displayName, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextTruncate = Enum.TextTruncate.AtEnd
            })
        });
    end, {
        v19.onEntryActivated
    });
    local v38 = v2.useCallback(function(v26) --[[ Line: 98 ]]
        -- upvalues: v19 (copy), l_UserModel_0 (ref), v2 (ref), v10 (ref), v20 (copy), l_List_0 (ref)
        local v27 = nil;
        v27 = v19.offlinePresenceText;
        if v26.presence == l_UserModel_0.PresenceType.ONLINE then
            v27 = v19.onlinePresenceText;
        elseif v26.presence == l_UserModel_0.PresenceType.OFFLINE then
            v27 = v19.offlinePresenceText;
        elseif v26.presence == l_UserModel_0.PresenceType.IN_GAME or v26.presence == l_UserModel_0.PresenceType.IN_STUDIO then
            v27 = v26.presenceText;
        end;
        local l_createElement_0 = v2.createElement;
        local v29 = "Folder";
        local v30 = nil;
        local v31 = {
            userIdValue = v19.isDebugEnabled and v2.createElement("StringValue", {
                Value = v26.id
            })
        };
        local l_createElement_1 = v2.createElement;
        local l_v10_0 = v10;
        local v34 = {
            style = v20, 
            user = v26, 
            secondaryTitleText = v26.alias, 
            subTitleText = v27
        };
        local l_selectedUsers_0 = v19.selectedUsers;
        local l_id_0 = v26.id;
        v34.isCheckboxActivated = l_List_0.findWhere(l_selectedUsers_0, function(v37) --[[ Line: 21 ]]
            -- upvalues: l_id_0 (copy)
            return v37.id == l_id_0;
        end) ~= nil;
        v34.onActivated = v19.onEntryActivated;
        v31.userCell = l_createElement_1(l_v10_0, v34);
        return l_createElement_0(v29, v30, v31);
    end, {
        v19.selectedUsers, 
        v19.onEntryActivated, 
        v19.offlinePresenceText, 
        v19.onlinePresenceText, 
        v19.isDebugEnabled
    });
    local v39 = not v14() or v19.shouldShowSelectChatMembersBar;
    local v40 = v39 and 99 or 0;
    return v2.createElement(v5, {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = l_Theme_0.BackgroundDefault.Transparency, 
        BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
        LayoutOrder = v19.layoutOrder, 
        ClipsDescendants = true
    }, {
        layout = v2.createElement(v6, {
            Padding = UDim.new(12, 0)
        }), 
        selectedMembersBar = if v39 then v2.createElement(v13, {
            barBackgroundColor3 = l_Theme_0.BackgroundMuted.Color, 
            barBackgroundTransparency = l_Theme_0.BackgroundMuted.Transparency, 
            selectedUsers = v19.selectedUsers, 
            maxSize = v19.maxSelections, 
            renderEntry = v25, 
            LayoutOrder = v23()
        }) else nil, 
        friendsListContainer = v2.createElement(v5, {
            Size = UDim2.new(1, 0, 1, -v40), 
            BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
            BackgroundTransparency = l_Theme_0.BackgroundDefault.Transparency, 
            LayoutOrder = v23()
        }, {
            friendsList = v2.createElement(l_FilteredScrollingList_0, {
                searchIconImage = "rbxasset://textures/ui/LuaChatV2/common_search.png", 
                searchIconColor3 = l_Theme_0.IconDefault.Color, 
                searchDividerTransparency = 1, 
                searchDividerHeight = 0, 
                searchBackgroundColor3 = l_Theme_0.BackgroundMuted.Color, 
                searchInputTextColor3 = l_Theme_0.TextDefault.Color, 
                searchInputTextSize = l_Font_0.Body.RelativeSize * l_Font_0.BaseSize, 
                searchInputTextFont = l_Font_0.Body.Font, 
                searchPlaceholderText = v19.searchFriendsText, 
                searchPlaceholderTextTransparency = l_Theme_0.TextDefault.Transparency, 
                searchPlaceholderTextColor3 = l_Theme_0.TextDefault.Color, 
                searchClearIconColor3 = l_Theme_0.ContextualPrimaryContent.Color, 
                searchClearIcon = "rbxasset://textures/ui/LuaChat/icons/ic-clear-solid.png", 
                scrollBarImageTransparency = v20.Theme.UIDefault.Transparency, 
                scrollBarImageColor3 = v20.Theme.UIDefault.Color, 
                entries = v19.friendEntries, 
                renderEntry = v38, 
                entryHeight = v19.entryHeight or 48, 
                sortComparator = v19.sortComparator, 
                filterPredicate = v19.filterPredicate, 
                extraProps = {
                    selectedUserIds = v19.selectedUsers, 
                    user = v19.user
                }
            })
        })
    });
end;