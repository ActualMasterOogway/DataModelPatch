local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceSearch");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local v4 = require(l_script_FirstAncestor_0.Components.FlexLayout);
local v5 = require(l_script_FirstAncestor_0.Components.SearchBar);
local v6 = require(l_script_FirstAncestor_0.Components.SuggestedItemList);
local v7 = require(l_script_FirstAncestor_0.Components.SearchEmptyState);
local function v9(v8) --[[ Line: 12 ]] --[[ Name: mapTokens ]]
    return {
        backgroundColor = v8.Semantic.Color.Background.Default.Color3, 
        backgroundTransparency = v8.Semantic.Color.Background.Default.Transparency, 
        itemListPadding = v8.Global.Space_200, 
        searchBarPadding = v8.Global.Space_150, 
        emptyStatePadding = v8.Global.Space_500, 
        spaceBetweenSearchAndList = v8.Global.Space_100
    };
end;
return function(v10) --[[ Line: 41 ]] --[[ Name: SearchLandingPage ]]
    -- upvalues: l_useDesignTokens_0 (copy), v9 (copy), v2 (copy), v4 (copy), v5 (copy), v6 (copy), v7 (copy)
    local v11 = l_useDesignTokens_0(v9);
    local v12 = #v10.items > 0;
    return v2.createElement(v4, {
        BorderSizePixel = 0, 
        BackgroundColor3 = v11.backgroundColor, 
        BackgroundTransparency = v11.backgroundTransparency, 
        Size = UDim2.fromScale(1, 1), 
        AutomaticSize = Enum.AutomaticSize.XY, 
        margin = 0, 
        padding = v10.padding, 
        flexDirection = Enum.FillDirection.Vertical, 
        reverse = true, 
        rigidSlot = v2.createElement("Frame", {
            Size = UDim2.fromScale(1, 0), 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            AutomaticSize = Enum.AutomaticSize.XY, 
            LayoutOrder = 0
        }, {
            SearchBarFramePadding = v2.createElement("UIPadding", {
                PaddingTop = UDim.new(0, v11.searchBarPadding), 
                PaddingBottom = UDim.new(0, v11.searchBarPadding), 
                PaddingLeft = UDim.new(0, v11.searchBarPadding), 
                PaddingRight = UDim.new(0, v11.searchBarPadding)
            }), 
            SearchBar = v2.createElement(v5, {
                showCancelButton = true, 
                autofocus = true, 
                onCancel = v10.onCancelSearch, 
                onClear = v10.onClearSearch, 
                onChange = v10.onChangeSearchQuery, 
                onSubmit = v10.onSubmitSearch, 
                ref = v10.searchBarRef, 
                nextSelectionDown = v10.firstSuggestedItemRef
            })
        }), 
        flexSlot = if v12 then v2.createElement("Frame", {
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            AutomaticSize = Enum.AutomaticSize.XY, 
            Size = UDim2.fromScale(1, 1), 
            LayoutOrder = 1
        }, {
            Padding = v2.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, v11.itemListPadding), 
                PaddingRight = UDim.new(0, v11.itemListPadding)
            }), 
            SuggestedItemList = v2.createElement(v6, {
                items = v10.items, 
                firstSuggestedItemRef = v10.firstSuggestedItemRef, 
                nextSelectionUp = v10.searchBarRef
            })
        }) else if v10.shouldShowEmptyState then v2.createElement("Frame", {
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            AutomaticSize = Enum.AutomaticSize.XY, 
            Size = UDim2.fromScale(1, 0)
        }, {
            EmptyStatePadding = v2.createElement("UIPadding", {
                PaddingTop = UDim.new(0, v11.emptyStatePadding), 
                PaddingLeft = UDim.new(0, v11.emptyStatePadding), 
                PaddingRight = UDim.new(0, v11.emptyStatePadding)
            }), 
            SearchEmptyState = v2.createElement(v7)
        }) else nil
    });
end;