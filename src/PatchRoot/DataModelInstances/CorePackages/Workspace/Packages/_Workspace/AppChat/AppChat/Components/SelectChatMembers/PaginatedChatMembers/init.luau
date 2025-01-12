local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.UIBlox);
local l_useStyle_0 = v2.Core.Style.useStyle;
local l_StyledTextLabel_0 = v2.App.Text.StyledTextLabel;
local l_FlatList_0 = require(l_Parent_0.VirtualizedList).FlatList;
return function(v6) --[[ Line: 21 ]] --[[ Name: PaginatedChatMembers ]]
    -- upvalues: l_useStyle_0 (copy), v1 (copy), l_StyledTextLabel_0 (copy), l_FlatList_0 (copy)
    local v7 = l_useStyle_0();
    return v1.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.fromScale(1, 1), 
        BorderSizePixel = 0
    }, {
        uiListLayout = v1.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Vertical, 
            Padding = UDim.new(0, 0)
        }), 
        friendsListHeader = if v6.headerText then v1.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            LayoutOrder = 1
        }, {
            padding = v1.createElement("UIPadding", {
                PaddingBottom = UDim.new(0, 12), 
                PaddingLeft = UDim.new(0, 12), 
                PaddingRight = UDim.new(0, 12)
            }), 
            headerTextLabel = v1.createElement(l_StyledTextLabel_0, {
                fontStyle = v7.Font.Header2, 
                colorStyle = v7.Theme.TextDefault, 
                text = v6.headerText, 
                size = UDim2.new(1, 0, 0, 20)
            })
        }) else nil, 
        scrollingFriendsListContainer = v1.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(1, 1), 
            BorderSizePixel = 0, 
            LayoutOrder = 2
        }, {
            uiFlexItem = v1.createElement("UIFlexItem", {
                FlexMode = Enum.UIFlexMode.Fill
            }), 
            scrollingFriendsList = v1.createElement(l_FlatList_0, {
                style = {
                    ScrollBarThickness = 0, 
                    Name = "PaginatedChatMembers", 
                    BackgroundTransparency = 1
                }, 
                contentContainerStyle = {
                    BackgroundTransparency = 1
                }, 
                renderItem = v6.renderItem, 
                data = v6.data, 
                initialNumToRender = 50, 
                onEndReachedThreshold = 0.8, 
                onEndReached = function() --[[ Line: 87 ]] --[[ Name: onEndReached ]]
                    -- upvalues: v6 (copy)
                    if v6.fetchMoreFriends then
                        v6.fetchMoreFriends();
                    end;
                end, 
                getItemLayout = function(_, v9) --[[ Line: 24 ]]
                    return {
                        length = 48, 
                        offset = 48 * v9, 
                        index = v9
                    };
                end, 
                keyExtractor = function(v10, v11) --[[ Line: 93 ]] --[[ Name: keyExtractor ]]
                    return v10.stable_key or v10.id or v11;
                end
            })
        })
    });
end;