local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.React);
local l_memo_0 = v3.memo;
local v5 = require(l_script_FirstAncestor_0.Components.Cells.IconWithTextCell);
local v6 = {
    Text = "(translated 'add friends' text here)", 
    iconImage = nil, 
    iconSize = 36, 
    iconCellWidth = 60, 
    cellHeight = 64, 
    onActivated = nil, 
    LayoutOrder = 0, 
    style = nil
};
AddFriendsEntry = function(v7) --[[ Line: 32 ]] --[[ Name: AddFriendsEntry ]]
    -- upvalues: v2 (copy), v6 (copy), v3 (copy), v5 (copy)
    local v8 = v2.Dictionary.join(v6, v7);
    return v3.createElement(v5, {
        Size = UDim2.new(1, 0, 0, v8.cellHeight), 
        primaryIcon = v8.iconImage, 
        primaryIconSize = v8.iconSize, 
        iconCellWidth = v8.iconCellWidth, 
        Text = v8.Text, 
        onActivated = v8.onActivated, 
        LayoutOrder = v8.LayoutOrder, 
        style = v8.style
    });
end;
return l_memo_0(AddFriendsEntry);