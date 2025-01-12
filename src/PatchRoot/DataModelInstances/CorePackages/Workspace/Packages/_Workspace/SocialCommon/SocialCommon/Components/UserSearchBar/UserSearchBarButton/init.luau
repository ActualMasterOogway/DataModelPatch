local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialCommon");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local v4 = require(l_Parent_0.RoactUtils);
local v5 = require(l_Parent_0.Localization);
local l_useSelector_0 = v4.Hooks.RoactRodux.useSelector;
local l_useLocalization_0 = v5.Hooks.useLocalization;
local l_ImageSetButton_0 = v3.Core.ImageSet.ImageSetButton;
local l_getPageMargin_0 = v3.App.Container.getPageMargin;
local v10 = require(l_script_FirstAncestor_0.Hooks.useIsWideMode);
local v11 = require(l_script_FirstAncestor_0.Components.UserSearchBar.UserSearchBar);
return function(v12) --[[ Line: 29 ]]
    -- upvalues: v10 (copy), l_useSelector_0 (copy), l_getPageMargin_0 (copy), l_useLocalization_0 (copy), v2 (copy), l_ImageSetButton_0 (copy), v11 (copy)
    local v13 = v10();
    local v15 = l_useSelector_0(function(v14) --[[ Line: 33 ]]
        return v14.ScreenSize;
    end);
    local v16 = l_getPageMargin_0(v15.X);
    local v17 = l_useLocalization_0({
        searchPlaceholderText = "Feature.AddFriends.Label.InputPlaceholder.SearchForPeople"
    });
    return v2.createElement(l_ImageSetButton_0, {
        BackgroundTransparency = 1, 
        Size = if v13 then UDim2.fromOffset(400, 48) else UDim2.new(1, -2 * v16, 0, 48), 
        Position = UDim2.new(0, v16, 0, 0), 
        [v2.Event.Activated] = v12.onActivated
    }, {
        SearchBar = v2.createElement(v11, {
            isDisabled = true, 
            searchPlaceholderText = v17.searchPlaceholderText
        })
    });
end;