local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameInvite");
local l_Components_0 = l_script_FirstAncestor_0.Components;
local l_Context_0 = l_script_FirstAncestor_0.Context;
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v4 = require(l_Parent_0.FriendsMenu);
local v5 = require(l_Parent_0.React);
local l_DeviceInfo_0 = require(l_Parent_0.NotificationsCommon).DeviceInfo;
local v7 = require(l_Parent_0.RoactUtils);
local l_FriendsMenuFriendsList_0 = v4.FriendsMenuFriendsList;
local l_InviteFriendContext_0 = v4.InviteFriendContext;
local l_FriendsMenuContextWrapper_0 = v4.FriendsMenuContextWrapper;
local l_FriendsMenuSearch_0 = v4.FriendsMenuSearch;
local l_FriendMenuType_0 = v4.FriendMenuType;
local l_GetFFlagEnableFriendMenuMultiSelect_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableFriendMenuMultiSelect;
local v14 = require(l_script_FirstAncestor_0.analytics.GameInviteAnalyticsManager);
local v15 = require(l_Components_0.GameInviteTitle);
local v16 = require(l_Components_0.GameInviteCustomText);
local v17 = require(l_script_FirstAncestor_0.GameInviteConstants);
local v18 = require(l_Context_0.GameInviteModalLayoutContext);
local v19 = require(l_Context_0.GameDetailsContext);
local l_useSelector_0 = v7.Hooks.RoactRodux.useSelector;
local l_GetFFlagEnableCommonFriendsMenu_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableCommonFriendsMenu;
local l_SidePadding_0 = v17.Layout.SidePadding;
local l_TitleHeight_0 = v17.Layout.TitleHeight;
local function v36(_) --[[ Line: 39 ]]
    -- upvalues: v5 (copy), v18 (copy), v19 (copy), l_useSelector_0 (copy), l_DeviceInfo_0 (copy), l_TitleHeight_0 (copy), v15 (copy), l_SidePadding_0 (copy), l_FriendsMenuSearch_0 (copy), v14 (copy), v16 (copy), l_FriendsMenuFriendsList_0 (copy), v17 (copy), l_GetFFlagEnableFriendMenuMultiSelect_0 (copy), l_FriendMenuType_0 (copy)
    local v25 = v5.useContext(v18);
    local v26 = v5.useContext(v19);
    local v28 = l_useSelector_0(function(v27) --[[ Line: 43 ]]
        return v27.TopBar;
    end);
    local v29 = l_DeviceInfo_0.isConsole();
    local v30 = v25.modalMode == "compact";
    local l_promptMessage_0 = v26.promptMessage;
    local v32 = l_promptMessage_0 and #l_promptMessage_0 > 0;
    local v33 = l_TitleHeight_0 + 12;
    local v34 = not v30 and not v29;
    if v34 then
        v33 = v33 + 48;
    end;
    if v32 then
        v33 = v33 + 48;
    end;
    local l_l_TitleHeight_0_0 = l_TitleHeight_0;
    if not v26.isCoreScript and (v28 and v28.statusBarHeight and true or false) and v28 then
        v33 = v33 + v28.statusBarHeight;
        l_l_TitleHeight_0_0 = l_l_TitleHeight_0_0 + v28.statusBarHeight;
    end;
    return v5.createElement("Frame", {
        BorderSizePixel = 0, 
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 1, 0)
    }, {
        UIPadding = v5.createElement("UIPadding", {
            PaddingBottom = UDim.new(0, 8), 
            PaddingTop = UDim.new(0, 8)
        }), 
        UIListLayout = v5.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            Padding = UDim.new(0, 12), 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Top
        }), 
        TitleContainer = v5.createElement("Frame", {
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            LayoutOrder = 0, 
            Size = UDim2.new(1, 0, 0, l_l_TitleHeight_0_0)
        }, {
            GameInviteTitle = v5.createElement(v15, {
                layoutOrder = 0, 
                size = UDim2.new(1, 0, 0, l_TitleHeight_0)
            })
        }), 
        SearchBox = v34 and v5.createElement("Frame", {
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            LayoutOrder = 1, 
            Size = UDim2.new(1, 0, 0, 36)
        }, {
            UIPadding = v5.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, l_SidePadding_0), 
                PaddingRight = UDim.new(0, l_SidePadding_0)
            }), 
            UIListLayout = v5.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                Padding = UDim.new(0, 12), 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Top
            }), 
            FriendsMenuSearch = v5.createElement(l_FriendsMenuSearch_0, {
                layoutOrder = 1, 
                size = UDim2.new(1, 0, 0, 36), 
                focusElement = false, 
                onFocus = function() --[[ Line: 121 ]] --[[ Name: onFocus ]]
                    -- upvalues: v14 (ref)
                    v14:onSearchFocused();
                end
            })
        }) or nil, 
        CustomTextContainer = v32 and v5.createElement(v16, {
            layoutOrder = 2, 
            size = UDim2.new(1, 0, 0, 36), 
            promptMessage = l_promptMessage_0
        }) or nil, 
        FriendsList = v5.createElement(l_FriendsMenuFriendsList_0, {
            layoutOrder = 3, 
            size = UDim2.new(1, 0, 1, -v33), 
            parentComponentName = v17.ParentComponentName, 
            menuType = if l_GetFFlagEnableFriendMenuMultiSelect_0() then l_FriendMenuType_0.SingleSelect else nil
        })
    });
end;
return function(v37) --[[ Line: 140 ]]
    -- upvalues: l_GetFFlagEnableCommonFriendsMenu_0 (copy), v5 (copy), l_InviteFriendContext_0 (copy), l_FriendsMenuContextWrapper_0 (copy), v36 (copy)
    local v38 = if l_GetFFlagEnableCommonFriendsMenu_0() then v5.useContext(l_InviteFriendContext_0) else {
        inviteSingleFriend = function() --[[ Line: 143 ]] --[[ Name: inviteSingleFriend ]]

        end, 
        getMaxRecipientRowNum = function() --[[ Line: 143 ]] --[[ Name: getMaxRecipientRowNum ]]

        end
    };
    if l_GetFFlagEnableCommonFriendsMenu_0() then
        return (v5.createElement(l_FriendsMenuContextWrapper_0, {
            inviteSingleFriend = v38.inviteSingleFriend, 
            inviteMultiFriends = function() --[[ Line: 147 ]] --[[ Name: inviteMultiFriends ]]

            end, 
            isLoadingCustomParams = v37.isLoadingCustomParams
        }, {
            GameInviteContent = v5.createElement(v36, v37)
        }));
    else
        return (v5.createElement(v36, v37));
    end;
end;