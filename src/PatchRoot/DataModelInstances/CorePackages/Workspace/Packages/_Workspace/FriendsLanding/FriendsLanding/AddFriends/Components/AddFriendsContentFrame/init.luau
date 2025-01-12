local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_AddFriends_0 = l_script_FirstAncestor_0.AddFriends;
local v3 = require(l_AddFriends_0.dependencies);
local v4 = require(l_Parent_0.React);
local l_UIBlox_0 = v3.UIBlox;
local l_useStyle_0 = l_UIBlox_0.Core.Style.useStyle;
local l_useSelectionCursor_0 = l_UIBlox_0.App.SelectionImage.useSelectionCursor;
local l_CursorKind_0 = l_UIBlox_0.App.SelectionImage.CursorKind;
local l_GridMetrics_0 = l_UIBlox_0.App.Grid.GridMetrics;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local v11 = require(script.Parent.AddFriendsSectionHeaderFrame);
local v12 = require(script.Parent.AddFriendsGridView);
local v13 = require(script.Parent.AddFriendsEmptyState);
local v14 = require(script.Parent.IgnoreAllFriendsRequestsMenu);
local v15 = require(l_script_FirstAncestor_0.Common.Constants);
local v16 = require(l_script_FirstAncestor_0.Flags.FFlagAddFriendsComponentsTransparent);
local l_TOP_BAR_HEIGHT_0 = v15.TOP_BAR_HEIGHT;
local v18 = l_Images_0["icons/menu/more_on"];
local v19 = l_Images_0["icons/menu/more_off"];
local v20 = {
    itemMargin = 12, 
    getItemMetrics = l_GridMetrics_0.getMediumMetrics, 
    layoutOrder = 1, 
    handleIgnoreAllFriendsRequests = function() --[[ Line: 33 ]]

    end
};
return function(v21) --[[ Line: 66 ]] --[[ Name: AddFriendsContentFrame ]]
    -- upvalues: v20 (copy), v4 (copy), l_TOP_BAR_HEIGHT_0 (ref), l_useStyle_0 (copy), l_useSelectionCursor_0 (copy), l_CursorKind_0 (copy), v18 (copy), v19 (copy), v16 (copy), v11 (copy), v12 (copy), v13 (copy), v14 (copy)
    local v22 = if v21.itemMargin then v21.itemMargin else v20.itemMargin;
    local v23 = if v21.getItemMetrics then v21.getItemMetrics else v20.getItemMetrics;
    local v24 = if v21.layoutOrder then v21.layoutOrder else v20.layoutOrder;
    local v25 = if v21.handleIgnoreAllFriendsRequests then v21.handleIgnoreAllFriendsRequests else v20.handleIgnoreAllFriendsRequests;
    local v26, v27 = v4.useState(false);
    local v29 = v4.useCallback(function() --[[ Line: 76 ]]
        -- upvalues: v27 (copy)
        v27(function(v28) --[[ Line: 77 ]]
            return not v28;
        end);
    end, {});
    local v30 = v4.useCallback(function() --[[ Line: 82 ]]
        -- upvalues: v27 (copy), v25 (copy)
        v27(false);
        v25();
    end, {
        v25
    });
    if v21.showNewAddFriendsPageVariant then
        l_TOP_BAR_HEIGHT_0 = -155;
    end;
    local v31 = if v21.showNewAddFriendsPageVariant then v21.headerFrame and #v21.friends > 0 else v21.headerFrame ~= nil;
    local v32 = l_useStyle_0();
    local v33 = l_useSelectionCursor_0(l_CursorKind_0.Invisible);
    local v34 = if v26 then v18 else v19;
    return v4.createElement("Frame", {
        Size = UDim2.fromScale(1, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        Position = v21.position, 
        BackgroundColor3 = if not v16 then v32.Theme.BackgroundDefault.Color else nil, 
        BackgroundTransparency = v16 and 1 or nil, 
        LayoutOrder = v24, 
        BorderSizePixel = 0
    }, {
        ContentContainer = v4.createElement("Frame", {
            Size = UDim2.fromScale(1, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundColor3 = if not v16 then v32.Theme.BackgroundDefault.Color else nil, 
            BackgroundTransparency = v16 and 1 or nil, 
            BorderSizePixel = 0
        }, {
            Layout = v4.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 0)
            }), 
            HeaderFrame = if v31 then v4.createElement(v11, {
                layoutOrder = 1, 
                title = v21.headerFrame.title, 
                icon = v34, 
                iconVisible = v21.headerFrame.iconVisible, 
                onIconActivated = v29
            }) else nil, 
            ContentView = if #v21.friends > 0 then v4.createElement(v12, {
                items = v21.friends, 
                layoutOrder = 2, 
                windowSize = v21.screenSize, 
                renderAddFriendsTile = v21.renderAddFriendsTile, 
                itemMargin = v22, 
                getItemMetrics = v23
            }) else v4.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, l_TOP_BAR_HEIGHT_0), 
                LayoutOrder = 2, 
                BackgroundTransparency = 1, 
                Selectable = true, 
                SelectionImageObject = v33
            }, {
                EmptyState = if v21.showNewAddFriendsPageVariant then v4.createElement(v13, {
                    screenSize = v21.screenSize, 
                    showNewAddFriendsPageVariant = v21.showNewAddFriendsPageVariant
                }) else v4.createElement(v13)
            }), 
            BottomLoadMoreButton = v21.renderShowMore(3)
        }), 
        IgnoreAllContextMenu = v4.createElement(v14, {
            open = v26, 
            width = UDim.new(0, 300), 
            onIgnoreAll = v30, 
            openPositionY = UDim.new(0, v32.Tokens.Global.Space_600)
        })
    });
end;