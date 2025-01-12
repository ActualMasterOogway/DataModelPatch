local l_Parent_0 = script:FindFirstAncestor("ProfilePlatform").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.UIBlox);
local l_HorizontalPageMargin_0 = v2.App.Container.HorizontalPageMargin;
local l_ExpandableTextArea_0 = v2.App.Text.ExpandableTextArea;
return function(v5) --[[ Line: 16 ]] --[[ Name: About ]]
    -- upvalues: v1 (copy), l_HorizontalPageMargin_0 (copy), l_ExpandableTextArea_0 (copy)
    return v1.createElement(l_HorizontalPageMargin_0, {
        layoutOrder = v5.layoutOrder, 
        backgroundTransparency = 1, 
        size = UDim2.new(1, 0, 0, 0), 
        useAutomaticSizing = true
    }, {
        Description = v1.createElement(l_ExpandableTextArea_0, {
            Text = v5.description, 
            compactNumberOfLines = 3, 
            padding = Vector2.new(0, 0)
        })
    });
end;