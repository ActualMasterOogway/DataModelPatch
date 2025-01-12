local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.UIBlox);
local v3 = require(l_Parent_0.UserLib);
local l_getRbxthumbWithTypeSizeAndOptions_0 = v3.Utils.getRbxthumbWithTypeSizeAndOptions;
local l_ItemTile_0 = v2.Tile.ItemTile;
local l_Constants_0 = v3.Utils.Constants;
return function(v7) --[[ Line: 22 ]] --[[ Name: AvatarItemTile ]]
    -- upvalues: l_Constants_0 (copy), l_getRbxthumbWithTypeSizeAndOptions_0 (copy), v1 (copy), l_ItemTile_0 (copy)
    local l_Asset_0 = l_Constants_0.RbxthumbTypes.Asset;
    local v9 = l_getRbxthumbWithTypeSizeAndOptions_0(v7.assetId, l_Asset_0, 150);
    return v1.createElement(l_ItemTile_0, {
        name = v7.name, 
        titleTextLineCount = 3, 
        thumbnail = v9, 
        onActivated = v7.onActivated, 
        useMaxTitleHeight = true
    });
end;