local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsMenu");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_GuiService_0 = game:GetService("GuiService");
local l_Components_0 = l_script_FirstAncestor_0.Components;
local l_Context_0 = l_script_FirstAncestor_0.Context;
local l_Enums_0 = l_script_FirstAncestor_0.Enums;
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v7 = require(l_Parent_0.React);
local v8 = require(l_Parent_0.UIBlox);
local v9 = require(l_Components_0.FriendRow);
local v10 = require(l_Components_0.EmptyFriendsList);
local v11 = require(l_Components_0.FriendsListMsg);
local v12 = require(l_Context_0.FriendsListContext);
local _ = require(l_Enums_0.FriendMenuType);
local _ = require(l_script_FirstAncestor_0.friendsMenuModalType);
local l_VerticalScrollView_0 = v8.App.Container.VerticalScrollView;
local v16 = require(l_script_FirstAncestor_0.Flags.FFlagUpdateInvitesToUsePaginatedFriends);
return function(v17) --[[ Line: 32 ]]
    -- upvalues: v7 (copy), v12 (copy), l_UserInputService_0 (copy), l_GuiService_0 (copy), v9 (copy), v11 (copy), v10 (copy), l_VerticalScrollView_0 (copy), v16 (copy)
    local v18 = v7.useContext(v12);
    local l_friends_0 = v18.friends;
    local l_isFetchingFriends_0 = v18.isFetchingFriends;
    local v21 = l_isFetchingFriends_0 or v18.friendsNames and v18.friendsNames.loading;
    local l_isFriendsListFetchFailed_0 = v18.isFriendsListFetchFailed;
    local l_hasFriends_0 = v18.hasFriends;
    local v24 = v7.useRef(nil);
    local v25, v26 = v7.useState(0);
    v7.useEffect(function() --[[ Line: 43 ]]
        -- upvalues: l_UserInputService_0 (ref), v24 (copy), l_GuiService_0 (ref), v17 (copy)
        if not l_UserInputService_0.GamepadEnabled then
            return;
        else
            local l_current_0 = v24.current;
            local v28 = nil;
            if l_current_0 then
                v28 = l_current_0:FindFirstAncestorOfClass("ScreenGui");
                if v28 and v28.Enabled and l_GuiService_0.SelectedCoreObject == nil then
                    l_GuiService_0:AddSelectionParent(v17.parentComponentName, l_current_0);
                    for _, v30 in ipairs(l_current_0:GetChildren()) do
                        if v30:IsA("ImageButton") and v30.LayoutOrder == 1 then
                            l_GuiService_0.SelectedCoreObject = v30;
                        end;
                    end;
                end;
            end;
            return function() --[[ Line: 63 ]]
                -- upvalues: l_GuiService_0 (ref), v28 (ref), v17 (ref)
                if l_GuiService_0.SelectedCoreObject and v28 and (l_GuiService_0.SelectedCoreObject.Parent == nil or v28:IsAncestorOf(l_GuiService_0.SelectedCoreObject)) then
                    l_GuiService_0.SelectedCoreObject = nil;
                end;
                l_GuiService_0:RemoveSelectionGroup(v17.parentComponentName);
            end;
        end;
    end, {
        v24.current, 
        l_friends_0
    });
    local v34 = v7.useMemo(function() --[[ Line: 81 ]]
        -- upvalues: v7 (ref), l_friends_0 (copy), v9 (ref), l_UserInputService_0 (ref), v17 (copy), l_isFetchingFriends_0 (copy), v21 (copy)
        local v31 = {
            RowListLayout = v7.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Top
            })
        };
        for v32, v33 in ipairs(l_friends_0) do
            v31["User-" .. tostring(v33.id)] = v7.createElement(v9, {
                friend = v33, 
                layoutOrder = v32, 
                isFullRowActivatable = (l_UserInputService_0.GamepadEnabled or v17.isFullRowActivatable) == true, 
                menuType = v17.menuType, 
                sidePadding = v17.sidePadding, 
                backgroundTransparency = v17.backgroundTransparency, 
                isFetchingFriends = l_isFetchingFriends_0, 
                isFetchingFriendsNames = v21
            });
        end;
        return v31;
    end, {
        l_friends_0
    });
    local v35 = nil;
    v35 = if l_isFriendsListFetchFailed_0 then v7.createElement(v11, {
        msgType = "errorFriendsList"
    }) else if l_isFetchingFriends_0 then v34 else if l_hasFriends_0 then if #l_friends_0 > 0 then v34 else v7.createElement(v11, {
        msgType = "noResultFriendsList"
    }) else v7.createElement(v10);
    return v7.createElement(l_VerticalScrollView_0, {
        layoutOrder = v17.layoutOrder, 
        size = v17.size, 
        useAutomaticCanvasSize = true, 
        canvasSizeY = UDim.new(1, 0), 
        selectable = false, 
        scrollingFrameRef = v24, 
        [v7.Change.CanvasPosition] = v16 and function(v36) --[[ Line: 134 ]]
            -- upvalues: v25 (copy), v26 (copy), v18 (copy)
            if v36.CanvasPosition.Y / (v36.AbsoluteCanvasSize.Y - v36.AbsoluteWindowSize.Y) >= 0.8 and v25 < v36.AbsoluteCanvasSize.Y then
                v26(v36.AbsoluteCanvasSize.Y);
                v18.fetchMoreFriends();
            end;
        end or nil
    }, v35);
end;